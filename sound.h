/* 
 * File:   audio.h
 * Author: gombe
 *
 * Created on 2016/12/02, 20:25
 */

#ifndef SOUND_H
#define	SOUND_H

#ifdef	__cplusplus
extern "C" {
#endif

#include <stdint.h>
#include <stdio.h>
  
#define DTIME 128
#define ONKAI 128
#define LEN 512

#define SIZEOFSOUNDBF 2048
  
extern
unsigned int mtime;

void mktone(unsigned int keyofTone,unsigned int len,unsigned int vel,size_t idx);

typedef struct{
  uint32_t time;
  uint16_t length;
  uint8_t pitch;
  uint8_t vero;
} onpu_t;

extern
onpu_t *humen;

typedef struct{
  int on;
  uint32_t th;
  int len;
  int t;
  int pitch;
  int vero;
  const int8_t *wavtable;
} channel_t;

extern
channel_t ch[];

#ifdef	__cplusplus
}
#endif

#endif	/* SOUND_H */


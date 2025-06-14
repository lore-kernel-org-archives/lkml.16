Received: from pegase1.c-s.fr (pegase1.c-s.fr [93.17.236.30])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 21B462AE99;
	Sat, 14 Jun 2025 06:50:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=93.17.236.30
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749883844; cv=none; b=CW61WRRC+9MXQtcQW9GNmnStLRCc37qpTdaeXrsk99dOV/PI8FrcMUKzpq1UzQvdG41Cu1kqNgWgIQc55FWiHpVsHI6XCaicnsUAMpCDd3+3uPyLR9AeXT3EDF4uhSRBVmucVO5mSccvhR6cXFQOhgYC3QDxMVJForjm6lmk/U8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749883844; c=relaxed/simple;
	bh=RXdRlqrzkHwdspiS3GswJcRBvsVV9K0QQBjOfj7XgxI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=k5dlIDFKy7qbIEV1TV0uc/WZPBM/Ajkkfnk7Yl7WTD0nI9JiaYyXTINQfnL93Hy4PxH/3g+FAIVBlI31k2KaxJ5e17GhYOxw3WkFiL2pQMnwqZDfg//9QuFqFZGh8XVxeu8ylpo4YAlfBjx3XNcIFzEkthlQIe7aSg+Fw16FwQ8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=csgroup.eu; spf=pass smtp.mailfrom=csgroup.eu; arc=none smtp.client-ip=93.17.236.30
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=csgroup.eu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=csgroup.eu
Received: from localhost (mailhub3.si.c-s.fr [192.168.12.233])
	by localhost (Postfix) with ESMTP id 4bK6CG1Fjwz9ssb;
	Sat, 14 Jun 2025 08:42:50 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
	by localhost (pegase1.c-s.fr [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id VlcHCjVCsa-V; Sat, 14 Jun 2025 08:42:50 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
	by pegase1.c-s.fr (Postfix) with ESMTP id 4bK6CF6lkGz9sr6;
	Sat, 14 Jun 2025 08:42:49 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id D4AE78B77B;
	Sat, 14 Jun 2025 08:42:49 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
	by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
	with ESMTP id N9xhgXOKRyuy; Sat, 14 Jun 2025 08:42:49 +0200 (CEST)
Received: from [192.168.235.99] (unknown [192.168.235.99])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id 4723A8B769;
	Sat, 14 Jun 2025 08:42:49 +0200 (CEST)
Message-ID: <941293fc-de40-4143-9a5b-fa262736abee@csgroup.eu>
Date: Sat, 14 Jun 2025 08:42:49 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/4] ALSA: pcm: Convert SNDRV_PCM_IOCTL_SYNC_PTR to
 user_access_begin/user_access_end()
To: Takashi Iwai <tiwai@suse.de>
Cc: Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
 linux-kernel@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
 linux-sound@vger.kernel.org, Herve Codina <herve.codina@bootlin.com>
References: <cover.1749828169.git.christophe.leroy@csgroup.eu>
 <abb97ecdf9af8a9a63b03e59ff7ac338f6ce83f4.1749828169.git.christophe.leroy@csgroup.eu>
 <87msabr3up.wl-tiwai@suse.de>
Content-Language: fr-FR
From: Christophe Leroy <christophe.leroy@csgroup.eu>
In-Reply-To: <87msabr3up.wl-tiwai@suse.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit



Le 13/06/2025 à 18:41, Takashi Iwai a écrit :
> On Fri, 13 Jun 2025 17:37:09 +0200,
> Christophe Leroy wrote:
>>
>> With user access protection (Called SMAP on x86 or KUAP on powerpc)
>> each and every call to get_user() or put_user() performs heavy
>> operations to unlock and lock kernel access to userspace.
>>
>> SNDRV_PCM_IOCTL_SYNC_PTR is a hot path which is called really often
>> and needs to run as fast as possible.
>>
>> To improve performance, perform user accesses by blocks using
>> user_access_begin/user_access_end() and unsafe_get_user()/
>> unsafe_put_user().
>>
>> Before the patch the 9 calls to put_user() at the end of
>> snd_pcm_ioctl_sync_ptr_compat() imply the following set of
>> instructions about 9 times (access_ok - enable user - write - disable
>> user):
>>      0.00 :   c057f858:       3d 20 7f ff     lis     r9,32767
>>      0.29 :   c057f85c:       39 5e 00 14     addi    r10,r30,20
>>      0.77 :   c057f860:       61 29 ff fc     ori     r9,r9,65532
>>      0.32 :   c057f864:       7c 0a 48 40     cmplw   r10,r9
>>      0.36 :   c057f868:       41 a1 fb 58     bgt     c057f3c0 <snd_pcm_ioctl+0xbb0>
>>      0.30 :   c057f86c:       3d 20 dc 00     lis     r9,-9216
>>      1.95 :   c057f870:       7d 3a c3 a6     mtspr   794,r9
>>      0.33 :   c057f874:       92 8a 00 00     stw     r20,0(r10)
>>      0.27 :   c057f878:       3d 20 de 00     lis     r9,-8704
>>      0.28 :   c057f87c:       7d 3a c3 a6     mtspr   794,r9
>> ...
>>
>> A perf profile shows that in total the 9 put_user() represent 36% of
>> the time spent in snd_pcm_ioctl() and about 80 instructions.
>>
>> With this patch everything is done in 13 instructions and represent
>> only 15% of the time spent in snd_pcm_ioctl():
>>
>>      0.57 :   c057f5dc:       3d 20 dc 00     lis     r9,-9216
>>      0.98 :   c057f5e0:       7d 3a c3 a6     mtspr   794,r9
>>      0.16 :   c057f5e4:       92 7f 00 04     stw     r19,4(r31)
>>      0.63 :   c057f5e8:       93 df 00 0c     stw     r30,12(r31)
>>      0.16 :   c057f5ec:       93 9f 00 10     stw     r28,16(r31)
>>      4.95 :   c057f5f0:       92 9f 00 14     stw     r20,20(r31)
>>      0.19 :   c057f5f4:       92 5f 00 18     stw     r18,24(r31)
>>      0.49 :   c057f5f8:       92 bf 00 1c     stw     r21,28(r31)
>>      0.27 :   c057f5fc:       93 7f 00 20     stw     r27,32(r31)
>>      5.88 :   c057f600:       93 36 00 00     stw     r25,0(r22)
>>      0.11 :   c057f604:       93 17 00 00     stw     r24,0(r23)
>>      0.00 :   c057f608:       3d 20 de 00     lis     r9,-8704
>>      0.79 :   c057f60c:       7d 3a c3 a6     mtspr   794,r9
>>
>> Note that here the access_ok() in user_write_access_begin() is skipped
>> because the exact same verification has already been performed at the
>> beginning of the fonction with the call to user_read_access_begin().
>>
>> Signed-off-by: Christophe Leroy <christophe.leroy@csgroup.eu>
> 
> Hm, with this patch, I got a compile warning:
> 
> sound/core/snd-pcm.o: warning: objtool: .altinstr_replacement+0x12: redundant UACCESS disable

Oops. My mistake.

Objtool doesn't check that on powerpc and I only checked build on x86 
and arm64 by cross-compiling pcm_native.o. Should have done a complete 
build.

user_read_access_end() has to be skipped when user_read_access_begin() 
fails. Need to add a second label for that in the macros. Will send an 
updated version of this patch. Have to send the entire series again 
because change to patch 2 conflicts with patch 3.

Christophe

> 
> It's with gcc-13.3.1.
> 
> 
> Takashi
> 
>> ---
>>   sound/core/pcm_native.c | 42 +++++++++++++++++++++++++----------------
>>   1 file changed, 26 insertions(+), 16 deletions(-)
>>
>> diff --git a/sound/core/pcm_native.c b/sound/core/pcm_native.c
>> index 20326aa377b0..fd69eea935b2 100644
>> --- a/sound/core/pcm_native.c
>> +++ b/sound/core/pcm_native.c
>> @@ -3053,30 +3053,40 @@ static inline int snd_pcm_hwsync(struct snd_pcm_substream *substream)
>>   }
>>   
>>   #define snd_pcm_sync_ptr_get_user(__f, __c, __ptr) ({				\
>> -	int __err = 0;								\
>> +	__label__ failed;							\
>> +	int __err = -EFAULT;							\
>>   	typeof(*(__ptr)) __user *__src = (__ptr);					\
>>   										\
>> -	if (get_user(__f, &src->flags) ||					\
>> -	    get_user(__c.appl_ptr, &__src->c.control.appl_ptr) ||		\
>> -	    get_user(__c.avail_min, &__src->c.control.avail_min))		\
>> -		__err = -EFAULT;						\
>> +	if (!user_read_access_begin(__src, sizeof(*__src)))			\
>> +		goto failed;							\
>> +	unsafe_get_user(__f, &__src->flags, failed);				\
>> +	unsafe_get_user(__c.appl_ptr, &__src->c.control.appl_ptr, failed);	\
>> +	unsafe_get_user(__c.avail_min, &__src->c.control.avail_min, failed);	\
>> +	__err = 0;								\
>> +failed:										\
>> +	user_read_access_end();							\
>>   	__err;									\
>>   })
>>   
>>   #define snd_pcm_sync_ptr_put_user(__s, __c, __ptr) ({				\
>> -	int __err = 0;								\
>> +	__label__ failed;							\
>> +	int __err = -EFAULT;							\
>>   	typeof(*(__ptr)) __user *__src = (__ptr);					\
>>   										\
>> -	if (put_user(__s.state, &__src->s.status.state) ||			\
>> -	    put_user(__s.hw_ptr, &__src->s.status.hw_ptr) ||			\
>> -	    put_user(__s.tstamp.tv_sec, &__src->s.status.tstamp_sec) ||		\
>> -	    put_user(__s.tstamp.tv_nsec, &__src->s.status.tstamp_nsec) ||	\
>> -	    put_user(__s.suspended_state, &__src->s.status.suspended_state) ||	\
>> -	    put_user(__s.audio_tstamp.tv_sec, &__src->s.status.audio_tstamp_sec) ||	\
>> -	    put_user(__s.audio_tstamp.tv_nsec, &__src->s.status.audio_tstamp_nsec) ||	\
>> -	    put_user(__c.appl_ptr, &__src->c.control.appl_ptr) ||		\
>> -	    put_user(__c.avail_min, &__src->c.control.avail_min))		\
>> -		__err = -EFAULT;						\
>> +	if (!user_write_access_begin(__src, sizeof(*__src)))			\
>> +		goto failed;							\
>> +	unsafe_put_user(__s.state, &__src->s.status.state, failed);		\
>> +	unsafe_put_user(__s.hw_ptr, &__src->s.status.hw_ptr, failed);		\
>> +	unsafe_put_user(__s.tstamp.tv_sec, &__src->s.status.tstamp_sec, failed);\
>> +	unsafe_put_user(__s.tstamp.tv_nsec, &__src->s.status.tstamp_nsec, failed);		\
>> +	unsafe_put_user(__s.suspended_state, &__src->s.status.suspended_state, failed);		\
>> +	unsafe_put_user(__s.audio_tstamp.tv_sec, &__src->s.status.audio_tstamp_sec, failed);	\
>> +	unsafe_put_user(__s.audio_tstamp.tv_nsec, &__src->s.status.audio_tstamp_nsec, failed);	\
>> +	unsafe_put_user(__c.appl_ptr, &__src->c.control.appl_ptr, failed);	\
>> +	unsafe_put_user(__c.avail_min, &__src->c.control.avail_min, failed);	\
>> +	__err = 0;								\
>> +failed:										\
>> +	user_write_access_end();						\
>>   	__err;									\
>>   })
>>   
>> -- 
>> 2.47.0
>>


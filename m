Received: from pegase1.c-s.fr (pegase1.c-s.fr [93.17.236.30])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0078D223339;
	Thu, 12 Jun 2025 10:50:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=93.17.236.30
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749725438; cv=none; b=nELIOVtEFLyYJpNMcE+ZcycopUM0ENnpSWpP1S/gJctxX5XwzeYzuFMuVbRvY4IrGLE8LvC9pMwzKZvtM69CLVi3lQX+NX1ze2PSQyfnu4IUewbamHKgnDAA0xPvUcGAAbprNd3+4QvkmbBMt5nA5+f5LeOTnZ8haKl5fxR7uwM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749725438; c=relaxed/simple;
	bh=7BSZe8+beUgmypE7JzP+qQZrtF8zpwmQBhHO7r4ycdA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=WTD+Nc6Lw8rDOctbjq24mANu6vvpDB4NE1FVBoKUmMN7vntsRub8QufPTnfw5PUIyXi8VgqbgVHe64c6aY3zWmv8VN97odKxqCPA2rQcnT+7TLX/0pUUl205Ix1AOsbCk9EJzotfiq6UAXQoiZYSh1QyX92HdejEneCqtexxUkQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=csgroup.eu; spf=pass smtp.mailfrom=csgroup.eu; arc=none smtp.client-ip=93.17.236.30
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=csgroup.eu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=csgroup.eu
Received: from localhost (mailhub3.si.c-s.fr [192.168.12.233])
	by localhost (Postfix) with ESMTP id 4bHzXv173dz9v8B;
	Thu, 12 Jun 2025 12:39:11 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
	by localhost (pegase1.c-s.fr [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 745naYi7a1d6; Thu, 12 Jun 2025 12:39:11 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
	by pegase1.c-s.fr (Postfix) with ESMTP id 4bHzXv0K5Wz9thj;
	Thu, 12 Jun 2025 12:39:11 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id 059D18B77B;
	Thu, 12 Jun 2025 12:39:11 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
	by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
	with ESMTP id PjhTgEekJaLp; Thu, 12 Jun 2025 12:39:10 +0200 (CEST)
Received: from [192.168.235.99] (unknown [192.168.235.99])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id 76DD38B769;
	Thu, 12 Jun 2025 12:39:10 +0200 (CEST)
Message-ID: <722831ed-b37c-41e9-ba96-d359883bcb3f@csgroup.eu>
Date: Thu, 12 Jun 2025 12:39:10 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] ALSA: pcm: Convert multiple {get/put}_user to
 user_access_begin/user_access_end()
To: Takashi Iwai <tiwai@suse.de>
Cc: Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
 linux-kernel@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
 linux-sound@vger.kernel.org, Herve Codina <herve.codina@bootlin.com>,
 Mark Brown <broonie@kernel.org>
References: <d2609397eafc2b55ec1f44a3f30ccec00e0c7f6e.1749455639.git.christophe.leroy@csgroup.eu>
 <87zfeh72sz.wl-tiwai@suse.de>
 <6fbbb13e-aedd-47ad-a58b-cc00e9ea138c@csgroup.eu>
 <87frg96uxg.wl-tiwai@suse.de>
Content-Language: fr-FR
From: Christophe Leroy <christophe.leroy@csgroup.eu>
In-Reply-To: <87frg96uxg.wl-tiwai@suse.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit



Le 09/06/2025 à 13:00, Takashi Iwai a écrit :
> On Mon, 09 Jun 2025 12:02:00 +0200,
> Christophe Leroy wrote:
>>
>>
>>
>> Le 09/06/2025 à 10:10, Takashi Iwai a écrit :
>>> On Mon, 09 Jun 2025 10:00:38 +0200,
>>> Christophe Leroy wrote:
>>>>
>>>> With user access protection (Called SMAP on x86 or KUAP on powerpc)
>>>> each and every call to get_user() or put_user() performs heavy
>>>> operations to unlock and lock kernel access to userspace.
>>>>
>>>> To avoid that, perform user accesses by blocks using
>>>> user_access_begin/user_access_end() and unsafe_get_user()/
>>>> unsafe_put_user() and alike.
>>>>
>>>> As an exemple, before the patch the 9 calls to put_user() at the
>>>> end of snd_pcm_ioctl_sync_ptr_compat() imply the following set of
>>>> instructions about 9 times (access_ok - enable user - write - disable
>>>> user):
>>>>       0.00 :   c057f858:       3d 20 7f ff     lis     r9,32767
>>>>       0.29 :   c057f85c:       39 5e 00 14     addi    r10,r30,20
>>>>       0.77 :   c057f860:       61 29 ff fc     ori     r9,r9,65532
>>>>       0.32 :   c057f864:       7c 0a 48 40     cmplw   r10,r9
>>>>       0.36 :   c057f868:       41 a1 fb 58     bgt     c057f3c0 <snd_pcm_ioctl+0xbb0>
>>>>       0.30 :   c057f86c:       3d 20 dc 00     lis     r9,-9216
>>>>       1.95 :   c057f870:       7d 3a c3 a6     mtspr   794,r9
>>>>       0.33 :   c057f874:       92 8a 00 00     stw     r20,0(r10)
>>>>       0.27 :   c057f878:       3d 20 de 00     lis     r9,-8704
>>>>       0.28 :   c057f87c:       7d 3a c3 a6     mtspr   794,r9
>>>> ...
>>>>
>>>> A perf profile shows that in total the 9 put_user() represent 36% of
>>>> the time spent in snd_pcm_ioctl() and about 80 instructions.
>>>>
>>>> With this patch everything is done in 13 instructions and represent
>>>> only 15% of the time spent in snd_pcm_ioctl():
>>>>
>>>>       0.57 :   c057f5dc:       3d 20 dc 00     lis     r9,-9216
>>>>       0.98 :   c057f5e0:       7d 3a c3 a6     mtspr   794,r9
>>>>       0.16 :   c057f5e4:       92 7f 00 04     stw     r19,4(r31)
>>>>       0.63 :   c057f5e8:       93 df 00 0c     stw     r30,12(r31)
>>>>       0.16 :   c057f5ec:       93 9f 00 10     stw     r28,16(r31)
>>>>       4.95 :   c057f5f0:       92 9f 00 14     stw     r20,20(r31)
>>>>       0.19 :   c057f5f4:       92 5f 00 18     stw     r18,24(r31)
>>>>       0.49 :   c057f5f8:       92 bf 00 1c     stw     r21,28(r31)
>>>>       0.27 :   c057f5fc:       93 7f 00 20     stw     r27,32(r31)
>>>>       5.88 :   c057f600:       93 36 00 00     stw     r25,0(r22)
>>>>       0.11 :   c057f604:       93 17 00 00     stw     r24,0(r23)
>>>>       0.00 :   c057f608:       3d 20 de 00     lis     r9,-8704
>>>>       0.79 :   c057f60c:       7d 3a c3 a6     mtspr   794,r9
>>>>
>>>> Note that here the access_ok() in user_write_access_begin() is skipped
>>>> because the exact same verification has already been performed at the
>>>> beginning of the fonction with the call to user_read_access_begin().
>>>>
>>>> A couple more can be converted as well but require
>>>> unsafe_copy_from_user() which is not defined on x86 and arm64, so
>>>> those are left aside for the time being and will be handled in a
>>>> separate patch.
>>>>
>>>> Signed-off-by: Christophe Leroy <christophe.leroy@csgroup.eu>
>>>> ---
>>>> v2: Split out the two hunks using copy_from_user() as unsafe_copy_from_user() is not implemented on x86 and arm64 yet.
>>>
>>> Thanks for the patch.
>>>
>>> The idea looks interesting, but the implementations with
>>> unsafe_get_user() leads to very ugly goto lines, and that's too bad;
>>> it makes the code flow much more difficult to follow.
>>>
>>> I guess that, in most cases this patch tries to cover, we just use
>>> another temporary variable for compat struct, copy fields locally,
>>> then run copy_to_user() in a shot instead.
>>
>> Thanks for looking.
>>
>> I'll give it a try but I think going through a local intermediate will
>> be less performant than direct copy with unsafe_get/put_user().
> 

I have now tried going through a temporary struct and the result is 
awful, even worth than the current implementation, because 
snd_pcm_ioctl_sync_ptr_compat() is not inlined anymore into 
snd_pcm_ioctl(), and the call to copy_from_user() and copy_to_user() 
also show up in the top 10 functions in the perf profile.

> Yes, but the code readability is often more important than minor
> optimizations unless it's in a hot path.

So let's focus on the identified hot path: the SNDRV_PCM_IOCTL_SYNC_PTR 
iotcl.

I will send a patch focussing only on that part. I tweaked it a bit to 
increase readability by nesting the failure labels closer to the 
actions. Let me know whether that patch is more acceptable for you.

In parallel I will send a RFC series that reworks a bit deaper the 
SNDRV_PCM_IOCTL_SYNC_PTR functions with a helper macro, maybe you will 
prefer that allthough the churn is bigger.

Christophe

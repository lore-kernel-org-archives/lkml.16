Received: from pegase1.c-s.fr (pegase1.c-s.fr [93.17.236.30])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7CD381E50E;
	Fri, 13 Jun 2025 13:20:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=93.17.236.30
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749820837; cv=none; b=OK6gnDG0x/sysuMO4NkP27PBZIiFPdn3GS1rMbe7yHESAwYYw8gyzKys3Uuit6Uq/0Gu8XhYq1S5zlEcjl5IjEvXIvinSTyUVdt9FArzC0OcTkCjRknhfDAgmAA148/UaGczcnHP3MT5h1vh3XTbho9boVVj3PdvIvQOENOVlqo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749820837; c=relaxed/simple;
	bh=8ZA2pjmPBOMlITDw8dUanWs9Is45wgO0iG6R2MtrSzU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=c8P+OqfuBoSNDnuZtiKeJMNJqhbdXtFVphrV3g0IEFglsFWmRP5EKUWmm4xwB/ex0e2SB3ZPbxDfrMxvVDQXe2LFUC/pvkHLVzIeDd5EELMDPlYrvlCm8Az6/AFono2QPnDw/rcGFbbWsHOugnqHGEDaCVLvs6L7idJcCIdPLLw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=csgroup.eu; spf=pass smtp.mailfrom=csgroup.eu; arc=none smtp.client-ip=93.17.236.30
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=csgroup.eu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=csgroup.eu
Received: from localhost (mailhub3.si.c-s.fr [192.168.12.233])
	by localhost (Postfix) with ESMTP id 4bJfKg2Cn2z9tHZ;
	Fri, 13 Jun 2025 14:46:47 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
	by localhost (pegase1.c-s.fr [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id cqfwE16bHLFZ; Fri, 13 Jun 2025 14:46:47 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
	by pegase1.c-s.fr (Postfix) with ESMTP id 4bJfKg1Tgbz9tHF;
	Fri, 13 Jun 2025 14:46:47 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id 2DABD8B77B;
	Fri, 13 Jun 2025 14:46:47 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
	by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
	with ESMTP id BdURGYxBYsF6; Fri, 13 Jun 2025 14:46:47 +0200 (CEST)
Received: from [192.168.235.99] (unknown [192.168.235.99])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id B187F8B769;
	Fri, 13 Jun 2025 14:46:46 +0200 (CEST)
Message-ID: <4f2f8e14-22d2-44f1-82cd-5f2a3b5117b1@csgroup.eu>
Date: Fri, 13 Jun 2025 14:46:46 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH 3/3] ALSA: pcm: Convert snd_pcm_sync_ptr() to
 user_access_begin/user_access_end()
To: Takashi Iwai <tiwai@suse.de>
Cc: Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
 linux-kernel@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
 linux-sound@vger.kernel.org, Herve Codina <herve.codina@bootlin.com>,
 Mark Brown <broonie@kernel.org>
References: <7baa34d4046c7750799b11830d38a46f8b581765.1749724478.git.christophe.leroy@csgroup.eu>
 <79b86a0618328ba1d0cb5cf4011fd73ac6900e8f.1749724478.git.christophe.leroy@csgroup.eu>
 <878qlwrnv1.wl-tiwai@suse.de>
 <2df61bbf-76f6-4932-a347-7820350a156e@csgroup.eu>
 <87wm9frf5x.wl-tiwai@suse.de>
Content-Language: fr-FR
From: Christophe Leroy <christophe.leroy@csgroup.eu>
In-Reply-To: <87wm9frf5x.wl-tiwai@suse.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit



Le 13/06/2025 à 14:37, Takashi Iwai a écrit :
> On Fri, 13 Jun 2025 13:03:04 +0200,
> Christophe Leroy wrote:
>>
>>
>>
>> Le 13/06/2025 à 11:29, Takashi Iwai a écrit :
>>> On Thu, 12 Jun 2025 12:51:05 +0200,
>>> Christophe Leroy wrote:
>>>>
>>>> Now that snd_pcm_sync_ptr_get_user() and snd_pcm_sync_ptr_put_user()
>>>> are converted to user_access_begin/user_access_end(),
>>>> snd_pcm_sync_ptr_get_user() is more efficient than a raw get_user()
>>>> followed by a copy_from_user(). And because copy_{to/from}_user() are
>>>> generic functions focussed on transfer of big data blocks to/from user,
>>>> snd_pcm_sync_ptr_put_user() is also more efficient for small amont of
>>>> data.
>>>>
>>>> So use snd_pcm_sync_ptr_get_user() and snd_pcm_sync_ptr_put_user() in
>>>> snd_pcm_sync_ptr() too.
>>>>
>>>> In order to have snd_pcm_mmap_status32 similar to snd_pcm_mmap_status,
>>>> replace to tsamp_{sec/nsec} and audio_tstamp_{sec/nsec} by equivalent
>>>> struct __snd_timespec.
>>>>
>>>> snd_pcm_ioctl_sync_ptr_buggy() is left as it is because the conversion
>>>> wouldn't be straigh-forward do to the workaround it provides.
>>>>
>>>> Signed-off-by: Christophe Leroy <christophe.leroy@csgroup.eu>
>>>
>>> Through a quick glance, all patches look almost fine, but one favor to
>>> ask: this patch contains the convert from s32/s32 pair to struct
>>> __snd_timespec.  It should be factored out to a prerequisite patch
>>> instead of burying in a big change.
>>
>> Shall I understand you prefer this series over the more simple "ALSA:
>> pcm: Convert snd_pcm_ioctl_sync_ptr_{compat/x32} to
>> user_access_begin/user_access_end()" patch ?
> 
> Err, no, sorry for ambiguity.

Then I'm lost.

I sent two alternative proposals:
A/ Single patch, simple, handling only two fonctions 
snd_pcm_ioctl_sync_ptr_{compat/x32} , without refactoring. [1]
B/ This RFC series, more elaborate, refactoring and putting user copy 
into helper macros. [2]

So the question was to be sure you prefer alternative B over alternative 
A. I guess the answer is YES as you asking me improve it.

[1] 
https://patchwork.ozlabs.org/project/linuxppc-dev/patch/8df11af98033e4cb4d9b0f16d6e9d5b69110b036.1749724057.git.christophe.leroy@csgroup.eu/
[2] 
https://patchwork.ozlabs.org/project/linuxppc-dev/list/?state=*&series=460665


> I wanted to move the replacement of tstamp_sec/nsec with struct
> __snd_timespec as a small preliminary patch from patch#3.
> That is,

Yes that's what I understood.

Thanks
Christophe


> --- a/sound/core/pcm_native.c
> +++ b/sound/core/pcm_native.c
> @@ -3103,11 +3103,9 @@ struct snd_pcm_mmap_status32 {
>   	snd_pcm_state_t state;
>   	s32 pad1;
>   	u32 hw_ptr;
> -	s32 tstamp_sec;
> -	s32 tstamp_nsec;
> +	struct __snd_timespec tstamp;
>   	snd_pcm_state_t suspended_state;
> -	s32 audio_tstamp_sec;
> -	s32 audio_tstamp_nsec;
> +	struct __snd_timespec audio_tstamp;
>   } __packed;
> etc.  By factoring this out, it becomes clear that the timespec
> compatibility is fully cared.
> 
> __snd_timespec may be defined in different ways on user-space, but in
> the kernel code, it's a single definition of s32/s32 pair.  This needs
> to be emphasized.
> 
> 
> thanks,
> 
> Takashi


Received: from pegase1.c-s.fr (pegase1.c-s.fr [93.17.236.30])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F07CF2E0B79;
	Fri, 13 Jun 2025 11:20:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=93.17.236.30
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749813635; cv=none; b=LCV9xHHyhnO8XjK+zP6F1fXge9UJXtHuP5yGYXxcQP79EJ4qBdeCF1L8+wDgy4haU986w8FJIURDkmFf+PmOb0/SXgvEs0wjOrpLmmr3XRl1tHX5gowDgts3FtlksN5Iip5onVHN5X/3D6X+LOdrP9xYnZQAnf6jrXfzbQc3OLM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749813635; c=relaxed/simple;
	bh=4ORPoEmUrrRcxmN7XshtQHXsvTt3IceYcN2rLTizFKc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=NhDs5lFfCjBvYINO6nmyBML0Ow5A3cmMvN7bKqE4qa7Of33tbldqTapo0CZkj0a105iN5+mTofg/Dk2DKVNEvryMGML+Y5cDWpZ35jnCtB+nvNiTUUr0RO2BFb73/UZbO5HehZZdx3hs3ugX01TcsbWzqPgD+vbM3PrDQGvgfMs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=csgroup.eu; spf=pass smtp.mailfrom=csgroup.eu; arc=none smtp.client-ip=93.17.236.30
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=csgroup.eu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=csgroup.eu
Received: from localhost (mailhub3.si.c-s.fr [192.168.12.233])
	by localhost (Postfix) with ESMTP id 4bJc2151R8z9sqS;
	Fri, 13 Jun 2025 13:03:05 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
	by localhost (pegase1.c-s.fr [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 2EYXYIC_ssC4; Fri, 13 Jun 2025 13:03:05 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
	by pegase1.c-s.fr (Postfix) with ESMTP id 4bJc214Bzmz9sl0;
	Fri, 13 Jun 2025 13:03:05 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id 8B7A58B77B;
	Fri, 13 Jun 2025 13:03:05 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
	by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
	with ESMTP id Gd6ZZdiQooSp; Fri, 13 Jun 2025 13:03:05 +0200 (CEST)
Received: from [192.168.235.99] (unknown [192.168.235.99])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id 067608B769;
	Fri, 13 Jun 2025 13:03:04 +0200 (CEST)
Message-ID: <2df61bbf-76f6-4932-a347-7820350a156e@csgroup.eu>
Date: Fri, 13 Jun 2025 13:03:04 +0200
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
Content-Language: fr-FR
From: Christophe Leroy <christophe.leroy@csgroup.eu>
In-Reply-To: <878qlwrnv1.wl-tiwai@suse.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit



Le 13/06/2025 à 11:29, Takashi Iwai a écrit :
> On Thu, 12 Jun 2025 12:51:05 +0200,
> Christophe Leroy wrote:
>>
>> Now that snd_pcm_sync_ptr_get_user() and snd_pcm_sync_ptr_put_user()
>> are converted to user_access_begin/user_access_end(),
>> snd_pcm_sync_ptr_get_user() is more efficient than a raw get_user()
>> followed by a copy_from_user(). And because copy_{to/from}_user() are
>> generic functions focussed on transfer of big data blocks to/from user,
>> snd_pcm_sync_ptr_put_user() is also more efficient for small amont of
>> data.
>>
>> So use snd_pcm_sync_ptr_get_user() and snd_pcm_sync_ptr_put_user() in
>> snd_pcm_sync_ptr() too.
>>
>> In order to have snd_pcm_mmap_status32 similar to snd_pcm_mmap_status,
>> replace to tsamp_{sec/nsec} and audio_tstamp_{sec/nsec} by equivalent
>> struct __snd_timespec.
>>
>> snd_pcm_ioctl_sync_ptr_buggy() is left as it is because the conversion
>> wouldn't be straigh-forward do to the workaround it provides.
>>
>> Signed-off-by: Christophe Leroy <christophe.leroy@csgroup.eu>
> 
> Through a quick glance, all patches look almost fine, but one favor to
> ask: this patch contains the convert from s32/s32 pair to struct
> __snd_timespec.  It should be factored out to a prerequisite patch
> instead of burying in a big change.

Shall I understand you prefer this series over the more simple "ALSA: 
pcm: Convert snd_pcm_ioctl_sync_ptr_{compat/x32} to 
user_access_begin/user_access_end()" patch ?

I'm asking because I was myself not sure about the benefit of such two 
big macros over the other proposal in terms of readability.


> 
> I'm asking it because this timepsec definition is very confusing (and
> complex) due to historical reasons, and it should be handled with a
> special care.
> IIUC, struct __snd_timespec is always s32/s32 for the kernel code, so
> the conversion must be fine.  This needs to be commented in the
> commit.


Sure I will do that.

Christophe

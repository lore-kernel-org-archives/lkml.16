Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2BE781F4CAB
	for <linux-kernel@vger.kernel.org>; Sat, 21 Jun 2025 10:52:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.97.179.56
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750503173; cv=none; b=fxn1QUg3sFKIp+oWbTRu1G+nS0kskHjPysxVxXw10OYkF23v95TkoRamcWnoW2wADQIopnvdBtNahnStXDYbjP7DRIVZ2exjuqKyd/1PT7bLOB3o2GRBhZotQal5ZBh2o7BYRhH06P4pNGBhK6FwJ1ktbeDluh1tK4pPr+mMlaI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750503173; c=relaxed/simple;
	bh=AKwnIc8cSuCz6VovUH0CRfxmgFL0EzxZ82hVKavsXWM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=SHeeJ0KVsmGW0zqs/Yxp4fG1olzicARFy0RUDMRickmrPTGTQ7kkWV7qOjhU6oHzmnjxLFwxfe49M6mHt8cqzShruV//D5AoaCl1u1OPLqGbDcl9VhTIuYM63zTfdAT2sx02x0oqWlj/u8ZZUCI/ILlbtPFtQwRIibKOON8tp2I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=igalia.com; spf=pass smtp.mailfrom=igalia.com; dkim=pass (2048-bit key) header.d=igalia.com header.i=@igalia.com header.b=hRUlpGtm; arc=none smtp.client-ip=213.97.179.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=igalia.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=igalia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=igalia.com header.i=@igalia.com header.b="hRUlpGtm"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com;
	s=20170329; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
	References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=jE2ezFWuVO26IHVevRG6r5HpjLUh5Ae1Xsq9fbuJ8aQ=; b=hRUlpGtmi3R/2skdAc4s6Nxn4f
	B4NlC3o5XjALLAhXD014oCKu32bcpQXbmRu8Hy1Z8uPuB1YY7TV9seXdOm5AHbN3Kim0hketea2Iz
	Y89/pdYchLrfdIbpbUtFTXceX+IZunC3u//pQLVTmMG6mVzwYmyJAaxHry+GIlPR0EPjTxv/M7AqC
	L/9TwJAXkfIRmhfpbraKi3rBvH2ef0gg8G9aLeTkOPsXlcV2tfAdxOiH2nQfLwTUpF3UOp7we0IAI
	ufEQkIehTVt9YqkSqEeRtXn2Gzy5HS6NbdIOS5KmdE4FkQwmHzvVSwqBuMK98ZJoqVzOJHdsCkreq
	Gbb9Z79Q==;
Received: from [189.7.87.79] (helo=[192.168.0.7])
	by fanzine2.igalia.com with esmtpsa 
	(Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_128_GCM:128) (Exim)
	id 1uSvpq-006M5p-Fn; Sat, 21 Jun 2025 12:52:34 +0200
Message-ID: <e88d4d36-18e5-4edc-b4ee-59c07e6605a3@igalia.com>
Date: Sat, 21 Jun 2025 07:52:26 -0300
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 2/8] drm/vkms: Add support for ARGB8888 formats
To: Louis Chauvet <louis.chauvet@bootlin.com>,
 Melissa Wen <melissa.srw@gmail.com>, =?UTF-8?Q?Ma=C3=ADra_Canal?=
 <mairacanal@riseup.net>, Haneen Mohammed <hamohammed.sa@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Rodrigo Siqueira <siqueira@igalia.com>,
 Simona Vetter <simona.vetter@ffwll.ch>
Cc: dri-devel@lists.freedesktop.org, arthurgrillo@riseup.net,
 linux-kernel@vger.kernel.org, jeremie.dautheribes@bootlin.com,
 miquel.raynal@bootlin.com, thomas.petazzoni@bootlin.com,
 seanpaul@google.com, nicolejadeyee@google.com
References: <20250530-b4-new-color-formats-v4-0-ef5f9f48376c@bootlin.com>
 <20250530-b4-new-color-formats-v4-2-ef5f9f48376c@bootlin.com>
 <eba688fe-d270-420b-9619-121fb4b8ba1d@igalia.com>
 <115564ae-4b61-47be-9a9d-9c27acd4192c@bootlin.com>
Content-Language: en-US
From: =?UTF-8?Q?Ma=C3=ADra_Canal?= <mcanal@igalia.com>
In-Reply-To: <115564ae-4b61-47be-9a9d-9c27acd4192c@bootlin.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Hi Louis,

On 13/06/25 14:28, Louis Chauvet wrote:
> 
> 
> Le 11/06/2025 à 21:55, Maíra Canal a écrit :
>> Hi Louis,
>>
>> On 5/30/25 11:05, Louis Chauvet wrote:
>>> The formats XRGB8888 and ARGB8888 were already supported.
>>> Add the support for:
>>> - XBGR8888
>>> - RGBX8888
>>> - BGRX8888
>>> - ABGR8888
>>> - RGBA8888
>>> - BGRA8888
>>>
>>> Signed-off-by: Louis Chauvet <louis.chauvet@bootlin.com>
>>> ---
>>
>> [...]
>>
>>> +READ_LINE_ARGB8888(RGBX8888_read_line, px, 0xFF, px[3], px[2], px[1])
>>> +READ_LINE_ARGB8888(BGRX8888_read_line, px, 0xFF, px[1], px[2], px[3])
>>
>> How did you test those two formats? I noticed that IGT (kms_plane tests)
>> doesn't test them.
> 
> Hi Maíra,
> 
> Thanks for your review!
> 
> I wrote this a long time ago, so I don't remember. I was probably greedy 
> and added all the "trivial" formats I was able to do and missed that 
> this format was not tested.
> 
> For this revision, I just started kms_plane to check if it was happy 
> after the rebase, I did not check the formats one by one.
> 
> Do you want me to remove those formats? I think it costs nothing to keep 
> them, especially with the new READ_LINE_ARGB8888 macro, but I will 
> comply if you think we should only merge tested formats.

If we don't have a use-case for those formats and we haven't tested
them, I can't see a compelling reason to keep them. Otherwise, we might
keep untested/unused code around that might stale over time.

Best Regards,
- Maíra

> 
> Thanks,
> Louis Chauvet
> 
>> Best Regards,
>> - Maíra
>>



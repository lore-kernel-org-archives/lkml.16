Received: from mail-io1-f53.google.com (mail-io1-f53.google.com [209.85.166.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 10F802741A1
	for <linux-kernel@vger.kernel.org>; Wed, 23 Apr 2025 20:12:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745439134; cv=none; b=jiMTtqInO4m875UADnE0Iix5fXTW4jadBPd6ejBlzfsNRMfFgoKAnOnl+S2IVNrglAX2qkhDpACUFCif/YYVVHqHBRy754p0jrDwx/4l0NHiikPcQ/RZ4CiS+QEGm+iMyah8bnhckzfKLoGRcLtaPAZ6eiEnr+MKsCW6uz9If/w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745439134; c=relaxed/simple;
	bh=0oI6H3JU7dXC/ESxQwhxoh6QKaSMqhYZPxTmYuOujis=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ffwPzcyJloABseqWPonkTXIe+C0Ng/IBouY8dubKt1TygSUo8IIw8pyMcm9ZB9GubY4Es9FORxIZLmA4Ttv9hU4+A/wwNv4sXkS3tHrN/a+DZy6qjOgdzOTjIPWaomSbNqBLsULWqqcfizay6pmzWreyMQtxpXtLZI+yf3bXT+0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernel.dk; spf=pass smtp.mailfrom=kernel.dk; dkim=pass (2048-bit key) header.d=kernel-dk.20230601.gappssmtp.com header.i=@kernel-dk.20230601.gappssmtp.com header.b=Sx4d+njZ; arc=none smtp.client-ip=209.85.166.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernel.dk
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kernel.dk
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel-dk.20230601.gappssmtp.com header.i=@kernel-dk.20230601.gappssmtp.com header.b="Sx4d+njZ"
Received: by mail-io1-f53.google.com with SMTP id ca18e2360f4ac-85dac9728cdso8913839f.0
        for <linux-kernel@vger.kernel.org>; Wed, 23 Apr 2025 13:12:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernel-dk.20230601.gappssmtp.com; s=20230601; t=1745439132; x=1746043932; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=4GYDwOUZ2pYA1l2ZUcy5ttcsi+e563LieF768X0Rxoc=;
        b=Sx4d+njZD8u0myy2Idfy2VTol9FDgv9JcISNE+jHE6CQueZKiFE+eYfjUA5vhQq071
         2rzgIVtzzDLyobjY6qWZR49nTu5hNvM8TDn8+4yTyJwvygQrnq6gGH55p9cL/fcICEmO
         Up2qdUuFUJSGlmX8EflIKsLZBlixgWYGhzBVB3BdGNDhfk71RgOFob6Hk9/3exrse5up
         XuWE1+i1r2Y6ClPEB2l/ms2irkMltW4wAo38ovXv1gt6CwUqiD/mBZ153RrG9VYw4q15
         ujuA/wIEjrgVOHBlBIN30J5PL+DI+TL3ZV+Mc3p/rwaenGwZtiCXYlbfri6xx4LYoJwa
         lZXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745439132; x=1746043932;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=4GYDwOUZ2pYA1l2ZUcy5ttcsi+e563LieF768X0Rxoc=;
        b=G/gWseteX9ZlZ/fXPokhh/xVtoYL1/UYaT6d6OsPOLc9QNZzTGABqg2XQUgHZmO8vq
         WU64R06vynI274Y+tSEDO6XznavuPo04diOLelZxVi1YQaIDne0QVe32JsbAaik+ut8I
         kXwph4bXNyb8J4Sv3j98oZzgtfmlf619l0zv7FJ2qh8A8fUjnGMcEQSPjJwFVm1qcp5L
         0z4JCa3VqVO7IcXt2iZmKvue1yawTUOqcZUJcUa/4WQ/t2+vON/NaeihyjY0tH3i8vc+
         ZXNvsukpexdmZwlQMEQ8jk2ERuZ6hsqQl/up4F1u3tuFnlLu82IkDsDEQV39XYNL/uYB
         ultA==
X-Forwarded-Encrypted: i=1; AJvYcCXp5IqyL4all8D2qZjdQIe2YcOyd4tyKtwxKcfMuhCajMiP9BmEHAC8P1C3wWfEozTcfg32wH7R9KVMUTY=@vger.kernel.org
X-Gm-Message-State: AOJu0Yza6SRV8osJhAEsjHZC/Zx6Uf/d4RMiOmBy1D5WsY4RXAS8yVjy
	DOblWNwJC2JsjB+lzI2hIWKS/x5Tui7UEIAfhpGU39pFNEeCffKIqO5srCHqBMU=
X-Gm-Gg: ASbGncsohhnEHx2EK1qNhDAvcBBKwoEawY0oD1rrWHf5rjw3z4KVycCrC6eKSrMJjNt
	ifnC3gBT0BqQsMNbhWhqBpqfHhF5oCTuo6l8TXVuPkZ37lz0VjoN/lfdJUDtPS0/yA8idN0VjTn
	iZwLBgcSQ99WRddIQuwKkPG2JxNvAut0OiVhHZ8wEbUTxo6X2jb7cEZJjaZiRqq+Ud2QS3C21rY
	suoc2BBIpgcZO8XEuCUAFgXWHeE91oHff1Jimo+1dfPkGSTiE8zsO0uWvk9IcXGfgrJh8DmQgNa
	ADvDUU4pQDU4abDs6xMvPvs7WbgkTPZgL6w5
X-Google-Smtp-Source: AGHT+IF9vIk8OfA8cuvvqIlQdjlqT8DUNnmqT7ndDWNAzbdPkvhypxwcvV4DAZpmUzsxMViIR4dExA==
X-Received: by 2002:a05:6602:27cf:b0:864:4a9c:1bd7 with SMTP id ca18e2360f4ac-8644f84d864mr37879539f.0.1745439132084;
        Wed, 23 Apr 2025 13:12:12 -0700 (PDT)
Received: from [192.168.1.116] ([96.43.243.2])
        by smtp.gmail.com with ESMTPSA id ca18e2360f4ac-864447402a9sm43361039f.15.2025.04.23.13.12.10
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 23 Apr 2025 13:12:11 -0700 (PDT)
Message-ID: <f57ec419-08ef-4a87-b4ac-fc60c5fd2d3d@kernel.dk>
Date: Wed, 23 Apr 2025 14:12:10 -0600
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] relay: Remove unused relay_late_setup_files
To: Andrew Morton <akpm@linux-foundation.org>, linux@treblig.org
Cc: andriy.shevchenko@linux.intel.com, viro@zeniv.linux.org.uk,
 corbet@lwn.net, linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20250418234932.490863-1-linux@treblig.org>
 <20250420140758.601ae8abaa03aacb33ce7084@linux-foundation.org>
Content-Language: en-US
From: Jens Axboe <axboe@kernel.dk>
In-Reply-To: <20250420140758.601ae8abaa03aacb33ce7084@linux-foundation.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 4/20/25 3:07 PM, Andrew Morton wrote:
> On Sat, 19 Apr 2025 00:49:32 +0100 linux@treblig.org wrote:
> 
>> From: "Dr. David Alan Gilbert" <linux@treblig.org>
>>
>> The last use of relay_late_setup_files() was removed in 2018
>> by commit 2b47733045aa ("drm/i915/guc: Merge log relay file and channel
>> creation")
>>
>> Remove it and the helper it used.
>>
>> relay_late_setup_files() was used for eventually registering
>> 'buffer only' channels.  With it gone, delete the docs that
>> explain how to do that.   Which suggests it should be possible
>> to lose the 'has_base_filename' flags.
>>
>> (Are there any other uses??)
>>
> 
> For some reason get_maintainer points at Al and Andy for relay.c but my
> mental rolodex thinks "Axboe".

Heh, probably because I did dabble in it 20 YEARS AGO as we used it for
the original blktrace! I'm not saying we're both old, but...

> Jens, does this look OK?

Looks fine to me.

Reviewed-by: Jens Axboe <axboe@kernel.dk>

-- 
Jens Axboe

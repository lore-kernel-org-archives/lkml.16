Received: from mail-il1-f173.google.com (mail-il1-f173.google.com [209.85.166.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 42B5A25C6FF
	for <linux-kernel@vger.kernel.org>; Mon, 10 Feb 2025 19:56:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739217371; cv=none; b=eryKIh+1QiPIsJ2vFpysaBQY+4mnxrJ8/YlZmxk4MiSbNxOxqTBXsOiesokD2XLcBnXWMnbx8QqZiTOHk96WZ1cB/8otNa2ijJpFG7m0zXglf2gnkCHWckthMYKCGZGySayHFWpxBYzJ/5HfJkRar8J9uuAlSyohttBLd0+Enls=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739217371; c=relaxed/simple;
	bh=nYZpoqikujNKyqcUO2OjitE+2wI49+wvI2dPwtPCgks=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=uQ0Gewc9ejNTHTQyGR16w8JrT/ez9XYekoITt/8w3s6q2rF3AE7XTTGy9KTgqyXXWUBaEe0PXP3sz6d/rbGPZ9Cj94BQHlNfyXxu082rK4ofgRIJ3kaU/FUgTTNFPKNhP2PngTyNSAoH2gD0qo1PCNNFwEdlZGnrypTCjvD4kRo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernel.dk; spf=pass smtp.mailfrom=kernel.dk; dkim=pass (2048-bit key) header.d=kernel-dk.20230601.gappssmtp.com header.i=@kernel-dk.20230601.gappssmtp.com header.b=LSvZSiTR; arc=none smtp.client-ip=209.85.166.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernel.dk
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kernel.dk
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel-dk.20230601.gappssmtp.com header.i=@kernel-dk.20230601.gappssmtp.com header.b="LSvZSiTR"
Received: by mail-il1-f173.google.com with SMTP id e9e14a558f8ab-3cfc8772469so17477835ab.3
        for <linux-kernel@vger.kernel.org>; Mon, 10 Feb 2025 11:56:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernel-dk.20230601.gappssmtp.com; s=20230601; t=1739217367; x=1739822167; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id:from
         :to:cc:subject:date:message-id:reply-to;
        bh=5NEm5rEuff4/kDsirfJe0fukyC7i+pS+u43CfOxUMdI=;
        b=LSvZSiTRpR1w65F5wisyEd4kKVVXIv0+TtuAIpExI8KVKzuNMlqLxnedDxmuEu8XOW
         O2RvLZdkG9Ezktynrf6CqcWcLMyoGng7t1H7mxgbhBGFU1XQt+sSzTWpwV6Tl9tcQGMr
         fT0bFfJvAPScceqT0/WXu59lw3WRfXrSTp9+5C5MvSHguetas6CWbbXG75Hs5tYefQHd
         P2Eiug/MAD9YeETLgtHQ1Wq1WFU8tjUAJu6qpqFNj26C4g5SzZaCM0DuEGVYR9TmFcMo
         cVFvjAxs1JJyJRkfKiawK7ISAHn1bEK4V8DwCZCk49KwW9Z02FiCZUaqzVJOCqkHpqsP
         mMpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739217367; x=1739822167;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=5NEm5rEuff4/kDsirfJe0fukyC7i+pS+u43CfOxUMdI=;
        b=o0dt5K9N2bbTIldA8t86hIBKxlWxRkCD8O38uUEZEmfbPDb/8/AA1gMjvgNKsjoMFi
         XEHKvAU2tc0qcSxMpwsWTc26Hyo9d4nJY5Q+25oE2jxChMaKeLLGuwC1PqoRUHMwGRGZ
         rcxVBfZaFEe2bGIPpiIPODn7J43LUPaO0TPuLcBVBFjiJUsfQ6ETSjlzCyhxhubwVLO1
         KZGkOWheD2S+s/fFtPIb+3kmDvFRdmyf9MDeNpIeoCoM3W6Q0G5lYwVc8MyU2GSw1pQW
         2vcdKT1QV0oE8mCZe7T9gJ4JJQguzddpHQv0+kAwjaa/I1nSkCV4Fzo8J2M2qFWxhKnY
         930g==
X-Forwarded-Encrypted: i=1; AJvYcCUGnimRw+tjzIM0OzjhTvDi4Iob2r4praxFVEuwM8BYkKN4N5UWPqYyBhEQNRqfsP/bzcMjNdV/6YZH7f0=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw/oBOE4h5vSq40Ab9CrhlO35MPvw4fQrZF72mrXKeuafuT7ywu
	69hAENgnlF81xF4i841G1N4k4l7ftls9i0wNHHyMqSUU4dnZ974sGSR4I3YDQeNylvLgwyPwl4G
	N
X-Gm-Gg: ASbGncs6+bmCL++3m+Sa9fGDRaTkcNNK+Il7jCGayamfeyBEoxtVYvE75LOwFpnXtYK
	KkFBdTvVxr35kJz6Q03UhyruO36sySEwL70rvXouPyfuqq2vYndE0S556nkBWNYJwyufd7mD2KV
	07zJq+GswejPsw/V/TYFdqZqN8E8/XeYWkPynv3t6qfrEjRLG0CJY1GI0yBKnrYe9mkCIsrCPyF
	hzZDpIQdHoSlFhYxquRhZ3puq9crHS9Nfd0bVThRewr/bEsIm6br5RF8dmBgb1FGi2Fu62W1haK
	iFwAcTpXa0+D
X-Google-Smtp-Source: AGHT+IFYsQb1X7xDIwUcY7Rn0ISqFsbjkXOJnIs2v7ckWUdwRj+tfkeBtTDT3bkWOgwlS6RBSQvccg==
X-Received: by 2002:a92:cd8c:0:b0:3d0:134b:6762 with SMTP id e9e14a558f8ab-3d13dd23891mr103098805ab.6.1739217367237;
        Mon, 10 Feb 2025 11:56:07 -0800 (PST)
Received: from [192.168.1.150] ([198.8.77.157])
        by smtp.gmail.com with ESMTPSA id 8926c6da1cb9f-4ecfa215716sm660597173.107.2025.02.10.11.56.06
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 10 Feb 2025 11:56:06 -0800 (PST)
Message-ID: <7e0a6dea-beff-46d7-9fcc-71f141823092@kernel.dk>
Date: Mon, 10 Feb 2025 12:56:05 -0700
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] hrtimers: Make hrtimer_update_function() less expensive
To: Thomas Gleixner <tglx@linutronix.de>, Nam Cao <namcao@linutronix.de>,
 Anna-Maria Behnsen <anna-maria@linutronix.de>,
 Frederic Weisbecker <frederic@kernel.org>, linux-kernel@vger.kernel.org
References: <cover.1738746927.git.namcao@linutronix.de>
 <9b33f490fb1d207d3918ef5e116dc3412ae35c1e.1738746927.git.namcao@linutronix.de>
 <35d4b9be-3d08-4eaa-8750-7b34ec6e6064@kernel.dk> <87y0yjm4hi.ffs@tglx>
 <4f317ca3-0ffd-4ee0-9da6-8b80a6366d0f@kernel.dk> <87h656n3r6.ffs@tglx>
 <ad55978e-4356-494e-8cda-9e6487344768@kernel.dk> <87ikpllali.ffs@tglx>
 <b6f4b197-becb-4150-8986-2c568f7e738c@kernel.dk> <87frkllgq4.ffs@tglx>
Content-Language: en-US
From: Jens Axboe <axboe@kernel.dk>
In-Reply-To: <87frkllgq4.ffs@tglx>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 2/10/25 12:52 PM, Thomas Gleixner wrote:
> On Sat, Feb 08 2025 at 08:18, Jens Axboe wrote:
> 
>> On 2/7/25 2:16 PM, Thomas Gleixner wrote:
>>> The sanity checks in hrtimer_update_function() are expensive for high
>>> frequency usage like in the io/uring code due to locking.
>>>
>>> Hide the sanity checks behind CONFIG_PROVE_LOCKING, which has a decent
>>> chance to be enabled on a regular basis for testing.
>>
>> Looks good to me, thanks Thomas. On my side, I always have a debug run
>> done with PROVE_LOCKING and KASAN, fwiw.
> 
> I assume that with that your objections against the conversion of ioring
> to hrtimer_update_function() is gone too.

Certainly, with the expensive bits under PROVE_LOCKING, I have no
objections to the patch.

-- 
Jens Axboe

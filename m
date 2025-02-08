Received: from mail-il1-f175.google.com (mail-il1-f175.google.com [209.85.166.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE73819995E
	for <linux-kernel@vger.kernel.org>; Sat,  8 Feb 2025 15:18:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739027921; cv=none; b=gDcG2x51RfzYG514nM81ns1Dz+KkXrMuPzbquJJXyijMVZQGSV5NT75I6KcGQ5EdylC4Rpocm5c0rlHAo67hTUQPde6EmdbRGVOK53jxeP0HuRETiFIoekj9ZAkDQTa9nzuAnIs3ihL/+m3oMyFXXdmtctEKmZ1+bNBVI2Tijvc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739027921; c=relaxed/simple;
	bh=xrHjfbEJKOFHT3BdwDREZNc2iZRfFeZnkuDn17y4KdA=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=EOCHu5iEEfc5RL2/pgKvmtLcZh0UIgCAb2Nwf0F0/ZZLHQMljMn028mEEvZsaI3eeel3RefodgsZNIcbLA8crsEse+b0ymZgc+oinS/A9tTKb8nlf4Z/f627nPk+XGYaP+H1j7uieJ5XYb9plnrzBiYYi4bkeL73yOy5HBXTr9s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernel.dk; spf=pass smtp.mailfrom=kernel.dk; dkim=pass (2048-bit key) header.d=kernel-dk.20230601.gappssmtp.com header.i=@kernel-dk.20230601.gappssmtp.com header.b=qQ/1V8cV; arc=none smtp.client-ip=209.85.166.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernel.dk
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kernel.dk
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel-dk.20230601.gappssmtp.com header.i=@kernel-dk.20230601.gappssmtp.com header.b="qQ/1V8cV"
Received: by mail-il1-f175.google.com with SMTP id e9e14a558f8ab-3ce85545983so9077675ab.0
        for <linux-kernel@vger.kernel.org>; Sat, 08 Feb 2025 07:18:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernel-dk.20230601.gappssmtp.com; s=20230601; t=1739027918; x=1739632718; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id:from
         :to:cc:subject:date:message-id:reply-to;
        bh=8ql4eOQhrQcyHQaKYov88/iD6GAWLUGX7HGvelAy0k0=;
        b=qQ/1V8cVdapUFVQowjQDJfu25X73F2X9gRAvn4ZAP0x2odkbhrqi6TP40p2EhWRHNY
         OJwR0E5ASuCGckWJJiV93fx8d4gxQE7QYAgWIvuoXFXYWapWeLAeO0RTh+s7AhYZ2aXr
         n/eIH/SnAuVe//gIj6HZC0rcdsKWLxVL5SFyeeGmyYsY4xVUsK7JVYmKN/YaAH9sJTrL
         0FfRsvDi0dLo8JqWKVTVGsXl8RcRNssyTtXeoyeGzB9Qz3zagD4Rt0KaeWd/GdwbgYXw
         M5hklqCulehkGi2aexgokxRihLp2d/FOUnrRldlGRPU3xDqjjf9Wo4IJNfD+lgdkfUqt
         F5Ug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739027918; x=1739632718;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=8ql4eOQhrQcyHQaKYov88/iD6GAWLUGX7HGvelAy0k0=;
        b=iAvQ9BUwn8FOfg4EqMBGsNUNeUrHbahGX4LuvpoZ02KALHSRbW+kU8GHzwBNVtGkNf
         JuN3St8tXN/u83droW1AgnDs9rul9zvUxAqfkcG6mP3cjhvPHPPLT+WdYaiDibMrAzC6
         SeU085aOg4EaCkUZDPV3X/+TNtqzIG41VIdOLaWvh9DZkeo04IDMs2WvBuET7uS5isMu
         VOJ80RQqFrvkTuEO/xUvsjHqq9+1rxw+2SxOGUxTp+IWDsWc0WeGBPuJz5i8275bvMX9
         lNVmELxDg4hMCs+2K1sQUt2PbYHppmhaMZ737f06080a5fEmr0wu990xldNo/8gZvJow
         WSCg==
X-Forwarded-Encrypted: i=1; AJvYcCX1bsDl7BFkMs6R4J8lNe33uQq81BVTaXFGe5hzPq6nWTpWpxuvzUSbj/igAet4bCWvIKRSHD2zzaO7ebY=@vger.kernel.org
X-Gm-Message-State: AOJu0YwktNUEoy6GEfLNKVGmGFCYhG4HmF8T7rPTghhOhcUkgoRxH9k6
	JAh0zfYDLUR4Pzw/6ixCCnny7S6tEb03W7+7kQKRcsgXvnRWzTvRiCmFv95eJnGvSqzwLY8IaPN
	K
X-Gm-Gg: ASbGncs898Yo3L/pOgSwg53NZPQ5ABkMCOsLp/HnEXdBpDIgGY9IgnPKj/I9VOp5M60
	eFeTBMgcfHxjLYMh390I8qPU6t2+17cRRN2/zn4imbvCwm1pxsOl0xXJFu7A8y6+kLjmeDTiJma
	6dGVwgG6ctpkMxhKWD67giZWIizjJanePW6NVzrSYWWVGa0m0KcLIbAclX8MSOj6k8m6S7gZwF2
	97bDJuDJjbzILbdSW+LTwv8gOVSNqggVQPQ9ueEQbYpgXegfF0gkj8njP11IJT3OgiH1cwocU1a
	ygOShDI03v13
X-Google-Smtp-Source: AGHT+IE2rASaticwX1rLIups1sxlyj5GH4Hu0/iuNe34CzSnbJduXL+KFC6nJ9u6dzLdCiAnBH2ygA==
X-Received: by 2002:a05:6e02:1fc3:b0:3cf:ba90:6ad9 with SMTP id e9e14a558f8ab-3d13e2d98c0mr49258055ab.9.1739027917790;
        Sat, 08 Feb 2025 07:18:37 -0800 (PST)
Received: from [192.168.1.150] ([198.8.77.157])
        by smtp.gmail.com with ESMTPSA id e9e14a558f8ab-3d05e8793b5sm12744385ab.8.2025.02.08.07.18.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 08 Feb 2025 07:18:36 -0800 (PST)
Message-ID: <b6f4b197-becb-4150-8986-2c568f7e738c@kernel.dk>
Date: Sat, 8 Feb 2025 08:18:36 -0700
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
Content-Language: en-US
From: Jens Axboe <axboe@kernel.dk>
In-Reply-To: <87ikpllali.ffs@tglx>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 2/7/25 2:16 PM, Thomas Gleixner wrote:
> The sanity checks in hrtimer_update_function() are expensive for high
> frequency usage like in the io/uring code due to locking.
> 
> Hide the sanity checks behind CONFIG_PROVE_LOCKING, which has a decent
> chance to be enabled on a regular basis for testing.

Looks good to me, thanks Thomas. On my side, I always have a debug run
done with PROVE_LOCKING and KASAN, fwiw.

-- 
Jens Axboe

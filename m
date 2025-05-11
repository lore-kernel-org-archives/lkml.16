Received: from mail-il1-f179.google.com (mail-il1-f179.google.com [209.85.166.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E41481F92E
	for <linux-kernel@vger.kernel.org>; Sun, 11 May 2025 14:38:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746974285; cv=none; b=iAYMWkOVWA003p8Rb80IhhNbmqNLxbA8bSWDraSVNc7eBVSk6tcI7HYje3MOB74RIw6/5QowE2e8NobImpEadZON4Ysoo0UFzBCjG84KqW4+hfr4o9zdewb+b/d0OLyK6oks9xDzArkN/cvfoDsLhzVM+o6RpdQlISEgDF6H8JM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746974285; c=relaxed/simple;
	bh=8bl3KG/FnieTFJPm8izZLh/ssk/QFseWAgjoneCWP74=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=UHA2WMOqELFXFuLMn5hnoYAYC/I/VOsMmXFT7dsEmtMX2n+QpSJ+/p+8VaJ6Csfqqd07Ne7x4mdeTVHH1Dj4r/pbfJvxCmr/r2pP25YFseBWNkk+KbZctQwxn5x7e/yzRCUub27QuiiV4jOYPztuNRIecvZSMZerUbi+Bqea5Vw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernel.dk; spf=pass smtp.mailfrom=kernel.dk; dkim=pass (2048-bit key) header.d=kernel-dk.20230601.gappssmtp.com header.i=@kernel-dk.20230601.gappssmtp.com header.b=0E9AawhQ; arc=none smtp.client-ip=209.85.166.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernel.dk
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kernel.dk
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel-dk.20230601.gappssmtp.com header.i=@kernel-dk.20230601.gappssmtp.com header.b="0E9AawhQ"
Received: by mail-il1-f179.google.com with SMTP id e9e14a558f8ab-3d90208e922so17239505ab.3
        for <linux-kernel@vger.kernel.org>; Sun, 11 May 2025 07:38:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernel-dk.20230601.gappssmtp.com; s=20230601; t=1746974282; x=1747579082; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id:from
         :to:cc:subject:date:message-id:reply-to;
        bh=gLvNwccVZ0cYmbj7WRvgYRBYA8Okxhxyw1Lm5uIekF0=;
        b=0E9AawhQi2Z8MqK6MxEDR07yBjccjxZq/J+5HeHYVGByZfjM+EvQ2zZuscBS8XmdJN
         +gXXjlwuyPSEuh8puSPj8tVAI5R6VwqiBxvDjKyCFyjuc8SdgZYBpFnM9mV5oCyBqaKH
         7wJaskaUjVkCUcty5B3Hl4TBnIY8P99Jy0cxapeLsf5XAg3QPB8130iH1z0tnvefHoHo
         sK8Ek5HneMxfgHupGBqmsWXa6KNEECtqsQilVNftYbCYNCF2GcLOYLostY7jFMgbr4sN
         H/Ef4h936ZpIHiZemSi5gSs8xJixHU1TD2wzSpEaq/e0IXJrGItGkzDXk7nJCqIn1i9z
         eR/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746974282; x=1747579082;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=gLvNwccVZ0cYmbj7WRvgYRBYA8Okxhxyw1Lm5uIekF0=;
        b=sGYKRZwy8LWGx7sSFjH0vDXOW7FGPJvYjEYMvpHBd+n3oZU4BhfHCfxtZb6LC22t4M
         VF5AOvRfqIeRaXA9172Hc/voQmq/s5mlgT1A9GScKFH7gi6+3Qnuajbwr00AxDZRVRit
         eDz2sXe3xzd2R0i9VadGLbbzG5rkSPLKca20mqxqbmN7i1QPG6muRuC7FIpbbAGhkC3l
         9CksfGrlr2iqrKgaPe8RLfdApbKGGtBCTWRE+C0gMM7Ub40UnPcVvpluyT1rSkuLMzsK
         PwZl6QL2gRZYIxTWbvdocuwHwMRRZS4X0Y5HDnTuDZTifyVplr+bNLFKz7S6wuAkaN5W
         HR6Q==
X-Forwarded-Encrypted: i=1; AJvYcCWmcSLclUbFd/NFqq4y468CtfgwHoLBhbFwCRIEWRfYTCp2bcjgbF7qZ95+ODwtHq93iMdJ90zm4KIRUXE=@vger.kernel.org
X-Gm-Message-State: AOJu0YycUtOBXhXFFkEJKn0Kb6KioI60UZcZ4MptRjMcMplXLe1y0G3S
	uayBdMdQD3IjZUtaNSE4AKttK9epWzHPTQnCj6Ad0WN5vHjxs7KcdVD38waBBSU=
X-Gm-Gg: ASbGncu84XRjZXIg9PF28Hm8LpfygJ7gOuQKgpi1XAUiX43Q29YHpMaZMLuqW7zalsI
	2OMAf8kfztue2dg3XKrr4nyY0fklgAulteGyRcBctXmQQcvW0HVDMgzjOU2cEgncf5OMnEu91i0
	7TpVdzvrtn7gzXFxnNInSGaMRaWcT5Bne9FhbsOuG4RNHZDoBHNrROGJx236bwyEooc1OCyFotC
	+b2DtnnZ2jOsK32fBPjjlqifjfSa2Dhvjrakbnzk1kuTpDKd+5NaHLBdHkDBK8Af/Xd5IMspMaJ
	WcfevTaNjimVAxAeuJOfM7StSGEeWXPD1n9VBr0W3p7iq2fN
X-Google-Smtp-Source: AGHT+IFmI8KNYL+OA7GhNF+oltU2v5+lz8V4cUzVkwfC6r+xMTSFtJT62p8l95UKs8xmv8rLtYxHjw==
X-Received: by 2002:a92:cda7:0:b0:3d9:66c7:d1e8 with SMTP id e9e14a558f8ab-3da7e165314mr112425165ab.0.1746974281771;
        Sun, 11 May 2025 07:38:01 -0700 (PDT)
Received: from [192.168.1.150] ([198.8.77.157])
        by smtp.gmail.com with ESMTPSA id e9e14a558f8ab-3da7e159bdbsm17947385ab.44.2025.05.11.07.38.00
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 11 May 2025 07:38:00 -0700 (PDT)
Message-ID: <30676ba5-a901-4789-be07-224108ab66e6@kernel.dk>
Date: Sun, 11 May 2025 08:37:59 -0600
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [syzbot] [io-uring?] [usb?] BUG: unable to handle kernel NULL
 pointer dereference in module_kobj_release
To: syzbot <syzbot+3ea73421f5aa3f339e9e@syzkaller.appspotmail.com>,
 asml.silence@gmail.com, io-uring@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org,
 syzkaller-bugs@googlegroups.com
References: <682074be.050a0220.f2294.002c.GAE@google.com>
Content-Language: en-US
From: Jens Axboe <axboe@kernel.dk>
In-Reply-To: <682074be.050a0220.f2294.002c.GAE@google.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

#syz set subsystems: usb

-- 
Jens Axboe


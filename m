Received: from mail-il1-f175.google.com (mail-il1-f175.google.com [209.85.166.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 555A11E1DE9
	for <linux-kernel@vger.kernel.org>; Fri,  4 Apr 2025 22:29:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743805789; cv=none; b=V3a/k8JWhwRWPOVdJM46pug5vOV2m9WZf4oZQmc61XJnxKWQ+0//OiNAoHrQkC2X0wJnKsEIpAXhDNjhQWQm7W86oQ6aHt6lVldqVVCYbiLMjGh3F0B5uecvnOgvL3cl7hHB5N/m9KpAKw2BiWzLO+gAMaAwf+LyQHoXx62VzPU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743805789; c=relaxed/simple;
	bh=NmHFPxslfg0WBqi0kIWYsQah2KUantxPzippnzuHLhA=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=ndr8PYbX+KvU7fFh6hpojnPSFLmqT2fkPC4eyQKRYTiD9J3XnF42Hu92ESPHOQ0X+5Q04WTgBQxzCq06IBHlaDy0Bx7FXYxm0BoEpcumDJdoB8lH/A1ubS3nToqn+uH8J8LX9KITXpeJZ2RzUXo2bWVgughVnMZqFP+P9X3SC4g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernel.dk; spf=pass smtp.mailfrom=kernel.dk; dkim=pass (2048-bit key) header.d=kernel-dk.20230601.gappssmtp.com header.i=@kernel-dk.20230601.gappssmtp.com header.b=jlVLBt48; arc=none smtp.client-ip=209.85.166.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernel.dk
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kernel.dk
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel-dk.20230601.gappssmtp.com header.i=@kernel-dk.20230601.gappssmtp.com header.b="jlVLBt48"
Received: by mail-il1-f175.google.com with SMTP id e9e14a558f8ab-3cda56e1dffso12602525ab.1
        for <linux-kernel@vger.kernel.org>; Fri, 04 Apr 2025 15:29:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernel-dk.20230601.gappssmtp.com; s=20230601; t=1743805786; x=1744410586; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:subject:from:user-agent:mime-version:date:message-id:from:to
         :cc:subject:date:message-id:reply-to;
        bh=X2+rBhFrK00h+ijJXPzvBEmgahY//panNVZB95538Xg=;
        b=jlVLBt48N5Ox5THVj7Dw0HXSa9Fuhw4h9+FGupAISLrxVILJSiHTYfcSwcovShAyuJ
         xkkhN8EzZc4bK4gbZyW3X9X6Hq/aHbqfhbbmBVhfkN72WnTch9d+TTEhYqTZOAUyoHRb
         LmeuZkU35hfdx1GfIDnfUEVy0EDw5HWkoL2tX8EyhRDloNZ7+UtU5Qi/K5NEm1LkMMxj
         qUovMMNzPix2ZrRzdNlxsdhJuLpDJw708dT/7PJLZwakXWqAuzUF/XYvzbXrsqW5Qikn
         rgE1aweZKsxaf6lcWGU/hCXuZ3u/J2dfqz1ZdvZ9vtqgYdLZepnyzf0eZrIXjMfVIyB/
         G5tw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743805786; x=1744410586;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:subject:from:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=X2+rBhFrK00h+ijJXPzvBEmgahY//panNVZB95538Xg=;
        b=gZolMjQ8Fc1czQ0CpA935KKWeAgxcvAcEwMVqBaOWUFfTvE5vPH7pg/U7bNtRSotkU
         w8eR2iz1l7P5Y27Ewcu5q/5GgJAwwCF3+nOeMEP7t3uAeo6hKne4Pz8IwHx3S6WIWYIv
         bUwFCBcWsJ41/s2uyWdYxJ0lILJY9jk9PN9QAoKytGPe2Vvx4i6/fPPDLSKYuzJ164wO
         aJHhy0oiXuwWgEtXBfrTwn/ZiuLZL98+MVdghsqCOI17HIpdyQPn61TVmLvBT08xCUnA
         NCINzuFxkGi+JWa5BYNkwJyB5EBad28DHzKmlWjTrr7nyuPS6JII5o/lShr2Dz9L/9UE
         Ykkg==
X-Forwarded-Encrypted: i=1; AJvYcCWNUOFpJZSxW3ZI02tpoXgMjsw0H2kfjICgPyRUNBR88SV7K1D15Xi1krxP1hLIuozGbhlitkjGme+6paI=@vger.kernel.org
X-Gm-Message-State: AOJu0Yzn6X4p/pksCSliKiPGzd7QpFd7GL87IHHbKVcCt0RoECd7dPA5
	rIPVzAzYyXkFdmYpSjgIS6h2F/j1HPwuBW3y/OnBi5ruia9g35z+HFBdDnLRd+0=
X-Gm-Gg: ASbGncttowMpTgohlCG9090bxAtn3hH5DiYtYMXzzeU0jS3qlCb32xyG91YKI/k62vG
	OXMSW8L+dm1tiFPyWTFeZRuiIaVPcVc9CW+t1YMpcc30QfL32bbvys6M5oAFWO9dpZfKsXPrGON
	AARWl3l9rxDEDT+juGYgIkuZSjiOD+b+JsLr2KpoaYkPKSctUos3yOCT5Mfkxc68xBpyWeUu4Jj
	/mKF7enO5+6V0wNpdRzftd5GrnKCfUP0JjtvRik2zxo01NexSb9AJpcCXIjjyziUfpj4TEjPxVn
	Vhbc7O3qCNV55W/sEKG+WYZfa0YsymoGZpAUj+6XJw==
X-Google-Smtp-Source: AGHT+IFEdAwRfc0UX+JXaYJNbcrDKSXDiE0ZmU7jYIj1mI0qDtgXapwG2cndU6ey8QrKP9T048JSFA==
X-Received: by 2002:a05:6602:4c82:b0:85b:476e:ede2 with SMTP id ca18e2360f4ac-8611b5788f3mr531756939f.13.1743805786473;
        Fri, 04 Apr 2025 15:29:46 -0700 (PDT)
Received: from [192.168.1.150] ([198.8.77.157])
        by smtp.gmail.com with ESMTPSA id 8926c6da1cb9f-4f4b5c497besm1038305173.38.2025.04.04.15.29.45
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 04 Apr 2025 15:29:45 -0700 (PDT)
Message-ID: <078b3edf-aa34-452d-aa2b-244119f76ace@kernel.dk>
Date: Fri, 4 Apr 2025 16:29:45 -0600
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Jens Axboe <axboe@kernel.dk>
Subject: Re: [syzbot] [v9fs?] BUG: stack guard page was hit in io_wq_worker
To: syzbot <syzbot+6f691675b0810bf591ec@syzkaller.appspotmail.com>
Cc: akpm@linux-foundation.org, asmadeus@codewreck.org, ericvh@kernel.org,
 linux-kernel@vger.kernel.org, linux-mm@kvack.org, lucho@ionkov.net,
 syzkaller-bugs@googlegroups.com, v9fs@lists.linux.dev
References: <6782e97a.050a0220.d0267.004b.GAE@google.com>
Content-Language: en-US
In-Reply-To: <6782e97a.050a0220.d0267.004b.GAE@google.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

#syz set subsystems: netfs

I believe this one is long fixed, though.

-- 
Jens Axboe


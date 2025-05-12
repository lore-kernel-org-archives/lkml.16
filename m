Received: from mail-io1-f42.google.com (mail-io1-f42.google.com [209.85.166.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 699A6290BC2
	for <linux-kernel@vger.kernel.org>; Mon, 12 May 2025 13:27:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747056476; cv=none; b=kIHElfVJEV1A1EdAQx6W6n+QsdBf4zXawKtiqJ1KWIoZriESqM2aq3Q3tgKIf3erdb2h3SuzXr5ZRXDHrVLwFbeXc9xSzpfZ908VWb7zL8L1fBi3WGuskAeatZ9QY0OES2EHLJZdyikxxy1QEKqfPh2G3Jb6D1L4WjUES+whyVc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747056476; c=relaxed/simple;
	bh=DVdODhlsrP1j5tCIx/PMlgifWBofH/BtMfVaxUqYkxg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=S02uUZRK7pdOCb+KvLPtZBqfexhLWyTTwrfssix1yvGFTCnyiUVjwJO/gEzIpzRHH3gdp+6iPD4Eowx5/6epHVXjgrZFkhy6bMJEVhyhSBLj0bJBWzF+o8LqgFxXIP770GHxgFWGdZ72CJXfa4TfmBCGk9hPExP9xbta2c8yyOs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernel.dk; spf=pass smtp.mailfrom=kernel.dk; dkim=pass (2048-bit key) header.d=kernel-dk.20230601.gappssmtp.com header.i=@kernel-dk.20230601.gappssmtp.com header.b=hpaqU1fe; arc=none smtp.client-ip=209.85.166.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernel.dk
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kernel.dk
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel-dk.20230601.gappssmtp.com header.i=@kernel-dk.20230601.gappssmtp.com header.b="hpaqU1fe"
Received: by mail-io1-f42.google.com with SMTP id ca18e2360f4ac-8647e143f28so414705539f.1
        for <linux-kernel@vger.kernel.org>; Mon, 12 May 2025 06:27:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernel-dk.20230601.gappssmtp.com; s=20230601; t=1747056472; x=1747661272; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=L9IoB62TXP9uOxncdM6rXekXVF+y8UVR94EHCzJIMOw=;
        b=hpaqU1fesSUfIOuetYfKZXAyAJzXsfgpMwOiO4XNXyL7wpTSD9nW7U3SgeIV90ut6c
         ydU2WiQGwljSfQXlL0uM1zUIaGg2l68kdu4U8mLYhmGZ46VRSBw1Knu/nRPEx85+flzq
         RriMyuuBu5ih68IMovaLimNeKVkJQsdGCzxJiCVptFU23yVM+mt2rEmxggKgE1VVF+ww
         Vq5/OIGEHfuGU7RzMJE7vo8CWWMKFBIfbmTg5h4VjVUxNWnZAaaZU+4kHXdkuh4JpSye
         IA7XakvAh40ZbQ+82teo/RzpEGalMhY8vsfVFtKCLE7QWRY8OIUbt2GJ7JgK6Xhmv/5q
         2btQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747056472; x=1747661272;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=L9IoB62TXP9uOxncdM6rXekXVF+y8UVR94EHCzJIMOw=;
        b=VPHCQPARAPmWzkIUK8DjMP+T/cIst11j/mizKRaYCZH+PbybbkqQN4XQHi5BztlZfE
         mzbwO/fnzqZpUFhKTUj7rhfirFkbXbW6g15zMfXPynfU2mF2uRaRztTykyD+UogC6d3/
         3Zw3KsSltdBvjQDucX4u0ybdsqo6iIkGfZqoncfzVbMj514gO6i9wk+O/YjIkUqlT0px
         m/7X62vQuAcjB/I/xhylafupk33YVryTqsDt/sYOs/bvTRZk/myhRV8miTKnAV9o0/BT
         RlF//QpuxNwZx+y+71yqD+uDAtAE5jeAakZLgdASUzAaOC3jP3pEGX4FNxwHFKiHRnm9
         /CVw==
X-Forwarded-Encrypted: i=1; AJvYcCXrt9pfNIiJQGdrYQc4a6CNC77HHLlLOL+BnpXCbU74iKE/KCn/IZkmj1tQecuIA5jqlRMi8RrU5/kVPFA=@vger.kernel.org
X-Gm-Message-State: AOJu0YzZbVE1aY6I714nBHxpWJpoXBd2mn7xezuXcnnHrm6ahWI4ifN0
	c1BtPe5uyF8tUPm40nqt1WhB0PCVB4F72h2cPsErVvcbUEvlezjD/hVQJzITwr4=
X-Gm-Gg: ASbGncvdAVudJhkyarbNZNQP9ZhABkjGucOynZBVTgZ+rIJreBdTbYbZo5QRuKVdMIB
	fK55H+yi5HnmDO7MY2nBxv3501FyGR3qKaAK0Uzw6Jv9cD0Qtwf81MDN8NuHb+dV2s66lYS4Ziz
	9G4m4tBRhxo2vl9O8iLGJnsAPL2wWbbfRQ94+MJMGaGdDOv9BFXKjl102warOPxqOO60wDySGSl
	FOd8q20sA7oC+mVUdVv2ZPDOUT10ZkkxD4RR11xFM3eYujCleYDTzlEAlS1gR0BwYxIX8w8T0Wb
	2KLaQOtklydEroD/UWi0U+aerbY1VVYS5M3E2unTP3WXpjXGcN/AvlXjSQ==
X-Google-Smtp-Source: AGHT+IHdEysy2QMA5bYJRCGHWcU+SDeS600uChzxsGK4c07DtztUFdTHFIRsMuLF3zs5A/3H+h+iEw==
X-Received: by 2002:a05:6e02:3185:b0:3d9:3a09:415e with SMTP id e9e14a558f8ab-3da7e211974mr161985485ab.19.1747056472429;
        Mon, 12 May 2025 06:27:52 -0700 (PDT)
Received: from [192.168.1.116] ([96.43.243.2])
        by smtp.gmail.com with ESMTPSA id 8926c6da1cb9f-4fa2ec25bccsm1330788173.90.2025.05.12.06.27.51
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 12 May 2025 06:27:51 -0700 (PDT)
Message-ID: <4a0548f8-02aa-4aab-a81b-2399c5393776@kernel.dk>
Date: Mon, 12 May 2025 07:27:51 -0600
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] relay: Remove unused relay_late_setup_files
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Jason Xing <kerneljasonxing@gmail.com>
Cc: Andrew Morton <akpm@linux-foundation.org>, corbet@lwn.net,
 linux-doc@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>,
 linux@treblig.org, viro@zeniv.linux.org.uk
References: <CAL+tcoCVjihJc=exL4hJDaLFr=CrMx=2JgYO_F_m12-LP9Lc-A@mail.gmail.com>
 <aCGR4EOcWRK6Rgfv@smile.fi.intel.com>
 <CAL+tcoDYOwmt+MqUouc=7DCpMyR3HfOhycgruX_n3+eKJxqv9Q@mail.gmail.com>
 <aCGhXcuqBDuceCqk@smile.fi.intel.com>
Content-Language: en-US
From: Jens Axboe <axboe@kernel.dk>
In-Reply-To: <aCGhXcuqBDuceCqk@smile.fi.intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 5/12/25 1:21 AM, Andy Shevchenko wrote:
> Then provide a roadmap on the upstreaming the necessary parts. Otherwise
> there is no room for a dead code in the Linux kernel. This is the rule:
> we do not add one, and we do not leave it dangling after removing the last
> user.

I don't pay a lot of attention to "roadmaps" - if the code is unused in
the kernel, it should go. Once other codes goes upstream that needs it,
it can get added back as a prep patch. Way too many times I've seen
promises and roadmaps for things that never materialize, and then the
code lingers for years before it's finally deleted.

So I'd say kill it with fire, bring it back if/when needed.

-- 
Jens Axboe

Received: from mail-io1-f42.google.com (mail-io1-f42.google.com [209.85.166.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 391A615ECD7
	for <linux-kernel@vger.kernel.org>; Sun,  2 Feb 2025 15:05:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738508716; cv=none; b=Iru4q5HWKjT0/Tv2aCyefv8qZGiM8/BLU0/r9xkmzBuFrE2UdhC1y/9Lie2v3ZI+vFKMygd9R3eaVwMaKTNWDc4OzR+R7k7wJvLw8g5y10YhzkiFAeEsZs7Sf3c5ebb9MIVCjgaXw4tCsFEhvP10zV/XtnkIgOC6zjPKbrePKz8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738508716; c=relaxed/simple;
	bh=EsKzWtXGXEFwMb2VmpbcTurGkOqRVIJgXPTfV5VZUvY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=mr8a/d01zCmD8C3d3glQMFdgpg7FQgU1jFK/LPDrsDOiCyVy32SdzGwzyYvexuEreDTUCZdS/318OhrI/IRpLhza+WZCRpPo/s5AvKnPRvci5EGJYx2w7N3XDxlbfqN4tBWmHM29lUPI0QZm5W1A5ndOkiLW2/svqddobemkTow=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernel.dk; spf=pass smtp.mailfrom=kernel.dk; dkim=pass (2048-bit key) header.d=kernel-dk.20230601.gappssmtp.com header.i=@kernel-dk.20230601.gappssmtp.com header.b=gNmFzeBF; arc=none smtp.client-ip=209.85.166.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernel.dk
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kernel.dk
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel-dk.20230601.gappssmtp.com header.i=@kernel-dk.20230601.gappssmtp.com header.b="gNmFzeBF"
Received: by mail-io1-f42.google.com with SMTP id ca18e2360f4ac-8521df70be6so320525639f.1
        for <linux-kernel@vger.kernel.org>; Sun, 02 Feb 2025 07:05:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernel-dk.20230601.gappssmtp.com; s=20230601; t=1738508713; x=1739113513; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=nAuHDWmks/PdDVRNMLxmVkyazEwen7unn+lyClwJsgI=;
        b=gNmFzeBF2xwWOzOxeSSzdQQr/SzSMoNyrRJvQY/Ep/ok91qcu1B303GETvH4/o0pUO
         dDrBjW2WZzPmdgVbHIIrl8RMUGZf8oveSghd/xVqqUC+X3nM9VJh9gEtU6fiIBG9Yiyh
         kusQTjvbUMc6K61nG+Ec0tPaiYP96/p5soNWoVd9pY4GjXJeEXjIJQAKTlWGVz+Iyhpx
         7BkEeWfSNgYwqHhPjCn1uMpoeNekW719r8rpuSua34rSBefvfUmV5cmpg6mb/Tw8xnm/
         Oi62D4Cwv6PPp0hPU0jxr9Kbu5CVYHu2c8qUhNErxLY3FvoRqIelAxI3Ji5KmvrFji41
         tuzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738508713; x=1739113513;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=nAuHDWmks/PdDVRNMLxmVkyazEwen7unn+lyClwJsgI=;
        b=NV7w2atSDgLqPlXhRKWIlBFFtIU2d+P8YodWtRghTwOtKQq+YWQSm0sGK9GnxHnS6l
         bn+h4PY33TlRjdMFemay/lpXnOrBfH42OnZyydu3lkVSW7nrR4lZXDPxmjYTu7qc8V2z
         nJuZswUMvkFkDFhbyvRAd+0WuZuz2AGBmFcl/9WKrVO2TbIzH3P0EcOQdpgFRyJFMleR
         LKez5i/ys2yFa6MfuTQfYCHpP1rb8lkWKAzGpgv1skFMD+ElZd1DmRO1CVpb4Af1g8wc
         NFbpmydcAp9LS0sHibbKLMt23jmqeKht+qV6G6VBXaa6BUituGUkxlWI9VJR/OQj5ATH
         p26Q==
X-Forwarded-Encrypted: i=1; AJvYcCUD6HHuUEX2sQ+IGURWppD1I/GRqbSczf4heX/Pbh0EFgJlwMN2rG6Ld7Q9v39/6eeKIf/k+OfwYjFlztY=@vger.kernel.org
X-Gm-Message-State: AOJu0YyHQbzPSUPSXGLdWipeqMwss6QE4dweBCVSrcGRPmegVDM6nkcj
	fW3tzIj9B7qDTGYY2Yr5Ei9oO/baP2FTM58Lp6A1WN+n7f9Vr7byvSxcTtZGE8Y=
X-Gm-Gg: ASbGncv4j9Eawaomvm/zDQ3EpJgCNHk0Dlg8ZJgXUOqmsEWu5j/eLsTx99fPDdAZV6h
	R5T9/8oNFX5qPoYhmcGVPHOMXXOen37SXyBfQ/fAE3c8SW62OfEKIuEXAEdo8s5u/ikI1agDSet
	F3aJrrpOkmxOL7FMDi5xD2knn4CpH/vr/n/O6cuVPpMLizI4IFNPBkbkp3i3Ps9j6H65j+P5BW0
	NxWW76V8aLagD01DUhflA5a3o6wKjRXxsI83Pv4Sflv+YGy28H5kOO15Lvii5lzI+okxzG2R8FV
	HsFbo79CiEbI
X-Google-Smtp-Source: AGHT+IGukiziiC1rLjM6JzNMSPR3ZwXkwHF2OgEI6BKabzKWh1pSdyxOGKbkMwtPxxnvRPz9dK83Ig==
X-Received: by 2002:a05:6602:418b:b0:843:e8d0:a728 with SMTP id ca18e2360f4ac-8541111199cmr2011722539f.4.1738508713097;
        Sun, 02 Feb 2025 07:05:13 -0800 (PST)
Received: from [192.168.1.150] ([198.8.77.157])
        by smtp.gmail.com with ESMTPSA id ca18e2360f4ac-854a15cf87dsm197686139f.5.2025.02.02.07.05.11
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 02 Feb 2025 07:05:12 -0800 (PST)
Message-ID: <4c45eff4-e87a-4eff-a760-b3b7d86b1987@kernel.dk>
Date: Sun, 2 Feb 2025 08:05:11 -0700
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1] f2fs: remove unnecessary null checking
To: Kohei Enju <enjuk@amazon.com>, linux-f2fs-devel@lists.sourceforge.net,
 linux-kernel@vger.kernel.org
Cc: Jaegeuk Kim <jaegeuk@kernel.org>, Chao Yu <chao@kernel.org>,
 Damien Le Moal <damien.lemoal@wdc.com>,
 Chaitanya Kulkarni <chaitanya.kulkarni@wdc.com>,
 Johannes Thumshirn <johannes.thumshirn@wdc.com>,
 Kohei Enju <kohei.enju@gmail.com>
References: <20250202043253.64389-1-enjuk@amazon.com>
Content-Language: en-US
From: Jens Axboe <axboe@kernel.dk>
In-Reply-To: <20250202043253.64389-1-enjuk@amazon.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 2/1/25 9:32 PM, Kohei Enju wrote:
> When __GFP_DIRECT_RECLAIM (included in both GFP_NOIO and GFP_KERNEL) is
> specified, bio_alloc_bioset() never fails to allocate a bio.
> Commit 67883ade7a98 ("f2fs: remove FAULT_ALLOC_BIO") replaced
> f2fs_bio_alloc() with bio_alloc_bioset(), but null checking after
> bio_alloc_bioset() was still left.

Reviewed-by: Jens Axboe <axboe@kernel.dk>

-- 
Jens Axboe


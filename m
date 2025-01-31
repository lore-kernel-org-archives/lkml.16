Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com [209.85.214.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA049199223
	for <linux-kernel@vger.kernel.org>; Fri, 31 Jan 2025 23:45:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738367114; cv=none; b=o0qkQSYsi4YSzBN5tmesfsgF/+oy2KxhxE1RVgfLTkZE2FAZrNt/+oI+3WovhyJy4+p3Fnxul6/2ZmNNRsxkYbepCUAesTAVRMaQqvnKbJkt/NRcJbnsAFEYDKkZDAkgvq4tRQZ6gX4xDAcI0jCGDy5dMpxrs12/wiVTc9H8xHI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738367114; c=relaxed/simple;
	bh=UFGokNkuAiirr6XYoP1YSKNVI52s99ofL/bkiuEe/+I=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=qFD0dj9MwR0CpL/zIpV4rD83FQrTqaDvo6qia84xrKTRfSkSEDyQuNcADDSsfBxl/J12keGrf2+9vFAGBIuwvvqqsjXOr2bypBopeqfdBTFMRSKhxL7oPjO6xjfNuAQCdiW0zMosGPRzyDkT/PMC85V/uGL6hnPT6CT8MISwTG8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pdp7.com; spf=none smtp.mailfrom=pdp7.com; dkim=pass (2048-bit key) header.d=pdp7-com.20230601.gappssmtp.com header.i=@pdp7-com.20230601.gappssmtp.com header.b=zlwPqKkq; arc=none smtp.client-ip=209.85.214.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pdp7.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=pdp7.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=pdp7-com.20230601.gappssmtp.com header.i=@pdp7-com.20230601.gappssmtp.com header.b="zlwPqKkq"
Received: by mail-pl1-f172.google.com with SMTP id d9443c01a7336-21619108a6bso44621465ad.3
        for <linux-kernel@vger.kernel.org>; Fri, 31 Jan 2025 15:45:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=pdp7-com.20230601.gappssmtp.com; s=20230601; t=1738367112; x=1738971912; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=FDhxU1Wjdu9clsSFdKwJ9yZhDMh/uanXENuaIJxZ5UE=;
        b=zlwPqKkqYnTJ3TNrrzCYb2TMRatLg/s1nu5X0/JWGS9aoen3GmBjVIXhvRgerkSUe/
         nT7g+2CBvRYR+P6xtI1N0ON2bE/NJ80SapnUqr/iQOBIr9SkJ8sn3BaIrKfD1Y/RRuJO
         Ox4scrvWJadw6pFfKfr6RyTKUKxhQqBQJUcqrhx7LsDohQgSuVcEwz57ZPOF7U+oHPS1
         fvjsCMPR7rjYiCfu80RYxwHRO04slF/VVtGw8VdgQ0ttIz1bUJH5R0HHV4phdxqIxPdC
         hBHumbBbVSJrHNQzcSvGVMTsC2ZHDAObMpYOaM7YAdTJbo1EeqgaTQxXrDWx0heV0i5P
         ZgnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738367112; x=1738971912;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FDhxU1Wjdu9clsSFdKwJ9yZhDMh/uanXENuaIJxZ5UE=;
        b=H8HK5XO5S3Td3GEgoy/aLJ9StBi8dRXj2S9K/6Evf/AcLYgNMyAyoHZZym/Ves+MoJ
         p8xgGXpDwHBdqtzH7n8TM+Rlig6xhKlYNR/0PS6EdFhKOHNGlw3mSkby7Bd7fA6QUMEy
         DLWsS4CHFc/aRWSRdsRh8gYsbsZKDklUr6IkypOczVRNU/0T1QX9aVPFCWpp9VtKulXz
         MhG+PdQAZ4sUmJfeQwkrp5umg5IOWr4Hhv5RallT4glR7+H6sQiFp+TqfsD+Sj2BP/WR
         HsPUrZfrAigxNwwWhYjcOUaBkbwXj4uXIIcI2SvnnynTF+U+199wOYXuXnuwGg3GZEk5
         TANw==
X-Forwarded-Encrypted: i=1; AJvYcCXooaqgvV9vddf9PZpiSIW9PZbk/UPHqmPozYeQgopMMYNJBNppuWDI08wsWQS5tFctfMFh9W3YYZ5LTXw=@vger.kernel.org
X-Gm-Message-State: AOJu0Ywzqa3WRIrVKhTGq6u1+lnX0Ux/eEdOTcXRxZItmPOC7G0in+Cc
	DDugfI2U+aQUxytFdC22FXlmJ5uK3Db4TIcofmiqhmjnLnYPIy8aF1uqw67vMN4=
X-Gm-Gg: ASbGncvodzWTrGqDvJPl9dFRxONSArKUDrjThFprJiAYYRxM+iXDB0MV5jxuCKse2Mh
	3VUL0GLF0UFaOOnFFhhi7uY2xKyFNRtuJzlMfH/cfy2KMW8xAas9Xu9+5gNwQY0sxiUjmrjoutN
	up2agNwXwChqNi1XPz9SHyPEVRFa4ku9gVjqiumAqa9wtKv0AZu5R/bk+WFqIxVDDJjIeUT5M0C
	4VUgM774MfnZFCUflGFDJEx7lCMesyNFK4TbzljL+JfzIx3FMN3UWWS0mHhfP5ILzP03cLgiMyg
	KTj4Q6Fi6MZSqMwUJlIXLA==
X-Google-Smtp-Source: AGHT+IHkTz4Ig+KYTw+rB0uKzYNadppQzCfmbX9cSa8DpGTtUiLQXcciZFMKT3l9NUzEVW9YDmNYKA==
X-Received: by 2002:a05:6a00:179d:b0:72d:a208:d34e with SMTP id d2e1a72fcca58-72fd0c62218mr20830859b3a.18.1738367111971;
        Fri, 31 Jan 2025 15:45:11 -0800 (PST)
Received: from x1 (71-34-94-122.ptld.qwest.net. [71.34.94.122])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-72fe69ce907sm3934327b3a.141.2025.01.31.15.45.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 31 Jan 2025 15:45:11 -0800 (PST)
Date: Fri, 31 Jan 2025 15:45:09 -0800
From: Drew Fustini <drew@pdp7.com>
To: Palmer Dabbelt <palmer@rivosinc.com>
Cc: Linus Torvalds <torvalds@linux-foundation.org>,
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Conor Dooley <conor@kernel.org>
Subject: Re: [GIT PULL] RISC-V Patches for the 6.14 Merge Window, Part 1
Message-ID: <Z51ghS0eFmvClVYR@x1>
References: <mhng-5051a418-807c-4539-91b2-255492eae79f@palmer-ri-x1c9>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <mhng-5051a418-807c-4539-91b2-255492eae79f@palmer-ri-x1c9>

On Fri, Jan 31, 2025 at 12:08:40PM -0800, Palmer Dabbelt wrote:
> The following changes since commit fac04efc5c793dccbd07e2d59af9f90b7fc0dca4:
> 
>   Linux 6.13-rc2 (2024-12-08 14:03:39 -0800)
> 
> are available in the Git repository at:
> 
>   git://git.kernel.org/pub/scm/linux/kernel/git/riscv/linux.git tags/riscv-for-linus-6.14-mw1
> 
> for you to fetch changes up to 101971298be2aa4706c8602bd81066a0f6f2ced5:
> 
>   riscv: add a warning when physical memory address overflows (2025-01-29 18:36:09 -0800)
> 
> ----------------------------------------------------------------
> RISC-V Patches for the 6.14 Merge Window, Part 1
> 
> * The PH1520 pinctrl and dwmac drivers are enabeled in defconfig.

This is my fault that I did a RESEND [1] after Palmer had already
applied the patch. It is already in torvalds master through
soc-defconfig-6.14 [2]. I'm sorry I didn't realize my mistake sooner.

Thanks,
Drew

[1] https://lore.kernel.org/all/Z5wy+NosgbxYk3fN@x1/
[2] https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/log/arch/riscv/configs/defconfig

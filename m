Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com [209.85.214.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ACE1121D00D;
	Fri, 27 Jun 2025 07:45:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751010314; cv=none; b=T/H6YdNT2/JAIdYloT6fg7e/iEBi4XMHMpGe1bokAvp5DtzYFehGsx5aoDwIz+LNglyoLJeIFQG4ufyKK23tG4GYIJDCMKMt+fGBjGr929WVMUw9DVCBmRvleHwr0jXBQGRM+6L8Jj+TbN8r9RDH9g8ersQsPYHPAYrR3A61SkM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751010314; c=relaxed/simple;
	bh=vqujOY/R4b/ay6EtDaM0zoqhCTHH7KClxFgKqjr1jAY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=D8WW4yCgA9NrMfDDS8HINZVlFxCrlMyKzM/5JHNTF6edOYrlCQCDlfwfWb4uA8aHyFTg+tkyzr9dI/rUT0Ckhd7M63F8Yr9+VqzXigJBftoBMwVrPl8pvZxZu3phm/EBJNrbAfGgVrwK8Hhi2CglPLPGCqErygr8E8MSojbftxY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=JI8LsXwJ; arc=none smtp.client-ip=209.85.214.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="JI8LsXwJ"
Received: by mail-pl1-f179.google.com with SMTP id d9443c01a7336-23636167b30so18764285ad.1;
        Fri, 27 Jun 2025 00:45:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1751010312; x=1751615112; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=6kwXMa0RVLz7EpJ4koQvotLZKLm6G+hz8I9ALzuYytU=;
        b=JI8LsXwJxX53o20GpIOOy/nUOaexh7Fbx1sSyPcq1+td9HR4u4/Xppy/lcOEIC5zOI
         Ax/EYOm2GerXow223olh1doGimdl+3aSQFy/mMQTkn0peFZhNQswsPffocPrxWq2jQO+
         bpu7pHBrNtnyhvgspBNiC03q6GqZ77y0xhWdZStQOBH2gpw2+ME4yyVyQDj8aFUsRzTu
         emaqh+fX9j0GT7p14QOtDh8Lo9XgHJzCym74seNH72HwwRfXLDCZriNU/UNwG2ASyuNG
         YIZPLl9jHJ29GhZZqoK+uX1VZ/zWQyRE4hBqnhOktrombY6c+dxi2hnzNSVYis2ZU7/d
         Kf1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751010312; x=1751615112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6kwXMa0RVLz7EpJ4koQvotLZKLm6G+hz8I9ALzuYytU=;
        b=cBsVLT9om1BuqsC50jV7dDyTqWng41paF0pTEWE/k6Qq+8ZSooozgRDK3ubIhnRsle
         jAvIhfFUg+WLI3K9WN2rI6BATho7RcCFP9OUkzbkSDCJ6e+wTlERgKCukEdDO65F5aEM
         yuaWbQ+qQHUMNDnV5ZxvLTLhSE/QTqZ/gbkGEmhAbppVXKgaQBzeksB8NIgz+YuLBYXn
         BLNVUwSBgO4TnslQ7B/4pV/qNUKyWiDVP+3POfBqL3HQaMkckHv6j7D4hTd38eRiFlJY
         b1rD3/Ea4wg/NbCIcmcAHzCWks+s8Myo3NkZ9Qd82MHGK7zGc4A7idpcx8ikbT1LSDP1
         hyHw==
X-Forwarded-Encrypted: i=1; AJvYcCVAWTlJYCSVgBuqYc3SrCRy78+L8SUprJry/vfKcEtDqi5ZLQmq8UE+Wc9QRJodHVBD8lce7VThcf0D0yw=@vger.kernel.org
X-Gm-Message-State: AOJu0Yxw72SesRsXAV0DoIhDjemIU7WDbhozaApZA5B2jzf072H04FEd
	z5A8IglMr1dsuEWDfh5kSLkpmCtdS1zJsvaY1rsZ0qonEUc5uCfpIt28
X-Gm-Gg: ASbGncvjXeu9+CZ0pwStJa5GJhTOnsc6OSfwi9CO8e+RD4fBHw2OUHWebJx7nJ+g/YI
	k3go70B8QBCjepsYA0oWUBNamDHi5OVj1+nn6mmkh9fIXDZu0s2zRqKmZa6zT8CzDuD45RLj4Ei
	1EXIEYFuD4wK2YEyPLmwS44CI4MUAEQ7Jpxgrn74oW0QgmLJo3isH7m9ndgjhp0+WLjz4jTArB1
	0MZuPIl0EZKdQoJI0xWGorRsPMkeyYQds7WO1eHhx2per9MYAlYXHk9zYFj1YDpMK1h09w+hmPS
	H4R39ldOqr2XJNWlQeJcev3P+PJiEUPM+URwo4+CwoUjVTosZtYjHnTuy6T2iGKslo6B/wXJ
X-Google-Smtp-Source: AGHT+IEosVdRq8jswGr8fyP/uRwtM7xveOdc4+/YhWRKXXFAv1fBojRPrGKTceYMplzzNMFyzx4jZA==
X-Received: by 2002:a17:902:f601:b0:235:c9a7:d5fb with SMTP id d9443c01a7336-23ac3deaf2cmr35094145ad.16.1751010312004;
        Fri, 27 Jun 2025 00:45:12 -0700 (PDT)
Received: from localhost ([2001:19f0:ac00:4eb8:5400:5ff:fe30:7df3])
        by smtp.gmail.com with UTF8SMTPSA id d9443c01a7336-23acb39b99esm10595105ad.102.2025.06.27.00.45.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Jun 2025 00:45:11 -0700 (PDT)
Date: Fri, 27 Jun 2025 15:44:58 +0800
From: Inochi Amaoto <inochiama@gmail.com>
To: Philipp Zabel <p.zabel@pengutronix.de>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Chen Wang <unicorn_wang@outlook.com>, Inochi Amaoto <inochiama@gmail.com>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>, 
	Alexander Sverdlin <alexander.sverdlin@gmail.com>, Yixun Lan <dlan@gentoo.org>, Ze Huang <huangze@whut.edu.cn>, 
	Thomas Bonnefille <thomas.bonnefille@bootlin.com>
Cc: devicetree@vger.kernel.org, sophgo@lists.linux.dev, 
	linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org, 
	Longbin Li <looong.bin@gmail.com>
Subject: Re: [PATCH v4 0/4] riscv: sophgo: cv18xx: Add reset generator support
Message-ID: <ep7gbthprqyzfdcqvs3wadqflyusdsut3uxt5wv5j7mvazyl5s@muk77uizwcrg>
References: <20250617070144.1149926-1-inochiama@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250617070144.1149926-1-inochiama@gmail.com>

On Tue, Jun 17, 2025 at 03:01:38PM +0800, Inochi Amaoto wrote:
> Like SG2042, CV1800 Series SoCs also have simple bit reset generator.
> Add necessary code and bindings for it.
> 
> Changes from v4:
> 1. patch 1: convert the compatible as entry of enum.
> 1. patch 2, 3: apply Alexander's tag.
> 1. patch 3: apply Junhui's tag.
> 
> Changes from v2:
> 1. patch 3: fix wrong reset ID.
> 
> Changes from v1:
> 1. rebase to v6.16-rc1
> 2. patch 1: apply Rob's tag
> 3. patch 3: fix wrong reset ID
> 
> Inochi Amaoto (4):
>   dt-bindings: reset: sophgo: Add CV1800B support
>   reset: simple: add support for Sophgo CV1800B
>   riscv: dts: sophgo: add reset generator for Sophgo CV1800 series SoC
>   riscv: dts: sophgo: add reset configuration for Sophgo CV1800 series
>     SoC
> 
>  .../bindings/reset/sophgo,sg2042-reset.yaml   |  4 +-
>  arch/riscv/boot/dts/sophgo/cv180x.dtsi        | 25 +++++
>  arch/riscv/boot/dts/sophgo/cv18xx-reset.h     | 98 +++++++++++++++++++
>  drivers/reset/reset-simple.c                  |  2 +
>  4 files changed, 128 insertions(+), 1 deletion(-)
>  create mode 100644 arch/riscv/boot/dts/sophgo/cv18xx-reset.h
> 
> --
> 2.49.0
> 

I wonder if the binding and driver can be merged, as many devices
require reset to functional normally. If these two are taken, I
can take the dts change.

Regards,
Inochi


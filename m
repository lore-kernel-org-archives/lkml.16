Received: from mail-qk1-f180.google.com (mail-qk1-f180.google.com [209.85.222.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 831641EA7D6;
	Wed, 14 May 2025 22:26:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747261599; cv=none; b=XuylPKpU5d2XQYffCo1JuksQ3ATYhqgTRoUFLi4UBJTnhaDI7+BUrN/3jPir1yGSWYRt9dxXUgAvM3/GallMthjuqfRNGx09OBh8lldcfroi01yPCOB+vhJI5OcJ4lKbx2MHkPXD86g1kPE4OqKfN1y2yiBeB82fdGRjvzEtkZs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747261599; c=relaxed/simple;
	bh=e318nA+l2faX+8mEcOPz0nIXWQIzRPQPZ3gt/UuoOX0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=uJ4PIr8ZakdcNk2j/hjB43jnsccGpReJb5JOmOJzGxvejCWdgpC30oVYZSE7/yvvOEMxjW5kzYAcAicrvvbC60oKqQY1os4fI69s0qBWqzEP0KZmtbNoA9PMiFhWPznXiV9aiEMH2Vti28VO0AUnglvjMar/TS1J5k9OVxbyvx4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ljRVWKKf; arc=none smtp.client-ip=209.85.222.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ljRVWKKf"
Received: by mail-qk1-f180.google.com with SMTP id af79cd13be357-7c9376c4bddso28840285a.3;
        Wed, 14 May 2025 15:26:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1747261596; x=1747866396; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=c8WzUMbK9qDOEyYdDVvObbmZCXxUEIqd+QHrspXvgLY=;
        b=ljRVWKKfSFX/NHqzR1lUe2lvdWGvVZaEpWCi1hfLOCJg2ssbIgtb8hEMt4wpHOy57B
         HZ8bJYRlXO1Q7WAqJvFIMzkLmMktPPM795dn/X9bxXR/2vkqhyu1QAaXKRBZ0td3QO8V
         +DtUib1yoDSkfqIo3FIm7wxQVd8zJV4Mu7MQ1MIEzduAE91sJr93oWavlt00rBAFgwg4
         bLq5qlwaP+Yecrj6H2i5K8tDjwsDhjO4aEVBmF8W0VeSEf3Y5DYRxH4IuHcXyc3g3chP
         dQfvBCbd2zJC07EJzeFKXTg3v11BumDZo75BhmN5pXCOg//Mqp3HPBHYwxpfx4s79vAz
         LVsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747261596; x=1747866396;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=c8WzUMbK9qDOEyYdDVvObbmZCXxUEIqd+QHrspXvgLY=;
        b=P8tjnBSuR9Kipc6nk37+M3KVPsedSeuaObBGFJ0nkMY7Q9e1s1aDxSCGc5MOxD/TWG
         4CyajJDme0nH2LIj5LZfilW5Ik2G0E60zJWm78QLnDN95R84ybieMNbwQQTtFvksyG7R
         282AZDZ1Q2OXHp65aYPeLtIWMNfsE8GpdI7QD4BlqsHACgNfizL1dYwGy25W6kSsBnMm
         q5S8itZyGcK4hPHZGl5sAK/LkrrC5AsBBjyWo25K/UGon6YLv17umvYxSEE3uKz31IKH
         qgaZ5O4dGhQDXHxYhcDzusO63Enu4kLVVTuShlGvTkzCb+Qfux/eMuTK6oLOa9oontk3
         KNIQ==
X-Forwarded-Encrypted: i=1; AJvYcCUCnhxcof/BMBkkpBVcSBBk/B1h10mYoNh9PL8rcFxfIrCUuEqPag4d6g/eGmKydZkBEyKsc2NN77gv@vger.kernel.org, AJvYcCVhlYbu7p4UEms29QPmuunzXpx57vZjWD+sWJzQ8NoKBH4o/fbUn109DJwFb72sgjs8z/dl+XkLc7j7mNVR@vger.kernel.org
X-Gm-Message-State: AOJu0YxU4TGIa1M6dLC9v1HZYm4KRq1QEqS39DEgYsPQTUk7GlqW3l13
	ejKbMm5li/chIF/Wz9wlZ8bUbNONEKbAuZK0NKCsTF3H5EiMan1BV7wAy1Ru
X-Gm-Gg: ASbGncvZue2TUpxyUfoNf87cs13dM0w5knhxGJZuO2UBAY2QP+yaNipoJoC7mbtdwe3
	jXjdF9w/tz5XGJWePIP1Ws4HL0JWUJn9WNvAaEuLGIvo/Zbl58nWMYD3k3yYWURfXXxzvfm/Q+s
	QsiBccpxmvhAZtuICdkqWP0EGsIPXhsy3D7bbe9MenOF8Lfm3xmmaBdkxMZ0sUT1+mTJRQ4fOs1
	Ni3ZuUPvRmYEAaqZ4WldQcxMK3BPiAONky8LBwjt6548jLUiRYE88+xzHeQ/5T4Id7XGe1azFP6
	ekoDAgX0XnEg0uZf1r9kHyFhxdg=
X-Google-Smtp-Source: AGHT+IFCPVi/HY6nkbeTe3GAvpoQfv29BrlN1iWGz0H9o77nmmRTrZnt07gCTVHpLkHuJ4hlKEVttw==
X-Received: by 2002:a05:620a:2904:b0:7c9:4d96:24ce with SMTP id af79cd13be357-7cd28846e7emr739361085a.44.1747261596342;
        Wed, 14 May 2025 15:26:36 -0700 (PDT)
Received: from localhost ([2001:da8:7001:11::cb])
        by smtp.gmail.com with UTF8SMTPSA id af79cd13be357-7cd00f4e0f3sm899305485a.16.2025.05.14.15.26.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 May 2025 15:26:35 -0700 (PDT)
Date: Thu, 15 May 2025 06:26:04 +0800
From: Inochi Amaoto <inochiama@gmail.com>
To: Han Gao <rabenda.cn@gmail.com>, devicetree@vger.kernel.org
Cc: Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>, 
	Chen Wang <unicorn_wang@outlook.com>, Inochi Amaoto <inochiama@gmail.com>, 
	linux-riscv@lists.infradead.org, sophgo@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 0/3] riscv: dts: sophgo: add more sg2042 isa extension
 support
Message-ID: <qz2kywcmxx2ub4bycso3y4qodiaeddj63nclissppy5morsjqt@jci4bapl2afc>
References: <cover.1747235487.git.rabenda.cn@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1747235487.git.rabenda.cn@gmail.com>

On Wed, May 14, 2025 at 11:15:49PM +0800, Han Gao wrote:
> Add xtheadvector & ziccrse & zfh for sg2042
> 
> Thanks,
> Han
> 
> ---
> 
> Changes in v2:
>   add zfh for sg2042
> 
> v1: https://lore.kernel.org/linux-riscv/cover.1746828006.git.rabenda.cn@gmail.com/
> 
> Han Gao (3):
>   riscv: dts: sophgo: Add xtheadvector to the sg2042 devicetree
>   riscv: dts: sophgo: add ziccrse for sg2042
>   riscv: dts: sophgo: add zfh for sg2042
> 
>  arch/riscv/boot/dts/sophgo/sg2042-cpus.dtsi | 512 ++++++++++++--------
>  1 file changed, 320 insertions(+), 192 deletions(-)
> 
> -- 
> 2.47.2
> 

Reviewed-by: Inochi Amaoto <inochiama@gmail.com>

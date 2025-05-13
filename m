Received: from mail-qv1-f50.google.com (mail-qv1-f50.google.com [209.85.219.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 449021E503C;
	Tue, 13 May 2025 04:48:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747111683; cv=none; b=S/NDOlz+QmapboXfjtvWbNYkFz0KIVzKfVnmzQokKuhEoTTVeNH00i1BTg6J3ZY25WyVyQQyMoSdafLUuSuQh/Iaq+c3LvtjTYt5OmQfsmHsarrgkYla9a3rveE3p+jqxrldozSBZf1Sr9SNPNFmPJLtu7rnlygf2YXyRTh1ayM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747111683; c=relaxed/simple;
	bh=/T5Wi2b5uYG0Q1em6Md1MYRW9HM0ILFKKyBKSuRChRQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=jfJjW2FIP7BJevWMB/tq/J0g2FataSYsIDpO52BtHD4oxfBRypKlp6zRqoQGP+dGnly38wDMQLod1gPnWOfUYvyGeLSw6hEV9Djpbkwx+EZxqNwQ3fxM+v2/GuQJJ5xI1jVUmFJIHVq/yvUfeTgIdZnky40F/PVDTzj1YonrDR4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=AAoFhqjC; arc=none smtp.client-ip=209.85.219.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="AAoFhqjC"
Received: by mail-qv1-f50.google.com with SMTP id 6a1803df08f44-6f544014883so27511766d6.0;
        Mon, 12 May 2025 21:48:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1747111681; x=1747716481; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=KR7eKLJbwnrfCRgfL+syprkvAujQisMfVa8RFU773iE=;
        b=AAoFhqjC/n7wrN90uep8QXi6DpNsOuDsTAlHyH12OtM7iE8qUoAOwbJVTCCXmJk87H
         NDgTVkiBGugjFeYV1vnmxsDVUork4fMcxQ1Fax7+K/cm5nR/HdCWYXZINpGX95p3moVP
         nsBM3hUNkxqAFo7BA70HHtitU9NNs7ul7690egx06NJxaTPAB2I+OwNi+7IWSH4bMVwj
         qN9WlyxNpog3d6dg/Rn8gSRx1DgtP0zHFLFzFoa1Efrfc7FRRLCjYwOrbl7eOO0u48/z
         95XhGj6iFuaRFPy8Im2C65hNnqrbXKsAAes8Sgtjm+uSllUtuG6XTan0CqAhSfwLz8Zx
         hNmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747111681; x=1747716481;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=KR7eKLJbwnrfCRgfL+syprkvAujQisMfVa8RFU773iE=;
        b=OLKL8JyuDam/ETGBqBTjAZiVJaZjM3QkpOuVnOVaOlX4eILuQCnOT3OnwwLMHK8y/s
         Qv6vkBryMvnwMflCBOSrMx/huHaNlYmeZv6mMe5Jd2JCUokNV1dTg0KDOLLvWuldFwNE
         EU63HkCzq46ng0HZFWlTMi3ga1KLt/d0/lmCVYDOn1qE6qW3ZmhkNeZp6TFgZh50/RbA
         YhAXZwWxtmGN1CcQ4CDRfDI5jux95N5hzq1PYGAXZn/lFZNF7eYllofT6iz005eoACY7
         17XT1yzOzX2oaJ6fH69J4TwTYjk4g1+lY9PQmeCv0Gq/wN0VTvGd+bjFA7xvS3yhgpzR
         gOuw==
X-Forwarded-Encrypted: i=1; AJvYcCVCWaDd50G1u3JvyiC9h80AgCutJ9BQlpeYunfk6ZEOEqBPGcJBOdmGyxYN6dgfy5dLG21UpDspUqaiS2fO@vger.kernel.org, AJvYcCXPyvNa72q9Cm/ydkkXUNp4nz2XaopC2XQABv5ok8/i0m2TKkikh3KZSuUSEkd86juvLjF+Sqm4YjCH@vger.kernel.org
X-Gm-Message-State: AOJu0YzhQsz7tRTUuQjvVnKaETaTn12uaEuJYPln8MOrMf8j24DPwGnK
	mQCOex8IRN9K1gWQA346Pn3jmOnEKGJXYFy4caw7avrQTOwNnime
X-Gm-Gg: ASbGncuBuqornXhvRlTPONcHlcasshAdCCapR/oNvBywmxfLixBAIrowKC/+zbYwtBa
	tBoeL3mjod8eDJnLceVqhzPzpu+tURDEkuJ46WHrt/Nhuu3X4L1XUMpA5BZEWCrat1la9Yg6Mmh
	HyKPrz+QTzSFl9iFhbNBrMj6hzmLs20+YQaAIIv0mCU5HgJ9veBpSHLT2UeuuP8IB5alvSAnTcP
	1Hfkw/Qvyn0sADB/q3FsRSz2MKxMwjpf4bsFy+ZZ2juhuNYW6UFb/gHtGmBdJyBq7v9bGf+AKPD
	WpEt4jpQ+zuhs4MWUNWLzkX/2aw5N8FIBROPbw==
X-Google-Smtp-Source: AGHT+IGMMVWi5sUhGfqR5ppR5sw1BwP28UqLP+NhcalHnZR1zGlpwyPrB1d1heId/WN2/hYqgwmEjA==
X-Received: by 2002:ad4:5d63:0:b0:6f6:e411:a050 with SMTP id 6a1803df08f44-6f6e47f6168mr249312916d6.26.1747111681132;
        Mon, 12 May 2025 21:48:01 -0700 (PDT)
Received: from localhost ([2001:da8:7001:11::cb])
        by smtp.gmail.com with UTF8SMTPSA id 6a1803df08f44-6f6e3a47306sm62394856d6.89.2025.05.12.21.48.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 May 2025 21:48:00 -0700 (PDT)
Date: Tue, 13 May 2025 12:47:30 +0800
From: Inochi Amaoto <inochiama@gmail.com>
To: Chen Wang <unicorn_wang@outlook.com>, Han Gao <rabenda.cn@gmail.com>, 
	devicetree@vger.kernel.org
Cc: Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Inochi Amaoto <inochiama@gmail.com>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Alexandre Ghiti <alex@ghiti.fr>, sophgo@lists.linux.dev, linux-riscv@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/2] riscv: dts: sophgo: Add xtheadvector to the sg2042
 devicetree
Message-ID: <iydi574treznfdvaibi7obxtyozs4b2sfiddpvckaovpgcpj6g@nyctqbjizxsc>
References: <cover.1746828006.git.rabenda.cn@gmail.com>
 <af839bc200637e4eae1cb327c95ac98c82bccd52.1746828006.git.rabenda.cn@gmail.com>
 <MA0P287MB22624E52A6647B43D53DCD2CFE96A@MA0P287MB2262.INDP287.PROD.OUTLOOK.COM>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <MA0P287MB22624E52A6647B43D53DCD2CFE96A@MA0P287MB2262.INDP287.PROD.OUTLOOK.COM>

On Tue, May 13, 2025 at 09:19:07AM +0800, Chen Wang wrote:
> Hi，Han,
> 
> I tested with this patch and the machine can bootup. But I find when I run
> "cat /sys/devices/system/cpu/cpu63/of_node/thead,vlenb", it print nothing,
> though I expect to see 128.
> 
> Do you know why?
> 

Maybe this is a hex number? Do you try hexdump?

Regards,
Inochi

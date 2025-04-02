Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F06B13959D
	for <linux-kernel@vger.kernel.org>; Wed,  2 Apr 2025 15:08:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743606516; cv=none; b=rwyECcdEflyHFghOZ/c5mnTprA9b54W4nyztfhZa5PtAMHqVIbtoxHkCxUJVwUqXW1tnKqsGaGNQhU9vKJ9RKdpSMkD1TlMBj7ptgr0s7yK9tdXuVuzoJgr5pZpnoc2d14wHLI8NdSNpMJ/zYAXf+zJ42pQZP4DtbrL9F2mAG2I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743606516; c=relaxed/simple;
	bh=AmsS7TeoR5lfEkPA/4hWMzBs7ZLo8pjbDxlnDnyGR5I=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=W9ampLzlbeZ8qdwLwpAoWrz17NP2Ulvi/1Mk+unCHIgHo2YMsS4Kw8PolUmZUj32th6FefvljUY2Kl+MLS3IxOBmdUMX+/9XNxy1FRx4NoJMR/owJBIBsS5hlR3jpTsThHStpmfKgxv9pDF6dDNaeKjK775QHrnibpHqDkZub2Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=KZBN4HA/; arc=none smtp.client-ip=209.85.128.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="KZBN4HA/"
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-43cef035a3bso50326705e9.1
        for <linux-kernel@vger.kernel.org>; Wed, 02 Apr 2025 08:08:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1743606513; x=1744211313; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=AmsS7TeoR5lfEkPA/4hWMzBs7ZLo8pjbDxlnDnyGR5I=;
        b=KZBN4HA/B+3D9ey4rOLUssUygEpPDzgYeq8KaCeJwBIc+Zgx1CcxyUw4twEkIUoU/z
         JUN8rCx+SF7e7jqyOOvXfi9IUNTWzDEUM43Aw93+H86VEDSidZCqDqbPFZK1Ujra0CCc
         MNO0GCIbg6anudCao/zNEPkpY17QcqCSrqFePkJvX0nMxWLdpusSu5cy0yEUzPz+npJk
         knjdK7FL0/sjEi6scVxzinDFI12TWQeVIg0o4OLJmjrVj4z7iUA4e/4CZIY7oLmnfBzT
         +7kgDJ5veXcYfQR6cFayvPNbEsLCe7PnOfEMkKzJAcd9f9rXZfJpb1TAvEZeQjT5oWNK
         rWyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743606513; x=1744211313;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=AmsS7TeoR5lfEkPA/4hWMzBs7ZLo8pjbDxlnDnyGR5I=;
        b=TTPQTN86W4IS86GVnGOQ0Xt6P7xvfyJ5cavIL3emytpbzynC4sWIkLN8zMPQ70Vbby
         foND19JT4memr+tBsDP8bbRGPDTnoKcLAaSfjvYn6iWDHC56vaUWk/iO1OrYDeilPe1p
         sdqzPZdsnLtyu5G9R+K1j5zKR2XmvgBOBKkX4dlEcP7U5vk5xeqVrmNtao/+FRFGvo8r
         cd7u+hXuzhrHt/IQ3SQe3XtdwWSEYg0QJlOxpTYYopx5k1mhd+OABPpIhPat/pOfGx8Q
         iZVVW4RFZ0Vc0vW3If/mIxcJzw7JBL6k/aDsqNCcLr5gTmJ+kzqzOJNlxV4iykI0xfJ1
         OL7Q==
X-Forwarded-Encrypted: i=1; AJvYcCVwJOZy4mBdxYWMLlJB4vH+Htk95d95UpWG/jKWx85r1R0UahRgJiraIszrElAVC4jP92BzMYdu787Pmd8=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw/divgorkM7YQXUp9ffopUJ/L42OyyxMVXHzarwrVmCrnP1n2j
	1LdppPA7SiLGOxm2za1Yf8JnisNAwMYzh4nHGIcx6NMp40aNthqdW2adq0xRZWw=
X-Gm-Gg: ASbGncvY80+LYpIE8OUv2TDa59Cv4WYqOU8S0e2Y0oczcUPqVO/F/SaELtM4YKT43hF
	mxjbVmMR9KuiuwmPEbIIUBof+SJh+fD66bVnXICdPPoStj2/tLgZVCMh0yDpflTF2A7Y6QhyEg/
	DrFh81ymBswqYyM0prsfrS27ZiXaD2vGeeniwqV7pZV8RCAlBaCRC9iyePJexxCuquokNv8EsPU
	8PtQEpRo8zm/FRV15rkEyuY216HzNH4m1KPHorpHteN38MYpZhkpPGQO+zSwAH+xnLpsmKUMeH4
	1xth6Kjeywrgz9P8GjCMUaUf9ku9/59q2za849midM26PX455vPB7w==
X-Google-Smtp-Source: AGHT+IHewcwryKZGUim+bc4+gDwso6yocdf3w3vafyj0dLW37f8TS9sGPVOsSTSvWJrzTYzQ7IzeMA==
X-Received: by 2002:a05:600c:4747:b0:43c:f689:dd with SMTP id 5b1f17b1804b1-43db62b71abmr131366815e9.19.1743606512759;
        Wed, 02 Apr 2025 08:08:32 -0700 (PDT)
Received: from [192.168.0.14] ([79.115.63.146])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43eb5fc59c0sm24292535e9.2.2025.04.02.08.08.31
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 02 Apr 2025 08:08:32 -0700 (PDT)
Message-ID: <97639641-03f0-4d9a-a5c6-73ef264ba35e@linaro.org>
Date: Wed, 2 Apr 2025 16:08:31 +0100
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 11/21] mtd: spinand: Use more specific naming for the
 (quad IO) read from cache ops
To: Miquel Raynal <miquel.raynal@bootlin.com>,
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 Santhosh Kumar K <s-k6@ti.com>
Cc: Pratyush Yadav <pratyush@kernel.org>, Michael Walle <michael@walle.cc>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Steam Lin <stlin2@winbond.com>, linux-mtd@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <20250307-winbond-6-14-rc1-octal-v1-0-45c1e074ad74@bootlin.com>
 <20250307-winbond-6-14-rc1-octal-v1-11-45c1e074ad74@bootlin.com>
Content-Language: en-US
From: Tudor Ambarus <tudor.ambarus@linaro.org>
In-Reply-To: <20250307-winbond-6-14-rc1-octal-v1-11-45c1e074ad74@bootlin.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Acked-by: Tudor Ambarus <tudor.ambarus@linaro.org>

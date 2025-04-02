Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F0FEA2E3385
	for <linux-kernel@vger.kernel.org>; Wed,  2 Apr 2025 15:19:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743607145; cv=none; b=dEfz2vFazH+Jf9gvyNoTkNxw04dlPeM45ELoE8qH+QyjqPTU7/dSbZMrLj1F/41OTYpvMFT0594G3GSGLTcolDC1ihDx/KFyobdIrj6zEKp7V3e2C8PthXGntN4d9Xhw7UJTYeSN5aKLc35UikxFbQREUwKcPrvLVb7QlF4htvk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743607145; c=relaxed/simple;
	bh=GlysUqLOtsPNkV/QiNl3yOcjs2Ox34WviGlejoVRthA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=FB6DJT602WsrN3WjBvJFiiXxFPU3t6GmBZZKpw/dqSK0RRW1beF4KVWFUfOxEFUfGD4cry2abT7G5RUCCQRxI73ii73UbPeMhy9B2tdWaaKSLHnd8Wp9gjP3DA7Qoi2KCfSGpoNi0j0vQ177f3KFDLXwWSVvFfDZVjg7WlLWgdE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=dODhFCJM; arc=none smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="dODhFCJM"
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-4394a0c65fcso65908845e9.1
        for <linux-kernel@vger.kernel.org>; Wed, 02 Apr 2025 08:19:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1743607142; x=1744211942; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=GlysUqLOtsPNkV/QiNl3yOcjs2Ox34WviGlejoVRthA=;
        b=dODhFCJMqLVSaXoqJu7+CDJvwPa7EB5FON6uWsfLPEW8x61Ah7JGChsVD6sOW4+M1v
         vuIf4M0KUh/eFScmtfVULCZ419uuUmN6PmO7I0zq4RaTzoUcQUi7+D5ig4gjpgMjqoQW
         NqHFhaM5NDK3pPLmtigyhaZrP11nbXC6+LZR9PB2lESKPn6xXa1dntS15FGWQ4KcmIuH
         6msoWFWNpe7mD+9mr5Vne1epnk8TQMbJFSVXTXu9DXV2b77CrZaDDTi6vAQyJj1XEIwM
         ZG7qZuZKjwD9t3F9+toismdB20oLKUiFbHohqRkGCbKjtcfRTF2WAisY4Vts5no5A8aa
         vGEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743607142; x=1744211942;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=GlysUqLOtsPNkV/QiNl3yOcjs2Ox34WviGlejoVRthA=;
        b=ugpAjmc/Sh9KISfFSCSzbQDx2xA5RIEUXuODRERs3Un9dx5c5PUKaDOTe9L9d192YU
         yf/vctJmMIAduRMT26w7Ld/IHXbE396JEsvfEwwNJEn/zFYP0YNqWg+Lvw3hFoTBdrQK
         0k55qT2H5ovJPkb5lqE59VCfczTm70wDqLSwTfKVJ3yhPdbvCRz67EJa0NeRSnQwlKYZ
         PkywKwWWjgauSAZQ4GlO55UcAVitkvqx6d8GzpQcL3EI0B4mpo2Ya4Z32zdYff5ywHFI
         Htn77G4xbMZKHmn3DkkeZihfFHKi2CcsBz8PGGt3abePcKFBwmplmwWmnT6GhPEA5VTf
         IiZw==
X-Forwarded-Encrypted: i=1; AJvYcCUWscMUvSs0o4hdJMmhXtNLfin/fSvykcUZduKASSreybQDDgRp87SAZ0j7DPVWJYS/1HqjC7ki0Gzs5vM=@vger.kernel.org
X-Gm-Message-State: AOJu0YxhHZRefVzUQfuliysUmfYQ3ojw0rowM2F4THuJLvckuuMAdZ8k
	ib3IHuHRBklrQ5X9svxIEcxEl1v+O7Cq5OGyWXaYSOUBoR7Sh8aVdK395N4cEJI=
X-Gm-Gg: ASbGncvOR/YOH1unWWr80I8xZvIdCSvl9EAHKF766o/GjhMdoAT5yzKnKvVxouLE9qC
	1Pu3Ei7ERgJzKhYwEEbOeDNk1gFjWU2onxIr2IgI6RIn7tu6820t+5r1Wos5rhZa4eubSLUn98P
	3aG7exWFE5hjv7ayVtpPJRI9/rAjdT5w7Fc4Mh0EX5yiVgmnUjWdF+ld89Wuz921nPt4LitYVsR
	iUfNp0C4bCVham9KHHLSYHwEJOI+Ly9YWc7h8We1Fe96+B9xANpjCZAU3PH8PtuvCZxJ6BUg8QY
	akoDrS5v5Phrbwyqk5xlD4Yx7F7pesjj2jwMx4feZkgXRQhGJPBWXg==
X-Google-Smtp-Source: AGHT+IGwv2MsdCnsG2Kqybof4F/W5PPqZj6tCbp/AEjtdMPrsS/kXPnFlt7D8CDkoHBhANFtHeAn0g==
X-Received: by 2002:a05:600c:8411:b0:43c:fcbc:968c with SMTP id 5b1f17b1804b1-43eb3af4581mr30858685e9.7.1743607142241;
        Wed, 02 Apr 2025 08:19:02 -0700 (PDT)
Received: from [192.168.0.14] ([79.115.63.146])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43eb5fd0a46sm24297325e9.9.2025.04.02.08.19.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 02 Apr 2025 08:19:01 -0700 (PDT)
Message-ID: <3ebd53ef-c7fd-4c8c-96f3-32e97b355b6b@linaro.org>
Date: Wed, 2 Apr 2025 16:19:00 +0100
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 15/21] mtd: spinand: winbond: Rename DTR variants
To: Miquel Raynal <miquel.raynal@bootlin.com>,
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 Santhosh Kumar K <s-k6@ti.com>
Cc: Pratyush Yadav <pratyush@kernel.org>, Michael Walle <michael@walle.cc>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Steam Lin <stlin2@winbond.com>, linux-mtd@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <20250307-winbond-6-14-rc1-octal-v1-0-45c1e074ad74@bootlin.com>
 <20250307-winbond-6-14-rc1-octal-v1-15-45c1e074ad74@bootlin.com>
Content-Language: en-US
From: Tudor Ambarus <tudor.ambarus@linaro.org>
In-Reply-To: <20250307-winbond-6-14-rc1-octal-v1-15-45c1e074ad74@bootlin.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi, Miquel,

On 3/7/25 3:08 PM, Miquel Raynal wrote:
> -static SPINAND_OP_VARIANTS(read_cache_dtr_variants,
> +static SPINAND_OP_VARIANTS(read_cache_dual_quad_dtr_variants,

why not read_cache_single_dual_quad_dtr_variants? I see single dtr too
in the supported ops.

Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C9D117A30B
	for <linux-kernel@vger.kernel.org>; Tue,  3 Jun 2025 07:32:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748935941; cv=none; b=hknXwQrK9jSL+FnuEjvGEtOoQ4gLwraqgUTedxhhez7Rrt3s/ZGJ3oYXcXi2//+nEmBiQHGcffP5jflqVSlU0P9Pe5Rc8s5lZdbySXe+f84drGRMZZqDjwcIrskEhTx1OTtk9XSNnbxuWwNxM4i8kh3fzpd60sUljW6yBEwKDqA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748935941; c=relaxed/simple;
	bh=7OWKIKpTndM0kBof1G+qEOKPlq9NYNPo+aQ0RL1rxPA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=tC0if0FHkhafzleajQ9s1M1qkWo5apdt9eOAgu1XnV7NXI7p3xSJtBYAGi0Dmzd6rORdmx/AhTKHXlzTNdHT+zwrAjiAsKrcLcrzug6934okZmo6UaZVE+mWBkLe0wJAftB29uKKCwyf+0Ii5nD47hcOmJXcn67ZAcEQLrOjdWA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com; spf=pass smtp.mailfrom=rivosinc.com; dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b=hzqFuEtA; arc=none smtp.client-ip=209.85.221.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rivosinc.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b="hzqFuEtA"
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-3a50fc819f2so990171f8f.2
        for <linux-kernel@vger.kernel.org>; Tue, 03 Jun 2025 00:32:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1748935937; x=1749540737; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=aq7+7aAzhRuHvWv/wqDQgLuDPLn9fzxK9ieIK4J/fJU=;
        b=hzqFuEtAaQRBCR3nOD+cUORYBNBMPVCzrJ78ofFSPkLa4MybdjIDQHRZnp5VGl9ZYD
         fvgD2if5Ph4vB+yPxPNnb0BceeLWegNzXHUcbEWWGpVtDNMNeTisPvYmwLzr5EO9Gpr4
         /csivQsoJyRvL5OKawBTnHpasdzwgYR9EJpQylEKXgfAuQVI/G0LtKnUaTChonswkcz0
         RVfRSyVl0cYSrE+rDEEpjj12X2wb5dd3MuAjLBsmcPuZiewHnmDzBMcLVDnXHG2CAlW9
         VqpVmM3dZhSmF7SY385Ki6NNYAiky9JhS/fLdnx2Dr/lLL6Xrai9BtaB+o1hPr3Tgr8L
         eTPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748935937; x=1749540737;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=aq7+7aAzhRuHvWv/wqDQgLuDPLn9fzxK9ieIK4J/fJU=;
        b=KcbQdnMTz9U0dmoAVkh3iWwKcRAOmEBNgYfHJ0QJsKZt+t7+Vd2ydEXeACfdw/NuwK
         q7yj6IlY4CUoUOMzzaTeemY5eSwQv5xusELJqnG0SE7qrn82qE60H2RlZzxVlFspX3uF
         uUXr76w5oSG8Jl51pxCNu1vDT+HdUIJ8PHsidei9CUlFJgVdlwbJvL43Lc4HJveZRFTM
         7fPI/cxVmSM2SHc99BhaRw96mcvBB4SjE62cy0mjuA0QTeowT4Uc17KAg/fCiR4ufzT/
         uwW/4vP+qhMl3edb0jg4IL1pGlpvvGmVcVFC/VlnsHenB0+EsDVcUAhcehWouGKADOHw
         xAYg==
X-Forwarded-Encrypted: i=1; AJvYcCV8C8xuY/T1yWs8WIB/KHftDycfTFs0dABwMzY9BIUWBYcGaeyjrwC+yU8LNNy3DA7rYkMMUxPTq9XFJTI=@vger.kernel.org
X-Gm-Message-State: AOJu0Yzbf+EeD2yYcasdyPdIoYAfuFbR9H/XZyRmQXwt8aLg4lyPZptS
	6R/uryVnnxmNunOo0jwy88u5dxceN434qE0Z/w80Pre3kJsDcIvGFx7suvFgC/4Q+e0SLT+yFcs
	gLEyer9A=
X-Gm-Gg: ASbGncuKU0if03leSchaBZwDbYFOwIBHxXGi28K7AGH0vGC3gGraLxVh39rZ4cspTSQ
	OfDuW7YrKFbayT0uzQj+5Yzo2oHlVbB4owQKPJq11VnyXh1sWp9O8VNsNiQ5ByTrUXxqGAi1P7d
	mJBjTu7BIM4pkChXF4nqfSiav4eVQUGGelU3cSuiUJx/f66+TCq/RE2ic9aUbWzDjpgucQFlR60
	Ug3Cu8D/mv10WvYvGWZkaoKgykl2kYy+V4/SxGbHjP8P6RLrBK+4qe1Sld2nYAKNNyLpDrUDWET
	Hib3fCPDy6+EQlCfbzFq5NU+Bb0e6BwKwnrZ0kwxJRpJoHL2j42pQa5NOraML5qees1t/VPHxW/
	cUNKssd5UHFTRjfnm6SSRVH5/APgkPdo=
X-Google-Smtp-Source: AGHT+IE2Mi4Z5YOiT+njzLQJlKfwA90YUri5XXdIsegDd6XhhsCquaKIJI0LZ5JZkaOJxhmlsXj2+g==
X-Received: by 2002:a05:6000:40c8:b0:3a4:d83a:eb4c with SMTP id ffacd0b85a97d-3a4f7ab1c5emr12846078f8f.57.1748935937440;
        Tue, 03 Jun 2025 00:32:17 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:e17:9700:16d2:7456:6634:9626? ([2a01:e0a:e17:9700:16d2:7456:6634:9626])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a4efe74111sm17733484f8f.56.2025.06.03.00.32.16
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 03 Jun 2025 00:32:16 -0700 (PDT)
Message-ID: <352704e1-2ef7-4141-a6a9-896981d8afa1@rivosinc.com>
Date: Tue, 3 Jun 2025 09:32:15 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 0/3] riscv: misaligned: fix misaligned accesses
 handling in put/get_user()
To: David Laight <david.laight.linux@gmail.com>
Cc: linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
 Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt
 <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Alexandre Ghiti <alex@ghiti.fr>, "Maciej W . Rozycki" <macro@orcam.me.uk>
References: <20250602193918.868962-1-cleger@rivosinc.com>
 <20250602220855.519e23e5@pumpkin>
Content-Language: en-US
From: =?UTF-8?B?Q2zDqW1lbnQgTMOpZ2Vy?= <cleger@rivosinc.com>
In-Reply-To: <20250602220855.519e23e5@pumpkin>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit



On 02/06/2025 23:08, David Laight wrote:
> On Mon,  2 Jun 2025 21:39:13 +0200
> Clément Léger <cleger@rivosinc.com> wrote:
> 
> ...
>> The second solution was the one chosen as there are too many callsites to
>> put/get_user() that could potentially do misaligned accesses. We tried
>> two approaches for that, either split access in two aligned accesses
>> (and do RMW for put_user())
> 
> You can't do RMW because it is visible to other threads.

Ahem yeah indeed, so the only way was to do individual lb at least up to
some alignment.

Thanks,

Clément

> 
> 	David


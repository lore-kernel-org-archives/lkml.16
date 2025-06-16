Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 73F9D285C80
	for <linux-kernel@vger.kernel.org>; Mon, 16 Jun 2025 13:10:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750079445; cv=none; b=iZbizuOfSjdirj872KQFfQVSkoL7g68WIT2Xowow6/sF/2xOtf/TDadXmKfYc7J+8+F86ckHqkYB1KEYQLvYq0ThR9nJFiS2SUoyZQOm24rle7JIBXfUhkTBUN7fOkf/SBu1HQW+eNtfiCeuexvZix19bKiWfRFtlqnTK+GOTJA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750079445; c=relaxed/simple;
	bh=pFqG/js0pAlqzBZAvPKECVmOa3/ZW9gFrsfeSebvWj0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=g1i6msGSo/LEFtYmYgMZXxE4jl6ELr/yUEPaPaI2FKKqojtGqPUNVs6lCkjoInA/6/wlObukuQoohCsg3Pmim5GGzk9WUYO53NMsmWcjut+DvINJTg/rzJbwdmpUrO2rDiwgzKM+kvgZO+5OkbJbPagsjPby/haD2/+FnW74zro=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=T9RQ2btZ; arc=none smtp.client-ip=209.85.221.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="T9RQ2btZ"
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-3a503d9ef59so3901157f8f.3
        for <linux-kernel@vger.kernel.org>; Mon, 16 Jun 2025 06:10:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1750079442; x=1750684242; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=x1cp+4QPv/1PUyqDV9F6cY2KZxx/RBlLdAVmrPE1MfI=;
        b=T9RQ2btZgx+EAZpkOtkYQEPfrBSmU5Fu9FRQLS0vcfsZzDvM29PG0/KCu3UFR0cWO1
         89CEPTRzHf2ulCOc8wfAeNMFXCOC8zHpsmzilFulmp4kYQ0rDtBrBWjFtQN5My6aiyoQ
         B+aGx/rjh7VA7zyjFzvFaSvUD7BQJklEJC8NtGENk27FFKccQrl5xY8aoza7pi+s4Zdy
         1ddjI0cFXOb7ycUjigQzfB8WrlzKR+Aa9oGmiE2WgpXi0O6OE1a5osvPXuhncSCnaJd8
         4ZHM82kGbgeu01O87AUaX2CZOFEl81ACul3KsAmTsuf3dXaVuKHT5TFoJFB6et2+ql1I
         7yTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750079442; x=1750684242;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=x1cp+4QPv/1PUyqDV9F6cY2KZxx/RBlLdAVmrPE1MfI=;
        b=CBKTyam7H827IazGVGc5El4gUSQJ6hTjorM0L9YNbyw3mLE5E8waui6OCF6hRUiXwr
         ukX1jZPa3RKQIFyvfX5ruAsBTd3aCTgpKZwOICNowVfk3g3KJF+hCodJv041exlCNqnK
         IceTYZEqPcsMkDskCFEVv+eKTnMS0ykL1IL/38CsN2SMf7aokB4ablq2RNu9L4odF5DY
         xS1cE3u9+57KE+c1U6ARgzGwATb9/fnh9Az4LjQaTBTSV1244+0SQuCr97VTWGfub8rT
         toBai88pLKhGvJh6PjtV9wl2J447Jgqabl/bdv6nNF430RT/NPSYaUlqBAUQuvwVon/i
         KnGQ==
X-Forwarded-Encrypted: i=1; AJvYcCX1o1wrWGdfRsOiP6iJzjkm3cKYCzyBaR4A/b2khYSTN4Wbkm2AlPelhfnXWnowiPR5zVcYHU4fSZVlIa8=@vger.kernel.org
X-Gm-Message-State: AOJu0YyWMKN/LTCBnxkL1izNF4ErXqjBuTsxkfPvPIDSxrgQqbcMDq5m
	T6MupkzsVrD/INzefKaveMprBjtnSPCeZZzUgEvjGkR/FO/KZhpppLuon8oubI9kvB1agZasd6Z
	yNiU9
X-Gm-Gg: ASbGncvaceInf0vzHrxf1WxlUJsKuQ+ez5Bc5mkYQLPBV2guvPzKwUqEELW/46QSvQm
	WpZag++ZzlEJAPb5cDzBMEmfvfS03tgFuykT/+RwNRGP2+3W6/zM7vj2U5jKP0jH+BXF0lP8W5Q
	OZ74MCHJ5xMerlu8Y6hruprStQ14VPolRVj3xnHddH9Q4Mq5+CINcTNaksx3MnSGZnEQJgGhApp
	UyKcBK41IJzYgJI6u0AnjDTLf3sfKJg7MwUNciMSalHyf/NMivcrsu71NCEFS5F8/C8IR0/H2sf
	Y9/+8jy02OCulOiF8eIRROCs3Q+hckJJFHDv34Vc92ezjfGdWbEOMMCzJK4VhLJUMJkH01ESS38
	0dQ==
X-Google-Smtp-Source: AGHT+IFNHg0hyF1PNKI8qLbgZNCoz4YroOmMfvQ93hu1uR9eCFCC/xZl5Wbo20JN2FbWxFzP2HZ79A==
X-Received: by 2002:a05:6000:4284:b0:3a4:e6e6:a026 with SMTP id ffacd0b85a97d-3a572e6bb83mr7546401f8f.28.1750079441882;
        Mon, 16 Jun 2025 06:10:41 -0700 (PDT)
Received: from [192.168.1.3] ([37.18.136.128])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a568a54aeasm11271121f8f.14.2025.06.16.06.10.40
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 16 Jun 2025 06:10:41 -0700 (PDT)
Message-ID: <7cfcf919-3c7d-4f0c-911f-697ea3141080@linaro.org>
Date: Mon, 16 Jun 2025 14:10:40 +0100
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] dma-mapping: Stub out dma_{alloc,free,map}_pages() API
To: Christoph Hellwig <hch@lst.de>, Mark Brown <broonie@kernel.org>
Cc: olteanv@gmail.com, oe-kbuild-all@lists.linux.dev, arnd@arndb.de,
 larisa.grigore@nxp.com, Frank.li@nxp.com, linux-spi@vger.kernel.org,
 imx@lists.linux.dev, linux-kernel@vger.kernel.org,
 kernel test robot <lkp@intel.com>,
 Marek Szyprowski <m.szyprowski@samsung.com>,
 Robin Murphy <robin.murphy@arm.com>, iommu@lists.linux.dev
References: <202506160036.t9VDxF6p-lkp@intel.com>
 <20250616111749.316413-1-james.clark@linaro.org>
 <20250616112927.GA21689@lst.de>
 <5f1ca0ac-b66c-4b92-8f69-027c2468b117@sirena.org.uk>
 <20250616120832.GA24959@lst.de>
 <2d62254e-5cbe-4174-95d8-e80cae4f4543@sirena.org.uk>
 <20250616121444.GA25443@lst.de>
Content-Language: en-US
From: James Clark <james.clark@linaro.org>
In-Reply-To: <20250616121444.GA25443@lst.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 16/06/2025 1:14 pm, Christoph Hellwig wrote:
> On Mon, Jun 16, 2025 at 01:11:49PM +0100, Mark Brown wrote:
>> already tied to a platform that needs DMA needing to add the dependency
>> which nobody is going to notice without doing build testing for
>> randconfigs or similar non-useful configs - it's not a productive use of
>> time.
> 
> Stop your unproductive whining and just fix your dependencies.

The change introduces consistency with the existing declarations in 
dma-mapping.h. Surely there is value in consistency and it doesn't do 
any harm to define new ones with stubs the same as the other ones. That 
way when you change an existing device that has DMA stuff to use a new 
part of the API you don't have to predict that it will behave 
differently to another part of the API.

I suppose it is possible to #ifdef out the DMA stuff in this driver, but 
IMO it would be quite messy, and I don't think randomly not stubbing out 
some functions is the right way to move towards fixing all the 
dependencies in all drivers. We should continue with the stubs for now 
and fix whole drivers one by one as a proper effort.

Thanks
James


Received: from mail-ej1-f41.google.com (mail-ej1-f41.google.com [209.85.218.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB63B221DBA
	for <linux-kernel@vger.kernel.org>; Tue, 11 Feb 2025 13:29:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739280555; cv=none; b=gg2jrxo3TKa0HJIrgrue6O5esdhHxf5u47L4ARjNT8hR3zn1rcQEgNgU8iPibRsK7Ho1WGFJXqUVMwuY2ZNUnIY9Dq2fGmIz1xYLSfK/52V5yhunKOxXQQEesfUUcMVS2o/arEJJN7T6CYUxhpAFKnz7o95hh0mzZcB3nSSh7Hc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739280555; c=relaxed/simple;
	bh=28EQhIzZAloABY6KVc5e16b/zn7F87v2s/rBZKJ7pYE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=AH1P98yQazDUQtM7HMrsYUPjvJmJSEjUE1cQRUdZ57OsVrPltr5d4H3Ujb9UzBBFPknniXo3me+lwx3q3X9jxlXfXPJaOi4cVnuHsE50IaVSyW3hYcw6O2WyffoRs8jpH7WVOuW9XfjWq/glb7oz51h/q1eA/kMV4r9oId/MDXc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=RARkHDC0; arc=none smtp.client-ip=209.85.218.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="RARkHDC0"
Received: by mail-ej1-f41.google.com with SMTP id a640c23a62f3a-ab7c07e8b9bso368629766b.1
        for <linux-kernel@vger.kernel.org>; Tue, 11 Feb 2025 05:29:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1739280552; x=1739885352; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=kpvPLOOINv/frxyxwmysjCgFErFPhWO/M9fCpiOC1SQ=;
        b=RARkHDC0ZJ5Zdf43iZjE8DKJ4yoZb1pliPPqDOcCTaQqAvWnSpRdMRbr19N9D7aUkL
         UYC2oorwIgZwlvTCuePTFzU+D5JMFP+/IEDdwCUF6MMskFLgr/6s+Jmx7iJeE+BVwvD3
         mZBcLl2mog5aiKYjHHoqF+c6ODCqUlbt4xKLQlAyMa4Y81gocup9V4vKP4hXM7f8WQHd
         IN0lR1pFhJs60pQQJcCepGr7R3z82NGLzfZuQ/HVzrh6tKzDS/j321CGungTFb0fooNn
         nr1lIYzH3YY83tEm7tvox+YPh48U8pMwjXCs0rYDmHbfY3SACymRJj6iybLsw+cqyln9
         IGZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739280552; x=1739885352;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=kpvPLOOINv/frxyxwmysjCgFErFPhWO/M9fCpiOC1SQ=;
        b=gF7Lzbb+j1hQR6erXA03omjOo+/fbj+IyVPJW8KsSVaWXfqSCIRf/EaelxDcc51fkj
         gX0ewlNvhY+zo+bLyZuvdL/GJNajI8xptvxPjnxJOe6zBI384Ur7n3L6iUMzTRUx+BGQ
         9lCJB5s8BR5lvkZ5cwD1Oyy7rLF/gz9bqHC7VJPjsp8ueVRiglSCOzWf6bVFsM1hL17E
         GJZ7x/CZecsjV+vZnIUZdyLJYZHa8Yd72VxVcxRtYkoKvLaoBPtsyXtvt8FtK9NBjcox
         P7a+JlAADtJY85/7EA7owUthwlVzYESKm249hMOcQfd2Wl+P3u4zGx0GjsYAlYYTT9us
         YYRw==
X-Gm-Message-State: AOJu0Yzo1iSQS+TT5QItSOsPm2HIYk01mFGqryqrmad09yN7ZyN9OStw
	XHMhtMvoUT4HcGTk5TJOKko1fDeHTPwQkTw3h4Vg4KRx+KERk6M3uH9z1ZSs0eE=
X-Gm-Gg: ASbGncvPnZQB11yGjGclDdfeoPNTnkBfKTyNfUmC1hsW9yD8mAVdjgUgdtXQQg4ZFuX
	TSs8DwAeRHZajCcGCtQhHj3iNgEJF1AHXA6sR+8bWCpfjhMfs24iZPXhCt2lA1XUZlsbqIhm+QB
	F87iAd6+uVYC/RdtoRTJHPKma2S1rRN2LfB+CraXLqDkSe91n/3pruQAri/N6zbyJBdpjHbtBO8
	zTmbGc5kUsqY67HgwzhGJ+Hl0XBgy2yWkHr2rrPeGWoADq6vxC5TJHOhl440jCsY/Ky3qR6l3cY
	W1ZU6HxM4xHcvUkKVO5vqA43
X-Google-Smtp-Source: AGHT+IH2uOyoJcA50C+YALBKh/r20YQ1PlbDUm5tBy6s+a85ihdbDttjIy36Ad5qWXPkClRkh/FA4Q==
X-Received: by 2002:a17:906:4fd1:b0:ab7:6369:83fc with SMTP id a640c23a62f3a-ab789c3dcd0mr1900912066b.38.1739280552096;
        Tue, 11 Feb 2025 05:29:12 -0800 (PST)
Received: from [192.168.0.14] ([79.115.63.124])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ab7832a02fcsm970546366b.94.2025.02.11.05.29.10
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 11 Feb 2025 05:29:11 -0800 (PST)
Message-ID: <1daff001-4769-4aeb-83a6-dafbe84fb39b@linaro.org>
Date: Tue, 11 Feb 2025 13:29:09 +0000
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v8 1/3] dt-bindings: firmware: add google,gs101-acpm-ipc
To: Krzysztof Kozlowski <krzk@kernel.org>,
 =?UTF-8?Q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>,
 Diederik de Haas <didi.debian@cknow.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Alim Akhtar <alim.akhtar@samsung.com>,
 Jassi Brar <jassisinghbrar@gmail.com>
Cc: linux-kernel@vger.kernel.org, linux-samsung-soc@vger.kernel.org,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 kernel-team@android.com, willmcvicker@google.com, peter.griffin@linaro.org,
 daniel.lezcano@linaro.org, vincent.guittot@linaro.org,
 ulf.hansson@linaro.org, arnd@arndb.de,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
References: <20250211-gs101-acpm-v8-0-01d01f522da6@linaro.org>
 <20250211-gs101-acpm-v8-1-01d01f522da6@linaro.org>
 <D7PJTD3PSP78.27N2S94J2CNZG@cknow.org>
 <bad87f30-0483-48c1-b263-02cc752c77e6@linaro.org>
 <a740a0211c82aaaa55940e2f07e1d1b53c23ddd8.camel@linaro.org>
 <e2bdc9aa-2cbb-4fcc-8c73-5fcdad6e18a7@kernel.org>
Content-Language: en-US
From: Tudor Ambarus <tudor.ambarus@linaro.org>
In-Reply-To: <e2bdc9aa-2cbb-4fcc-8c73-5fcdad6e18a7@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit



On 2/11/25 12:05 PM, Krzysztof Kozlowski wrote:
> On 11/02/2025 13:02, André Draszik wrote:
>> Hi Tudor,
>>
>> On Tue, 2025-02-11 at 11:57 +0000, Tudor Ambarus wrote:
>>> And then I shall s/MODULE_LICENSE("GPL");/MODULE_LICENSE("GPL v2");/
>>> everywhere as "GPL" indicates [GNU Public License v2 or later].
>>
>> No, please don't, see Documentation/process/license-rules.rst.

Indeed, thanks, Andre'! The tag shouldn't convey the detailed license
information, as the only decision to be made is whether the module is
free software or not. I'll keep MODULE_LICENSE("GPL");

> For the rest of suggestions here I also recommend rereading docs. I

always a good suggestion :)

> don't get why we need to change "GPL-2.0 OR BSD-2-Clause", but maybe I

I reread the docs, LICENSES/preferred/GPL-2.0 says that:
'''
  For 'GNU General Public License (GPL) version 2 only' use:
    SPDX-License-Identifier: GPL-2.0
  or
    SPDX-License-Identifier: GPL-2.0-only
```

the two are equivalent. The downstream driver uses "GPL-2.0-only". I
think it'd be good that everything that I derived from it to have the
same SPDX value, for consistency reasons.

Thus I'll amend the license on the bindings file and on
include/linux/firmware/samsung/exynos-acpm-protocol.h only.
I'm not thrilled about a new version for such a small change, but I
think it's worth it.

Thanks,
ta

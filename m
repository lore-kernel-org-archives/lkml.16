Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9AAC21E0E0A
	for <linux-kernel@vger.kernel.org>; Fri, 31 Jan 2025 16:23:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738340601; cv=none; b=oHCOLUpr4q9i9egOh+UUTtW+J5nKBcsCnV8ZzS2GwVaCEc/yvjK2uF0/YP5bikC0liN5LCrzElvt5jYVNA69G+6H4cb9p/DFgxoFcaTY749iQC0SLuBF12Ys15uJsLcsFCUEQ2W3Rod1puxE5/qA+DJlsqCn0FwKgXh4ijg46wg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738340601; c=relaxed/simple;
	bh=XR5lx6T2OZX3TvgFfUCQ2wqoocF1737mUfcufcBWu3Y=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ixIfFtoc7lpbjfr5zO+YwEJTiO6XzKaHYqfEDT6gCrF/gIdEW9fluNDtD+hVpE0ZtLesbdtR5X4LUf/lZh8miOXV0tgeP4eymnF1Hvs2n41G3AGkIUWYPdLuFfZ7g253NE2h7pSkjIARLFIDphm4PrroOOgJaFKyaz+VSAxrKQM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=vxxKAnKH; arc=none smtp.client-ip=209.85.221.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="vxxKAnKH"
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-3862d16b4f5so1387543f8f.0
        for <linux-kernel@vger.kernel.org>; Fri, 31 Jan 2025 08:23:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1738340597; x=1738945397; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ccsQCvgWKqv3yygq/7Q/nlBWnWSWfZGyLmBYGuzRwP0=;
        b=vxxKAnKHC7G4bKKCD04ERw4VFCG+qDpfzIw8T5IhExw0kBfT5A3ksQ+YcPVtnAfgFK
         5Q69tOkwHXS0BQGfLl5++vpUDVqRb0vGoHxGdnSKA9yOpbhFfQer3qVAlwO91UiN68ez
         lYgOCvkiTAz0mnKl2/jWuRRyYmlnLU4o9orCRm4aPq8hq819x0SREQm8p9P4TiTEeyAv
         kvuhbnh/n/KLMIeXQPOuzb33Ub4r8RVNi7Jrf3pfn39D/nVDODSdTecNYKI3wd+C2M7x
         UuUQR+8s9T+DcTVOrJzlVTcOaYPpwyALmZA6oi9orncB2ZLwp9bPbsU/npJXJJgHYb9v
         hr4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738340597; x=1738945397;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ccsQCvgWKqv3yygq/7Q/nlBWnWSWfZGyLmBYGuzRwP0=;
        b=R7foOaAzgcvCRyfVZ0FF7PN53sDcr1WeBdzrSWGxC88NHOBgzdafOtyB6VfIpRo2H6
         U2XW0fPiw24Z6sEUkjsIIxzuz93fOQphW/I9MmEk7XgV0lrM9/EiP6X3xXPED8lYxN2G
         WCIipA+ZxPMmD79YQXRGVf87ZCbDUfOxOQTCOLFFt+7QpwO4TMa8hvfWxx3hxS315jMv
         sCxrG0czEqXCkdQmlLyCP5vQAddcEx2VPfN1kPeWqzCC/utTZ4daeHHkweGFtyS1yTvH
         eKUoH1LQA8MsMNAJQ5ifuaYwI9fFHfQrjBEP666OjNYMwHKw1g58vDMCw+2qQDSj6tJC
         /q8Q==
X-Forwarded-Encrypted: i=1; AJvYcCXElTruWc+UEt8zkvo++uqK0B/CkIk0L73I9mHijugDNjTViZmwiQWEhUPj004mdptAjrt3b3xu/Tlug04=@vger.kernel.org
X-Gm-Message-State: AOJu0YwqsF98+qfYhV/uJ9631hKLoG2SdvfcmszS+fCtmgsMIx4pH4Vh
	zHzr3tpOWdECB0kmREQ/ANoEXsBrLBApYET1movfjZP7IiDCjIuuNRgAcm8cbC0=
X-Gm-Gg: ASbGncsRDn8qb4uUuFtF+JiBxORID4GdUUDi0No2t3D73AX+YYaXbYE/8XJ51DEv80N
	I3Iu+mTIH5jDuWHM5CNj73AqZJL9PO+36J4WpPrNaK/gsSZP7ypcy1aYDdOOPbL86BOWvrJVGrY
	N6VqBexAMUe/RYYxf0/jLaN+ljRO/kY0vaWuScQKvfPxzxC9sk8r7iZVLIGqgwK4Wjjzuo1dKMR
	TENHzO3Bmt/AT9evlLIPKNNq+HQhN26GAgWa2aYxibPsW7gCd3ts71qhBet4My9UwurNOehXECo
	QJPEOPOeh1SrfHVN24tps6AuQw==
X-Google-Smtp-Source: AGHT+IHjR1HpSI+OxXVo1rJx/d3HvscdknUv4GZNTW8wQmSNUAcS/oELkxUcnST2xhCMAatVE56veA==
X-Received: by 2002:a5d:59a9:0:b0:386:4244:15c7 with SMTP id ffacd0b85a97d-38c60f7788amr3570705f8f.25.1738340596916;
        Fri, 31 Jan 2025 08:23:16 -0800 (PST)
Received: from [192.168.68.163] ([145.224.90.107])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38c5c1b576csm5113346f8f.63.2025.01.31.08.22.28
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 31 Jan 2025 08:22:44 -0800 (PST)
Message-ID: <0ee49250-47e9-4719-898e-644b30ef8585@linaro.org>
Date: Fri, 31 Jan 2025 16:22:15 +0000
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/2 v3] perf test: perf record tests (114) changes
To: Thomas Richter <tmricht@linux.ibm.com>
Cc: agordeev@linux.ibm.com, gor@linux.ibm.com, sumanthk@linux.ibm.com,
 hca@linux.ibm.com, linux-kernel@vger.kernel.org,
 linux-perf-users@vger.kernel.org, acme@kernel.org, namhyung@kernel.org,
 linux-s390@vger.kernel.org
References: <20250131102756.4185235-1-tmricht@linux.ibm.com>
Content-Language: en-US
From: James Clark <james.clark@linaro.org>
In-Reply-To: <20250131102756.4185235-1-tmricht@linux.ibm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 31/01/2025 10:27 am, Thomas Richter wrote:
> Change event intructions to cycles for subtests
>   - precise_max attribute
>   - Basic leader sampling
> as event instructions can not be used for sampling on s390.
> 
> Thomas Richter (2):
>    perf test: Fix perf test 114 perf record test subtest precise_max
>    perf test: Change event in perf test 114 perf record test subtest
>      test_leader_sampling
> 
>   tools/perf/tests/shell/record.sh | 53 ++++++++++++++++++++------------
>   1 file changed, 34 insertions(+), 19 deletions(-)
> 

LGTM


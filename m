Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E59657263B
	for <linux-kernel@vger.kernel.org>; Tue, 27 May 2025 19:15:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748373348; cv=none; b=kODbtmEKrmfQObqPJJuc+mSvtYTx2ePCYDSzZDf9ugrcm3DHLq0iKj25dqbA8rQVDuV3hV7v7jjm44h4s7qQTdvJnBo/daRVjgvEJnpCsQb6Drv2dCrn7cDUgNvMPbo5gYEtJxVVc5wKGH2Dnv8/M0P/dBc0xKkMFckz2jROtuU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748373348; c=relaxed/simple;
	bh=L3tOSD5DIP+NZYlj1MgZADF7QcbCt95OaLv+03UCZpM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=IZSHgSa5vvSkD3Vg/eH2N/t9AbwlKQybwjrRqw3fbGAcvnjw+kw5HyVhE5W8IMkibzlO4Sk87YvVRZsDnuIB+eDCbh+/1jGhD3/rQF2jYNv776Y2ohk1ycuwgte3gWvD6rmiT/SCTVpKX6pJS0mYCr49cWB87ko9IJ5gKtCa3Eg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=qu7xRP0i; arc=none smtp.client-ip=209.85.128.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="qu7xRP0i"
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-43cee550af2so1345595e9.1
        for <linux-kernel@vger.kernel.org>; Tue, 27 May 2025 12:15:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1748373344; x=1748978144; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=+HcKhV/Xs0AKDqWeZFA6BCQv4B4hxsjJUkPvSbNwcT0=;
        b=qu7xRP0i/41WHi5pK8yTN1ROz9kEkKc8vG8VlStEF4234EaysVld/xOCpiVqcvTMdA
         RSCfvKNb54+OOgy0lGC508yrfgKIO8Ax16Oer83nOycpUjVEbSpC0+zaWS7b0SqylLD+
         KkvIlSpEg0og7OcG3zeP6Oyj7v+Oktf6w4Gi3//czJ3apaeTnurm/CHlsFafpBvTEUft
         1U9cb1wnrZd3bC0vHewkHJHnu8aJHYnYzQbUtYlEmkyDcInBeOF9yv5VRfc/hMF09Q+b
         Fi1t8QC038SJDNId6C7NWU33MbjsU+cap4KXhuH+WZFZW1cknfuqpNU+C2RYvvmFhiab
         8VQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748373344; x=1748978144;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=+HcKhV/Xs0AKDqWeZFA6BCQv4B4hxsjJUkPvSbNwcT0=;
        b=WvswEu/l0eUPPXgc3wW16kKgtNj5RV1INXksrs3myWv1/9cbEXZCJe7ejZnJXWF9Kr
         hPiIjZOSLwID0G9XKLiXcyAZWDtJMnJM4m09hUzD3hsQExVw3qPJvmzusGBxu4rI4Ab/
         NsnA4mU1ORbsO9QUHHkv/VE1KRSb2i83M1aUgP0qVGuAafJEJdWMCe1fw9yOPYIhP30L
         htF+ldrLs0i+QW0dtP4Z/YR7/upqO1QbWlbnli5QF3sJLJF2Dpd6GFqj0c7wU1VReMw9
         9VxkkUSGZthQFS2ozHPiMSDl6xM04tmxVOpde++fYU240i1hQRE4rOCI76bRzjQhAXAs
         Ze7Q==
X-Forwarded-Encrypted: i=1; AJvYcCXODy8yVHoNxBE9Y2WVdbJn7TQagS+L0fvxVtAjOAWAtNJ8TE4NuPDEyHFx3od3h0vr/4uNh1usQIWq0v8=@vger.kernel.org
X-Gm-Message-State: AOJu0YyNJ+apxBciz1Estzo0R/YxjASSpyVc9EZ85PxCm8+hepbdWEjI
	IeY/Kp2QsU6g+mxGKvH8Eny79BNxoAL+ukgm80fkyGaRPH27xY9eGJto3N+RDJNd1Lc=
X-Gm-Gg: ASbGncs++jXhID41Jux6XTaifQExyhKcrOJZ9tQOjcLFBEbmow/hK415gmD5gJZwH/1
	HR5ic3DiwYwvTMfUT27oDngQNuurDlJhDfVRzZktipdb9NpCrTphBHk4jTD8EMfxz/y5kSC6QCn
	XJeD1Hv6YZ4x64+JHrd2z6iEqYVW7rQK1eMmiP5XRI6T9vnS7QOzaX3JaxdY8AchbCke1Y/TtpF
	LrQtxhMolvM+FkpRuyKfnWIIESguQFGMhcOacK6ZGLireTws0qEy2+dHJK/MBLV1HED5DONZPZL
	TPqq3L2vNqGlMm7j/AxkR0rk5LHeKrN3zothuTFh98JPTCDfklgduE3n5QsTWVdZ/d8eK2M=
X-Google-Smtp-Source: AGHT+IGj+krRA4jgeP7gnHk2YNjZeRT7qd2qhqgB8nUt/hSNomnHykJuoF/mI+VxLJyYVsLSP/PpsQ==
X-Received: by 2002:a05:600c:4fd6:b0:43b:ca39:a9b8 with SMTP id 5b1f17b1804b1-44c91cd5207mr47858275e9.2.1748373344209;
        Tue, 27 May 2025 12:15:44 -0700 (PDT)
Received: from [192.168.1.29] ([178.197.223.125])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-447f73d4a3csm284159605e9.22.2025.05.27.12.15.42
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 27 May 2025 12:15:43 -0700 (PDT)
Message-ID: <179d0f00-c678-4050-aaa9-7b7fc6311002@linaro.org>
Date: Tue, 27 May 2025 21:15:41 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 1/3] arm64: dts: qcom: sm8750: Add Soundwire nodes
To: Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
References: <20250526-sm8750-audio-part-2-v3-0-74429c686bb1@linaro.org>
 <20250526-sm8750-audio-part-2-v3-1-74429c686bb1@linaro.org>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Content-Language: en-US
Autocrypt: addr=krzysztof.kozlowski@linaro.org; keydata=
 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
 2+47PN9NZAOyb771QoVr8A==
In-Reply-To: <20250526-sm8750-audio-part-2-v3-1-74429c686bb1@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 26/05/2025 13:46, Krzysztof Kozlowski wrote:
> Add Soundwire controllers on SM8750, fully compatible with earlier
> SM8650 generation.
> 
> Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> ---
> 
> Bindings / new compatible:
> https://lore.kernel.org/r/20250519080453.29858-2-krzysztof.kozlowski@linaro.org/T/#u

This binding was applied:
https://lore.kernel.org/r/174837318334.1029846.8735268990996464177.robh@kernel.org/

Best regards,
Krzysztof

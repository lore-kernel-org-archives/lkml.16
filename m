Received: from mail-ej1-f51.google.com (mail-ej1-f51.google.com [209.85.218.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E5C442BF3DD
	for <linux-kernel@vger.kernel.org>; Tue, 22 Apr 2025 20:23:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745353414; cv=none; b=ERAGCFxlIPUFe2ymcfzi0IgBKgmyHLx1fRVTwpxZaxP1xmQi0mDkMx2sueA5mzALHUPKQsLUJTMX8Zb8RVs7mEqbOPdVA5wlXirvKjN0Di4jjgqFFR5rrRaVFxqRFniUf46SL9sk+Xiix+2SBYoakJHe7KgTNDafeQ6ctO2LlCA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745353414; c=relaxed/simple;
	bh=r7VN/7Fwi7LiN6yHe4w5kse7GPTw6IFPJr8dfDaKAtc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=r+g6lUYxVRkEao5FyHtcLdxFDfiqkigWXD/1ISK7tbtWvygPvtEA2zjRAhdCYuN1Dcsn3bXKIsWWCZj59hE7IeULK4SYGO+pLqJHU9axiZnPMX70tZ83px9daW4/hkdgKa/L6ECi4kblOfU4VhdpQHPktuPVzrLxqqvqzsToyFs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=tgq/4TT/; arc=none smtp.client-ip=209.85.218.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="tgq/4TT/"
Received: by mail-ej1-f51.google.com with SMTP id a640c23a62f3a-acacb8743a7so41773766b.1
        for <linux-kernel@vger.kernel.org>; Tue, 22 Apr 2025 13:23:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1745353410; x=1745958210; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=NKmp2FHEFAuiUwLcrSsEVcw270aFZSaF5P3fuGST3Ec=;
        b=tgq/4TT/VtgRFxTLJg57kr3MEhrwvkIuKAcR5MeiutgTY34yDHL6UaXjrtP1wZ1r0/
         LjA590VpM6nsL3dnlU96cGNouGY+ytsbTX4KyEMOzvWewyo1Uo+4/lwpAgH5UCZlzFh1
         Pyg6JufnAp3jK6C+xxEKdlm8lmnHhhoc/EypKmcDiqqEHwRG3jlIyAlerhaBuD+4eUv1
         CNmNzV4dgy9JREbuPnw9eTZTDpD6YoGJKa0wVG81dtg+lqg/5tIvEg8GlffwDsIco+bA
         fdcuTLphHYO2HSB0LQGtb0IsqTeXfpIHsHITywl8Jdu4zTlWFUAv19q72pbk+YLbxRzM
         /UWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745353410; x=1745958210;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=NKmp2FHEFAuiUwLcrSsEVcw270aFZSaF5P3fuGST3Ec=;
        b=OOFFpKwBw+5iRT8dUEHBCxE/izJrteu8gQk/wv3yWKXrcUUjChyS+f8g7UuVfw/aVQ
         CHWGtIs9bhc5sceJwMCaDI1qcv/kqp4fWpAfxAoIwHpqhvA8V6M0UbCaW0hyZOeLM9zF
         tPlbsFsQfC0Wq/Iec3VXKJ6z8GQ58T3bHwDOERrDzwjvk9d/Arind1Adain/FQy5o3QL
         aZA3G/via2I7tvyhepk8/aDVLSTMr0ctgQXB1YangKL49hdee9foonSzZpWh4MuJitOq
         EysExTQkeRUWln9ZRsvhzp//S/nyRwwqZtOBbrbyhN7vCIDLpUbpuGjtl/GRyFl0YhAy
         UM7g==
X-Forwarded-Encrypted: i=1; AJvYcCVGsik8Cv1LAIrglYQit7k/fXQCGboUqF2MdSXB+vjjwkwIGF4sCTSj5Rie9k1fyJKvcow5AMEn8wHdzAA=@vger.kernel.org
X-Gm-Message-State: AOJu0YxfMfU7TiuM7A/u7pEByrdJYqY75wz4Gn8T2lA7IIo6MlZrCLb+
	82G62uf6fx0pi1DDQy62nRDbOlAEEs7HWk63Vl6+2aHamxRcGU3xKr3KVhO9KSs=
X-Gm-Gg: ASbGncvReVGV6hgVuEnZZQRQ2PUUSjkAhXM7CRzTzHAmT+HZxQIwZFLLfva4YkPa/sH
	jiya0mq6RvVvN832AiaIS1bq5UQcldgQBS+gH1uQP8gGkh5rwAwU67iV194PG8nkCS/vtwXn8MC
	RGXnVPCnGh93D2+AOhrTyj8lXeaoLSBdDo30P9YlmwtUlCo4mBBfq8haHA8hxqE+Ium7wrap1qJ
	58XgtaIfhqnTkKjX3vvsiVmNn/lNyzUmYcvQk3KLqxhj90HQKmSB5vcBwRi32advQUG4NV1g+/7
	URED7a/OLaYpiNBuccl+TV3mRwNs6x89wc0wCW6/sKe5eyAZ1ZJBucaOPXyyrcDIiKgYlBOmgQ9
	CB1Pp1A==
X-Google-Smtp-Source: AGHT+IHDWbdX3oYlKDdl8Py4UsbyXU5LNv4eXhMD0AhhXKJZ3V/Gp5bf0YjPavO4S4LF0mBvKGNmkQ==
X-Received: by 2002:a17:907:9704:b0:aca:d29e:53f1 with SMTP id a640c23a62f3a-ace3f4e3ce2mr24940266b.12.1745353410101;
        Tue, 22 Apr 2025 13:23:30 -0700 (PDT)
Received: from [192.168.0.34] (188-141-3-146.dynamic.upc.ie. [188.141.3.146])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-acb6eefc703sm706512966b.94.2025.04.22.13.23.28
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 22 Apr 2025 13:23:29 -0700 (PDT)
Message-ID: <1a35fa10-cd83-4f36-9cc2-179c3a2a4909@linaro.org>
Date: Tue, 22 Apr 2025 21:23:28 +0100
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 06/20] media: iris: Add handling for no show frames
To: Dikshita Agarwal <quic_dikshita@quicinc.com>,
 Vikash Garodia <quic_vgarodia@quicinc.com>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Stefan Schmidt <stefan.schmidt@linaro.org>, Hans Verkuil
 <hverkuil@xs4all.nl>, Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>
Cc: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Neil Armstrong <neil.armstrong@linaro.org>, linux-media@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org
References: <20250408-iris-dec-hevc-vp9-v1-0-acd258778bd6@quicinc.com>
 <20250408-iris-dec-hevc-vp9-v1-6-acd258778bd6@quicinc.com>
Content-Language: en-US
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
In-Reply-To: <20250408-iris-dec-hevc-vp9-v1-6-acd258778bd6@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 08/04/2025 16:54, Dikshita Agarwal wrote:
> @@ -642,9 +644,6 @@ static int iris_hfi_gen2_handle_session_property(struct iris_inst *inst,
>   {
>   	struct iris_inst_hfi_gen2 *inst_hfi_gen2 = to_iris_inst_hfi_gen2(inst);
>   
> -	if (pkt->port != HFI_PORT_BITSTREAM)
> -		return 0;
> -

How is this part of the change related to adding no show frames ?

---
bod

Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D2D142BCF5B
	for <linux-kernel@vger.kernel.org>; Tue, 29 Apr 2025 09:43:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745919799; cv=none; b=ir+z/p9uFpSuQYH+wn8k4TOH9D8J5eNgFfwda+6uL5ornL0i6HU8hF1Z9msXooTaLuOHsu2YbBnLF6uDxQgrFt/MaGpJ/KMVFD83Bknqif1h+xg+3VF0IOmBbRFKtUBTUOU2bA0tcJet1G6lcZpW9MczndXOD/wEJpAlBoVu4Hs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745919799; c=relaxed/simple;
	bh=Q09MnUkSmU1kJNLenRmUBDgMxvF4hfafHFPtdjI5pGY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=D2jDNMUZVYK75T9laOR4sVsk90gl7Qz6CtLisVtgP/eoLaGJTuc2xji2cFNz/2SyPZwq89tgRdUfy+P6Ks9m4i03VBwgGDVm6hj47oBbpgGDwOM/2+g22e7smaI27AWOJL1ZJSFFW9qOHz3hFoIPtJ7T8pygi+/VLNUUDnvNFcM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=vtY3vEhV; arc=none smtp.client-ip=209.85.128.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="vtY3vEhV"
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-43cfba466b2so54338435e9.3
        for <linux-kernel@vger.kernel.org>; Tue, 29 Apr 2025 02:43:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1745919796; x=1746524596; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=QocFhOILZu7H7ECqeWVM5tXMYpo00r6XD7J/dg59I9Y=;
        b=vtY3vEhVg/WuDXGOPK191tJLc94YEsA3kv1WKoUoR2ernmHmjHb4D6n4xvGvx4B2/E
         vmbtMEdD/bCm98XbezCRoUUNZ0u+/ewIcAS7G2/nHCLy670aRyxiXIx5YlaG8MrOk+Xw
         2NqolbYVbc0BjOdXXnSONq/vvzCQFLmiYzR7EiW4LBiKrwklybvtv+ZCFIXoUz6XhWiT
         yja+yxzeO+hbT3J6/bbgEwN4bqJizF2W67KM/wk7yKLxvYfYP+kSHk6AZJqN1HFVwvWG
         qMazPW4IvzcqkdUivFMvhHcQYL1toOyqdDYEtSzfcuRx2lNGnpju90hJ1RjjaxWNf16W
         4J1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745919796; x=1746524596;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=QocFhOILZu7H7ECqeWVM5tXMYpo00r6XD7J/dg59I9Y=;
        b=hzf1tjYJgpM0As1clLskxnWJ6wbtYgyciZUaFNJkjtomIwy7JTKQAJvLRU1QSxvwll
         k45tQCUA52rYqq7X0nB3z0rnN14QBdFDwRp3xQWpFVIQ7jEt4Y63u39UF2zx6DCCDYPr
         gbYtIndW6IXKwcFjCm6JvOeiSpqzyMT9xVT1YPzICpDzPzg4smEZkdJM9NcbMCX9shpG
         m/K4Gjwugz2uQe+biu9LhYkiURmVxsoFyhZstGtXaedtQuQJv1YNliLhy6iF0LbxwBox
         ROknbcxoQWkH9ZaqHwKuODFCY48wbY/Ehe3EpfhL7SrS7QF2c8gxnvOC3+oF09ba1KtN
         HV3Q==
X-Forwarded-Encrypted: i=1; AJvYcCVOi1c+qpRcTcl3wdvjzIhtW/7SnuwB6a2j5IGCa72YegshcsbxrwWkuN0bSMoM8MQ9rGCRzFwdpn6QfWc=@vger.kernel.org
X-Gm-Message-State: AOJu0YxGPEbkZsStQMXMvGwp/mWeFczjKq53GiJs5icaKj8pnc+st3fr
	7mWjVav2bhfsWNDaWBtn6QZwLmG+ftkNa+UJYsxVqtWjWVmyU3bF4KV4JRmcTUE=
X-Gm-Gg: ASbGncsv+LA4oN1twWTNoA8Vj28qi4ze5IG6p3LZIe5K4+Hhdm+tingUAFdzWi9GvU3
	A+cFHbACiE/OjZ6eG2SwphIXqGUZ5+7SfeToqUWobJfFai+mLdLijn2NdRABLC6s+6wG465hopX
	AENtBkEniAFIrHwRHO1o/5/6Qe55SJ9Af8ybMK7u4yv0e4Xx3i+Js2aKep26WP58dgVBQbl6Fe0
	5WxW2btjua6Oi1tHvdkKIXTc68261NebgGlzVyZ0+z/D9cAgBQOH/IFdP+UQFsS1+TzYLABSHSj
	AJik1bhUEepZW35XValotElKsszJifG6DUMZkASiv2fECH1zbHm5LeSlqyVw58WaJFw6/zXNZJs
	MX5ltug==
X-Google-Smtp-Source: AGHT+IEuROoKfgnl+2smmGlqkdhXYephIa2Ni3VkuAXlZjKZuio03hMlbFyEqG6IUR7gw04Cbkx2FA==
X-Received: by 2002:a05:600c:83ce:b0:43c:f87c:24ce with SMTP id 5b1f17b1804b1-440ab8460fcmr97962945e9.21.1745919796144;
        Tue, 29 Apr 2025 02:43:16 -0700 (PDT)
Received: from [192.168.0.34] (188-141-3-146.dynamic.upc.ie. [188.141.3.146])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-440a52f8915sm156545955e9.7.2025.04.29.02.43.14
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 29 Apr 2025 02:43:15 -0700 (PDT)
Message-ID: <a056266e-612d-4abf-916f-3db49b00dbde@linaro.org>
Date: Tue, 29 Apr 2025 10:43:14 +0100
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 01/23] media: iris: Skip destroying internal buffer if
 not dequeued
To: Dikshita Agarwal <quic_dikshita@quicinc.com>,
 Vikash Garodia <quic_vgarodia@quicinc.com>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Stefan Schmidt <stefan.schmidt@linaro.org>, Hans Verkuil
 <hverkuil@xs4all.nl>, Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>
Cc: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Nicolas Dufresne <nicolas.dufresne@collabora.com>,
 linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
 20250417-topic-sm8x50-iris-v10-v7-0-f020cb1d0e98@linaro.org,
 20250424-qcs8300_iris-v5-0-f118f505c300@quicinc.com, stable@vger.kernel.org
References: <20250428-qcom-iris-hevc-vp9-v2-0-3a6013ecb8a5@quicinc.com>
 <20250428-qcom-iris-hevc-vp9-v2-1-3a6013ecb8a5@quicinc.com>
Content-Language: en-US
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
In-Reply-To: <20250428-qcom-iris-hevc-vp9-v2-1-3a6013ecb8a5@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 28/04/2025 10:28, Dikshita Agarwal wrote:
> +			/*
> +			 * during stream on, skip destroying internal(DPB) buffer
> +			 * if firmware did not return it.
> +			 * during close, destroy all buffers irrespectively.
> +			 */
> +			if (!force && buf->attr & BUF_ATTR_QUEUED)
> +				continue;
> +

What's the effect of the firmware not having dequeued the buffer though ?

My main concern here is APSS and firmware have a different view of DMA 
memory.

We release on the APSS side but firmware has not.

Surely failure to release buffers by the time we get to Linux::close() 
is a failure of the software contract sufficient to require resetting 
the firmware ?

i.e. we release memory on the APSS side but firmware writes into it 
anyway ...

?

---
bod

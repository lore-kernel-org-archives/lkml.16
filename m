Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B24E022578C
	for <linux-kernel@vger.kernel.org>; Fri,  2 May 2025 12:22:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746188557; cv=none; b=LL8t/EmY/XaOYHD/t5EKSxWnr1Tj1YCx3V4HRjN9FI/0ZQ0o1LLTu5SQQt+vy6pszYm300P4x+43aXLIyb+t41LjFv2LatMudQqqTXCIuSKEdnn+5MctWz1t1M8CWiKmLn0m3ndVzKK83U1ahec/ogflls1gdlh3Rw9hz4DriHA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746188557; c=relaxed/simple;
	bh=GKN/zeU/yMVetfdzvS9ozuLJj3zYNqyKb2B/40dRc0k=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=FBshHbDbj8eB0V30h5e6dp4sAEwKVMrkehWF7mrhJVVa+9au1t1kzzkJ8/ezNKiV+siuLW0YFy7F0Vcv4DojG5PiY5AvsHeXXR6RFMDY6daJiXuuhrmTlsIz4kbpwZROPc/Ogf1DYM1C0MGfQbCqrf61AEuQNcXY+iMZGBTEqF4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=ZYvtdJzm; arc=none smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="ZYvtdJzm"
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-43ce70f9afbso15661435e9.0
        for <linux-kernel@vger.kernel.org>; Fri, 02 May 2025 05:22:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1746188554; x=1746793354; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=AGAl7iJZhzrMd/4At9r/NfBVUJdFKiTG2vzkbY4stpw=;
        b=ZYvtdJzmbGavJoWIl8GcdrkE7MzoQoyYflFbCUpnPBoAwR96tZlBipxnOcbMduh6sN
         XEWe19C79yIVGr9uskUSyvhEmW3keesVD1YRXJsRx2FopQ96c1XijWeEig/h1uM8lcy6
         1rNWvL99zJHUYRYDelqfjl4Vxj5GEMW0tws7hVfDyNjfVaAPBTHXpcUebceRFrU2exG6
         B82es7vxpWeWuxSQWogaCCRhwhAsS8wQU8QtzwZXAYDAViD20oK9F07wguV+F6tYoiAT
         nt+efd9rGjwP8w8WnJNcN0rbkXI0BzGpSfxrIM5Q5BgnSnLWSPBeNip19V4tx1Dc+BRX
         tkmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746188554; x=1746793354;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=AGAl7iJZhzrMd/4At9r/NfBVUJdFKiTG2vzkbY4stpw=;
        b=rv6pZ7zqu8bm6uOGwMX0Ba+H3XFU0tGUPkF4ipEepFcmaWziJHLmnlr+1VUY+CQgq+
         75jgkip/6lD+JLpk+SiL2h+0eZKVBJNw7/5ebG+wwIrVJMb7ieH0ku+uyXhE7p+ENMwj
         9VrCqFak4X7v7Jvb/M1m0m3GeJC+WLCGPEbMS8zaZR2j/lUNDTsmkdSDF6NskpvDV8hN
         C/90+67rxBaHmrSS7k92MOCG5IC4fDc056mqKBkozKmKVcW11tzHf7/f6drkj8hgccgT
         SmWy7Ye75xfLhASEBDdOEZA4vLrnNfGuZYZwXGJ/MZK3roHSZ/X6bMOCKyKrWqd0+pL3
         WM3g==
X-Forwarded-Encrypted: i=1; AJvYcCVuEYmCDBvaeYOylmjOFwl+oTavJJZTCUSwnrZ69kBNVqEQk3dl0NsF8gG3Cr1bUBQ7ZyjA0vcOhsvOFko=@vger.kernel.org
X-Gm-Message-State: AOJu0Ywcyd3Lx+8TJ1pF5lSlbAQC0OdeY0cogoy0yVyI/lt0F2g+UYVH
	AYeflKcXANDV+hTwWp4odiGx5HLAu/g9oZcyYmoTf54d6kRLEwI+0qYfzR/CTEI=
X-Gm-Gg: ASbGncsjCCxorimVp1RcolUXJG1W2ECE+BdbZxePiXEB61ny5O127rG2gvHdmqescmE
	hWxbYKnv5McDt203rz0jZ3juYqOf1fbsuGChUGgRhDLy/25pqDaK7GXDj2ApdMNoHkOaKRJFGrc
	6ssaRbv7MpiQ3EDaPBpVYaj13LmDYNgbEGpCh7zq7GTnt+iX+UOOd6xyypvuENqjX6N0nxTaQsp
	kftbEFMIV/ViuNaoJzBcq1KaVp7EPNk9U2pVuN0Mc2F3RMXpUo1q1BZEeTv1IaSrxENpfO0wCke
	1kc0a/i3PjtllBMeWH7hgV22ksTR1IhKCE4x7eBfexZ/ggTCwgmjtHJBHFS1fH2UCXoWqwATRQi
	zAuJ0g1RFtX4jfbwo
X-Google-Smtp-Source: AGHT+IGAup8pZea6zJCXydbst81V1n8k/rAt9qOxSfiYhbAH8b2I5VdLjLvIPf6UJhHnoRz5UGJn7Q==
X-Received: by 2002:a05:600c:820a:b0:43d:7588:6688 with SMTP id 5b1f17b1804b1-441bbeb30aemr25881475e9.12.1746188554115;
        Fri, 02 May 2025 05:22:34 -0700 (PDT)
Received: from [192.168.0.35] (188-141-3-146.dynamic.upc.ie. [188.141.3.146])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-441b2af4546sm90036325e9.22.2025.05.02.05.22.32
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 02 May 2025 05:22:33 -0700 (PDT)
Message-ID: <250cdec3-1437-4c45-aab1-0428218b9437@linaro.org>
Date: Fri, 2 May 2025 13:22:32 +0100
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 05/23] media: iris: Prevent HFI queue writes when core
 is in deinit state
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
References: <20250502-qcom-iris-hevc-vp9-v3-0-552158a10a7d@quicinc.com>
 <20250502-qcom-iris-hevc-vp9-v3-5-552158a10a7d@quicinc.com>
Content-Language: en-US
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
In-Reply-To: <20250502-qcom-iris-hevc-vp9-v3-5-552158a10a7d@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 01/05/2025 20:13, Dikshita Agarwal wrote:
> -	if (core->state == IRIS_CORE_ERROR)
> +	if (core->state == IRIS_CORE_ERROR || core->state == IRIS_CORE_DEINIT)
>   		return -EINVAL;

Instead of checking for 2/3 of the states why not just check for the 1/3 ?

enum iris_core_state {
         IRIS_CORE_DEINIT,
         IRIS_CORE_INIT,
         IRIS_CORE_ERROR,
};

if (core->state != IRIS_CORE_INIT)
	return -EINVAL;

Cleaner and more explicit - declaring the state you must be in, as 
opposed to a list of states you should not be in.

Assuming you accept that suggested change:

Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>

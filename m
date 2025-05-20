Received: from mail-lf1-f52.google.com (mail-lf1-f52.google.com [209.85.167.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C6D6212B63
	for <linux-kernel@vger.kernel.org>; Tue, 20 May 2025 12:19:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747743577; cv=none; b=NOWi0NZZ73VJW5m7KUfzlgnJZZQOWvQMxZLhQCHTptfndECB/dfihoQ+bXL9V93d1l1qfJcN71s4kop8AUuOsTgYuOX+z8hm0a1SpIKfQB+n58o9xiD9SxPoG8tX30AIagbVnPgJyzeSodj10dQnO0ph0YvyjwrxKRPcREiVzDk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747743577; c=relaxed/simple;
	bh=yN2oz4RGfjWsr3L/yxfEwmYkVPvraUmd8R28Gu6B0Yc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=fcQRe18pHaYKiRdyDpxiMBFOct0ILyOi7rWhUbnDigneCp7t1AQ5SdZ37eAtcP2hsCQMIHetqeYm8fmW4SeNJW90eWZMXDDPTNXgGzC2O7OrUOlvomF82UMqVpgHy1g66xHzisTy11YwzgFC3AgV5eswVphmS7qzE1HuJWstTDM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=cvJUbteA; arc=none smtp.client-ip=209.85.167.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="cvJUbteA"
Received: by mail-lf1-f52.google.com with SMTP id 2adb3069b0e04-550ed4a6374so479574e87.0
        for <linux-kernel@vger.kernel.org>; Tue, 20 May 2025 05:19:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1747743574; x=1748348374; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=LGxzwmCx0aVZaskSD1cvnXeY9ifmH8LA11mbYYh9vMI=;
        b=cvJUbteAf8Xw1WV0DNcfrB6Gq7qu3YaAU2jIeoXNxuwobYZJaM9B92l7zNJOqQ7tGE
         stjLqXPn001yaYEfc53tGjDzdqAGecNhLq19p8afw4UyVsNZWuGFpv2QdL90Q5KFqoj0
         KpXJRO10E0uhPM94iUjgwPzYjGhGHjYHOa9XNYDme7MzhPg+aM/Ek4Za3RBGg6dUeNSl
         yp3S02zp6aioPjUmWbytHsQOtJp/gSgFtFEo3oKcr36DW6woZ3VGCpZ6yk9+yTRDgnxt
         a09+1o9CkJubWKQWFqg8TUOZhOjbBr6RgKCD2SUO4HwMiEma8QiIYfTaxfi6pbImVEnz
         Z6Lg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747743574; x=1748348374;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=LGxzwmCx0aVZaskSD1cvnXeY9ifmH8LA11mbYYh9vMI=;
        b=hkJgqIINXAIEQwUcUIO7PZsv0uA32UpOEYCcCBMM6jsU2MYmNHbSrJBsskQkw5u7ZV
         ZvPdIMzPFh9tZg6+chz5/p2U+Et7hUhZ+LT2O5+Z31tZoT+LQfaUSs9bkNQkDiLXT20g
         Z/LUt6QU3Hl0hSWgjkWzivKbHWJn1cKKhMnbInz59MAH/lWucQq1u71jAoTaI+dMMYhX
         0p3PQEFnLRY5Q/eNWhTgTVQ9FTEVRDV+Pbuh2IUFYAc+acrMNQquYH9ZoTU7HVc83iyV
         ML2QjE2Vn+iHOJ2HdgQZpC9zd4uPHbuFKDexhkFV7XArHjr/bTgYqXaCeRGyvm2tVMjt
         Xxmg==
X-Forwarded-Encrypted: i=1; AJvYcCX5w7G2z2ShLFRjwVAOAPL9DDZQ36FyuIbRSyJSNi7NxucL7R076rpqoxV3OrZ4r0OK1oDD2hZ0eHikrds=@vger.kernel.org
X-Gm-Message-State: AOJu0YwGqz2Hy1zZBYqMbfHXVS9Im20xoMjJCXcopv8YMHxxKlKT8scf
	84O/9KzLk5wyZzNphNXsUgaQ57I7iF9ac5qRbg0kwr/9XL61r1XGcqfJoOB4n1IW0iw=
X-Gm-Gg: ASbGncvqCFMWNYypZRTx8SNuYzI4+DXDY3Ehh1U8PcK7eQ5KWpYDrbiUDGhVb/oL9Y7
	RZufNqd5pp84zFrlz1lSHP/5kPm5YGs3ALtk1jf1+2dP++p+jPLSegVZ8WmnXjFUK2clRn4L/eZ
	+rNYKbUdYuNWEwHdRCbXzqY4H/Gc1Ej7bBTmMzXvQ4cGVsKvrfPkt/8xeanWdPCzPA6zsEYAiwe
	4h5P2b4DYOLMQkloqBZDClXz3jfROgddN/jC2QNu3OIWbW/J/nHgTdOoyFp90lHwO2YoLZXIAFE
	bpWjNQwuwekafGIdg5Htru1Yw00Trx2A5lkJB7VGtmKMQZ1jghYVYpxLiscZ67alwjSlCVRPh2C
	a5CsSxfDebjd4nlg3XypVQE55ZtzWZQ==
X-Google-Smtp-Source: AGHT+IFHmFbjhmDs8JEJN8j6pzPYHRP0s5f+jZkbENRKCNk16g6eKwVvixfcndrmuMQxR0FYU+h/Iw==
X-Received: by 2002:a05:6512:2909:b0:550:ed9e:1b32 with SMTP id 2adb3069b0e04-550ed9e1fbfmr1194001e87.1.1747743573823;
        Tue, 20 May 2025 05:19:33 -0700 (PDT)
Received: from [192.168.1.4] (88-112-131-206.elisa-laajakaista.fi. [88.112.131.206])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-550e6f2fcb3sm2327121e87.86.2025.05.20.05.19.32
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 20 May 2025 05:19:33 -0700 (PDT)
Message-ID: <748f96f7-d690-4823-845f-67642db97a06@linaro.org>
Date: Tue, 20 May 2025 15:19:25 +0300
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] arm64: dts: qcom: qcs615: Enable camss for
 qcs615-adp-air
Content-Language: ru-RU
To: Wenmeng Liu <quic_wenmliu@quicinc.com>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, bryan.odonoghue@linaro.org, todor.too@gmail.com,
 rfoss@kernel.org
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-media@vger.kernel.org
References: <20250520-qcs615-adp-air-camss-v1-0-ac25ca137d34@quicinc.com>
 <20250520-qcs615-adp-air-camss-v1-2-ac25ca137d34@quicinc.com>
From: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
In-Reply-To: <20250520-qcs615-adp-air-camss-v1-2-ac25ca137d34@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hello Wenmeng,

On 5/20/25 11:56, Wenmeng Liu wrote:
> This change enables camera driver for QCS615 ADP AIR board.

what is the rationale of enabling CAMSS on the board without giving any
description of any sensors connected to the SoC?

> Signed-off-by: Wenmeng Liu <quic_wenmliu@quicinc.com>
> ---
>   arch/arm64/boot/dts/qcom/qcs615-ride.dts | 7 +++++++
>   1 file changed, 7 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/qcs615-ride.dts b/arch/arm64/boot/dts/qcom/qcs615-ride.dts
> index 2b5aa3c66867676bda59ff82b902b6e4974126f8..be8b829ec508d7de7a4cd6be6d1d4e83b09734bb 100644
> --- a/arch/arm64/boot/dts/qcom/qcs615-ride.dts
> +++ b/arch/arm64/boot/dts/qcom/qcs615-ride.dts
> @@ -211,6 +211,13 @@ vreg_l17a: ldo17 {
>   	};
>   };
>   
> +&camss {
> +	vdda-phy-supply = <&vreg_l5a>;
> +	vdda-pll-supply = <&vreg_l12a>;
> +
> +	status = "ok";
> +};
> +

--
Best wishes,
Vladimir

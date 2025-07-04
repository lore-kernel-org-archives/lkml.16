Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 035512C325B
	for <linux-kernel@vger.kernel.org>; Fri,  4 Jul 2025 15:08:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751641711; cv=none; b=ZmxmD4LflbCvb9T45q1ux2udizn+LaOH04Mz2Zih5k6vs9AxnHvw23Y+H0JMA72Omau9Ua1xM1l8PwZwVcZ3QgnVT98Id99UqpHDn4c4ugs1fWLF3EbrJQB8LDAGzlkHBCwkzUldQkBcla+j/wN96qEmFv9dPnD2+KHjRudXmqE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751641711; c=relaxed/simple;
	bh=z99ypbhgt7PRN8CNu5zmUrW+s65R4pj9X6lJOs+6Kxc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=GJyKOIMFwXZBMygFTAH1K9Zz8LUljKNg0pqmjXUjDlJ3Uh1zBLVR5F78XpIiUnD/7c+mZixQoVI2Feo7FOdLPC96fl0iyV/77lUP5OimFZxS+M/FJASWnwrbwGCk3FsI06B7taDbLjsYzJ+c7WslVl2ptTKNVJI15xKhOHS2Zdo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=TsGzQbFF; arc=none smtp.client-ip=209.85.128.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="TsGzQbFF"
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-450cf0120cdso8279265e9.2
        for <linux-kernel@vger.kernel.org>; Fri, 04 Jul 2025 08:08:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1751641706; x=1752246506; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=5JRqGvyBumH802l+nR1KOGYBxhhomQIR/CQn84+0wMY=;
        b=TsGzQbFF8RL+7dmPk+WF6CWVnx1xG0MJ+6u6RX6i+R7FRtfg1YT8QqsElhddbGaYgz
         dTqIl751+WFPl5LWNw2W8qTDA1gHOWAZnSZDBOSggvfy/PunxJpl9+4W5q/tQCqwJH5Q
         joPiAYwHwOc9VJeRTYXARvIPuY6koX9soZm8IpG8N0mV6gggwqcjz6ZfhKTyr0C2G8oy
         eeOeB9CGobcrcnjrStG52jJ2HUVa/9ss7B71yw5gnArgGVUBecKs66tt35bd/i55G+EZ
         b7yg9ZLKv4TYEh+h5Fb23zzFzqza9KSTlat/OzpKE1SmfYErxn9u8gVjzWnQrxUNp0Bw
         eCDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751641706; x=1752246506;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=5JRqGvyBumH802l+nR1KOGYBxhhomQIR/CQn84+0wMY=;
        b=XqGkx20UNWEhXScxZ3RuTboizgObHoGPteXDqyAjW5WnwqmGB7kejh0tpUup5yUm/W
         hZTf1gcAkAtwhi6F/ebLyWcaefVYFhbinmF32/omH8SNAaX7FNTGad87Lv7c8d1gYuKt
         cWVPF5blD8NUSvCDbnn9I7prGFVrVr/qtVksnCX+x0hf3aaOrrnaubEEGvxU+0GNvW7V
         HLV4Msrj8EWCU+sduqT4VpTaH8R0JuWsoyG9B7ruKFRQ5pBeRy0toj9xCKdNUTbILWMq
         iNnePYDdCw3f3djCt+4yOaAGqrWFEAoGCH50LBQWsoG0Ul1+TA+Py2mXxfhWlnthUbUn
         9qDQ==
X-Forwarded-Encrypted: i=1; AJvYcCXQH8jMr0u5K0afFgp6327dKk7+O2pQ4JZ7klIg80FbvZxxe3YGKlhcjVpjIuHpMI2UxF7Z28/dnxXS0Rg=@vger.kernel.org
X-Gm-Message-State: AOJu0YzVCC/dkMAlV7wmbzxwQQk/4fOz0zC9II4oTe5Nlswn1YcJG5+t
	duBpzzJXeGXyzvmNp9XdfVYam8/J9rGY/Jar2s6ufn3MkRiIZexFQ0FBtdniaTsDyCCkisF7jJo
	UiyXy5jA=
X-Gm-Gg: ASbGncshXksGHW3mhah24B/lcCRHTIvNYW6zVRA3NCtyZOXyNEoOI0+YzGbxBZ9Nu55
	k62yTaT5C9HFOtBds2Wh1BBcGACH40getbIFhDL0//DHSJ/cLWkTEE8kzfz8yWi7cvXGoGtMOlX
	TUsyCYZ7GiHVFdzROiHSLq/oOOWpouZ9yj2h8P1vguC+XRMeWsAzjz2qxaXkWANB9UcTiZAk9xK
	oIzOB/NCoyGWLD7lPVbkbVq40I2bQKrVKWvYG128GYIK4OG59lLIUr/Gb3fnEobDk55IdPz3Pdv
	5Lhlv38CrjVoqgjzv/UDKK8/DqojV28JUvbDfG3wZW8r0jy12ocD/QC2hI2KrU/8GL3oJU56UZS
	7asQguamZHE9iyPhdCOmX8ZgxwuPn2fyei93Cww==
X-Google-Smtp-Source: AGHT+IEhXyWUKZBqJ1/rbt2q/CXsfjI081WY8MKxoJLn03mwHiCnJ6/2m4+MnYAdB1lvJU/vPxvxlQ==
X-Received: by 2002:a05:600c:4706:b0:454:a37a:db67 with SMTP id 5b1f17b1804b1-454b4ead1c5mr30539075e9.17.1751641706107;
        Fri, 04 Jul 2025 08:08:26 -0700 (PDT)
Received: from [192.168.0.35] (188-141-3-146.dynamic.upc.ie. [188.141.3.146])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-454abea60d5sm37229795e9.1.2025.07.04.08.08.24
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 04 Jul 2025 08:08:25 -0700 (PDT)
Message-ID: <93a1f14f-ae25-442c-b495-e66c74193d06@linaro.org>
Date: Fri, 4 Jul 2025 16:08:24 +0100
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/6] dt-bindings: clock: qcom,sm8450-videocc: Document
 X1E80100 compatible
To: Stephan Gerhold <stephan.gerhold@linaro.org>,
 Bjorn Andersson <andersson@kernel.org>
Cc: Michael Turquette <mturquette@baylibre.com>,
 Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Taniya Das <quic_tdas@quicinc.com>,
 Jagadeesh Kona <quic_jkona@quicinc.com>,
 Konrad Dybcio <konradybcio@kernel.org>, Abel Vesa <abel.vesa@linaro.org>,
 Johan Hovold <johan@kernel.org>, Stefan Schmidt <stefan.schmidt@linaro.org>,
 linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20250701-x1e-videocc-v1-0-785d393be502@linaro.org>
 <20250701-x1e-videocc-v1-1-785d393be502@linaro.org>
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Content-Language: en-US
In-Reply-To: <20250701-x1e-videocc-v1-1-785d393be502@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 01/07/2025 18:28, Stephan Gerhold wrote:
> X1E80100 videocc is largely identical to SM8550, but needs slightly
> different PLL frequencies. Add a separate qcom,x1e80100-videocc compatible
> to the existing schema used for SM8550.
> 
> Signed-off-by: Stephan Gerhold <stephan.gerhold@linaro.org>
> ---
>   Documentation/devicetree/bindings/clock/qcom,sm8450-videocc.yaml | 1 +
>   1 file changed, 1 insertion(+)
> 
> diff --git a/Documentation/devicetree/bindings/clock/qcom,sm8450-videocc.yaml b/Documentation/devicetree/bindings/clock/qcom,sm8450-videocc.yaml
> index 0d99178332cb99d3f02f50605e19b9b26e3ec807..fcd2727dae46711650fc8fe71221a06630040026 100644
> --- a/Documentation/devicetree/bindings/clock/qcom,sm8450-videocc.yaml
> +++ b/Documentation/devicetree/bindings/clock/qcom,sm8450-videocc.yaml
> @@ -25,6 +25,7 @@ properties:
>         - qcom,sm8475-videocc
>         - qcom,sm8550-videocc
>         - qcom,sm8650-videocc
> +      - qcom,x1e80100-videocc
>   
>     clocks:
>       items:
> 
Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>

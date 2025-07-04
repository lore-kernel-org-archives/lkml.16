Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DFBCB1C3C18
	for <linux-kernel@vger.kernel.org>; Fri,  4 Jul 2025 15:36:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751643399; cv=none; b=SHuLnhnIdb0qije65al8gtzbC6UowwdHKWVPIJjyBgcX2DXvlrihS+jQHXgFMBzi4I2pME8hRmM5T2V8q+Ehyh1xaW0yCRrdbwHno4F6z7+zPZ8BUoBuzMEVVluyGnEVPUoEUl08WMUgFPY6s8zVNV92JCQvT+nUGvffgZgsPEc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751643399; c=relaxed/simple;
	bh=6AfWGwf1ZO1nnsP9pbeq6kHrKdZ3X+JnWuL1iOaAIl8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=DnSsgaPLs1cg71IaWKCyETH9GEE+xsAMdJjpfEBhPnihcJbX09uILRTBMQL/w2L5p3yBWdV/jLNd6EvtN5CY2lAE1twysZyF1j8FkJMk3d3vC5bKgwcJSObDt4WbSvbL70P42+Gx7SqSoFwznGo9iWyN6SyayRLO0B02NN4fBFs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=kdZcvAoS; arc=none smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="kdZcvAoS"
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-453634d8609so7590945e9.3
        for <linux-kernel@vger.kernel.org>; Fri, 04 Jul 2025 08:36:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1751643396; x=1752248196; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=kHBPVkZ3WjeAxBR0NM1nNct+JGgFP9fCRsYhnveiIng=;
        b=kdZcvAoS4+c0wNiaQxI0cdpQ3HtMGXDnvmVsnhzCyCHR24nhMZGJBhehmGb8H8IK5A
         x0zv8G7ETUYsQ1qCCUav1eUSGTQ2puRDofJfbZHkSNrpCCU+dnamWfkzebTVg/YbHcvM
         o63VFdkZq5DLNRVhmPI5aiamlrquYT+InP2jCGPdqFR+K6lzBtphZBxEui3jR3vqhqAo
         vZgabk8kdCna6s+A8wPdy4hX2vxjnuUkgs+THJGNcxF1qLDFzCMVpaMImGkjMduLc0jL
         y/TGWRVLjZnMe1PVBb+s60DHuTGyUBL/y4b7kNA9pyUMqfMXmFi77WjwSDoTMzpVQZGI
         Coig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751643396; x=1752248196;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=kHBPVkZ3WjeAxBR0NM1nNct+JGgFP9fCRsYhnveiIng=;
        b=YqadJvF3zDtAkdv5CPAbQgwpUsXjCRU5iPMn6F8lo9Opd+zZpb4PULShfPM9bHZwY6
         Hnl9qzJTYIp+nEVaKeg/8J3RvzL+YyLMhFTefkr/uyEZLJUCoc8X+rq4hdUnR3h7NIjB
         TiiUOdJUacc853x579CG4ToveijLssDXK/3+A1TEqJzeuI5jwJdnhL6WDc04mnRHImK5
         QOPDrZ1WpTtttVzS5nvzAXSStZ7JqEThvVyPX+EyNDssiW8fH1gKn2bxxTYSTucBFJiM
         KbZ1uLnfOa85LC3Patq5OPhGSICaSQc83s0R/VYRYbXr0it3vmR/6PRPThRneLq0qeUC
         b/MQ==
X-Forwarded-Encrypted: i=1; AJvYcCXIQaAehMzF9DLdFVViwBWgv02yoiy5jYYhELLtywCiqmBs8zX0vbzrUFFBcMNDs2v8vpAGUeBDdJddYcw=@vger.kernel.org
X-Gm-Message-State: AOJu0YxiZALCCLuZ7gO+kgQmQPdIAaEi/tUwIXTOS15Gm9PCOkTCfoA3
	mflY1a8rlUpLRHJUaZ60+tI2blAiw5tDeviAX7bp0T0W7AgUoGr03wrv3336m+7XT5A=
X-Gm-Gg: ASbGncuqYXZuI3lbPLpI6esYdxiaQPjogQ8ITnpzThDDNqnefTGrUEY0lj+HuAt0PoB
	donj4viZbz8aKGTRI9m4vC6Cv9Gp48cx5UqX9KVC3vVQy2XMrN5fNRPpb9AqalMGPnvNWauQxjN
	U9okm2Rsm/tnvSOleXpuy4G2Vp6xeGNwvNojRA2eu1H5J0X5u5m4eI8I+gBsy7MCCuwMvRXxwFU
	UoxklDgFoOzbS1iwXp6JGlk0O9Ihzd/r88NEv2t6+VC8Yujf14yBiDWegqf5mTpufNO2/O1+16a
	yyZrBiFbfZaUsOe9CqdKtf0b2mha8L8acJRyL32NOm6pkw0U5D2qqJZWhX+sV3tixkiFNl4dpqC
	gYEVgdX2VgkfRPLlt59ExfimGTUgC
X-Google-Smtp-Source: AGHT+IFEx8OdICe2iWVaKFmaTDM9y5WPRJfONxEgUkTyX189wA7oj4eE7u9yAmgrJC3PDONXWLAXgA==
X-Received: by 2002:a05:600c:c0dc:b0:43b:ca39:6c75 with SMTP id 5b1f17b1804b1-454b32084damr28968955e9.16.1751643395749;
        Fri, 04 Jul 2025 08:36:35 -0700 (PDT)
Received: from [192.168.0.34] (188-141-3-146.dynamic.upc.ie. [188.141.3.146])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-454b162a3ccsm29397725e9.12.2025.07.04.08.36.34
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 04 Jul 2025 08:36:35 -0700 (PDT)
Message-ID: <86a1f012-6640-48af-a6e4-0eda7d02b914@linaro.org>
Date: Fri, 4 Jul 2025 16:36:34 +0100
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 5/6] clk: qcom: gcc-x1e80100: Add missing video resets
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
 <20250701-x1e-videocc-v1-5-785d393be502@linaro.org>
Content-Language: en-US
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
In-Reply-To: <20250701-x1e-videocc-v1-5-785d393be502@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 01/07/2025 18:28, Stephan Gerhold wrote:
> Add the missing video resets that are needed for the iris video codec.
> Adapted from gcc-sm8550.c (with adjusted addresses).
> 
> Signed-off-by: Stephan Gerhold <stephan.gerhold@linaro.org>
> ---
>   drivers/clk/qcom/gcc-x1e80100.c | 2 ++
>   1 file changed, 2 insertions(+)
> 
> diff --git a/drivers/clk/qcom/gcc-x1e80100.c b/drivers/clk/qcom/gcc-x1e80100.c
> index 3e44757e25d3245e455918e9474c978c8dacaa5e..301fc9fc32d8e6e1ddf59c1d3350d84f6c06e4b6 100644
> --- a/drivers/clk/qcom/gcc-x1e80100.c
> +++ b/drivers/clk/qcom/gcc-x1e80100.c
> @@ -6674,6 +6674,8 @@ static const struct qcom_reset_map gcc_x1e80100_resets[] = {
>   	[GCC_USB_1_PHY_BCR] = { 0x2a020 },
>   	[GCC_USB_2_PHY_BCR] = { 0xa3020 },
>   	[GCC_VIDEO_BCR] = { 0x32000 },
> +	[GCC_VIDEO_AXI0_CLK_ARES] = { .reg = 0x32018, .bit = 2, .udelay = 1000 },
> +	[GCC_VIDEO_AXI1_CLK_ARES] = { .reg = 0x32024, .bit = 2, .udelay = 1000 },
>   };
>   
>   static const struct clk_rcg_dfs_data gcc_dfs_clocks[] = {
> 
Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>

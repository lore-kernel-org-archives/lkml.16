Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2790E296731
	for <linux-kernel@vger.kernel.org>; Thu, 15 May 2025 06:28:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747290541; cv=none; b=lZlQ2+X0oLzwT8ga3Ntch4dhb3XXdsUGCw+DhSrgvk28dnjXVueTniF1DE8NVNOUsfu3eFpi+I//8BmXkRMy0624nbHnlUqAqZ2uP32AW5AOpQg8Sy2RFgXeVE4Y5eAPtdF9tgMoSKj1C2TdqIWc5yTsL6tf0BHK23/qSYOAqdI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747290541; c=relaxed/simple;
	bh=00AV94dG2ZcGMrm+oEM6uxQ3vNHzQbtkKeRhT356qXc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=kOvuhi6+WZUQpGkCut3bdKqCmeUFzu6E9GD+HdZieEnejIF8IzodaTFi3Mo9nd47YIq6uMbVcXYVhZhLw9ikTSyQKoMtrK8tMRDbaQwiUYv8FSf1eZVoh4R346y9PI/oQ3GO8fMSQrQFIzsZOkDoWsO70VNZHuw1wxznOTZJGJ4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=iA7EPvC6; arc=none smtp.client-ip=209.85.128.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="iA7EPvC6"
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-43cfa7e7f54so3814955e9.1
        for <linux-kernel@vger.kernel.org>; Wed, 14 May 2025 23:28:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1747290538; x=1747895338; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ltzFKNmbLblqGQ8qkM/SiBLYExEz5st/fzGa1uhJzPM=;
        b=iA7EPvC6hIMv2VCKf/GG5g6jw3F/CW4maAfweqRvN6+LlDbUiVh3ZUFo1K0CIJ8NJU
         TSzXvLAd8PZyza2fF0UYb2a24bXLfyzAKbxUCf2St/UeICxt84YkU4QzIJg4U8PFrqhY
         sgJE6EQV74YmNIkQHSpb6E45tQUwRRdaJwYA3pM3+gNyxD4edF76oLvk7vR+oSxOQQwS
         YOYm7PLuA8tOhtRNPTYkY5fEHvdyq2+rLR6aCO3Ja/jFbCvzB1FfpjDEpqQd/6GqvNGT
         WJVW2jPr5JCxfHizzcl+rpwdf+IcKyy6/DfzUoPyhIZrOTKPLBrDR3bVk870nfGJWt/o
         e1Uw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747290538; x=1747895338;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ltzFKNmbLblqGQ8qkM/SiBLYExEz5st/fzGa1uhJzPM=;
        b=pEd8vOJMQINA132djN/rbK6HGgENYypGUS3CT4HuC3DKAkOhS8RG7ZyAWJwBJtazCT
         aH1Up2zmiX2TcBl3TVPU452wfCHFq1mTy+J7mKtCRAxbffDckfBMz1Qg0a08b9tjoFNY
         OBzida/M/9W2nzYnrGsKsbEzX0MQqo6ZPkz00dWiBkwX9JmpulsXKgVZZNvmQn24R7L2
         7zQFT8nG+pyOgKMpNJbfOElL+4ByIXryIij8CMHXfUV6kJayiALlr1vYluzFYNDCsAl4
         1scAxO+NWeLTO3/r8mdNPPy9CjPTg8MncomOiywwmr4eJiLEvhMGe465XEdxgo7VyC1d
         KwFw==
X-Forwarded-Encrypted: i=1; AJvYcCWCjwfwpt4djTlqbLxc6JnlILjOjHaEm+6QTdXgIAZzAnlvr2yt7le3UzBImycAOTi6jBSQj3BOV1thF9I=@vger.kernel.org
X-Gm-Message-State: AOJu0YxWyGPUnrMaS3HpyoxSzrqPS2VDeoI5RT9svdT93R3bRp8OLSwN
	sUzYR9DsN+pIU8Ki5Df6FgWWk6Tgi2cLlxstYvKHSBW2aRDBUOrcwOZp38ez+fg=
X-Gm-Gg: ASbGncttekWJdgXvZt3+rXk7/qTEUGD0iDjDCxeLcvP4OIFl9C6QswXI4THuXTcrhMF
	VFvOQDNZFq9BRUv42vsrgtBBP9zUUhTN2PLMPoPyT5V1wgoAOoSxitNw+5M/DswQn5prQkk50vb
	v8yjmXsxu1UnlydABfEVB0fmtjLsHauk0yYZrG5HPpAGfV/7+uKrhH9MhPhh4etCEe3+ZmDHjMo
	4JVrxGDoZC1l/JLedOCEiQqZef86usxQHhJA4GSVpz9JpNGgQ63Ql+y4gVthrnjxZCju4qVsjrC
	vw8tZpXduTCOLPWfSbijGc5v55MqY+J6BHoOjBupz1nRkTLWYthFg4C/c5sOK9jfGT6fanizlr6
	V22KuFu5MxleQ
X-Google-Smtp-Source: AGHT+IHPjN36nPIAFheoxSJeMD7QVqgCVlEcC9j4OaPSYI+l7JvLUZZ3UyCX1An8LX7/LhBBB/f7Gg==
X-Received: by 2002:a05:600c:6814:b0:439:4b23:9e8e with SMTP id 5b1f17b1804b1-442f84c7cafmr20169815e9.3.1747290535806;
        Wed, 14 May 2025 23:28:55 -0700 (PDT)
Received: from [10.61.1.70] (110.8.30.213.rev.vodafone.pt. [213.30.8.110])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-442f3951b62sm58204595e9.22.2025.05.14.23.28.54
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 14 May 2025 23:28:55 -0700 (PDT)
Message-ID: <e6f8bf0b-4a17-494d-96c8-7384f9426ff7@linaro.org>
Date: Thu, 15 May 2025 07:28:53 +0100
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 05/18] clk: qcom: common: Handle runtime power
 management in qcom_cc_really_probe
To: Jagadeesh Kona <quic_jkona@quicinc.com>,
 Bjorn Andersson <andersson@kernel.org>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>,
 Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
 Dmitry Baryshkov <lumag@kernel.org>
Cc: Ajit Pandey <quic_ajipan@quicinc.com>,
 Imran Shaik <quic_imrashai@quicinc.com>, Taniya Das <quic_tdas@quicinc.com>,
 Satya Priya Kakitapalli <quic_skakitap@quicinc.com>,
 linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
References: <20250515-videocc-pll-multi-pd-voting-v4-0-571c63297d01@quicinc.com>
 <20250515-videocc-pll-multi-pd-voting-v4-5-571c63297d01@quicinc.com>
Content-Language: en-US
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
In-Reply-To: <20250515-videocc-pll-multi-pd-voting-v4-5-571c63297d01@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 14/05/2025 20:08, Jagadeesh Kona wrote:
> Add support for runtime power management in qcom_cc_really_probe() to
> commonize it across all the clock controllers. The runtime power management
> is not required for all clock controllers, hence handle the rpm based on
> use_rpm flag in clock controller descriptor.
> 
> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> Signed-off-by: Jagadeesh Kona <quic_jkona@quicinc.com>

Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>

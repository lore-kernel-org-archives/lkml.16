Received: from mail-ej1-f53.google.com (mail-ej1-f53.google.com [209.85.218.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3886B217723
	for <linux-kernel@vger.kernel.org>; Fri, 25 Apr 2025 21:06:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745615201; cv=none; b=sSCyzUs8L0+C1AFuuW3t01QenshspPC5UodeKnS3YhmadCvBCs1/6vtSg0ufT4BgD6jzg7k26RIpNEtwfgsCdWnsKdSwuBwdnJPOTVK9O+NLvhrTXGyBd/oVtJqtl+XFRqzSB5QTN3YbsP5+IfITeZtIpJ2AddA5ehsUQE4bzK8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745615201; c=relaxed/simple;
	bh=JxPwV9RN/TrvkttuKLa/6dUXo2D0QhD01ILVdfvCR9I=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=X5QxOuI/yzmkCTEhxGBh1mc7x7idwJYhVQzpyBzFHjD3f9j8fLDDM53kRvameFZPwzHmhC0H55nAY9neUifulDWhJtjQkae0NfVmDx+W8kcKk/7uIc8oWSFLKulWPZ7XOh+A0ahxbgeoD5LH54eKtD6oS9KU5S/yb3acRr14zjA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=SLiAfY/3; arc=none smtp.client-ip=209.85.218.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="SLiAfY/3"
Received: by mail-ej1-f53.google.com with SMTP id a640c23a62f3a-abec8b750ebso479369966b.0
        for <linux-kernel@vger.kernel.org>; Fri, 25 Apr 2025 14:06:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1745615198; x=1746219998; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=hJSViueIlkywPb1dDkM+tOQg3Rq/RtJifu7KCMpkkjw=;
        b=SLiAfY/3zy/nBvPh2AwEot8ZjqvAlLgo59CcRUdC/ajyNpQkyhbgYWdhdnzNeDg6so
         YABYDKbJ9udeaPnO2y9lNYEenGGFpXXcn0Ba+8P+NqP+2Sd0O7Smo+OXE7ivtgzLDMcN
         9DMyI5okiZluoHvR/Glxpm2kEO2sQUFqubGR9ZOSb87ZSyJfuFQEqz+3tJKn9nt6VNwe
         UT+OvMkUBtQw0sQSM4KAD5RTD5f8+14OFao3Y8hbjsqygPeVnP+EPtZMqeZE7RGzy69S
         kznm5NR8YVJd1zC/m0S6b+82rWhLjKuL8aB0p0alOYXP8tNtUtioRUMtb6KGEvSBdwTo
         GCmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745615198; x=1746219998;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=hJSViueIlkywPb1dDkM+tOQg3Rq/RtJifu7KCMpkkjw=;
        b=LJ6K7UE3h3dy2KJ06DPyPfbKUpPkt0MnWkC0ZVfv4Xm/ZI8N7C5JUk4ahqirsamKMX
         HsjkqiyJ+M8blKeVTWbf3ssUAY90WC3Bg6SHn++YSQxCePMhkpZVZvFbmLpJNLr2pV9l
         XL1z3G8tIO6ex3yIBbXrZiqQrAIso129EtTCHUwYRSUG3WIikxF+wQOiNt7iUzJfBew1
         Pe3AckFBiCHutul+KcVKSfbuc+TVomY6r6ore78d0Zzo+D63nYCvdJDR3m78SCbECS4K
         pK86uWOuy1SalUCziSv2ixaNbPgL7Q2eWJ+tdqDzXoHpnTd298x5t8DZoh95K79bNuFz
         9TcQ==
X-Forwarded-Encrypted: i=1; AJvYcCXpWXjJjz1VnX+g/gHwHO9pzpWdhI6FOaocbgQriLR9JSj+An/FEusMB/TyqS3H1inkUPFlwWIsme0r0UY=@vger.kernel.org
X-Gm-Message-State: AOJu0YyW/hzTgLYLoP8C2zEaVnpxkzZVj/O2X/Ybdj2ZXhb0kX51AzXi
	spLsEe+I+yCRx6bjpMD5f1PxaKohB0rZacgZIG1jeWeDFudbaBrwp7r0njXZgUA=
X-Gm-Gg: ASbGnctiFEfnLKKSImnKqv0merIfHQh07dw+PdN7O5IreSOzckoWpg3u0xn3p23EW6Z
	uqPGSc09eFIHucrDE5tkJOhnwVAJ0DzvwF79sgf5XFt63IFJCwSsU0EeEoZ07WCeP1rBrMD+khJ
	3+Pap4PMgpMe/JMj2bLZou/l4ZoScl5n4saB1nEKS/EUGB+XQijBtje/jsEpxg18OJLpAOm+6Zk
	oTXmNX0lf8/jYW+Lir84nCdMD7Pkv2REju4cvUymnXQE1dqHaKNml+4gWlW5WjVYkqahm2Feyxr
	HxFT7KDRGmj6PICUS8Eftx5l6+f4G7nUlydEl8dJLWvb3tJUmrk+ObFxNtEH5cuXPcKiwSZzbTr
	eRs4imA==
X-Google-Smtp-Source: AGHT+IGoNP03/XEhQmgiGugXT7Kubo8eKyImPsEDnz3PTHi9TCSVIYUFM2j7d3vzwbsmvsEDl1RFXw==
X-Received: by 2002:a17:907:720d:b0:ac7:eb12:dc69 with SMTP id a640c23a62f3a-ace7110bb7emr383246566b.28.1745615198360;
        Fri, 25 Apr 2025 14:06:38 -0700 (PDT)
Received: from [192.168.0.34] (188-141-3-146.dynamic.upc.ie. [188.141.3.146])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ace6ecf9a47sm190854466b.104.2025.04.25.14.06.37
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 25 Apr 2025 14:06:37 -0700 (PDT)
Message-ID: <6841b51f-a4f6-452a-b5f4-c018ac2ec94b@linaro.org>
Date: Fri, 25 Apr 2025 22:06:36 +0100
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 6/6] arm64: dts: qcom: x1e80100-crd: Define RGB sensor
 for cci1_i2c1
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
 Bjorn Andersson <andersson@kernel.org>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Robert Foss <rfoss@kernel.org>,
 Todor Tomov <todor.too@gmail.com>, Mauro Carvalho Chehab
 <mchehab@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-media@vger.kernel.org
References: <20250417-b4-linux-next-25-03-13-dtsi-x1e80100-camss-v7-0-3fd4124cf35a@linaro.org>
 <20250417-b4-linux-next-25-03-13-dtsi-x1e80100-camss-v7-6-3fd4124cf35a@linaro.org>
 <d0b3a631-e75b-47c7-a98c-6158507f1148@oss.qualcomm.com>
Content-Language: en-US
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
In-Reply-To: <d0b3a631-e75b-47c7-a98c-6158507f1148@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 25/04/2025 22:01, Konrad Dybcio wrote:
>> +		orientation = <0>; /* front facing */
> This most definitely needs a dt binding definition instead of a comment

That's standard somewhere.

But now that you mention it, it should be a define not an integer.

---
bod

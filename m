Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD24F19C569
	for <linux-kernel@vger.kernel.org>; Wed, 26 Mar 2025 23:12:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743030732; cv=none; b=VEQr1WYJxg84WdepROgxA3NdQpb9bhlVL0G08CVo2byPf+7Ed1dv8eMm+T8DJILSkVyCAEOHtzGqlgga4JEMlzYlaFp+Rmm8LQLvIrMJ4T6BK7cciK6LBcO0yfNZwAOeHXFjOSxyfiQeorHAKXFg7Knh06VL0X/Ct9052Rr/OuU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743030732; c=relaxed/simple;
	bh=UCc8rw1bQL615I3M9tiEKJMyEQJf60GHdPTj5eKlWlA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=P/y2ZteejB+Z6I7OFtdOAiK+Y2ZjO0cL3GL+AV3MMkbbjCbBRVrUaGLcE6izImDWL8rmbzKE8ZaShMoV893C0MfNGMdPkIXzsQrLfc2eygtWelzBo0TyQU0WkoP0x78t4FpC9bcMh77NhYuihrw7zqslatG71wO6WpzsYhaAl/E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=DjlAS1iH; arc=none smtp.client-ip=209.85.128.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="DjlAS1iH"
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-43d04dc73b7so3985175e9.3
        for <linux-kernel@vger.kernel.org>; Wed, 26 Mar 2025 16:12:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1743030729; x=1743635529; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=IZ1oUMJWV5EqNiAudEw/NeW3kJ/2zqRNfZDBi0ZOEew=;
        b=DjlAS1iHihGXnNiwAcKUm6doV6UVKK4ZyN5mPP8mqXVt7oYrmh6mDM7QQIl69wrQnB
         OvD0rRxq+7RxtEyqSNxDUam9LmmdvB99rtbFB4fHzgievX6OdTwQCP+sW55P/tD414Lp
         dVQc0Cq6lTVbckIKFKJeL2vcVhGr7+Vj++d6YjgCXGgnNRBKMPtUr4OxDkqqhT0juJb7
         iYJem9CJtwo/S2ls6EWYsW0Q4Ndi74GTFXMzAeWf3XhyTBOK4EN2XyHEgsBA2c+VJxk/
         2rrY4J6OtB8xxKtSnsBmPKBAENDlbUEsbzxenY7oj0vv7n6EAjh4y5i8novKM30csOK+
         Ls4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743030729; x=1743635529;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=IZ1oUMJWV5EqNiAudEw/NeW3kJ/2zqRNfZDBi0ZOEew=;
        b=TmDAqq8LqASlCzEKPISKC2Lp9/NdAG2BSoZfZnwSm+ts9volHk8YdF3Ps9A2X6iWMZ
         Su8ouG17Kk32cll6NrN6FbBJpS+wsPzRue3A3NEF86FK/Bb1FuRcFZJd5mDdTBTHyPoc
         ZR1B+ScxJjaDq+sxNuJr14DBlAeP2m4Qw6iY82rK/YBdYqzAo5f+C3vKCHirYo3XclSc
         3W0Kpq7RUPYZVXRyHL5384FDiKnkg1FYAWYlLXxE99BrsKTN4uX981zIlFnGHA+I6GUf
         t45hVed3SiFXaoTzKGR179dRT3Z8po6wo4BwmUWThXt0Pmhc1hNlzbA3crORs5Aeo90+
         /Ajg==
X-Forwarded-Encrypted: i=1; AJvYcCXQVPjeR8EPJJtyOvhV0eRhXt4LS7Ajv2a51HjIH5dQ2Y8ExqbzUUr7zAicIWg9b34ZryPOPXJSJB1sW3M=@vger.kernel.org
X-Gm-Message-State: AOJu0YzmqbaPYxaNuJ9OC7NFfoO577o7Y7VX1n+mbUYqWf1LuC8d8+Dg
	MGF0PAGa1QTS9zoyzgMt1fEqyipJjfI/wJarDFBJndnIwVcg3hU3iiJpj41vjAg=
X-Gm-Gg: ASbGnctTezVX+BDOIS4bPOVy6oK9jTWelFQHFUfbxS3OFvIakI/WEf9AC9ZGyk1pwph
	o3KmTn5BG1ZkfQdIwl46Ov8S/1GSKWXd+GvZqzxo2OQ/J3OJJA0IWgBZ9rchepE/4ReM87H3fDg
	bscuO/GRv7FMSyw8fpGVC8rD1QT1Qh9jOOkOQuxDJH+m81ahV8B01zAP3KgGFgL5HBG+cdcK81E
	gFkneKVi/U40f9xy86KkyqJna4DcKbThfIqnTsc6+sn6AuFe/6psMjdeu6Ff8KiI9Vajk1ZydDT
	rKuqx0TM+TDvZZYGNgX6o2D8RRZ/IO1eAIvhGI6ott7JArvFi2THjpzlKYqZF7h2qhJbAsf8RQL
	zjE0ub7XDRQ==
X-Google-Smtp-Source: AGHT+IGjr+qreA7JSvrEvEPOD9T+3iZQfV9rj1gGSrk8rCjB2ZOO0aPA2mIB/U4jI8TMPQySnNJDkA==
X-Received: by 2002:a05:600c:1c03:b0:43d:4e9:27fe with SMTP id 5b1f17b1804b1-43d84f8bea1mr12243585e9.8.1743030729169;
        Wed, 26 Mar 2025 16:12:09 -0700 (PDT)
Received: from [192.168.0.34] (188-141-3-146.dynamic.upc.ie. [188.141.3.146])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43d82a041d4sm18764305e9.0.2025.03.26.16.12.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 26 Mar 2025 16:12:08 -0700 (PDT)
Message-ID: <2a9df021-72f7-4bcd-8c93-634c2b77dfe1@linaro.org>
Date: Wed, 26 Mar 2025 23:12:07 +0000
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 8/8] arm64: dts: qcom: qcm6490-idp: Add sound card
To: Prasad Kumpatla <quic_pkumpatl@quicinc.com>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>
Cc: cros-qcom-dts-watchers@chromium.org, linux-arm-msm@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 kernel@oss.qualcomm.com, Mohammad Rafi Shaik <quic_mohs@quicinc.com>
References: <20250317054151.6095-1-quic_pkumpatl@quicinc.com>
 <bmCbxi-K3naczb2RWmUcQbkKEJgSGyXXi7LGAlqE924ZfgXs-H6O_xhcHT-7pWOwA3eoZcxNOwvpuPQPA_DXUg==@protonmail.internalid>
 <20250317054151.6095-9-quic_pkumpatl@quicinc.com>
Content-Language: en-US
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
In-Reply-To: <20250317054151.6095-9-quic_pkumpatl@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 17/03/2025 05:41, Prasad Kumpatla wrote:
> Add the sound card node with tested playback over WSA8835 speakers,
> msm mic along with wcd9370 headset playabck and record.

I think as a reviewer I'd like a better description.

"msm mic" doesn't mean much - please specify the number of MICs and 
their type - "four digital mics"

MSM Mics are not a meaningful description.

---
bod

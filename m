Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 01F77198E9B
	for <linux-kernel@vger.kernel.org>; Thu, 27 Mar 2025 15:28:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743089320; cv=none; b=Ro6xgUVbRP8TtBwmRKou+sqU+OOF2b4l3Y3HwrdFhEpGcqxmkqmFe7ZAOJcLjhwrTp9EB4yZ6J5YtMktYjqwK1QNf3o/CzrfN5GL4QFZ0mVk5ZFoYCYqlArlQFuQHb4E+aD8SfsaGVez1CiPIHuIb89EzTG8WRps67sWAJydN0g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743089320; c=relaxed/simple;
	bh=1/Xh1YTj3T8SDNh7s5nflXDE32vsD7ydzcDzfXrzX/A=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=m02JKniwZUzTAEyG00x9iXvRFfJmDs1R2ETyCPXjm4xcq4o9V1A1PMAeXjAGgglBOOuWbeXClppPpXBvGAqNR5RPhdry/XfU3fXyst58cbHnu9XS8QBSakVlQK+uotyKkX9lB1ibVT/PXUKPkQqX+ZkuwIgGaIoW9AstSOEcuWE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=sb0Urkyr; arc=none smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="sb0Urkyr"
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-43d0c18e84eso5397725e9.3
        for <linux-kernel@vger.kernel.org>; Thu, 27 Mar 2025 08:28:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1743089315; x=1743694115; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=DE06nIo71/Mq528QWhpVuT3dqschnPU18VT092l6miM=;
        b=sb0Urkyrcr2wBewLD7s+rGL3gBBfpOjilCMkQG+PGENV4qpH2iSTIZKkp6BGxIQKuS
         GhG7JORwl1NZHTe2QTWc2CT8NVAODcIj4v1FKUYWjgmTI+FeXiBlfnSV5HlKEEA8I3VF
         PoHJWy3qPxnneigS66CwpfMemvlVg/kc4giMH0wzVG0NRPonqycLq2uUsgseFpIjZRGz
         0eMgriHzuUWhGMBkMVYvQ0jA62ZdQVpuqrigrIBa/EU8S1ToAgcO+m5Dv5Kj29uQ+VYV
         BUpz/w7MeLZYYfP+m9mVuQvSn72g2UrQIagXr0bRgwDSA6J+hdvyC0k10WCSmKTXuYCG
         EUXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743089315; x=1743694115;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=DE06nIo71/Mq528QWhpVuT3dqschnPU18VT092l6miM=;
        b=OO3GLqY2XrLmdlJ0TmQLJGC0ddHtNyERDBTBZ9zjVISyxx1EIJTYFOqf75/wpNAAZt
         hFAE1HGs8tDskZUuNmyxROE9Tpg9sQyi4ZD5dxPYkcxQrXxvGUZHo8XZ4AZY3sf02rzS
         l+Iry8XiNFIiX1EyUP0doT9AO/MzYO4tiWBTOCRexdXIMseK6NTgV/AfNJYyNaTRJZfJ
         EYlaGOOeNM/dSBFOmaIJ6b17Q09761tVGyMXhv81JMJGGnjX6vDdcO726ErfyUxIGkFg
         /jZTVgMXVYuGqvleef5VG/2z2XXbfPQHLA8IV7aHPV2FlV4dGCe5Xh/kFMWpFxyMj7ZG
         pNuA==
X-Forwarded-Encrypted: i=1; AJvYcCXVbLenRXgmmouZWScfZB6nEqJxtgSEqilGWiLSWOTZK5BeT/ThrYq3TPkDx6ZH2ztH+mPlszmOGhPwXno=@vger.kernel.org
X-Gm-Message-State: AOJu0YwpaKovO4nJeB/jZZb/FJE5TxIqRN0jIZH0faR1nE2FonVvMak7
	uDTWi+ib/4sA7wai+IlOK9LmDin1wyk9zIkhpaQsZeyviFZk1BlJ4xj4OyrYKxs=
X-Gm-Gg: ASbGncuZOF7I+/oTegBmgvZfzxfXomXTQ3BWY2CUyRCbkcgWAeA9qYbJRHsKomXa/oP
	zKHDQooJ+k6h5dCMaHoL6Se+vqDpHFYanjt4OvH9D0gtQL7Nty7uaeZfgf6s/JsJ/P496g9X0hN
	Ko8LbIp7kwUAQtmnuVE2JLwwOFCfIX7nxkhMnxLlmKIaw41PjRd+prAwBxkRYLgFj/B08U9tlZc
	TuNI2ihIjZd6ChKjdnyP1tGM+qXAygQa1HzbvrpelapaMcYfN6nrihqwrerwg0SBzt7jH4MlKkD
	c6Ein54IMKEcaCAwlEAOPKfmr/LtGn5DoY+Y14olF+5fqbLabtE7CplI+++ROIKvLMitTXTybj1
	h7PEeQy4klQ==
X-Google-Smtp-Source: AGHT+IFNIkqkO/Sz8Zoq2RlgMDHLZQ4+HD+omJCdCjySdmnror3V45qCoIHUI3fPbTVEMJl1bOlNow==
X-Received: by 2002:a5d:64a9:0:b0:390:db07:87ea with SMTP id ffacd0b85a97d-39ad17704c4mr3242572f8f.34.1743089315216;
        Thu, 27 Mar 2025 08:28:35 -0700 (PDT)
Received: from [192.168.0.34] (188-141-3-146.dynamic.upc.ie. [188.141.3.146])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-39ac67970a2sm10007035f8f.16.2025.03.27.08.28.34
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 27 Mar 2025 08:28:34 -0700 (PDT)
Message-ID: <c58b129c-1c83-44f3-bd52-13cc24e50cbb@linaro.org>
Date: Thu, 27 Mar 2025 15:28:33 +0000
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 03/18] dt-bindings: clock: qcom: sm8450-camcc: Allow to
 specify two power domains
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
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
References: <20250327-videocc-pll-multi-pd-voting-v3-0-895fafd62627@quicinc.com>
 <20250327-videocc-pll-multi-pd-voting-v3-3-895fafd62627@quicinc.com>
Content-Language: en-US
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
In-Reply-To: <20250327-videocc-pll-multi-pd-voting-v3-3-895fafd62627@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 27/03/2025 09:52, Jagadeesh Kona wrote:
> -      A phandle to an OPP node describing required MMCX performance point.
> +      Phandles to OPP nodes that describe required performance point on power domains

I believe we are dropping "Phandle to" generally as this is a redundant 
statement.

You should also pluralise performance-points.

.. required performance-points on power-domains

Other than that

Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>

---
bod

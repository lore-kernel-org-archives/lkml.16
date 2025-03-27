Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C9EF0192D68
	for <linux-kernel@vger.kernel.org>; Thu, 27 Mar 2025 16:03:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743091399; cv=none; b=eXuu/Mn5iF4FW/xzVkAtPov5BX/tKDWucHtve/O2BEpIN1h6r76ayKhxNgDuBgBQjLhucadY77wEOpzBEhx+RbQzIvDgeaPYjBPZvFfGqxjkFJi4ugn1jaFY5O0gAj3kElj0GO2MtxWpaZihWXLv/y26kJnA1CFPVEBHr9Bwxwk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743091399; c=relaxed/simple;
	bh=81QR6vZ1/3dHfg19CnDyBrh+7J9IpGW7HgshSplRzy4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=gQ905sxcLehwCZ3Wyo1lb+EwhpBQqVBpwlBHeLxI00oqE1eZAqlUe9Z5w6ElAOuh5SvP+vE3909IGRzACt9/GN2NkyDCIYpBBljj4uNemfImtILHk0J/bT2/VTPlxBlOgqGxIdGnA5XGbpXJA53Y8Ca/d8wPgzlCt0Nq7CoWtCw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Mrf1bEQR; arc=none smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Mrf1bEQR"
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-43cf05f0c3eso8890655e9.0
        for <linux-kernel@vger.kernel.org>; Thu, 27 Mar 2025 09:03:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1743091396; x=1743696196; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=81QR6vZ1/3dHfg19CnDyBrh+7J9IpGW7HgshSplRzy4=;
        b=Mrf1bEQR6394+stuB5J3/mCriRbuwaTINQqx7lqaEaUvCmuAf8u7j8c7EBCzL78tVl
         XApjcVjPV3fKemEwO+64ZG33my5Kuj9FbANbov3gxBWp0jl/2LokeOst48q85QjQyARA
         1gXwkasFHGcxXg1ZDCaaah3ksD2afOtJcDxfcMhDwGGmaLpIvcuRJcv1E/+PiGEP5dPs
         UF0L2lFb3Q5ETCpiVEP9YVxsrnGg49BNq7vmAov35/GGeMOPfO2NmX01ZPXfEEmnPMHJ
         ZUt8MRGGJZhxj0Np2QOalONkIljhEaggciiaNbmstDlJXoZ02jJEl9HRVNGQBsBJ5890
         rApQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743091396; x=1743696196;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=81QR6vZ1/3dHfg19CnDyBrh+7J9IpGW7HgshSplRzy4=;
        b=ExQvfENZCEcMlQVc0XSl75XrYQbtCN1VUqKgv4aWInOn1GqSVOzLLOR0gMoQbHwjVY
         9FpqvVVPkgWUi5NOAxp+2uOvCe6X+iY/LL7hSIYoFi6Vj0ge8HM3iHLkRgY9z/HlQlpA
         OiiD9Z4Zq1cYRPDGFCP7fEeJ451F6jkSQpts2jDl/3QEMSDpgZLDoJpQSrWpJlz3cfTZ
         75wF8etMRg6EMFFt9qERiCnYlPc0Xg1jFxc5qbfgzr6lzsZ5riAQY0Z996vZgr3fB1dj
         lDF5wk2Qe7Ik5E6z9BP+Y2MHPAGQfVK36sC7LFLwzEBcCR38qbudM9PHv/MprVXLrwUy
         UuZw==
X-Forwarded-Encrypted: i=1; AJvYcCW9wP0wFpks8G0dnlzv0yTyoO3x7jKvA6Vt1oDBE0Zxqe8YhnmSYNJR3YcCyQq6/wdhGDd2D5hzTdvCX7M=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz6TVbNNUw8B6RmtZ7o4kcLuaHaEuxAe1xVjeUUWahHmI1MuEkK
	OAlwBrGDEMwnz6/GmG+otpgL8/ZVSOxp13pPnsXCvmuih90xVv2oR4lTuFbw//c=
X-Gm-Gg: ASbGnctagvGwzop8g8Ef+CerRvzDCeQS0JqPGpmU4YVrSFdnX3OE9FFwARjfaEfhwYc
	APKdZ3r46ku0ye/nnChn1brq/qUgwSI4c3eIp0EmMozn1YU+/1USdP4gBmo6wQEsYvMttQeUc5p
	LLt5qduBRwy3r5ziA7HfZBwuNm8yMvEylI8FCxbPyb1e5FLeROk5lAfxv234aQYs/QXPkYx88qz
	VVquE4iDmeyfiNgP/fWpg7/I3IoTJF9Joz3nKnnueVSzTr0qoQdusv4H6+h6AhryVTOyckX+C41
	JPOUudkp6N0TQGb+LJ55W/B5+vsOG5fOXGiDM8ZhLitytpBpZUjab4c/rICNIg2w0EdwAJFdHJm
	AlXHhMnMIeA==
X-Google-Smtp-Source: AGHT+IH0JdzqVvGdTYUoLn8HEZhsvGhRyL19/EW44GliMFz0RsNCHi1bdJHTLqu2hnfMAiUqwGBreg==
X-Received: by 2002:a05:600c:4f10:b0:43c:fc04:6d48 with SMTP id 5b1f17b1804b1-43d8a32c74bmr25755085e9.0.1743091395532;
        Thu, 27 Mar 2025 09:03:15 -0700 (PDT)
Received: from [192.168.0.34] (188-141-3-146.dynamic.upc.ie. [188.141.3.146])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3997f9e6445sm20395820f8f.71.2025.03.27.09.03.14
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 27 Mar 2025 09:03:15 -0700 (PDT)
Message-ID: <6063c030-f96d-4950-9ce0-473368988a07@linaro.org>
Date: Thu, 27 Mar 2025 16:03:13 +0000
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 16/18] arm64: dts: qcom: Add MXC power domain to camcc
 node on SM8450
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
 <20250327-videocc-pll-multi-pd-voting-v3-16-895fafd62627@quicinc.com>
Content-Language: en-US
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
In-Reply-To: <20250327-videocc-pll-multi-pd-voting-v3-16-895fafd62627@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit


Your patch titles are in some places missing the soc:

arm64: dts: qcom: In this patch

arm64: dts: qcom: sm8550: In the next patch

Please add the SoC names to the patch titles in your next version

---
bod


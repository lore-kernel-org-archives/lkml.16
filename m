Received: from mail-ed1-f53.google.com (mail-ed1-f53.google.com [209.85.208.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 22F962566D2
	for <linux-kernel@vger.kernel.org>; Mon, 10 Feb 2025 18:17:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739211461; cv=none; b=KnS2dackeqB6fv64kUZOt++zFyjBDZVAih+0gziVfl6SNY4pPEnO8pxZbfgSHDWuRekIuHpEQOBZiL0F9dmKIvPRDsGGRS0l+VBQlPPXCQz7aOMfDqXMWko2jl1B+Fu2Hczn53/VdAQYDzIbpqGzbsgqqaeLEk3vwTP2rchPfGY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739211461; c=relaxed/simple;
	bh=Wh5yx6BMUnphP2RVBhvJu+atXSSYBvxEAcLfKspktSE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=XGJENo0Dlu9bQU8E1cfPUXBAcKtWZ6AcoOix1qWYZoxqM1sRKanyAiVX06AH3s5IaFWPBdPSGe4LKRzOUGAKMTJUWr+qwDOqAQdZ/gYNIq3BRFejc6guvetcvCym5+kv8/itsgIYC0p7rowoHeBTZdpKq6X0Kwodc7UzTKCEZM0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=PsQprjGz; arc=none smtp.client-ip=209.85.208.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="PsQprjGz"
Received: by mail-ed1-f53.google.com with SMTP id 4fb4d7f45d1cf-5de74599749so2315718a12.1
        for <linux-kernel@vger.kernel.org>; Mon, 10 Feb 2025 10:17:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1739211458; x=1739816258; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=qHaDIsqj34B8usesjY16LwOg4JnnE1Cbsm7V9RJsdE4=;
        b=PsQprjGz3ROFlSIQZf+hdQLGtFdi6zZZR9+GIGFv2lB6OQyU6mrcFoC60ODFSq74PW
         oBSuTWodn50rcSzX/+F+W3s69hs66SENM9HFRmd3NHK2jdkimURKnlJ264OE9oHxRlB5
         NutwbHN641OhEOxVfLRLLsoyI08JD7/IJNGrpd4/rufdwH+dTW08pdv4z1J5isqAuGcf
         PNSbvRoKIxkht7ggH2D8JDtwmGDhK7nHZjwwpgunWIpqcoNodRIMZTsCiC0TJve6GQXr
         7Fd4THN2slCEQdeOJHR+AkyOMtp+OCDxPhkdf4SKmA6IF3tfoIQbg1Db7uKS63oSjWqQ
         dHhw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739211458; x=1739816258;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=qHaDIsqj34B8usesjY16LwOg4JnnE1Cbsm7V9RJsdE4=;
        b=KvAi2uCSGC2Z4CteuKh064zcehstWaI2eZmmHOcLS9TibhYgB1qmLeiCR1BXjzj7rw
         3xR6MVS9omCioz53ZtszwMM2SlFz9d17znXukJshh+4S3aj8Z/sAYnh6FCPKHGJrm6Gm
         zbWuZ/zxZMvRVULHmICyUWwHQL/2siEmN0si0wfzgrOLMSROch/oimLHa0X6SgQ3/wC2
         kkFssm6GhKBDml9zztNqzOiZ6qfdNiYT8IaOtbo3p4qSfA24cwWadAzy3oZlWulE4cw0
         8WP8zSoRbAnrwa7hwMU0T1VWunO4qoIjZeNZ5VgriEwNFgRl3T3g0XqFtMrRmnZgV8KF
         PRKQ==
X-Gm-Message-State: AOJu0YwlNro0xqrspSauvvjSvtDHzX8NqDmUBQ9Kpnih0kPhu3R6HUSm
	WS/08+n5gAOniTznhMlceY5j7zVeUQxMQFCpyvTDic8FBaHoc+MeHY7joPY1qvw=
X-Gm-Gg: ASbGncsWkm6bnP6RDWWaJcTiy8e+plpj8wklZ7exe1a2/bJpw4sbiPV36dWGONivxsY
	x04O24v/zJHQatg7uC3QpU4iPjK5BjYdOiKVoDqivg8fMxz+itjxqLKTDwqdusXOkMnEpaW7RNT
	p6n+2jf+8g12kZ0W7jaOlgcpgbRFdwnA/LrSsAeHgmYGO7KlJ97q0rTU0Y1bW0KFWGE2Ayqmbh+
	tNvpjEDR55MU2qMyP5d8J/YEKdxXAJNpfkNNCdZ+p+h6BoVArRtQJFcGKKT+S5LDlykKNque8ei
	BAT7WGM98AH1mkXLzWtunJJN
X-Google-Smtp-Source: AGHT+IE17precGVn60p0mKS1K0f7v1etGQpp1R/N00rlHb4aVUugfxbIzoj2Q7spw41fxBN5V9dokA==
X-Received: by 2002:a05:6402:5290:b0:5d9:a62:32b with SMTP id 4fb4d7f45d1cf-5de4503ff1emr15027701a12.7.1739211458355;
        Mon, 10 Feb 2025 10:17:38 -0800 (PST)
Received: from [192.168.0.14] ([79.115.63.124])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5de4690311csm7037457a12.60.2025.02.10.10.17.35
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 10 Feb 2025 10:17:37 -0800 (PST)
Message-ID: <88c69965-ed8b-4895-ac99-11a6cddd1a42@linaro.org>
Date: Mon, 10 Feb 2025 18:17:34 +0000
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 0/4] arm64: exynos: gs101: add ACPM related nodes
To: "Rob Herring (Arm)" <robh@kernel.org>
Cc: linux-kernel@vger.kernel.org, Jassi Brar <jassisinghbrar@gmail.com>,
 daniel.lezcano@linaro.org, devicetree@vger.kernel.org,
 Alim Akhtar <alim.akhtar@samsung.com>, peter.griffin@linaro.org,
 vincent.guittot@linaro.org, Conor Dooley <conor+dt@kernel.org>,
 linux-arm-kernel@lists.infradead.org,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, willmcvicker@google.com,
 linux-samsung-soc@vger.kernel.org, andre.draszik@linaro.org,
 Catalin Marinas <catalin.marinas@arm.com>, ulf.hansson@linaro.org,
 Will Deacon <will@kernel.org>, arnd@arndb.de, kernel-team@android.com
References: <20250207-gs101-acpm-dt-v4-0-230ba8663a2d@linaro.org>
 <173920411592.476427.15574016492470186426.robh@kernel.org>
Content-Language: en-US
From: Tudor Ambarus <tudor.ambarus@linaro.org>
In-Reply-To: <173920411592.476427.15574016492470186426.robh@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 2/10/25 4:22 PM, Rob Herring (Arm) wrote:

cut

>> Bindings for google,gs101-acpm-ipc are proposed at:
>> Link: https://lore.kernel.org/linux-samsung-soc/20250207-gs101-acpm-v7-0-ffd7b2fb15ae@linaro.org/T/#mb557ee342de628b1a8e462d4fb7c3ac6eb8be4e4

cut

> New warnings running 'make CHECK_DTBS=y for arch/arm64/boot/dts/exynos/' for 20250207-gs101-acpm-dt-v4-0-230ba8663a2d@linaro.org:
> 
> arch/arm64/boot/dts/exynos/google/gs101-oriole.dtb: /firmware/power-management: failed to match any schema with compatible: ['google,gs101-acpm-ipc']

Thanks for the report. The bindings are proposed at the link above.

Cheers,
ta

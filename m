Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A073DE552
	for <linux-kernel@vger.kernel.org>; Wed, 14 May 2025 07:56:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747209395; cv=none; b=BNcsilAFU74VFe0hW+g0z0KuQhOLJl3gI1ye2Tl9IWXMuJWsvL5GAS32PMRIr/PRI3yTQQIFggb+Rq+UtUcxjY0KFyHEFbwTyxTa6KWvu/tT6JfkkmO6lK+y/oLBj99L20Q9ADqcRNbkWfc4UY+q6eZjkn/cHvlGyeOU73FE0BU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747209395; c=relaxed/simple;
	bh=+3wlSK6sNuj1hJ53vZwNck4GrD0vsQfa8KHIu+ZltUA=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=i9gh9hJqgSmanq5q7ysOIOurQaqmrMbazDpUrq5wt1TPZXTUsqVNXpgtdeSn5BU8Mvy2qODLqlVEhM4YiIZTtSgpI6hEmyVaHgF8DJ1qdfFQP6fR6mswPAzC/zbR0Ce6e1beJMWSxLjtYJrtNPVN3vbIi3rUtaUh3yommN0L4C0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=oru04++C; arc=none smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="oru04++C"
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-440668acbf3so3566425e9.0
        for <linux-kernel@vger.kernel.org>; Wed, 14 May 2025 00:56:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1747209392; x=1747814192; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kzdTMooCqa1ypmINEmlgL2G2QWjmPcr5NoyztBa2Ur4=;
        b=oru04++Ch4k9Jgno/Ksja/d/CPckpERKJSC9bHeQs4Xe7LiAaq+eGACkcZyO4+zt/g
         5p4weSsO47Pryl6K1aBJ+EulOdbynhZYK3l4+35mzosxLyUm6RnjZ88HSMqmAnAGB2Z6
         G5EtrUCE9W1xacM1peehVB94/Keeln5pxa+l8eJ/V1WGwNimpSX7Z+1LGp2Z0SngecC0
         xplMzCOL28XR83u69UvmDn2IBR3zIelN3bqfJsck8ZkoN/wWodx8cubPdm/KFnUIidry
         JvnWe2jRGvqDBAU9qoNnc8R+aDGaUWaLBkSfp2vqLJ6Fx0W2KpuvNxju7XIkKAzITyrx
         lYsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747209392; x=1747814192;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=kzdTMooCqa1ypmINEmlgL2G2QWjmPcr5NoyztBa2Ur4=;
        b=BT/wk1hXv9c72MWVW/D+tbq0wyCP4Qkf4YCZts3pbLnuLLfUQXHugzD6beCbhmww1F
         e3Jrne1fU39jtF1mZLiuVnQLc5Uxs/Ewcb5p3B/5p1GwOBIwDOehtjDNWGKONQPXBs/o
         0htQRydnHzAbzf5Xpee6Nh2oZReFtJUx/RlUW86u6fChRTUVwUqPU7r6yjMggLBqFHO0
         40l0zoh4vVns1uKy78+e72VBmBWs3uKlr+GXrLc+na8aD9u2ALQ7OJpnBo3ocgDpl0F7
         uUuqKfjInStcEr2qrwQFuZKJECVgKZSjWuC6QdkykgEGIkAl/WWKgfe9htxdughMu8xv
         erQQ==
X-Gm-Message-State: AOJu0Yyy1sluVQQWDqIQisPCXGBQFVa4u/NPOZxISSu35hnzlapdPnMn
	3yNWmGCwJD1AvjwelxRm9AtqCXhUScnFo/XKJl8GH9AfLULHzUY+4o8NS/tu+WM=
X-Gm-Gg: ASbGncuvZdPPfXBaO3RgEy6T14pcmRIGDS5yvTTqazPyrEbT2Ohj/zBRP+UnF4Nnfrz
	XvqljN8wrtMD0DWMeWTSWcBC06GP0gIj73W9e2xUWgnu4MW8Or9Gg/yf27dtQzJ2qvZFJZWDZnK
	smVmO1kM7yNDSp+nlQ8OWICxhhB5lgx7TdnqFsci1AmPjH4FuglZhwkEa9PdEEzzJH31mmgMOCL
	rvcxnUiZHZreYL1N/o5FTeEBzNsoRWenFeF+nMcmyijg1g1LiEXmn7JoEd3ENMh7Z3zdGMN0WBx
	prPI8XVsoUMNBym/bPi39hpZsOR8YIKEWFXiVm87Hp6PAZoVE896g4kJxu+eTXn5sjZWbfsB8yh
	WqPQ05jIuqXzWsCJfaw==
X-Google-Smtp-Source: AGHT+IHHtmTfTDqpI8/MhLKS2/FzVY2p3LpVRtEE1jaQ17ol8rPj7ZAtenjeKA2K6/4xZEMzO4yRQg==
X-Received: by 2002:a05:6000:4007:b0:3a0:75ff:2d94 with SMTP id ffacd0b85a97d-3a349699c5bmr668843f8f.1.1747209391885;
        Wed, 14 May 2025 00:56:31 -0700 (PDT)
Received: from [10.61.0.48] (110.8.30.213.rev.vodafone.pt. [213.30.8.110])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a1f58ebd75sm19067112f8f.34.2025.05.14.00.56.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 May 2025 00:56:31 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Krzysztof Kozlowski <krzk@kernel.org>, 
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
 Alexandre Torgue <alexandre.torgue@foss.st.com>, 
 Christophe Kerello <christophe.kerello@foss.st.com>, 
 Patrice Chotard <patrice.chotard@foss.st.com>
Cc: linux-kernel@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com, 
 linux-arm-kernel@lists.infradead.org
In-Reply-To: <20250513-stm32_omm_fix_typo-v1-1-5b90ec8b52e7@foss.st.com>
References: <20250513-stm32_omm_fix_typo-v1-1-5b90ec8b52e7@foss.st.com>
Subject: Re: [PATCH] memory: stm32_omm: Fix error handling in
 stm32_omm_disable_child()
Message-Id: <174720939065.5575.14505161452787178403.b4-ty@linaro.org>
Date: Wed, 14 May 2025 09:56:30 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.2


On Tue, 13 May 2025 17:34:31 +0200, Patrice Chotard wrote:
> Fix stm32_omm_toggle_child_clock() return value test, we should exit
> only on non zero value.
> 
> 

Applied, thanks!

[1/1] memory: stm32_omm: Fix error handling in stm32_omm_disable_child()
      https://git.kernel.org/krzk/linux-mem-ctrl/c/388d0cc33cc6fc876e053644d6af694b9d5c639f

Best regards,
-- 
Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>


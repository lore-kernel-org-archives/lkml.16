Received: from mail-ej1-f47.google.com (mail-ej1-f47.google.com [209.85.218.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A67A2561A6
	for <linux-kernel@vger.kernel.org>; Mon, 12 May 2025 06:38:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747031929; cv=none; b=jdmpcwkFevzlf9XPKLTF4OauJYz5/0Uk+pUp6taG9QeaFWazeSRq02AfaJ0BZnj6lQEj5EnjhvXSiwFNjATQ5ZCM3oXCqEuHTe8LBY9ntLBY7CZtpikbmudzba2UNcYGkq30y9/uDZ9lkkH+zf5/qfgvLULl8RFkYbWT2dhswo4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747031929; c=relaxed/simple;
	bh=SRofOzVkLTrjhEafbeny8N/bESQdDcOpa1YIDYgmAQ4=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=b/ja+Zpm1cFovD7A8uffO8ZB3rIiuQ4o+ESH5wvKlA3o7/DbbEiPoBkoExXFJu0CkJLcjl+hQ2HKViEZyVQ2nVdCeE4YU6ZDnjb5VCv2Otz5AbJzHq2VMOSqJocXFjU5vTSoctHPcPGU924DQwYNLowWKWmVvN4JsEKI8Y8Daw4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=vpAZ3/Wm; arc=none smtp.client-ip=209.85.218.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="vpAZ3/Wm"
Received: by mail-ej1-f47.google.com with SMTP id a640c23a62f3a-ad241d7680eso3081066b.3
        for <linux-kernel@vger.kernel.org>; Sun, 11 May 2025 23:38:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1747031926; x=1747636726; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=EJjA/FXfjTD2FQE71QWuHDCBdzjs/ZNL3lM7sCOkk4k=;
        b=vpAZ3/Wm/OSsNODrduuEB52zBBcYzTxvdXIvIxfQiNt83ye7nHKdjKn0WYTfouEmEH
         zsHjsburAnQooOfn865sQ9P6L8wWpHNE6wGi7AZjv60ewrhuuZVlv3P6S31IcjHMIIQW
         MxXaCPmVZBOauuupi6woAUhFNQYqbgWeVtsCqh+2yr35O2lARUa+dNIb/Utxw0bM3AHF
         6J96Ma58WMk7DMJPwyAIv7YMgPQe712DMaHTqYLJjPMn9pUI9jHc1lf/MLkoUBZrHseG
         QgMtV5gRTHdOx/IXJ71OUKMehLpyI07C+ssINUq0AxAf4bZNZvdrtkoZcVaRCzmOkNUh
         OPCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747031926; x=1747636726;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=EJjA/FXfjTD2FQE71QWuHDCBdzjs/ZNL3lM7sCOkk4k=;
        b=fzXgIZdAuiOUerjrFgUubHx5JzHqvvssNPUXmJKi2AB/METNRbLGfiz3SusVj5LD+R
         xgta2KvkZ4ysVS/d120RFf8swKEqTTX5Cqp7sMoqSgey2O5AUY6eWjSWGzfW8Nrf7kjd
         IzvnprnwlS3Okwdh0zo+5UV5vMeoox4j3umhKxiKJW+DdiePD/5VsoL7vFQX6sW2v2Gj
         iWAT0we9SOkIJCWV6fIEKOgmHJltNI+nTaaDIzbYYk578fZZ2CKrUCAY4qVp+qRw6RVL
         LVWAzzEIg66FUGrU63P92GceqfONKBprP/Jy61FTOjc58lxSqSOBiz7Agbv9PiEgm2LB
         ynvg==
X-Forwarded-Encrypted: i=1; AJvYcCXLD2VtH33Wr93mNSwrM0bl9874Hnhnmq7KyDdFWgO63UOLyD4bsbO3Omt0KVhXPbl3qBsGeO7tW9IieEk=@vger.kernel.org
X-Gm-Message-State: AOJu0YxUAaU9EwwPy8qVfJ8fsiVWEGUxd7YFJCzx9MZTWGmB/E+J3DeX
	UW/KNl0GRWU+ciEBupFtr65PTwLk3Zv+ZF0A+icHZSMBnjQ+jPQGIBheWT2a2g4=
X-Gm-Gg: ASbGnct8J6sSrTjSGSgj4sRy4Q1WWxOSPbglQ6VGaRYbQYX+qnLzsYTxP9cWWg+HOPp
	eNmjIElGkR7GGuo9GCDqOQ/LhzcCsK++7JLCqR09/FfoIRtD386dHJp5Aqkw8kMHC+/d+9Xj/Gn
	5cCcH0owtKMGjEwyIToWU8CVQ3Gpp18QG8BazDFbMFMOO36Jk7Ep6f3d+NCS4VWRshN8dd1/0z5
	8NAiRTA7TvrRXy5/VP9KqYXEaTcGisFEIalZLvbMdAvW4gODcSW0PS3vRRiBFpOxp6NhDYZQ96n
	RQ+HZI+EhRtk6dhPGj0jP+SsIdPlBhjtVS+CI/nZGpB4xvHpaOVNiXvdytcAdM5SJd5ZeeU=
X-Google-Smtp-Source: AGHT+IHbNmFFgqP2TaNoo3r8XCJ2lXf2VHRvee7H9H7Ew0FqMOfSppy5wk3G+RtUy3MhkVtZA75gyQ==
X-Received: by 2002:a17:907:2894:b0:acb:7dde:d88f with SMTP id a640c23a62f3a-ad21975a11fmr359134666b.5.1747031925716;
        Sun, 11 May 2025 23:38:45 -0700 (PDT)
Received: from [192.168.1.29] ([178.197.222.234])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ad219851314sm565951966b.161.2025.05.11.23.38.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 11 May 2025 23:38:45 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Krzysztof Kozlowski <krzk@kernel.org>, 
 Daniel Lezcano <daniel.lezcano@linaro.org>, 
 Thomas Gleixner <tglx@linutronix.de>, Rob Herring <robh@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Alexey Charkov <alchark@gmail.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 devicetree@vger.kernel.org
In-Reply-To: <20250507-vt8500-timer-updates-v2-4-65e5d1b0855e@gmail.com>
References: <20250507-vt8500-timer-updates-v2-0-65e5d1b0855e@gmail.com>
 <20250507-vt8500-timer-updates-v2-4-65e5d1b0855e@gmail.com>
Subject: Re: (subset) [PATCH v2 4/4] ARM: dts: vt8500: list all four timer
 interrupts
Message-Id: <174703192445.30990.13638059295757874601.b4-ty@linaro.org>
Date: Mon, 12 May 2025 08:38:44 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.2


On Wed, 07 May 2025 10:58:33 +0400, Alexey Charkov wrote:
> VIA/WonderMedia SoC timer can generate up to four interrupts corresponding
> to four timer match registers (firing when the 32-bit freerunning clock
> source counter matches either of the match registers, respectively).
> 
> List all four interrupts in device trees.
> 
> This also enables the system event timer to use a match register other
> than 0, which can then in turn be used as a system watchdog (watchdog
> function is not available on other channels)
> 
> [...]

Applied, thanks!

[4/4] ARM: dts: vt8500: list all four timer interrupts
      https://git.kernel.org/krzk/linux-dt/c/e58afb3e1f365badd69aad6f0d53a2c66a63f689

Best regards,
-- 
Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>


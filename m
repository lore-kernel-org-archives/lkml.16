Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8A07F298998
	for <linux-kernel@vger.kernel.org>; Thu, 12 Jun 2025 15:26:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749741974; cv=none; b=co2dgh/4IeMWofFyY4VfOqSrzSSLiBiQDJwbhWTo7NkiyBIhWZuRhCXp4jgphjC59Lp4djzqL7lNLPLqhaYoDTTK3mWvDTl+J9Xy1JZh8/yJ/5sTAdUXw56kuvMZUOQM/HPPr2CwvVDpBJbBuAVMbY6j+4iO4Eo2Ort8hhdeYnI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749741974; c=relaxed/simple;
	bh=uB2/+QwynZ8vGenLrGbzuTkLtOtaUNYpuzBG5pr5iYo=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=CdJDZdQV/jMo7RfsQcKUiLbc/7MoREuTjabkmO6g2Z6fT9OhFCSuCkAULBtOr/crIPHUfpgaMQd9y+hETiAYAYl9OZWyfsHsoTxJr4My2eenSN78kI+PIUe47DH4MGNQC00P3v5LhGQggI4Qaj/eB6W7MMBkx8thkl5Fsdyzhpk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=g+/HFlGA; arc=none smtp.client-ip=209.85.128.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="g+/HFlGA"
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-450cfb8b335so1007675e9.2
        for <linux-kernel@vger.kernel.org>; Thu, 12 Jun 2025 08:26:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1749741971; x=1750346771; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1sBKmOIevGi+6n8iHRw7aDQ4iSU3hQcgvE0ZLGu7yXg=;
        b=g+/HFlGAXuJrWta81+hHc7MJLY4zja+GeZEUd6utlfIaY405YkjO413DGofZgg+Kuw
         VKNugpoHEuAUNMnbpiRmfHWzuLKeWIA0tCWfDT2Af+WGCtybru8+wMcLr9ljHaiItU1o
         /S4ge37Pa3X9RKMadVAyJQ2yzvP0gOQ+BXaDo72PEsC9hgzNF5b9ip09MESHRKbOMwaX
         LyiPLRKZZZ4Isrp0S9gY18QiUAad1i52sK4C66iO9hRhIWuSIa1sXQ+qGlfnpDIDBrm/
         p3W63tlfjUMLnaLRCmaLeUfr905S7K6QUoSVJL7MqeZ8weC08bj3R9K9eiHdvI0W4w6D
         ur2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749741971; x=1750346771;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=1sBKmOIevGi+6n8iHRw7aDQ4iSU3hQcgvE0ZLGu7yXg=;
        b=nXvvsXSUTd6Q2jpFIAgEnQy70n4I3R0YzYOo5Sp+EpOHq/1NLxsrA+XSm4Zr9C9GVl
         YXO1bsuutgN8ciMgrtL7jANT4v7sQaLslPIxu3SZjF2wHV/3KrMfeHgTYH+1LYBPDUFc
         L8yf9Fdx7fGKKHGiJYZkIqh0I5ph0V2B2Y/hy5Hw3F1xpVrK2yLacxfVvnTgG1QmkegB
         Hw1MfoKDpXO7+L5EVUbCp1GTFVNEcJX8/+nVZiPTAOKv97RI+1hbX4+uF50nhCl861kv
         R3SMthQ7GE0YW53ZVxsnyvDYTLilwywFDI09N45RsFqVKqvbEk5q1xUc9SASFd9/aRJo
         pFAw==
X-Forwarded-Encrypted: i=1; AJvYcCX354JaLairSwcBIZmPIJzgiRx2JkRMzzzbFpM+9OpkaWGGkSi8M4Y2JrkYPt7DiH4J3+0H91gtC2OEW5E=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx2byYhyvLItEy5zTf0XKmUpRebWyTO5s2dAUKTYEYHYGfnKY4X
	P41qRQ6+Pm9gJyD+UL2FVcGTQ7volYAvSxT7OQ8rUWlq3Tb/AsK+BFUJ81SmatIDOdg=
X-Gm-Gg: ASbGnctReqq3yljX29vjcrmky0hLOjuylFI1yj1qAl2tfxWjCgeIE+bL/0Yc1O6Hvfg
	1nnNO6C01lRQPu1zSa8cx8iLlLWNiryPzrRr3pLLElDlhxVeLBEH5+J9BdUC5KPDl+GupeNBqHO
	VLewT5DgZ4Zip83SX6oVHWMgiIFgCOLyEzjxcuWiuFZWEgQQeH4knF/3Rxr2BDs9RuhHQldCRpr
	S+OM0rWIWGjqNCjn3/8zQsIM2GC6yc6tSGaVhaz6vJcZB2yYzKTiywm0GqLOFNdaCdkLFtfy1ts
	IwfvOo8qmLNemTiYBFi1zx/mWJa4cJgB6+wvOe5MiT4/cHrrZBisvZdOleOJaKeaWxP+uG1exMD
	S538ecUA=
X-Google-Smtp-Source: AGHT+IFwsXsRYXgrfKWCfKNi+TTveszbMKXHntYaq5wTQetC41r6t1yJqHS2kPZNjw4WdDHEMJSJmg==
X-Received: by 2002:a05:600c:3f86:b0:441:d244:1463 with SMTP id 5b1f17b1804b1-453247e681bmr29156945e9.0.1749741970845;
        Thu, 12 Jun 2025 08:26:10 -0700 (PDT)
Received: from [192.168.1.29] ([178.197.223.125])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a56198cc12sm2244629f8f.25.2025.06.12.08.26.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Jun 2025 08:26:08 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Krzysztof Kozlowski <krzk@kernel.org>, Rob Herring <robh@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Alexey Charkov <alchark@gmail.com>
Cc: linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org
In-Reply-To: <20250515-wmt-dts-updates-v2-0-246937484cc8@gmail.com>
References: <20250515-wmt-dts-updates-v2-0-246937484cc8@gmail.com>
Subject: Re: [PATCH v2 0/5] ARM: dts: vt8500: Minor fixups and L2 cache on
 WM8850
Message-Id: <174974196751.110269.9543855041154753417.b4-ty@linaro.org>
Date: Thu, 12 Jun 2025 17:26:07 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.2


On Thu, 15 May 2025 22:38:39 +0300, Alexey Charkov wrote:
> Small fixups for VT8500 related device trees to improve correctness in
> light of current guidelines.
> 
> While at that, also include a DT node for the PL310 cache controller
> present in WM8850/WM8950.
> 
> 
> [...]

Applied, thanks!

[1/5] ARM: dts: vt8500: Add node address and reg in CPU nodes
      https://git.kernel.org/krzk/linux-dt/c/4ce310e733d8e520e52772099ebeb980fd491cec
[2/5] ARM: dts: vt8500: Move memory nodes to board dts and fix addr/size
      https://git.kernel.org/krzk/linux-dt/c/ab46710603aba03ec6881152219ee7de27d20eff
[3/5] ARM: dts: vt8500: Use generic node name for the SD/MMC controller
      https://git.kernel.org/krzk/linux-dt/c/8b37e3c425c3fa8439ec2e100521cb1e9651741e
[4/5] ARM: dts: vt8500: Fix the unit address of the VT8500 LCD controller
      https://git.kernel.org/krzk/linux-dt/c/1918e51321c0c34341397644512568ac3451e416
[5/5] ARM: dts: vt8500: Add L2 cache controller on WM8850/WM8950
      https://git.kernel.org/krzk/linux-dt/c/6cd594ed969d5cfc7f97029f8ca0d240637ebb8d

Best regards,
-- 
Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>


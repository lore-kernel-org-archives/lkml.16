Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 41B41283120
	for <linux-kernel@vger.kernel.org>; Tue, 10 Jun 2025 08:23:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749543815; cv=none; b=gA6QCa8FTZO1CnQD4jEzUy2q7isyS17OWb6L1FVKFgW3vP4cc9iegh5ku+7ZSGlCHMKNAuocN73dgtu5wufDnWYflAumXJ2grDeoNldzFgUHC5tPmUwRd4O4QCgztoDqLdxaynBU6qA7FYm32bx3am0CQZb4DZkCEcsBBFHT7wg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749543815; c=relaxed/simple;
	bh=SL6XPe/Yo30TKebDlMiJ2hgSO2qPUQEt3jOi+MlzI3Q=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=rdmOdzHaxqo5om1WzuFT3HDozSjqUxGWsIBMqbwe9DPYdPgm+a1I1g+PoK79WpsgwxrvwN0zfeJ7T2Y4gzi0mfgoFFrosUkVf1G1mh3S5vW4vWkT/O2rHMmf4q4cyDxRFfqwnVHlKkxNFDL8ouHktocWHFbvMXnibHCXqzLYteY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=BYvdkSqu; arc=none smtp.client-ip=209.85.221.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="BYvdkSqu"
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-3a524caf77eso685387f8f.3
        for <linux-kernel@vger.kernel.org>; Tue, 10 Jun 2025 01:23:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1749543812; x=1750148612; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=OZ40nSv2sa867OYuo6sDTtT6TDdmiOb3whCWy8cFeR0=;
        b=BYvdkSquk9AZQSDmORGUGURonA7QI9Su6HjbhlFC336kZz41yR2qj/pyFUJanoKP3o
         ZpH+GqA6mgGkHmU7uVIhA+/ksTtPzp2wKQc8K1bvYz6RH/xegeaeI5KOjEbRC4D28xtB
         KJueV8RSGRQ7s48Bqy0gKqoaSVCc3l/DCE38Dl6FlxlNrjWHzpJFIo0VOyZnksH1wzRX
         kTtyd31nUGc62N1MX+fReU4uQta5bRZEpvgOB+H5xLTBkUkNf1+FCuORxQrhF3TXyifU
         5cONS0BU0pL5DbYwJvXy2Ypm4Dx0gLMjoPd2M0ki25vwNOWZpuTzMvyvSWNDkQDUmjQV
         ZTRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749543812; x=1750148612;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=OZ40nSv2sa867OYuo6sDTtT6TDdmiOb3whCWy8cFeR0=;
        b=XuExZEOjb7tLK4AYJxfyhPSdyYgQfZljdgBTY6sSZDT7yafSpJEtSTEuAT1xiuQp7U
         A5qrOeXLkByCITm0VB/8vrUeJAKk0jUD/J/alEvu/d0DBAI0ad99XMPohkPpph/G/ybz
         p4kOiJE0fgxfudIJOfqEkxR8kU2JUhphG/2JShxi+C99YsMg2f0Zvxl/iWjD2hlGQURq
         lEFXJQZTuZGJgZUBPX/2p1cDzdiqe0m0gDPJGCnjKYD4/7nz0gDik8h39/a9D2wj2z+s
         ZYVTxXTkk7Xb3y1keaZILn9RiCg1ewU7reu34VaY7lJqNKYI53X9a+47TnFLU1d/rNWg
         KREg==
X-Forwarded-Encrypted: i=1; AJvYcCWuZ6oQeIWM/PtBuOrH+WaNFsFE6ssTNORtZMI1IuYum8DAvM3s+jGgk474lbWwn9EG8uEQX2agXgvy20Y=@vger.kernel.org
X-Gm-Message-State: AOJu0Yyv/qbXGdhO/+gf/TT3FBXW9lPrC2eCISYSrJwFstl717vLtMnR
	wbGsTVDapbzwBW7Tqix6WymZRc6NMDSN7I1mcusMtLf60RjKniQcOlVADgEt1bBuMqKBTgC5GI1
	w+2mWFN8=
X-Gm-Gg: ASbGncsbL/u/nbnPMU01HR5+o3wJSRE6mLUPfq148P9evu1fM63fSyUyhVqG8hMs1XD
	EdskkOEaaKON5JIfBOdMBRW0KpoVo4DzPZq8L7xU3Id3EvyOVLFpsh0iyKWWkTuXumExBumi3Jx
	Q3Xhadrvz4nWsiayDKNvlG1foAhaz7TS1JYoln5fpZt6G2qO0Dk9ogp9JqYL1h6tG2D9g9dYfh4
	Q6zGiNF1Rrjupv7dkeJfUHQTl5TKfVDzqRm+UJ1xP4LhYPuaNG9Z9by6+07aLDROFoHZ+6xm+q6
	FzRpI4TDSqWU2jQSlANE5Vzqa62/go55of5ARW07q7e2D43iN1TfCyn5KAKODDAFM5hl/S0cjUC
	eL3RfdQ==
X-Google-Smtp-Source: AGHT+IFT30y+SRpOPyTJLVOb3Pput91espNfxr6yB+Z1bKms3iz5xi8X0GSEoKM0vX/+7UuhNP+UqQ==
X-Received: by 2002:a05:600c:1f16:b0:441:b397:e324 with SMTP id 5b1f17b1804b1-4529abf70bfmr47500895e9.9.1749543811934;
        Tue, 10 Jun 2025 01:23:31 -0700 (PDT)
Received: from [192.168.1.28] ([178.197.223.125])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4526e155ce7sm131726125e9.10.2025.06.10.01.23.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Jun 2025 01:23:31 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Krzysztof Kozlowski <krzk@kernel.org>, Rob Herring <robh@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, linux-kernel@vger.kernel.org, 
 devicetree@vger.kernel.org, Frank Li <Frank.Li@nxp.com>
Cc: imx@lists.linux.dev
In-Reply-To: <20250602141246.941448-1-Frank.Li@nxp.com>
References: <20250602141246.941448-1-Frank.Li@nxp.com>
Subject: Re: [PATCH 1/1] dt-bindings: memory-controllers: convert
 arm,pl172.txt to yaml format
Message-Id: <174954381064.117761.3103173099824775147.b4-ty@linaro.org>
Date: Tue, 10 Jun 2025 10:23:30 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.2


On Mon, 02 Jun 2025 10:12:45 -0400, Frank Li wrote:
> Convert arm,pl172.txt to yaml format.
> Additional changes:
> - add mpmc,read-enable-delay property.
> - allow gpio@addr and sram@addr as child node to match existed dts.
> 
> 

Applied, thanks!

[1/1] dt-bindings: memory-controllers: convert arm,pl172.txt to yaml format
      https://git.kernel.org/krzk/linux-mem-ctrl/c/04de50163466a0d11b24f6bb418889f3cc219dda

Best regards,
-- 
Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>


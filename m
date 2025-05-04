Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D9FC1DED60
	for <linux-kernel@vger.kernel.org>; Sun,  4 May 2025 17:25:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746379553; cv=none; b=EqJcYBfVSFQSTUZReP6SJyWuXxf/ldnbsUpl+59t6SaB5QqRHWe4MG/11+QHIfOiNJ2mdgf2ouZQknjgnCPvAbAkHZOKnQtS/SBUuFjHY1noi4GAC7P2u5SMN3Yudxs3VarhV2InwS7kdHqpa9vbYKP7oEkVUDW9U/w7v7K+9aU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746379553; c=relaxed/simple;
	bh=Ms63/2y0DA289uzZ9A2EmLRu7PgcSpq1Bh1Ff+1cH88=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=Bv4T/bWHusW/yt2uT9UZg8XsfSBR2OTAQFiKkKV6+Vkx3y8o8EcVcPs498Wi9iNygoFuo5GZES/ZmPKfSF6yP0zorSoe+2Le8aoNxrqXLH5TJK0H4nK8CtbAadFtOLCEy2ps2/N7wHMTmHY0S3TeQ+AP0QjudrV9QIrE3/FRfq0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=OWT9iGzg; arc=none smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="OWT9iGzg"
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-43e9ccaa1ebso4973675e9.1
        for <linux-kernel@vger.kernel.org>; Sun, 04 May 2025 10:25:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1746379550; x=1746984350; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=IQ7tuwuM2LFYHZnclmNcrhhek280gEdNY36z2AcaptY=;
        b=OWT9iGzgRp0MqbPVRffzgaC1CvBlZ9aRtM+qf61+YYZEr0nF5fgC/+VioXPDime5/Z
         kr25VWt1iK+Hk+GoU6qSa2OEgxQjsd0VAWfxasgIsWgWN8cbFjo+89solvu0TPxhlbGN
         N+w7BqHau7VWBStxGSvx0sjPWVTjTgqU289inFLUED8rGCwhOGirdNEeOGPSMH+jtPLD
         zUnRJCv0rPXf4MaFA/p2nXdOx7/XeuAYappRIZfBGRppoQIh0/7lo+TCo/q5CfPZg+P8
         QTOraqWYcjKEwyex0bHhf8SQNV33M92iDP4lm1kwfLROBTBwitnk/sp9suXSM5Dwtpnb
         3o5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746379550; x=1746984350;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=IQ7tuwuM2LFYHZnclmNcrhhek280gEdNY36z2AcaptY=;
        b=pXs5JS8y7SdhlqyaPPPug0dfsU86gx4N+tCyojViFA6dzRsGcWjCFZeYE8nSpg0tQT
         vXj2j12WS6z1W9Psfa+rpTDP4J7CoGuluf82h8ZcIZhO1aqF+l6tqtIgntCGYBIwwoKw
         4J2dV60hHOgKqQEpBoW/pDOGn/zJq1Cg6egvTeXX6FMeS3/rodN1nzBQqbryAKo+Jxdw
         vLJqFGV1Ydny4afYl48GkGc9D5pmCPelIS/JcVEo9bu1F8M6rzt1fi0JWW5q1MZJFOcF
         OcB5I86mLa8snQ9si7om4MV2uGtW0bKlMtOld+YmS9cddeCPHslW/8x1AfJMIqX8GzC5
         dt+w==
X-Forwarded-Encrypted: i=1; AJvYcCW3YAIn5mawj2mbstUZU60H5rbK4bKklShvmiKy4yVsN5l6+sU4fJKEeArcXTiHEBwPClfWbv6XBs4FMmQ=@vger.kernel.org
X-Gm-Message-State: AOJu0YxanQPnc4fACLlu8+T8xeCOEOs0UVKdHQWUm4n7B3W5wS634C5X
	D4/1XP2bPDN4s+x0CUQM5Oy+JSp7gFUBY/4eT02Ak3mk1CbJwHyHqIkkRTAR/K4=
X-Gm-Gg: ASbGncuHyBcXdK1y0VA0X0UAVxkGkwADTvggv3cgOz6b/rZ0K1AKdGMUwq0HO2xLr/P
	4xbkeMcGiC+lnY7Mn0F+FtfmsG567BNvQPnZxioEC2o0XREYQDjwr93P/d/M/G8L9OgJ4Mnujfl
	13pp1P9QeCvPMxarD2P/NIOD3jkPrSeR/NPJVR7GqZjMk6JAs0cg8al3maO1frjLpg7t4YVyt+s
	dAn76jaMdTvWEPRp9DcqU5rYu3IBmX3bGd8wNxtX0VZVx4RhFGpDlDertxQIQkX3vJYHx4QbS29
	9j7TLJsIbYyd/tNz2p3kwL/zdRdmbuW0PgkGNrg8znlQsCb4V9NJZpSeDps=
X-Google-Smtp-Source: AGHT+IGYW712LH8F5aMUoHbcA3Ri3a5MVIOjSwn5ymbnCfmvccr949GTsmCKBwzbaZh0jtas3NwXgg==
X-Received: by 2002:a05:600c:8712:b0:43d:fa5d:2675 with SMTP id 5b1f17b1804b1-441bbf4ba96mr30008995e9.9.1746379549860;
        Sun, 04 May 2025 10:25:49 -0700 (PDT)
Received: from [192.168.1.28] ([178.197.207.88])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-441b2ad784asm152058515e9.7.2025.05.04.10.25.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 04 May 2025 10:25:49 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Krzysztof Kozlowski <krzk@kernel.org>, 
 Alexey Charkov <alchark@gmail.com>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org
In-Reply-To: <20250503-wmt-soc-driver-v3-3-2daa9056fa10@gmail.com>
References: <20250503-wmt-soc-driver-v3-0-2daa9056fa10@gmail.com>
 <20250503-wmt-soc-driver-v3-3-2daa9056fa10@gmail.com>
Subject: Re: (subset) [PATCH v3 3/3] ARM: dts: vt8500: add DT nodes for the
 system config ID register
Message-Id: <174637954874.102817.534725446535416368.b4-ty@linaro.org>
Date: Sun, 04 May 2025 19:25:48 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.2


On Sat, 03 May 2025 15:52:33 +0400, Alexey Charkov wrote:
> Every VIA/WonderMedia SoC has a 32-bit chip ID register at the
> MMIO address 0xd8120000. Add respective device tree nodes to let
> the system code access it at runtime for the selection of appropriate
> hardware quirks where needed.
> 
> 

Applied, thanks!

[3/3] ARM: dts: vt8500: add DT nodes for the system config ID register
      https://git.kernel.org/krzk/linux-dt/c/a43a6092e33d6a5827114c797a2951c092851931

Best regards,
-- 
Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>


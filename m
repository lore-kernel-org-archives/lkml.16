Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com [209.85.214.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E78921C9E5
	for <linux-kernel@vger.kernel.org>; Thu,  1 May 2025 18:11:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746123088; cv=none; b=cuhA04AdktCsofjOKupJ+H3/Gu4EenId0QROKNd9NOS+vAUYMNcHcN/y0ArGNAW2SzAFIL5hG6B9csZ6QbgzY2SmeeuAIOnaeX2pxNgbXddf+GWgNaUljHIJ+r/+iIlRB3vqWs3JymaNU+C6em7nJNTo6WikCTNggr7PjCi9S9U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746123088; c=relaxed/simple;
	bh=n2hdrzkozFdUt75+CFb0KwrxNnR9IhTGVsPXZ6VJ5AQ=;
	h=From:To:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=u2FzJ3pBad8nvQ+VOR+yAeN8NV0yUoX7ryNxPCPkRqlf+XK5yxCUvLGQJVWBQxDHERvjM70mWRF9xfSqooOpkuY5tKnGOLwp4/6EAUT6lVYi1h7BAV9F98k3C8NV1M6E1K126Rispf5MTFCgYYsmK3Vi8pkhhX+kTIJZ/QPHhVc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=Z254Mk3u; arc=none smtp.client-ip=209.85.214.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="Z254Mk3u"
Received: by mail-pl1-f172.google.com with SMTP id d9443c01a7336-2254e0b4b79so19705325ad.2
        for <linux-kernel@vger.kernel.org>; Thu, 01 May 2025 11:11:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1746123086; x=1746727886; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=9t400dGVqKpa0aJ5NF/wqCMTUOEugJbXa0Ak07h82mM=;
        b=Z254Mk3u/zSGMbaP17a1gwGX7Qdl9VC6nX+mkYtasNPHNMV3pMncjHl7X7Y+f0q13t
         O9BsWhcyp1DP2DIjpZfxfU+rgVDW7vIWkhsS4moraAyu/L9AqFXOp1KrGqjYrEAHLH6I
         +O9SB+sO9AIDtpLJQmBXXRbz2SXjvNaB2tWMQD7KwTbLZgDHr4ROxtTGIuwknXnPsB29
         kK88O1MiOop6HUPYHT5Y68UvHTg4UCy5vO9W/rR9l+pofSY37zocqYsXv+LDcpgjEboL
         1GsZNr00hOjL3jLJHohjNuB0sdQGsASGd/LBFZa26ehY2Luy1vsurXdcqnHzqVZC0xGN
         wRjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746123086; x=1746727886;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=9t400dGVqKpa0aJ5NF/wqCMTUOEugJbXa0Ak07h82mM=;
        b=lLEcWb7dsqrUAYQkxDzJGKzPw2VpF9PnOABa5Nfvjz/uRTIeCg09pGy6fnS7n43SCf
         XH79Rui9G1H/S8FYQ7iefH8nOoBdxUTasu2DTfd9S0RsXTcPSdigaJ2MYD6lknYm6W9+
         KEtR4xDis2F/YbP3ZvUQq9Sg0yG9+3Yb9wfmEqkWzViLFdLeQIBLGpQ9g5CZE/UuZCOY
         9ApOwWOuTRP7PQNBgONRHV+/6XpCkNWJNvm9mOkTb+baLzqxxT1AIxLzCl1rV99v4YV7
         +Pe0pjd4fRKGn3ZhCmKMEoXt1oYhhxYd3K2n8MqKd124spgtXYWVb9AsTY1iOJRBckZp
         vMxg==
X-Forwarded-Encrypted: i=1; AJvYcCWboWRaFsYz901vfgdXAsnbd9mQQxd13a+eMd3V/KdOCEb5vu8PKgC0MpmHZj6W5XMn9WDR2cS0seoRfak=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx8CWaW9hFyqt25ELMPz//d6kHhtOuOL2nM2X0bz4GO7+53jiJr
	pUnyID7bg3T/YtKqrHWZLpXgInIAgXbRab1U/lxIaJOwg68tQA4rOo3em6nHlvs=
X-Gm-Gg: ASbGncsejCs4dx8BXGZ9jo8QBfm85HoqDx1aAhioHhG6l+FVl+khM97AsGYLFUtdxfO
	z1iR5lyH/iUmCGpWnvGxj96cHCiM6vkiWE82W5DnTXxJP26f12IdW8URUn81QjbOr2KQffxRq1O
	ckjLDjB2jrYnIIEouP9BjzZoNw0gcyb7alPX4Ja+9bzh2JNEQSYeNQsjvFIDvg7ZOFXgxoSKLL/
	ed/FzVFTYmm/E5WFjE7wPcG1MR7JmoweigVbwGo4K3Cx8XceWR404rpIthI4opBJZZp5fCCi+QA
	d7gMhXoj/hP6IHmMSqKp0oo7B1H3k3pkU5RDjqo=
X-Google-Smtp-Source: AGHT+IHS7iGdpbnvZSPtibrutAPiNsrIFRXMmGkTFO74ZmAaMQXJuegvR8E/cjr6fvB47F0IN/BmvQ==
X-Received: by 2002:a17:903:1b2d:b0:223:f408:c3f7 with SMTP id d9443c01a7336-22e102cd9bbmr970795ad.16.1746123085925;
        Thu, 01 May 2025 11:11:25 -0700 (PDT)
Received: from localhost ([97.126.182.119])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22e0bc6d528sm9783865ad.137.2025.05.01.11.11.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 01 May 2025 11:11:25 -0700 (PDT)
From: Kevin Hilman <khilman@baylibre.com>
To: Krzysztof Kozlowski <krzk+dt@kernel.org>, devicetree@vger.kernel.org, 
 linux-omap@vger.kernel.org, Tony Lindgren <tony@atomide.com>, 
 Roger Quadros <rogerq@kernel.org>, Rob Herring <robh@kernel.org>, 
 linux-kernel@vger.kernel.org, Aaro Koskinen <aaro.koskinen@iki.fi>, 
 Conor Dooley <conor+dt@kernel.org>, Andreas Kemnade <andreas@kemnade.info>
In-Reply-To: <20250427052735.88133-1-andreas@kemnade.info>
References: <20250427052735.88133-1-andreas@kemnade.info>
Subject: Re: [PATCH v3 0/2] ARM: dts: omap4: panda: TiWilink improvements
Message-Id: <174612308508.158405.11020603792617275281.b4-ty@baylibre.com>
Date: Thu, 01 May 2025 11:11:25 -0700
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.3-dev-94c79


On Sun, 27 Apr 2025 07:27:33 +0200, Andreas Kemnade wrote:
> Add proper definitions for 32k clock and enable bluetooth
> everywhere.
> 
> Changes:
> v3:
>   - better commit message to describe what the clocks are for
> 
> [...]

Applied, thanks!

[1/2] ARM: dts: omap4: panda: fix resources needed for Wifi
      commit: 1132bb4df2375ae4a2303068c6f5fc62bc63b870
[2/2] ARM: dts: omap4: panda: cleanup bluetooth
      commit: a2db9bbcf64a43c8347625dca9ca0927bb444d43

Best regards,
-- 
Kevin Hilman <khilman@baylibre.com>


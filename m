Received: from mail-pj1-f51.google.com (mail-pj1-f51.google.com [209.85.216.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B411F283FF7
	for <linux-kernel@vger.kernel.org>; Thu, 15 May 2025 08:22:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747297361; cv=none; b=t5vkJFMfepXVTUGqqPZB5aK4wqUFhQ5UXI+E1zF1ZU/7rcIm3qjJIocHRH+mLtD/f1qEZGwucFXEOw44RxwIGnhPJuW/gqoMXsIDVv3Ae97RGRPw2+R5+eNWmFhTBjxdXuU+phoOKKleEPznURYcZHQF0QDc/CtXK6McZs2B+8Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747297361; c=relaxed/simple;
	bh=zMrdY85vTW7AjrdO/rgWi/3gl5aBB4d3jxsiKmIX+C0=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=jV4csuTeP/dAuH/ui7v/ggO7rXe2aoIVUNTZpRR3Rps0V81VSHAXlgk0Z/UlpqzsZkZeIADs+goSPVRRbfs27rqDsrA4l+g3salHbNL7gkYvYsFzeOdaVG1GM/FygZOV/kF6QAHyW9Z7caKoIe3l8ZTEXA5OVBeAHbaF0UMaxnc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=inventec.com; spf=pass smtp.mailfrom=inventec.com; dkim=pass (2048-bit key) header.d=inventec.com header.i=@inventec.com header.b=fRYIDk/5; arc=none smtp.client-ip=209.85.216.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=inventec.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=inventec.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=inventec.com header.i=@inventec.com header.b="fRYIDk/5"
Received: by mail-pj1-f51.google.com with SMTP id 98e67ed59e1d1-30a99e2bdd4so599617a91.0
        for <linux-kernel@vger.kernel.org>; Thu, 15 May 2025 01:22:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=inventec.com; s=google; t=1747297357; x=1747902157; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RjF4WIlhUumHwR0LyuhyQYbCxkjlUl+il1BderSLi1Q=;
        b=fRYIDk/5jBjKZ9akqevwnDrwdnanqkHi6W4KiH2Kmg+Qg4Q6aqaT4g7M74PGZh+Uws
         DNYGElEZyP6HPRTxpPeT8/Fqq0a5/s1gjVM1OW8/YqmsDdFB1zThpkwG8TC+aJmO86ic
         voY30NZFNjS+8xxum0A3DuAMW4a9U/qD12y4bb9B5H3Hf7XLNbsN8PLriEO8a52mItoV
         z+zEiFq/Fur9kzFLO6dRTEf+PyFBN9hbcqp4gB5dBHNCnM+MWntgGue5DrG/+EXUNgGP
         mugpFeS7bvXdoXRX9tl1KX2SqUV8OCapYusZow2JzC8nyHHfZ2dI3m71ddM6VruHgsUK
         VbZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747297357; x=1747902157;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=RjF4WIlhUumHwR0LyuhyQYbCxkjlUl+il1BderSLi1Q=;
        b=sBL3NJ0pgDbYVd6OtPwVx7qU+45H6PCQaRy/ihoSvKTVjz/JJ+prm41wHmPdjSFn+Q
         aSyVVmzJZNJ81lg2Xc+gAzBOrGXLqFFZFKEOd9dCxXUPtorOt06+YhifUq0MzQJoWIRp
         U/2y1PrOxkFqzC4DpjC5K7lPvil3FySs9eSinPhSH6O5wZC1pWHtzLaFtMHF+IJYq0n0
         9vzl6KteddNbvLhwSGlz6fL9DnK4afhgU5LPMkpsWeY+IIzteGjuestX9NKAOMdj/Yo4
         jnamwJyCkjMtFAeOdw9B10S0r7y4qSykqI8AxXtjwYBP9ZpUQnwhDwJ6KpbV0Sy7nCAZ
         C1SA==
X-Forwarded-Encrypted: i=1; AJvYcCVP8UBTfbvlehFe/xNTCe4WX5BnVUkzMli9abe7WVX/l9FPEmHMqVICv2KkV57WA4TfPQllilfGmxbRoL8=@vger.kernel.org
X-Gm-Message-State: AOJu0YwPjSCVBISBJiMBJ6G6LznudPuwKV5Iim2hatd1haGOZ4lcIRpQ
	V+W4ldcZA6hXGMJbI9Zt4pG7rAgxYlUkXWGM/kkKK+VjLDcVz9tWhdZJLi4Jzt0=
X-Gm-Gg: ASbGncuQcBQpd+VerdAb3+dyKFZsR0uqsre8z2sIPi8iTFgj0ndliP1Ab0VQlE/KEW0
	Fq6Lity26qAh5Uv+eD1HIw4VoyX+A5jOqThcvVy/8Pio98pbo4ftveL9khDQYugpdICwCThthIt
	lH5UFjjmXRLbo78DDxIJHBAWBFz/IFnf47exg188/lqNalpa+OXH3dk32/61PV3I2amZe3+m/mo
	ftE5cAomkzyci14i1doAgj9megwhb0STrJ3OEKEtA24WdxxWijmle+syy6CfXm0U/FWsuxc63eW
	H5JmimtZOOas+vyXaxgfTDFL39iMMz10ygBTFpDRw0AGDuZUFZPlI47sjYlpwWNowOXNpwTH2OQ
	MgXAlgYep/92V0jKpn49oARic1eDeAFK7
X-Google-Smtp-Source: AGHT+IHOxDStraajciuLyI4J7kcSxLAVxYjblykyEsVhvb9CDyVTj6T8upo7h85qFEQd+SEWUbif/w==
X-Received: by 2002:a17:90b:3c4a:b0:30a:255c:9d10 with SMTP id 98e67ed59e1d1-30e51586fdcmr2384038a91.8.1747297356694;
        Thu, 15 May 2025 01:22:36 -0700 (PDT)
Received: from localhost.localdomain (59-120-179-172.hinet-ip.hinet.net. [59.120.179.172])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-30e33451e97sm2909715a91.25.2025.05.15.01.22.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 May 2025 01:22:36 -0700 (PDT)
From: Chiang Brian <chiang.brian@inventec.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: Chiang Brian <chiang.brian@inventec.com>,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v3 1/2] dt-bindings: trivial: Add tps53685 support
Date: Thu, 15 May 2025 16:14:38 +0800
Message-Id: <20250515081449.1433772-2-chiang.brian@inventec.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20250515081449.1433772-1-chiang.brian@inventec.com>
References: <20250515081449.1433772-1-chiang.brian@inventec.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add device type support for tps53685

Signed-off-by: Chiang Brian <chiang.brian@inventec.com>
---

v2 -> v3:
	1. Fix the order of patches
	- Link to v2: https://lore.kernel.org/all/20250424132538.2004510-3-chiang.brian@inventec.corp-partner.google.com/

v1 -> v2:
	1. Correct the subject and commit message
	- Link to v1: https://lore.kernel.org/all/20250314032802.3187097-1-chiang.brian@inventec.com/


 Documentation/devicetree/bindings/trivial-devices.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/trivial-devices.yaml b/Documentation/devicetree/bindings/trivial-devices.yaml
index 8da408107e55..e0017ba594dd 100644
--- a/Documentation/devicetree/bindings/trivial-devices.yaml
+++ b/Documentation/devicetree/bindings/trivial-devices.yaml
@@ -392,6 +392,8 @@ properties:
           - ti,tps53679
             # TI Dual channel DCAP+ multiphase controller TPS53681
           - ti,tps53681
+            # TI Dual channel DCAP+ multiphase controller TPS53685 with AMD-SVI3
+          - ti,tps53685
             # TI Dual channel DCAP+ multiphase controller TPS53688
           - ti,tps53688
             # TI DC-DC converters on PMBus
-- 
2.43.0


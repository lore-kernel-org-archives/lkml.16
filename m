Received: from mail-qk1-f173.google.com (mail-qk1-f173.google.com [209.85.222.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8DC762900B5;
	Fri,  9 May 2025 12:26:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746793615; cv=none; b=gpkq+1vOn6a19girg2nj0JO64u6UXpxBic5TU1qDhaeNq6pBkNUQ1A/zXlkBYjsy6R6VuNLQluEUp7gnqQdb4SEpDLK0iL3fc9bkzNa5ol/rjSrfoTOV01Dhrf/qoMa8NhVqhD/tsvQXm8vD426Kc3fK6t8qeOoBe4pIVUMiIV8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746793615; c=relaxed/simple;
	bh=sn8V8z0Gjhw1CZXRd4I2Qhlri39dZfzZ2vvnaba0aZw=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=gxhKB03NvQXWPQzka+rWE+1eFOUtCMJokVTMtEtGf4SYuz4BQ5N8aQTiEQ80IjJXV9wYcDwi5vWXtdjro5UN+E74jD6TVcSabTNy2o1rIvCaUjGwoib+Lm5U6TX2ZouG0pXk/S9y2J3xTvem4byTR3sxOjSAd1wh0lrBpE3dIjk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=lqfZmkhY; arc=none smtp.client-ip=209.85.222.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="lqfZmkhY"
Received: by mail-qk1-f173.google.com with SMTP id af79cd13be357-7c546334bdeso197917485a.2;
        Fri, 09 May 2025 05:26:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1746793612; x=1747398412; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LX2AgnXjLZsaf/23m6DzBSsHeoFXJnMo+ci0aY0CQT8=;
        b=lqfZmkhYReXhyFsZUMR7A2QsCiRvK3NDhg+tlzTtkTDFoEsHQQ1dmSdtGZ8w8TIWkf
         P4t0MyCZUA+GJOV3724G8bSL8FS9+rY6I/oTExpr9Cvq4YR6scO3It2Yg7XCDDGA51vq
         dHbyaoUB+hK3EjFU206OogRC6VRtG11Sv5mbLfHTuM+LGZmJ3H/u9ZxtZmt+I1XgQH/8
         R2GO0j/lIuMc673z7AdJNdkXd+PJpVdGOhKbvIyf5gO5ccSvqRHr6/apFFA3+9Yzvffp
         WQD3CzenPxsMw2lgmCbif37lvtuqNGTV0dNM5XuSRFap4yQ/qru5ONilXbJ3Ez+7fKyP
         ZVhw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746793612; x=1747398412;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=LX2AgnXjLZsaf/23m6DzBSsHeoFXJnMo+ci0aY0CQT8=;
        b=X1PlUFHzH/ttJ7l2fNmupjEzoFWq/4VLC4qlPJ239ZSatj96HC+RySpvTnr8IvbD+m
         8VNAiZ74H92rqJPbdrGYUbRUOrQTEAZFL+s/KgR8fYuYgXa5DXqzSDmdCcwHQmA0l8tM
         JZc/qDoS8FynJU2vc6q9Pn485HiOUJvLyWHxmydn+WVqitJwvduHBFwE9glBh/YDNOwX
         O7P1bclo9QKeHI3GBqHJLavFrP9PU/Z51OuXtW8jC41fw1LZusv2U9HC3APG87s46+8I
         jSJKCdm6jYIbSADI5EfB31EBogM9eWlo9QWEQPLEacUU+1QO9kuYVYDa26kDUMmfngJm
         02kg==
X-Forwarded-Encrypted: i=1; AJvYcCU0IoE+IEa40yY9f9q/QgbIlRNy2zl44QBHtp+amTtsdUlYYZzf6l9cX6eNZQoEH2vfzNvVAaYevoYHEg0P@vger.kernel.org, AJvYcCUrrutnnCBqRDB2bIWxkYyWih5rBcl5CUHPXWANGi4iCeil8fadUZNtEpVg43ITO8NgOD56DAbijs6T@vger.kernel.org
X-Gm-Message-State: AOJu0YwXSv+CrI7aSyNPiqfrb2C5PTsfk2ZoG/CnrFTAk1VU/2Jkyqj4
	z9M5HVH3j2BIKIB7fmCcIcjls/EBfOM/LwbWAnQ4cEkcOXGagqut
X-Gm-Gg: ASbGnct8K7MnmcgqARNEFBoH/aeVbXNdadD6YmUXkbY6TBLcd2IW5G/L87jrzPyjAP9
	lucIfy6erPsdVip3eUj+ObEzJNsvPWESf/ZDlPPFxtjSgWtvtuM4VWd/YaiIvikGwFkinZI10K5
	b+QQ+cUMSAUg0qgSacI+P4kzZ0Vrcrli0ArgQqf+s0H+m1xYANjPOq0SwOj0mIrarwICSc4FBRN
	0rF3rqNF7AV3lBPxilgjCdFpk7ZcZXjcUqRI7g0Lx+PlzpVJyjTALl7l3a6lT+tuPFA0PrAji8e
	gsk3TwSIt0dBgZeT/gFMB/NA4AhtPexm4qldR6aMqMIGhfRDZ0gE
X-Google-Smtp-Source: AGHT+IG6sxLD+Cis5uDp/dpl1JHYadvIjwdjsVn6rAao3CymIp7nphXMUCDzYlOkiNt8Psg+xB9QkA==
X-Received: by 2002:a05:620a:c55:b0:7c9:2344:ce59 with SMTP id af79cd13be357-7cd01102230mr540578185a.25.1746793612261;
        Fri, 09 May 2025 05:26:52 -0700 (PDT)
Received: from localhost.localdomain ([216.237.233.165])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7cd00f4e19asm131843485a.4.2025.05.09.05.26.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 May 2025 05:26:51 -0700 (PDT)
From: John Clark <inindev@gmail.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Heiko Stuebner <heiko@sntech.de>
Cc: Quentin Schulz <quentin.schulz@cherry.de>,
	Jonas Karlman <jonas@kwiboo.se>,
	Nicolas Frattaroli <nicolas.frattaroli@collabora.com>,
	Andrew Lunn <andrew@lunn.ch>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	John Clark <inindev@gmail.com>,
	Conor Dooley <conor.dooley@microchip.com>
Subject: [PATCH RESEND v4 1/3] dt-bindings: vendor-prefixes: Add luckfox prefix
Date: Fri,  9 May 2025 08:26:35 -0400
Message-Id: <20250509122637.26674-2-inindev@gmail.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250509122637.26674-1-inindev@gmail.com>
References: <20250509122637.26674-1-inindev@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add vendor prefix for Shenzhen Luckfox Technology Co., Ltd., which
produces development boards like the Luckfox Omni3576.

Signed-off-by: John Clark <inindev@gmail.com>
Acked-by: Conor Dooley <conor.dooley@microchip.com>
---
 Documentation/devicetree/bindings/vendor-prefixes.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/vendor-prefixes.yaml b/Documentation/devicetree/bindings/vendor-prefixes.yaml
index 86f6a19b28ae..9391e0c31bb8 100644
--- a/Documentation/devicetree/bindings/vendor-prefixes.yaml
+++ b/Documentation/devicetree/bindings/vendor-prefixes.yaml
@@ -892,6 +892,8 @@ patternProperties:
     description: Liebherr-Werk Nenzing GmbH
   "^lxa,.*":
     description: Linux Automation GmbH
+  "^luckfox,.*":
+    description: Shenzhen Luckfox Technology Co., Ltd.
   "^m5stack,.*":
     description: M5Stack
   "^macnica,.*":
-- 
2.39.5


Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com [209.85.214.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 58F3028750D;
	Fri,  6 Jun 2025 10:28:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749205693; cv=none; b=RkewudAsXl5tVTXvFlhm2sMq03pERGOBnXx/xPDBXG1QHTqARUYdD28xt8Bx1dDxTY9I9e9MMe+omE9s09aVbsPykrfn/2kbvBtOxayvmjhvsNeYcYUXbNQKdLfsfh1zh7fGabH+nDU9Wnu8Ey/2uyhLqOxw1wAI4pGR4gpLqLg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749205693; c=relaxed/simple;
	bh=VW1z7quOUVaSxQgJ+9/BOsabZt0GNXzoFywJfXHGils=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Xrm4fBEdQwbLmBZxNJNGzwok6bxV8Oe2MG5JPCiWa2CI3B/6Aa76BdcID1OTZKh1gh+i5pBnpTyh+jH85LkgG6gACqEyh29c8wiiDT7CTDAp2F/NEB04S1RtAikEWn1aNrHZ2woMZn/t+rTgzhMLLz/WW0GdicshtA4BSPqEp30=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=YFnNna53; arc=none smtp.client-ip=209.85.214.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="YFnNna53"
Received: by mail-pl1-f174.google.com with SMTP id d9443c01a7336-231e8553248so20023055ad.1;
        Fri, 06 Jun 2025 03:28:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1749205691; x=1749810491; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=f2k6QLhMs+Ybe7hFRFwIVvK0vEsmpmU+VkYws59KtZA=;
        b=YFnNna53aGiWA9VE/xIMEnXU6h2RAsRP/8fQ2iW9V2LWyZGeGWxKOKyi1N/IjjtAT4
         DaR0zEEWnBPqXwy/w0JMgmkwaE/5kC2PQN1COP12m36cx0CM/uXFcix0pcgguWeeahtr
         py5Dnl7ZrRZRafL9wMtqf/4dVAxrMIlqokm7pCLFXWL3bm20FW6DUsTF/igyFTUNQezQ
         +4AwRLabUkCDt2IMJxRV6zNpQFWaupkqJBClz9SuxxRTuYw2562TtuiAgtjIAYzlRszj
         B6CBBOOmrxQ0KTl/AtoDZb7OvOE4vxc8XMUu0p8ECT815L7+Kh1KJmFFDoGJdxkAE8ZT
         IjFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749205691; x=1749810491;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=f2k6QLhMs+Ybe7hFRFwIVvK0vEsmpmU+VkYws59KtZA=;
        b=t4dGKVyi4krXXxIatWgjcVJeOsNUN/4KrpHJW0Zxmh0zXCS1q766mSP8SUvS8TuU2w
         K2Kq6B79QBVvPgmpwlqGagsKaE5xb2t50VYY60emWPReOhAxY6EeHEIVAklu1V5S8+wF
         M8msPGBr3HllgoitvxAU7zQmy/HhPjd3ndEMCeGn3tGJpXT3211QGlFlOr0cO+zZ1Orz
         XCclFYx+veQyoE8jm6d/aJlpIu13wNzcrmaYBZERuDdRQmtkr3X2sAqhxnE6OI5bK+UH
         wtqgAz0L10egGZUDgXknYB1bxil/kIUgIssN+pvuJzwrMpa9qq1mUyC+VRElYHuIrHnM
         aNoA==
X-Forwarded-Encrypted: i=1; AJvYcCUb/I9947bIVhK2UvQ0kJxf3Fs+AXDkIAZq62s7xYLthlAfkNjUj47UsLuQAaJLY7EmKDIukKFcYvtq7LeF@vger.kernel.org, AJvYcCUlczBeVvPelSKnE4/Ww6UuWifnEJew+u7iULqp99R7et0w9JjWdau/C82kWe4/FNbuUD/+DQ7+qW2W@vger.kernel.org
X-Gm-Message-State: AOJu0YxaK78X5OMAE9pWgHKte/Gxq/yYtIih6oInJEKVe6dy7B/5qXqj
	Kdqr5lzhDVzQv8ZopfV3QFSV3B3ZAeg3D7vvhoFv/3I8LTmB/19d7KXc
X-Gm-Gg: ASbGnct+X4yyNSgU56ISy967QYVBi0onAqsFK1l9jhAPQ4tzenioTZ4VeKZDLhfIDyP
	UupWILFWlckCC1ByKF6qh+2P3/wUBU7s//ZBalvZn0VXnFcWS4B9D+/iKbe9qJeFMjpnZeISIVP
	k40rLDppCf7N42cPEYyzdOrvI1Smtj0AYS0DQnXbrE4Kj5UlXclM5g44yg51iYfv04vdbaCPAgs
	eGKjQ9V5R2VWS+yMzH89JH97CD0EvGhh7sEfAgE6Vi7KDACR4v1NooC+cZlz7NN02xzPG0xjnhE
	ZtTrBOa0cobW7aHl0Ft5aOiXzQe4PYTsllGLsYVylpKGwg3El5J3gtomtneX+bwgvqrkZuVOb4Y
	TPZtfGYldFnIMr3NLYen3c9QgYIbiExx9s77fYyFxBOsqZf+Jef0Fc5ogu1gtoIxjx0NoCs/l9I
	OLrTPiCucxLA==
X-Google-Smtp-Source: AGHT+IHdkRnMxTdMkIPYO52HyIjgNRpDvU7O4+2NT2FszwjIZ6VSApJKtT1r2YkGVF9r+aJyzdfHBw==
X-Received: by 2002:a17:902:db10:b0:235:91a:2c with SMTP id d9443c01a7336-23601d82d3fmr34529105ad.42.1749205691572;
        Fri, 06 Jun 2025 03:28:11 -0700 (PDT)
Received: from fred-System-Product-Name.. (2001-b400-e35c-06eb-80f3-97a6-ae1b-00f8.emome-ip6.hinet.net. [2001:b400:e35c:6eb:80f3:97a6:ae1b:f8])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2360307813bsm9632885ad.22.2025.06.06.03.28.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Jun 2025 03:28:11 -0700 (PDT)
From: Fred Chen <fredchen.openbmc@gmail.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Joel Stanley <joel@jms.id.au>,
	Andrew Jeffery <andrew@codeconstruct.com.au>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-aspeed@lists.ozlabs.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v1 1/2] dt-bindings: arm: aspeed: add Meta Santabarbara board
Date: Fri,  6 Jun 2025 18:27:53 +0800
Message-ID: <20250606102802.1821638-2-fredchen.openbmc@gmail.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250606102802.1821638-1-fredchen.openbmc@gmail.com>
References: <20250606102802.1821638-1-fredchen.openbmc@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Document the new compatibles used on Facebook Santabarbara.

Signed-off-by: Fred Chen <fredchen.openbmc@gmail.com>
---
 Documentation/devicetree/bindings/arm/aspeed/aspeed.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/arm/aspeed/aspeed.yaml b/Documentation/devicetree/bindings/arm/aspeed/aspeed.yaml
index 01333ac111fb..a965f1a03051 100644
--- a/Documentation/devicetree/bindings/arm/aspeed/aspeed.yaml
+++ b/Documentation/devicetree/bindings/arm/aspeed/aspeed.yaml
@@ -87,6 +87,7 @@ properties:
               - facebook,greatlakes-bmc
               - facebook,harma-bmc
               - facebook,minerva-cmc
+              - facebook,santabarbara-bmc
               - facebook,yosemite4-bmc
               - ibm,blueridge-bmc
               - ibm,everest-bmc
-- 
2.49.0


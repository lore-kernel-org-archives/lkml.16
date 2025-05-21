Received: from mail-ej1-f46.google.com (mail-ej1-f46.google.com [209.85.218.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D3EEF280015
	for <linux-kernel@vger.kernel.org>; Wed, 21 May 2025 14:10:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747836628; cv=none; b=KnnrU5ZX/kTym/aKTJoIrPtZYyWWcgTbEN4GOS5MbuISq6YuIHXE5ImXHSEc0SbSLJK2wqqUYlyhn54z5oydMSFTuFyP5PqX20BZhSjrYJxZDTfA7es3Pf1Ye2j7ar9J48676vqbPguixchG3VGtayIujIDF0+MGFcWn1++STQU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747836628; c=relaxed/simple;
	bh=XODCdlQ9JYoDDsNnzBn69mhkXEts4CheV3BPuja6CXk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=HZdla+iDk/cFomF0C2dghvlfNWRpQiQZN1JbmB0LNC/9dDomObrM9EDinNCFpot+KvhyvP8FwBoAJgcebm6P3jGSA4cPRHUDj5I4HrR0ZMO7TqfyVhkkSsexCRFdT1fVRxJnYqlzGNxYskDdg9g/EEqZwJ7tnLcQM/uYWWCfMSk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev; spf=pass smtp.mailfrom=tuxon.dev; dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b=J/vhghW/; arc=none smtp.client-ip=209.85.218.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b="J/vhghW/"
Received: by mail-ej1-f46.google.com with SMTP id a640c23a62f3a-ac34257295dso1042459966b.2
        for <linux-kernel@vger.kernel.org>; Wed, 21 May 2025 07:10:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1747836624; x=1748441424; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Cl9iumKUHycZw2LuiJs/rBHFbGkhee2I0sRJSJxgwN8=;
        b=J/vhghW/UF1Gw6KIz1JoUQoBZuMOryawLqLRCMuqXVbNDDc42ZzyZiIRoz369/b/Vf
         yiR8Z98uNSy0kjcIX6KLJM/aqlMu2pOqvV3ccJLa57DsxpOQH0rDKrXcTt1uAtHO9hCl
         86s4cMwn76zKqsqigY7FwrC8jxLJClcbNqcd4t4mw2LrPLpGwaXV+Xw2DJCjtwT4jvAj
         M2NozWNz2r3ovpVV+x0EOB7tcAr1yp548TYLx523vFQqboSQIgdwavbNBmWuHRlaNmkx
         CdgvTES+PSnQU7uazx050JWdmkAfyjzjD+OsY/NXvY+zbjFXog8Vx2pGpHBaNXMrCSi/
         Ed7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747836624; x=1748441424;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Cl9iumKUHycZw2LuiJs/rBHFbGkhee2I0sRJSJxgwN8=;
        b=OTv5CyCF7e/+r9msS2HFTtBslFWxE3wn/mJcgPH5/W4FIvauumn3zCnkuU3FFgqG/0
         VwByyD0vngy7t3kECjtsELEYLm3aOyL3xlt/jbxb2+c62WaVNd4vwT6FKZi1+syBIGE5
         sQNDLpvxhxd10Iy0dI0qAdg8UhzyYYWC98TncL/UBS2fYqmvgUGHb7oH1e2GM+kC7Oiq
         2wcjZ6c9N6VzYdF+uR9ifjZNtjmuGUXTg3+hwCVuqpPzrTtKf0vAeJXFpA3ifqVqaeWc
         KnDrjAMVPPSoZuzvM0FwR0UI777jizWCLFmPyzOzlNN9julyqoQPnOwww4F4hVMSRJom
         yKUw==
X-Forwarded-Encrypted: i=1; AJvYcCWq55iqxz44EOUxszJR7GsTZibqcjsiYcxO2wO8CsEeai/OT5kdFvkF9MvFZRTLWr7LldAmD2/ddnodq14=@vger.kernel.org
X-Gm-Message-State: AOJu0YzjbmAwATf3/jwBnmeLJdfuO/aHaaBJokG4M+4AoxMODkHp1gMz
	pKkjX2TTT5sP/x2LaaMiepZ3vpTz8526JvVETMdwuHhB3jVFjg0w0VhYy8o20SFmOnrX/lqLjNj
	Jm+xF
X-Gm-Gg: ASbGncs27V4BL5iPxPcz9TPHJfPYuQlG+VBCrymG+7H8cBBfIQr0zE3DG73y8R+ro4x
	dkqBxVoSiFPTiRGKIN6C6Ds2yB1ytYQ+JrahgSxC4RXAEQ8S0/qB+JLzr5e5uyg4Q25qzf/b89b
	hcUVl8CwiR8jMeV8VMWom5TvEmaw5YFkUPGGyaiab3rsBEm/In9AaVCfSjg5qZwY5y4q2yHK+UQ
	KIH9UBhr+dH1ll7t9fQkjn6Uh2FRKq5Wd7J7AYyftJbM86bniPrK1ntjSbYYf60PIOR6eSlvh4G
	lvShu0/9Qo3Tt2pXU+5Ae3w6ZCuIJoqzpWcKDuYEzfFcuySIiMIfA5anIeCT7Pe0VTZEjKAFdc/
	L8a0Xu5+6zWnov8k=
X-Google-Smtp-Source: AGHT+IGD2TFDUAmZSCVXr+Ck8MJMzjDFoIU+oJlf9NZINhEoKVsrTuMXHWv6l6Kj+MwSbuL8IYJrfQ==
X-Received: by 2002:a17:907:968f:b0:ad2:53fc:a884 with SMTP id a640c23a62f3a-ad52d549101mr2012530866b.29.1747836601240;
        Wed, 21 May 2025 07:10:01 -0700 (PDT)
Received: from claudiu-X670E-Pro-RS.. ([82.78.167.58])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ad52d271916sm914552866b.69.2025.05.21.07.09.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 May 2025 07:10:00 -0700 (PDT)
From: Claudiu <claudiu.beznea@tuxon.dev>
X-Google-Original-From: Claudiu <claudiu.beznea.uj@bp.renesas.com>
To: vkoul@kernel.org,
	kishon@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	p.zabel@pengutronix.de,
	geert+renesas@glider.be,
	magnus.damm@gmail.com,
	yoshihiro.shimoda.uh@renesas.com,
	kees@kernel.org,
	gustavoars@kernel.org,
	biju.das.jz@bp.renesas.com
Cc: claudiu.beznea@tuxon.dev,
	linux-phy@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	linux-hardening@vger.kernel.org,
	john.madieu.xa@bp.renesas.com,
	Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>,
	Conor Dooley <conor.dooley@microchip.com>
Subject: [PATCH v3 04/12] dt-bindings: phy: renesas,usb2-phy: Mark resets as required for RZ/G3S
Date: Wed, 21 May 2025 17:09:35 +0300
Message-ID: <20250521140943.3830195-5-claudiu.beznea.uj@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250521140943.3830195-1-claudiu.beznea.uj@bp.renesas.com>
References: <20250521140943.3830195-1-claudiu.beznea.uj@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>

The reset lines are mandatory for the Renesas RZ/G3S platform and must be
explicitly defined in device tree.

Fixes: f3c849855114 ("dt-bindings: phy: renesas,usb2-phy: Document RZ/G3S phy bindings")
Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
Acked-by: Conor Dooley <conor.dooley@microchip.com>
Signed-off-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
---

Changes in v3:
- collected tags
- rebased on top of latest version of renesas,usb2-phy.yaml;
  Conor, Geert: I kept your tags; please let me know if you consider it
  otherwise

Changes in v2:
- none; this patch is new

 Documentation/devicetree/bindings/phy/renesas,usb2-phy.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/phy/renesas,usb2-phy.yaml b/Documentation/devicetree/bindings/phy/renesas,usb2-phy.yaml
index 2822dce8d9f4..12f8d5d8af55 100644
--- a/Documentation/devicetree/bindings/phy/renesas,usb2-phy.yaml
+++ b/Documentation/devicetree/bindings/phy/renesas,usb2-phy.yaml
@@ -108,6 +108,7 @@ allOf:
           contains:
             enum:
               - renesas,usb2-phy-r9a09g057
+              - renesas,usb2-phy-r9a08g045
               - renesas,rzg2l-usb2-phy
     then:
       properties:
-- 
2.43.0


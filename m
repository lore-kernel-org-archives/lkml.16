Received: from mail-ed1-f54.google.com (mail-ed1-f54.google.com [209.85.208.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 45CF12609F6;
	Wed, 11 Jun 2025 11:30:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749641451; cv=none; b=Hxjbc5+NSL8HTNZ1y82k66YRZBRTIrPZsdOZ+onl+RN4a9XkotVI16+Tosw2m3ZoMdKHp+tyvrSi2jReBvU3s/vm9e6xHS0YaFrGVxquIE96Tr62N3noPgqoqUSPRyLmqRDA8zXA6K+2Ltt3v2n7zlTWnh/fuSuxt9VfdoMm9gs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749641451; c=relaxed/simple;
	bh=idnwyYFhoimtyQHkUQAw8SmYW3F+yML4b+6yEPboSUw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=bxmAcaOLPNAUheAFb6ltxwvDudjoWiIzoOhRuNener3PhXeC3g2cclBWzU0TySTf9o4XlfVtFA1gtgqHTJ20B7/GUnlyQ7aNnXDTG43tUUh+qUUyoeOiFX0gy5ym7OPawRk3gH3tZ99Pc+ZcQnSCrH8ukOFcScrvBIrD/SBKF/o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=m0C1pT9K; arc=none smtp.client-ip=209.85.208.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="m0C1pT9K"
Received: by mail-ed1-f54.google.com with SMTP id 4fb4d7f45d1cf-60789b450ceso8555460a12.2;
        Wed, 11 Jun 2025 04:30:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1749641448; x=1750246248; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=g8JajeanvUAkDrLUvYe0Ljz6fce8jXRt7jLNCFi5jkg=;
        b=m0C1pT9KSLDDVrjxMzv3dyEB63iWgYbgtmEwCaBiiD7b9Ub/Qey4MvpT5fcjwDDbzo
         i8xxK0qkMa8YzTbE3kfYyD2Aj5w5WXYktrjz/mfhOdCtZIwDzXCBFIQnTG/e2BNWsvhE
         QtCMV/IG5Lk6qnw8K5rrIAWFvt4RTx0Km4zYS4n5OqoARwOrQ2htRZi5+DzEP6p9A9fW
         6iOqrCl1kV0OGl/lVir5HRK14LBBoIIzkMYKHb9M4MqKR4viNdv6cFGHHcZzqMDJOxLM
         ST9gc4W5c+75/ZUVInD8x6fNs0Wa7mdxHT58HH666ife6Etm4k0RjCNjmZ+XPxv4TXqD
         ltMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749641448; x=1750246248;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=g8JajeanvUAkDrLUvYe0Ljz6fce8jXRt7jLNCFi5jkg=;
        b=no8sUJydEx64KyPomvC2edn/KFlwb5FrHhIVEXjxeFOXUmtRrXrAJjrTP1x7cPb6yz
         gLZG4zLbLoqrvZq+Ui6bG/OlP4xGESAITdwAjPz6QuMa4q9qPYAx770zNvxIz0OJK8qw
         0urMbcB/gKHIyeOp7aCPlKz1ZupUDFgAZuyA4Q+LeDfNO8IfWwuS5SP9ji4KA/VUzyk3
         Lg09s8HBl4eMDIyxgKLICl61avZePXrENHvUsRz5JTDGggI06sFVbjkOnCqjloYnIqfM
         bTqbDFkOr4eVtQMKMO8Pt+dZ9N/X44ZJvKgwASD4L36Qb/9MQAEXKcnYpX25bixQjpIW
         0i5Q==
X-Forwarded-Encrypted: i=1; AJvYcCUpxVqX395pL4yFEOqOJFm12ATFvXlYdvBxrF/XTt1ihdxHo6Wgt2eLfw6RIqLaZY0Zb3mGNUIZXurQgzhA@vger.kernel.org, AJvYcCVfhGHYyE2hfXx7/CRtKJOe5GLvsBgF6cUP8TfpqRwMuVoIX2F81mYR19vPGF24FSgrR4K5NhSIjLEV@vger.kernel.org
X-Gm-Message-State: AOJu0Yy6xkUF4GUmh4sFbDMQmYVI5/ztdypB6zz/xPgwrbrlQu/33ohm
	P3dGkmX1kC1DhQgseR2fr1oxJjiSAkkQIq6b+FXe+IRTPZYd4UXUtBJC
X-Gm-Gg: ASbGncteRjmw673zl3wCl+vDG8kz04VST3wQgW06inTnmcxgalEoTJJLZh/Ryvtlk5v
	e+u2ptqrSz+kJXN29EZDhswOYDX9E+SlGHYZ4UCaiYPj6xe1f6Ua8zwaU7ub+d7XuIP7yT7nugL
	SxEkl9OoUJd50aw3zPDHFvSb4LBQmYUXj6k1mMFSRji+6YdoFmpA6+JLPRbfsfQc43JeHuYfVY+
	BSkYCAzcg5Uuyz8uGaDk0vV198PALmItnSRWLwBAjSUCR993FtQMwQvGF65nMSTtJSBx64lhlyB
	N99KDB+GfoM9e0i4v5GxBfK8SQn0jFkEcCcSDwZmouwICt+nOFumeWTXiZJ4COY99hnOQNuN6HA
	C08IdzmyzM4D/
X-Google-Smtp-Source: AGHT+IFxfIxOdynB0qYZNhwGje7TZRLlSluzwd7nQZ4H8ig5mFMMD1kedPZ9gHs3I3KO3A1Ax8ptjw==
X-Received: by 2002:a17:907:808:b0:ad8:a512:a9f6 with SMTP id a640c23a62f3a-ade8c5f86a5mr233515466b.4.1749641448286;
        Wed, 11 Jun 2025 04:30:48 -0700 (PDT)
Received: from wslxew242.. (11-127.static.abakusbp.net. [46.17.127.11])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ade1db55d6csm870519066b.72.2025.06.11.04.30.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Jun 2025 04:30:47 -0700 (PDT)
From: =?UTF-8?q?Goran=20Ra=C4=91enovi=C4=87?= <goran.radni@gmail.com>
To: boerge.struempfel@gmail.com,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Shawn Guo <shawnguo@kernel.org>
Cc: =?UTF-8?q?Goran=20Ra=C4=91enovi=C4=87?= <goran.radni@gmail.com>,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 2/3] dt-bindings: arm: imx8mp: Add Ultratronik Ultra-MACH SBC
Date: Wed, 11 Jun 2025 13:30:37 +0200
Message-ID: <20250611113039.304742-3-goran.radni@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250611113039.304742-1-goran.radni@gmail.com>
References: <20250611113039.304742-1-goran.radni@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Document the Ultratronik Ultra-MACH SBC, based on the NXP i.MX8MP SoC.

This board is manufactured by Ultratronik GmbH and uses the compatible
string "ux,imx8mp-ultra-mach-sbc".

Signed-off-by: Goran Rađenović <goran.radni@gmail.com>
---
 Documentation/devicetree/bindings/arm/fsl.yaml | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/fsl.yaml b/Documentation/devicetree/bindings/arm/fsl.yaml
index d3b5e6923e41..132a6f39b59a 100644
--- a/Documentation/devicetree/bindings/arm/fsl.yaml
+++ b/Documentation/devicetree/bindings/arm/fsl.yaml
@@ -1232,6 +1232,12 @@ properties:
           - const: tq,imx8mp-tqma8mpql            # TQ-Systems GmbH i.MX8MP TQMa8MPQL SOM
           - const: fsl,imx8mp
 
+      - description: Ultratronik SBC i.MX8MP based boards
+        items:
+          - enum:
+              - const: ultratronik,imx8mp-ultra-mach-sbc
+              - const: fsl,imx8mp
+
       - description: Variscite VAR-SOM-MX8M Plus based boards
         items:
           - const: variscite,var-som-mx8mp-symphony
-- 
2.43.0


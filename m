Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 038B22367C1
	for <linux-kernel@vger.kernel.org>; Fri, 20 Jun 2025 08:27:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750408065; cv=none; b=O/e10sDwCaBgYW59/F910J20YrEufKmyiPnYd3bICEf2cvSKkrNGUCFlJBFlkFFp4ixTMm4EiQbIrvsyYLVL+h5lsz1YiCVHGfXbhUHI+31CyVe8y7M9a9ltxxD1FuOokqlgIJjiigFCezV7Pt36PLdglzJtMVSn7r5fvBn8Q5w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750408065; c=relaxed/simple;
	bh=2D+i3G15KhWJmzs9CLvtQ7hedAF2DHhxvlFywkAiVis=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=YBq2uOJAaThsTd56+grIcmoYVzfJ/XpoE2gt8yikqgUBv+mAtm70IoD86pYwawMri4TbrX3jjSbEDfAH+JJV0BjI8AJm1Q+qgeT74gQJYrW9OleS85LQOU0WwMJqdSXV9qnaAdsXYS/qILrZpJGJLV1lAVMBwENGcwV9WdmxB64=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amarulasolutions.com; spf=pass smtp.mailfrom=amarulasolutions.com; dkim=pass (1024-bit key) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.b=ds/mNHRj; arc=none smtp.client-ip=209.85.128.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amarulasolutions.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amarulasolutions.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.b="ds/mNHRj"
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-451ebd3d149so9747975e9.2
        for <linux-kernel@vger.kernel.org>; Fri, 20 Jun 2025 01:27:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google; t=1750408062; x=1751012862; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MyOwHJZxAKroqQz4dfAYFqm5YCbbl731xMN7ncfMwH0=;
        b=ds/mNHRj13xrzsJjOt29S5V92YddFToXuuBQCFfRQTOJUmWTBT4PfShBU7IcH9GScr
         DB+VPSk39PhZdl0o37XmJ1Km03vCohruHEolgHDu7r59S8j7NETJbpMMUA7I4NzDpi8p
         H+FhdZjrhkxkXvoahNv8s4eg8WjfNmYaoSI8s=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750408062; x=1751012862;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=MyOwHJZxAKroqQz4dfAYFqm5YCbbl731xMN7ncfMwH0=;
        b=J5ZtTKNhF9+mdc/MvIAlGBJPrkB7gtCiH0yeLp6h8X/qkZR0q/sjtSntNs1oibyoyI
         fpjpHegVETlL5jK/fa0L1EGNDejYGdn1hCqrMiZpUwCNJYsEvpy3QhUPCMl0CTop05O/
         /LAEsVJeOcsgF727Avqearmjqc8GkBNutCGX75nwlDeqvOB1iukVYbR0roorz1Lp34sS
         D4reWkxpoY7VIkKDkFb7cokFpiCqURxSWV5lmkS0i4DcSC/rWAzRczYSEIt0gcZu9U3B
         d2bdMJ39ssPEtWtFFA2Fk7pxVDnlKlbR/BAORAy9McglkT5qbQuBzZhyy8aDuhGcuU3r
         1TkA==
X-Gm-Message-State: AOJu0YzjxYDAIS4cIqwCTVQ1RU/7+LTe/+UzoUO0mXd1DpwWMfdKYXoC
	+j2qgotIg8iB205XFDosA8kLjApU3ZJKwhDJBbdtZ8GLcHIpzjFvaLJetVDhWbpgYsMQbIzuw0V
	ph/cu
X-Gm-Gg: ASbGncuEFkyGL5JIP6BZReJYFpAcp43xAfgFW1YA9yBePR8tdQMhHvGxoLo+VdmBS6+
	nTlDyEzJ12fDIswtZnN5CMHGfHlIgJRIHlE9YRkKkkSioodKO0UMz3T9U/wfD7h4JYHxhEUHOxI
	MJ+yaMj8VcqvdxSjnZL4lWtRo+BTPr+HXcCbdzuMyDSqeyhO+uy9eiMb5lqcshdN6uGVEl8LgEq
	w+NTcbskVzIK7pr6hRWSz3HqPlGJ391Y0/BAL3EHn94ZwGU6A1xovyX9bkraSuFIr68r/ngmTI6
	9+yshEWRxenOi1VJ1kb+Ldyk7XT5Pnd8C0l2Z8P1xQa316cgaSjOUoBfXAqnQ6ExDJtx+C/IeqO
	SqYgQRMUCB/vrZ+xHDxFP4rpxyXZgMnKhNrosKCWOvwRY9MEcTcMZ
X-Google-Smtp-Source: AGHT+IFNGxjWHYKGJ+RuQldRKS+UF9Cbcxwd6gKCuUb99rs0xP31oQiaj9wNwY3lpeMMRglpLJix1w==
X-Received: by 2002:a05:600c:548a:b0:442:e03b:589d with SMTP id 5b1f17b1804b1-453656c2b8emr16098645e9.24.1750408062068;
        Fri, 20 Jun 2025 01:27:42 -0700 (PDT)
Received: from dario-ThinkPad-T14s-Gen-2i.amarulasolutions.com ([2.196.43.224])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4535e9844a9sm52274285e9.12.2025.06.20.01.27.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Jun 2025 01:27:41 -0700 (PDT)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: linux-kernel@vger.kernel.org
Cc: linux-amarula@amarulasolutions.com,
	Matteo Lisi <matteo.lisi@engicam.com>,
	Dario Binacchi <dario.binacchi@amarulasolutions.com>,
	Conor Dooley <conor.dooley@microchip.com>,
	Alexander Stein <alexander.stein@ew.tq-group.com>,
	Conor Dooley <conor+dt@kernel.org>,
	Francesco Dolcini <francesco.dolcini@toradex.com>,
	Frieder Schrempf <frieder.schrempf@kontron.de>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Marek Vasut <marex@denx.de>,
	Markus Niebel <Markus.Niebel@tq-group.com>,
	Max Merchel <Max.Merchel@ew.tq-group.com>,
	Michael Walle <mwalle@kernel.org>,
	Primoz Fiser <primoz.fiser@norik.com>,
	Rob Herring <robh@kernel.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Tim Harvey <tharvey@gateworks.com>,
	devicetree@vger.kernel.org
Subject: [RESEND PATCH v4 01/10] dt-bindings: arm: fsl: support Engicam MicroGEA BMM board
Date: Fri, 20 Jun 2025 10:27:05 +0200
Message-ID: <20250620082736.3582691-2-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250620082736.3582691-1-dario.binacchi@amarulasolutions.com>
References: <20250620082736.3582691-1-dario.binacchi@amarulasolutions.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add devicetree bindings for Engicam MicroGEA BMM board based on the
Engicam MicroGEA SoM (System-on-Module).

The use of an enum for a single element is justified by the future
addition of other boards based on the same SoM.

Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
Acked-by: Conor Dooley <conor.dooley@microchip.com>

---

(no changes since v3)

Changes in v3:
- Add Acked-by tag of Conor Dooley.

 Documentation/devicetree/bindings/arm/fsl.yaml | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/fsl.yaml b/Documentation/devicetree/bindings/arm/fsl.yaml
index d3b5e6923e41..5feb62611e53 100644
--- a/Documentation/devicetree/bindings/arm/fsl.yaml
+++ b/Documentation/devicetree/bindings/arm/fsl.yaml
@@ -769,6 +769,13 @@ properties:
           - const: dh,imx6ull-dhcor-som
           - const: fsl,imx6ull
 
+      - description: i.MX6ULL Engicam MicroGEA SoM based boards
+        items:
+          - enum:
+              - engicam,microgea-imx6ull-bmm       # i.MX6ULL Engicam MicroGEA BMM Board
+          - const: engicam,microgea-imx6ull        # i.MX6ULL Engicam MicroGEA SoM
+          - const: fsl,imx6ull
+
       - description: i.MX6ULL PHYTEC phyBOARD-Segin
         items:
           - enum:
-- 
2.43.0


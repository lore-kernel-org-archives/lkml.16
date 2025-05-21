Received: from mail-ej1-f54.google.com (mail-ej1-f54.google.com [209.85.218.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8469E23FC68
	for <linux-kernel@vger.kernel.org>; Wed, 21 May 2025 09:28:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747819716; cv=none; b=DAaA0giG5jZDmqeg2HXHXWg+GEsJIhl4Rw3sXA5YJ0OXfOCLjIB0lQIV/5J1ItX0TTZrWIuefTkS7YgFP6KGw1Gf27cP2zrRv/EClvXpB9wCNj8/7MRmY9MbsZzmGq+byvNMhso1tPPLh6aTX6hF5u+cvUSckK4rFXuYH5yk3j8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747819716; c=relaxed/simple;
	bh=tDQnNA8SdA3gnbnRie5K6VZkCFFZI6Xy6ZUsXfZkuwA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=DGQIfuj7lKwjXANzAf7wo69WmRcsZ3tuXl6VztK0YXnU0fhG0JsnmIDF0beoeJandwHilmoYZomn44ZHQ0+mgAGrGFGCDyU8dvtpjnWXz7xM48a/pf2KhbfhQ7vj/khkrr6ZATbipwRhEl4X99HlJ7tl9bcjHxTbTl6z7fV1YcE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amarulasolutions.com; spf=pass smtp.mailfrom=amarulasolutions.com; dkim=pass (1024-bit key) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.b=BDF7QWRX; arc=none smtp.client-ip=209.85.218.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amarulasolutions.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amarulasolutions.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.b="BDF7QWRX"
Received: by mail-ej1-f54.google.com with SMTP id a640c23a62f3a-ad56829fabdso520123666b.1
        for <linux-kernel@vger.kernel.org>; Wed, 21 May 2025 02:28:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google; t=1747819712; x=1748424512; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8IZYk2wroPN5tq+OXAjU3VA8cJLAmAbDmT+zR2H07Dg=;
        b=BDF7QWRXI9JCcICdI7+QyFxhgo/1xN3TJicOqDjdWvfoKZhc7N4kRKNzo9WOd0Doi9
         XRza8ALqa/9m9HDOPl8aKEoYgxfs6Bst6WgCNd7x3eph9IYFLZayrCWtFQCWbvcgcAXN
         UgzIyv1nDNU7cxPseHUqHlpRN0vAXyGg8JDUg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747819712; x=1748424512;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=8IZYk2wroPN5tq+OXAjU3VA8cJLAmAbDmT+zR2H07Dg=;
        b=A3GI0zo2t3vwClGJ+IS+E+8r6yts4ma8spsTLBijYJ2B2mF5JywBqdewH+dyc/Hc9L
         5wz6oo9pbKsUNS4+EdQYCItXp3o353VRR3tMA8ug4HulDW8stj8Ms0U5Aa73oXcYQld2
         F0GmnEQSglHkRqPVZxzvDK1rLv/ScRwlzERDbDHvoF+iPfu8p4kHaW7NMcEkNKQDI498
         rL8pcU1fu/Uu16wWxKQg/oI+A+sVRhEwH/W+2BJZC0ZGhvjbX35LBiHfgpnsuH3AlwkR
         THnSTJYfLlOGuA7aaG9OQcoFw2SF2QTzwWqXgq+VLT+KfBpLqd6ZxisPX2mBW1cJAntV
         qyJw==
X-Gm-Message-State: AOJu0YwnL6UZiYBcA7ee0o2K1n458zfHIkPTMZaZ50PNtGi3uUWbxwvN
	8NoA6UJPelybaIuBgsJOHaZ9TKiz4wUhMEW+/I4Qven9sV8FA0IphjgSq6C5VUByiZA3DZuQtcc
	QUSWU
X-Gm-Gg: ASbGncsdBHgc310v7XRk6XuWI/d3zE7JG6b6o9yzRxmIPy++7zMdJMOb3ZBzzKTT5VA
	gvzP+oxJDBHQu2pmhwlfurfQDClErYxmyCI6YzWlBgquN6bf+7kb8zWNhm+l90+ZTb4qSdDhaFT
	wXcm53xXMwgr1FgseBo2mDF1aztJYVDlEJVJJtsMPsXgTC1i0oKgOpmJ/bX8dhCCol1ACFXKlqI
	qJoBRyo8qfRQuUY5wflCqbZVlpgB0UgS29hGFzQjn66UYLmdDLGuxDOCfRLu/l8NbpMi65Pid7t
	ukgO4klwPpE/++JMALbj9fsnTDezTNdH0wlM6hUb3G0WoBkEnTrVpClmLIbQK3+8IdGYYmAcEyT
	zpWPKAvXX6BEVW0NIVexLZEM=
X-Google-Smtp-Source: AGHT+IEm0a399896pQ314IkZrz5TfLecuw9Wty/psn9w2yhIO27jQNCSBoC8B6iZKqRINKNhrwWUSQ==
X-Received: by 2002:a17:907:6d11:b0:ad2:3b29:4cd7 with SMTP id a640c23a62f3a-ad52d5d4057mr1771891366b.45.1747819712515;
        Wed, 21 May 2025 02:28:32 -0700 (PDT)
Received: from localhost.localdomain ([2001:b07:6474:ebbf:cfc5:5070:d6f4:1d86])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ad52d275d9fsm867442466b.74.2025.05.21.02.28.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 May 2025 02:28:32 -0700 (PDT)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: linux-kernel@vger.kernel.org
Cc: linux-amarula@amarulasolutions.com,
	michael@amarulasolutions.com,
	Dario Binacchi <dario.binacchi@amarulasolutions.com>,
	Alexander Stein <alexander.stein@ew.tq-group.com>,
	Conor Dooley <conor+dt@kernel.org>,
	Fabio Estevam <festevam@denx.de>,
	Francesco Dolcini <francesco.dolcini@toradex.com>,
	Frieder Schrempf <frieder.schrempf@kontron.de>,
	Heiko Schocher <hs@denx.de>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Marek Vasut <marex@denx.de>,
	Max Merchel <Max.Merchel@ew.tq-group.com>,
	Michael Walle <mwalle@kernel.org>,
	Peng Fan <peng.fan@nxp.com>,
	Rob Herring <robh@kernel.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Tim Harvey <tharvey@gateworks.com>,
	devicetree@vger.kernel.org
Subject: [PATCH 2/3] dt-bindings: arm: fsl: add i.MX28 Amarula rmm board
Date: Wed, 21 May 2025 11:28:21 +0200
Message-ID: <20250521092826.1035448-3-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250521092826.1035448-1-dario.binacchi@amarulasolutions.com>
References: <20250521092826.1035448-1-dario.binacchi@amarulasolutions.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The board includes the following resources:
 - 256 Mbytes NAND Flash
 - 256 Mbytes SRAM
 - LCD-TFT controller
 - CAN
 - USB 2.0 high-speed/full-speed
 - Ethernet MAC

Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
---

 Documentation/devicetree/bindings/arm/fsl.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/arm/fsl.yaml b/Documentation/devicetree/bindings/arm/fsl.yaml
index 1b90870958a2..b67f0e71e4c8 100644
--- a/Documentation/devicetree/bindings/arm/fsl.yaml
+++ b/Documentation/devicetree/bindings/arm/fsl.yaml
@@ -89,6 +89,7 @@ properties:
       - description: i.MX28 based Boards
         items:
           - enum:
+              - amarula,imx28-rmm
               - armadeus,imx28-apf28      # APF28 SoM
               - bluegiga,apx4devkit       # Bluegiga APx4 SoM on dev board
               - crystalfontz,cfa10036     # Crystalfontz CFA-10036 SoM
-- 
2.43.0


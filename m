Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5295023504A
	for <linux-kernel@vger.kernel.org>; Fri, 20 Jun 2025 08:06:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750406801; cv=none; b=VVILy/ZhH7l/fogvoa2G1YUu+R6vbBKHsh9Q+Ty+g+8tBqm88f43fpP3eJPXajWBqu3D5J184pRdphmCnDI/VoEsh0vZuRFUBziN/i7+oy5BToOP+uLCz+UeI8WC8mr/xZBfs7oAHFJdZ8VbKj1/b5tLPR5XleZ+Zo6TeklyJ84=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750406801; c=relaxed/simple;
	bh=Yb/dYmlhorZiLYB+FvS35uOVh5EqFEwpgp8+5JRdYg0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=tfN3QxHfjJ8+68W1CLha+IrdFhhdc5VRxQ2+TyGCuKNvs8uF+U0q0Y16glu2zgdrmNqgmygcvlUZXhujVJTEl3iubemOplNWmlwLxYyn00pR6yYzjF5vOZySnhgq7kSB/irWwda2irEY90zXTpyID41rNScy0Qfpv0KtKHOtVCI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amarulasolutions.com; spf=pass smtp.mailfrom=amarulasolutions.com; dkim=pass (1024-bit key) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.b=k2t9DqMR; arc=none smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amarulasolutions.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amarulasolutions.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.b="k2t9DqMR"
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-451dbe494d6so17921425e9.1
        for <linux-kernel@vger.kernel.org>; Fri, 20 Jun 2025 01:06:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google; t=1750406794; x=1751011594; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=C7E4Hyx17TTb89iG3phE25g8XkVePt97zdgGIjQWEQM=;
        b=k2t9DqMRCvI4mS6oDyIs4FuaLmnheTPhRrIcErC+5F4g84HC3puKy4FN5ESnLUWVCF
         sHvk4WuDOzXNKQgqQduCB32xacIXdhXefIV1dd5zJW8ZLRt8pY2/dsE5pwO4a7pr3Aq8
         o5pU4N5vb4xUaDp+rs7CyNCVHcUH9UWy69aYY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750406794; x=1751011594;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=C7E4Hyx17TTb89iG3phE25g8XkVePt97zdgGIjQWEQM=;
        b=t7Tlk3grBGXBFawwhbryd7IWrjYBKDNXEuBI6VybWXyj4keYuamOjk+rMlE1LoYwz3
         6+8EvGUkjN33XMhqTRJyWdt2BjYAp4U4nF2sbQt1Uh08oY7bSIjtzq5NS0NGut+R9hlf
         b8K01+cY/FYq6wcskVx0PmWyO1PI7nc24QmUu21x0ZCAVKvGzNbwEutpNp7gcDo0UNSq
         GXgppR58umVS7EhziPbGZDoNo4czKMXXqMdm35n3l63Ny2fwqh8nguk4WQ7ADhTp0ZmJ
         U461T6R7iUBHH29m63QTr9vF0nsx7H6GQnF7ptKzMZukGbi/OyVEJS7yg2AGJem5TMSh
         muMw==
X-Gm-Message-State: AOJu0YynA4g52iHbSedYlzerkwDlZYy5y5MS+RC/68oQiwOE71FOK0+s
	UA+n4Cccat6cmNcmyl7ue+j/zMEhJzPLAlWROrt4QfcKNZO5wF9n/IQ6rKZ+5/u6lNazfw/c+DU
	q1sYk
X-Gm-Gg: ASbGncv5GF0ZM7lRMxuxqGxSYMmDBcrPz7F8tB8nXjVndFAahjvc8JAXKIdvsSNkhsd
	i9oVYnPkZ/Kjjd7ygDod5ON4V4IB5r7k4Vv3MyFBZlL5s3y1++ZHxJx/rlrQ+aS/tZQU6QjraVP
	yWLyqpQs563OCex5jQByQzoz4wxnFY86+KjzSP33F/zSs5dxgejQp4Gbj3eWjtYUiY/DonWP7+6
	YXZs4ax1cuhI492oty9JTj6nRz81WBSYT/wE4JwH4uJgJlvi9Xm0pqS6j9TziavvryO/ufXaONW
	PaDyz+di+I8WYH5oS3+bYafGmb5rbJbhHgCuEmNDAasTqg1J7zm4qPPa56RZ01nXHRVUgRXKebq
	0Q/w23QMjBi1IMJ0C8JpvD46EVzXTRx9q3jnfYUsaPwEuA6QHehLL
X-Google-Smtp-Source: AGHT+IFdRGemq7WexpF2J0EbFEg7DqzMjEzopz10fXPShHKcDHzVJnSrlTKt4vWmJcZQfBBTLGm7Lw==
X-Received: by 2002:a05:600c:1d28:b0:43c:ee3f:2c3 with SMTP id 5b1f17b1804b1-453659b8787mr13075115e9.7.1750406794343;
        Fri, 20 Jun 2025 01:06:34 -0700 (PDT)
Received: from dario-ThinkPad-T14s-Gen-2i.amarulasolutions.com ([2.196.43.224])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4535ebd02basm50137905e9.39.2025.06.20.01.06.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Jun 2025 01:06:33 -0700 (PDT)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: linux-kernel@vger.kernel.org
Cc: michael@amarulasolutions.com,
	linux-amarula@amarulasolutions.com,
	Frank Li <Frank.Li@nxp.com>,
	Dario Binacchi <dario.binacchi@amarulasolutions.com>,
	Conor Dooley <conor.dooley@microchip.com>,
	Alexander Stein <alexander.stein@ew.tq-group.com>,
	Conor Dooley <conor+dt@kernel.org>,
	Francesco Dolcini <francesco.dolcini@toradex.com>,
	Frieder Schrempf <frieder.schrempf@kontron.de>,
	Heiko Schocher <hs@denx.de>,
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
Subject: [PATCH v6 2/5] dt-bindings: arm: fsl: add i.MX28 Amarula rmm board
Date: Fri, 20 Jun 2025 10:06:18 +0200
Message-ID: <20250620080626.3580397-3-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250620080626.3580397-1-dario.binacchi@amarulasolutions.com>
References: <20250620080626.3580397-1-dario.binacchi@amarulasolutions.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The board includes the following resources:
 - 256 Mbytes NAND Flash
 - 128 Mbytes DRAM DDR2
 - CAN
 - USB 2.0 high-speed/full-speed
 - Ethernet MAC

Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
Acked-by: Conor Dooley <conor.dooley@microchip.com>

---

(no changes since v3)

Changes in v3:
- Add Acked-by tag of Conor Dooley

 Documentation/devicetree/bindings/arm/fsl.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/arm/fsl.yaml b/Documentation/devicetree/bindings/arm/fsl.yaml
index d3b5e6923e41..eb519ab14296 100644
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


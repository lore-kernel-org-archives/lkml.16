Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5CD682DFA32;
	Tue, 15 Apr 2025 02:45:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744685158; cv=none; b=VuhaJdn0QjwK+Mfe1UiU7mURUHaWWciWwptf69e0uW9HQd5At03GjOvwKl2KrbcDQo7LXZUlVUXlKYrNeZGngcC6q4iXInVAEDgeI5y7iuVVx55X4+uRNcqhUhl/QdmoTX5CG2QKIYiNzXAANL17/w5ualDolHKUIlndi0nltP0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744685158; c=relaxed/simple;
	bh=uMxf6PyjUiBPhkaKa+YXG1JpcOgoPD6r+dpLZyFYDyU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=OuEfgwxtbuA+J/mahr38EBfIgYN00gfVDKZZReL5yqGIA5lEF5/U8fXdG/mrYnqpitpYwqS53iOziebOHI2mXAqGyeuVDatCDWJ5NbAtvdlmvhTHlAWxoGB8uNfkG8eenEiXnLadJm7ILm5WCLoVE8oIBINYAwn08wQ+aRrN7x8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=mmJVinlg; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="mmJVinlg"
Received: by smtp.kernel.org (Postfix) with ESMTPS id DE3C5C4CEEB;
	Tue, 15 Apr 2025 02:45:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744685157;
	bh=uMxf6PyjUiBPhkaKa+YXG1JpcOgoPD6r+dpLZyFYDyU=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=mmJVinlg+Yvcj+cvNnDyPnPCW2jXJlX3cuJcDCioPLiF3Ts/3lQAaX5EDNwD1H3fT
	 DRDG69vBR9ZVAn3QLwB1cek/y2aqyTxzroE2U8xPlvedzQJc1cHK5npC8qM2ERCZdP
	 0NBhE3e52ZQYGE3UE5EwbnJILGfraXM8VM0Tu1V7AHpYSZFu3GSOxqLmhT27dfNBQS
	 fU1t9HnVCGcVN3yBbEKw/7tkRxCVkvy8CgLngFHJjWJLKRdlVGjH6wZYb6IT41Eka7
	 4jpg0aHodqzwBRTz+bvtOohXwd7fQp9TSUYRUgsHTo/g/2IX3rLPPwKI7Q/HvbkzRY
	 2aTL3eBdocHlA==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C5817C369B9;
	Tue, 15 Apr 2025 02:45:57 +0000 (UTC)
From: Chuan Liu via B4 Relay <devnull+chuan.liu.amlogic.com@kernel.org>
Date: Tue, 15 Apr 2025 10:45:25 +0800
Subject: [PATCH v3 2/7] dt-bindings: soc: amlogic: C3 supports clk-measure
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250415-clk-measure-v3-2-9b8551dd33b4@amlogic.com>
References: <20250415-clk-measure-v3-0-9b8551dd33b4@amlogic.com>
In-Reply-To: <20250415-clk-measure-v3-0-9b8551dd33b4@amlogic.com>
To: Neil Armstrong <neil.armstrong@linaro.org>, 
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org, 
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
 Chuan Liu <chuan.liu@amlogic.com>
X-Mailer: b4 0.14.1
X-Developer-Signature: v=1; a=ed25519-sha256; t=1744685155; l=875;
 i=chuan.liu@amlogic.com; s=20240902; h=from:subject:message-id;
 bh=P5KRner9ELHl3o409yiGCGnkva5HFExJ3rMn3+oG1ko=;
 b=uMAB9xx7E431TayRAue3yuobamxsychqlDaQKgfjp5C+LsrdIFynUExHqnWcAPkJpRnP507/S
 HB0rtVEChGQDNMWcDPOC9X3c6YJfRKLOPTDsY6lQyP593/Uzqy/mSWQ
X-Developer-Key: i=chuan.liu@amlogic.com; a=ed25519;
 pk=fnKDB+81SoWGKW2GJNFkKy/ULvsDmJZRGBE7pR5Xcpo=
X-Endpoint-Received: by B4 Relay for chuan.liu@amlogic.com/20240902 with
 auth_id=203
X-Original-From: Chuan Liu <chuan.liu@amlogic.com>
Reply-To: chuan.liu@amlogic.com

From: Chuan Liu <chuan.liu@amlogic.com>

C3 adds support for clk-measure.

Acked-by: Rob Herring (Arm) <robh@kernel.org>
Signed-off-by: Chuan Liu <chuan.liu@amlogic.com>
---
 .../devicetree/bindings/soc/amlogic/amlogic,meson-gx-clk-measure.yaml    | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/soc/amlogic/amlogic,meson-gx-clk-measure.yaml b/Documentation/devicetree/bindings/soc/amlogic/amlogic,meson-gx-clk-measure.yaml
index 77c281153010..275afe7fe374 100644
--- a/Documentation/devicetree/bindings/soc/amlogic/amlogic,meson-gx-clk-measure.yaml
+++ b/Documentation/devicetree/bindings/soc/amlogic/amlogic,meson-gx-clk-measure.yaml
@@ -22,6 +22,7 @@ properties:
       - amlogic,meson-axg-clk-measure
       - amlogic,meson-g12a-clk-measure
       - amlogic,meson-sm1-clk-measure
+      - amlogic,c3-clk-measure
 
   reg:
     maxItems: 1

-- 
2.42.0



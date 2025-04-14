Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E840C25F984;
	Mon, 14 Apr 2025 10:12:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744625576; cv=none; b=e7KTIp/UF3TpOgKQghSes4IeCzA3ZHKxlvOIok/Wna78bhYBRIJD5/xLBplw4Rc2dMnbfqZC1S+hz9P4YRjAz57gayiMLZhKWzyy+xJxBk8z9HYonE9jZXmzpz3qtasQ05NXIaAzT1N6EkLC3PTDgMER6jF8YVcsb+6d3Br1aLE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744625576; c=relaxed/simple;
	bh=uMxf6PyjUiBPhkaKa+YXG1JpcOgoPD6r+dpLZyFYDyU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ptKxV/0PZeVxW31vwJdsqgQWn61NtTNyVAMZkvo/ebxWyePkV1/ISD8fCyoNzzpuJG84k8zGx0hD8loSzXOAAkj+mnQ8c8AjV6hXgNXlKTsE9xnyP5BonrJO6F/xfc/y8lal0fX8EBwdo0oe0bHwJBSAGlHJi/etVHmlhP9TtMk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=pIUXq+DK; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="pIUXq+DK"
Received: by smtp.kernel.org (Postfix) with ESMTPS id BBF1FC4CEEC;
	Mon, 14 Apr 2025 10:12:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744625575;
	bh=uMxf6PyjUiBPhkaKa+YXG1JpcOgoPD6r+dpLZyFYDyU=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=pIUXq+DKYJunOHquufjQRstJNO2wNOohjDbCQwqFCZHKenOydN4YW9e0pXWmcf1v6
	 wi7oWJZpWFB2AFeJIF+TFz6u0jA3LxFDU9nWiI3StzLbgZDXxPU4HHAg4HrFGPlUap
	 IekDNWLCNvdX93A78whKUEWkABaO8dI7BKrF60p7g+iaPqy1G3W2t/BupWI5yg1b1f
	 jVWQIozTMszyzY43QD0mmaCHCUl03mFwYWNcnpoS1SLFQ/yINwyvRrYy5tctISvb83
	 w8RfskLfumOJ6HvQLvMLnwYVoMAgDs9XOKpfnNmlvRpLG9cfnP99RQ1xy5v/0/7MTL
	 TevW5XZMyCJ/g==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ACEC9C369B8;
	Mon, 14 Apr 2025 10:12:55 +0000 (UTC)
From: Chuan Liu via B4 Relay <devnull+chuan.liu.amlogic.com@kernel.org>
Date: Mon, 14 Apr 2025 18:12:29 +0800
Subject: [PATCH v2 2/7] dt-bindings: soc: amlogic: C3 supports clk-measure
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250414-clk-measure-v2-2-65077690053a@amlogic.com>
References: <20250414-clk-measure-v2-0-65077690053a@amlogic.com>
In-Reply-To: <20250414-clk-measure-v2-0-65077690053a@amlogic.com>
To: Neil Armstrong <neil.armstrong@linaro.org>, 
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org, 
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
 Chuan Liu <chuan.liu@amlogic.com>
X-Mailer: b4 0.14.1
X-Developer-Signature: v=1; a=ed25519-sha256; t=1744625573; l=875;
 i=chuan.liu@amlogic.com; s=20240902; h=from:subject:message-id;
 bh=P5KRner9ELHl3o409yiGCGnkva5HFExJ3rMn3+oG1ko=;
 b=OBeqwNSfKlp1ikH78aflX1hMLwcMKPmgvjsG+/sH9hULhjziPbD6BrLZo0QJOtrtPHjP37N20
 1aTJ/JXfGobCpPe30pfYUiyMIXlkVgDOZFfw9ZKJEiaGMjYHVHX5Qd2
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



Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1515E221FC7;
	Fri, 11 Apr 2025 12:42:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744375375; cv=none; b=SeblLHPtzBsJnhzEqGrqgx+8njwROAAxwCbI1vNRsTkYeAxEHjILO0ANhf2ht5XU/61f6wQHLlSYqDJq6lm+kW5P67m7LKoKbNc3fdCoydIeRK6g/4/DZ/sB5+n4X3o8V+nHRUlp5SQfP5V/os9jTne1NqClOyCOCQWf/xiGQ7A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744375375; c=relaxed/simple;
	bh=7uMNt1krg1bqV29C3TK9qHsnV2Y5y0mXablLbhELmf4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ItkkZNh0lPI985/u8oe8FKL7puZ2oBdBuJ3iHF6fO7/J6jk0LIh/TNUi6VmKlsTfb1xmNeuD9t4qXKRR30dSed/4o6yxY9znaJEkQc+MTM9GsBFA/Lwma7yngtnAto57VmR/egQLfzC9+913482mCs9WEoc99/LTahGY8X7Pjsg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=fd6/KRVS; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="fd6/KRVS"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 9E405C4CEEA;
	Fri, 11 Apr 2025 12:42:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744375374;
	bh=7uMNt1krg1bqV29C3TK9qHsnV2Y5y0mXablLbhELmf4=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=fd6/KRVS1TsaHEbnpAnf2soFDA4rUrqM0Q0vmotIVDvTB4KjZ63xavZ8TxtPzIXaD
	 pLOVISMd4vD/uk8+MGGoJn5v3/fo9cI5zVh6eZrJ1w0j42vw4AhvML69eSITqcE+hj
	 azHSd3GN5rQu46YHxrBSMsza8nxOE53KOxyjazmyzFo6b+MFJsMk4m6CudeYgWVFxK
	 ojAZUlaR5GMARpJ+bWnXOCdB3UfgZpq8D+svNL64uLJED8T3SxzT7o8eYQfSTKkNBw
	 HOUkPDniEFYWK0pLgRsDAxwH1BT2pVAxBxmK3YMWDzYL5p3xqVHsBYB7pKu9NAFm6Z
	 xOT1KQ7fgIrdQ==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8D3E0C369AC;
	Fri, 11 Apr 2025 12:42:54 +0000 (UTC)
From: Chuan Liu via B4 Relay <devnull+chuan.liu.amlogic.com@kernel.org>
Date: Fri, 11 Apr 2025 20:42:44 +0800
Subject: [PATCH 2/7] dt-bindings: soc: amlogic: C3 supports clk-measure
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250411-clk-measure-v1-2-cb46a78d019a@amlogic.com>
References: <20250411-clk-measure-v1-0-cb46a78d019a@amlogic.com>
In-Reply-To: <20250411-clk-measure-v1-0-cb46a78d019a@amlogic.com>
To: Neil Armstrong <neil.armstrong@linaro.org>, 
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org, 
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
 Chuan Liu <chuan.liu@amlogic.com>
X-Mailer: b4 0.14.1
X-Developer-Signature: v=1; a=ed25519-sha256; t=1744375372; l=828;
 i=chuan.liu@amlogic.com; s=20240902; h=from:subject:message-id;
 bh=R+VgfvEaPoAKSQB5hn3wQA0opSipq/Yo223lp8X4HAc=;
 b=7xdBRMtyfW2OTwf09OOs3HozL9VTvwFUEDptXFUHha3noZ/r6nUSO8mWRz+q8JXRYnEpxc1Bx
 IHf08TbR3j7Buz5fiFIKwY5dqELdrl7Ap98uMszISFjBMdF9fsaIloU
X-Developer-Key: i=chuan.liu@amlogic.com; a=ed25519;
 pk=fnKDB+81SoWGKW2GJNFkKy/ULvsDmJZRGBE7pR5Xcpo=
X-Endpoint-Received: by B4 Relay for chuan.liu@amlogic.com/20240902 with
 auth_id=203
X-Original-From: Chuan Liu <chuan.liu@amlogic.com>
Reply-To: chuan.liu@amlogic.com

From: Chuan Liu <chuan.liu@amlogic.com>

C3 adds support for clk-measure.

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



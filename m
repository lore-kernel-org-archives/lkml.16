Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 708EF267AE5;
	Mon, 14 Apr 2025 10:12:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744625576; cv=none; b=Tp040Ny/VbH5Eo8SXrLE7odUwyIG7rl3AWl82qDDRfVI9UadmALAfl19zYYihnriuPa0Xi16iCFUMZXTh+x6E95h2tfuQ3W7g5yHZueY0n2Na37srdWVCI+p0hTDxEwzSjmRSrl8kYXhDW8qs5dnH8KDd+guIpWU/gYyWX0s124=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744625576; c=relaxed/simple;
	bh=75keAXRMnoUm3nWjp9JCjWhNFcUePI50VoUETtE1kCQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=qyIWEoTOH/7Mcicn1nYblzzzAmS9QkLro1dHXhkO4Z3yLE0MSb+nYFDbv3EfhYWZ58xdgVOemn6I/aruDWc/N1mzWxtVpZ6m5tdm97TD/AdH5M1TuJHw/etGJFiI7IYjE8lzBJkOy+0Hd5eyaFWqxUoGbhR8piCEnAdkIPWePxc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=h79SvUhp; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="h79SvUhp"
Received: by smtp.kernel.org (Postfix) with ESMTPS id C6F8CC4CEEE;
	Mon, 14 Apr 2025 10:12:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744625575;
	bh=75keAXRMnoUm3nWjp9JCjWhNFcUePI50VoUETtE1kCQ=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=h79SvUhpxexqgyIMLxxDjXR9Ue7ikBs5MMi+HAT/F61BOT2gAed5XLssj8vTtZZ8x
	 2e+1T1AZm+ItaLqu4KwDif44gX+C/I4HvW7RVQAYqmQCnHrNMT7Fmgpj5S+5ZKrL5W
	 NbQvIKyOTgsPCwi/f3jM5Lucz4eAEDA9wOGBjJLKP3K62RcOkZFmxnnl0V0oEd38VE
	 bwnWREA81nNJpXpDDGQ3wjxu/fyjTncU6m3XHpg6DTvXnMkCx3a7gxncjktOK9O8Eq
	 6j6I3Px7OaDG9lWw0g5PlLytM44pERdlf58xxlR2ceIK5RT9IDhrrp4xZwjp7abGku
	 25Rb/JhC/2vXA==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B9F18C369B5;
	Mon, 14 Apr 2025 10:12:55 +0000 (UTC)
From: Chuan Liu via B4 Relay <devnull+chuan.liu.amlogic.com@kernel.org>
Date: Mon, 14 Apr 2025 18:12:30 +0800
Subject: [PATCH v2 3/7] dt-bindings: soc: amlogic: S4 supports clk-measure
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250414-clk-measure-v2-3-65077690053a@amlogic.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1744625573; l=868;
 i=chuan.liu@amlogic.com; s=20240902; h=from:subject:message-id;
 bh=Bv5Y4DpbmiEYh7fjv0Fc7kk2ovIc05XnT6FwbcehZ6c=;
 b=5MN7KmLfAj+nB4Y5624uTR7Cw0B5gifagMJGUugs2I5NWLbXhV5LZLPFeNIFM+GRwSb+IW0tQ
 ZkBf0C+mdWnDahWec+EGuf7p6pPd9W9TGu8CWl4atQ27TvqRVgjxCns
X-Developer-Key: i=chuan.liu@amlogic.com; a=ed25519;
 pk=fnKDB+81SoWGKW2GJNFkKy/ULvsDmJZRGBE7pR5Xcpo=
X-Endpoint-Received: by B4 Relay for chuan.liu@amlogic.com/20240902 with
 auth_id=203
X-Original-From: Chuan Liu <chuan.liu@amlogic.com>
Reply-To: chuan.liu@amlogic.com

From: Chuan Liu <chuan.liu@amlogic.com>

S4 adds support for clk-measure.

Acked-by: Rob Herring (Arm) <robh@kernel.org>
Signed-off-by: Chuan Liu <chuan.liu@amlogic.com>
---
 .../devicetree/bindings/soc/amlogic/amlogic,meson-gx-clk-measure.yaml    | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/soc/amlogic/amlogic,meson-gx-clk-measure.yaml b/Documentation/devicetree/bindings/soc/amlogic/amlogic,meson-gx-clk-measure.yaml
index 275afe7fe374..39d4637c2d08 100644
--- a/Documentation/devicetree/bindings/soc/amlogic/amlogic,meson-gx-clk-measure.yaml
+++ b/Documentation/devicetree/bindings/soc/amlogic/amlogic,meson-gx-clk-measure.yaml
@@ -23,6 +23,7 @@ properties:
       - amlogic,meson-g12a-clk-measure
       - amlogic,meson-sm1-clk-measure
       - amlogic,c3-clk-measure
+      - amlogic,s4-clk-measure
 
   reg:
     maxItems: 1

-- 
2.42.0



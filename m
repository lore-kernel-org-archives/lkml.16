Received: from out-182.mta0.migadu.com (out-182.mta0.migadu.com [91.218.175.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9878B220689
	for <linux-kernel@vger.kernel.org>; Sun, 29 Jun 2025 12:38:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751200738; cv=none; b=DmgNKj29Oa+AwjpB93PRpQA+/5UltzWGVOpyTrX61ePappWJcybaLm68+vsl2yZnG1mFJvWC6Hlc1uyVrJfX7QxZy/vRf/D31zOgEKJ1VKNsVzkBcGYnlXYP6FEmPDmVKP+7YwevwcFtpZACs+GCNKEA6wLD7cJYSdE9XU475Ks=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751200738; c=relaxed/simple;
	bh=ROFq9xtzXOdmqMZ7ZCjIaDyNS7DKkayyoX8QkeXIndE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=twKeyAXdXvpijxy7kPsiFB6md+ZTvxD3qkSX6b/nizn0OjaQG0jiEL/19CA0gvmYAokSknVLCJphSF+xaPxPt0hmhogbUVTcCF4sFgia4M0J8rrOEAeow4IEd6sjtvprh+tqLg8BrTk+X3OrV5f1OhyUGBzh6l1ffaCsG5Q3eN0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=cknow.org; spf=pass smtp.mailfrom=cknow.org; dkim=pass (2048-bit key) header.d=cknow.org header.i=@cknow.org header.b=mlPpIbMx; arc=none smtp.client-ip=91.218.175.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=cknow.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cknow.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cknow.org header.i=@cknow.org header.b="mlPpIbMx"
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cknow.org; s=key1;
	t=1751200733;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=FvDG6tIe9cP6E3SSgrjHunQaCLP0z6lp3rhIo96W2Gg=;
	b=mlPpIbMxczq+HF4S7dBEtez0pCckZ4hAlaXYFIlYcXvzdeX3HJeF9W677OCRPgf0Ngj9Ao
	X6rVDLoN1UK+9HUeZDpgZHEzalUl445iekUUp7GoMuxLqHygoRMC7ff7SAON9ylE8f0f6r
	MJAiCDKdzSYmV4sNX9lsYCyC+NjNZFID3e6MOotW+8CiDMGICUjKEUhVP5od+XXah1gWEn
	zgINgZh3/UnJ6iU7OI5cNLm3n8COqRjQ6alSSyvQ8f6iBLE6VkmIeCfOBrL5zbc7Cemqdb
	s1z+i+Q4FR+wOcad8cE0asR8mS91mm6mPadayM4VChvlUTY29U56hlDHgM8OQg==
From: Diederik de Haas <didi.debian@cknow.org>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Heiko Stuebner <heiko@sntech.de>
Cc: Dragan Simic <dsimic@manjaro.org>,
	Quentin Schulz <quentin.schulz@cherry.de>,
	Johan Jonker <jbx6244@gmail.com>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Diederik de Haas <didi.debian@cknow.org>
Subject: [PATCH v3 03/10] dt-bindings: display: rockchip,dw-mipi-dsi: Drop address/size cells
Date: Sun, 29 Jun 2025 14:34:44 +0200
Message-ID: <20250629123840.34948-4-didi.debian@cknow.org>
In-Reply-To: <20250629123840.34948-1-didi.debian@cknow.org>
References: <20250629123840.34948-1-didi.debian@cknow.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT

When the dw-mipi-dsi binding was initially added in commit
a20d86e7f964 ("Documentation: dt-bindings: Add bindings for rk3288 DW MIPI DSI driver")
the #address-cells and #size-cells were added as required properties.

When the binding was converted to yaml format in commit
0dac2102cf6b ("dt-bindings: display: rockchip: convert dw_mipi_dsi_rockchip.txt to yaml")
those properties were demoted to optional and removed from the binding
example.

As for the compatibles:
- rockchip,px30-mipi-dsi      removed in this patch set
- rockchip,rk3128-mipi-dsi    never used
- rockchip,rk3288-mipi-dsi    added (invalid); later removed [1]
- rockchip,rk3399-mipi-dsi    removed in this patch set
- rockchip,rk3568-mipi-dsi    never used
- rockchip,rv1126-mipi-dsi    proposed (invalid); never accepted [2]

[1] 282e2e078ba5 ("ARM: dts: rockchip: Remove #address/#size-cells from rk3288 mipi_dsi")
[2] https://lore.kernel.org/all/20230731110012.2913742-12-jagan@edgeble.ai/

The #address-cells and #size-cells are useful (and required) in the
ports node and for panel(s), but those properties are declared in their
schemas already. Now that there are no remaining users, remove these
properties from the Rockchip specific extensions of the Synopsys
DesignWare MIPI DSI host controller.

Signed-off-by: Diederik de Haas <didi.debian@cknow.org>
---
 .../bindings/display/rockchip/rockchip,dw-mipi-dsi.yaml     | 6 ------
 1 file changed, 6 deletions(-)

diff --git a/Documentation/devicetree/bindings/display/rockchip/rockchip,dw-mipi-dsi.yaml b/Documentation/devicetree/bindings/display/rockchip/rockchip,dw-mipi-dsi.yaml
index ccd71c5324af..0881e82deb11 100644
--- a/Documentation/devicetree/bindings/display/rockchip/rockchip,dw-mipi-dsi.yaml
+++ b/Documentation/devicetree/bindings/display/rockchip/rockchip,dw-mipi-dsi.yaml
@@ -58,12 +58,6 @@ properties:
   power-domains:
     maxItems: 1
 
-  "#address-cells":
-    const: 1
-
-  "#size-cells":
-    const: 0
-
 required:
   - compatible
   - clocks
-- 
2.50.0


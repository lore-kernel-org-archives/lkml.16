Received: from cpanel.siel.si (cpanel.siel.si [46.19.9.99])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 78AE44685;
	Thu, 29 May 2025 05:37:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=46.19.9.99
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748497072; cv=none; b=PAy8kJ+SlTnkuatZaHRrd8/948YPEptb0FS1fMmc+F/U0nEP9qAzGvgO1k+Sp5a79BDsDj4sWvDHrmaQv5qR2XKNRqKxIHlvHxtNFzgY0dNTU/dVU9ymb34aZsYKHAZHfo+lIi5cVCMu6u7ueEUM8lOjdy5XdyhmqogfWkYYVgA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748497072; c=relaxed/simple;
	bh=1uzYDMJBhq4NbstLYfEGy0pxu0w0BMfhBjrDQoG7qZ4=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=lRTnSpj/Dbay+9kHMpe+6r+zQ82Lt3sLgja06B+YfADF4sxdkiBf9mWf+arF5BdqqMQl02gnj7Xrkjrq9cglJBx/pnsj4Wfh2Bb/QL5V2HXRKXcm6kPGyC+B3/E6CJn3x9P5Zl4T0X8PfHm+yi0+fU6bPYrsAiDSlXH7DLEr3Jc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=norik.com; spf=pass smtp.mailfrom=norik.com; dkim=pass (2048-bit key) header.d=norik.com header.i=@norik.com header.b=bYefAiqF; arc=none smtp.client-ip=46.19.9.99
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=norik.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=norik.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=norik.com header.i=@norik.com header.b="bYefAiqF"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=norik.com;
	s=default; h=Content-Transfer-Encoding:MIME-Version:Message-Id:Date:Subject:
	Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
	List-Post:List-Owner:List-Archive;
	bh=vI79tRtRRtWjdv39D+S2xsWsuTbKWolYzosvzsaZYyM=; b=bYefAiqFosG6XhHVKrFu3dILRZ
	z/l2z2Q6cpQqWVyRRR8b859o9OHed4pmksRuSJxV9hC75+vQ8aUV5C+nUNGpyjEN0fdsgI2orpYBT
	yiu+p6LizDU/Cr2RkXyyHJtM5pKuN6TNhcu0EBB8uKc83K8yhfbPf17qycVMxD1U4SLdU9fO6SiDK
	lFasL3jlpIPA4cQSEI4V7SSKHPpCPSq8bt0E39Hmq3vgKfiy7eDthO2mU8uQTPlVC8VoJfAsNh/f5
	0snOJxsan+QAMIBoclKm5c5XuG7R3S0TgrePHviDi+aVLhAZzbtu6sqafw1H5kdOealitqt6q0CjG
	ztlgMZeA==;
Received: from [89.212.21.243] (port=57730 helo=and-HP-Z4..)
	by cpanel.siel.si with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96.2)
	(envelope-from <andrej.picej@norik.com>)
	id 1uKVxW-0031Qh-0j;
	Thu, 29 May 2025 07:37:41 +0200
From: Andrej Picej <andrej.picej@norik.com>
To: Andrzej Hajda <andrzej.hajda@intel.com>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Robert Foss <rfoss@kernel.org>,
	Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
	Jonas Karlman <jonas@kwiboo.se>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Marek Vasut <marex@denx.de>
Cc: Andrej Picej <andrej.picej@norik.com>,
	dri-devel@lists.freedesktop.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] dt-bindings: drm/bridge: ti-sn65dsi83: drop $ref to fix lvds-vod* warnings
Date: Thu, 29 May 2025 07:36:53 +0200
Message-Id: <20250529053654.1754926-1-andrej.picej@norik.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-AntiAbuse: This header was added to track abuse, please include it with any abuse report
X-AntiAbuse: Primary Hostname - cpanel.siel.si
X-AntiAbuse: Original Domain - vger.kernel.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - norik.com
X-Get-Message-Sender-Via: cpanel.siel.si: authenticated_id: andrej.picej@norik.com
X-Authenticated-Sender: cpanel.siel.si: andrej.picej@norik.com
X-Source: 
X-Source-Args: 
X-Source-Dir: 

The kernel test robot reported a warning related to the use of "$ref"
type definitions for custom endpoint properties
- "ti,lvds-vod-swing-clock-microvolt" and
- "ti,lvds-vod-swing-data-microvolt".

Using "$ref" with "uint32-array" is not correctly handled in this
context. Removing "$ref" and relying solely on "maxItems: 2" enforces
the intended requirement of specifying exactly two values, without
triggering a schema validation warning.

Reported-by: kernel test robot <lkp@intel.com>
Closes: https://lore.kernel.org/oe-kbuild-all/202505021937.efnQPPqx-lkp@intel.com/
Signed-off-by: Andrej Picej <andrej.picej@norik.com>
---
 .../devicetree/bindings/display/bridge/ti,sn65dsi83.yaml      | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/Documentation/devicetree/bindings/display/bridge/ti,sn65dsi83.yaml b/Documentation/devicetree/bindings/display/bridge/ti,sn65dsi83.yaml
index 9b5f3f3eab19..e69b6343a8eb 100644
--- a/Documentation/devicetree/bindings/display/bridge/ti,sn65dsi83.yaml
+++ b/Documentation/devicetree/bindings/display/bridge/ti,sn65dsi83.yaml
@@ -118,15 +118,11 @@ $defs:
           ti,lvds-vod-swing-clock-microvolt:
             description: LVDS diferential output voltage <min max> for clock
               lanes in microvolts.
-            $ref: /schemas/types.yaml#/definitions/uint32-array
-            minItems: 2
             maxItems: 2
 
           ti,lvds-vod-swing-data-microvolt:
             description: LVDS diferential output voltage <min max> for data
               lanes in microvolts.
-            $ref: /schemas/types.yaml#/definitions/uint32-array
-            minItems: 2
             maxItems: 2
 
 allOf:
-- 
2.34.1


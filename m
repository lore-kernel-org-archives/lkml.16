Received: from fllvem-ot04.ext.ti.com (fllvem-ot04.ext.ti.com [198.47.19.246])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0A5A0151985;
	Wed,  5 Feb 2025 11:51:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.47.19.246
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738756268; cv=none; b=oLtisSoJxvKzZOQIzcMDK0NUcFNgIJmSK95POw1tNJtGtt2zOd9hy+zTaU/ux/FnTklnNHPOhHwgDoTg4GWoIPnqKkZh7miAMU0V3qwovwSaPjhD6oVlGIs3gTg3Q1Qau332txp6c1A4dppkYmTbLsc8KeMtTaSuf6oV2TsV7qc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738756268; c=relaxed/simple;
	bh=0jjde1bLlKaytC/84IATIp4MCHe01xGwkBsd2JsCFK0=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=X1C4B5wq1ZWuAXoNNw5CYlvZEgSN/5XMGLHP3h+7qZ+T8C/mrdf75H1UTXMZetuYK7j2s76xH2N6rkHoOk+Afq2vyAvxbe4GWvme6DNRKP7Da8fwQ1jb92R/FLehVCrK990uU2Sw4l8WpnmXLfIPJ3l5z6BVVmIex7WWPDGktkk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=BYTbs25L; arc=none smtp.client-ip=198.47.19.246
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="BYTbs25L"
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by fllvem-ot04.ext.ti.com (8.15.2/8.15.2) with ESMTPS id 515Boerv2525990
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 5 Feb 2025 05:50:40 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1738756240;
	bh=VCtGI+uCG2hWdsoWCIe4rbkbeS3s2t98T4jUhXD2A+c=;
	h=From:To:Subject:Date:In-Reply-To:References;
	b=BYTbs25La01gzes7U3VWPeKdIFbiB38mEOMZ2tjGXU28ns//v9JAOAIhx9a8Ffp/L
	 utiaMWNrEBZdD5Eo/aAhb5FclsbjrHXD49+OMcFqEPYp3vq0Pc9Nr/T0uJeb/S4c+O
	 k5XAvKGVUXUmFPBPfGxCc2ROuPSUJO1d1D1EUr50=
Received: from DFLE107.ent.ti.com (dfle107.ent.ti.com [10.64.6.28])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 515Boesf101811
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Wed, 5 Feb 2025 05:50:40 -0600
Received: from DFLE101.ent.ti.com (10.64.6.22) by DFLE107.ent.ti.com
 (10.64.6.28) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Wed, 5
 Feb 2025 05:50:40 -0600
Received: from lelvsmtp5.itg.ti.com (10.180.75.250) by DFLE101.ent.ti.com
 (10.64.6.22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Wed, 5 Feb 2025 05:50:40 -0600
Received: from hkshenoy.dhcp.ti.com (hkshenoy.dhcp.ti.com [172.24.227.96])
	by lelvsmtp5.itg.ti.com (8.15.2/8.15.2) with ESMTP id 515BoPCi043245;
	Wed, 5 Feb 2025 05:50:33 -0600
From: Harikrishna Shenoy <h-shenoy@ti.com>
To: <andrzej.hajda@intel.com>, <neil.armstrong@linaro.org>, <rfoss@kernel.org>,
        <Laurent.pinchart@ideasonboard.com>, <jonas@kwiboo.se>,
        <jernej.skrabec@gmail.com>, <simona@ffwll.ch>,
        <maarten.lankhorst@linux.intel.com>, <mripard@kernel.org>,
        <tzimmermann@suse.de>, <robh@kernel.org>, <krzk+dt@kernel.org>,
        <conor+dt@kernel.org>, <jani.nikula@intel.com>, <j-choudhary@ti.com>,
        <sui.jingfeng@linux.dev>, <viro@zeniv.linux.org.uk>,
        <r-ravikumar@ti.com>, <sjakhade@cadence.com>, <yamonkar@cadence.com>,
        <dri-devel@lists.freedesktop.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>
Subject: [PATCH v3 1/2]  dt-bindings: drm/bridge: Add no-hpd property
Date: Wed, 5 Feb 2025 17:20:24 +0530
Message-ID: <20250205115025.3133487-2-h-shenoy@ti.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250205115025.3133487-1-h-shenoy@ti.com>
References: <20250205115025.3133487-1-h-shenoy@ti.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea

From: Rahul T R <r-ravikumar@ti.com>

The mhdp bridge can work without its HPD pin hooked up to the connector,
but the current bridge driver throws an error when hpd line is not
connected to the connector. For such cases, we need an indication for
no-hpd, using which we can bypass the hpd detection and instead use the
auxiliary channels connected to the DP connector to confirm the
connection.
So add no-hpd property to the bindings, to disable hpd when not
connected or unusable due to DP0-HPD not connected to correct HPD 
pin on SOC like in case of J721S2.

Signed-off-by: Rahul T R <r-ravikumar@ti.com>
Signed-off-by: Jayesh Choudhary <j-choudhary@ti.com>
---
 .../devicetree/bindings/display/bridge/cdns,mhdp8546.yaml   | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/Documentation/devicetree/bindings/display/bridge/cdns,mhdp8546.yaml b/Documentation/devicetree/bindings/display/bridge/cdns,mhdp8546.yaml
index c2b369456e4e..3a6c6d837593 100644
--- a/Documentation/devicetree/bindings/display/bridge/cdns,mhdp8546.yaml
+++ b/Documentation/devicetree/bindings/display/bridge/cdns,mhdp8546.yaml
@@ -57,6 +57,12 @@ properties:
   interrupts:
     maxItems: 1
 
+  cdns,no-hpd:
+    type: boolean
+    description:
+      Set if the HPD line on the bridge isn't hooked up to anything or is
+      otherwise unusable.
+
   ports:
     $ref: /schemas/graph.yaml#/properties/ports
 
-- 
2.34.1


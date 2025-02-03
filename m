Received: from lelvem-ot01.ext.ti.com (lelvem-ot01.ext.ti.com [198.47.23.234])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E808B209F4B;
	Mon,  3 Feb 2025 15:55:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.47.23.234
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738598111; cv=none; b=h0q/mHN+U30AmQdkELzvYaXUx305uQ2e/SUK4QVQgc4808f8OmYISsx8nZjoZ7ByruhwBc6nNUTsBVZGjtxnr7+pF8wxs7hPmmpkfPo5RMHS+0GZqMBN298vp1P+Nqv2xoEz16sfl0Euha2RrV8GecWsJMOKzQm7YFzB5a8duvM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738598111; c=relaxed/simple;
	bh=n/hH6PNPxfHVD55kb5BG84TXlfe37h/EzyVzGmekBwU=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=PUq/0Lb7nFB1rvJzP+2aDDA3Qki1mEBCM+4WuYBMstZr6bqNsUeYhLDgzpQ35u+7CTNfncU30zYzGSRMUA02/e0XXSpN+SH4/c1KCFWPLQo9OS4FCh0zy+Z/qo5w90vHD6z92mGz1qCT0u5lWNIYKAfoti14ndbK81uiJ0Juk0M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=tB1euvvQ; arc=none smtp.client-ip=198.47.23.234
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="tB1euvvQ"
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by lelvem-ot01.ext.ti.com (8.15.2/8.15.2) with ESMTPS id 513FsXHW3043567
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=NO);
	Mon, 3 Feb 2025 09:54:33 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1738598073;
	bh=Dq1PoOo0p++A7ZJP/LcK53A+0MmTH8P0JsBail5lC0k=;
	h=From:To:CC:Subject:Date;
	b=tB1euvvQUNk1ywi7/+AgFc7bgBNKgyoinFrhYgTw/tnQsdTKZa1gBdUJNP3T7HGBe
	 JNKKyJDioZkRjmPngr03vlqznABnWp6+FXpvTCnQcJVNtsiq7Tr6ii0QHn3RZVmT5L
	 8pzSRWpwQnEfNkFVJbtwxlt5AC58UNCuudjppTbg=
Received: from DFLE103.ent.ti.com (dfle103.ent.ti.com [10.64.6.24])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTP id 513FsXLC080734;
	Mon, 3 Feb 2025 09:54:33 -0600
Received: from DFLE107.ent.ti.com (10.64.6.28) by DFLE103.ent.ti.com
 (10.64.6.24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Mon, 3
 Feb 2025 09:54:32 -0600
Received: from lelvsmtp6.itg.ti.com (10.180.75.249) by DFLE107.ent.ti.com
 (10.64.6.28) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Mon, 3 Feb 2025 09:54:32 -0600
Received: from localhost (ti.dhcp.ti.com [172.24.227.95] (may be forged))
	by lelvsmtp6.itg.ti.com (8.15.2/8.15.2) with ESMTP id 513FsVe0035874;
	Mon, 3 Feb 2025 09:54:32 -0600
From: Devarsh Thakkar <devarsht@ti.com>
To: <jyri.sarha@iki.fi>, <tomi.valkeinen@ideasonboard.com>,
        <airlied@gmail.com>, <maarten.lankhorst@linux.intel.com>,
        <mripard@kernel.org>, <tzimmermann@suse.de>,
        <dri-devel@lists.freedesktop.org>, <simona@ffwll.ch>,
        <linux-kernel@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <robh@kernel.org>, <krzk+dt@kernel.org>, <conor+dt@kernel.org>
CC: <praneeth@ti.com>, <vigneshr@ti.com>, <aradhya.bhatia@linux.dev>,
        <s-jain1@ti.com>, <r-donadkar@ti.com>, <j-choudhary@ti.com>,
        <h-shenoy@ti.com>, <devarsht@ti.com>, <krzysztof.kozlowski@linaro.org>
Subject: [PATCH v2] dt-bindings: display: ti: Fix compatible for am62a7 dss
Date: Mon, 3 Feb 2025 21:24:31 +0530
Message-ID: <20250203155431.2174170-1-devarsht@ti.com>
X-Mailer: git-send-email 2.39.1
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea

Fix incorrect format of compatible string (comma instead of hyphen) for
TI's AM62A7 SoC.

s/ti,am62a7,dss/ti,am62a7-dss

Fixes: 7959ceb767e4 ("dt-bindings: display: ti: Add support for am62a7 dss")
Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Signed-off-by: Devarsh Thakkar <devarsht@ti.com>
---
V2: Add Reviewed-by and update commit msg
---
 Documentation/devicetree/bindings/display/ti/ti,am65x-dss.yaml | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/display/ti/ti,am65x-dss.yaml b/Documentation/devicetree/bindings/display/ti/ti,am65x-dss.yaml
index 55e3e490d0e6..31c4ffcb599c 100644
--- a/Documentation/devicetree/bindings/display/ti/ti,am65x-dss.yaml
+++ b/Documentation/devicetree/bindings/display/ti/ti,am65x-dss.yaml
@@ -23,7 +23,7 @@ properties:
   compatible:
     enum:
       - ti,am625-dss
-      - ti,am62a7,dss
+      - ti,am62a7-dss
       - ti,am65x-dss
 
   reg:
-- 
2.39.1


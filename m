Received: from mail-m49202.qiye.163.com (mail-m49202.qiye.163.com [45.254.49.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F61D171C9;
	Wed, 28 May 2025 10:10:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.254.49.202
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748427022; cv=none; b=cFCe13p0BwFWdPGLEfghV4P/Te6aBD+JPgXokaKVgzVZ4LaE046VW7s1j3UI99XafO6gzrSxW0pDzf2EbTz/FDRTORmMTeDWBwUwyHLiw7Bx7xKmzjmxd5filrN4/EyrFMFRtsVMjdLDB2O4UxOFJ8yveRoFABgP9J+8NrzmO/c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748427022; c=relaxed/simple;
	bh=xyeaaxOwVkanLxqVEwdOLAOwLbiiNhbr/ezVG4Vm0IA=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=UbnEYB4UwyUZ37qfM/3spaFlqrLThCb4mJrpWzphZZncubG0e2igADOhM9E6DOqQToF7aOkvxGg3wVHpYnKmcN7jm8XIDnwbgfw79Iqc4agdwN9j/Baf1gwbFZLWrbVSOBHL6BxDaI2p8txNl0b4H8KUfWCQfg79D6GDuHvgZXs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=thundersoft.com; spf=pass smtp.mailfrom=thundersoft.com; dkim=pass (1024-bit key) header.d=thundersoft.com header.i=@thundersoft.com header.b=Vc6HxHKx; arc=none smtp.client-ip=45.254.49.202
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=thundersoft.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=thundersoft.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=thundersoft.com header.i=@thundersoft.com header.b="Vc6HxHKx"
Received: from localhost.localdomain (unknown [117.184.129.134])
	by smtp.qiye.163.com (Hmail) with ESMTP id 16b15a5e2;
	Wed, 28 May 2025 16:54:43 +0800 (GMT+08:00)
From: Albert Yang <yangzh0906@thundersoft.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Heiko Stuebner <heiko@sntech.de>,
	=?UTF-8?q?Rafa=C5=82=20Mi=C5=82ecki?= <rafal@milecki.pl>,
	Junhao Xie <bigfoot@classfun.cn>,
	Kever Yang <kever.yang@rock-chips.com>,
	Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
	Albert Yang <yangzh0906@thundersoft.com>,
	Ge Gordon <gordon.ge@bst.ai>
Subject: [PATCH v1 1/9] dt-bindings: vendor-prefixes: Add Black Sesame Technologies Co., Ltd.
Date: Wed, 28 May 2025 16:54:10 +0800
Message-Id: <20250528085410.481107-1-yangzh0906@thundersoft.com>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFITzdXWS1ZQUlXWQ8JGhUIEh9ZQVkZGktMVk9LSUNOSEpDT0NLTVYVFAkWGhdVEwETFh
	oSFyQUDg9ZV1kYEgtZQVlKSkxVSkNPVUpJQlVKSE9ZV1kWGg8SFR0UWUFZT0tIVUpLSEpOTE5VSk
	tLVUpCS0tZBg++
X-HM-Tid: 0a971619deb409cckunm252380b4397c94
X-HM-MType: 1
X-HM-Sender-Digest: e1kMHhlZQR0aFwgeV1kSHx4VD1lBWUc6NFE6FTo5QzEyNkg8Pgg*OTMU
	AhgKCxdVSlVKTE9DT0lJT0NPTE5OVTMWGhIXVQIaFRwBE0tCS007DxMOFR8eCQgUHQ9VGBQWRVlX
	WRILWUFZSkpMVUpDT1VKSUJVSkhPWVdZCAFZQUpDQ043Bg++
DKIM-Signature:a=rsa-sha256;
	b=Vc6HxHKxdaJINJLWkxuh5AkJlDgLVvoRfVwosMfILMktKGNtZcea+dJc90EK5Thfy3k7B847x847UQaTptzr6JiBlXoyy1A9xCUEdSG8WUDJrK33sqozGjIUcl7x0s7NSWO1SAsYvPJQHyDmHsiwTCeJ1NRXTmla7GDy4VzFeCM=; c=relaxed/relaxed; s=default; d=thundersoft.com; v=1;
	bh=AKVDUkNC8XfUMycKiaIoEYEHYmiKh+/8RJhrPb/PC+A=;
	h=date:mime-version:subject:message-id:from;

Black Sesame Technologies Co., Ltd.s a leading automotive-grade
computing SoC and SoC-based
intelligent vehicle solution provider. Link: https://bst.ai/.

Signed-off-by: Ge Gordon <gordon.ge@bst.ai>
Signed-off-by: Albert Yang <yangzh0906@thundersoft.com>
---
 Documentation/devicetree/bindings/vendor-prefixes.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/vendor-prefixes.yaml b/Documentation/devicetree/bindings/vendor-prefixes.yaml
index 86f6a19b28ae..963d4ef2ab4d 100644
--- a/Documentation/devicetree/bindings/vendor-prefixes.yaml
+++ b/Documentation/devicetree/bindings/vendor-prefixes.yaml
@@ -220,6 +220,8 @@ patternProperties:
     description: Shenzhen BigTree Tech Co., LTD
   "^bitmain,.*":
     description: Bitmain Technologies
+  "^bst,.*":
+    description: Black Sesame Technologies Co., Ltd.
   "^blaize,.*":
     description: Blaize, Inc.
   "^blutek,.*":
-- 
2.25.1


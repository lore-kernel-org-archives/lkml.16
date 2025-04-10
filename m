Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 31F3C1FF5F7;
	Thu, 10 Apr 2025 07:25:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744269907; cv=none; b=QFae57ZXY+WM9V+zp+JtZroidUpKvC0HHSGABrgfHZ+WZTBHEvnIFKAqSKSZsN33sbjV8D05yRBLLwF3/zQKbWO4rbliDIlZCRk1Xu9gwH6McbBdRrl6WZwvZ8vSVkLq9Dj/WYX1PQPZiB9FscG21STQZEacrJcREkL+yQC88Rg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744269907; c=relaxed/simple;
	bh=vGkb5nO1PDToIeR+WLDN2aOQotJvSqzZArormdinE48=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=fFZ8Ch++gtYQlKjEmuoZaKNT0qYe57zsz0MwN3H8T8Jdc70tKf/3ezZkmVUSrbzK72vf6H+SAF5MQ8hnqYRz1e7QM1I6xZqlmuwe1GnhC0azCK12S/MJBKzl7/jzBKkWI/05L9AFITnjf7UVErUqJ+JS6RLXY9hu7v0et9eDe+g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=apBhGA7u; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="apBhGA7u"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1744269903;
	bh=vGkb5nO1PDToIeR+WLDN2aOQotJvSqzZArormdinE48=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=apBhGA7u5mdXAbP83BlNGgWbydwa+cah1rgN6KMy5EFS4vDPn24bejcE93/DCfwS2
	 fYEksajf1W1/I+x2r440oBeiJjsNT7BfYyiRSDIYjTKXf5FLdjeh0RUWCq8iSsMVfU
	 TV0w4YgxDM/lmEejEoYpE6w5SX9AlkfqnOCR6hFZVf/IMmVpV5bwH59uPnMVC0oZCb
	 8ZkNi+KSr+kcD36BHGaL4Fg+5CtnVxmqwhwXnbUym/3irQ9h5BfIbysPDn7Z5KOj5A
	 mFku50Ikm+w6GKhe4K93JosYfu9h+0tKA6PKzqNOTnDlg5yLqhnMz4QNBsoNzUKtUY
	 FCl8jAj4UoKTg==
Received: from IcarusMOD.eternityproject.eu (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 5159C17E0EB8;
	Thu, 10 Apr 2025 09:25:02 +0200 (CEST)
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
To: neil.armstrong@linaro.org
Cc: quic_jesszhan@quicinc.com,
	airlied@gmail.com,
	simona@ffwll.ch,
	maarten.lankhorst@linux.intel.com,
	mripard@kernel.org,
	tzimmermann@suse.de,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	angelogioacchino.delregno@collabora.com,
	dri-devel@lists.freedesktop.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	kernel@collabora.com,
	pablo.sun@mediatek.com,
	christophe.jaillet@wanadoo.fr
Subject: [PATCH v3 1/3] dt-bindings: vendor-prefixes: Add Shenzhen Aoly Technology Co., Ltd.
Date: Thu, 10 Apr 2025 09:24:54 +0200
Message-ID: <20250410072456.387562-2-angelogioacchino.delregno@collabora.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250410072456.387562-1-angelogioacchino.delregno@collabora.com>
References: <20250410072456.387562-1-angelogioacchino.delregno@collabora.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Aoly is a manufacturer of LCD/IPS displays based in Shenzhen,
Mainland China.

Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
---
 Documentation/devicetree/bindings/vendor-prefixes.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/vendor-prefixes.yaml b/Documentation/devicetree/bindings/vendor-prefixes.yaml
index 86f6a19b28ae..6136c8832a66 100644
--- a/Documentation/devicetree/bindings/vendor-prefixes.yaml
+++ b/Documentation/devicetree/bindings/vendor-prefixes.yaml
@@ -129,6 +129,8 @@ patternProperties:
     description: Andes Technology Corporation
   "^anvo,.*":
     description: Anvo-Systems Dresden GmbH
+  "^aoly,.*":
+    description: Shenzhen Aoly Technology Co., Ltd.
   "^aosong,.*":
     description: Guangzhou Aosong Electronic Co., Ltd.
   "^apm,.*":
-- 
2.49.0


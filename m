Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net [217.70.183.196])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 79C0E278E4C;
	Fri, 11 Apr 2025 19:20:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.183.196
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744399203; cv=none; b=LixzOEeAGIvYUp64eq0IDPRwydo+2TJWh6zCCoeWuhgEAApuIWo/VKqt77agewPJh3GCiXNqJtKkIUyVtyQSFCe7u9wyCijhu8PusW1Obb83m7xgqKhMh3Ny0y4LeSWqhSBUtfPNvYId2EuHTjrbkizXIbpxDnc2OEAN9i08ucA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744399203; c=relaxed/simple;
	bh=dUl/+bEyGiU/qu+Y6Ab+9ROyCiGZlNL3IUYutIlCKMk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=DfPAiL1gBvOzzhgiJC9DrIuj3L4txuWGVwy86+cNGOUOllYfgG+Ynt8HQT8jcmyy846g8QaXraZkN9PrKE9+Elp/qBc47iTArdceNXzkjSA2yNphe3gk6G1PbdLFkyR72XtPM4FKtvc4X0WR+gDy2rWJxXZ9DQZ9/Yoglmz1o8o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=mb5+ze9P; arc=none smtp.client-ip=217.70.183.196
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="mb5+ze9P"
Received: by mail.gandi.net (Postfix) with ESMTPSA id A49DC43AFF;
	Fri, 11 Apr 2025 19:19:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1744399194;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=lLTa7CZ+7PS3VX0urrg7v+OaNonYLpOictArwCt4TjQ=;
	b=mb5+ze9Pw41sgydb+zwFf0P7BFOf8eQn8leWOivDyN26hz6aIjbXmbBuW0dIIbcxmNOG/7
	DM6IndQmTBWDfqEQIf9EygYwcZI8NEhT/08b/a+/gNhD2+Vgm8yQQD6uIsjn2shqVjbKhc
	ViQxzxt/wUHM1OcF6fvPTJ3HIRIkFm+q34zwfamsDGIUeJIIcRh+E9/dZFhthRnQBhd1k0
	h6LCovnhsL8bgLAkAQUKgCAqMA8kCSYlWBZC+7t14VcFwksoN/3C+g3VZ4pImAKFriayVT
	QmJhWbp/PJiDfyXzWjiMDJxZS2ul0LTYb+uD+6tcQqCtm9+UVYLQ4cIL3YxTEQ==
From: Luca Ceresoli <luca.ceresoli@bootlin.com>
Date: Fri, 11 Apr 2025 21:19:44 +0200
Subject: [PATCH v3 1/3] dt-bindings: display: simple: Add Tianma
 P0700WXF1MBAA panel
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250411-tianma-p0700wxf1mbaa-v3-1-acbefe9ea669@bootlin.com>
References: <20250411-tianma-p0700wxf1mbaa-v3-0-acbefe9ea669@bootlin.com>
In-Reply-To: <20250411-tianma-p0700wxf1mbaa-v3-0-acbefe9ea669@bootlin.com>
To: Neil Armstrong <neil.armstrong@linaro.org>, 
 Jessica Zhang <quic_jesszhan@quicinc.com>, David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Thierry Reding <thierry.reding@gmail.com>, Sam Ravnborg <sam@ravnborg.org>
Cc: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>, 
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 "Pu, Hui" <Hui.Pu@gehealthcare.com>, dri-devel@lists.freedesktop.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Luca Ceresoli <luca.ceresoli@bootlin.com>, 
 Conor Dooley <conor.dooley@microchip.com>
X-Mailer: b4 0.14.2
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgddvuddvieefucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefhfffugggtgffkfhgjvfevofesthejredtredtjeenucfhrhhomhepnfhutggrucevvghrvghsohhlihcuoehluhgtrgdrtggvrhgvshholhhisegsohhothhlihhnrdgtohhmqeenucggtffrrghtthgvrhhnpeeiieeuvdfftefgueduleehueetgffgjeeitedtteetkeeuueeuueekveevvdeuveenucfkphepvdgrtddvmeeijedtmedvtddvtdemvggrtddumegsvgegudemleehvgejmeefgeefmeeludefvgenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpedvrgdtvdemieejtdemvddtvddtmegvrgdtudemsggvgedumeelhegvjeemfeegfeemledufegvpdhhvghloheplgduledvrdduieekrddujeekrdejhegnpdhmrghilhhfrhhomheplhhutggrrdgtvghrvghsohhlihessghoohhtlhhinhdrtghomhdpnhgspghrtghpthhtohepvddtpdhrtghpthhtoheprhhosghhsehkvghrnhgvlhdrohhrghdprhgtphhtthhopefjuhhirdfruhesghgvhhgvrghlthhhtggrrhgvrdgtohhmpdhrtghpthhtoheprghirhhlihgvugesghhmrghilhdrtghomhdprhgtphhtthhopegtohhnohhrrdguo
 hholhgvhiesmhhitghrohgthhhiphdrtghomhdprhgtphhtthhopehtiihimhhmvghrmhgrnhhnsehsuhhsvgdruggvpdhrtghpthhtohepnhgvihhlrdgrrhhmshhtrhhonhhgsehlihhnrghrohdrohhrghdprhgtphhtthhopehsrghmsehrrghvnhgsohhrghdrohhrghdprhgtphhtthhopehthhhomhgrshdrphgvthgriiiiohhnihessghoohhtlhhinhdrtghomh
X-GND-Sasl: luca.ceresoli@bootlin.com

Add the Tianma Micro-electronics P0700WXF1MBAA 7.0" LVDS LCD TFT panel.

Acked-by: Conor Dooley <conor.dooley@microchip.com>
Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
---
 Documentation/devicetree/bindings/display/panel/panel-simple.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/display/panel/panel-simple.yaml b/Documentation/devicetree/bindings/display/panel/panel-simple.yaml
index b5c8eb4fa2d166d0c3c33cdc8bae35853dba2223..1b593e092e3196da4a1ca11fe08f5c2e0e87854f 100644
--- a/Documentation/devicetree/bindings/display/panel/panel-simple.yaml
+++ b/Documentation/devicetree/bindings/display/panel/panel-simple.yaml
@@ -286,6 +286,8 @@ properties:
       - startek,kd070wvfpa
         # Team Source Display Technology TST043015CMHX 4.3" WQVGA TFT LCD panel
       - team-source-display,tst043015cmhx
+        # Tianma Micro-electronics P0700WXF1MBAA 7.0" WXGA (1280x800) LVDS TFT LCD panel
+      - tianma,p0700wxf1mbaa
         # Tianma Micro-electronics TM070JDHG30 7.0" WXGA TFT LCD panel
       - tianma,tm070jdhg30
         # Tianma Micro-electronics TM070JDHG34-00 7.0" WXGA (1280x800) LVDS TFT LCD panel

-- 
2.49.0


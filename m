Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net [217.70.183.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5820D20C493;
	Mon,  7 Apr 2025 16:34:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.183.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744043653; cv=none; b=ZRkpCgNBR0nNieG/KBYfL1eoWCPHprIx4fQY1RBSBpI6tkZ3ylL9rH+dwWagSxeaOAlWvapm7Ry7PuG+rSMiXKLuRXl/6IH9CvmNu+L24iLEhQMQRNq0BmIgUVZi4C6mkCPQJLkAIYvNRfrxxYvwyHcxR9CguTG08+n1awl5Q58=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744043653; c=relaxed/simple;
	bh=oivFHZVchL7odhRtsJKFsVphB5Uewyo34gYrMYxr+H0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=kB7HDnD8hmVSEfHJascU2lYhYj+vu+PaHK10E1tIeE+Cdrigu3LvKL7FKIV4JqcAGd+gWEm2YzSL8l++8eS/26Mpl7PQ0Nl3rvUopzmC/1RIhIFWrWkGioJcvy5VcdSoelAjQlvVziCpSdsdxr3LqTN1TFoI1qFSpujmmuyNDuM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=Bhrw953F; arc=none smtp.client-ip=217.70.183.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="Bhrw953F"
Received: by mail.gandi.net (Postfix) with ESMTPSA id 5F4A620452;
	Mon,  7 Apr 2025 16:34:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1744043649;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=0Vu+VYaG7J72e2wnMEktbEWju1bIb0fe9q+yEm36Jk0=;
	b=Bhrw953FvLxlvrMSs37ewyfTwAgA5rB56bwbsAqUhjoZ1LsKgliagmE1X1+eeUx8Zp+N1e
	23IS91MqF931BMYTzP+j3bEZC848qFneghM6XyK9HzkvAPKE1/eRnlqjLgdyL9e5u13Z+8
	RtkoiytE29Q8Ku3qED7DCDqE94Q/Pl9ZvchnIQVu9keMgu76mcKkNvy3azKUcENwxB8l6F
	hIMfZy/dhrGbHh1a/mxL2px9YlJmLeEbQaBV6K1o1aKWQfXkhhJ6O4JQHv7ZiUSPIICWCo
	9WmFL3Wd0VHVyE7G3chwdpfMcEVIuj7Yg+0HG1b40AXpwKDaml6oRzLO0+AemQ==
From: Luca Ceresoli <luca.ceresoli@bootlin.com>
Date: Mon, 07 Apr 2025 18:34:00 +0200
Subject: [PATCH v2 2/3] drm/panel: simple: Tianma TM070JDHG34-00: add
 delays
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250407-tianma-p0700wxf1mbaa-v2-2-ede8c5a3f538@bootlin.com>
References: <20250407-tianma-p0700wxf1mbaa-v2-0-ede8c5a3f538@bootlin.com>
In-Reply-To: <20250407-tianma-p0700wxf1mbaa-v2-0-ede8c5a3f538@bootlin.com>
To: Neil Armstrong <neil.armstrong@linaro.org>, 
 Jessica Zhang <quic_jesszhan@quicinc.com>, David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Thierry Reding <thierry.reding@gmail.com>, Sam Ravnborg <sam@ravnborg.org>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 "Pu, Hui" <Hui.Pu@gehealthcare.com>, dri-devel@lists.freedesktop.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Luca Ceresoli <luca.ceresoli@bootlin.com>
X-Mailer: b4 0.14.2
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgddvtddtieekucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefhfffugggtgffkfhgjvfevofesthejredtredtjeenucfhrhhomhepnfhutggrucevvghrvghsohhlihcuoehluhgtrgdrtggvrhgvshholhhisegsohhothhlihhnrdgtohhmqeenucggtffrrghtthgvrhhnpeeiieeuvdfftefgueduleehueetgffgjeeitedtteetkeeuueeuueekveevvdeuveenucfkphepvdgrtddvmeeijedtmedvtddvtdemvggrtddumegsvgegudemleehvgejmeefgeefmeeludefvgenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpedvrgdtvdemieejtdemvddtvddtmegvrgdtudemsggvgedumeelhegvjeemfeegfeemledufegvpdhhvghloheplgduledvrdduieekrddujeekrdejhegnpdhmrghilhhfrhhomheplhhutggrrdgtvghrvghsohhlihessghoohhtlhhinhdrtghomhdpnhgspghrtghpthhtohepudekpdhrtghpthhtohepthiiihhmmhgvrhhmrghnnhesshhushgvrdguvgdprhgtphhtthhopegurhhiqdguvghvvghlsehlihhsthhsrdhfrhgvvgguvghskhhtohhprdhorhhgpdhrtghpthhtohepthhhihgvrhhrhidrrhgvughinhhgsehgmhgrihhlr
 dgtohhmpdhrtghpthhtohepuggvvhhitggvthhrvggvsehvghgvrhdrkhgvrhhnvghlrdhorhhgpdhrtghpthhtoheptghonhhorhdoughtsehkvghrnhgvlhdrohhrghdprhgtphhtthhopegrihhrlhhivggusehgmhgrihhlrdgtohhmpdhrtghpthhtohepshgrmhesrhgrvhhnsghorhhgrdhorhhgpdhrtghpthhtoheprhhosghhsehkvghrnhgvlhdrohhrgh
X-GND-Sasl: luca.ceresoli@bootlin.com

Add power on/off delays for the Tianma TM070JDHG34-00.

Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
---
 drivers/gpu/drm/panel/panel-simple.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/drivers/gpu/drm/panel/panel-simple.c b/drivers/gpu/drm/panel/panel-simple.c
index df718c4a86cb7dc0cd126e807d33306e5a21d8a0..3496ed3e62056938ccc0ed2389ea46eed8d17ea2 100644
--- a/drivers/gpu/drm/panel/panel-simple.c
+++ b/drivers/gpu/drm/panel/panel-simple.c
@@ -4452,6 +4452,12 @@ static const struct panel_desc tianma_tm070jdhg34_00 = {
 		.width = 150, /* 149.76 */
 		.height = 94, /* 93.60 */
 	},
+	.delay = {
+		.prepare = 18,		/* Tr + Tp1 */
+		.enable = 150,		/* Tp2 */
+		.disable = 150,		/* Tp4 */
+		.unprepare = 120,	/* Tp3 */
+	},
 	.bus_format = MEDIA_BUS_FMT_RGB888_1X7X4_SPWG,
 	.connector_type = DRM_MODE_CONNECTOR_LVDS,
 };

-- 
2.49.0


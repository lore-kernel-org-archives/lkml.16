Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net [217.70.183.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 68B7022B5A3;
	Tue,  8 Apr 2025 15:27:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.183.199
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744126030; cv=none; b=N2xmuXAWxn5NsSqtIv2zrSxY/pXCMe631uz3Nyq36koO61zYI5C1NNrh5+yJFO+6kSBL6693WEJoW82KEa2V80pt2D5ZyX+3fGh6Xs1V0uaaCgNOV4tWJzYXrkwuvdzRzGlwDxtNL6ZQ6QjFHhrG8UTS8m/kCs04Q7s5UoLYYK8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744126030; c=relaxed/simple;
	bh=QZBserNQj9zqBiV22KogCOSkz/1te+S/BxENa8W397I=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=SyetpEQ+f7JwOoRsgalV44K+niQwvKyHXg55Se0k5yMDna8MmTF90E/m+xYJ0QyaOBAaHS9FT6FfRJTnsoSGWQm8sEJKZYRVE/9/BwG9xsXyH7csRbYYa2/vM6noXP2/P+M7hQwqqGRILKvMoTigt8M8Ceg/fGE2uSN2fkG/cjE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=gpPYVBdA; arc=none smtp.client-ip=217.70.183.199
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="gpPYVBdA"
Received: by mail.gandi.net (Postfix) with ESMTPSA id 0DF7D443CC;
	Tue,  8 Apr 2025 15:27:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1744126026;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=F/5v60gJJHkMrEag5xzAucStc/MoeQ+6IzPW3ZUFp7k=;
	b=gpPYVBdAgZo42CAaw6AxTofq9dqOGOtS9TxJrX/PeM1znlmX6P92+vO4L3A58TlGZj0zkw
	6oIuRpBjDvA4GGp5gW/awXT2+X+iH6a8x15JvU7Va1ZhLGz/46K45zg2MHIY/REJnTf0yV
	V/RiJAsLZdh7VY+Z8LiFAsAVOK+YJ0Jga/VDNyg4bROhL/f7UEOVHyXB+4Vzp2amKK/OEl
	WNW+eN9He4P53uf1iYlzGiitKtWXM8M3yDnBPzHimbtKzTXa4smWF5/b9vWlPToTzEPnJa
	GkIgO3GSkUjQUdILTOuiNy59PDlv4jxQDNb1LTKBg3pQdQlP0b3jnLMMQ1O+0w==
From: Kory Maincent <kory.maincent@bootlin.com>
Date: Tue, 08 Apr 2025 17:27:03 +0200
Subject: [PATCH 4/4] drm: panel: Add Saef SFTO340XC LCD panel
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250408-feature_sfto340xc-v1-4-f303d1b9a996@bootlin.com>
References: <20250408-feature_sfto340xc-v1-0-f303d1b9a996@bootlin.com>
In-Reply-To: <20250408-feature_sfto340xc-v1-0-f303d1b9a996@bootlin.com>
To: Neil Armstrong <neil.armstrong@linaro.org>, 
 Jessica Zhang <quic_jesszhan@quicinc.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 devicetree@vger.kernel.org, Kory Maincent <kory.maincent@bootlin.com>
X-Mailer: b4 0.14.2
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgddvtdefgeehucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefhfffugggtgffkfhgjvfevofesthejredtredtjeenucfhrhhomhepmfhorhihucforghinhgtvghnthcuoehkohhrhidrmhgrihhntggvnhhtsegsohhothhlihhnrdgtohhmqeenucggtffrrghtthgvrhhnpeevgfdvgfektefgfefggeekudfggffhtdfffedtueetheejtddvledvvdelhedtveenucfkphepledtrdekledrudeifedruddvjeenucevlhhushhtvghrufhiiigvpedunecurfgrrhgrmhepihhnvghtpeeltddrkeelrdduieefrdduvdejpdhhvghloheplgduvdejrddtrddurddungdpmhgrihhlfhhrohhmpehkohhrhidrmhgrihhntggvnhhtsegsohhothhlihhnrdgtohhmpdhnsggprhgtphhtthhopeduhedprhgtphhtthhopegurhhiqdguvghvvghlsehlihhsthhsrdhfrhgvvgguvghskhhtohhprdhorhhgpdhrtghpthhtoheptghonhhorhdoughtsehkvghrnhgvlhdrohhrghdprhgtphhtthhopehkrhiikhdoughtsehkvghrnhgvlhdrohhrghdprhgtphhtthhopehmrhhiphgrrhgusehkvghrnhgvlhdrohhrghdprhgtphhtthhopeguvghvihgtvghtrhgvvgesvhhgvghrrdhkvghrnhgvl
 hdrohhrghdprhgtphhtthhopegrihhrlhhivggusehgmhgrihhlrdgtohhmpdhrtghpthhtohepqhhuihgtpghjvghsshiihhgrnhesqhhuihgtihhntgdrtghomhdprhgtphhtthhopehthhhomhgrshdrphgvthgriiiiohhnihessghoohhtlhhinhdrtghomh
X-GND-Sasl: kory.maincent@bootlin.com

Add support for Saef Technology Limited SFTO340XC LCD panel.

Signed-off-by: Kory Maincent <kory.maincent@bootlin.com>
---
 drivers/gpu/drm/panel/panel-ilitek-ili9881c.c | 232 ++++++++++++++++++++++++++
 1 file changed, 232 insertions(+)

diff --git a/drivers/gpu/drm/panel/panel-ilitek-ili9881c.c b/drivers/gpu/drm/panel/panel-ilitek-ili9881c.c
index 5c429715159755df2461063dad0971642e2b9041..8ea837ff3f7ad1f4b8ba5f2e9f50472a16afcbae 100644
--- a/drivers/gpu/drm/panel/panel-ilitek-ili9881c.c
+++ b/drivers/gpu/drm/panel/panel-ilitek-ili9881c.c
@@ -43,6 +43,7 @@ struct ili9881c_desc {
 	const struct drm_display_mode *mode;
 	const unsigned long mode_flags;
 	u8 default_address_mode;
+	const unsigned int msleep_delay;
 };
 
 struct ili9881c {
@@ -457,6 +458,207 @@ static const struct ili9881c_instr k101_im2byl02_init[] = {
 	ILI9881C_COMMAND_INSTR(0xD3, 0x3F), /* VN0 */
 };
 
+static const struct ili9881c_instr sfto340xc_init[] = {
+	ILI9881C_SWITCH_PAGE_INSTR(3),
+	ILI9881C_COMMAND_INSTR(0x01, 0x00),
+	ILI9881C_COMMAND_INSTR(0x02, 0x01),
+	ILI9881C_COMMAND_INSTR(0x03, 0x73),
+	ILI9881C_COMMAND_INSTR(0x04, 0x03),
+	ILI9881C_COMMAND_INSTR(0x05, 0x00),
+	ILI9881C_COMMAND_INSTR(0x06, 0x0A),
+	ILI9881C_COMMAND_INSTR(0x07, 0x05),
+	ILI9881C_COMMAND_INSTR(0x08, 0x00),
+	ILI9881C_COMMAND_INSTR(0x09, 0x40),
+	ILI9881C_COMMAND_INSTR(0x0a, 0x00),
+	ILI9881C_COMMAND_INSTR(0x0B, 0x00),
+	ILI9881C_COMMAND_INSTR(0x0C, 0x00),
+	ILI9881C_COMMAND_INSTR(0x0D, 0x40),
+	ILI9881C_COMMAND_INSTR(0x0E, 0x00),
+	ILI9881C_COMMAND_INSTR(0x0f, 0x3c),
+	ILI9881C_COMMAND_INSTR(0x10, 0x3c),
+	ILI9881C_COMMAND_INSTR(0x11, 0x00),
+	ILI9881C_COMMAND_INSTR(0x12, 0x00),
+	ILI9881C_COMMAND_INSTR(0x13, 0x00),
+	ILI9881C_COMMAND_INSTR(0x14, 0x00),
+	ILI9881C_COMMAND_INSTR(0x15, 0x00),
+	ILI9881C_COMMAND_INSTR(0x16, 0x00),
+	ILI9881C_COMMAND_INSTR(0x17, 0x00),
+	ILI9881C_COMMAND_INSTR(0x18, 0x00),
+	ILI9881C_COMMAND_INSTR(0x19, 0x00),
+	ILI9881C_COMMAND_INSTR(0x1A, 0x00),
+	ILI9881C_COMMAND_INSTR(0x1B, 0x00),
+	ILI9881C_COMMAND_INSTR(0x1C, 0x00),
+	ILI9881C_COMMAND_INSTR(0x1D, 0x00),
+	ILI9881C_COMMAND_INSTR(0x1E, 0xC0),
+	ILI9881C_COMMAND_INSTR(0x1F, 0x80),
+	ILI9881C_COMMAND_INSTR(0x20, 0x06),
+	ILI9881C_COMMAND_INSTR(0x21, 0x01),
+	ILI9881C_COMMAND_INSTR(0x22, 0x00),
+	ILI9881C_COMMAND_INSTR(0x23, 0x00),
+	ILI9881C_COMMAND_INSTR(0x24, 0x00),
+	ILI9881C_COMMAND_INSTR(0x25, 0x00),
+	ILI9881C_COMMAND_INSTR(0x26, 0x00),
+	ILI9881C_COMMAND_INSTR(0x27, 0x00),
+	ILI9881C_COMMAND_INSTR(0x28, 0xB3),
+	ILI9881C_COMMAND_INSTR(0x29, 0x03),
+	ILI9881C_COMMAND_INSTR(0x2A, 0x00),
+	ILI9881C_COMMAND_INSTR(0x2B, 0x00),
+	ILI9881C_COMMAND_INSTR(0x2C, 0x00),
+	ILI9881C_COMMAND_INSTR(0x2D, 0x00),
+	ILI9881C_COMMAND_INSTR(0x2E, 0x00),
+	ILI9881C_COMMAND_INSTR(0x2F, 0x00),
+	ILI9881C_COMMAND_INSTR(0x30, 0x00),
+	ILI9881C_COMMAND_INSTR(0x31, 0x00),
+	ILI9881C_COMMAND_INSTR(0x32, 0x00),
+	ILI9881C_COMMAND_INSTR(0x33, 0x00),
+	ILI9881C_COMMAND_INSTR(0x34, 0x23),
+	ILI9881C_COMMAND_INSTR(0x35, 0x00),
+	ILI9881C_COMMAND_INSTR(0x36, 0x00),
+	ILI9881C_COMMAND_INSTR(0x37, 0x08),
+	ILI9881C_COMMAND_INSTR(0x38, 0x3C),
+	ILI9881C_COMMAND_INSTR(0x39, 0x00),
+	ILI9881C_COMMAND_INSTR(0x3A, 0x00),
+	ILI9881C_COMMAND_INSTR(0x3B, 0x00),
+	ILI9881C_COMMAND_INSTR(0x3C, 0x00),
+	ILI9881C_COMMAND_INSTR(0x3D, 0x00),
+	ILI9881C_COMMAND_INSTR(0x3E, 0x00),
+	ILI9881C_COMMAND_INSTR(0x3F, 0x00),
+	ILI9881C_COMMAND_INSTR(0x40, 0x00),
+	ILI9881C_COMMAND_INSTR(0x41, 0x00),
+	ILI9881C_COMMAND_INSTR(0x42, 0x00),
+	ILI9881C_COMMAND_INSTR(0x43, 0x00),
+	ILI9881C_COMMAND_INSTR(0x44, 0x00),
+	ILI9881C_COMMAND_INSTR(0x50, 0x01),
+	ILI9881C_COMMAND_INSTR(0x51, 0x23),
+	ILI9881C_COMMAND_INSTR(0x52, 0x44),
+	ILI9881C_COMMAND_INSTR(0x53, 0x67),
+	ILI9881C_COMMAND_INSTR(0x54, 0x89),
+	ILI9881C_COMMAND_INSTR(0x55, 0xAB),
+	ILI9881C_COMMAND_INSTR(0x56, 0x01),
+	ILI9881C_COMMAND_INSTR(0x57, 0x23),
+	ILI9881C_COMMAND_INSTR(0x58, 0x45),
+	ILI9881C_COMMAND_INSTR(0x59, 0x67),
+	ILI9881C_COMMAND_INSTR(0x5A, 0x89),
+	ILI9881C_COMMAND_INSTR(0x5B, 0xAB),
+	ILI9881C_COMMAND_INSTR(0x5C, 0xCD),
+	ILI9881C_COMMAND_INSTR(0x5D, 0xEF),
+	ILI9881C_COMMAND_INSTR(0x5E, 0x01),
+	ILI9881C_COMMAND_INSTR(0x5F, 0x00),
+	ILI9881C_COMMAND_INSTR(0x60, 0x00),
+	ILI9881C_COMMAND_INSTR(0x61, 0x01),
+	ILI9881C_COMMAND_INSTR(0x62, 0x01),
+	ILI9881C_COMMAND_INSTR(0x63, 0x08),
+	ILI9881C_COMMAND_INSTR(0x64, 0x0E),
+	ILI9881C_COMMAND_INSTR(0x65, 0x0E),
+	ILI9881C_COMMAND_INSTR(0x66, 0x0F),
+	ILI9881C_COMMAND_INSTR(0x67, 0x0F),
+	ILI9881C_COMMAND_INSTR(0x68, 0x0C),
+	ILI9881C_COMMAND_INSTR(0x69, 0x0C),
+	ILI9881C_COMMAND_INSTR(0x6A, 0x0D),
+	ILI9881C_COMMAND_INSTR(0x6B, 0x0D),
+	ILI9881C_COMMAND_INSTR(0x6C, 0x02),
+	ILI9881C_COMMAND_INSTR(0x6D, 0x02),
+	ILI9881C_COMMAND_INSTR(0x6E, 0x14),
+	ILI9881C_COMMAND_INSTR(0x6F, 0x14),
+	ILI9881C_COMMAND_INSTR(0x70, 0x15),
+	ILI9881C_COMMAND_INSTR(0x71, 0x15),
+	ILI9881C_COMMAND_INSTR(0x72, 0x06),
+	ILI9881C_COMMAND_INSTR(0x73, 0x07),
+	ILI9881C_COMMAND_INSTR(0x74, 0x02),
+	ILI9881C_COMMAND_INSTR(0x75, 0x00),
+	ILI9881C_COMMAND_INSTR(0x76, 0x00),
+	ILI9881C_COMMAND_INSTR(0x77, 0x01),
+	ILI9881C_COMMAND_INSTR(0x78, 0x01),
+	ILI9881C_COMMAND_INSTR(0x79, 0x08),
+	ILI9881C_COMMAND_INSTR(0x7A, 0x0D),
+	ILI9881C_COMMAND_INSTR(0x7B, 0x0D),
+	ILI9881C_COMMAND_INSTR(0x7C, 0x0C),
+	ILI9881C_COMMAND_INSTR(0x7D, 0x0C),
+	ILI9881C_COMMAND_INSTR(0x7E, 0x0F),
+	ILI9881C_COMMAND_INSTR(0x7F, 0x0F),
+	ILI9881C_COMMAND_INSTR(0x80, 0x0E),
+	ILI9881C_COMMAND_INSTR(0x81, 0x0E),
+	ILI9881C_COMMAND_INSTR(0x82, 0x02),
+	ILI9881C_COMMAND_INSTR(0x83, 0x02),
+	ILI9881C_COMMAND_INSTR(0x84, 0x14),
+	ILI9881C_COMMAND_INSTR(0x85, 0x14),
+	ILI9881C_COMMAND_INSTR(0x86, 0x15),
+	ILI9881C_COMMAND_INSTR(0x87, 0x15),
+	ILI9881C_COMMAND_INSTR(0x88, 0x07),
+	ILI9881C_COMMAND_INSTR(0x89, 0x06),
+	ILI9881C_COMMAND_INSTR(0x8A, 0x02),
+	ILI9881C_SWITCH_PAGE_INSTR(4),
+	ILI9881C_COMMAND_INSTR(0x6C, 0x15),
+	ILI9881C_COMMAND_INSTR(0x6E, 0x1a),
+	ILI9881C_COMMAND_INSTR(0x6F, 0x35),
+	ILI9881C_COMMAND_INSTR(0x8D, 0x1f),
+	ILI9881C_COMMAND_INSTR(0x87, 0xBA),
+	ILI9881C_COMMAND_INSTR(0x26, 0x76),
+	ILI9881C_COMMAND_INSTR(0xB2, 0xD1),
+	ILI9881C_COMMAND_INSTR(0x3B, 0x98),
+	ILI9881C_COMMAND_INSTR(0x3A, 0x24),
+	ILI9881C_COMMAND_INSTR(0x35, 0x1F),
+	ILI9881C_COMMAND_INSTR(0xB5, 0x27),
+	ILI9881C_COMMAND_INSTR(0x31, 0x75),
+	ILI9881C_COMMAND_INSTR(0x30, 0x03),
+	ILI9881C_COMMAND_INSTR(0x33, 0x14),
+	ILI9881C_COMMAND_INSTR(0x38, 0x01),
+	ILI9881C_COMMAND_INSTR(0x39, 0x00),
+	ILI9881C_SWITCH_PAGE_INSTR(1),
+	ILI9881C_COMMAND_INSTR(0x22, 0x0a),
+	ILI9881C_COMMAND_INSTR(0x2E, 0x50),
+	ILI9881C_COMMAND_INSTR(0x2F, 0x00),
+	ILI9881C_COMMAND_INSTR(0x31, 0x00),
+	ILI9881C_COMMAND_INSTR(0x53, 0x4a),
+	ILI9881C_COMMAND_INSTR(0x55, 0x65),
+	ILI9881C_COMMAND_INSTR(0x50, 0xbf),
+	ILI9881C_COMMAND_INSTR(0x51, 0xbf),
+	ILI9881C_COMMAND_INSTR(0x60, 0x14),
+	ILI9881C_COMMAND_INSTR(0x61, 0x00),
+	ILI9881C_COMMAND_INSTR(0x62, 0x20),
+	ILI9881C_COMMAND_INSTR(0x63, 0x10),
+	ILI9881C_COMMAND_INSTR(0xA0, 0x04),
+	ILI9881C_COMMAND_INSTR(0xA1, 0x39),
+	ILI9881C_COMMAND_INSTR(0xA2, 0x48),
+	ILI9881C_COMMAND_INSTR(0xA3, 0x13),
+	ILI9881C_COMMAND_INSTR(0xA4, 0x17),
+	ILI9881C_COMMAND_INSTR(0xA5, 0x29),
+	ILI9881C_COMMAND_INSTR(0xA6, 0x1c),
+	ILI9881C_COMMAND_INSTR(0xA7, 0x1d),
+	ILI9881C_COMMAND_INSTR(0xA8, 0xbb),
+	ILI9881C_COMMAND_INSTR(0xA9, 0x16),
+	ILI9881C_COMMAND_INSTR(0xAA, 0x24),
+	ILI9881C_COMMAND_INSTR(0xAB, 0x9e),
+	ILI9881C_COMMAND_INSTR(0xAC, 0x16),
+	ILI9881C_COMMAND_INSTR(0xAD, 0x14),
+	ILI9881C_COMMAND_INSTR(0xAE, 0x48),
+	ILI9881C_COMMAND_INSTR(0xAF, 0x1c),
+	ILI9881C_COMMAND_INSTR(0xB0, 0x22),
+	ILI9881C_COMMAND_INSTR(0xB1, 0x51),
+	ILI9881C_COMMAND_INSTR(0xB2, 0x60),
+	ILI9881C_COMMAND_INSTR(0xB3, 0x32),
+	ILI9881C_COMMAND_INSTR(0xC0, 0x04),
+	ILI9881C_COMMAND_INSTR(0xC1, 0x39),
+	ILI9881C_COMMAND_INSTR(0xC2, 0x48),
+	ILI9881C_COMMAND_INSTR(0xC3, 0x13),
+	ILI9881C_COMMAND_INSTR(0xC4, 0x17),
+	ILI9881C_COMMAND_INSTR(0xC5, 0x29),
+	ILI9881C_COMMAND_INSTR(0xC6, 0x1c),
+	ILI9881C_COMMAND_INSTR(0xC7, 0x1d),
+	ILI9881C_COMMAND_INSTR(0xC8, 0xbb),
+	ILI9881C_COMMAND_INSTR(0xC9, 0x16),
+	ILI9881C_COMMAND_INSTR(0xCA, 0x24),
+	ILI9881C_COMMAND_INSTR(0xCB, 0x9e),
+	ILI9881C_COMMAND_INSTR(0xCC, 0x16),
+	ILI9881C_COMMAND_INSTR(0xCD, 0x14),
+	ILI9881C_COMMAND_INSTR(0xCE, 0x48),
+	ILI9881C_COMMAND_INSTR(0xCF, 0x1c),
+	ILI9881C_COMMAND_INSTR(0xD0, 0x22),
+	ILI9881C_COMMAND_INSTR(0xD1, 0x51),
+	ILI9881C_COMMAND_INSTR(0xD2, 0x60),
+	ILI9881C_COMMAND_INSTR(0xD3, 0x32),
+};
+
 static const struct ili9881c_instr kd050hdfia020_init[] = {
 	ILI9881C_SWITCH_PAGE_INSTR(3),
 	ILI9881C_COMMAND_INSTR(0x01, 0x00),
@@ -1334,6 +1536,9 @@ static int ili9881c_prepare(struct drm_panel *panel)
 	if (ret)
 		return ret;
 
+	if (ctx->desc->msleep_delay)
+		msleep(ctx->desc->msleep_delay);
+
 	return 0;
 }
 
@@ -1400,6 +1605,23 @@ static const struct drm_display_mode k101_im2byl02_default_mode = {
 	.height_mm	= 217,
 };
 
+static const struct drm_display_mode sfto340xc_default_mode = {
+	.clock		= 34000,
+
+	.hdisplay	= 800,
+	.hsync_start	= 800 + 10,
+	.hsync_end	= 800 + 10 + 5,
+	.htotal		= 800 + 10 + 5 + 10,
+
+	.vdisplay	= 800,
+	.vsync_start	= 800 + 10,
+	.vsync_end	= 800 + 10 + 5,
+	.vtotal		= 800 + 10 + 5 + 10,
+
+	.width_mm	= 87,
+	.height_mm	= 87,
+};
+
 static const struct drm_display_mode kd050hdfia020_default_mode = {
 	.clock		= 62000,
 
@@ -1607,6 +1829,15 @@ static const struct ili9881c_desc k101_im2byl02_desc = {
 	.mode_flags = MIPI_DSI_MODE_VIDEO_SYNC_PULSE,
 };
 
+static const struct ili9881c_desc sfto340xc_desc = {
+	.init = sfto340xc_init,
+	.init_length = ARRAY_SIZE(sfto340xc_init),
+	.mode = &sfto340xc_default_mode,
+	.mode_flags = MIPI_DSI_MODE_VIDEO | MIPI_DSI_MODE_VIDEO_BURST |
+		      MIPI_DSI_MODE_LPM | MIPI_DSI_CLOCK_NON_CONTINUOUS,
+	.msleep_delay = 100,
+};
+
 static const struct ili9881c_desc kd050hdfia020_desc = {
 	.init = kd050hdfia020_init,
 	.init_length = ARRAY_SIZE(kd050hdfia020_init),
@@ -1643,6 +1874,7 @@ static const struct ili9881c_desc am8001280g_desc = {
 static const struct of_device_id ili9881c_of_match[] = {
 	{ .compatible = "bananapi,lhr050h41", .data = &lhr050h41_desc },
 	{ .compatible = "feixin,k101-im2byl02", .data = &k101_im2byl02_desc },
+	{ .compatible = "saef,sfto340xc", .data = &sfto340xc_desc },
 	{ .compatible = "startek,kd050hdfia020", .data = &kd050hdfia020_desc },
 	{ .compatible = "tdo,tl050hdv35", .data = &tl050hdv35_desc },
 	{ .compatible = "wanchanglong,w552946aba", .data = &w552946aba_desc },

-- 
2.34.1


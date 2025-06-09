Received: from mg.richtek.com (mg.richtek.com [220.130.44.152])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E66C7281531;
	Mon,  9 Jun 2025 07:47:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=220.130.44.152
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749455281; cv=none; b=G2Vspd8kFznenyz1r29M8Q48zF2QnYBF+GQ3bYVCO5WNNHkwWjoy7mXlWEqpLHOnE0Bn3wb516Qi41r1f4M29OxJTbeshS532Gc8YIbI+oKzT3t/zd8oBl96hgRE5iEq7U8jE8kFpyOhZqLZrMuEl2L5tVaIKu7Kz8QdfxcubUk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749455281; c=relaxed/simple;
	bh=bLzh3N0l2FwX0tfmxx7zOMC3dQm6NA83DXDkylfbHGk=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Lbd1PYvssoNi1njDkarUsZ0Fuqb8v4IfyzC1LTCN3fAc+J2bHJxcsi4U0wmSepq9VKLcOvHWDNVvjhWeu8p3CkIovRc3lyoReHZyMKFPb/P+f5fmfR+wWlItqPeFI1HgQFNTt+WrceS4VtZ6xdhugswVqeI3+RKrK1zHZLaM3Nw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=richtek.com; spf=pass smtp.mailfrom=richtek.com; dkim=pass (2048-bit key) header.d=richtek.com header.i=@richtek.com header.b=oA2VRjbw; arc=none smtp.client-ip=220.130.44.152
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=richtek.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=richtek.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=richtek.com header.i=@richtek.com header.b="oA2VRjbw"
X-MailGates: (SIP:2,PASS,NONE)(compute_score:DELIVER,40,3)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=richtek.com;
	s=richtek; t=1749455268;
	bh=REmnv2Ojktzk9FUAvzpKFhAxZjsavmGM9IR4ahObEe8=; l=1648;
	h=From:To:Subject:Date:Message-ID:MIME-Version;
	b=oA2VRjbwyXPDoeHO8g6UIEQHESIDZyW4/ttLNd6lrYPFrpD5yrZhc4Gx99zWSqVkT
	 ii3nnsp1SezXwA1U2byG80mnYEZxQAy/JZmzOKeXt1X0T7KFqm9jyVEOaVeJozifPn
	 uKuhzbEHOS6hA0HVhb8zTORDBAT1sDdNWU657d9cdJGUDJE1ZN60OUofLvt6oqMzKQ
	 VWhkH1CTR8EEx3t4Kf3rvCBx6hS87NYSX8NC6kwI9Mfz5QlA4CN3n5/XCOAglpow9M
	 6RShPlyJBzVJFyqe9CEyADvuPf20hdCusYPM+++S1qhZQR0UcoZRISZYz+IgOZjduK
	 yHmldIUYlNwlw==
Received: from 192.168.10.46
	by mg.richtek.com with MailGates ESMTPS Server V6.0(2288485:0:AUTH_RELAY)
	(envelope-from <cy_huang@richtek.com>)
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256/256); Mon, 09 Jun 2025 15:47:22 +0800 (CST)
Received: from ex4.rt.l (192.168.10.47) by ex3.rt.l (192.168.10.46) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.11; Mon, 9 Jun
 2025 15:47:22 +0800
Received: from git-send.richtek.com (192.168.10.154) by ex4.rt.l
 (192.168.10.45) with Microsoft SMTP Server id 15.2.1544.11 via Frontend
 Transport; Mon, 9 Jun 2025 15:47:22 +0800
From: <cy_huang@richtek.com>
To: Mark Brown <broonie@kernel.org>, Rob Herring <robh@kernel.org>, "Krzysztof
 Kozlowski" <krzk+dt@kernel.org>
CC: Liam Girdwood <lgirdwood@gmail.com>, Conor Dooley <conor+dt@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, "ChiYuan
 Huang" <cy_huang@richtek.com>, Roy Chiu <roy_chiu@richtek.com>,
	<linux-sound@vger.kernel.org>, <devicetree@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>
Subject: [PATCH v2 1/2] ASoC: dt-bindings: rt9123: Append RTQ9124 description
Date: Mon, 9 Jun 2025 15:47:27 +0800
Message-ID: <9921d64ce4d63c24499f92ef33a4ce7cb018c60b.1749454717.git.cy_huang@richtek.com>
X-Mailer: git-send-email 2.43.5
In-Reply-To: <cover.1749454717.git.cy_huang@richtek.com>
References: <cover.1749454717.git.cy_huang@richtek.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

From: ChiYuan Huang <cy_huang@richtek.com>

Document the ASoC Richtek RTQ9124 in existed RT9123 file.

Signed-off-by: ChiYuan Huang <cy_huang@richtek.com>
---
v2:
- Due to the similar document file, directly append RTQ9124 into RT9123
  document to prevent adding the redudant yaml file
---
 .../devicetree/bindings/sound/richtek,rt9123.yaml        | 9 ++++++++-
 1 file changed, 8 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/sound/richtek,rt9123.yaml b/Documentation/devicetree/bindings/sound/richtek,rt9123.yaml
index 5acb05cdfefd..819ca06203b1 100644
--- a/Documentation/devicetree/bindings/sound/richtek,rt9123.yaml
+++ b/Documentation/devicetree/bindings/sound/richtek,rt9123.yaml
@@ -4,7 +4,7 @@
 $id: http://devicetree.org/schemas/sound/richtek,rt9123.yaml#
 $schema: http://devicetree.org/meta-schemas/core.yaml#
 
-title: Richtek RT9123 Audio Amplifier
+title: Richtek RT9123/RTQ9124 Audio Amplifier
 
 maintainers:
   - ChiYuan Huang <cy_huang@richtek.com>
@@ -15,6 +15,12 @@ description:
   support various formats, including I2S, left-justified, right-justified, and
   TDM formats.
 
+  RTQ9124 is an ultra-low output noise, digital input, mono-channel Class-D
+  power amplifier that supports a 2.1MHz switching frequency. It integrates
+  both DC and AC load diagnostics, as well as real-time load monitoring to
+  assess speaker condition. The device operates from 4.5V to 18V and delivers
+  up to 30W output power.
+
 allOf:
   - $ref: dai-common.yaml#
 
@@ -22,6 +28,7 @@ properties:
   compatible:
     enum:
       - richtek,rt9123
+      - richtek,rtq9124
 
   reg:
     maxItems: 1
-- 
2.34.1


Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net [217.70.183.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0FCC52185A3;
	Tue,  4 Feb 2025 17:06:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.183.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738688808; cv=none; b=Jag2xKkFBdCdWNqviOxd5v6HOzxgZJChIuiFwwzjaDHedxY7XHTl84JurMuoEG68tqwmLvSFEaityOL4UPLiiLl2gX5tIQqkP5r7hNBi66AK8V1z2ciWsk/t0/w1lMG/A0ZwfiF+Ng7HKmHLsfboDlnlizx9IA7K7ghNMfXgMbw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738688808; c=relaxed/simple;
	bh=32hpXVO+xwETouV8NjXWq30FphwdU7XYmC5ChjLinDM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=f60PBMueGqd5ytEws0yPMXp+PpnDqQRGbeg+B8St02zojaQ7FFAqGg0FudVlT/VOPiNu0cVm7tfU34yrRdF71OcKX+xIKwDxjxGtTQqZDZQXSKgv0wIsiNGUy+zsP22r6TSM4f32o+1gYFNOXTbcq4+oumCOpKU0P+VEOgwVWJI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=YnhrbhC+; arc=none smtp.client-ip=217.70.183.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="YnhrbhC+"
Received: by mail.gandi.net (Postfix) with ESMTPSA id 9357D204B4;
	Tue,  4 Feb 2025 17:06:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1738688799;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=WQWqdBZeS98Fx3dq4V1eu9RdpUqn69nGfYSW7odK4Pc=;
	b=YnhrbhC+1zUvYapwOIM8YjPHtmd0k7jCuG2VhCUYYO9D/0DFTOBH+K3Kdi7FjXIOe7etH8
	oWeMYl7sfF8QZW5fDxxmk7DPgKQikYyRrJgmtHkg5I/dbjXqHA6SpZSbAwGf16qDk6Hrm0
	fj5di01VEV5Kcu85dJ8DrqSZiYzPHWiKPOqQuaNtT8MP2cGoevAyeFHYCpwBzkqzFg3LAc
	7FwGCHES4JgRqEN7nJIlAOmrua5KkPxgvzz+tE5xIbwfXiVPdj0HzBcPf9Lxz748vWLnJV
	wLTe98qr60BINs/n5QcIkr4yAG7q+My1u/MGHmMpsyj+wVIsAaxPoLQGPSfYgg==
From: Louis Chauvet <louis.chauvet@bootlin.com>
Date: Tue, 04 Feb 2025 18:06:17 +0100
Subject: [PATCH v17 6/7] drm/vkms: Add how to run the Kunit tests
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250204-yuv-v17-6-9c623880d0ac@bootlin.com>
References: <20250204-yuv-v17-0-9c623880d0ac@bootlin.com>
In-Reply-To: <20250204-yuv-v17-0-9c623880d0ac@bootlin.com>
To: Rodrigo Siqueira <rodrigosiqueiramelo@gmail.com>, 
 Melissa Wen <melissa.srw@gmail.com>, 
 =?utf-8?q?Ma=C3=ADra_Canal?= <mairacanal@riseup.net>, 
 Haneen Mohammed <hamohammed.sa@gmail.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, rdunlap@infradead.org, 
 arthurgrillo@riseup.net, Jonathan Corbet <corbet@lwn.net>, 
 pekka.paalanen@haloniitty.fi, Simona Vetter <simona@ffwll.ch>, 
 Simona Vetter <simona.vetter@ffwll.ch>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 jeremie.dautheribes@bootlin.com, miquel.raynal@bootlin.com, 
 thomas.petazzoni@bootlin.com, seanpaul@google.com, marcheu@google.com, 
 nicolejadeyee@google.com, linux-doc@vger.kernel.org, 
 Louis Chauvet <louis.chauvet@bootlin.com>, 
 =?utf-8?q?Jos=C3=A9_Exp=C3=B3sito?= <jose.exposito89@gmail.com>, 
 Pekka Paalanen <pekka.paalanen@collabora.com>
X-Mailer: b4 0.15-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=1286;
 i=louis.chauvet@bootlin.com; h=from:subject:message-id;
 bh=apJqDFu1gBe/iJYQGCEO8k8I8h/LbDRkCROTkmqCrOo=;
 b=owEBbQKS/ZANAwAIASCtLsZbECziAcsmYgBnokkUHKYzM7hb02tMHQoPQTi84P5MmXVx/7KyL
 PzxtDUGDfSJAjMEAAEIAB0WIQRPj7g/vng8MQxQWQQgrS7GWxAs4gUCZ6JJFAAKCRAgrS7GWxAs
 4imYEADFLHio5tjJVRy7M5Kl1XaKitZATOY5tRTvzDlrAHa7GKl6XigqDmczJV1P+W15f1RnluR
 QvEiP6wCrg/jo8llZsyVbfP/aV3q1kOh66U3wcLCyBGLHFkhH0ywPGwzHURjfxL4Hoyeq8sXqQ0
 XfepMXpW2cn9/ptP/JjmgaQVEOdaeJtWF6mmwoVgM4JMgT5FtD4OfDo7CrMgCxbeJG3wHCToMjm
 QZwoqLp4uzdzgmZeZxs1NK3xG9yIxpDKZXwOJrQj7DQpXc5bdmSemoRUcKcsLcBuBehxrnMOduz
 BCkiQruoOXAFJaTogXoOzQmbVNnorYs0E1JuBH4JSNanOkOzxmQTiK0Q3RAE26tsnEwbvCEeUMm
 PLDO5ZrxmYCHFYOdJbl4ed2BBIB2NLikLqTKG+znxBpgAaWIc3tBZHyvMWLrSdgozNq/pPz8Taz
 QJIhBdnaDhSRzNq9HjHDvYlhAdc75v8z34N8X1LKLEshPatcCEjwTnHVTA3+J9nsgFTRzpU3L8A
 +PTUQKA86q44IWoWqRUj2WIwk+Iy3KgEujYquRpyEbIS4qCnKumz/8BuI7+5F3RExA+1TGqWtJ5
 eZfBdZ5p8X3SKagQgGR1Bg4lc3L37iY8kqR6Naf9hPlheP95AF8+I/ASxQA5V2ZaFQPe9O3PZnl
 r6E7ZASawhDsDaw==
X-Developer-Key: i=louis.chauvet@bootlin.com; a=openpgp;
 fpr=8B7104AE9A272D6693F527F2EC1883F55E0B40A5
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgddvuddtkecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfitefpfffkpdcuggftfghnshhusghstghrihgsvgenuceurghilhhouhhtmecufedtudenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhephfffufggtgfgkfhfjgfvvefosehtkeertdertdejnecuhfhrohhmpefnohhuihhsucevhhgruhhvvghtuceolhhouhhishdrtghhrghuvhgvthessghoohhtlhhinhdrtghomheqnecuggftrfgrthhtvghrnhepleeffffhfffhueekhfdvfedtjefhveefhfffffehieffleeijeekhedvtedtffevnecuffhomhgrihhnpehrshhtrdhtohenucfkphepledtrdekledrudeifedruddvjeenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpeeltddrkeelrdduieefrdduvdejpdhhvghloheplgdujedvrddukedrtddrudgnpdhmrghilhhfrhhomheplhhouhhishdrtghhrghuvhgvthessghoohhtlhhinhdrtghomhdpnhgspghrtghpthhtohepvdeipdhrtghpthhtoheprhhoughrihhgohhsihhquhgvihhrrghmvghlohesghhmrghilhdrtghomhdprhgtphhtthhopehlihhnuhigqdguohgtsehvghgvrhdrkhgvrhhnvghlrdhorhhgpdhrtghpthhtoheptghorhgsvghtsehlfihnrdhnvghtpdhrtghpthhtohepnhhitgholhgvjhgruggvhigvvgesghhoohhglhgvrdgtohhmpdhrtghpthhtohept
 hhhohhmrghsrdhpvghtrgiiiihonhhisegsohhothhlihhnrdgtohhmpdhrtghpthhtohepmhhiqhhuvghlrdhrrgihnhgrlhessghoohhtlhhinhdrtghomhdprhgtphhtthhopehtiihimhhmvghrmhgrnhhnsehsuhhsvgdruggvpdhrtghpthhtohepphgvkhhkrgdrphgrrghlrghnvghnsegtohhllhgrsghorhgrrdgtohhm
X-GND-Sasl: louis.chauvet@bootlin.com

From: Arthur Grillo <arthurgrillo@riseup.net>

Now that we have KUnit tests, add instructions on how to run them.

Signed-off-by: Arthur Grillo <arthurgrillo@riseup.net>
Reviewed-by: José Expósito <jose.exposito89@gmail.com>
Acked-by: Pekka Paalanen <pekka.paalanen@collabora.com>
Signed-off-by: Louis Chauvet <louis.chauvet@bootlin.com>
---
 Documentation/gpu/vkms.rst | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/Documentation/gpu/vkms.rst b/Documentation/gpu/vkms.rst
index 88e0913ca33a83255f40411472f48a849002e76d..8a8b1002931f81366595b935ae145661b171fc2d 100644
--- a/Documentation/gpu/vkms.rst
+++ b/Documentation/gpu/vkms.rst
@@ -89,6 +89,17 @@ You can also run subtests if you do not want to run the entire test::
   sudo ./build/tests/kms_flip --run-subtest basic-plain-flip --device "sys:/sys/devices/platform/vkms"
   sudo IGT_DEVICE="sys:/sys/devices/platform/vkms" ./build/tests/kms_flip --run-subtest basic-plain-flip
 
+Testing With KUnit
+==================
+
+KUnit (Kernel unit testing framework) provides a common framework for unit tests
+within the Linux kernel.
+More information in ../dev-tools/kunit/index.rst .
+
+To run the VKMS KUnit tests::
+
+  tools/testing/kunit/kunit.py run --kunitconfig=drivers/gpu/drm/vkms/tests
+
 TODO
 ====
 

-- 
2.48.1


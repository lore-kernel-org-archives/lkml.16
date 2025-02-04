Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net [217.70.183.198])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E54D6207651
	for <linux-kernel@vger.kernel.org>; Tue,  4 Feb 2025 08:52:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.183.198
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738659135; cv=none; b=ht5nRvfETYT+Z4XSFgBcLqMru6jMlsCGjYcu9zmomnI2vr9/b+SpimZDw3HYJmjOEimaFpfBDo66d12q4nns/5wINcLoD140fEYTalMfKTZB+Y9LQqEj6Pi88EadD8sjHE0z2JH11e6vJTLmp56to1rz7ykIkJG+HNODvC2oW9I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738659135; c=relaxed/simple;
	bh=PbjBMZYNHM9ajceRmzPLYGlK5wlVSkB9W9iBW1unRUg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=s55DFyN0PZG0KocwCWJ8vBcQlWmYHuiOgrDZr312Hj+omaBxrr46+gYlS132nZkckkSHTz0bO4C3gKKebkf0rdoYSr5g7mVuOmQEXAE7OV87EQjnI0N00clPQVvvuH98wNZDqfUoGDTaoEvdt/BEjbHLKN1wERxPjOzwme9GIpA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=CQhVTIUp; arc=none smtp.client-ip=217.70.183.198
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="CQhVTIUp"
Received: by mail.gandi.net (Postfix) with ESMTPSA id F41EB442B3;
	Tue,  4 Feb 2025 08:52:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1738659131;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=XCJgg4AxjCLLIhlCJHUT1wm3A4fyWpj7moZQ1vUBeKM=;
	b=CQhVTIUpT1iD4slXEq8+F7TwwMIyssGYNCE6f4Xzgj1muc+NXXkYRs6PFHlIGfKSj7IJXb
	TCNgXONLBq2QogEfeK9gxTuSI7iaWqHPoZcgF2c8zeMAIupHDH24UoNZDK+hc+YKtuUCkx
	apwoFzNasnXE0+NWQ1vEZPFv1/Lw3+4FOOCeg0WgV//TgiRe8clOCVR6ZTMxlqq3fyn82L
	+0eXx8sJhIiFsQvrAa4wpcdHYM53lgbk5lc843u8pdu3y4S3ym607iBVZ+Pyds/QuLJr2A
	9kKXJNTrrb0S9wcZgR/eVN9XQJFzEHifOYqYCvfgb09KXPoQ+6N14uR44LGpnQ==
From: Luca Ceresoli <luca.ceresoli@bootlin.com>
Date: Tue, 04 Feb 2025 09:51:59 +0100
Subject: [PATCH v4 2/2] drm/atomic-helper: improve CRTC enabled/connectors
 mismatch logging message
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250204-drm-small-improvements-v4-2-d6bbc92f12f1@bootlin.com>
References: <20250204-drm-small-improvements-v4-0-d6bbc92f12f1@bootlin.com>
In-Reply-To: <20250204-drm-small-improvements-v4-0-d6bbc92f12f1@bootlin.com>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, 
 Jani Nikula <jani.nikula@linux.intel.com>, 
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Louis Chauvet <louis.chauvet@bootlin.com>, dri-devel@lists.freedesktop.org, 
 linux-kernel@vger.kernel.org, Luca Ceresoli <luca.ceresoli@bootlin.com>
X-Mailer: b4 0.14.2
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgddvtddtjecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfitefpfffkpdcuggftfghnshhusghstghrihgsvgenuceurghilhhouhhtmecufedtudenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhephfffufggtgfgkfhfjgfvvefosehtjeertdertdejnecuhfhrohhmpefnuhgtrgcuvegvrhgvshholhhiuceolhhutggrrdgtvghrvghsohhlihessghoohhtlhhinhdrtghomheqnecuggftrfgrthhtvghrnhepieeiuedvffetgfeuudelheeutefggfejieettdetteekueeuueeukeevvedvueevnecukfhppedvrgdtvdemieejtdemvddtvddtmegvrgdtudemvdhftdgsmeeludgssgemughfiegumegtugefudenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpedvrgdtvdemieejtdemvddtvddtmegvrgdtudemvdhftdgsmeeludgssgemughfiegumegtugefuddphhgvlhhopegluddvjedrtddruddrudgnpdhmrghilhhfrhhomheplhhutggrrdgtvghrvghsohhlihessghoohhtlhhinhdrtghomhdpnhgspghrtghpthhtohepuddvpdhrtghpthhtohepmhgrrghrthgvnhdrlhgrnhhkhhhorhhstheslhhinhhugidrihhnthgvlhdrtghomhdprhgtphhtthhopehluhgtrgdrtggvrhgvshholhhisegsohhothhlihhnrdgtohhmpdhrtghpthhtoheplhhouhhishdrtghhrghuvhgvthessghoo
 hhtlhhinhdrtghomhdprhgtphhtthhopehlihhnuhigqdhkvghrnhgvlhesvhhgvghrrdhkvghrnhgvlhdrohhrghdprhgtphhtthhopehjrghnihdrnhhikhhulhgrsehlihhnuhigrdhinhhtvghlrdgtohhmpdhrtghpthhtohepughrihdquggvvhgvlheslhhishhtshdrfhhrvggvuggvshhkthhophdrohhrghdprhgtphhtthhopehthhhomhgrshdrphgvthgriiiiohhnihessghoohhtlhhinhdrtghomhdprhgtphhtthhopegrihhrlhhivggusehgmhgrihhlrdgtohhm
X-GND-Sasl: luca.ceresoli@bootlin.com

This message reports a mismatch between new_crtc_state->enable and
has_connectors, which should be either both true or both false. However it
does not mention which one is true and which is false, which can be useful
for debugging. Add the value of both avriables to the log message.

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Acked-by: Louis Chauvet <louis.chauvet@bootlin.com>
Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
---
 drivers/gpu/drm/drm_atomic_helper.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/drm_atomic_helper.c b/drivers/gpu/drm/drm_atomic_helper.c
index 5186d2114a503701e228e382cc45180b0c578d0c..8ed186ddaeafae8295696eb11ace58777a5d9e43 100644
--- a/drivers/gpu/drm/drm_atomic_helper.c
+++ b/drivers/gpu/drm/drm_atomic_helper.c
@@ -666,8 +666,9 @@ drm_atomic_helper_check_modeset(struct drm_device *dev,
 		}
 
 		if (new_crtc_state->enable != has_connectors) {
-			drm_dbg_atomic(dev, "[CRTC:%d:%s] enabled/connectors mismatch\n",
-				       crtc->base.id, crtc->name);
+			drm_dbg_atomic(dev, "[CRTC:%d:%s] enabled/connectors mismatch (%d/%d)\n",
+				       crtc->base.id, crtc->name,
+				       new_crtc_state->enable, has_connectors);
 
 			return -EINVAL;
 		}

-- 
2.34.1


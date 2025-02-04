Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net [217.70.183.198])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A1694207675
	for <linux-kernel@vger.kernel.org>; Tue,  4 Feb 2025 08:52:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.183.198
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738659135; cv=none; b=MyP/BvyZZswkfEzORTngNyRYIL4JHKhMAiJ5JkZKLD3FGf1TEd2hZ4/KQEM/to/fdxecJuHwFIns8E3Xcyj0esieOMiXOvWp+tNn/CC9vCavs/yVqaJvNr5EVcVaQgmytVlVMIqEzQV+IbGlvrjtOBhoMsGVuPenggbqhNBGKwE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738659135; c=relaxed/simple;
	bh=zjAVYQDzYrP3piUvkL2nd593oHD/A4BEPFn4R/F6Rj0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=NRHXGR5NpBMogEPmfWaFDJ2G518HXhT4cdiW3WCsAJKsk3XjmVZhpFmLC93YCOp5u87cCClZG00O9KcYi0i0YGJAH+7Qv00YHGQCxPozqI5piDdv2j+3KfkHw1vI6iXrkNnhu5W2lhnuBVVv8MRWT20dMdDOxGCs7wnLUu8Q824=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=hM079YZc; arc=none smtp.client-ip=217.70.183.198
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="hM079YZc"
Received: by mail.gandi.net (Postfix) with ESMTPSA id 1670E442BF;
	Tue,  4 Feb 2025 08:52:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1738659130;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=rIYnONccmsYuTPCzBma044LzMeDyb9enKMFQvDEAUTQ=;
	b=hM079YZcBLdiD/itdo8n6z0ucRuwww1NHPcqbd9FVgc2ovQzZ/AekzpnKQemZXyhxPH1B6
	DYiwgD3MtrRRhHf4jnvNLwESkHD6/0I/3U/R0XOzoK7FOLjbIDarraLrz3z4VfkvegFQfM
	X0JuiyYYCNtWiSd/dyWSuHWHVvrnd2KWwxysi+KMcVC9veuN2ISS+5tL7daUpYFZlkQRLn
	ziB0euJ0syAjB2HZa3MRvhvc2cqbVEQMYfkJYZGygez4VUq/aZoHOBbseHWaG/nrdVDc+9
	4rfpQ39JgGen3D7imP0utr1873aiFv1Q252FYkM+zD+yG30zSKyMJ5vVMIRSIA==
From: Luca Ceresoli <luca.ceresoli@bootlin.com>
Date: Tue, 04 Feb 2025 09:51:58 +0100
Subject: [PATCH v4 1/2] drm/drm_mode_object: fix typo in kerneldoc
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250204-drm-small-improvements-v4-1-d6bbc92f12f1@bootlin.com>
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

Remove unintended extra word.

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Acked-by: Louis Chauvet <louis.chauvet@bootlin.com>
Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
---
 include/drm/drm_mode_object.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/include/drm/drm_mode_object.h b/include/drm/drm_mode_object.h
index 08d7a7f0188fea79e2d8ad5ee6cc5044300f1a26..c68edbd126d04d51221f50aa2b4166475543b59f 100644
--- a/include/drm/drm_mode_object.h
+++ b/include/drm/drm_mode_object.h
@@ -35,7 +35,7 @@ struct drm_file;
  * @id: userspace visible identifier
  * @type: type of the object, one of DRM_MODE_OBJECT\_\*
  * @properties: properties attached to this object, including values
- * @refcount: reference count for objects which with dynamic lifetime
+ * @refcount: reference count for objects with dynamic lifetime
  * @free_cb: free function callback, only set for objects with dynamic lifetime
  *
  * Base structure for modeset objects visible to userspace. Objects can be

-- 
2.34.1


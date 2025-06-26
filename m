Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net [217.70.183.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A8D192F22
	for <linux-kernel@vger.kernel.org>; Thu, 26 Jun 2025 13:16:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.183.199
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750943814; cv=none; b=kEu5QsHIUDSCmzwvKIgiQ2uVrk9PhPv3csV10sq80A96jlVh7PD68ch3YjuMRki0PiVn30g5+pTu/KhB6f9D0WEIVUWhfJarV+9oi0hxorq28HXlplFVaQvO/SrbTAOZbZiYPuda2SvqdvuGJJJb81Fxba+SK1mSDAjjdsBMsJw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750943814; c=relaxed/simple;
	bh=QWYFdbl31RNNqN4BYH4W28hZj+1QkgI/0osIe1dfg9o=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=IC1gaMcIPYUTLR9SCzrUTdNhWeQPjtW1FFVBqWIV9kqwX0A4L0fVyuAFY7yubRv05Dvfh4JuPLUYaI4N4L+5+H8w1V5sKIrsF+9unxjsRbffigCrs46X55PnkHN6ARwM9+JbqE+QkMo+apAUZ2a0rdpgoKgh/BUjAKKnU86evi0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=GEih9Gdy; arc=none smtp.client-ip=217.70.183.199
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="GEih9Gdy"
Received: by mail.gandi.net (Postfix) with ESMTPSA id 694CF4328B;
	Thu, 26 Jun 2025 13:16:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1750943803;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=2XW1OiuVPxHk8xSFmbkEI9HJCd0atEf9LZcxsJXMXXg=;
	b=GEih9GdykJqHCq7xodj1C/h32QsB1NudjAuihW0486nGmk1HcD7GGxF4qELCXd08LmYU5O
	KtB9sd7bGK5Al+7AYZc7B3dfmLGbVT3v4LexVavqcbNOiPvopSWYCPdd1UDF2sM81RKKdi
	/DF7KqM47wlB/Ph2O/X+jmvnsucJD0OLlYbgymCshwp4Ykj2/uiw3OVaM4+CKDSGQjH/zn
	J78P7tQogolm6H23aC+l2h9W//rizgj0BUYrz8tXgdMwSd/+brxV9UYuB2j/hfwNCeiAYv
	Z/gmBxf7DWoajZKD3FsL9R2gZQe8bqTJ3fyUJ0BpJzQkFsndTjuM9uARIvjLAA==
From: Luca Ceresoli <luca.ceresoli@bootlin.com>
To: Andrzej Hajda <andrzej.hajda@intel.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Luca Ceresoli <luca.ceresoli@bootlin.com>
Cc: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>, 
 Anusha Srivatsa <asrivats@redhat.com>, dri-devel@lists.freedesktop.org, 
 linux-kernel@vger.kernel.org, Hui Pu <Hui.Pu@gehealthcare.com>, 
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
In-Reply-To: <20250620-drm-bridge-alloc-getput-drm-bridge-c-v9-0-ca53372c9a84@bootlin.com>
References: <20250620-drm-bridge-alloc-getput-drm-bridge-c-v9-0-ca53372c9a84@bootlin.com>
Subject: Re: [PATCH v9 0/3] drm/bridge: get/put the bridge reference in
 drm_bridge.c, warn on old alloc pattern
Message-Id: <175094380131.1106580.10747660115585340028.b4-ty@bootlin.com>
Date: Thu, 26 Jun 2025 15:16:41 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.2
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtdefgddvjecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfitefpfffkpdcuggftfghnshhusghstghrihgsvgenuceurghilhhouhhtmecufedtudenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhephffvvegjfhfukfffgggtgffosehtjeertdertdejnecuhfhrohhmpefnuhgtrgcuvegvrhgvshholhhiuceolhhutggrrdgtvghrvghsohhlihessghoohhtlhhinhdrtghomheqnecuggftrfgrthhtvghrnhepieefvdehvedvgeeftedugeetudevuedvffekhedvfeetkeduleelgeevudffieeinecukfhppedvrgdtvdemieejtdemvddtvddtmegvrgdtudemsggvgedumeelhegvjeemfeegfeemledufegvnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepvdgrtddvmeeijedtmedvtddvtdemvggrtddumegsvgegudemleehvgejmeefgeefmeeludefvgdphhgvlhhopegludelvddrudeikedrudejkedrjeehngdpmhgrihhlfhhrohhmpehluhgtrgdrtggvrhgvshholhhisegsohhothhlihhnrdgtohhmpdhnsggprhgtphhtthhopedukedprhgtphhtthhopehluhgtrgdrtggvrhgvshholhhisegsohhothhlihhnrdgtohhmpdhrtghpthhtohepughmihhtrhihrdgsrghrhihshhhkohhvsehoshhsrdhquhgrlhgtohhmmhdrtghomhdprhgtphhtthhopegrnhgurhiivghjrdhhrghjuggrsehin
 hhtvghlrdgtohhmpdhrtghpthhtohepnfgruhhrvghnthdrphhinhgthhgrrhhtsehiuggvrghsohhnsghorghrugdrtghomhdprhgtphhtthhopehjohhnrghssehkfihisghoohdrshgvpdhrtghpthhtohepthiiihhmmhgvrhhmrghnnhesshhushgvrdguvgdprhgtphhtthhopehmrggrrhhtvghnrdhlrghnkhhhohhrshhtsehlihhnuhigrdhinhhtvghlrdgtohhmpdhrtghpthhtoheprghirhhlihgvugesghhmrghilhdrtghomh
X-GND-Sasl: luca.ceresoli@bootlin.com


On Fri, 20 Jun 2025 17:59:52 +0200, Luca Ceresoli wrote:
> This small series adds drm_bridge_get/put() calls where applicable in the
> bridge core code, and adds a warning when the old allocation patter is
> used.
> 
> This is part of the work towards removal of bridges from a still existing
> DRM pipeline without use-after-free.
> 
> [...]

Applied, thanks!

[1/3] drm/bridge: get/put the bridge reference in drm_bridge_add/remove()
      commit: a7748dd127ea8d9cd2d9d942ef21c85e5569bb73
[2/3] drm/bridge: get/put the bridge reference in drm_bridge_attach/detach()
      commit: 94d50c1a2ca31d80f12d9c2bdbc41437751e320c
[3/3] drm/bridge: add warning for bridges not using devm_drm_bridge_alloc()
      commit: e6565e76e977422cb9e51fe872a2bcfdbc321b7b

Best regards,
-- 
Luca Ceresoli <luca.ceresoli@bootlin.com>


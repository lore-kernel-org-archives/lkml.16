Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net [217.70.183.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D3363214801
	for <linux-kernel@vger.kernel.org>; Mon, 23 Jun 2025 08:14:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.183.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750666494; cv=none; b=T7aZcYsFy/yZMFvll8P15uAo6lckbh/h2QvyaVxi/EEy/TKmzIUMbXN+AX3SOOXcIdpsR9+rSuXb91kM6W2NbK2JMFv0w8c7u0GDp0/SqrnJ4+8szSm9ty538RMPNo6ViQ9Io3JwM6oSKVh4ElJSKiXKLzGe+GAlIC50Yl95hIw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750666494; c=relaxed/simple;
	bh=RnHJ1MVLHB7pgSW+RoCUFJ8A5A/Jj6f9f/rMAV5nwOk=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=P0+rW1R6ZeFioAS2IV6HW6AJGHzAtZhBzToVBbe6cuGEhoZNxPC4b90aXlwZ9gO/pmJooMJemf5ZOkhhUdsS/1SdOsQ1v4kGxt61ldZIWr5PxpbDNsqhEED3NaUC6m1+xpGpxhWyDwWU/VlzmbvE203F1+c2Dju1tosQKtBb0ig=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=YeCLmTkJ; arc=none smtp.client-ip=217.70.183.201
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="YeCLmTkJ"
Received: by mail.gandi.net (Postfix) with ESMTPSA id 41C5B43424;
	Mon, 23 Jun 2025 08:14:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1750666485;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=zEkVeHe6fV8P3rJb5CgRudPEfC2hTGoF5KMLEQlsPbA=;
	b=YeCLmTkJ008L+TWFSC+F/JUG6ntqtAaKrgWOEqg3cAYdtnVr5hYxexOHJp0y+4ykW5NEDC
	44S9Aes2No7rqgB/IskaRWrvr99768ss7eqln69qp90+8Ga+ELyyDp7OpVF3QPmRn4O67V
	giVpvTOjiuxoPsJiviVcSQc0DfqnLgXtdP9GeKkVgXt8sgbzuH67IlH9oV1BuJv2rURYEl
	M0p5WmIHrcoXpO8ZuxfVVuNfTqghD/DHEWIUABj3+TAZEFDld6BxRFWXA1AJ9LZ1bbWWVI
	+vGNXHivPJKnok9bdEd2p9vIml+DF/ZV7UcsNfM4LbBBMij6eeD3sym9KiUGzQ==
From: Louis Chauvet <louis.chauvet@bootlin.com>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Louis Chauvet <louis.chauvet@bootlin.com>
Cc: thomas.petazzoni@bootlin.com, dri-devel@lists.freedesktop.org, 
 linux-kernel@vger.kernel.org, Mark Yacoub <markyacoub@google.com>
In-Reply-To: <20250429-drm-fix-writeback-cleanup-v2-1-548ff3a4e284@bootlin.com>
References: <20250429-drm-fix-writeback-cleanup-v2-1-548ff3a4e284@bootlin.com>
Subject: Re: [PATCH v2] drm: writeback: Fix drm_writeback_connector_cleanup
 signature
Message-Id: <175066648416.11752.3954585801446289594.b4-ty@bootlin.com>
Date: Mon, 23 Jun 2025 10:14:44 +0200
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
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtddvgdduieehudcutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfitefpfffkpdcuggftfghnshhusghstghrihgsvgenuceurghilhhouhhtmecufedtudenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhephffvvegjfhfukfffgggtgffosehtjeertdertdejnecuhfhrohhmpefnohhuihhsucevhhgruhhvvghtuceolhhouhhishdrtghhrghuvhgvthessghoohhtlhhinhdrtghomheqnecuggftrfgrthhtvghrnhepjeehieelvdekieegledutdeljedvhfelfeelffffiedttedvledttddttdfgleetnecukfhppedujeeirdduheelrddvtddurdehieenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpedujeeirdduheelrddvtddurdehiedphhgvlhhopefjohhsthdqtddtfedrlhgrnhdpmhgrihhlfhhrohhmpehlohhuihhsrdgthhgruhhvvghtsegsohhothhlihhnrdgtohhmpdhnsggprhgtphhtthhopedutddprhgtphhtthhopegrihhrlhhivggusehgmhgrihhlrdgtohhmpdhrtghpthhtoheplhhouhhishdrtghhrghuvhgvthessghoohhtlhhinhdrtghomhdprhgtphhtthhopehthhhomhgrshdrphgvthgriiiiohhnihessghoohhtlhhinhdrtghomhdprhgtphhtthhopegurhhiqdguvghvvghlsehlihhsthhsrdhfrhgvvgguvghskhhtohhprdhorhhgpdhrtghpthhtohepmhgrrghrt
 hgvnhdrlhgrnhhkhhhorhhstheslhhinhhugidrihhnthgvlhdrtghomhdprhgtphhtthhopehlihhnuhigqdhkvghrnhgvlhesvhhgvghrrdhkvghrnhgvlhdrohhrghdprhgtphhtthhopehmrghrkhihrggtohhusgesghhoohhglhgvrdgtohhmpdhrtghpthhtohepthiiihhmmhgvrhhmrghnnhesshhushgvrdguvg
X-GND-Sasl: louis.chauvet@bootlin.com


On Tue, 29 Apr 2025 10:36:23 +0200, Louis Chauvet wrote:
> The drm_writeback_connector_cleanup have the signature:
> 
>      static void drm_writeback_connector_cleanup(
> 		struct drm_device *dev,
> 		struct drm_writeback_connector *wb_connector)
> 
> But it is stored and used as a drmres_release_t
> 
> [...]

Applied, thanks!

[1/1] drm: writeback: Fix drm_writeback_connector_cleanup signature
      commit: fb721b2c35b1829b8ecf62e3adb41cf30260316a

Best regards,
-- 
Louis Chauvet <louis.chauvet@bootlin.com>


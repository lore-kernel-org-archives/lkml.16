Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net [217.70.183.196])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 82A892973BC;
	Tue, 15 Apr 2025 13:55:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.183.196
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744725353; cv=none; b=n7DaHfmLVzMJ9ZSQpxKjtZxpFiCYmO8/aTW80svafEDKDFlcBAh+ra5tgEduwLg88jKIyvFR0png8Rt2XvpRCavm8YuxoneVOQ+VL4U2v7vb45K4Kbt1tWBU4zUIsb5tOPdRWTi32jl9gtit50/0pdWTGz0iu9cMpWBRcBiufUs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744725353; c=relaxed/simple;
	bh=9xg5JogYmbZpZZ091LuHQwsql34+O6ytLUVCOlIWJJw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=hQ49G/TbNmonK9/hQWwtC7a2zc+LEOqczTOiXdIiLf0tLZy6Oxuui9yklLX8d4lp0BzP9ftkhzC7w9PBTyyZZCcQaMcoh1BhKQzbD4KPhB/cEHH12zV1HnMq4PhPbraY/OKcfdcdSuSoNu4dsOQ4aEmRtyHeM/FvaOKPoTUBqLw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=gWyt0Z8f; arc=none smtp.client-ip=217.70.183.196
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="gWyt0Z8f"
Received: by mail.gandi.net (Postfix) with ESMTPSA id 89C5243B70;
	Tue, 15 Apr 2025 13:55:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1744725343;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Lh69y91DUFOtI34xFPwTFsuk49kOa56c1BplcJ4yxbw=;
	b=gWyt0Z8fTePyQEmwHPX95ZloHkcDhrKwlgy16chPuhtYkAI9Cmz26g11VrAW4IOGGndop+
	GMOzb31mSJLrp+lgs6bHiHhU/Woe24112Q+y+rC3iPQvt3pNHH2CE4winpJAOYZsk6a7bo
	TgHCwWNYBILblnn3ZWg/EHflAYVkPGzdq410wOx9S+YTiwBtMoYCbT+csTqlPAtuWiZdD6
	pVXYRz1IT6C93DoFp03d/ihkwHzMZUfDqx3j0EB1cuX9FUQtSWAottxhno9n46Kz3Bfs7c
	LfHe4N7Bv7XVFbftc/4UwZkSoULxOEaZ19xgZGzxuLM8CN0Q/TxFnVujG8p8+w==
From: Louis Chauvet <louis.chauvet@bootlin.com>
Date: Tue, 15 Apr 2025 15:55:34 +0200
Subject: [PATCH v18 3/8] drm/vkms: Add range and encoding properties to the
 plane
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250415-yuv-v18-3-f2918f71ec4b@bootlin.com>
References: <20250415-yuv-v18-0-f2918f71ec4b@bootlin.com>
In-Reply-To: <20250415-yuv-v18-0-f2918f71ec4b@bootlin.com>
To: Melissa Wen <melissa.srw@gmail.com>, 
 =?utf-8?q?Ma=C3=ADra_Canal?= <mairacanal@riseup.net>, 
 Haneen Mohammed <hamohammed.sa@gmail.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, rdunlap@infradead.org, 
 arthurgrillo@riseup.net, Jonathan Corbet <corbet@lwn.net>, 
 pekka.paalanen@haloniitty.fi, Simona Vetter <simona@ffwll.ch>, 
 Rodrigo Siqueira <siqueira@igalia.com>, 
 Simona Vetter <simona.vetter@ffwll.ch>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 jeremie.dautheribes@bootlin.com, miquel.raynal@bootlin.com, 
 thomas.petazzoni@bootlin.com, seanpaul@google.com, marcheu@google.com, 
 nicolejadeyee@google.com, linux-doc@vger.kernel.org, 
 Louis Chauvet <louis.chauvet@bootlin.com>, 
 Pekka Paalanen <pekka.paalanen@collabora.com>
X-Mailer: b4 0.15-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=1253;
 i=louis.chauvet@bootlin.com; h=from:subject:message-id;
 bh=62SVKpGa01amnKiiY4w9DV/3kXdnVR+79LQVwQUm9n8=;
 b=owEBbQKS/ZANAwAIASCtLsZbECziAcsmYgBn/mVXZmrHFBT/Cc/Rb7U+9AeyRNqOzDBW8oyZ+
 3R8spDzzMaJAjMEAAEIAB0WIQRPj7g/vng8MQxQWQQgrS7GWxAs4gUCZ/5lVwAKCRAgrS7GWxAs
 4rvREACaBO7wgxyza86AZYLOuJjGQDDtR0/X0523My4qQRp6BnfrpxuKT0RhKokC1FuRH4AdmKl
 xeOVUHL6OO4Qivl0soBbS1IhkILrnWSwqQulatgYdB6pZaVbxmCpWvQB3PrI1bFRZZVSmCXhJ93
 xEEnZYM7WpeKy02HBlP4QIFUW1r3ve2IcVnt3CeD36UhvGkR3n3Hvd0Zl1oA3FvhVHIcuOOwX1i
 n3B4Cieejac0wZuQZqtbkIDEqSCg+drzwtLW3FQsgTyBK7y0ORrCANuNge/Pdewo6gboPCxv2P5
 wyiahvhSS+s3l6s9V1SX2qo1SpupR8Y/WULFyvCFks4dKm10waBCDWLpcDlFyXevMgbkL6tI5H9
 O1zYF4JKstQW7HY3wFktDUXcCFIiU0ecdAtxsblP0bop3+ExPHACsJQf6+BHv1JJSKoqSOnfe8Y
 paJai3u2gkwzuxujxUUDpbXNc6/iG296KEl9+eI3+WML7PKdMmLV8T70dRAExGvy2cqcKKa1V2e
 RLZsTY9qd06sT9fM5C6991QazRiR7j6EZc4x2yglT6iagm3XR8he6i2CinSxMehmlv846M8WGTk
 q8TVSdE9WwqU1YXAn7cZVnGHUqX4PZNwzZ46V+VI29bZ6ggZJrH08hfeUF2ax43IM/6ht9+YSBE
 n8OC5NAV05MItLg==
X-Developer-Key: i=louis.chauvet@bootlin.com; a=openpgp;
 fpr=8B7104AE9A272D6693F527F2EC1883F55E0B40A5
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgddvvdefieejucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefhfffugggtgffkfhgjvfevofesthejredtredtjeenucfhrhhomhepnfhouhhishcuvehhrghuvhgvthcuoehlohhuihhsrdgthhgruhhvvghtsegsohhothhlihhnrdgtohhmqeenucggtffrrghtthgvrhhnpeehtdejtddtteeiiefgleejkeetteevhfdukeegleffjeehgeeivefhgeduffdvvdenucfkphepledtrdekledrudeifedruddvjeenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpeeltddrkeelrdduieefrdduvdejpdhhvghloheplgdujedvrddukedrtddrudgnpdhmrghilhhfrhhomheplhhouhhishdrtghhrghuvhgvthessghoohhtlhhinhdrtghomhdpnhgspghrtghpthhtohepvdehpdhrtghpthhtohepshhimhhonhgrrdhvvghtthgvrhesfhhffihllhdrtghhpdhrtghpthhtohepughrihdquggvvhgvlheslhhishhtshdrfhhrvggvuggvshhkthhophdrohhrghdprhgtphhtthhopehthhhomhgrshdrphgvthgriiiiohhnihessghoohhtlhhinhdrtghomhdprhgtphhtthhopehmrghirhgrtggrnhgrlhesrhhishgvuhhprdhnvghtpdhrtghpthhtohepnhhitghol
 hgvjhgruggvhigvvgesghhoohhglhgvrdgtohhmpdhrtghpthhtohepshhimhhonhgrsehffhiflhhlrdgthhdprhgtphhtthhopehmrghrtghhvghusehgohhoghhlvgdrtghomhdprhgtphhtthhopehtiihimhhmvghrmhgrnhhnsehsuhhsvgdruggv
X-GND-Sasl: louis.chauvet@bootlin.com

From: Arthur Grillo <arthurgrillo@riseup.net>

Now that the driver internally handles these quantization ranges and YUV
encoding matrices, expose the UAPI for setting them.

Signed-off-by: Arthur Grillo <arthurgrillo@riseup.net>
[Louis Chauvet: retained only relevant parts, updated the commit message]
Acked-by: Pekka Paalanen <pekka.paalanen@collabora.com>
Signed-off-by: Louis Chauvet <louis.chauvet@bootlin.com>
---
 drivers/gpu/drm/vkms/vkms_plane.c | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/drivers/gpu/drm/vkms/vkms_plane.c b/drivers/gpu/drm/vkms/vkms_plane.c
index 6388928412f6..fbfbe424e558 100644
--- a/drivers/gpu/drm/vkms/vkms_plane.c
+++ b/drivers/gpu/drm/vkms/vkms_plane.c
@@ -219,5 +219,14 @@ struct vkms_plane *vkms_plane_init(struct vkms_device *vkmsdev,
 	drm_plane_create_rotation_property(&plane->base, DRM_MODE_ROTATE_0,
 					   DRM_MODE_ROTATE_MASK | DRM_MODE_REFLECT_MASK);
 
+	drm_plane_create_color_properties(&plane->base,
+					  BIT(DRM_COLOR_YCBCR_BT601) |
+					  BIT(DRM_COLOR_YCBCR_BT709) |
+					  BIT(DRM_COLOR_YCBCR_BT2020),
+					  BIT(DRM_COLOR_YCBCR_LIMITED_RANGE) |
+					  BIT(DRM_COLOR_YCBCR_FULL_RANGE),
+					  DRM_COLOR_YCBCR_BT601,
+					  DRM_COLOR_YCBCR_FULL_RANGE);
+
 	return plane;
 }

-- 
2.49.0


Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net [217.70.183.196])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B3C71A5B99;
	Tue, 15 Apr 2025 13:55:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.183.196
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744725350; cv=none; b=WNK070WgYoYZRO5OSTooeuQXF4ea7ZLtR4j4Imrl9uOlfNo29ANN1T/BpBT+1MqTCyZVtgGsPonqXlyoCbnxMdaydqIGQAVUiXqZTOpt+NMYndOM0f64A8aZAgO8RPRjVyWU8SAsH7GqFvM02G6Xc9Pug5Zpa1tN81bebPOZLm0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744725350; c=relaxed/simple;
	bh=oFZEeYV9E7SVwSiSnD5a6fJUQNr5BRcYxn1NNJcKmJ4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=K81l7w5lCAAu6n0ADRGv0DgZfmLOpYkc3UV2ItP2sKviYVQim7P6PNJ7u5MbzdFFBBQJkvdltW2TO+yG8miOWoijsbdWOguOIX5HZb7eA6cmSxu9ALs2t0YbDmksfUWSwP/tzg3CnTGDGcwvUv9xixXSJBuwvMRUOYhs3L7K0eU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=h16p2gHX; arc=none smtp.client-ip=217.70.183.196
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="h16p2gHX"
Received: by mail.gandi.net (Postfix) with ESMTPSA id 3BCC543B34;
	Tue, 15 Apr 2025 13:55:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1744725346;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=W/kxBS+R7AatRUaACkLiwnROBm8TvWT/gTUSAyzoqDo=;
	b=h16p2gHXzQNCgSJWhxKwugqErCfuCWAkC3D6bYeYUDthSR67fOdbo8Lpo3iH9Zkza+XdQF
	i8ALEVLE0cfwfFtPUEftAgz8/AcqcJv7nKcwS8LGu/ArWZbnUPhS3VWy4xlvkDxn4eLQFo
	WknukgwzaPEmO/XyGDPsjtacRi8AWqTQvh1gfeiL7+ITMJfx1fN2Jx1GTJZIwrtJ3/cHh0
	e7FNOWzX+nDL0NHpOWvU5yY4qeB77QT/iWfUyQ6CxwK250iWPzqRRhf9v1rd+xHN2mYCci
	uSPOL8/n/uzPgrixwXcIEndnwDDgkqgbHDnUXCifw7N2lUNrshTebHBsCvOyAA==
From: Louis Chauvet <louis.chauvet@bootlin.com>
Date: Tue, 15 Apr 2025 15:55:36 +0200
Subject: [PATCH v18 5/8] drm: Export symbols to use in tests
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250415-yuv-v18-5-f2918f71ec4b@bootlin.com>
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
 =?utf-8?q?Jos=C3=A9_Exp=C3=B3sito?= <jose.exposito89@gmail.com>
X-Mailer: b4 0.15-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=1321;
 i=louis.chauvet@bootlin.com; h=from:subject:message-id;
 bh=oFZEeYV9E7SVwSiSnD5a6fJUQNr5BRcYxn1NNJcKmJ4=;
 b=owEBbQKS/ZANAwAIASCtLsZbECziAcsmYgBn/mVXzaq5d/Otd49/nUx4n0o1bpU0gEVJfJEwj
 FqvNibXQw+JAjMEAAEIAB0WIQRPj7g/vng8MQxQWQQgrS7GWxAs4gUCZ/5lVwAKCRAgrS7GWxAs
 4vsUD/9vxX/9vJRhKpWbEDP+E1LsjZiq8xrofY3+sO5G1fxynS8kq84NTPo2ObielE7V1c1Smpq
 kskPPd+pAFd3NSwih7qfVh0Cr3lBRpwDbLRvIhmJz9FoSyFBtAvHV8oHJOIbZrsNeV575Mz5rK9
 lxY0gvB5HODEQ0I0uNK8xccWP9i6ULvPdJAtXcj46j4NQE/X5xYqpgE3kKVzsY15o/CZf0lwSNL
 bNScNtSuMCD6OHQ+xHkLpxNYReQWYKIKiezToECms++1bEp8TRm/ACLlLZho+Hlajfp62fviuoh
 Uyb4aTqClrZ4QIMFdnYyvxt7RefHw5BPEa92Eemp2mgh1HkslRZIO9nivw5L0ATrtoLKHPZEKKt
 cZzzYsIne+Xy14YLDG79BkJU4URt3qSmrTYC1XOV2Z2NuoaQEOLz5sWmwlOQt1QuTsFJJ/mtXeQ
 Hl3jTW+/LCtVzlgKM3G4VmMEh36hXXUzYbBmMaqfFPYqn6axExnxIdWvrRZ9dLPOGGYO8c94H4K
 X3mzG4wcoySsJbMc+Cp2CXz2hT95wC0B2EX4dSdiK99/vm0qieWf7xX2UoaOsgD7w7cTjwMyBb+
 t/vDDZ9JWnVNpH1YlLscS7Vm/MnoXQV5x5nA+gGzY+XZ2xBQ+qNQS9a7r8xijQYdjux3s/6Ox9B
 7v/wdyDw9WAU5ow==
X-Developer-Key: i=louis.chauvet@bootlin.com; a=openpgp;
 fpr=8B7104AE9A272D6693F527F2EC1883F55E0B40A5
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgddvvdefieejucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefhfffugggtgffkfhgjvfevofesthekredtredtjeenucfhrhhomhepnfhouhhishcuvehhrghuvhgvthcuoehlohhuihhsrdgthhgruhhvvghtsegsohhothhlihhnrdgtohhmqeenucggtffrrghtthgvrhhnpedtieevieduhedttdfgtefhuddufeffudetkeegveeuteduveehheeivedttddtkeenucfkphepledtrdekledrudeifedruddvjeenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpeeltddrkeelrdduieefrdduvdejpdhhvghloheplgdujedvrddukedrtddrudgnpdhmrghilhhfrhhomheplhhouhhishdrtghhrghuvhgvthessghoohhtlhhinhdrtghomhdpnhgspghrtghpthhtohepvdehpdhrtghpthhtohepshhimhhonhgrrdhvvghtthgvrhesfhhffihllhdrtghhpdhrtghpthhtohepughrihdquggvvhgvlheslhhishhtshdrfhhrvggvuggvshhkthhophdrohhrghdprhgtphhtthhopehthhhomhgrshdrphgvthgriiiiohhnihessghoohhtlhhinhdrtghomhdprhgtphhtthhopehmrghirhgrtggrnhgrlhesrhhishgvuhhprdhnvghtpdhrtghpthhtohepnhhitghol
 hgvjhgruggvhigvvgesghhoohhglhgvrdgtohhmpdhrtghpthhtohepshhimhhonhgrsehffhiflhhlrdgthhdprhgtphhtthhopehmrghrtghhvghusehgohhoghhlvgdrtghomhdprhgtphhtthhopehjohhsvgdrvgigphhoshhithhokeelsehgmhgrihhlrdgtohhm
X-GND-Sasl: louis.chauvet@bootlin.com

The functions drm_get_color_encoding_name and drm_get_color_range_name
are useful for clarifying test results. Therefore, export them so they
can be used in tests built as modules.

Reviewed-by: José Expósito <jose.exposito89@gmail.com>
Signed-off-by: Louis Chauvet <louis.chauvet@bootlin.com>
---
 drivers/gpu/drm/drm_color_mgmt.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/gpu/drm/drm_color_mgmt.c b/drivers/gpu/drm/drm_color_mgmt.c
index 3969dc548cff..b73a998352d1 100644
--- a/drivers/gpu/drm/drm_color_mgmt.c
+++ b/drivers/gpu/drm/drm_color_mgmt.c
@@ -28,6 +28,7 @@
 #include <drm/drm_device.h>
 #include <drm/drm_drv.h>
 #include <drm/drm_print.h>
+#include <kunit/visibility.h>
 
 #include "drm_crtc_internal.h"
 
@@ -494,6 +495,7 @@ const char *drm_get_color_encoding_name(enum drm_color_encoding encoding)
 
 	return color_encoding_name[encoding];
 }
+EXPORT_SYMBOL_IF_KUNIT(drm_get_color_encoding_name);
 
 /**
  * drm_get_color_range_name - return a string for color range
@@ -509,6 +511,7 @@ const char *drm_get_color_range_name(enum drm_color_range range)
 
 	return color_range_name[range];
 }
+EXPORT_SYMBOL_IF_KUNIT(drm_get_color_range_name);
 
 /**
  * drm_plane_create_color_properties - color encoding related plane properties

-- 
2.49.0


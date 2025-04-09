Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net [217.70.183.198])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 79799268C70;
	Wed,  9 Apr 2025 14:50:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.183.198
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744210259; cv=none; b=prWsEM2mPFnrcjS96a1ir5iuWjDKjmtH+cjHD6l4z0T00D6yxPaeSJ6oqDwV+roswYw/asfS5TsJSxCdkEE7VoD82bJQozoI9k3MMYJIQSdMkY1MGryxdIvFHNKcmGLdsmT4BP+aAoUkIMqffJHa/+DT6HJ9a0RrZiHiZbW3ltI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744210259; c=relaxed/simple;
	bh=76HRXjoVDNGV1BpLkLeHafjZmIL6Ps8NxucCDrQ1CqM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=tR2d5fTqQ9w/NtueGTWEJ554y2smavfdoytwkmqpUhTNbi64v32T293iK17179t7DqVTkHzvMq2pqrI4yZ0Zt7EedslRKEupQUdpk8TPTGObczEhj2YO6dZmITXoPiQPDIMUfhofz/FsemCeNnM7YAYhMyGGFGEuhgS9Gi5Ag10=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=ijoqRPOi; arc=none smtp.client-ip=217.70.183.198
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="ijoqRPOi"
Received: by mail.gandi.net (Postfix) with ESMTPSA id 70E024427E;
	Wed,  9 Apr 2025 14:50:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1744210249;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Mzm1JuGkocIsGBpNPmA5oKl0NqM4cvm2NKtV1oMF3eQ=;
	b=ijoqRPOijtHQVSqqM/gfbkTeRSVsd5eqPrGNS8JjT+DJ7aqdiD/GWWEdf7CCD2qkPsWZjD
	tH387B9pU4qb45sOs11AO0mrDCeMo6Mx0XBU3RYmdwUGoYiDNAEO6RrwBZ5spySJ49/QNZ
	k8WWYIhcCgego2JauCKR/6+zlNLb1/amQUjPIoYzqt+jdJo+L0FU6cZ5JZYd+W4UuGgnMI
	O8vLbnCDJpAK2vL5dFneqP80lKiuPpI7tViBgqgQQrmuOsC850B+ZU8o+6SaJMleMvUjaf
	oOlp5cDkRtVfkR/EJCbMCrs7O1P+8GCgStDURNjAHudBr5bx/EayYX+bq1ZTKA==
From: Luca Ceresoli <luca.ceresoli@bootlin.com>
Date: Wed, 09 Apr 2025 16:50:35 +0200
Subject: [PATCH v7 2/2] drm/tests: bridge: add a KUnit test for
 devm_drm_bridge_alloc()
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250409-drm-bridge-alloc-doc-test-v7-2-a3ca4b97597f@bootlin.com>
References: <20250409-drm-bridge-alloc-doc-test-v7-0-a3ca4b97597f@bootlin.com>
In-Reply-To: <20250409-drm-bridge-alloc-doc-test-v7-0-a3ca4b97597f@bootlin.com>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Jonathan Corbet <corbet@lwn.net>, Andrzej Hajda <andrzej.hajda@intel.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>
Cc: Anusha Srivatsa <asrivats@redhat.com>, 
 Paul Kocialkowski <paulk@sys-base.io>, Dmitry Baryshkov <lumag@kernel.org>, 
 =?utf-8?q?Herv=C3=A9_Codina?= <herve.codina@bootlin.com>, 
 Hui Pu <Hui.Pu@gehealthcare.com>, 
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 dri-devel@lists.freedesktop.org, linux-doc@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Luca Ceresoli <luca.ceresoli@bootlin.com>
X-Mailer: b4 0.14.2
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgddvtdeivdelucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefhfffugggtgffkfhgjvfevofesthejredtredtjeenucfhrhhomhepnfhutggrucevvghrvghsohhlihcuoehluhgtrgdrtggvrhgvshholhhisegsohhothhlihhnrdgtohhmqeenucggtffrrghtthgvrhhnpeeiieeuvdfftefgueduleehueetgffgjeeitedtteetkeeuueeuueekveevvdeuveenucfkphepvdgrtddvmeeijedtmedvtddvtdemvggrtddumegsvgegudemleehvgejmeefgeefmeeludefvgenucevlhhushhtvghrufhiiigvpedunecurfgrrhgrmhepihhnvghtpedvrgdtvdemieejtdemvddtvddtmegvrgdtudemsggvgedumeelhegvjeemfeegfeemledufegvpdhhvghloheplgduledvrdduieekrddujeekrdduudekngdpmhgrihhlfhhrohhmpehluhgtrgdrtggvrhgvshholhhisegsohhothhlihhnrdgtohhmpdhnsggprhgtphhtthhopedvvddprhgtphhtthhopehlihhnuhigqdhkvghrnhgvlhesvhhgvghrrdhkvghrnhgvlhdrohhrghdprhgtphhtthhopefnrghurhgvnhhtrdhpihhntghhrghrthesihguvggrshhonhgsohgrrhgurdgtohhmpdhrtghpthhtohepnhgvihhlrdgrrhhms
 hhtrhhonhhgsehlihhnrghrohdrohhrghdprhgtphhtthhopegrnhgurhiivghjrdhhrghjuggrsehinhhtvghlrdgtohhmpdhrtghpthhtohepthhhohhmrghsrdhpvghtrgiiiihonhhisegsohhothhlihhnrdgtohhmpdhrtghpthhtohepjfhuihdrrfhusehgvghhvggrlhhthhgtrghrvgdrtghomhdprhgtphhtthhopehluhhmrghgsehkvghrnhgvlhdrohhrghdprhgtphhtthhopehrfhhoshhssehkvghrnhgvlhdrohhrgh
X-GND-Sasl: luca.ceresoli@bootlin.com

Add a basic KUnit test for the newly introduced drm_bridge_alloc().

Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>

---

Changed in v7:
 - rebase on current drm-misc-next, which now has a drm_bridge_test.c file
 - cleanup commit message

Changed in v6:
 - update to new devm_drm_bridge_alloc() API
 - remove drm_test_drm_bridge_put test, not straightforward to write with
   the new API and the current notification mechanism
 - do not allocate a drm_device: a bridge is allocated without one
 - rename some identifiers for easier code reading

This patch was added in v5.
---
 drivers/gpu/drm/tests/drm_bridge_test.c | 60 +++++++++++++++++++++++++++++++++
 1 file changed, 60 insertions(+)

diff --git a/drivers/gpu/drm/tests/drm_bridge_test.c b/drivers/gpu/drm/tests/drm_bridge_test.c
index ff88ec2e911c9cc9a718483f09d4c764f45f991a..87fb64744b67f0780457a546aba77ba945a0ce67 100644
--- a/drivers/gpu/drm/tests/drm_bridge_test.c
+++ b/drivers/gpu/drm/tests/drm_bridge_test.c
@@ -8,6 +8,7 @@
 #include <drm/drm_bridge_helper.h>
 #include <drm/drm_kunit_helpers.h>
 
+#include <kunit/device.h>
 #include <kunit/test.h>
 
 struct drm_bridge_init_priv {
@@ -407,11 +408,70 @@ static struct kunit_suite drm_bridge_helper_reset_crtc_test_suite = {
 	.test_cases = drm_bridge_helper_reset_crtc_tests,
 };
 
+struct drm_bridge_alloc_test_ctx {
+	struct device *dev;
+};
+
+/*
+ * Mimick the typical struct defined by a bridge driver, which embeds a
+ * bridge plus other fields.
+ */
+struct dummy_drm_bridge {
+	int dummy; // ensure we test non-zero @bridge offset
+	struct drm_bridge bridge;
+};
+
+static const struct drm_bridge_funcs drm_bridge_dummy_funcs = {
+};
+
+static int drm_test_bridge_alloc_init(struct kunit *test)
+{
+	struct drm_bridge_alloc_test_ctx *ctx;
+
+	ctx = kunit_kzalloc(test, sizeof(*ctx), GFP_KERNEL);
+	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, ctx);
+
+	ctx->dev = kunit_device_register(test, "drm-bridge-dev");
+	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, ctx->dev);
+
+	test->priv = ctx;
+
+	return 0;
+}
+
+/*
+ * Test that the allocation and initialization of a bridge works as
+ * expected and doesn't report any error.
+ */
+static void drm_test_drm_bridge_alloc(struct kunit *test)
+{
+	struct drm_bridge_alloc_test_ctx *ctx = test->priv;
+	struct dummy_drm_bridge *dummy;
+
+	dummy = devm_drm_bridge_alloc(ctx->dev, struct dummy_drm_bridge, bridge,
+				      &drm_bridge_dummy_funcs);
+	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, dummy);
+}
+
+static struct kunit_case drm_bridge_alloc_tests[] = {
+	KUNIT_CASE(drm_test_drm_bridge_alloc),
+	{ }
+};
+
+static struct kunit_suite drm_bridge_alloc_test_suite = {
+	.name = "drm_bridge_alloc",
+	.init = drm_test_bridge_alloc_init,
+	.test_cases = drm_bridge_alloc_tests,
+};
+
 kunit_test_suites(
 	&drm_bridge_get_current_state_test_suite,
 	&drm_bridge_helper_reset_crtc_test_suite,
+	&drm_bridge_alloc_test_suite,
 );
 
 MODULE_AUTHOR("Maxime Ripard <mripard@kernel.org>");
+MODULE_AUTHOR("Luca Ceresoli <luca.ceresoli@bootlin.com>");
+
 MODULE_DESCRIPTION("Kunit test for drm_bridge functions");
 MODULE_LICENSE("GPL");

-- 
2.49.0


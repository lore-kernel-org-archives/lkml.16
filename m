Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net [217.70.183.193])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D56528541A
	for <linux-kernel@vger.kernel.org>; Fri,  6 Jun 2025 08:42:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.183.193
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749199331; cv=none; b=tqDJEM9Xfpox2OnosSN/HAL8E5UuD7SGuOIo1fVr3fzpIk8e6hkjbzw+fH/YjTAwZZKpv/YjCGJxPBejV7rHVLbe1tCVa4/1A6nVTT8CFNcReqQaVm8gJ0x8UL9zFt877Sek2xAKJhl6VAwB8pt9f2+dHJ1SqxD6ES5Vk+GFWuI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749199331; c=relaxed/simple;
	bh=BbIj2J9SR8Ka+7Zf1yomdd+iUAyaUoWm2Ob9fhBjprI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=NrGmwU6ZY6ZyEhHQsRXBuX2RKmBmnoI9sKZxD3l+PJRxNQ1a74ziqmqP7SpuMRO7bgwGt8DcHL+yTWTDqGNG9/F6mxpieiulLlisoTyWT/cLXKjNRr9wWsmFBVlrz2UTXMTGuieNj8eqwsXPVri/XMjo2eO150Exy4vHfXIhOpI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=L18DBCcG; arc=none smtp.client-ip=217.70.183.193
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="L18DBCcG"
Received: by mail.gandi.net (Postfix) with ESMTPSA id E4061432D3;
	Fri,  6 Jun 2025 08:41:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1749199327;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=h2xxTLBglWDu+FJJp44/DHWzVBza00v+40GwPIA7+3I=;
	b=L18DBCcGWT6F1lLa+RDPA7nRK1/NmJQcUdRp2ywikpAMTuDcrEHdFUgeW0HiZAFEILrobr
	oX9+Npy9q11fYamfIbyc8fV72rOuDmobUSlxGrD15V7MxTGTRmXNYFVz7SPFfrgwK/5g02
	h3S4X2jS29zLExcuXhLbHkhkmeVaKYYbdoERH76y82kE8j1ABtOfnSJYVw76BnOAmp6stz
	+mBoIHeZFGqI0SSxYNWSBniYauieiXqcdWTlE8ZRK1L4/xxP2yVIrvUcnAFU9CRB6tLLyK
	TsRg2cA0QOOyLXFRwVxVWRxvAPhdmJK2l40bhRLvPx9TDYZDim6j7WVEA0rvHQ==
From: Luca Ceresoli <luca.ceresoli@bootlin.com>
Date: Fri, 06 Jun 2025 10:41:21 +0200
Subject: [PATCH v9 3/3] drm/tests: bridge: add KUnit tests for
 devm_drm_bridge_alloc()
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250606-drm-bridge-alloc-doc-test-v9-3-b5bf7b43ed92@bootlin.com>
References: <20250606-drm-bridge-alloc-doc-test-v9-0-b5bf7b43ed92@bootlin.com>
In-Reply-To: <20250606-drm-bridge-alloc-doc-test-v9-0-b5bf7b43ed92@bootlin.com>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Andrzej Hajda <andrzej.hajda@intel.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>
Cc: Anusha Srivatsa <asrivats@redhat.com>, 
 Paul Kocialkowski <paulk@sys-base.io>, Dmitry Baryshkov <lumag@kernel.org>, 
 =?utf-8?q?Herv=C3=A9_Codina?= <herve.codina@bootlin.com>, 
 Hui Pu <Hui.Pu@gehealthcare.com>, 
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 Luca Ceresoli <luca.ceresoli@bootlin.com>
X-Mailer: b4 0.14.2
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtddugdegkeehucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefhfffugggtgffkfhgjvfevofesthejredtredtjeenucfhrhhomhepnfhutggrucevvghrvghsohhlihcuoehluhgtrgdrtggvrhgvshholhhisegsohhothhlihhnrdgtohhmqeenucggtffrrghtthgvrhhnpeeiieeuvdfftefgueduleehueetgffgjeeitedtteetkeeuueeuueekveevvdeuveenucfkphepfeejrdduiedvrdduvdefrdehvdenucevlhhushhtvghrufhiiigvpedunecurfgrrhgrmhepihhnvghtpeefjedrudeivddruddvfedrhedvpdhhvghloheplgduledvrdduieekrddvhedvrddvfeehngdpmhgrihhlfhhrohhmpehluhgtrgdrtggvrhgvshholhhisegsohhothhlihhnrdgtohhmpdhnsggprhgtphhtthhopedvtddprhgtphhtthhopefnrghurhgvnhhtrdhpihhntghhrghrthesihguvggrshhonhgsohgrrhgurdgtohhmpdhrtghpthhtoheplhhumhgrgheskhgvrhhnvghlrdhorhhgpdhrtghpthhtoheprghsrhhivhgrthhssehrvgguhhgrthdrtghomhdprhgtphhtthhopehrfhhoshhssehkvghrnhgvlhdrohhrghdprhgtphhtthhopehluhgtrgdrtggvrhgvshholhhisegsohhothhli
 hhnrdgtohhmpdhrtghpthhtohepthhhohhmrghsrdhpvghtrgiiiihonhhisegsohhothhlihhnrdgtohhmpdhrtghpthhtohepjfhuihdrrfhusehgvghhvggrlhhthhgtrghrvgdrtghomhdprhgtphhtthhopegrnhgurhiivghjrdhhrghjuggrsehinhhtvghlrdgtohhm
X-GND-Sasl: luca.ceresoli@bootlin.com

Add KUnit tests for the newly introduced devm_drm_bridge_alloc().

Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>

---

Changed in v9:
 - fold drm_bridge_alloc_test_ctx into drm_bridge_init_priv (do not
   introduce another test context struct specific to alloc tests)
 - use the existing func sets for .destroy (do not introduce another struct
   drm_ridge_funcs specific to alloc tests)
 - adapt existing tests accordingly by setting .data, to allow .destroy to
   work
 - rename 'ctx' variables to 'priv'
 - add comment describing new tests
 - use KUNIT_EXPECT_TRUE instead of KUNIT_ASSERT_TRUE where applicable

Changed in v8:
 - rebase on new patch converting drm_bridge_test.c to
   devm_drm_bridge_alloc()
 - add check that bridge is removed (thanks to the .destroy callback)
 - add a check with get/put

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
 drivers/gpu/drm/tests/drm_bridge_test.c | 89 +++++++++++++++++++++++++++++++++
 1 file changed, 89 insertions(+)

diff --git a/drivers/gpu/drm/tests/drm_bridge_test.c b/drivers/gpu/drm/tests/drm_bridge_test.c
index af1b9f9694b0091e6eaef78cb71e39327ad8c3fa..887020141c7f42b5ae74655f9544c224d3b07605 100644
--- a/drivers/gpu/drm/tests/drm_bridge_test.c
+++ b/drivers/gpu/drm/tests/drm_bridge_test.c
@@ -8,6 +8,7 @@
 #include <drm/drm_bridge_helper.h>
 #include <drm/drm_kunit_helpers.h>
 
+#include <kunit/device.h>
 #include <kunit/test.h>
 
 /*
@@ -21,15 +22,19 @@ struct drm_bridge_priv {
 	unsigned int enable_count;
 	unsigned int disable_count;
 	struct drm_bridge bridge;
+	void *data;
 };
 
 struct drm_bridge_init_priv {
 	struct drm_device drm;
+	/** @dev: device, only for tests not needing a whole drm_device */
+	struct device *dev;
 	struct drm_plane *plane;
 	struct drm_crtc *crtc;
 	struct drm_encoder encoder;
 	struct drm_bridge_priv *test_bridge;
 	struct drm_connector *connector;
+	bool destroyed;
 };
 
 static struct drm_bridge_priv *bridge_to_priv(struct drm_bridge *bridge)
@@ -37,6 +42,14 @@ static struct drm_bridge_priv *bridge_to_priv(struct drm_bridge *bridge)
 	return container_of(bridge, struct drm_bridge_priv, bridge);
 }
 
+static void drm_test_bridge_priv_destroy(struct drm_bridge *bridge)
+{
+	struct drm_bridge_priv *bridge_priv = bridge_to_priv(bridge);
+	struct drm_bridge_init_priv *priv = (struct drm_bridge_init_priv *)bridge_priv->data;
+
+	priv->destroyed = true;
+}
+
 static void drm_test_bridge_enable(struct drm_bridge *bridge)
 {
 	struct drm_bridge_priv *priv = bridge_to_priv(bridge);
@@ -52,6 +65,7 @@ static void drm_test_bridge_disable(struct drm_bridge *bridge)
 }
 
 static const struct drm_bridge_funcs drm_test_bridge_legacy_funcs = {
+	.destroy		= drm_test_bridge_priv_destroy,
 	.enable			= drm_test_bridge_enable,
 	.disable		= drm_test_bridge_disable,
 };
@@ -73,6 +87,7 @@ static void drm_test_bridge_atomic_disable(struct drm_bridge *bridge,
 }
 
 static const struct drm_bridge_funcs drm_test_bridge_atomic_funcs = {
+	.destroy		= drm_test_bridge_priv_destroy,
 	.atomic_enable		= drm_test_bridge_atomic_enable,
 	.atomic_disable		= drm_test_bridge_atomic_disable,
 	.atomic_destroy_state	= drm_atomic_helper_bridge_destroy_state,
@@ -118,6 +133,8 @@ drm_test_bridge_init(struct kunit *test, const struct drm_bridge_funcs *funcs)
 	if (IS_ERR(priv->test_bridge))
 		return ERR_CAST(priv->test_bridge);
 
+	priv->test_bridge->data = priv;
+
 	drm = &priv->drm;
 	priv->plane = drm_kunit_helper_create_primary_plane(test, drm,
 							    NULL,
@@ -422,11 +439,83 @@ static struct kunit_suite drm_bridge_helper_reset_crtc_test_suite = {
 	.test_cases = drm_bridge_helper_reset_crtc_tests,
 };
 
+static int drm_test_bridge_alloc_init(struct kunit *test)
+{
+	struct drm_bridge_init_priv *priv;
+
+	priv = kunit_kzalloc(test, sizeof(*priv), GFP_KERNEL);
+	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, priv);
+
+	priv->dev = kunit_device_register(test, "drm-bridge-dev");
+	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, priv->dev);
+
+	test->priv = priv;
+
+	priv->test_bridge = devm_drm_bridge_alloc(priv->dev, struct drm_bridge_priv, bridge,
+						  &drm_test_bridge_atomic_funcs);
+	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, priv->test_bridge);
+
+	priv->test_bridge->data = priv;
+
+	KUNIT_ASSERT_FALSE(test, priv->destroyed);
+
+	return 0;
+}
+
+/*
+ * Test that a bridge is freed when the device is destroyed in lack of
+ * other drm_bridge_get/put() operations.
+ */
+static void drm_test_drm_bridge_alloc_basic(struct kunit *test)
+{
+	struct drm_bridge_init_priv *priv = test->priv;
+
+	KUNIT_ASSERT_FALSE(test, priv->destroyed);
+
+	kunit_device_unregister(test, priv->dev);
+	KUNIT_EXPECT_TRUE(test, priv->destroyed);
+}
+
+/*
+ * Test that a bridge is not freed when the device is destroyed when there
+ * is still a reference to it, and freed when that reference is put.
+ */
+static void drm_test_drm_bridge_alloc_get_put(struct kunit *test)
+{
+	struct drm_bridge_init_priv *priv = test->priv;
+
+	KUNIT_ASSERT_FALSE(test, priv->destroyed);
+
+	drm_bridge_get(&priv->test_bridge->bridge);
+	KUNIT_EXPECT_FALSE(test, priv->destroyed);
+
+	kunit_device_unregister(test, priv->dev);
+	KUNIT_EXPECT_FALSE(test, priv->destroyed);
+
+	drm_bridge_put(&priv->test_bridge->bridge);
+	KUNIT_EXPECT_TRUE(test, priv->destroyed);
+}
+
+static struct kunit_case drm_bridge_alloc_tests[] = {
+	KUNIT_CASE(drm_test_drm_bridge_alloc_basic),
+	KUNIT_CASE(drm_test_drm_bridge_alloc_get_put),
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


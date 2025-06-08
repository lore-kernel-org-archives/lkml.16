Received: from fhigh-b1-smtp.messagingengine.com (fhigh-b1-smtp.messagingengine.com [202.12.124.152])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D2F0B25B676
	for <linux-kernel@vger.kernel.org>; Sun,  8 Jun 2025 23:38:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.12.124.152
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749425900; cv=none; b=eQN3IkIkImun4rkSUKYx2Y6g3yWJHCD7MgCV2BTOsdmNulFrOQu1f0bYAUayG0jefH0tG7cT9DAIl6iqkEPnVaBqcAaId4usRkR6uIjcV/9BiPFnsTRrf7cWOQOktwbem8aF/QLSBGD3pkNCFoqjy77paBky8MlO7gUjmgNZY+c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749425900; c=relaxed/simple;
	bh=2OQsa/8XWmlezeyDpvGSzOtxViqZPNAHZ2pL+CFQBgs=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=ZSik/LsVOuTeF7LBLxMzjJORBc+vKFfsDXNZbc1hOvNceE6aAilga32tLbRG1DYU9SAf3VrgTFon2HoFhvAyAwfY+FzDdlK8uUyb18aqdzaJT3rAJtWDNTX9G94ufcCV3LgyaoYYz06QQC7eqm7DA710JqWYM9C7/fkJaiu3kQE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sakamocchi.jp; spf=pass smtp.mailfrom=sakamocchi.jp; dkim=pass (2048-bit key) header.d=sakamocchi.jp header.i=@sakamocchi.jp header.b=jYkJvtpG; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=QWKzXxd6; arc=none smtp.client-ip=202.12.124.152
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sakamocchi.jp
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sakamocchi.jp
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sakamocchi.jp header.i=@sakamocchi.jp header.b="jYkJvtpG";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="QWKzXxd6"
Received: from phl-compute-05.internal (phl-compute-05.phl.internal [10.202.2.45])
	by mailfhigh.stl.internal (Postfix) with ESMTP id E2E12254012F;
	Sun,  8 Jun 2025 19:38:16 -0400 (EDT)
Received: from phl-mailfrontend-02 ([10.202.2.163])
  by phl-compute-05.internal (MEProxy); Sun, 08 Jun 2025 19:38:16 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sakamocchi.jp;
	 h=cc:cc:content-transfer-encoding:content-type:date:date:from
	:from:in-reply-to:message-id:mime-version:reply-to:subject
	:subject:to:to; s=fm1; t=1749425896; x=1749512296; bh=GbIGUnPtCO
	9kjBkbLFb+AInQm9K2WKd09jQ0+zdJnfE=; b=jYkJvtpG5y8Lvq03+GYZLBSNsC
	v16hGQ0f38/s88I29yTeLebUgBf5os/VHkujQkdRZtzVOvis0pDv/c+UuF2w4Pf+
	r3cXYdZzTqEuhrCsV0smrt1VgLZrBVw4JnafK1WXeBx21rKabkrvHE4gKDsGpNyW
	FXWtkkC0nvKSWZS/qH0Sosb4wI0uzcrUCviczwVQndjMUNRi9uFUzxevkBRfVHaJ
	q2Em8dJgkEn37XPkBT6MRW4oRpwQGKqdgYKGp7wgw4ZKWL1dd4ZIAg3cbH0X/uhv
	cl1qGKD1DAqE1y7hhk+zh1MZnBAoQ1cCXdBM4MwtOgeL57QZhuZ9zvYZACdQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:date:date:feedback-id:feedback-id:from:from
	:in-reply-to:message-id:mime-version:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=
	1749425896; x=1749512296; bh=GbIGUnPtCO9kjBkbLFb+AInQm9K2WKd09jQ
	0+zdJnfE=; b=QWKzXxd6VEtBrrJlo8z/lweKkHFWfl4GpabBQSAVR197rYK/h2t
	Xh/2jVxueKRGMbcYJdg1KlOOn7AUA2gMGsGJ9oxCydJ7AZTVP6vnEL1XUYE/U0I6
	bYSWw35GNuTnFtyV6rZeMaA8QtLkLGzB5XLx9TsRP2n4ZHuNde7HMhP9yq56OJeI
	JkaSmhXDCvTUokrgOVDv/WuwSYIFa9RRoK+iK9A987kbwngB3+pz6O0EDJaLVIi/
	c06xlBr5XMgDdQnTBl70AwjUoDLSyOvuhUIiDeEY/0XzkswDBa2pU91DfFvMPXTx
	TnC+1FW3uDHftioKvFMkVK89OnLEurdpeWg==
X-ME-Sender: <xms:6B5GaIGJYR00TUpwxsEkyxyfgQWofkk8WAPAGJtGAa-46CXG9E2vFQ>
    <xme:6B5GaBWO8wwMKZAiwzQ_ehzl9Zh6hhDCq-_QQS4Kj6k3Gr8B7FY_CmVoGl955LZal
    YfHDPB5X3EqmCSwOYE>
X-ME-Received: <xmr:6B5GaCK1Fn6L8EPVtKEey3d1d6Sbu7rGHJ4iVqYDw8O1ovzHq4DEPWiaXx3x1inyf5bQijSa3A60MMvqccmqolGU4Lg4TzvyEo6Y6EpNu7TXUcA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtddugdekhedvucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdggtfgfnhhsuhgsshgtrhhisggvpdfu
    rfetoffkrfgpnffqhgenuceurghilhhouhhtmecufedttdenucenucfjughrpefhvfevuf
    ffkffoggfgsedtkeertdertddtnecuhfhrohhmpefvrghkrghshhhiucfurghkrghmohht
    ohcuoehoqdhtrghkrghshhhisehsrghkrghmohgttghhihdrjhhpqeenucggtffrrghtth
    gvrhhnpeffvdeuleffveekudfhteejudffgefhtedtgfeutdfgvdfgueefudehveehveek
    keenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehoqd
    htrghkrghshhhisehsrghkrghmohgttghhihdrjhhppdhnsggprhgtphhtthhopedvpdhm
    ohguvgepshhmthhpohhuthdprhgtphhtthhopehlihhnuhigudefleegqdguvghvvghlse
    hlihhsthhsrdhsohhurhgtvghfohhrghgvrdhnvghtpdhrtghpthhtoheplhhinhhugidq
    khgvrhhnvghlsehvghgvrhdrkhgvrhhnvghlrdhorhhg
X-ME-Proxy: <xmx:6B5GaKEXo9JcnWtKpF6f0jx_Wwh-MYXBAciMDGo5pRs9P1u4g13sAw>
    <xmx:6B5GaOV5W9mL4Vp9OWFsvNSjuzNGwRJkuYhhuWHZzQ_XKZpEa4ijMA>
    <xmx:6B5GaNNAeTFbc20iayuFtl0zQnVWeabc-KfOwKw7nzi5abJikVJGng>
    <xmx:6B5GaF29_y--jvbFofcwPzRKtdVh8_8igl8sMio6EXaWG8ylUOp3LQ>
    <xmx:6B5GaKnv0kmuXZykbuzcpMUxoXxyTfW49UF8PEYHmWtY5qNM2eFqjXPR>
Feedback-ID: ie8e14432:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Sun,
 8 Jun 2025 19:38:15 -0400 (EDT)
From: Takashi Sakamoto <o-takashi@sakamocchi.jp>
To: linux1394-devel@lists.sourceforge.net
Cc: linux-kernel@vger.kernel.org
Subject: [PATCH] firewire: core: use from_work() macro to expand parent structure of work_struct
Date: Mon,  9 Jun 2025 08:38:08 +0900
Message-ID: <20250608233808.202355-3-o-takashi@sakamocchi.jp>
X-Mailer: git-send-email 2.48.1
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

A commit 60b2ebf48526 ("workqueue: Introduce from_work() helper for cleaner
callback declarations") introduces a new macro to retrieve a poiner for the
parent structure of the work item. It is convenient to reduce input text.

This commit uses the macro in core functionalities.

Signed-off-by: Takashi Sakamoto <o-takashi@sakamocchi.jp>
---
 drivers/firewire/core-card.c   |  4 ++--
 drivers/firewire/core-cdev.c   |  3 +--
 drivers/firewire/core-device.c | 15 +++++----------
 3 files changed, 8 insertions(+), 14 deletions(-)

diff --git a/drivers/firewire/core-card.c b/drivers/firewire/core-card.c
index 01354b9de8b2..2b6ad47b6d57 100644
--- a/drivers/firewire/core-card.c
+++ b/drivers/firewire/core-card.c
@@ -237,7 +237,7 @@ EXPORT_SYMBOL(fw_schedule_bus_reset);
 
 static void br_work(struct work_struct *work)
 {
-	struct fw_card *card = container_of(work, struct fw_card, br_work.work);
+	struct fw_card *card = from_work(card, work, br_work.work);
 
 	/* Delay for 2s after last reset per IEEE 1394 clause 8.2.1. */
 	if (card->reset_jiffies != 0 &&
@@ -286,7 +286,7 @@ void fw_schedule_bm_work(struct fw_card *card, unsigned long delay)
 
 static void bm_work(struct work_struct *work)
 {
-	struct fw_card *card = container_of(work, struct fw_card, bm_work.work);
+	struct fw_card *card = from_work(card, work, bm_work.work);
 	struct fw_device *root_device, *irm_device;
 	struct fw_node *root_node;
 	int root_id, new_root_id, irm_id, bm_id, local_id;
diff --git a/drivers/firewire/core-cdev.c b/drivers/firewire/core-cdev.c
index bd04980009a4..78b10c6ef7fe 100644
--- a/drivers/firewire/core-cdev.c
+++ b/drivers/firewire/core-cdev.c
@@ -1313,8 +1313,7 @@ static int ioctl_get_cycle_timer(struct client *client, union ioctl_arg *arg)
 static void iso_resource_work(struct work_struct *work)
 {
 	struct iso_resource_event *e;
-	struct iso_resource *r =
-			container_of(work, struct iso_resource, work.work);
+	struct iso_resource *r = from_work(r, work, work.work);
 	struct client *client = r->client;
 	unsigned long index = r->resource.handle;
 	int generation, channel, bandwidth, todo;
diff --git a/drivers/firewire/core-device.c b/drivers/firewire/core-device.c
index ec3e21ad2025..aeacd4cfd694 100644
--- a/drivers/firewire/core-device.c
+++ b/drivers/firewire/core-device.c
@@ -853,8 +853,7 @@ static void fw_schedule_device_work(struct fw_device *device,
 
 static void fw_device_shutdown(struct work_struct *work)
 {
-	struct fw_device *device =
-		container_of(work, struct fw_device, work.work);
+	struct fw_device *device = from_work(device, work, work.work);
 
 	if (time_before64(get_jiffies_64(),
 			  device->card->reset_jiffies + SHUTDOWN_DELAY)
@@ -921,8 +920,7 @@ static int update_unit(struct device *dev, void *data)
 
 static void fw_device_update(struct work_struct *work)
 {
-	struct fw_device *device =
-		container_of(work, struct fw_device, work.work);
+	struct fw_device *device = from_work(device, work, work.work);
 
 	fw_device_cdev_update(device);
 	device_for_each_child(&device->device, NULL, update_unit);
@@ -1002,8 +1000,7 @@ static int compare_configuration_rom(struct device *dev, const void *data)
 
 static void fw_device_init(struct work_struct *work)
 {
-	struct fw_device *device =
-		container_of(work, struct fw_device, work.work);
+	struct fw_device *device = from_work(device, work, work.work);
 	struct fw_card *card = device->card;
 	struct device *found;
 	u32 minor;
@@ -1184,8 +1181,7 @@ static int reread_config_rom(struct fw_device *device, int generation,
 
 static void fw_device_refresh(struct work_struct *work)
 {
-	struct fw_device *device =
-		container_of(work, struct fw_device, work.work);
+	struct fw_device *device = from_work(device, work, work.work);
 	struct fw_card *card = device->card;
 	int ret, node_id = device->node_id;
 	bool changed;
@@ -1251,8 +1247,7 @@ static void fw_device_refresh(struct work_struct *work)
 
 static void fw_device_workfn(struct work_struct *work)
 {
-	struct fw_device *device = container_of(to_delayed_work(work),
-						struct fw_device, work);
+	struct fw_device *device = from_work(device, to_delayed_work(work), work);
 	device->workfn(work);
 }
 
-- 
2.48.1


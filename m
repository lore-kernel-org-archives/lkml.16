Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com [209.85.214.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8A74E2571C1
	for <linux-kernel@vger.kernel.org>; Sun, 11 May 2025 13:40:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746970857; cv=none; b=BEBAVP5wfTTMOweEAWGO1XIPnGMpm7lmtBVpWK/vhoh3t9C8mBUcpzyj/Dkl9WW4C5yw0AABzPQBKx6Ymnugf2aSdoD8QVQTNQ+QbdGL2w48yEOXgYSIXH4XPO2e58i5/EhdZEHLYlba3ZrkUWW6wVMKnyDmUm98FsK18dLJxac=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746970857; c=relaxed/simple;
	bh=g2XqVbxqcV7WBB8IUvgJxiIMFjUcEpNuvTGW42Cuh18=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=FK/gmf0Bou4GX2WAVvUCAGVjUhNBA/LVdxRtbQonixIDFX1gljNN6JpPWxAn/oSh4O+8I6jBQlSGuJThKPMMpkqCTlct9lK0TOewdaU5cT+0bImHtss3j7CpYCoWlx5/2NqAZMuLFZsQhP2ZhW1MjiUXk11XW7m3N+CL0H+x3Ik=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ventanamicro.com; spf=pass smtp.mailfrom=ventanamicro.com; dkim=pass (2048-bit key) header.d=ventanamicro.com header.i=@ventanamicro.com header.b=agRozwxs; arc=none smtp.client-ip=209.85.214.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ventanamicro.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ventanamicro.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ventanamicro.com header.i=@ventanamicro.com header.b="agRozwxs"
Received: by mail-pl1-f172.google.com with SMTP id d9443c01a7336-22e5df32197so36243225ad.0
        for <linux-kernel@vger.kernel.org>; Sun, 11 May 2025 06:40:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1746970855; x=1747575655; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4cUhTlBPCx/RyxrDK4rJSeeuJgXjq8E3p5DHEKMIX0g=;
        b=agRozwxseeyxTujk5njOVXzxEJmEF8kktN1V2P2myqsT6G/9Otl0IgP9LRxDc22048
         xCXKinziqADqNxgeetjNSfFPFQrVrI6o2pG0Lb91C4L4ZvRoJljDRr7Sx1Kn7pjnNLs/
         rLu8+U4PJPd5abzKth5Ulq45h6U99+2Fdlt2xDqbOs5xXc3cmr/Kn7KkebRWf/uy1J1J
         EY72yLZtr/WlUr/A8ESrj4qAMXpN2RsaiOs8HZ1JXEvg4NKUklR4yhX+1/ioMzji5kSC
         v1O7gxEbXcboDmv8bQFXuwzImx+UWOzVYaasa+ufJwqXO0xr+3yXDIxOSLUfxipuV+WK
         xf8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746970855; x=1747575655;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=4cUhTlBPCx/RyxrDK4rJSeeuJgXjq8E3p5DHEKMIX0g=;
        b=EPbca5emK2CAysESsihQjoA01xTa1A8LkbKXuzuXX/geP7LlsgIcz4RFa3u8u+V3bF
         sU5vkPxLH1Kfa/onzbpS2MLJmdNiuLNSKbC660yokEmPKUcKkCAYbdaeB7bK+dluLLWj
         6lMV5RpTG8tpYW2D/rydW4YSIAOzsBe84eM9moWCrdiFC3lSrIY+bWQkt6TEDmW0dTNN
         H4Z8kZwHNYnWLQT5v1TBvz3dClQQ7wdzLWaXB2cxm7m94mDl9c+xLS9WsOxEu4gr0pxJ
         Mqt30FvD5s1r1SFhgj62L2Xa+nncwlIABzDUp+MbpXjmF45EZrbylsR5odgZ7kC5vQK4
         A0Kg==
X-Forwarded-Encrypted: i=1; AJvYcCUkO40sexYYZUcipZYN1pIg7YprbWzIBiHhsoKQIJkrSl1YVW+5RxEeann+5tsNtNOGziSvExCe/26dEW4=@vger.kernel.org
X-Gm-Message-State: AOJu0YxsitvjrOILXUMs8JzXYx5vVDlr8ne8EjNq4MRecLc5xywWhOLN
	74w6/RvCzrgM0ZitPbJHG+XsP5mJ+wCIYMN+Od7Hc+DA3Q9cHPd0hO6SECOze/U=
X-Gm-Gg: ASbGncsaIXf8HIO0G2htNs//BrVdDKBP+KxuU+2VRyd++IeuTE6VxA646dS3TlAOjYK
	De3A8+ZFh38EllqzIlmJsZ/n+H5ffaLgleb0lITbT2F7MBrMlUa8stdQWuqBteMw5xjeSzYE2/1
	NLsk9UMNt/MhWhYUpDIa4xP/dLmNspYtCuNFjgvGmFSG5GxEzK/nEGMtNzthvJVJ+H4Bv8irEST
	JTP04TuuuFBclatoZsVmkx4hybuzbhBmTCPTX8VBkD1m0sZVD7beIon+PFGENB2Nlm0FwdaE4lH
	Pc2lbNQ6La+/e7ZtIULYr0h5LFa+I20HW2ZowhuUWXWSpoF8EmkPI/Jg6C6qpFESDQDgUSYhGJM
	O+zArRQbOBIGWHg==
X-Google-Smtp-Source: AGHT+IHDFcgf/Q1YCLdknZTt9nRZWla2DHaCojWqgGJ4RbiVsHVnEoQNqVZO0AbPN3LFSDThkG8o2w==
X-Received: by 2002:a17:902:f54d:b0:223:628c:199 with SMTP id d9443c01a7336-22fc91a8c87mr141296155ad.52.1746970854557;
        Sun, 11 May 2025 06:40:54 -0700 (PDT)
Received: from anup-ubuntu-vm.localdomain ([122.171.17.86])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22fc754785bsm46665805ad.20.2025.05.11.06.40.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 11 May 2025 06:40:53 -0700 (PDT)
From: Anup Patel <apatel@ventanamicro.com>
To: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Jassi Brar <jassisinghbrar@gmail.com>,
	Thomas Gleixner <tglx@linutronix.de>,
	"Rafael J . Wysocki" <rafael@kernel.org>,
	Mika Westerberg <mika.westerberg@linux.intel.com>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>,
	=?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <ukleinek@kernel.org>
Cc: Palmer Dabbelt <palmer@dabbelt.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Len Brown <lenb@kernel.org>,
	Sunil V L <sunilvl@ventanamicro.com>,
	Rahul Pathak <rpathak@ventanamicro.com>,
	Leyfoon Tan <leyfoon.tan@starfivetech.com>,
	Atish Patra <atish.patra@linux.dev>,
	Andrew Jones <ajones@ventanamicro.com>,
	Samuel Holland <samuel.holland@sifive.com>,
	Anup Patel <anup@brainfault.org>,
	linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Anup Patel <apatel@ventanamicro.com>
Subject: [PATCH v3 06/23] mailbox: Allow controller specific mapping using fwnode
Date: Sun, 11 May 2025 19:09:22 +0530
Message-ID: <20250511133939.801777-7-apatel@ventanamicro.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250511133939.801777-1-apatel@ventanamicro.com>
References: <20250511133939.801777-1-apatel@ventanamicro.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Introduce optional fw_node() callback which allows a mailbox controller
driver to provide controller specific mapping using fwnode.

The Linux OF framework already implements fwnode operations for the
Linux DD framework so the fw_xlate() callback works fine with device
tree as well.

Signed-off-by: Anup Patel <apatel@ventanamicro.com>
---
 drivers/mailbox/mailbox.c          | 48 +++++++++++++++++-------------
 include/linux/mailbox_controller.h |  3 ++
 2 files changed, 31 insertions(+), 20 deletions(-)

diff --git a/drivers/mailbox/mailbox.c b/drivers/mailbox/mailbox.c
index 0593b4d03685..a7ab1b4450a3 100644
--- a/drivers/mailbox/mailbox.c
+++ b/drivers/mailbox/mailbox.c
@@ -399,35 +399,50 @@ EXPORT_SYMBOL_GPL(mbox_bind_client);
  */
 struct mbox_chan *mbox_request_channel(struct mbox_client *cl, int index)
 {
+	struct fwnode_reference_args fwspec;
 	struct device *dev = cl->dev;
 	struct mbox_controller *mbox;
 	struct of_phandle_args spec;
 	struct mbox_chan *chan;
-	int ret;
+	int i, ret;
 
-	if (!dev || !dev->of_node) {
-		pr_debug("%s: No owner device node\n", __func__);
+	if (!dev || !dev->fwnode) {
+		pr_debug("%s: No owner device\n", __func__);
+		pr_debug("%s: No owner fwnode\n", __func__);
 		return ERR_PTR(-ENODEV);
 	}
 
-	ret = of_parse_phandle_with_args(dev->of_node, "mboxes", "#mbox-cells",
-					 index, &spec);
+	ret = fwnode_property_get_reference_args(dev->fwnode, "mboxes",
+						 "#mbox-cells", 0, index, &fwspec);
 	if (ret) {
 		dev_dbg(dev, "%s: can't parse \"mboxes\" property\n", __func__);
 		return ERR_PTR(ret);
 	}
 
+	memset(&spec, 0, sizeof(spec));
+	if (dev->of_node) {
+		spec.np = to_of_node(fwspec.fwnode);
+		spec.args_count = fwspec.nargs;
+		for (i = 0; i < spec.args_count; i++)
+			spec.args[i] = fwspec.args[i];
+	}
+
 	mutex_lock(&con_mutex);
 
 	chan = ERR_PTR(-EPROBE_DEFER);
-	list_for_each_entry(mbox, &mbox_cons, node)
-		if (mbox->dev->of_node == spec.np) {
+	list_for_each_entry(mbox, &mbox_cons, node) {
+		if (mbox->fw_xlate && mbox->dev->fwnode == fwspec.fwnode) {
+			chan = mbox->fw_xlate(mbox, &fwspec);
+			if (!IS_ERR(chan))
+				break;
+		} else if (mbox->of_xlate && mbox->dev->of_node == spec.np) {
 			chan = mbox->of_xlate(mbox, &spec);
 			if (!IS_ERR(chan))
 				break;
 		}
+	}
 
-	of_node_put(spec.np);
+	fwnode_handle_put(fwspec.fwnode);
 
 	if (IS_ERR(chan)) {
 		mutex_unlock(&con_mutex);
@@ -446,15 +461,8 @@ EXPORT_SYMBOL_GPL(mbox_request_channel);
 struct mbox_chan *mbox_request_channel_byname(struct mbox_client *cl,
 					      const char *name)
 {
-	struct device_node *np = cl->dev->of_node;
-	int index;
-
-	if (!np) {
-		dev_err(cl->dev, "%s() currently only supports DT\n", __func__);
-		return ERR_PTR(-EINVAL);
-	}
+	int index = device_property_match_string(cl->dev, "mbox-names", name);
 
-	index = of_property_match_string(np, "mbox-names", name);
 	if (index < 0) {
 		dev_err(cl->dev, "%s() could not locate channel named \"%s\"\n",
 			__func__, name);
@@ -492,8 +500,8 @@ void mbox_free_channel(struct mbox_chan *chan)
 EXPORT_SYMBOL_GPL(mbox_free_channel);
 
 static struct mbox_chan *
-of_mbox_index_xlate(struct mbox_controller *mbox,
-		    const struct of_phandle_args *sp)
+fw_mbox_index_xlate(struct mbox_controller *mbox,
+		    const struct fwnode_reference_args *sp)
 {
 	int ind = sp->args[0];
 
@@ -544,8 +552,8 @@ int mbox_controller_register(struct mbox_controller *mbox)
 		spin_lock_init(&chan->lock);
 	}
 
-	if (!mbox->of_xlate)
-		mbox->of_xlate = of_mbox_index_xlate;
+	if (!mbox->fw_xlate && !mbox->of_xlate)
+		mbox->fw_xlate = fw_mbox_index_xlate;
 
 	mutex_lock(&con_mutex);
 	list_add_tail(&mbox->node, &mbox_cons);
diff --git a/include/linux/mailbox_controller.h b/include/linux/mailbox_controller.h
index 5fb0b65f45a2..b91379922cb3 100644
--- a/include/linux/mailbox_controller.h
+++ b/include/linux/mailbox_controller.h
@@ -66,6 +66,7 @@ struct mbox_chan_ops {
  *			no interrupt rises. Ignored if 'txdone_irq' is set.
  * @txpoll_period:	If 'txdone_poll' is in effect, the API polls for
  *			last TX's status after these many millisecs
+ * @fw_xlate:		Controller driver specific mapping of channel via fwnode
  * @of_xlate:		Controller driver specific mapping of channel via DT
  * @poll_hrt:		API private. hrtimer used to poll for TXDONE on all
  *			channels.
@@ -79,6 +80,8 @@ struct mbox_controller {
 	bool txdone_irq;
 	bool txdone_poll;
 	unsigned txpoll_period;
+	struct mbox_chan *(*fw_xlate)(struct mbox_controller *mbox,
+				      const struct fwnode_reference_args *sp);
 	struct mbox_chan *(*of_xlate)(struct mbox_controller *mbox,
 				      const struct of_phandle_args *sp);
 	/* Internal to API */
-- 
2.43.0


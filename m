Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com [209.85.214.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B32ED22A1F1
	for <linux-kernel@vger.kernel.org>; Wed, 11 Jun 2025 06:23:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749623020; cv=none; b=D5dE37K0rUyVJ2QuHgDq7rkZAtNcD8qfsyaWLVj828C2cU2WT5lyefDaq/lg49KVJ94tWHVQRf+NUcA5o+5iZS1fRUhpQAAZsE0qLFzlS8A9Wq49EaCE1B24iXSoKh05+XvQ+X06d3280MTi7/Df2cUunA//a6GVkrdw64jPE+w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749623020; c=relaxed/simple;
	bh=st3O+ijFgGFNKVMxzm55tlaSGPlHlP9D9YyRi1Zj5U4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=OteeXoKVjUAdWrIYoNud8wN0HEUL7ep/tHO7TiOFlgGb8WMKda5L0PYRCGAYd/HwOV2+pMI4KROV1dE26C/dLQNdfZp6chfeIHUX3vpOww68zguAN+INiGpckukTP3cLFaQ4cA88J0huiJ6sPTKwX0pc7vsGzzBM9GatSjGuM1U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ventanamicro.com; spf=pass smtp.mailfrom=ventanamicro.com; dkim=pass (2048-bit key) header.d=ventanamicro.com header.i=@ventanamicro.com header.b=ESV6NoGh; arc=none smtp.client-ip=209.85.214.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ventanamicro.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ventanamicro.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ventanamicro.com header.i=@ventanamicro.com header.b="ESV6NoGh"
Received: by mail-pl1-f173.google.com with SMTP id d9443c01a7336-236192f8770so4360905ad.0
        for <linux-kernel@vger.kernel.org>; Tue, 10 Jun 2025 23:23:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1749623017; x=1750227817; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Oq58nUDRWeIOl1x38zmkh2+ZPHCgo0OptvyvyNxudhg=;
        b=ESV6NoGh1En3AvF5RK5spQArA54hQPkqbYJX8P562w2rQzb91s3qEeIUTUwwecSTiR
         eD6qLRmG8VQrLInkMlp1bq+mc8YZVsIUyk0au3JzToDGN98a1a2/TAVs3qrHJguAK4Q8
         SbE6iFGMWedgnOanHLb+bf8sr8m3PjgZN7q9lmCjYx9bPL8PXbgddE/oKanMClv1hzEl
         MSAZNABU0wi6KOMZpXYDUUY36u/T+JCh6P/5fCIuzjPwEhZ6zXVDrPAWx0LDQY5MCP0U
         syOw0QBi5dGcMJxG1kjgKfwRaDXTTudu4uqXiJxd4jctNdPFfZ0oB0War+lQfFexLdB+
         mxrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749623017; x=1750227817;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Oq58nUDRWeIOl1x38zmkh2+ZPHCgo0OptvyvyNxudhg=;
        b=pZvUnPz6xwbiiExXELsaW0uzK5rKcbtp36fKX+jLxUKDBSUn9ZTetbGvASk1F5fZF+
         lAt63EatjTlSYU7Fm80AlnHQjPfxePyo5ks50qqKeFddESQQhO2p+wsn8xG8u79lLC2f
         4iOwY2RECWcEaoj7B5UFkrOqon9f+fC7zDjCg3mTp88/fTfrjnHK01Q+q/nB5FUknaSA
         nX5L6+dkTDrgYa0eMxc8IaxfOw/0s8ogDVFfyemQnsx+hWYYpjcPUCORbCgbAvZRqOM8
         Bi4P8J+K+qJiy9SBe9hNe1ZLHAGjl6f7hVtMmFODJYv1SnP8l1t+nw1tRASbHnAi84r1
         ldyA==
X-Forwarded-Encrypted: i=1; AJvYcCX4M68oB+Zi4ulbVe2uAACfprClFqmeCfRNrgzWWCVbgsfGtMcYJdP9qL7sqz0RdRnFNw2ZsUGIrng89kk=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx/PluuAcZzE/LUdeXXQU/A36yaoFfdUA0+h60Q/VTXpdPhSOzF
	XBs+fGdFAr8YMEFG1ggNXn3ouF4dEuU8aeFqkzgcIKmt4M4rk9HyEbweB4EdTv0iUS0=
X-Gm-Gg: ASbGncvGkM+vK4d/EbUIjUJMHtGVp/XN05pN3tQvO2jHVo9o46Pyh0XcAYpnxBHPpM8
	5YMM0l+F6QlNoXYuTW4OceuQGNYFESiRVU0BL7aUGCtJrmMfLt2OtJo+s1f9Jx4KOneMaeI5BBP
	8LVTHiOymOwUNcQPPaakwRsK0Wt3nOZW/sHIl4i7a7lhnAObnyhH20CsUwS+fPy07iwjuj441jh
	TPlHaeaPtSVCHIh+rtesyavLILm3TzO3RaxV3qhIqTy9tvuLdTGBoGqFAz5n3YweTxpGVSrHJ7R
	HRzFrSYhz/UIF9cMnofDlgHqTofidkNd1y6W7bOI/qZ7UutHi2NBShrG2z4dH2uhFa1i+Z14gLK
	O2zYuuJLBJ+lWGi/8ORyPr/rD/k3zc+IYQXzW
X-Google-Smtp-Source: AGHT+IHtGB2PUpXqZ9bfGLD+kJcw/Vmqw/rX+F5NwlfdOTouRiwUdlxzNr+s19qiVuX1b57i0EotKQ==
X-Received: by 2002:a17:903:3203:b0:21f:5063:d3ca with SMTP id d9443c01a7336-236418343e6mr33134145ad.16.1749623016901;
        Tue, 10 Jun 2025 23:23:36 -0700 (PDT)
Received: from anup-ubuntu-vm.localdomain ([103.97.166.196])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-23603092677sm79976295ad.64.2025.06.10.23.23.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Jun 2025 23:23:36 -0700 (PDT)
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
Subject: [PATCH v5 05/23] mailbox: Allow controller specific mapping using fwnode
Date: Wed, 11 Jun 2025 11:52:20 +0530
Message-ID: <20250611062238.636753-6-apatel@ventanamicro.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250611062238.636753-1-apatel@ventanamicro.com>
References: <20250611062238.636753-1-apatel@ventanamicro.com>
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
 drivers/mailbox/mailbox.c          | 45 +++++++++++++++++-------------
 include/linux/mailbox_controller.h |  3 ++
 2 files changed, 28 insertions(+), 20 deletions(-)

diff --git a/drivers/mailbox/mailbox.c b/drivers/mailbox/mailbox.c
index 5cd8ae222073..d1840eace725 100644
--- a/drivers/mailbox/mailbox.c
+++ b/drivers/mailbox/mailbox.c
@@ -15,6 +15,7 @@
 #include <linux/module.h>
 #include <linux/mutex.h>
 #include <linux/of.h>
+#include <linux/property.h>
 #include <linux/spinlock.h>
 
 #include "mailbox.h"
@@ -383,34 +384,46 @@ EXPORT_SYMBOL_GPL(mbox_bind_client);
  */
 struct mbox_chan *mbox_request_channel(struct mbox_client *cl, int index)
 {
+	struct fwnode_reference_args fwspec;
 	struct device *dev = cl->dev;
 	struct mbox_controller *mbox;
 	struct of_phandle_args spec;
 	struct mbox_chan *chan;
+	unsigned int i;
 	int ret;
 
-	if (!dev || !dev->of_node) {
-		pr_debug("%s: No owner device node\n", __func__);
+	if (!dev || !dev_fwnode(dev)) {
+		pr_debug("No owner %s\n", dev ? "fwnode" : "device");
 		return ERR_PTR(-ENODEV);
 	}
 
-	ret = of_parse_phandle_with_args(dev->of_node, "mboxes", "#mbox-cells",
-					 index, &spec);
+	ret = fwnode_property_get_reference_args(dev_fwnode(dev), "mboxes",
+						 "#mbox-cells", 0, index, &fwspec);
 	if (ret) {
 		dev_err(dev, "%s: can't parse \"mboxes\" property\n", __func__);
 		return ERR_PTR(ret);
 	}
 
+	spec.np = to_of_node(fwspec.fwnode);
+	spec.args_count = fwspec.nargs;
+	for (i = 0; i < spec.args_count; i++)
+		spec.args[i] = fwspec.args[i];
+
 	scoped_guard(mutex, &con_mutex) {
 		chan = ERR_PTR(-EPROBE_DEFER);
-		list_for_each_entry(mbox, &mbox_cons, node)
-			if (mbox->dev->of_node == spec.np) {
+		list_for_each_entry(mbox, &mbox_cons, node) {
+			if (mbox->fw_xlate && dev_fwnode(mbox->dev) == fwspec.fwnode) {
+				chan = mbox->fw_xlate(mbox, &fwspec);
+				if (!IS_ERR(chan))
+					break;
+			} else if (mbox->of_xlate && mbox->dev->of_node == spec.np) {
 				chan = mbox->of_xlate(mbox, &spec);
 				if (!IS_ERR(chan))
 					break;
 			}
+		}
 
-		of_node_put(spec.np);
+		fwnode_handle_put(fwspec.fwnode);
 
 		if (IS_ERR(chan))
 			return chan;
@@ -427,15 +440,8 @@ EXPORT_SYMBOL_GPL(mbox_request_channel);
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
@@ -470,9 +476,8 @@ void mbox_free_channel(struct mbox_chan *chan)
 }
 EXPORT_SYMBOL_GPL(mbox_free_channel);
 
-static struct mbox_chan *
-of_mbox_index_xlate(struct mbox_controller *mbox,
-		    const struct of_phandle_args *sp)
+static struct mbox_chan *fw_mbox_index_xlate(struct mbox_controller *mbox,
+					     const struct fwnode_reference_args *sp)
 {
 	int ind = sp->args[0];
 
@@ -523,8 +528,8 @@ int mbox_controller_register(struct mbox_controller *mbox)
 		spin_lock_init(&chan->lock);
 	}
 
-	if (!mbox->of_xlate)
-		mbox->of_xlate = of_mbox_index_xlate;
+	if (!mbox->fw_xlate && !mbox->of_xlate)
+		mbox->fw_xlate = fw_mbox_index_xlate;
 
 	scoped_guard(mutex, &con_mutex)
 		list_add_tail(&mbox->node, &mbox_cons);
diff --git a/include/linux/mailbox_controller.h b/include/linux/mailbox_controller.h
index ad01c4082358..80a427c7ca29 100644
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


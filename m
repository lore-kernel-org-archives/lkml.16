Received: from mail-pf1-f172.google.com (mail-pf1-f172.google.com [209.85.210.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A01C42DFF1F
	for <linux-kernel@vger.kernel.org>; Wed, 18 Jun 2025 12:14:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750248900; cv=none; b=b6aXP+zqu13aMsYKa4lSFqgdEhWOtrWtfFHgrAZc7QNEx3ppHf+xSZ4+WyyrqYtv5esOAxU+xSBeuRjhY/W2XmfAFtVZCJm/mpptIVPQRUFtWkLcUOeKSKyiOqTnKwpOBv9bJ4OwOxIHEEGVBQtUAa87HFkujqsdXITEIQ4oV/0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750248900; c=relaxed/simple;
	bh=115z1pTXXxT946hC2JDmyPKJdeuOWCSKp1HjxeLHuWk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=o/H8ijOiIxc0XWKrNEq68+rC8/U3FC/i8u5PCBzDdjUitsCehD4E/qY8sMG0uFVNNN8dQwehNDo9FYtrWZlIV2DURcQxnUnuPAB9fKk9/PBC5i9xKlW/0DJxoefbqFZbWf9lTdYSMKH//Q5xyJ3fwgxU1qdnF14kxZcr1DW3bf4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ventanamicro.com; spf=pass smtp.mailfrom=ventanamicro.com; dkim=pass (2048-bit key) header.d=ventanamicro.com header.i=@ventanamicro.com header.b=YqJNPnLU; arc=none smtp.client-ip=209.85.210.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ventanamicro.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ventanamicro.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ventanamicro.com header.i=@ventanamicro.com header.b="YqJNPnLU"
Received: by mail-pf1-f172.google.com with SMTP id d2e1a72fcca58-7425bd5a83aso5734377b3a.0
        for <linux-kernel@vger.kernel.org>; Wed, 18 Jun 2025 05:14:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1750248898; x=1750853698; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wkfFwagA4Ur7x2+0SaDRm7VG4duXccUrfMB72AIUWQc=;
        b=YqJNPnLUVHYsjWqWLdfvb+aUkZxWdS907VbHMHI4fdBP32B94ki5YUVXV/dRXna4yv
         RCZ0noC/y1X04mSCt6LuPEmDp3zxrisXpZsPwEXwnX9Ybdv0BOyrbXXuCUDwDyiDSEZx
         WyfbbqCaeb9XbXWhGYOVNvsoHuLhqZmBnBMX57E6nZeaLulXzw7n8x8YElSPEApgvF8f
         gyT1FjJAK8Snn44bj2QrjkEvytW9Jo1in+8GLpw0WDs+d9nP5QscD6bAX0TbxXUnC66R
         6hnG5b+ARcRp6RvpQ/K0lyBF90GYeOzr08qvYdKsihH82z6HbFwc0fRnhV0vFPIeYRoM
         KlRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750248898; x=1750853698;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=wkfFwagA4Ur7x2+0SaDRm7VG4duXccUrfMB72AIUWQc=;
        b=WLAflVs9IxCJfmWgQymcwUY6m8ZgXf29Tc8QVOljqvUOYUm4hxngnSjQhiPAJ82OsC
         +v+JYlHo0lOGxHlae/DtO1CtXx9EZJOH8Bd0+wEq97hxR/Ql5x1ZZVL1wmxm4LP2ia7j
         nYbgkIrCrpHJ5Du2XhotYAfvowvWfkVRhE/r0si7AY1EYlB1xCLNRtYJcAnlePzBhgUW
         15MD6+umGBbt0y8ifujUJsYqu8m+WDFR86UMIhEtBUYeel6sRHkFcnhXEmLlBRdla+Ua
         U2FawtHb67x9XZdXf88gIXI9lDV2Y1WlSap8TdxkLW3dYVSuyYjMRmE8QoS/fxZ98loD
         tSbA==
X-Forwarded-Encrypted: i=1; AJvYcCW/rlDieghvqVuMheb77evHRQP6jwGO/KcT16DozLhzqpO8VV5dcM0LmJ38jgVqQAJ/Wfu3A3c+Qn7+gbA=@vger.kernel.org
X-Gm-Message-State: AOJu0Ywdv+QhmgY3v9jCrgIviFwbJLRg73ou6BsGwyoXwuhcjME5qjaG
	IHKJEtDJg21rBIAqEPuLrJz/Mhn6AIhzx7uUfMhnqU8ySwhAwjHzFUAY5NC+miwKDJU=
X-Gm-Gg: ASbGncvE9IDJFKzPV2OrBYB5Krqxtz/Qp2RQ8Ep5M3Xz+JtSglZWlsBtVqLO03JXyEQ
	vBBlauIyKeqfsKO/XLrBLH4LP2u7tMWimFRHTkjrXpGrvfWU5lfU3UDJ1xi9g7xXNqoUB9w6DMB
	VL94lYnEcNiNDaVM+WwSj2akbQtk+6P3346IrYFHEvLLM5FUhTSskuPCPMeK6puNP7MoinlrWC2
	2yUUMnqGO7uyJQt8s21kAlecMX+YoiBqSRjK8Kd1RU0t83wGassNepjcE8Nv6RsoSVxJniseUG6
	7n5/qaqGvHueAugxtrs3dpbmU+q8fznLa+ieZ3Wb0EW2ZF6Q223dEz0z74s/tKiIRjFwYS6ic6T
	GdqrAI1DC4LAs4+mEaw==
X-Google-Smtp-Source: AGHT+IH0wyg3jplUforDQ98lVCdk3NyNM8MpAgccygk4W/PFT18QngdHfPNSKseV5l6JKzH3qjOhXg==
X-Received: by 2002:a05:6a00:92a8:b0:742:a5f2:9c51 with SMTP id d2e1a72fcca58-7489cfeb010mr23697698b3a.16.1750248897717;
        Wed, 18 Jun 2025 05:14:57 -0700 (PDT)
Received: from localhost.localdomain ([122.171.23.44])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-748900d7e0asm11201177b3a.174.2025.06.18.05.14.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Jun 2025 05:14:57 -0700 (PDT)
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
Subject: [PATCH v6 05/23] mailbox: Allow controller specific mapping using fwnode
Date: Wed, 18 Jun 2025 17:43:40 +0530
Message-ID: <20250618121358.503781-6-apatel@ventanamicro.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250618121358.503781-1-apatel@ventanamicro.com>
References: <20250618121358.503781-1-apatel@ventanamicro.com>
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
 drivers/mailbox/mailbox.c          | 65 ++++++++++++++++++------------
 include/linux/mailbox_controller.h |  3 ++
 2 files changed, 43 insertions(+), 25 deletions(-)

diff --git a/drivers/mailbox/mailbox.c b/drivers/mailbox/mailbox.c
index 5cd8ae222073..6a96cb6af8c1 100644
--- a/drivers/mailbox/mailbox.c
+++ b/drivers/mailbox/mailbox.c
@@ -15,6 +15,7 @@
 #include <linux/module.h>
 #include <linux/mutex.h>
 #include <linux/of.h>
+#include <linux/property.h>
 #include <linux/spinlock.h>
 
 #include "mailbox.h"
@@ -383,34 +384,56 @@ EXPORT_SYMBOL_GPL(mbox_bind_client);
  */
 struct mbox_chan *mbox_request_channel(struct mbox_client *cl, int index)
 {
-	struct device *dev = cl->dev;
+	struct fwnode_reference_args fwspec;
+	struct fwnode_handle *fwnode;
 	struct mbox_controller *mbox;
 	struct of_phandle_args spec;
 	struct mbox_chan *chan;
+	struct device *dev;
+	unsigned int i;
 	int ret;
 
-	if (!dev || !dev->of_node) {
-		pr_debug("%s: No owner device node\n", __func__);
+	dev = cl->dev;
+	if (!dev) {
+		pr_debug("No owner device\n");
 		return ERR_PTR(-ENODEV);
 	}
 
-	ret = of_parse_phandle_with_args(dev->of_node, "mboxes", "#mbox-cells",
-					 index, &spec);
+	fwnode = dev_fwnode(dev);
+	if (!fwnode) {
+		dev_dbg(dev, "No owner fwnode\n");
+		return ERR_PTR(-ENODEV);
+	}
+
+	ret = fwnode_property_get_reference_args(dev_fwnode(dev), "mboxes",
+						 "#mbox-cells", 0, index, &fwspec);
 	if (ret) {
-		dev_err(dev, "%s: can't parse \"mboxes\" property\n", __func__);
+		dev_err(dev, "%s: can't parse \"%s\" property\n", __func__, "mboxes");
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
-				chan = mbox->of_xlate(mbox, &spec);
-				if (!IS_ERR(chan))
-					break;
+		list_for_each_entry(mbox, &mbox_cons, node) {
+			if (device_match_fwnode(mbox->dev, fwspec.fwnode)) {
+				if (mbox->fw_xlate) {
+					chan = mbox->fw_xlate(mbox, &fwspec);
+					if (!IS_ERR(chan))
+						break;
+				} else if (mbox->of_xlate) {
+					chan = mbox->of_xlate(mbox, &spec);
+					if (!IS_ERR(chan))
+						break;
+				}
 			}
+		}
 
-		of_node_put(spec.np);
+		fwnode_handle_put(fwspec.fwnode);
 
 		if (IS_ERR(chan))
 			return chan;
@@ -427,15 +450,8 @@ EXPORT_SYMBOL_GPL(mbox_request_channel);
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
@@ -470,9 +486,8 @@ void mbox_free_channel(struct mbox_chan *chan)
 }
 EXPORT_SYMBOL_GPL(mbox_free_channel);
 
-static struct mbox_chan *
-of_mbox_index_xlate(struct mbox_controller *mbox,
-		    const struct of_phandle_args *sp)
+static struct mbox_chan *fw_mbox_index_xlate(struct mbox_controller *mbox,
+					     const struct fwnode_reference_args *sp)
 {
 	int ind = sp->args[0];
 
@@ -523,8 +538,8 @@ int mbox_controller_register(struct mbox_controller *mbox)
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


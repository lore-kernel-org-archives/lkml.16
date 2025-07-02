Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com [209.85.214.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 352A71F4621
	for <linux-kernel@vger.kernel.org>; Wed,  2 Jul 2025 05:14:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751433286; cv=none; b=uJ/KZsYoNx85oG/Cy0NPPHQPDWBdkxSrwMjLutmPPr2yNKV7jZbp9JxpWf8gBLBMbsFWLp+kB+r1g52v8JzXPWcbsHz/MK7406yydEA9LenE0LufPLL37qfVXX0MnAekVOvX/Vp005p4eQY3MC5cnzAm+BzZB0+RA0Mp627hwjM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751433286; c=relaxed/simple;
	bh=eP0nLjelGbOd1owGOdUwIHJWAQpQfBfflyMTXkP8FKA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ky9VdJxyyI8Ju+LyJddI3xGG/PpMOGdg0bTyOj8g0yWYdjjBC+kBGuw9lDjWQppOeNKOWbkhAvI9bnhq9ooiSvnOcP26n+Z9LgO6DlvYGGuLbjKPSqB3RgjfX1MsQfW2S/zRSljcztvtOSqcP8c2fN2ahhvz6R1755RYbnRXRlA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ventanamicro.com; spf=pass smtp.mailfrom=ventanamicro.com; dkim=pass (2048-bit key) header.d=ventanamicro.com header.i=@ventanamicro.com header.b=Dq0XblWg; arc=none smtp.client-ip=209.85.214.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ventanamicro.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ventanamicro.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ventanamicro.com header.i=@ventanamicro.com header.b="Dq0XblWg"
Received: by mail-pl1-f172.google.com with SMTP id d9443c01a7336-236470b2dceso34025075ad.0
        for <linux-kernel@vger.kernel.org>; Tue, 01 Jul 2025 22:14:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1751433284; x=1752038084; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=oP6ThGaZGs8MyIgO+nprUM8QR3vfVMjtp+0dcAYkEZA=;
        b=Dq0XblWgS/84zlSmjzNjs7zph1Am4Wd0xmREaSF4C7/keZPjL69r/SMTTPbk29Qrum
         i1qPoC6gT/Lf3t8X0grrZVdRh5S0oCPRPFghJA4fSm7NQqfSsZf3DgEd+nDzio11vuZ8
         3PHydDHH6ab9m5rX0oPOAgZqnC0XBz3AWUiDcCdGh7p9AWnNg9Seu1wmxkUqv7M9iCwz
         q/Iok2gVgk7k2xW2eOR1flcGBVxS8hMLppyFx7Nak4BcDO0wG7jahuzxe9nIIBVS0nI5
         /MhPLwxFBjsWi5OV4OoTZ7dE9PuFzK4J1i/Na85D2ppNdvSTLF0t1wR8dYwhuVXw9834
         R6/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751433284; x=1752038084;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=oP6ThGaZGs8MyIgO+nprUM8QR3vfVMjtp+0dcAYkEZA=;
        b=JuTugtaGDc1+kIZsS0j0O27nad9Y8ciDMX7vDPOK/4ix1GD/GfK1/lzrGw15LxfcLw
         x3ooajld/emthZ871hbm82XMCU2S/ZRQX5Pxmk2A4DyFVNU04bj0QJtxOqd9Z7hhzUPM
         uRptD8jhap7x57FJE5roePBR0us6VLryXALA3h6FN9xKPt1XVbEYE0fKEWI3ch5tbgWO
         T0LTH2F5HPU5D8nkkko3WgZ1wfvMry4Jazyr64PrOLT9udv+vgr/P3Fj5H5E1wh3wJgl
         8HFwNHPsDDKfmAs5ryfgKmQu+HyManBmKmXTeWqgO4N2Sq/cZVSUBkcJiVVsKMlwesWI
         dfZw==
X-Forwarded-Encrypted: i=1; AJvYcCVNn9ByCNG8brB8OxDE+djqiMGwmS5wAw5apJWe8IsUKJURK/ur2LwFS5kZS0XykhYgLuIYQBvaqOmBfiE=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw6iybRNdn+eCcWu/3GrXySc6sJWYJC1d3GtbfCeVNP4jkBxpOs
	BHsEoGvZx7EnmD3qagCjqVhm5j96E2ijUE0yH0IxxLTcZL4JK66Kuti/m4U6NJmHr3s=
X-Gm-Gg: ASbGncvQ3p9VSJOuWVuGDmP0mOSo4/X9lEoLCzoiYxV6yX+pCkoA9vlF64z8FAyOiO+
	p9BZ4kIs3l3XQrQUK7hTUvr7EsDh9Db7RhdgYvpCJue6vrgk2zE5wk306B0EMY6w5kW8ApT7lYh
	E86NtAoG/0LjQvdbQy39PvsbrSNwX4t0h4SzqbPzn+Re6Oa1pNpjdlFDe/PWqUc7XiH6AWInZHh
	tzndfRn2IE1UVfq1OqcfeNwkc2KPQjz0/3ho/1nLPEVGwYfcLjWS8fcm7LFHyiZoNdjYYQKDiHG
	SQzDrzmqTRYBTzrXcvSQYUPs7o2vfwFie8RPFmrar+YpBxHzqh2IiX4RkHf3BrexUz6cHlqH6o9
	u7H/5OgkIJbsvorCJ
X-Google-Smtp-Source: AGHT+IHW6+yjygzJaRYVJbk398vw/ZCnNjzG8uYmd5NcS+WaiG0hLE/XIX5nmwnliNsaVR742l1nrQ==
X-Received: by 2002:a17:903:1a2e:b0:232:59b:58fe with SMTP id d9443c01a7336-23c6e4d6e93mr19975825ad.1.1751433284391;
        Tue, 01 Jul 2025 22:14:44 -0700 (PDT)
Received: from localhost.localdomain ([14.141.91.70])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-23c6fe31933sm4719595ad.220.2025.07.01.22.14.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Jul 2025 22:14:43 -0700 (PDT)
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
	Alexandre Ghiti <alex@ghiti.fr>,
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
	linux-acpi@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Anup Patel <apatel@ventanamicro.com>
Subject: [PATCH v7 05/24] mailbox: Allow controller specific mapping using fwnode
Date: Wed,  2 Jul 2025 10:43:26 +0530
Message-ID: <20250702051345.1460497-6-apatel@ventanamicro.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250702051345.1460497-1-apatel@ventanamicro.com>
References: <20250702051345.1460497-1-apatel@ventanamicro.com>
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
index 5cd8ae222073..2acc6ec229a4 100644
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
+	ret = fwnode_property_get_reference_args(fwnode, "mboxes", "#mbox-cells",
+						 0, index, &fwspec);
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


Received: from mail-pf1-f174.google.com (mail-pf1-f174.google.com [209.85.210.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D438D1E7660
	for <linux-kernel@vger.kernel.org>; Sun, 25 May 2025 08:48:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748162897; cv=none; b=ZqKVzpNlxIolPDA0lsCkB2ePmIuISNeEZdWS9j627Wz4gfngmItVoQq3d3X2viV//QJZu4ghCpKt7W8B0RiFj+r7lThWCSJdk285h+tAN2zNhoxma2pG523so0lNRc+1nLI5xYQ6fnf7JjSJI1cO7EiSag0CAaY6jiSVxxe2/RY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748162897; c=relaxed/simple;
	bh=a7EmASSZ0lBK8fMNA15/YRl1jJ6fW9Bewy06JC1vdnY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=VqPxFPNBc5HD0dAnJTSNPFCSPQqT1+18k2tsUncLbw4dxTsHV5362b7cb5YGH6gzPkhU4UeCwv9Thw42bOCWYXSsVvA5K3pQ9sIWQfX6lXL4wemM9Sh+EYWmvLTt8DiDMKKYJdS4lWc6yKHS7efebS/heKUnl7lHLG3in+2V4hw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ventanamicro.com; spf=pass smtp.mailfrom=ventanamicro.com; dkim=pass (2048-bit key) header.d=ventanamicro.com header.i=@ventanamicro.com header.b=DMMjSd/K; arc=none smtp.client-ip=209.85.210.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ventanamicro.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ventanamicro.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ventanamicro.com header.i=@ventanamicro.com header.b="DMMjSd/K"
Received: by mail-pf1-f174.google.com with SMTP id d2e1a72fcca58-7406c6dd2b1so1621893b3a.0
        for <linux-kernel@vger.kernel.org>; Sun, 25 May 2025 01:48:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1748162895; x=1748767695; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=L2YZsv0slXJtEqKbNqOnaTZCtfyqgolmSJZjw1dwQuo=;
        b=DMMjSd/KhLOAssuC75U9ME0Tiwz21GF6m/faproKdteG3O0zpIPg2BsSvv0S8rkc8J
         DIf8pkPQw9md0XzrV+kQ7d7R9WjuCgFBAFWtMoo1NVEnmNchoCl11cdi8uOlGxy6u3HV
         rQwrv81gdaJfHeJcur3H6vT2HMOR65Pa8kiusvUHCnGMMNscMsp3N95TLQe+blIbdz8o
         G6LBdIs6YzhSMzjbgIHEQEoKOyQbIiwYrKRCmSp0N+dkwn0bqo1a2eNkuDI55tH6TPWo
         45TwAFy2ea7Yy/JA2nnrcb4kDmdN3zty5QvBWpcIEZhAfU3fCqMSHh5+DqQ8/Ygmrr4W
         Sdew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748162895; x=1748767695;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=L2YZsv0slXJtEqKbNqOnaTZCtfyqgolmSJZjw1dwQuo=;
        b=bDPgO4YseJXitAQqBAv7SUr6UXLLllDN1qXBTh1kvoEcCtujpMSmWQctLDCW3ltQCs
         xhV/XabncEZhHn2P7DgQrCEkrB2bkEQqRlHw0nNUL8pLdPbSFXe7/hI7oy09ek6LybJI
         yK1uJNI5ofKNwnoe5fwc6PknEIhPdBgNHnqwuNxB4ZgTq6DiKyfAShX5dIKRa4lnB8ul
         tm75gspC3bJMgPunnLrGezjPyYHKgg+Zc39QhSJIkh4+LaTh3Y1EbEgKgoOYrhAz3A4P
         o2HAcFBfDlrfPw3PAi1bj17cnV+ZTCF4AWwA8ae2eJstZxfWuSgjyykYD7Z6NH+bq68R
         AVcg==
X-Forwarded-Encrypted: i=1; AJvYcCWNxHnFXGs4qhw289aEIUuWrprnY0q8NdVF1xAfri8eeaebpZofZ1YksKh+6dJeEnr+w4vOq8joHB14xCs=@vger.kernel.org
X-Gm-Message-State: AOJu0Yxiu/PaRwWHMSkIfnMxU+UEVU5pth0j5XE+rLLGvVkb1LAqyjud
	q2sKmUA/jMhcyJqb1NvUG/80y9wKEKM/nQhHJ/PzBoYxLWYX6glZV4bGoMaLihw3NZvJmE6CHMZ
	K60lQ
X-Gm-Gg: ASbGncveyXOkGP7krWdGrucb/WyaOaZPSuU+EdL0krl3cXosuTKPDUAlZ2U/0+m5VmN
	mGzkKG3+XGS4WXoVaO7MfuBXkxp4atYhAwjbgu1sOqK7izQgYvuI9aekEgC4mFWGLEBAVeLfGAB
	qBHluQ1mH8vHUpZGlwDyal7u/znfNdiFR+eWD3r/RWj0sCHG+WkuCvm3Ob0X6QmdF5eciG2myic
	Qzn1uaD/YRk54XA92FuUnrfS1rL2aGK3NmNzNMUMbsQsQ+Ojgv8++1p7CZG4U7OnVrBRNDCBVwO
	7gZZoX7U4Krpw6TR3jAbLL7k3iCSMHLgfsLto9PW+p5KpjNpZ63mju03LMIA55/vygoij7WS83w
	2nIjqaoltk+Xc/X3m8mc=
X-Google-Smtp-Source: AGHT+IHM9LFVogkUZzQcx3ggP9+ZLqKm1aQkkdN9byS7+2CCq/9Ox/zC14iIeSMPjwcZoGra84FVAQ==
X-Received: by 2002:a05:6a21:3406:b0:1f3:3547:f21b with SMTP id adf61e73a8af0-2188b5718cdmr9564106637.5.1748162894921;
        Sun, 25 May 2025 01:48:14 -0700 (PDT)
Received: from localhost.localdomain ([122.171.22.180])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b26eaf6dd83sm15250627a12.18.2025.05.25.01.48.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 25 May 2025 01:48:14 -0700 (PDT)
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
Subject: [PATCH v4 06/23] mailbox: Allow controller specific mapping using fwnode
Date: Sun, 25 May 2025 14:16:53 +0530
Message-ID: <20250525084710.1665648-7-apatel@ventanamicro.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250525084710.1665648-1-apatel@ventanamicro.com>
References: <20250525084710.1665648-1-apatel@ventanamicro.com>
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
 drivers/mailbox/mailbox.c          | 47 +++++++++++++++++-------------
 include/linux/mailbox_controller.h |  3 ++
 2 files changed, 30 insertions(+), 20 deletions(-)

diff --git a/drivers/mailbox/mailbox.c b/drivers/mailbox/mailbox.c
index 0593b4d03685..0100163c0390 100644
--- a/drivers/mailbox/mailbox.c
+++ b/drivers/mailbox/mailbox.c
@@ -399,35 +399,49 @@ EXPORT_SYMBOL_GPL(mbox_bind_client);
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
+		pr_debug("%s: No owner %s\n", __func__, !dev ? "device" : "fwnode");
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
@@ -446,15 +460,8 @@ EXPORT_SYMBOL_GPL(mbox_request_channel);
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
@@ -492,8 +499,8 @@ void mbox_free_channel(struct mbox_chan *chan)
 EXPORT_SYMBOL_GPL(mbox_free_channel);
 
 static struct mbox_chan *
-of_mbox_index_xlate(struct mbox_controller *mbox,
-		    const struct of_phandle_args *sp)
+fw_mbox_index_xlate(struct mbox_controller *mbox,
+		    const struct fwnode_reference_args *sp)
 {
 	int ind = sp->args[0];
 
@@ -544,8 +551,8 @@ int mbox_controller_register(struct mbox_controller *mbox)
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


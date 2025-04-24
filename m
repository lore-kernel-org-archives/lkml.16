Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9A3871F3BAE
	for <linux-kernel@vger.kernel.org>; Thu, 24 Apr 2025 06:22:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745475740; cv=none; b=c35BN+MNZ0WW7hr2jB05PddmsAJ0B9raZbo3K0fhByfpqysMcmVG560UyF3rO+c0eqNv2AP5oOhEiHIw/a0Wr8n24H73GxV05opcOLZLNjW6rfVFTAyTri2ORD4GYmhgUZo9YrEGbHe1bzGxUVc2rBXLKZqIi39p9vcybrq6JIU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745475740; c=relaxed/simple;
	bh=2cbL/UoMZsHKenEkqVA3bsu+mxjHyTBuUjF0+bypM38=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ngTALnwSnEjhdCwguvRSX8hDIe3rm9wQBulNtyIe4btY3w4fmmwg6MrHDhmIxJBQPvQlj/EMh2H/232P22Q7PchiaoMt9LMl98ZAN3MAc7gRO1CwrdD8zedbXr/BVjEQkPHXKcm+FgZAoeHDhYPRqGLldFz/c4UC+4H1zKb/m6A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amarulasolutions.com; spf=pass smtp.mailfrom=amarulasolutions.com; dkim=pass (1024-bit key) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.b=Y6J612th; arc=none smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amarulasolutions.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amarulasolutions.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.b="Y6J612th"
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-43cf0d787eeso6339095e9.3
        for <linux-kernel@vger.kernel.org>; Wed, 23 Apr 2025 23:22:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google; t=1745475737; x=1746080537; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gDZuiTdlw8039p8GoLYv+uw7eDAfVUu6FSj2o7a4bY0=;
        b=Y6J612thN/OWi8mgOKBuN0ry1NLUkZ0/SFecLpAW92NyAtNUYgFnHzZ+j1LOPU7ozK
         ysBbv7QzYNXJ3HiGrEktOPwA9yc52iJsRObM68q3oYkfkZcLKJ12yTqSXa1xlaxwN9Rp
         B/k2Nc0XtHDDTMHrx4cZ+m1o4a37EsOMXWfVo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745475737; x=1746080537;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=gDZuiTdlw8039p8GoLYv+uw7eDAfVUu6FSj2o7a4bY0=;
        b=bUICTjMRweXsJvf+y3k6gAZoRFjg5nA3IJKVGoD5wsEA71nUBxfh6uhu7r7+zO0Ytm
         YXVRMyi2R5/AiO5DX/y3rcw0aV5o+R9cVU32aa8RSZjLPbCq6ehsJJDuVeToqU0x71Kv
         n6YO07DZxMZzkGFO2x9E6wxhl9rGcsytgL8CYZSJnhsP3YffwXowN5FSbHNSBaSvxk6P
         RbImA9lYaUYNhRbGwcA9mLLz9/6Ito3KmjXmv1EKedfPr5tvwUbYSmwoJDgL+4XsQvo1
         7H6Y9Y1/HFO1EDGidaZx8GnxW28jKWkZOb4mbwTDqJbBifzMfiR4/JZ26RgOw12B6fIo
         f5ow==
X-Gm-Message-State: AOJu0Yy4gSfbgn/vsi6jT6hmRb0r3AVt5CdD8RwMFLKkvPaCtOtVasSW
	hDsLnhJM/9QRqpD3FGiTrZir57Nn3XMxNtxGgPJ8n4Uifia8btlHfTekFeBOZXqijVswM3ui+RW
	i
X-Gm-Gg: ASbGncuU2cD3gvRqwZEsxNefeIoZFSGDFCaujt3yjd80FblF1pw/SfgajB+dA3y5VeF
	4CZRqUdf4SMeCfrSgsLfiLLC5MJvg8MIe0f6wmVt+NGTvab0yIl9kE+F5e2DO+q/zk0hGH3Groh
	aqMBL2UA+aTBcpbnFFtlJ3oh26YvE45JNzKrGJpW+mBgYcLlKqzyVmcxN50YX9A1jmZTTka/iT4
	nLLCfn2mhgmvcxxvh9t3UgbClkyyaIYo6eof2Un//v9K/3VZhd3bTDhZYxxnEq86iqmNTGtxpT6
	WMAeuOYPZ1dBYmYQPsPoWyrT/whhyVd2p4gcoiLxRnxIy3BaqelqhKgfbNES2uAEbE8OPdCZZTl
	8IMDE
X-Google-Smtp-Source: AGHT+IGyI/+7MJ4IDLyNiZ7HG0se9/Du4KUg/pG6scYz/TegXiOuG86VE+RGX6eH8s+Yzc+aY9yVDg==
X-Received: by 2002:a05:600c:4693:b0:43c:fa0e:471a with SMTP id 5b1f17b1804b1-4409bcfc14cmr9455825e9.5.1745475736712;
        Wed, 23 Apr 2025 23:22:16 -0700 (PDT)
Received: from dario-ThinkPad-T14s-Gen-2i.. ([2.196.40.65])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4409d2bf8dbsm7243435e9.35.2025.04.23.23.22.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Apr 2025 23:22:16 -0700 (PDT)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: linux-kernel@vger.kernel.org
Cc: Peng Fan <peng.fan@nxp.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Shawn Guo <shawnguo@kernel.org>,
	linux-amarula@amarulasolutions.com,
	Abel Vesa <abelvesa@kernel.org>,
	Dario Binacchi <dario.binacchi@amarulasolutions.com>,
	Fabio Estevam <festevam@gmail.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-clk@vger.kernel.org
Subject: [PATCH v12 10/19] clk: imx: add hw API imx_anatop_get_clk_hw
Date: Thu, 24 Apr 2025 08:21:40 +0200
Message-ID: <20250424062154.2999219-11-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250424062154.2999219-1-dario.binacchi@amarulasolutions.com>
References: <20250424062154.2999219-1-dario.binacchi@amarulasolutions.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Get the hw of a clock registered by the anatop module. This function is
preparatory for future developments.

Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
Reviewed-by: Peng Fan <peng.fan@nxp.com>

---

(no changes since v9)

Changes in v9:
- Add 'Reviewed-by' tag of Peng Fan

Changes in v7:
- Add device_node type parameter to imx8m_anatop_get_clk_hw()
- Rename imx8m_anatop_get_clk_hw() to imx_anatop_get_clk_hw()
- Drop the gaurding macros so the code can be used also by i.MX9

Changes in v5:
- Consider CONFIG_CLK_IMX8M{M,N,P,Q}_MODULE to fix compilation errors

Changes in v4:
- New

 drivers/clk/imx/clk.c | 15 +++++++++++++++
 drivers/clk/imx/clk.h |  2 ++
 2 files changed, 17 insertions(+)

diff --git a/drivers/clk/imx/clk.c b/drivers/clk/imx/clk.c
index df83bd939492..a906d3cd960b 100644
--- a/drivers/clk/imx/clk.c
+++ b/drivers/clk/imx/clk.c
@@ -128,6 +128,21 @@ struct clk_hw *imx_get_clk_hw_by_name(struct device_node *np, const char *name)
 }
 EXPORT_SYMBOL_GPL(imx_get_clk_hw_by_name);
 
+struct clk_hw *imx_anatop_get_clk_hw(struct device_node *np, int id)
+{
+	struct of_phandle_args args;
+	struct clk_hw *hw;
+
+	args.np = np;
+	args.args_count = 1;
+	args.args[0] = id;
+
+	hw = __clk_get_hw(of_clk_get_from_provider(&args));
+	pr_debug("%s: got clk: %s\n", __func__, clk_hw_get_name(hw));
+	return hw;
+}
+EXPORT_SYMBOL_GPL(imx_anatop_get_clk_hw);
+
 /*
  * This fixups the register CCM_CSCMR1 write value.
  * The write/read/divider values of the aclk_podf field
diff --git a/drivers/clk/imx/clk.h b/drivers/clk/imx/clk.h
index aa5202f284f3..50e407cf48d9 100644
--- a/drivers/clk/imx/clk.h
+++ b/drivers/clk/imx/clk.h
@@ -487,4 +487,6 @@ struct clk_hw *imx_clk_gpr_mux(const char *name, const char *compatible,
 			       u32 reg, const char **parent_names,
 			       u8 num_parents, const u32 *mux_table, u32 mask);
 
+struct clk_hw *imx_anatop_get_clk_hw(struct device_node *np, int id);
+
 #endif
-- 
2.43.0


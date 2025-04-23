Received: from mail-ed1-f54.google.com (mail-ed1-f54.google.com [209.85.208.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 94DF5268686
	for <linux-kernel@vger.kernel.org>; Wed, 23 Apr 2025 06:03:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745388195; cv=none; b=jCcDlFlnWhurwRtYPrAz58xEvtJANL2aTEZRMaJ5XKIyqjTVg5C8yS4hH4k2sPDl87TbdhWmRkMK7E8qzhLaN5wPrjjpywFyJ5dnhqeeKZtwTJkPVIf+QRR4Dmg2ivqhO+wgS+poHw8vlmuYGTSCVcwhY3bqVxXSdxf1twBx+QQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745388195; c=relaxed/simple;
	bh=2cbL/UoMZsHKenEkqVA3bsu+mxjHyTBuUjF0+bypM38=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=K1kMFiFOO8VgOs/VmUcRE3L4SLheZUD0yZlDYGxYD2GUXjHvluGkcrtf0mLA4GG5ThoA47XF/70h0m7iY+143RBAW0/7YfxXiVW+LNugd70fHjpzXsR2LqDaEQU4ctrxDadbEUNJ82nXA4X7Aw1CbmBxcz6GTx5ipntCdGYnm8E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amarulasolutions.com; spf=pass smtp.mailfrom=amarulasolutions.com; dkim=pass (1024-bit key) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.b=AYl7gZfL; arc=none smtp.client-ip=209.85.208.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amarulasolutions.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amarulasolutions.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.b="AYl7gZfL"
Received: by mail-ed1-f54.google.com with SMTP id 4fb4d7f45d1cf-5e8be1c6ff8so10788286a12.1
        for <linux-kernel@vger.kernel.org>; Tue, 22 Apr 2025 23:03:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google; t=1745388192; x=1745992992; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gDZuiTdlw8039p8GoLYv+uw7eDAfVUu6FSj2o7a4bY0=;
        b=AYl7gZfLqsy0i325CzFdLuqRfsc8K5DL7683LAOT1p8zP6K7LPof7qMBF2xU/RpZrR
         YxiWDocrHD1IKanCiXh+6RKVLoxR/4nfoqXV+jk+XTq2FbDX4uvrtHTu2lQElbMN/x9A
         4nPH3BEf33UqpgvAEq+CKeiwl33AmdViMiXLc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745388192; x=1745992992;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=gDZuiTdlw8039p8GoLYv+uw7eDAfVUu6FSj2o7a4bY0=;
        b=CRIEHrmt7np2cKr2RSIiHzxF9y3SfPC2LEj868LNR7UyKHQYQ4egIjMdVORfwG9tZ5
         NAD++TE5A/uPNgwB8BtJWrFGmj01WE1/DMiCRaB4VSo4wF/z7fPGATzAvxjq561UcLt/
         uMFwnHwE0nlYoH3X6zRSVRl3c1+Z3OfPEktb+PYnBj45j2uipxb7rdsixShS1ZeIrppg
         yseRGeVlQ1IwCAKkWATptQHoWgVrHvaCDGDoyZd18SzmPpi5B4b7tWBUExh0GsX9ZZOq
         EkR5DgTbcqDIE/ZnbQzTfL9jZsRkwxejnOg18u/VkOj6Xnv5GLfCuHAwBxQ10x7eMCfR
         CcmA==
X-Gm-Message-State: AOJu0Yy+t56xBGsgv6eVOIMqoUwSEx9tKhZt2CG1MAFduSZXSrBGbcoH
	HRz0ny9g5lq4v7EpMkDCl0EUP/h1yZeCRcaxI5uY1tP2XTQKYcLgHt+L/h5zn6HX7Nsq2R0sOyz
	5
X-Gm-Gg: ASbGncu4ng31+EbqTjz70U0y7SMLWund3OKXQs3FVj+ZH1A8sb8qHajhoDuaV35mEzW
	L0o2Xjlu5OzPugCu9DQa7tLyk5BwmihmbOooeb8Bgll0EVpXTTuOJBI4/idHX2KbWVik2vLWc0Q
	jpfOOlLSezktiaXTF3U+QxVDp11rDp4zKIWEAD7UkUK3NvxJYcFyRdAIfVesbog6ZjyQOJCdXDZ
	e76ke/l41FCDluPovRoYZhJ5Altb1ieHCDDp7qk4zeQSYnDJRsX3dkwEiUkP2TyW27ILGdjR3Cw
	/s4DLCebW4g0YeFwqdaVADeZwl5u1SlUDqYpW8uQ+GeW2xchjVTdr/cSOsGmghIhNYjc+uXvXoK
	zjvxv
X-Google-Smtp-Source: AGHT+IG9ZwINf1p8AnuBCmxXiuG1HeY2MVi7uyIvKg/QnRhdOn3/Wu5aQjRTNdLl1xCE330o96Hy9w==
X-Received: by 2002:a17:907:6e8c:b0:ac6:b639:5a1c with SMTP id a640c23a62f3a-acb74b5089emr1383851866b.22.1745388191664;
        Tue, 22 Apr 2025 23:03:11 -0700 (PDT)
Received: from dario-ThinkPad-T14s-Gen-2i.. ([2.196.40.29])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-acb6ef9e7e6sm745234366b.162.2025.04.22.23.03.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Apr 2025 23:03:10 -0700 (PDT)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: linux-kernel@vger.kernel.org
Cc: linux-amarula@amarulasolutions.com,
	Abel Vesa <abelvesa@kernel.org>,
	Peng Fan <peng.fan@nxp.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Dario Binacchi <dario.binacchi@amarulasolutions.com>,
	Fabio Estevam <festevam@gmail.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-clk@vger.kernel.org
Subject: [PATCH v11 10/18] clk: imx: add hw API imx_anatop_get_clk_hw
Date: Wed, 23 Apr 2025 08:02:27 +0200
Message-ID: <20250423060241.95521-11-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250423060241.95521-1-dario.binacchi@amarulasolutions.com>
References: <20250423060241.95521-1-dario.binacchi@amarulasolutions.com>
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


Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A5CBE24A072
	for <linux-kernel@vger.kernel.org>; Fri, 25 Apr 2025 12:13:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745583194; cv=none; b=VlPBf0VgIUbTS7nHAhAq6MttPokdG2Wmtu6nAdeogdb4AvsdSyISPk8o4ua7LwdafGf3PMnrqfI/0xWfDVtOgIfE57QUVO+VXNN+qpHPZGwLjXKqccWLm4V7pux+DnvsNoZ5LFQyOZrxrQmKlAK2H+1cMpyhXEikzsr+abhGip4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745583194; c=relaxed/simple;
	bh=JVSzmCDGp4nuQ6agq8glyL213yGkNRHdBwMtv9WYkiw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=aFg1YWD/IlfNGrPDcQc3y/IDSgDbIkPaZxkQxvlQR05jYIQwJiFEbJ/+Jddec+VHnOFhu+SR+q9FMCp0wc2qdowxwsqDyYyDIL5r6EuDDZNIEp8AR95j3kUfIeTfDPiIVniacbSHyqw9KJLCdtuqO+jzn7SqaTPkuEmyiQJCl6M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=fairphone.com; spf=pass smtp.mailfrom=fairphone.com; dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b=3EAXAlIP; arc=none smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=fairphone.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fairphone.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b="3EAXAlIP"
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-43cebe06e9eso15192045e9.3
        for <linux-kernel@vger.kernel.org>; Fri, 25 Apr 2025 05:13:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1745583191; x=1746187991; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Q/1Wlg6H1/gsC3xe3K5/5ZBy+8/izEwpHo4955zg7uw=;
        b=3EAXAlIPUmU+447uG4dAXS2Nmt11G1sQ5LvL+i7L1v68+ykwrXzN91290WI9xq1sII
         RlsdZ+OauloicARLTH/d3rur097WhMO1L50/qg+ckBZ6zmjXQudEiCf7LBagx7uiT9ld
         3BRrJXz/V1f52uCc6AtbJ6QRPJyBlA9baR0r9SxDT7C1il5JzMuVdLComsglWApPTSyn
         jG/saWdpVsJ/QqvgpzOcTfp0J4FpBhGRDwXZDMaLz7envjFfZwqpZ3Vk3eDsMk4tFleN
         MOMi1kXk3jN+IfWUBmXJsU4wFdVYgdNiw0rS2FJSfOwWI/4nHauUo+kCwGY9YXGZjRTl
         kvfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745583191; x=1746187991;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Q/1Wlg6H1/gsC3xe3K5/5ZBy+8/izEwpHo4955zg7uw=;
        b=Br2Fug5DcRuXofx/z6/O6wa09JcZ6fAEzByBb96tfYdNG7BrxGLSc9CaMFbxFsOU/J
         4mIO2FDgXeLnixrDGu0MFAsjKOqdmgfUgXftiToadO/PxMZAbkNGdSQfy2Bq/ZcNqO9E
         8R9G+5Ii/yOypS1Qeie+muzaHHibd6d1SH47BHUUTPYaBUfVSNCm+Dt66GPebrd6qgZ5
         nSI8KVjcAZWHEYep9JJB4/h3+m9c/3dtgdE69FdZ8xvFLvbDHpiUEgRG8R/zbIAfez6g
         /bWaQEbc6k4FVFIdlHqOoIZwCq+1NGl1TsmioYU2x1lB2s+XrOtAn5v4DR3iw2PDGV8H
         rlMA==
X-Forwarded-Encrypted: i=1; AJvYcCVUeECjpStB3EtbnGnMtJcKPw4GsYmsVLZKc/iVqSX/uMl7hcOlRMJ/8LxeFK36pUjL/NTSSTU07ho7ZHw=@vger.kernel.org
X-Gm-Message-State: AOJu0YzXaabSE8Yyccah66FTwdgNVMv/wHK1/XBV28/Ht9n2u2QDyvNM
	qK3W0QvxnuZsufuDb8tkWkKzL5sVl7VG/yE6hofI/OPYzogdkXm3ipd96al/xUg=
X-Gm-Gg: ASbGncsZg7k9Jg42YHVNGdRo3/yZwUBS+MwJ7He5IIia41fQGcb79CGGp3okYCHko56
	s4romfJCo2XnCVzEcI5wbIkfCOyfupXFZS/gUD3p17DDcXxh88i/z2I+b829/8lA3WzsaDNe9s4
	b2tTPgAWq8iTRAVdKfdD50Z6YSwu+dJ8ZwaAqkgEKryi8wKazqXtWykxLuzNpLvrXf5lhXTkqeG
	cGq3KHAHgwP+hOdJQOwBoatWVexskEbuitw3uYiYc1X/gvfzV2YUv2UQZTAn9I1kAd8c+uWPzYd
	tu/MHOP2gB3m8oTiqX3zop9pjQmZRGjwbfXk/1sU8RYIGEia0qrDVP3FMeDmTG9VF7Upl5vfdnp
	oq0twsblK3eEkPfseXBSdoP5syWCUsUuW9rdtwQ0NkiPWk66woBXO0amZ
X-Google-Smtp-Source: AGHT+IEz/JdBLzuttdV2d717kw4v6NRxmdBkm3ghbvJLmxaD7EJVTw/4WP622g4Rua3FQUiTc2w5bw==
X-Received: by 2002:a05:6000:2482:b0:39c:1257:c96f with SMTP id ffacd0b85a97d-3a074fbc451mr1574899f8f.59.1745583190713;
        Fri, 25 Apr 2025 05:13:10 -0700 (PDT)
Received: from [100.64.0.4] (2a02-8388-6584-6400-d322-7350-96d2-429d.cable.dynamic.v6.surfer.at. [2a02:8388:6584:6400:d322:7350:96d2:429d])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a073e46501sm2147310f8f.73.2025.04.25.05.13.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Apr 2025 05:13:10 -0700 (PDT)
From: Luca Weiss <luca.weiss@fairphone.com>
Date: Fri, 25 Apr 2025 14:12:57 +0200
Subject: [PATCH 3/4] clk: qcom: gcc-sm6350: Add *_wait_val values for GDSCs
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250425-sm6350-gdsc-val-v1-3-1f252d9c5e4e@fairphone.com>
References: <20250425-sm6350-gdsc-val-v1-0-1f252d9c5e4e@fairphone.com>
In-Reply-To: <20250425-sm6350-gdsc-val-v1-0-1f252d9c5e4e@fairphone.com>
To: Bjorn Andersson <andersson@kernel.org>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@somainline.org>
Cc: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Luca Weiss <luca.weiss@fairphone.com>
X-Mailer: b4 0.14.2

Compared to the msm-4.19 driver the mainline GDSC driver always sets the
bits for en_rest, en_few & clk_dis, and if those values are not set
per-GDSC in the respective driver then the default value from the GDSC
driver is used. The downstream driver only conditionally sets
clk_dis_wait_val if qcom,clk-dis-wait-val is given in devicetree.

Correct this situation by explicitly setting those values. For all GDSCs
the reset value of those bits are used.

Fixes: 131abae905df ("clk: qcom: Add SM6350 GCC driver")
Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
---
 drivers/clk/qcom/gcc-sm6350.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/drivers/clk/qcom/gcc-sm6350.c b/drivers/clk/qcom/gcc-sm6350.c
index 74346dc026068a224e173fdc0472fbaf878052c4..a4d6dff9d0f7f1216c778165a1fe9604d9ae41dc 100644
--- a/drivers/clk/qcom/gcc-sm6350.c
+++ b/drivers/clk/qcom/gcc-sm6350.c
@@ -2320,6 +2320,9 @@ static struct clk_branch gcc_video_xo_clk = {
 
 static struct gdsc usb30_prim_gdsc = {
 	.gdscr = 0x1a004,
+	.en_rest_wait_val = 0x2,
+	.en_few_wait_val = 0x2,
+	.clk_dis_wait_val = 0xf,
 	.pd = {
 		.name = "usb30_prim_gdsc",
 	},
@@ -2328,6 +2331,9 @@ static struct gdsc usb30_prim_gdsc = {
 
 static struct gdsc ufs_phy_gdsc = {
 	.gdscr = 0x3a004,
+	.en_rest_wait_val = 0x2,
+	.en_few_wait_val = 0x2,
+	.clk_dis_wait_val = 0xf,
 	.pd = {
 		.name = "ufs_phy_gdsc",
 	},

-- 
2.49.0


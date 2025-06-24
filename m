Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2476F2D5C81
	for <linux-kernel@vger.kernel.org>; Tue, 24 Jun 2025 14:32:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750775556; cv=none; b=mudxu8ih4ApOTHQIXQkl8v04yPfRgvXfUGm4JHOr+u+yblMqbS5VaLnaBQCXueVb5EDQqQSewYj/dcdwTI4xT7Ysi2mYz3BAeaEzd1wsUNvNxqOPqDb0Jxzr5t7OAiNt1DY8wDGFOWeabOJd79RQQWF9OzOMpV8jLcKyoTuobM8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750775556; c=relaxed/simple;
	bh=iLYKM5JKB26am82HXGWbhN5RKHqdXM5CcMWlQP2QiyI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=kzSv6+XcMRSA5ZfH3Rma09PfUuBfHkUyMUn9gOrXE7ot17BBnSx+3ild1k9xLWl0fw1WIovbF1KqPlLG0Kc/lTv/inszUdAXkXDbrJSTn4t437UQNOr6mwax/DwLw+tRjfidVOPIPQRWki9Hbmulv5ik7iR8Wzn3MRHgIc8FTNQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=Q3JQBv8A; arc=none smtp.client-ip=209.85.128.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="Q3JQBv8A"
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-453608ed113so48019165e9.0
        for <linux-kernel@vger.kernel.org>; Tue, 24 Jun 2025 07:32:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1750775553; x=1751380353; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=9CNIW5cNjKjCoab6AIakbGKNTJu3VYBmTvjInHO0Kug=;
        b=Q3JQBv8AbiHZ2nKJ/U8E83dqgOWOuiQ67ojQcO2JcQ4Aod//xFjiNmXqHibKLENrLe
         Px7TIIUTifkjREXkSoE0sf4B2EnkFa/70NwS1pcPHYugINOcvWcaysXKNf6uag+FFzfI
         mgcev4nAV8gy00+F/iGS16xszo2McrK3zQLUZc5V5zkbk8WC4VH8DL0A3ye+8+x3KgQy
         i1GWcavpjE7ApGgV2wSV5KlVZNFZpdbIukq+DYHqr49bw2AZIR+L3+FWOEybQn5LtEY4
         aeepJPqnwdlELRuKl5n1Yr5XwmqwvHY4EQg0w67AWhPbXVEQ6InslPsBA4CDbjarp2X9
         xwYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750775553; x=1751380353;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=9CNIW5cNjKjCoab6AIakbGKNTJu3VYBmTvjInHO0Kug=;
        b=FaeSyivaElGkhQq7oFdrF0OUu9APtfFzg6Gk1Wi0qTjB049NnsswvF363WM6DvCAxr
         +GAxauVcBRbwGE/yc56Zrt59B3QYlzk5YGpzEmH8c4jw0Pcv4qHz2WG3ovfSRIg1PDgw
         F7Xkjet1+pnp77q84mNaJNHa+K8WcBGyVINI6zi1KD9Anq4LQyzV8hys2F+ZvAY1U1/n
         0BX1FPz/RillQJulQLPn9TxOQM1BX3nGywlVn0yg8nfA0DP2Y9Of9ZYUFz4A+N3igaub
         6xN6JFB3me8yGRDTA8uS8M0nl7k2x3x5tD5sMOj1DQc+u/cW9cl5OXZ8cprSFESQn77e
         kaEw==
X-Forwarded-Encrypted: i=1; AJvYcCWNiO3MGg3m50udRioc59intQDlwsGqeqw6R730WbeinGPZbivOxE6utTuTi8vJFKAxomwZX4zwZUfw6xU=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy1+Q20atrb34q6wevCfOPPrWss8AcDlOmmnpi8J3HrSm8QnaFX
	Q4xFW0Zc/+2jg8XzHIJNDbf2kUxw5MSt51xPpbrOVRZM1crIBbspBmRRKsFIcvL7D5M=
X-Gm-Gg: ASbGncvwtWFCTHkLnoJGEdkBnViGtP7omfn4QcsuRXrSJD9LPtE6Cqo0z1T7WrPNWBA
	Fmi6ClYQLfTHYhMwNziKlKjcdMqsxccfb6R+/yIuHoG0dH96oPvqqN+BxwicPdwn1Ehg/hD5tTr
	OwJRmv2PKD4VpqbxxKZ/ZQ/QxI37Goe5M4IcLpb3hQNefDwvCPWyt0WJioEjmaiQ68fAgZrYOap
	u8w3pvtKEUkN0hZr0mEiLuNT/c0aVCBqtNMy2BKxpJtcslG2SRc4Rd/5ZfuM3nFFNltod0oxHTJ
	Pt9Q4qLbBISZIHQsrNUyBUBzF/6mmoVfI8Ew6oFSrTQD502nTrp7ZV5v
X-Google-Smtp-Source: AGHT+IGpuQeND4OkNgfppr4DzG+xyz0jUMqc4qLMdr3DGhKhUgWRg/xb9I4Kd3VA/X3bAzgBxw7ciQ==
X-Received: by 2002:a05:600c:8594:b0:453:9b3:5b67 with SMTP id 5b1f17b1804b1-453659f8324mr83368095e9.24.1750775553416;
        Tue, 24 Jun 2025 07:32:33 -0700 (PDT)
Received: from [127.0.1.1] ([2a01:cb1d:dc:7e00:34d2:109c:3293:19e9])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4535ead2a84sm178512935e9.32.2025.06.24.07.32.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Jun 2025 07:32:32 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Tue, 24 Jun 2025 16:32:22 +0200
Subject: [PATCH 5/5] pwrseq: thead-gpu: use new defines for match() return
 values
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250624-pwrseq-match-defines-v1-5-a59d90a951f1@linaro.org>
References: <20250624-pwrseq-match-defines-v1-0-a59d90a951f1@linaro.org>
In-Reply-To: <20250624-pwrseq-match-defines-v1-0-a59d90a951f1@linaro.org>
To: Drew Fustini <drew@pdp7.com>, Guo Ren <guoren@kernel.org>, 
 Fu Wei <wefu@redhat.com>, Bartosz Golaszewski <brgl@bgdev.pl>, 
 Ulf Hansson <ulf.hansson@linaro.org>, 
 Michal Wilczynski <m.wilczynski@samsung.com>
Cc: linux-riscv@lists.infradead.org, linux-pm@vger.kernel.org, 
 linux-kernel@vger.kernel.org, 
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1879;
 i=bartosz.golaszewski@linaro.org; h=from:subject:message-id;
 bh=yIgDwVNP75QjxnnqZUB0eGQftgqLdSGUdNGqQ1mRb+U=;
 b=owEBbQKS/ZANAwAKARGnLqAUcddyAcsmYgBoWrb6qvHHx1tWdZ36+EKv6o8uu1Y32EArBy66E
 w7IaTlvyISJAjMEAAEKAB0WIQQWnetsC8PEYBPSx58Rpy6gFHHXcgUCaFq2+gAKCRARpy6gFHHX
 csZVD/9fv5ytgmoZV9N33yr8RMxpPBdNHbhkZf5RLOhy3kaBXhDurMDLG8dJ5gKQFjqAlE3EfXF
 eJv5toKg4IJYqISkg5O5CnP2z5+DYZLrVhsvD50ZTLF/SxmuoJr+Nm761WUIotQm/fyaVlG5L16
 YpuTxlQx32/iAfiz5p2zcoR3as535Y4h0/uPtpvx96MA+K4G/8iv3m416K1ucMaFiGKXFhLLdxG
 pAtEFKVWU4znKw8FzQfdwGV5D4Vpx0GpBGSz1VIT1hkhnLjgUgjXMOUmeWuvJtPm+lGH7zp5f/F
 83VVNmuppn2vC1clDinjXBZxHEyX6X2nZ/tDgXXJr3UI0QeOrJH8cq3Yz9sgkFlHKd/Vw8/N9nA
 G1QqG+Prg1iL8tX0ntGheLYp52P4yVg2LCc+G7T5btmiuvWE9gsU/hU/4eW7ogsbrWHCDwJ1dYj
 i6mxMhkOLxVjNB8GnhbYq3D/kNwAcJHyaUIebLmPmjgf2iaioEnWBTJajwEr0CsJCq851pDlCPg
 7uQrZiFWMv3OVzsX653lXcONTHxlEZM/yTNo+UcguuyUI66JQY3pRu5H4NHxUwXRtnu01VcND7q
 uZnFMJVi4uupkyRhrVT7h6v7UGwdJhtA0BsQXRbI+gveepJ+I2hjVNjbzRo+SBDsDh6O61455YC
 +QHJk5DawusRH0g==
X-Developer-Key: i=bartosz.golaszewski@linaro.org; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

Replace the magic numbers with proper defines we now have in the header.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 drivers/power/sequencing/pwrseq-thead-gpu.c | 11 ++++++-----
 1 file changed, 6 insertions(+), 5 deletions(-)

diff --git a/drivers/power/sequencing/pwrseq-thead-gpu.c b/drivers/power/sequencing/pwrseq-thead-gpu.c
index 855c6cc4f3b5bd1aa6e93305af0417d5791b092d..7c82a10ca9f6917e673711c55dd5e58e58dc8f5c 100644
--- a/drivers/power/sequencing/pwrseq-thead-gpu.c
+++ b/drivers/power/sequencing/pwrseq-thead-gpu.c
@@ -124,24 +124,25 @@ static int pwrseq_thead_gpu_match(struct pwrseq_device *pwrseq,
 
 	/* We only match the specific T-HEAD TH1520 GPU compatible */
 	if (!of_device_is_compatible(dev->of_node, "thead,th1520-gpu"))
-		return 0;
+		return PWRSEQ_NO_MATCH;
 
 	ret = of_parse_phandle_with_args(dev->of_node, "power-domains",
 					 "#power-domain-cells", 0, &pwr_spec);
 	if (ret)
-		return 0;
+		return PWRSEQ_NO_MATCH;
 
 	/* Additionally verify consumer device has AON as power-domain */
 	if (pwr_spec.np != ctx->aon_node || pwr_spec.args[0] != TH1520_GPU_PD) {
 		of_node_put(pwr_spec.np);
-		return 0;
+		return PWRSEQ_NO_MATCH;
 	}
 
 	of_node_put(pwr_spec.np);
 
 	/* If a consumer is already bound, only allow a re-match from it */
 	if (ctx->consumer_node)
-		return ctx->consumer_node == dev->of_node ? 1 : 0;
+		return ctx->consumer_node == dev->of_node ?
+				PWRSEQ_MATCH_OK : PWRSEQ_NO_MATCH;
 
 	ctx->num_clks = ARRAY_SIZE(clk_names);
 	ctx->clks = kcalloc(ctx->num_clks, sizeof(*ctx->clks), GFP_KERNEL);
@@ -163,7 +164,7 @@ static int pwrseq_thead_gpu_match(struct pwrseq_device *pwrseq,
 
 	ctx->consumer_node = of_node_get(dev->of_node);
 
-	return 1;
+	return PWRSEQ_MATCH_OK;
 
 err_put_clks:
 	clk_bulk_put(ctx->num_clks, ctx->clks);

-- 
2.48.1


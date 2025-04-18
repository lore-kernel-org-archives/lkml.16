Received: from mail-qt1-f182.google.com (mail-qt1-f182.google.com [209.85.160.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA5DA1E0DE2
	for <linux-kernel@vger.kernel.org>; Fri, 18 Apr 2025 14:54:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744988058; cv=none; b=YNwyZ562c/6b0Eq3wP2z8jamg/TpHeGujcZsB5ItRSl94O6SLiBJ5xzQ9/IfTx/4+Zi+bv/wFbKAuE+LgWHjKPdJPp4Gqi+P6PCZu9waUT4rgzIif+hg5zTfosfPHbq0G1Xb2SRmtm27PUesZJHjvOMyqBp0bDtZAWQi3WzadgI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744988058; c=relaxed/simple;
	bh=2wkF3pIspsBICKC2HLHsuT/AUDwllqmRkvg4pojS36g=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=dI81tiHcIIt512KFCR58fKTrTsqjOhc7LCSPslIsSVaHTyEJNWA0bKHSO6jrZeCXzrO9VUZLeV2cIE4A5p5tON1mPHU3M+p8AdOKgoIIUgzKSuIatpdhhhztcZc+g3FF/zFeig9jmskFseDH52ihFvxJKxEEOWJ7fFACNbI8LSc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com; spf=pass smtp.mailfrom=riscstar.com; dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b=brB4WiJ7; arc=none smtp.client-ip=209.85.160.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=riscstar.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b="brB4WiJ7"
Received: by mail-qt1-f182.google.com with SMTP id d75a77b69052e-477296dce8dso18124191cf.3
        for <linux-kernel@vger.kernel.org>; Fri, 18 Apr 2025 07:54:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20230601.gappssmtp.com; s=20230601; t=1744988056; x=1745592856; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=eoPF+bCrpMBavT+34w02cPZ0ktfHw7A1w/wlErW18/c=;
        b=brB4WiJ7ykQIKkjXrsw4pJSxQ0RzOI6JhiBwqVGN35guHjs8QLRsD2LRvqfQ19v3Ck
         WssnAE6C+TEGUQaT6gO1f9c5tGmax0GoxeBzRzaPxJSOMiyZMXUcwpn5FKE0EwQ4Dedn
         44XK/viYf2HaVWAV9kEv/vmzYIxk4SifolvdtSKUwXWqLyINHz3rQnEors1kMxhNtDWM
         uIHkD8uLVnWF29+ZOEOPj+yguxceA0CFH6GViIw1N4klLtJRE8LZNtvp4BT871RYhVa5
         vAn0Kcj+4HjNiVWNHihLekgL86hUTfIQyvONsWXSO8oaKF/cOsIzk4AKdv6uAsnXU81j
         6REg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744988056; x=1745592856;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=eoPF+bCrpMBavT+34w02cPZ0ktfHw7A1w/wlErW18/c=;
        b=WtOAe7P6fNqLRNmXOabhg0aF7NVe0AswY4hs7Pq1faFGH3eD+dOdX1LDMdtbPLCsDa
         +lbB3r1xhFI+jRkpyg3jmkqOxpXM+sjQlTPArnKO7rscqYJy8F2Tl2sofrJWdKl+0K5Z
         1BFIsgGlf05+Ysk7/jYMhUAIx9093wzfTK4M9n2BgN1W7X9ixaqaFVlcqkOZuaLYpz2F
         orm30zc90tcXJNc3ZVFyqWe+p9AfgRkJE0ttLLD/qkanabcJHvVwqdBirgg0Z30NBLFj
         MUUlenAcelqdfEITGY5wvafmp616lnur5xytuQKr7mqWqVFmWptTEw+931j2uQ0rHgEi
         J2IQ==
X-Forwarded-Encrypted: i=1; AJvYcCVwMJNOdn6Krhq5zPQueoKlYhypMnbacuo/1EEYzN5GLV3rvoYQOaM4m2bywJvMJbA9bcAUZJDeTnWxiYc=@vger.kernel.org
X-Gm-Message-State: AOJu0Ywu+JcmKnyOmT7gjl48E34EYP7Fc3ICiuKE6MS6C7fY98Zp6jA3
	+0+eK7ZjPRUfngOOtM1zUgiypUOeUQfJaqCb71MqXhzoibfddxh8Ug1JXQUrOdk=
X-Gm-Gg: ASbGncvBhUGiczgKqYSEUedCJTEEzKgGxj+LTlrfL1pqBvt75UP94HF3fct0QjfvtCE
	+TLono0XTo4vDMlH0nWAwVWX6OzxUVGjWDyUMKI0dzkbt/pUAHLinaNVnuVAV31Yap7QGEVmwkP
	XXYMwpgsGzMPwHpRz3wpprOq4HjhiGbQhiuKttflZfU6W685EM61/LkduQPjiOhw5Tfe6d1vIjv
	TPWULR5bEURf1yll9kp2SiXN0yHsbV0eRoDMry61JWrC0grzTFFtNxRlLt5i6QFTxVFB4c0TKwF
	sqAVMi/rcYa+xMTsoYrFUiAsIN8QcHxoIhP0Av8bS909Bi+u9lZVcymWxjf0ODxPiUCbNlhcKb5
	PQG/T5qWWuSRVxg==
X-Google-Smtp-Source: AGHT+IHNVbMfjIlfo9PHEWLdLnnlwobHS10wrAnQS7/2BfmnC2z46vdeRRFOkin5pnaA1y6blfUwPA==
X-Received: by 2002:ac8:5fc6:0:b0:479:be67:3bd2 with SMTP id d75a77b69052e-47aec3cb8f4mr50692481cf.23.1744988055824;
        Fri, 18 Apr 2025 07:54:15 -0700 (PDT)
Received: from localhost.localdomain (c-73-228-159-35.hsd1.mn.comcast.net. [73.228.159.35])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-47ae9c16ddesm11329201cf.3.2025.04.18.07.54.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Apr 2025 07:54:15 -0700 (PDT)
From: Alex Elder <elder@riscstar.com>
To: mturquette@baylibre.com,
	sboyd@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org
Cc: p.zabel@pengutronix.de,
	dlan@gentoo.org,
	heylenay@4d2.org,
	guodong@riscstar.com,
	paul.walmsley@sifive.com,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu,
	spacemit@lists.linux.dev,
	devicetree@vger.kernel.org,
	linux-clk@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v5 7/7] riscv: dts: spacemit: add reset support for the K1 SoC
Date: Fri, 18 Apr 2025 09:53:59 -0500
Message-ID: <20250418145401.2603648-8-elder@riscstar.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20250418145401.2603648-1-elder@riscstar.com>
References: <20250418145401.2603648-1-elder@riscstar.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Define syscon nodes for the RCPU, RCPU2, and APBC2 SpacemiT CCUS, which
currently support resets but not clocks in the SpacemiT K1.

Signed-off-by: Alex Elder <elder@riscstar.com>
---
 arch/riscv/boot/dts/spacemit/k1.dtsi | 18 ++++++++++++++++++
 1 file changed, 18 insertions(+)

diff --git a/arch/riscv/boot/dts/spacemit/k1.dtsi b/arch/riscv/boot/dts/spacemit/k1.dtsi
index 584f0dbc60f5b..491ab891788b8 100644
--- a/arch/riscv/boot/dts/spacemit/k1.dtsi
+++ b/arch/riscv/boot/dts/spacemit/k1.dtsi
@@ -346,6 +346,18 @@ soc {
 		dma-noncoherent;
 		ranges;
 
+		syscon_rcpu: system-controller@c0880000 {
+			compatible = "spacemit,k1-syscon-rcpu";
+			reg = <0x0 0xc0880000 0x0 0x2048>;
+			#reset-cells = <1>;
+		};
+
+		syscon_rcpu2: system-controller@c0888000 {
+			compatible = "spacemit,k1-syscon-rcpu2";
+			reg = <0x0 0xc0888000 0x0 0x28>;
+			#reset-cells = <1>;
+		};
+
 		syscon_apbc: system-control@d4015000 {
 			compatible = "spacemit,k1-syscon-apbc";
 			reg = <0x0 0xd4015000 0x0 0x1000>;
@@ -514,6 +526,12 @@ clint: timer@e4000000 {
 					      <&cpu7_intc 3>, <&cpu7_intc 7>;
 		};
 
+		syscon_apbc2: system-controller@f0610000 {
+			compatible = "spacemit,k1-syscon-apbc2";
+			reg = <0x0 0xf0610000 0x0 0x20>;
+			#reset-cells = <1>;
+		};
+
 		sec_uart1: serial@f0612000 {
 			compatible = "spacemit,k1-uart", "intel,xscale-uart";
 			reg = <0x0 0xf0612000 0x0 0x100>;
-- 
2.45.2


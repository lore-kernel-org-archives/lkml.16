Received: from mail-oo1-f46.google.com (mail-oo1-f46.google.com [209.85.161.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 954931F875A
	for <linux-kernel@vger.kernel.org>; Fri, 13 Jun 2025 01:11:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.161.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749777118; cv=none; b=ZvA3Y4jEtY+lMtcxZEkasnKNSEQP+hWwh5Zt0XCsolv8WOLuGSL9VWfLH7U3KP02J/kUPCKAdcD8ybEujAsn0P23WR/aE24npqXLfqUs+VNJ2NvZNoIpq5QJsmN6udUUPSHUJunPz70v+on8dkga+G42EBkamhhrqfFtRPL9mXI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749777118; c=relaxed/simple;
	bh=ofhrWzbkHpmkRBFTa000gjfyL5s3fJzmMKuP+Rinp2c=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=R/+ELNz4X1mp3I+vMu3TkM2Sp1iaAB4jJMQDunww54W3j6HyRA98etJmWYBl2DL+JGCUYBAPXLID4K0Rr6n+/wHHZMZtF05OvFpNZBxwolyTkUUy7lllId5Gva8/ElogfllRXwhkphCIFY1vKfUD6UHyStz5t6yJINTnEqpCunw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com; spf=pass smtp.mailfrom=riscstar.com; dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b=rzwb0w2n; arc=none smtp.client-ip=209.85.161.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=riscstar.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b="rzwb0w2n"
Received: by mail-oo1-f46.google.com with SMTP id 006d021491bc7-610dfa45fa2so916067eaf.2
        for <linux-kernel@vger.kernel.org>; Thu, 12 Jun 2025 18:11:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20230601.gappssmtp.com; s=20230601; t=1749777116; x=1750381916; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hXQ0rLrEsZDkkO0xDOFrK28pA119DtQt4oQHk7dYEkk=;
        b=rzwb0w2n5AvxAfY/2lxncPaWf58Uof4h/hNJ4tOREjuGnidyIzDmvVHBMRh2PPyw4O
         emULH71LWz88F/4+Nu7kdB+Px76c9ufo0X50iIjKaRWSPSms/CU032sWZ+ebHepuWiAM
         LXvsBeA13Z1J68GFSS7o1Nv4nuuFkZynMs3Ky/zOMAyb/aTTGJRRrv7BM3CXRzIoTEAA
         aLG8qbLzC2Fe/J7hqFNIgUIRjSjVIW1J8d59vye3R1dEafCmuT1B4zKXqxlInGkrSfgg
         J+DaxXWJPQw9+ZqUxlu+Gc43YwF+T+9GA3VtULuAh04MD2pdoHbcf8Y44UNjcAhjxUsN
         zrzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749777116; x=1750381916;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=hXQ0rLrEsZDkkO0xDOFrK28pA119DtQt4oQHk7dYEkk=;
        b=S5Swg6A7SW+6fkC3HNYgmOs7lrmaujhLhu2vKcQI9LFo+c8wmwMqcMB4mN/VgSlo3d
         6Jr75erZQ3F1hChtLeteB5h85moseqlu2UcpVminu2ga7NyqKvhg+p4r34yPfDLh2t02
         mvdcf/IBFsQCo3HmYKHA6oDk6uIhZtPC89bFJgmAZd9Nj8vdlU5jQa6paJUZ0t3onPRC
         JA4E3EbZwrjExrkcMeHmuNH/8gVJ2ZhxKIjI0ny032JGrw7F8d2QB125fRDD2SfIPIJl
         QChn72yHfXOrNWN5yEV2EUO/cDw+0khLMMmF2C9p5ISH1U1H1MR7k61PjACnifb5KPQ/
         aLjg==
X-Forwarded-Encrypted: i=1; AJvYcCUM/BrJDgS38ZuxQkYsQMKSS49h44C4tBTmUvl0G3ciFoFB1IlQbFc1qoCga9wmLqm8gfC37HnpaYTV310=@vger.kernel.org
X-Gm-Message-State: AOJu0YyRX/AjKiyEsAt8fsk+N0l5HhvDnjZ+YWLZn8lAB4fiE0cDBJ4/
	Zz0YifnskOv9tRJs310n2q1QT/NR/Syx8NWVeIhfS0DwdXb20XGEZJUujEOdkpqEHZE=
X-Gm-Gg: ASbGncufmg+XvZJKayUm5E26RWraMAPbVYQgR8xIjQJXmRjBYTZCTB1uw+8qRLHHVw7
	4o0Uwb5qYIMaM6yuVZ7xcesp33cvLrPmELAs8O0VttE0GQM6N8IM/oWPV+6OW+N8fD1SQaLFVum
	z3oGDxq8cvUQp+xrBkDc4mO+9PXVcNKLZa7SqKAVhRts1p9NVaBMSU9lgLfCy+R5QVJnzsPOTwS
	oD2IJBABVCUa1WB0La0RZaJUwA+KRThrR1rhxzW+R8ahooDZ/FqUdw3JQiNe3EaQyFO6i3gdyj+
	xa0C2tUWRDaXSaodqZo9U6Q+gIv9AmE+AnEICb9Dgnv2HOPHH+w9gt2iH3Den5iQFp/t9l6c2/t
	AfBMKSnDTIbJGtjnsvZtAcbpAawp2FHU=
X-Google-Smtp-Source: AGHT+IHLGWUc6QmwDBxYgPL11fCgmmDxgrSTZTWJDq5NM0vixs6NHFASZt4TXSVYr14kHaayK453+w==
X-Received: by 2002:a05:6870:ce88:b0:2ea:d491:eb45 with SMTP id 586e51a60fabf-2ead510a3fbmr744385fac.18.1749777115684;
        Thu, 12 Jun 2025 18:11:55 -0700 (PDT)
Received: from presto.localdomain (c-73-228-159-35.hsd1.mn.comcast.net. [73.228.159.35])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-2eac0c17211sm407685fac.18.2025.06.12.18.11.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Jun 2025 18:11:55 -0700 (PDT)
From: Alex Elder <elder@riscstar.com>
To: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	mturquette@baylibre.com,
	sboyd@kernel.org,
	p.zabel@pengutronix.de,
	paul.walmsley@sifive.com,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu,
	alex@ghiti.fr,
	dlan@gentoo.org
Cc: heylenay@4d2.org,
	inochiama@outlook.com,
	guodong@riscstar.com,
	devicetree@vger.kernel.org,
	linux-clk@vger.kernel.org,
	spacemit@lists.linux.dev,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v11 6/6] riscv: dts: spacemit: add reset support for the K1 SoC
Date: Thu, 12 Jun 2025 20:11:38 -0500
Message-ID: <20250613011139.1201702-7-elder@riscstar.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20250613011139.1201702-1-elder@riscstar.com>
References: <20250613011139.1201702-1-elder@riscstar.com>
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
Reviewed-by: Philipp Zabel <p.zabel@pengutronix.de>
Reviewed-by: Yixun Lan <dlan@gentoo.org>
---
 arch/riscv/boot/dts/spacemit/k1.dtsi | 18 ++++++++++++++++++
 1 file changed, 18 insertions(+)

diff --git a/arch/riscv/boot/dts/spacemit/k1.dtsi b/arch/riscv/boot/dts/spacemit/k1.dtsi
index c0f8c5fca975d..de403bda2b878 100644
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
 		syscon_apbc: system-controller@d4015000 {
 			compatible = "spacemit,k1-syscon-apbc";
 			reg = <0x0 0xd4015000 0x0 0x1000>;
@@ -553,6 +565,12 @@ clint: timer@e4000000 {
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


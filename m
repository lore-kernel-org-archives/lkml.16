Received: from mail-qv1-f47.google.com (mail-qv1-f47.google.com [209.85.219.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB25C1EA73
	for <linux-kernel@vger.kernel.org>; Sun,  4 May 2025 20:40:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746391256; cv=none; b=W40pEyhWg485kEXIHkCPn/2HCGWSP0CXMMtLw2+F2GzEDlbtROO6eXqd4ZjZ7yWEo8aOV8IR7wk8eykhiBoUUAlaStLT+wnVpDRuMNN2hR6n/rhKRotWY3akCOvq59X+Wdj7hjDkMBNmvXd87CJm9O5pUiybGI35Igh+TQxmflA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746391256; c=relaxed/simple;
	bh=J8RF/lsUF5GcLk8L8uqeVEbhBkocOk2PKLD50TKSmnk=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=Vk3/j9I+gsPPYE1CXMYTeoloxKMEZom4jOP6X1wllnM/ZLBpz9D/9WIf1dEfQSJiG6zi/7jPKTdHTjH7WltN2fqcD7qoq1B3m1h64qWnIGMtmtHt8HpBCkXAj6q1/2YtPLOlr5jdL/vyIRqtFeModWUaHxIGzKzDaElSqHW4O8U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=L38y3IGL; arc=none smtp.client-ip=209.85.219.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="L38y3IGL"
Received: by mail-qv1-f47.google.com with SMTP id 6a1803df08f44-6e8f05acc13so54281816d6.2
        for <linux-kernel@vger.kernel.org>; Sun, 04 May 2025 13:40:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1746391253; x=1746996053; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=C0s2dBLBP6hSN1djmfjptMhw6J9xUsy7meqkws5R5+0=;
        b=L38y3IGL6HIWuqSGFCe2tzyd5V0hoh0R/Ma2/cPHTNuMZ1ovlb82UQfsOAsvIbfKKW
         pkX5NWfPIxgethrjF5wpNT+ZfHWN6foIcoRWy3sdI/2KZCOlWz88yl8HyScyWyNhG3z7
         K/HJxz8VAQ1HzSqVS8wtzu9SCpb273uBW3lBHPvuk/UcpXMdlmLomFZ73eIaW/BTqiNS
         E84gjn/0AM8jcjFZIJ0t6cMxWYhO4G03lhgXj0lcNaykn0w9bwxj8Jz1aCpP4JFLGKTs
         8RJVodBzSLnEJWDgRgfaXi0+r0n24ccS6scm92Cpkefc7dfZJNY9DJUWiwRhDp0YjmYK
         6t1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746391253; x=1746996053;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=C0s2dBLBP6hSN1djmfjptMhw6J9xUsy7meqkws5R5+0=;
        b=S+PFuNp6cVDxyzvuX2/+0VXdJm6vbfkysiwxlGTfyVtiQPKF03An01fAdWWXO0h4It
         wpnkaSluFH+3KOGzllIPU0CfuqYSYea989uqLv9liABOMUcaoRmVztIPMtWh+tHgw12H
         sYebrxUd7sKCtI8szzeBry1euTM5IRy8wTNmXpiw97jmyLjaYnssl/hMkdTaIGu/UKi4
         AR+5W7PbS6Wpa7UTH/MP1DO/R2Lp11ADoG2x4Hct/54NrfscyGSs8xBAwzY1VixyhLwF
         ORXyosNtxjoJECDN4EY4LKTmi07Szd3lb7XwMx7wrqt6AM4enmojR+c8No9b9j3ifzvX
         jZeg==
X-Forwarded-Encrypted: i=1; AJvYcCUToovlDEBHospPAiYPHC0s/rEPB2HuZmHmKP9q45du3RmWifHyqA5SVrunjmIflrjcU5F5cxq2ju1ZQDA=@vger.kernel.org
X-Gm-Message-State: AOJu0YxyfphDk8V69gg1ZAQjgN6kK+cJTLMV/NmW9Qp3l8nFTASbh+H7
	zOBfQ1kn0SDqzq8rjJ5OCECftVZhT2YKUeW5DSgZda0U4jeUttxk
X-Gm-Gg: ASbGnctEfcAxrvxysoTZs+e5jvCjTpya+PTDIofp/g4phOGPD8mgh+G5wcyWvdJp1bL
	FZJNpOuKFSng6Iu3sbYXCW5oa7UOl2NKhv1C7+yYSfwi5Jcy6X7JYRzB/kmLdEFbvTRPNm0f2to
	r4FSwNfY7O+IqQ95kcMt8VKZI3EoWXPsaijXm5ETyjes51fENco8Fv0TJcWDM/7fiD42BlwDN0D
	dJ05aemxxZMJgvqIsIOe2Jkw2bsmPxi8CIMdi2E0RaTyd/SlJozB2YmoHJBiDC4d3CF374pRU38
	KqRVpP07wMB6JhcrMVOzdZyfw9Ne+39QdkIzZVyBw5Trom37/27/Zqk52lVWpjjo+bzn8u+LY58
	/AVwhEOCp6TKEDMSA6amdDLO/7w==
X-Google-Smtp-Source: AGHT+IGrOMfHKYgMEG4u4xcEOLbbr0nQ/l6siJ0vTPu109XdvaGVgGXlx8qArEX5wngHMwMb6/CfWw==
X-Received: by 2002:ad4:4eaa:0:b0:6f2:c79b:ef9b with SMTP id 6a1803df08f44-6f528c62179mr78754496d6.16.1746391253437;
        Sun, 04 May 2025 13:40:53 -0700 (PDT)
Received: from aford-System-Version.. (c-75-72-162-184.hsd1.mn.comcast.net. [75.72.162.184])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6f50f3c3892sm46286516d6.34.2025.05.04.13.40.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 04 May 2025 13:40:52 -0700 (PDT)
From: Adam Ford <aford173@gmail.com>
To: linux-phy@lists.infradead.org
Cc: dominique.martinet@atmark-techno.com,
	frieder.schrempf@kontron.de,
	u.kleine-koenig@baylibre.com,
	aford@beaonembedded.com,
	Adam Ford <aford173@gmail.com>,
	Vinod Koul <vkoul@kernel.org>,
	Kishon Vijay Abraham I <kishon@kernel.org>,
	linux-kernel@vger.kernel.org
Subject: [PATCH 1/3] phy: freescale: fsl-samsung-hdmi: Rename phy_clk_round_rate
Date: Sun,  4 May 2025 15:40:40 -0500
Message-ID: <20250504204043.418924-1-aford173@gmail.com>
X-Mailer: git-send-email 2.48.1
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

phy_clk_round_rate sounds like a generic helper function.  In
reality, it is unique to the phy-fsl-samsung-hdmi. Rename
phy_clk_round_rate to fsl_samsung_hdmi_phy_clk_round_rate.
No functional change intended.

Suggested-by: Uwe Kleine-König <u.kleine-koenig@baylibre.com>
Signed-off-by: Adam Ford <aford173@gmail.com>

diff --git a/drivers/phy/freescale/phy-fsl-samsung-hdmi.c b/drivers/phy/freescale/phy-fsl-samsung-hdmi.c
index 10fbe8dee116..40f33e5ac6f5 100644
--- a/drivers/phy/freescale/phy-fsl-samsung-hdmi.c
+++ b/drivers/phy/freescale/phy-fsl-samsung-hdmi.c
@@ -531,8 +531,8 @@ static u32 fsl_samsung_hdmi_phy_get_closest_rate(unsigned long rate,
 	return frac_div_clk;
 }
 
-static long phy_clk_round_rate(struct clk_hw *hw,
-			       unsigned long rate, unsigned long *parent_rate)
+static long fsl_samsung_hdmi_phy_clk_round_rate(struct clk_hw *hw,
+						unsigned long rate, unsigned long *parent_rate)
 {
 	const struct phy_config *fract_div_phy;
 	u32 int_div_clk;
@@ -616,7 +616,7 @@ static int phy_clk_set_rate(struct clk_hw *hw,
 
 static const struct clk_ops phy_clk_ops = {
 	.recalc_rate = phy_clk_recalc_rate,
-	.round_rate = phy_clk_round_rate,
+	.round_rate = fsl_samsung_hdmi_phy_clk_round_rate,
 	.set_rate = phy_clk_set_rate,
 };
 
-- 
2.48.1


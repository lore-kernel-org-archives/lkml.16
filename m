Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F21B0158520
	for <linux-kernel@vger.kernel.org>; Mon, 16 Jun 2025 06:25:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750055151; cv=none; b=XU1BLjlVW3qEfMnX+7fH5s4DbLQUmgnZG76XP/rIhWGGaZScCdE4F8UvJ59fOIxdZ0YdxLhS4paH26jOqrdMoxY1Sp3y+eCP5pDDq23xjS9f2TRIvoPX/JJtZ2d2x4FL5skN50JhkM/g9j5h7ZindtSqVWSneIFBGs5ci0LTdE8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750055151; c=relaxed/simple;
	bh=hP8oqMRH0eoAXRKjft8SzhqvyrnpxIF8t2YdwglNn/Y=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=eeh/HifcW9dwEkxWNsM2UJkHaz/Q7Lp5d+FVeSCmhSeXXW8JzX/4M2DOqH4DrBLZ4imc+yph5s7JR2QcMEk165alOqUfDMutCvWPPGQpk65e7IjePy9AbVcQZ/OqR9Nprjy3rdD3EanKyWzSgpbN/ISnYM2rEDU2EH+z0J3M8x4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=vuW4jsZP; arc=none smtp.client-ip=209.85.221.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="vuW4jsZP"
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-3a4ebbfb18fso446175f8f.3
        for <linux-kernel@vger.kernel.org>; Sun, 15 Jun 2025 23:25:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1750055148; x=1750659948; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=8EQHsf96Ap45pHjzL8MdOZppUdVax0jMIgbyM9QNM/g=;
        b=vuW4jsZPxBkJAzDyGuNMb7hRAH05Fh6wyQ49hAoAhuBeQMuJH6iNgXFY8DQ7rjEtlV
         FCmb8gB9N9jCEKwOaZaKsN9Jq04F237M6Rqi9GnoJLLFeZvGtiQdki5zQogdvpAeNN7w
         CxdJTk8neLILOFNMtzPvV5ZHoE70XIoeqq9pAyKnBF36vCknukfgVbx+yLp/IKLS8l3L
         MBvM0LCALM6uQfB91y6s1Hwu3FthoPVUhMFOiPjLXkPFCrRAER3rUAvKD/MJpCfXhMI+
         PieOitRLqpCQKdJNAkDqlSR3DnxjN3UQrQdMXpIVF7zRH3HUhq2HKB/6cWPI0kNAndXU
         WoHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750055148; x=1750659948;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=8EQHsf96Ap45pHjzL8MdOZppUdVax0jMIgbyM9QNM/g=;
        b=Oe2it414iDW9TeV/j2bVc8JNReYqN6Q+4PkS6+SXXR1TSoFUQOGgAeoku5zDZPWM3l
         ILcl7hHTXl/YvtfGE/cSHsV39w2mr+TDEarL5fOtOEVa8Gkgi2eb5CYZTm/Nl/mJjBGa
         NhwePdWtl/Rk8pd+iSE3Vh4dVglx9wQLrufP+jxTEbg8r8QtDQ6HmAXtg7kyBWZV4XaX
         9DIC3uAdHdtijjdn/JabtsmogaBq96rKm3SZNjWKtsxtfA8eduBkYwR6FvWZOu4lZZVX
         /ssB5rFH58jJb5fxU54EbNl79lNG0kIEoEODrfxYlWQqBFd1oIguRrRWRjm7RSKSJC60
         KFzA==
X-Forwarded-Encrypted: i=1; AJvYcCXUMnWAkJDCYpPIr+grcrPP4LU+CUJF6VRPVJM1hKTqZsG/jgJkbpHfyBB6iyY8u4SVGmp+NkodzvuYAsA=@vger.kernel.org
X-Gm-Message-State: AOJu0YwT2PQlfgXrd704uujqBDr6XZ5Cc19zJNGhELIWjjj6kWbDfzPG
	J6WaE09RjexlrOOzslEi78u/ZYxV7asYUr89BJ5VV64cN/taTNKD5RnCz5CZ05RBemc=
X-Gm-Gg: ASbGncuwm0+V9iX+8AfflaDGDv68WbwcvXCuXBNndWlqI59HiSt8fOYsNN+/Jz4E5K5
	Z5A000O585baAAGX/funOfazH/X/lTD84ndPEzK/dz1lZJxtNSg3QZsZT0JgsCnjBYX87tQczFe
	6HhVZi9BoF+z0hYr/LI+HkqgcsnQGv1z1sYVMZSsSJ1Eo9nM9E9Z9EuJG8TINFKcdRddzu6o/sb
	9W3Re9ZVtcPH+pSZUeWpvbv2JpHGSuZ8RuqQoMoe6jCxyPEs5CfXGvbTtMQCg5PFdGsKBBAqFEd
	OLS/kMrDBWobjBV9d4OqQlc6vgJqqkfRhgGA0IjjRAGafO5AGpLWgPOwHf12pINauKXg9yw2sA=
	=
X-Google-Smtp-Source: AGHT+IHOrBlTc3G8fJx1xb1aa5RUGG1oL3w34p4Na9dKbV7Y1WMOLPihmPd28RFY8vCtYNB9cSHDiQ==
X-Received: by 2002:a05:6000:18ae:b0:3a4:f912:86b2 with SMTP id ffacd0b85a97d-3a5723a1dd9mr2082389f8f.11.1750055148252;
        Sun, 15 Jun 2025 23:25:48 -0700 (PDT)
Received: from kuoka.. ([178.197.223.125])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a568a54423sm9883073f8f.20.2025.06.15.23.25.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 15 Jun 2025 23:25:47 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Vinod Koul <vkoul@kernel.org>,
	Kishon Vijay Abraham I <kishon@kernel.org>,
	Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
	Melody Olvera <melody.olvera@oss.qualcomm.com>,
	Wesley Cheng <quic_wcheng@quicinc.com>,
	linux-arm-msm@vger.kernel.org,
	linux-phy@lists.infradead.org,
	linux-kernel@vger.kernel.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH] phy: qcom: qmp-combo: Add missing PLL (VCO) configuration on SM8750
Date: Mon, 16 Jun 2025 08:25:42 +0200
Message-ID: <20250616062541.7167-2-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.45.2
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1398; i=krzysztof.kozlowski@linaro.org;
 h=from:subject; bh=hP8oqMRH0eoAXRKjft8SzhqvyrnpxIF8t2YdwglNn/Y=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBoT7jl9HxQJ01hueMCf5wsLpD/COtPu5BUqukRd
 lnXUBpXzaaJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaE+45QAKCRDBN2bmhouD
 16BTD/9m3fBFtzLaw1BvGg4t/4Kp0huLPdfDPZuuhdhcMzhpKmH1o+GQ6HO8SPHWwg3n19fjQmq
 FCVPqFh+sIrCz5qKZHm7TmZveqix1pEloadlV0yPm/4c6o5UEEIfHotbf9ukCjUdhY0a+FrwahZ
 UEurnmeedLssm0PGM7xB4yyscFZPxDnf55+c561SenD12/UuUnIsz0IAmYQ3SvHKe6UB8Ny41xQ
 a5w1b6g+3HFwQMUHw953PqDmqm9tFir5pDUq098kJ2f3cgdk8KiYkAvPxBz8PeY9j07cGGBI8R7
 MYenhC9l3vJFHJfWZt5Oq22URYdrdwQgbY9srxcklh7tegVDKGvAj/j1xMSeHuWWtCnu7poc7sE
 amAKd87PyuhYFw9nwh+Do9g5Nnt8ibZWrnS+oE69ahMDhtsSP8zXeGz1UgSzTCNptf9YsRghP9S
 iFVURr+auZyw8qv1UMOhcxqgFSFh9qoVogzL1vX0RMSSFUDmfoe7aNA7WmxZC/DkfqazPMi3XUN
 tQAAksEslDNvdMhNFkEoJEULGxbvV3X5vprUIGvLLjOn2JXzxSgDB7qsU8MGZ5tnBfRP6GqhcFd
 945KXzeIL1r8hX7NaW1qW+WoaQydbTu3Lb146cXuFEpyZoJA9E7pBtzm4hdRLuEa1obZuBKm3wd YBKiAmnBqWXa1+Q==
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp; fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
Content-Transfer-Encoding: 8bit

Add missing DP PHY status and VCO clock configuration registers to fix
configuring the VCO rate on SM8750.  Without proper VCO rate setting, it
works on after-reset half of rate which is not enough for DP over USB to
work as seen on logs:

  [drm:msm_dp_ctrl_link_train_1_2] *ERROR* max v_level reached
  [drm:msm_dp_ctrl_link_train_1_2] *ERROR* link training #1 on phy 0 failed. ret=-11

Fixes: c4364048baf4 ("phy: qcom: qmp-combo: Add new PHY sequences for SM8750")
Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 drivers/phy/qualcomm/phy-qcom-qmp-combo.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/phy/qualcomm/phy-qcom-qmp-combo.c b/drivers/phy/qualcomm/phy-qcom-qmp-combo.c
index 8b9710a9654a..f07d097b129f 100644
--- a/drivers/phy/qualcomm/phy-qcom-qmp-combo.c
+++ b/drivers/phy/qualcomm/phy-qcom-qmp-combo.c
@@ -228,6 +228,9 @@ static const unsigned int qmp_v8_usb3phy_regs_layout[QPHY_LAYOUT_SIZE] = {
 	[QPHY_COM_CMN_STATUS]		= QSERDES_V8_COM_CMN_STATUS,
 	[QPHY_COM_BIAS_EN_CLKBUFLR_EN]	= QSERDES_V8_COM_BIAS_EN_CLKBUFLR_EN,
 
+	[QPHY_DP_PHY_STATUS]		= QSERDES_V6_DP_PHY_STATUS,
+	[QPHY_DP_PHY_VCO_DIV]		= QSERDES_V6_DP_PHY_VCO_DIV,
+
 	[QPHY_TX_TX_POL_INV]		= QSERDES_V8_TX_TX_POL_INV,
 	[QPHY_TX_TX_DRV_LVL]		= QSERDES_V8_TX_TX_DRV_LVL,
 	[QPHY_TX_TX_EMP_POST1_LVL]	= QSERDES_V8_TX_TX_EMP_POST1_LVL,
-- 
2.45.2


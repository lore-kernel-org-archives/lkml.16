Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A6F5F265609;
	Mon, 14 Apr 2025 12:39:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744634344; cv=none; b=qq+C/aAJwrVCYsRZDdDOZZMrKQ/olN/Lkm2WBnkUZgHunulYC1C4pFT/Ej4uuvNB2cMDezFS1d6+MrPuKwzmmCru2aXvbg8a58sfPIWutMPcRKKszu7ZnyCo0xLhUInCNODZZloXDmfppE2qB+rBA6uET6YxVY1y7B4aLxhM5lk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744634344; c=relaxed/simple;
	bh=kvMu4gA44GD4PLpfwrFjPcEJiIQVrG9ys8g4QNyS468=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=GyRDuRZPtlS+B8q+23lIGyY3nNQ0KfH0hJ1gXNCXyQ+91XsJgPzaBqaGZpLab8j8t5vvvY1qz/Y+XRgphxgaXrhgzb7Eywn2b8sFvYc47/Zl84ZtFMwtaGeoDVOY8OrRfeetwIdR5XN13N1vE1hA7dDWyaeFcbmPpjM73TJ4no0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=QSwCCKGV; arc=none smtp.client-ip=209.85.221.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="QSwCCKGV"
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-3995ff6b066so2260755f8f.3;
        Mon, 14 Apr 2025 05:39:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744634341; x=1745239141; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=inhlHpE/bBAKBKJKN86FXX+kIdOLvF82cEnSWLQQO4w=;
        b=QSwCCKGVR/hXyu7NtVqKWp0hzmmRAR3JgPTCMkelL8P8C1Qb6KaZrzHFWJoGyxCpiq
         Q3TyJPAjbHLMgKZ+5M/2bCPomCH6bTCUi583/xArFwvibPNbUco67t8ysDgmilONjEjb
         Dv27e2TtPc4gW8qI3Resj9OPcipL/a0Oifz0Gr9WWMhJP4ro5wrDEt0HbFLZZ9dfqEmd
         2gLebEhfOZLEcWFueHwr2DEdDDDbZN2Zri0eKdTvF7soyMfPefWHVqb2P1oQSIOdOVgY
         lhaV0I19IeL88+jvQ11+vuwn1OYIg1LlfIWYXZOKdn+DkbgF62VI/XY4L/XcC2wWBkh7
         7Pzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744634341; x=1745239141;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=inhlHpE/bBAKBKJKN86FXX+kIdOLvF82cEnSWLQQO4w=;
        b=q3UIcUTx+BjSIcLCJhboF5hjw1lnR6it4/71TZDgbpS6Wt4+jWqj628T6papX3CN4M
         gFLN9nQWzKuaDlx+nK4haf5FxrlQAMfESK8744Kr25ViCViKa8G0s+7InHpAjMV63GxM
         QLzOI/8UFu3Kt1VoJwbqLSdstLjwTNEvZBg3F0AcrTdK4M/LiBrGVjWjMxf9/JhkyRv9
         7tMFs8cYTefd1tYirynLwAJjeFpW/bE4UzQgUsdpwbuxdBa0eVRktlE02vU4edXxPFH/
         i6RfNX7sc+r6ywU2nj1FlJB+oKIuQNt5sRaCx7yqoK6mb136yAybL1t+jIyey0eX1e9u
         UBbA==
X-Forwarded-Encrypted: i=1; AJvYcCWbzVv1ZVQJdRT3hxX5aVNnKJORTQFVqkk+wXqDRW6+UCgY/YR3NE+OH4SQoi9H16mVBptbhACyNP4gUEMp@vger.kernel.org, AJvYcCWtsCh+wViXDQsgQYlrHmVabcTujPdSYN2bPpZw1iRrEPSuDG80kIVlK8+Na6sAbjHqsP7zrdd6aNy4@vger.kernel.org
X-Gm-Message-State: AOJu0YxEHwSW4OeLeBGTRiGg3hjKONdOYdJPdPxTJcJTHDR6yBV9rCvh
	I3gC5gpnDlx18VhkWuoBII1Xo9XZ5jpHQy1yfL42U/mcF2hpmE3MMuj7kw==
X-Gm-Gg: ASbGnctzesvz09C5mrqygdTgD8evXEEPi90eobNn1wbnuaL43z7Qwbh59KdqhFtmcqd
	7dWCITRXrpesvOhNzuoCWG9b3BmZL/zzXtnvYsZXPiD0tjglZI9ii3h90YhuA2lRVyWqg7VoyYQ
	4qx+985oPm7V+JS4CqwjgpUdMX+N8n1iAUcpFnZ0XCieaLKzUq77jDokhviiuuWARmIws4MdPCD
	rnDdHLA1DE0Zw+GBBlm9CamxH9i55P+sk9ggsQ/x/fH17NAvoYFkCI/mQU2JmuqfCi6In0eNfEi
	4Sk+ZOa7U47ot59U+JxPOtgv4sEFtITERgm/
X-Google-Smtp-Source: AGHT+IGxy9csrrrck37dUxkD2h6nTaQdmDSXqt3VTHDGwVn+NyfGt2ybLDJfHlnEm9onkikV9dtWOQ==
X-Received: by 2002:a5d:648a:0:b0:39c:1efc:b02 with SMTP id ffacd0b85a97d-39ea52149d7mr9849917f8f.28.1744634340629;
        Mon, 14 Apr 2025 05:39:00 -0700 (PDT)
Received: from vitor-nb.. ([2001:8a0:e602:d900:68a4:1b76:fda:f9fe])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-39eae96bf97sm10703259f8f.25.2025.04.14.05.38.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Apr 2025 05:39:00 -0700 (PDT)
From: Vitor Soares <ivitro@gmail.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Daniel Baluta <daniel.baluta@gmail.com>
Cc: Vitor Soares <vitor.soares@toradex.com>,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	ivitro@gmail.com
Subject: [PATCH v2 0/2] Add support for Toradex SMARC i.MX8MP
Date: Mon, 14 Apr 2025 13:38:25 +0100
Message-Id: <20250414123827.428339-1-ivitro@gmail.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Vitor Soares <vitor.soares@toradex.com>

This series adds support for the new Toradex SMARC i.MX8MP
System-on-Module (SoM) and its Development carrier board.

More information on the SoM and carrier board can be found here:
https://www.toradex.com/computer-on-modules/smarc-arm-family/nxp-imx-8m-plus
https://www.toradex.com/products/carrier-board/smarc-development-board-kit

Changes in v2:
 - Move the Makefile rule to the proper place. (Daniel Baluta)
 - Remove the dsp_reserved node, it is already disabled in imx8mp.dtsi
 - Add Acked-by from Conor Dooley

Vitor Soares (2):
  dt-bindings: arm: fsl: add Toradex SMARC iMX8MP SoM and carrier
  arm64: dts: freescale: add Toradex SMARC iMX8MP

 .../devicetree/bindings/arm/fsl.yaml          |    6 +
 arch/arm64/boot/dts/freescale/Makefile        |    1 +
 .../freescale/imx8mp-toradex-smarc-dev.dts    |  297 ++++
 .../dts/freescale/imx8mp-toradex-smarc.dtsi   | 1284 +++++++++++++++++
 4 files changed, 1588 insertions(+)
 create mode 100644 arch/arm64/boot/dts/freescale/imx8mp-toradex-smarc-dev.dts
 create mode 100644 arch/arm64/boot/dts/freescale/imx8mp-toradex-smarc.dtsi

-- 
2.34.1


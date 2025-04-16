Received: from mail-qt1-f171.google.com (mail-qt1-f171.google.com [209.85.160.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 115481EDA23;
	Wed, 16 Apr 2025 01:01:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744765314; cv=none; b=exKEad/nA2BmnH1gfnI5Xyhd8WRC/ukrOXBXxiR6UvBJw1jLx9skWJO2VKxIAX7AyUDxRoSq0NkBYSridYMciolR0jrgQ1aIlLYiVmpKLDRYolx28/kXhOaAPf8etXXa9lo11geY7ySFFVcc/PMz752Pz4HOLqTkznwfxoTK16U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744765314; c=relaxed/simple;
	bh=fxstSu8qzAdIhLAQYEClN5UN40X87p6oIsu6USwOWBE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=OJ0fWu9EDBgLy2PdYNsQLFUHvE3NXdCY1/BkU/ZrtxvsWYXqCWX64g4A3HpJM+Sz6oRv6hhEazYUNyuOVsa/aJvWWrdbgYtzLXALVC0ytYoes0wgGYlWgogkENuYyOp1HTFFWiPuCH8pZDgYs1QceI1vagOOkdoQz0Lcts4NRIg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=F4mGMvxG; arc=none smtp.client-ip=209.85.160.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="F4mGMvxG"
Received: by mail-qt1-f171.google.com with SMTP id d75a77b69052e-4775ccf3e56so2392331cf.0;
        Tue, 15 Apr 2025 18:01:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744765312; x=1745370112; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0Nq2Ww24LxFVqSq9jn2uyDgDeiQ5tXdDH9PjOgGJn1k=;
        b=F4mGMvxGUhMjO3FDOWIFDHnW1WA5uoF5zLzDhRTsITStlOeQPWDDiOl4SlM74pz1YC
         zfuPff5UUH6Wb49y+d8vEo+bGsMLYzfHmthfltbspDELf2oDM88xoOJqGss6AqRkqlXY
         lZ4CpGraUdTulS+ZGUlClTD4BMlaU7oNdmO/91c/MoT8LiqgRvlsws/KTsUhK1yG+qOQ
         mEl8O1oWU7mpTUWopo/QNJwCYa2Az7cKdzCeDDEcZyhdT+3Uk1P4vgBP5f5nAx9rJZEE
         yX7GR75cJ9eNi+ZzvwMyUa/H/McYBJeRvvs4Gak2CUheXlCzG+I8WHdTdbhNaE/QX6AM
         +puQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744765312; x=1745370112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=0Nq2Ww24LxFVqSq9jn2uyDgDeiQ5tXdDH9PjOgGJn1k=;
        b=LyzI7xTvaYFFXcq8X1LbRIPDRhd/m0cf3rYeFUs1D6mG1IPJGe5r+MsdNsRV+zuSHx
         oB8XDdGEHaroNQ2lfsbuHOLQs9KYVr/JKTJe3rbC3ydIpE+Xw8ILhX40XHrxeScVqt25
         hkyu6uROlraUWxXtm6TdC96J22TsNpbV9ylOzbu0EgkQFw913kCp7OllojgFyGLwKMz0
         Hfg/ileQFAtFILtwjL/bF3es7w5hlh51H8/Ho/0MtQyzD7nt4dCllWVeZbcDPpNtDlqo
         bW9knu3O3VHMx7JBevIuntZF8gz1E2aLH1F1Rtf3NasxydHx92gBAjRNCgamjSzuAB+m
         iL0A==
X-Forwarded-Encrypted: i=1; AJvYcCUH2Mt6YLzGoTIjPJq+cZ3FKj5qjO+5yp2fv1Pm5QdGdZyKO+6JYHv99QIlzvgZ9WRMZzk9u9F4Zz7Y0lbw@vger.kernel.org, AJvYcCWKef5o3EvChIeSscTS5n0gHZZGxzSNULdBi6eB2u+JzfmnKsofan7zwoxlt8CEknPcWJvqyxnwZ9+m@vger.kernel.org
X-Gm-Message-State: AOJu0Yxtx/TGmhCNJbHiQuX2KKTo7mLrf8PJPeGJvWhqMP9XBpNfHZwh
	bkzVf1DXZgi8WbtrutB9vOKzAqs383fb+kMjEREGv1nf1mPRtHar
X-Gm-Gg: ASbGncsdIaGgMA6TLcXi3dqPvYA63uLKvLir8Yi9fzESRsHxZNuA6jB9k0/EO4ltCUO
	4FL/sVc3fGHa6QT4jy/U7wlzPc+5C9OPM1se1gTesHr6Q4WprZLVxriv04RPZvh85yA/dii3H0z
	pF5FB8lxRPZYJ2zEd4DY3gHagZ8+BARMeFxNuSe8uP97BZCGbgyRzGfKrPg07CKqKaNqdz7ZLN4
	7/vy5x0b2fM0dCksBILIFENoTUa2O09GJ4KSopD1YyOAm2pBjVSm4lKwSnBbWM22wrLtABUuHYG
	+Z+VgIxx658OY2eRhL7pl8HqUmqR0iAvogbUQQas82HpycFwSSxbYStze3XGo+M7el8RdGK5Rec
	JJs6tH/a/bq1tBXo=
X-Google-Smtp-Source: AGHT+IFVbV/PtUyWDy5dJ4ZAzRjnbBQX/ZzVFdzXITZAv6qMqnv4IbtGbczYUR/sIYzqBUBHsjPsVA==
X-Received: by 2002:a05:622a:355:b0:476:5fd5:4dea with SMTP id d75a77b69052e-479ff080e97mr80895381cf.5.1744765311578;
        Tue, 15 Apr 2025 18:01:51 -0700 (PDT)
Received: from aford-System-Version.. (c-75-72-162-184.hsd1.mn.comcast.net. [75.72.162.184])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-4796edc29ccsm99746291cf.77.2025.04.15.18.01.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Apr 2025 18:01:50 -0700 (PDT)
From: Adam Ford <aford173@gmail.com>
To: linux-arm-kernel@lists.infradead.org
Cc: aford@beaconembedded.com,
	Frank.li@nxp.com,
	Adam Ford <aford173@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH V2 03/10] arm64: dts: imx8mp-beacon: Fix RTC capacitive load
Date: Tue, 15 Apr 2025 20:01:29 -0500
Message-ID: <20250416010141.1785841-3-aford173@gmail.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250416010141.1785841-1-aford173@gmail.com>
References: <20250416010141.1785841-1-aford173@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Although not noticeable when used every day, the RTC appears to drift when
left to sit over time.  This is due to the capacitive load not being
properly set. Fix RTC drift by correcting the capacitive load setting
from 7000 to 12500, which matches the actual hardware configuration.

Fixes: 25a5ccdce767 ("arm64: dts: freescale: Introduce imx8mp-beacon-kit")
Signed-off-by: Adam Ford <aford173@gmail.com>
---
V2:  Change commit message, no active changes.

 arch/arm64/boot/dts/freescale/imx8mp-beacon-som.dtsi | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/boot/dts/freescale/imx8mp-beacon-som.dtsi b/arch/arm64/boot/dts/freescale/imx8mp-beacon-som.dtsi
index 15f7ab58db36..88561df70d03 100644
--- a/arch/arm64/boot/dts/freescale/imx8mp-beacon-som.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx8mp-beacon-som.dtsi
@@ -257,6 +257,7 @@ eeprom@50 {
 	rtc: rtc@51 {
 		compatible = "nxp,pcf85263";
 		reg = <0x51>;
+		quartz-load-femtofarads = <12500>;
 	};
 };
 
-- 
2.48.1


Received: from mail-il1-f182.google.com (mail-il1-f182.google.com [209.85.166.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A41172D542E;
	Thu,  3 Jul 2025 11:38:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751542704; cv=none; b=klzbUn4YhKBKUyLGqCpNcdqD+WPkiQMA0zNujOXKs7IfbsT7MO090q8PU8GYCLer7AFLD5YhdYEyukpEBSSMqQ52Nt3kQkwSZQuwoTI0U1fKew4btVqBxcgYqjkGf3N2RWmiYrK70LW+Veo/k1gEpHQ0Ph01A9OUAMGekiJNOjE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751542704; c=relaxed/simple;
	bh=T6S0lf+0PH+os9muTW99xmvjZ3xavuJO7UFZrVMAQj4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=hi+f66VEGcrUZoGyyYlzCamg1stODtExER8GiycOz3AIm2mpiDVQJtlsTH0hkyPoqj1eafmjyTMyDH4utJW2wIzWo3eFjhjjzijmXcVqa8AZC6fYwrSv9yzGeF/3s/wIPbCCLpDousXD2tzdDNmyfPv4TWt3jbw5lYprX97Dqwo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=lEI++hX1; arc=none smtp.client-ip=209.85.166.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="lEI++hX1"
Received: by mail-il1-f182.google.com with SMTP id e9e14a558f8ab-3df30d542caso25982605ab.1;
        Thu, 03 Jul 2025 04:38:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1751542702; x=1752147502; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MCs3K1Nocgfdm5hTUWEMb6rRK3ZRN34oOYMrfS5yndQ=;
        b=lEI++hX1dvOHA1+AJga1EsiVqa/R6MyKrvM2L+cPVWG7PldANEY4XcwMkVi2yhWr3Y
         IxIZmGqrN3jWYAsKWJ7ongvqVp0I/FnkszNrxtuQJRIOPEl1WWhYnS6FKuszwmIiR++g
         AbzchD0T6dkeMJKdLMVZFTf3AKk5BO+kDYZXe5Bcc4N/hiMoghE/jQcFaT58QVoDPo2N
         +cw3qI1VW81+nRZ5NUchsqgBLCxtii/Ypw5XQvFyTC9p5beOBVDXdf9wrOQcAaFSwq6N
         ElX2iQyUMue6ip6MXiF68Mbx4Q3ZDkbDePV8avzKyuc8PvqeKj7M+wnSLqtYSYSMnFgB
         boOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751542702; x=1752147502;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=MCs3K1Nocgfdm5hTUWEMb6rRK3ZRN34oOYMrfS5yndQ=;
        b=RvE71OAauF1fOTj7XbzWpjWRST5rDHZ/KhrTMtZ+KCSQNzaMZboVTV2FQGgiGoj+kg
         IjgBfOHDJumGSIbCq7sjqL/i3OwPJs4b4HAgtfXaWqfSmvpFmcAtzKWV6R8DA9wbg85y
         zVKSiPqHoCVPvDCgEIVf9coP68vb5LC/v2b9cgc0VZ9+Mfo68j8RCXL5N6oP80v7OOIc
         9SeL+eyQUkgJmh2xcODzRjSPM4kmiHIeNx9Xm2jDK+0kG7fS31P10opTD5KTzNJV6fPs
         cWa0smaWDYBCCQS0utcfybPWDCW5MjB+MFstVlUQtuhx4A9zbHGoTwot+4BRUbZHK9GA
         Gbdw==
X-Forwarded-Encrypted: i=1; AJvYcCUI/96gPR/Qj7yCWcm/nDODI7b3aw3O/K2ir9cmErrz2hC2zhoUJjxvPRzduuiTWdaedSqKGiCfLZrwuE0w@vger.kernel.org, AJvYcCURNL9cnPKHsmmyT2VbodkB3xMMuqQQlm/43mw6gQNPW9f9QwnwE4IzI+1FXIAW4SbMSIJPeV9uQy2t@vger.kernel.org
X-Gm-Message-State: AOJu0Yxpx50uNAFR1adKcOLka6LJqrdHgy6K+9HGv1sCaHzwTURpOXTS
	m9PllMQbOPiI7xd01kAqZEjBKISP/gRY+4nGq1z2uda0yJXGmCct7kJV
X-Gm-Gg: ASbGncsRE01m+mAt3l3E3dOwQAjkYwYnY/EglXMqzvuJpt9lN0o2JGmgfmzbbV5IuTe
	ifBWqLXUSKnwwG2Orz5hVLl71L4Q1iT3rC6pJtlAB2GTfWD9GaOzuK4QwRpzKK+iHFiMic/EkGL
	VJ38kqYf17lRZKEia7p2qRuHgmXVA9bKyjhszAdG134LrlbS3sIrU1wtrSnDuuIx2bvy6t1XbFF
	cXC4uKsNN091Dec6sYQmyKMtDPbpx6MhbnSJn6ovGpCEUu9NMvb5KhT4i8HwkTOixdpjp6O0RVG
	RbO6VYiS5w8d4QFGCrJ8vd6kaLACkU4J9utDj6yVJImkbmRl1gpew+9XKegZzWe8iOCcOLMpSX/
	Mx0UbQt6keuUCqWRp3XdPw213uFrDtHcMvVCO
X-Google-Smtp-Source: AGHT+IEAElfMxhOjH9lhImsexhBa4mz6jk1CGA5i/+dNtcBikMrBN+qolLPRqJUUtETlB6pD742Ssg==
X-Received: by 2002:a05:6e02:17c7:b0:3dd:f4d5:1c1a with SMTP id e9e14a558f8ab-3e0549f29d8mr72031885ab.17.1751542701597;
        Thu, 03 Jul 2025 04:38:21 -0700 (PDT)
Received: from aford-System-Version.. (c-75-72-162-184.hsd1.mn.comcast.net. [75.72.162.184])
        by smtp.gmail.com with ESMTPSA id 8926c6da1cb9f-50204a57456sm3483544173.72.2025.07.03.04.38.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Jul 2025 04:38:21 -0700 (PDT)
From: Adam Ford <aford173@gmail.com>
To: linux-arm-kernel@lists.infradead.org
Cc: aford@beaconembedded.com,
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
Subject: [PATCH V2 2/2] arm64: dts: imx8mn: Configure DMA on UART2
Date: Thu,  3 Jul 2025 06:38:10 -0500
Message-ID: <20250703113810.73023-2-aford173@gmail.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250703113810.73023-1-aford173@gmail.com>
References: <20250703113810.73023-1-aford173@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

UART2 is often used as the console, so the DMA was likely left
off on purpose, since it's recommended to not use the DMA on the
console. Because, the driver checks to see if the UART is used for
the console when determining if it should initialize DMA, it
should be safe to enable DMA on UART2 for all users.

Signed-off-by: Adam Ford <aford173@gmail.com>
---
V2:  Fix spelling errors in commit message

diff --git a/arch/arm64/boot/dts/freescale/imx8mn.dtsi b/arch/arm64/boot/dts/freescale/imx8mn.dtsi
index 848ba5e46ee6..b98b3d0ddf25 100644
--- a/arch/arm64/boot/dts/freescale/imx8mn.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx8mn.dtsi
@@ -860,6 +860,8 @@ uart2: serial@30890000 {
 					clocks = <&clk IMX8MN_CLK_UART2_ROOT>,
 						 <&clk IMX8MN_CLK_UART2_ROOT>;
 					clock-names = "ipg", "per";
+					dmas = <&sdma1 24 4 0>, <&sdma1 25 4 0>;
+					dma-names = "rx", "tx";
 					status = "disabled";
 				};
 			};
-- 
2.48.1


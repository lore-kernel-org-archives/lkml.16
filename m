Received: from mail-qt1-f180.google.com (mail-qt1-f180.google.com [209.85.160.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 11F433595B;
	Wed, 16 Apr 2025 01:01:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744765311; cv=none; b=s9+iIACGjaFLolQDTui56RPoAaP69v7OqjU5e/2yLCy+p7Qzzn51BgliUNDLL9LbUz9Qr5UYzGuBK/oMHYOkhhz8WIWuRqOumSenRD5vkvD8S5+sLSNedeaQYWHalwNWI9eMYty4HYV/QyblFxLWNcChg8LSTAw6ApFYwUvOYc8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744765311; c=relaxed/simple;
	bh=tzltEhfr+lbIBdYk+cHbqE+zLPaTA6Ce7yB9nx22yG0=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=LARCT2zMwaSoH9APsA4JXZEslGPckH80vfne38o2ijkvadZoz8aAcfscJxO32paukY/lRKlXrwi01X3nL0CP26zz54cgLGhobw40xl6Yt8y1TcipvkERlGMTly72ZcSOQgdQBfPqff0xi3jTI7CbvnMhZBurS7V957kftyVnqKo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=kTzFeS8u; arc=none smtp.client-ip=209.85.160.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="kTzFeS8u"
Received: by mail-qt1-f180.google.com with SMTP id d75a77b69052e-4769bbc21b0so54593361cf.2;
        Tue, 15 Apr 2025 18:01:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744765307; x=1745370107; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=hqSJEtRGvHAaCnRJ3OyhuBvW3qmYyS2JqTii9bOfg5w=;
        b=kTzFeS8uDumJ37/uREqCp0ivaW5dmWWbff5WCBmiqA+lBlmUxxakHOl2uusw1v7ClU
         TLPbf15RAndhlegwqxXmpWd/4fCbw1rHhGZ7oIEx6cpOBk+vw/kEFuudXVlrHbzZ4peH
         q23aYHB+7jANBq4LrcONsic8cdag6POJNvQuazYUYBRYwvIUPC/MoygX/ld0/5tVX+hf
         4WSlC3Z/ARS3Ii1aA7/cp7H6d10+e0tF6NVbnfWyJURJVIO7WpM8WWrONp8d8h2mEOR4
         JLXC8xShidFTzerNQNpiHzhgYbaI3/9/Wre0ax1b1JXI54z4pO+nqYjOZx3eovN29Epb
         5zeg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744765307; x=1745370107;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=hqSJEtRGvHAaCnRJ3OyhuBvW3qmYyS2JqTii9bOfg5w=;
        b=tHSByerVDb2FecthmDr6zsZpUtfQkdW811co6QU4/mD5fkQ60aT3lg4b3D25SDeCug
         IovP81ubehh8J5rC/Gr+AdUUTB2GDQR8tv71/wPqtlkO2+EelVgmoVqA+R5q1t81+28B
         r55sojVHJpwSZkNxOzuGkTup+Nce6nX8iwSI8snpPl22Ogvvw4A4s6OWXY9NvuvTHRJx
         TXSS12zwaRrN/fU+jMcZVNWy/UZXwfvLCwlNyvXg63cfZXAUFBHN1WeGhc7Niq2CgGvl
         jTLQTNN6lBSbft20wfvEp0PFf2cWNI23FFdnLdAfOb9BXvivh01R9iKP9ei6TiuWwGhM
         yMKA==
X-Forwarded-Encrypted: i=1; AJvYcCX2a8GOQ2NwjvpSgDmQJ6uvAeio5qjTMShGBpYqS+/ePp8MY+i+XUKIkItiiIVMaZO/TnbbljcSrqSRMQIj@vger.kernel.org, AJvYcCXkYqP4SuFPORdYK5aZ540of2KugByIoBlh1fJvxG3b+NR4ROrMoRMY5fgzDnJZrsUKz7BDxGb7TCF6@vger.kernel.org
X-Gm-Message-State: AOJu0YwTNaFdGZvStoJU4bh6i7UyFJHXRNcJv8rrVPUQPR0Ic1ga+6v2
	nGBpmDgpcgwQof2evVBpMD8cuWAjqQ+cIEVyIzI3yBS8yKJ8YmuH
X-Gm-Gg: ASbGncuTSRoymFJgPceCfA7G+OutCfenwCnRKdYy583xANQ/y10PV//IzhDBN8ShLEd
	pj5Rf5IHB2rNqVIi7TQ2aqVNr/IZnx9xNws+vsSwwlTpEAiEiTw/Kl8RIjO6tT/b4qsqbrqggSL
	P4YVi649taenq6rPyml4/JtpXfjkz/xlIogAwcsoKMkBxUiaUWwhUSZeWvhql/KFeepVMxHlkDO
	dQ0Z2wBW/Zf1TmJayTMiO7GTSx99MzsrvN0HrjoYOxSlVZk2/vjvSCjV5A0CkSvXNW6/m8F+s8D
	7zRZLGHZgkmJl+xuovpLM59jA6qrGb/my9WMdc167H6x6UoPeI5k/GW+ZNKx01zJmfwCISRZ0bn
	cVjXuQEU/kul0FEI=
X-Google-Smtp-Source: AGHT+IGokAkNgrA7P1lwPNLJsRHKFiTO0KpKLq4KAvL5j+NC4vnn7iCmOI5qeGOrYu0Jab+XyJo8DA==
X-Received: by 2002:a05:622a:770d:b0:47a:d51b:c7f2 with SMTP id d75a77b69052e-47ad51bccc4mr10217771cf.28.1744765306843;
        Tue, 15 Apr 2025 18:01:46 -0700 (PDT)
Received: from aford-System-Version.. (c-75-72-162-184.hsd1.mn.comcast.net. [75.72.162.184])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-4796edc29ccsm99746291cf.77.2025.04.15.18.01.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Apr 2025 18:01:46 -0700 (PDT)
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
Subject: [PATCH V2 01/10] arm64: dts: imx8mm-beacon: Fix RTC capacitive load
Date: Tue, 15 Apr 2025 20:01:27 -0500
Message-ID: <20250416010141.1785841-1-aford173@gmail.com>
X-Mailer: git-send-email 2.48.1
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

Fixes: 593816fa2f35 ("arm64: dts: imx: Add Beacon i.MX8m-Mini development kit")
Signed-off-by: Adam Ford <aford173@gmail.com>
---
V2:  Change commit message, no active changes.

 arch/arm64/boot/dts/freescale/imx8mm-beacon-som.dtsi | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/boot/dts/freescale/imx8mm-beacon-som.dtsi b/arch/arm64/boot/dts/freescale/imx8mm-beacon-som.dtsi
index 62ed64663f49..9ba0cb89fa24 100644
--- a/arch/arm64/boot/dts/freescale/imx8mm-beacon-som.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx8mm-beacon-som.dtsi
@@ -233,6 +233,7 @@ eeprom@50 {
 	rtc: rtc@51 {
 		compatible = "nxp,pcf85263";
 		reg = <0x51>;
+		quartz-load-femtofarads = <12500>;
 	};
 };
 
-- 
2.48.1


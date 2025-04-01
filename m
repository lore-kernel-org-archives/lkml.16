Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2838120E717;
	Tue,  1 Apr 2025 15:46:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743522362; cv=none; b=Pt8wmecEiceihmeDkZLfLVRIcQVH5pgVXqjHwWP7lhUXjcV1ZJdOWk6EEPluWaRoc7eBEirWofO+2gKdYCybTewMSnaQ3YsQdMsLj2YXVGd8ALrZhuT0UNPa5qpqWTMCclnf22Q7nFYDIEuFzrzBvp044ZJmW5VDM1IywAkDliw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743522362; c=relaxed/simple;
	bh=VA93hrjQWlyzZwcWjEvqD+4aWl10GXJ9Bc0D9Dx2kBU=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=VNQjv6mYnJyhmXhDRsWNTbSC54hPquLqpZ1Ub9aCNiEtyWHZ8vi5K+jGlb9TzekdQVgggAPncRLxxcR93OMdQmMV5W9OnIPP80FEtgLz5E7OGJXfpOlYInHgJVeKMZmJXDZBDLzFeYDxkNwVYNOjxBBSXRSl9Y5C5KtMFixTuXo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=SAZceWAg; arc=none smtp.client-ip=209.85.221.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="SAZceWAg"
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-399744f74e9so3741857f8f.1;
        Tue, 01 Apr 2025 08:46:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1743522359; x=1744127159; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ESjB9FswjsXqDkh+hAstUPSbEKWZtoMzCjv/1OB1iXM=;
        b=SAZceWAg6MX0G4o3E8kz4oiWIniqicoKAGY3ma/N9jHnVnIy2W/7TM/Kw9A/4wzjfh
         vg7cDaGnf/mM7meLMGOt64w02LE/c5P+JrR6m+sFpHuoIkvDV5J9a4gLuYE7y2vek0JV
         /wG3x6kts6a9TVi1O0VaduJUKyu+PgD+swCapIyRtBBlkzsZ5pFBck6zD7cxEb5DXRFd
         aRIUS618KMMeAygwcDojySIEgZjDo6reH/oEILpDkfnBJL+Lairw9kmkmnhCY20YmdpA
         c2gi5tyKSz5cVrP6Zn/SGInamTUQ6XBpmu0dEhqmkNDbgV1hqXKGW+5Yu9C2rmy88L/P
         b4xQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743522359; x=1744127159;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ESjB9FswjsXqDkh+hAstUPSbEKWZtoMzCjv/1OB1iXM=;
        b=d7ZeTRNNO3ocqBsOcRhUzeJIllJ8RKXtAEb7UBuw4W5arqfphgMiWuH/ramiTYHNBA
         co4/sSSAQwyJ3rC4MAz8qTzylVKaKiOmzhxWtDtx+d2n9QCkeIO2Fpl4ErTiRUU0IrLq
         cd2j1iZYQoUPXXCpW5NBYa+joU90UJZ0qx6BwjMzz1rlaB7a1C5P4CEWilbb8I8ahYkn
         Rl1q0GKZAdD+IwSCsv2v9yqdN4VpdS6FtTIxnPh1qyWoqaiz8mCzvgYr4oV4ThqB7vt9
         G/GfywR651R8Ony3P7c0iVeUo8M7Cfi4xMaoKhj9BEmI1cJypO35gx39Djuad8njEzG4
         YvOg==
X-Forwarded-Encrypted: i=1; AJvYcCUhHB5BY1RZ47fXEmR/caz47zXdzXtAsq8HbcVoJ94fhJ+lWa5kEyvEg4R9pAQmDwNfntFzt8jJd84K@vger.kernel.org, AJvYcCVGVLgZaC2ZtmHoz8MDqXSxhJwYK+01Fdn7GGqL7tklnzPkrsuZzsBoQW9OmsgGZuTryAAbNyHYouqn+uNh@vger.kernel.org
X-Gm-Message-State: AOJu0YxL9Pmmld/fpWsP6sW9/RYI3uG0SInDTQkbHGrFweZdBHVx/z8R
	3Hgw7LRMWkVyzDtpsx9zsEpMNZX/QAYHV4JSHnaaT586jn9YWTHT
X-Gm-Gg: ASbGncv2XiBDtCh0HxLnp1AG7RgnSRj2nioA1SxY1jsl37KsrT5sdoN8bGYOcgwm1BN
	b4k3SlnipVyq7bBigNqqWLwqE7IFXD6ennU7OJtKqddtF2R7KFqRHfo5KUlKfbV4BwPTciuTPj8
	jvV5l7FhQ6hc/in4q+tnMNxH4vXpBNOMCM0XI+Ww3JHWxY8lYgBRCbhjZR7UTp0h/EfVK+l/e5c
	beBWN5XKCWOU+HmsxlnREpGBLkCVTcLiTkIp1NDLQ6QTYQ5RdlEIB+jsBA33oIhnlRPl6XTGOJ+
	TYq318xR+CIEUDZQKeEDr151WIHwMBSNdSs4jBdhzveplPJbnIDFDo9f80bnL2rGS03RWksXo7x
	K0Q8Yz7xuqFY4SuUcuQ==
X-Google-Smtp-Source: AGHT+IGKhtb6fsJZMzdARBi+gb1FIGOla8Dmwwf9ptz7h3kdFPWq1TAOfA22Dh/s0xKKlSvTPmHHiQ==
X-Received: by 2002:a05:6000:381:b0:39c:1f0a:ee0 with SMTP id ffacd0b85a97d-39c1f0a0f69mr5198566f8f.2.1743522359440;
        Tue, 01 Apr 2025 08:45:59 -0700 (PDT)
Received: from playground.localdomain ([82.79.237.110])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43d8ff042bcsm158795735e9.28.2025.04.01.08.45.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Apr 2025 08:45:59 -0700 (PDT)
From: Laurentiu Mihalcea <laurentiumihalcea111@gmail.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Daniel Baluta <daniel.baluta@nxp.com>,
	Shengjiu Wang <shengjiu.wang@nxp.com>,
	Frank Li <Frank.li@nxp.com>,
	Marco Felsch <m.felsch@pengutronix.de>,
	Marc Kleine-Budde <mkl@pengutronix.de>
Cc: Pengutronix Kernel Team <kernel@pengutronix.de>,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v4 6/6] arm64: dts: imx8mp: make 'dsp' node depend on 'aips5'
Date: Tue,  1 Apr 2025 11:44:04 -0400
Message-Id: <20250401154404.45932-7-laurentiumihalcea111@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250401154404.45932-1-laurentiumihalcea111@gmail.com>
References: <20250401154404.45932-1-laurentiumihalcea111@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Laurentiu Mihalcea <laurentiu.mihalcea@nxp.com>

The DSP needs to access peripherals on AIPSTZ5 (to communicate with
the AP using AUDIOMIX MU, for instance). To do so, the security-related
registers of the bridge have to be configured before the DSP is started.
Enforce a dependency on AIPSTZ5 by adding the 'access-controllers'
property to the 'dsp' node.

Signed-off-by: Laurentiu Mihalcea <laurentiu.mihalcea@nxp.com>
---
 arch/arm64/boot/dts/freescale/imx8mp.dtsi | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/boot/dts/freescale/imx8mp.dtsi b/arch/arm64/boot/dts/freescale/imx8mp.dtsi
index ebbc99f9ceba..f0f0ff5edea6 100644
--- a/arch/arm64/boot/dts/freescale/imx8mp.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx8mp.dtsi
@@ -2425,6 +2425,7 @@ dsp: dsp@3b6e8000 {
 			mboxes = <&mu2 2 0>, <&mu2 2 1>,
 				<&mu2 3 0>, <&mu2 3 1>;
 			memory-region = <&dsp_reserved>;
+			access-controllers = <&aips5 IMX8MP_AIPSTZ_HIFI4_T_RW_PL>;
 			status = "disabled";
 		};
 	};
-- 
2.34.1


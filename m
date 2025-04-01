Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com [209.85.214.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6209F213E7B
	for <linux-kernel@vger.kernel.org>; Tue,  1 Apr 2025 23:36:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743550604; cv=none; b=MvDJdbun0QI+jcoELEHvp/Q23OwJIZ1+A/GLEkORmRDDMNEOh0+094HKBn75fBhzouQudqQJV/8jrpe9stie1QjzCdaJH48j4GrUSJs4yDIC/Xjmdr+hWs3YD1LSqeNB8VGxniwcDhP18JMMAzfCY75xHOmvtI1e7wXEH+mpDcg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743550604; c=relaxed/simple;
	bh=f1LW7wArLTH/O3nNwH0Ut5ahqANxTwb+PDOdiPH7gGk=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=qAItM4+BD/xfj98rowpSHGmo4btcrGlDb6US4erwyN9+tF9c1gdEodPHwaTMPN1OkWHKEitYjbXzujndbLiDmtBHigbWLXcBb1p2+sWBRuWTIlExv4rd/dOBjZS1Ln7Yi7Usf8vunqhDDol/FsvBdekvUNaRiusZf7M+etnkV7w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=wkennington.com; spf=none smtp.mailfrom=wkennington.com; dkim=pass (2048-bit key) header.d=wkennington-com.20230601.gappssmtp.com header.i=@wkennington-com.20230601.gappssmtp.com header.b=2NPAObjB; arc=none smtp.client-ip=209.85.214.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=wkennington.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=wkennington.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=wkennington-com.20230601.gappssmtp.com header.i=@wkennington-com.20230601.gappssmtp.com header.b="2NPAObjB"
Received: by mail-pl1-f172.google.com with SMTP id d9443c01a7336-225df540edcso6581685ad.0
        for <linux-kernel@vger.kernel.org>; Tue, 01 Apr 2025 16:36:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=wkennington-com.20230601.gappssmtp.com; s=20230601; t=1743550601; x=1744155401; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:reply-to:message-id:date
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=1W2Oez/Sw08kez7PZLuhoXC3i+XpY3chBoG0Mg2u1RE=;
        b=2NPAObjB2BhnBu3q/M1VrmAcMkdkh2AgrVtiCnugyITfM639LSqBjj3F02oXoqTkXJ
         1TIO0pZVzzbpQTzN2hoB0LE20aL7xGEM/MUcGXU3GMfW3dUd39x02ZA7++QW4Sn8Vb60
         Le3JNBAiuyqJTKzLs2Qz87thdDD0nsj3rteV6w2fmYcClVOEaKJLPpGDfDsdOIEJ/eBI
         Rnvs2+/FTfQeWB0skAiSgZDaHLRv2xd66THhMoAjJ4tm/fI0Bkdg6XpWE7iRQ4H3sYz9
         wgp7vBBfvJVQLfQYnLttj+A/yI4WICECuxpn/ZpdiwMH/+HTtN9Fsm4v44jvFpxGfVEW
         ndZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743550601; x=1744155401;
        h=content-transfer-encoding:mime-version:reply-to:message-id:date
         :subject:cc:to:from:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1W2Oez/Sw08kez7PZLuhoXC3i+XpY3chBoG0Mg2u1RE=;
        b=BJ50IFS9WRoYcM5BX+nkI9Fd86wxezS0NTRBoqnuGLGmhKWHtlLNhyjrJ+D0f4VluZ
         kfqX72NJuWmzoqMa79pQ94rOSLwqm2rMEVKLnspIc7juBvt+MyPO6ir4SfxXH2R4LbCc
         ctMf55PtaGXmlvZ3z6M8sv71TzQV1gGLHF0Hp9nh2Jv2fra60g4PthG8VC+1X6PZ+R/W
         SCMeo9sDwHVeCOT741zhoy7DK87Xii7h6zmk2kfOrEqeV0KgKXI6xtroNtDhV47zPxg6
         TVm3XsfoKSCOslEZd69ktwE8/ElW93QzBUvpWsrV0oEh5bqxsQ7WbrOAbQkK190YCYBM
         wpiA==
X-Forwarded-Encrypted: i=1; AJvYcCUAVL56W41t+AdFuOIMtmzfGpTp0JwsLUz0j+dbBTKm/7J8ERbYmSXBcu7Fj26nox+JpuHdRVvaVnf5sJM=@vger.kernel.org
X-Gm-Message-State: AOJu0YxGjKIQVEg4jqySsxG4WQGM5TtqCHfDOHIWeNGzt6DBlF5bFH8a
	wkiSpBiFd1Jn2DSCAGKLz3zZ0AiWTQ43Wn73LX+mcNYpykHUqWE6ACXDzi4WTQA=
X-Gm-Gg: ASbGnct00s5nkUfVAb23oQUTf4nUsXOcCBpHc68Q4uQkXr5ny5bAFJBxfhI1Hjfpdoc
	885uKUK9VtgA35NHiUEYrhkY/uwuN8f9697GAGrfFWdhdBb9e5my9iCZSGnaT3ghsdRcVGCZ36/
	zHl7MPDwUizBkruXQZsx1moEEDKI2a+5R7HOOewHIkTTINVgLGMu5yz0hysMihBJmClUjqMKQxa
	fTTykiOn4A/wUI3E8UsGLYsmaMqnBGPCQxjixcTbndDH4vEdB0NjN/FT0Vir82hZ0QfHY4j2evS
	l1q5BAcO4sFG5vrs3+2ihrYr+cDYFzNfSFfYiDa8ZcHX6velfH6hpNaILSE2Rp7OofyZG3h4mM+
	2aM+IPCmbv+FFRcxDmuf7u9OApgcqM0fa7LVaYIt2Gg==
X-Google-Smtp-Source: AGHT+IEVaEftCDieEpS7ZkP41WX9Cr6Tw3+DC3MPmN07cO7H+9fJKbzk/i15pVNXyrYe+e1tH7GluA==
X-Received: by 2002:a17:90a:e18d:b0:2e2:c2b0:d03e with SMTP id 98e67ed59e1d1-3056b714b87mr2357429a91.5.1743550601625;
        Tue, 01 Apr 2025 16:36:41 -0700 (PDT)
Received: from wak-linux.svl.corp.google.com ([2a00:79e0:2e5b:9:895:611e:1a61:85c1])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2291f1dee47sm95153755ad.180.2025.04.01.16.36.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Apr 2025 16:36:41 -0700 (PDT)
From: "William A. Kennington III" <william@wkennington.com>
To: Tomer Maimon <tmaimon77@gmail.com>,
	Rob Herring <robh@kernel.org>
Cc: devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	openbmc@lists.ozlabs.org,
	"William A. Kennington III" <william@wkennington.com>
Subject: [PATCH v2] ARM: dts: nuvoton: Add OHCI node
Date: Tue,  1 Apr 2025 16:34:09 -0700
Message-ID: <20250401233409.3215091-1-william@wkennington.com>
X-Mailer: git-send-email 2.49.0.472.ge94155a9ec-goog
Reply-To: 20240930214329.192587-1-william@wkennington.com
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The EHCI peripheral already exists in the devicetree, but the hardware
also supports a discrete OHCI unit on the same USB PHY. Generic OHCI
works fine for this device already and has been tested on real hardware.

Signed-off-by: William A. Kennington III <william@wkennington.com>
---
V1 -> V2: Fixed nodename from ohci -> usb

 arch/arm/boot/dts/nuvoton/nuvoton-common-npcm7xx.dtsi | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/arch/arm/boot/dts/nuvoton/nuvoton-common-npcm7xx.dtsi b/arch/arm/boot/dts/nuvoton/nuvoton-common-npcm7xx.dtsi
index c7880126cc78..5a466e97955a 100644
--- a/arch/arm/boot/dts/nuvoton/nuvoton-common-npcm7xx.dtsi
+++ b/arch/arm/boot/dts/nuvoton/nuvoton-common-npcm7xx.dtsi
@@ -151,6 +151,13 @@ ehci1: usb@f0806000 {
 			status = "disabled";
 		};
 
+		ohci1: usb@f0807000 {
+			compatible = "generic-ohci";
+			reg = <0xf0807000 0x1000>;
+			interrupts = <GIC_SPI 62 IRQ_TYPE_LEVEL_HIGH>;
+			status = "disabled";
+		};
+
 		fiu0: spi@fb000000 {
 			compatible = "nuvoton,npcm750-fiu";
 			#address-cells = <1>;
-- 
2.49.0.472.ge94155a9ec-goog


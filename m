Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com [209.85.214.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5AF512857D8
	for <linux-kernel@vger.kernel.org>; Fri, 11 Apr 2025 07:27:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744356425; cv=none; b=bTQffVIkqO2LQ0VApAt0Ix8QxrXyiUlcliWoFLGTY7BcUMWiWRP7Ex9m4Hm6S/j2knKAu5dNKt7eX/tVUpKuBLiwJCiNtMAhtvJRCN3lAsNBCeb4rgzbzy5wZ+0sf+U3Acj5Ui8YGV7KIWzYn5LMJNj/2COeiphtIVgzHhWJV+w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744356425; c=relaxed/simple;
	bh=Dn/D4QJBKyz+JgFhDXu/GfzzgKaBIArVHhrMyCulHAU=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=AeuF9/H/HJT5fsgdxmp/nmYkHOFmEpkiIK1hmNOXVuXl0CGjkYv3oXLDt1fhv+wJ3GJ4Gkt7ui4WmiPj3+ErgV2TY2N3LhP2AjFfyEC2AfaqSSR7WrR843nkKR50iFSsbRQWb1nInOPvG1om8DR6x48PwusBRENZL9niiNZ9H0w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=sifive.com; spf=pass smtp.mailfrom=sifive.com; dkim=pass (2048-bit key) header.d=sifive.com header.i=@sifive.com header.b=RBd7CyQX; arc=none smtp.client-ip=209.85.214.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=sifive.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sifive.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sifive.com header.i=@sifive.com header.b="RBd7CyQX"
Received: by mail-pl1-f177.google.com with SMTP id d9443c01a7336-223fd89d036so21331535ad.1
        for <linux-kernel@vger.kernel.org>; Fri, 11 Apr 2025 00:27:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1744356423; x=1744961223; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+ENXPmp9Sy2IzNDd02W7czpvRgisjjQJ7XRFhqNoZ+g=;
        b=RBd7CyQX5S0vv3JE7rXE4JIf8X/wZRtAfpd/Vx2BnNRW6yFS84aX3Y2OlDE43Hxilg
         aG7/PktK2LotSqF3GSg9d1+yesFnH/VhDGEwf2k3TmsNg9pETR9tdMHlP7DUZZAH+ia8
         8TROX5Eic+bbK07pNRXjuWjbUx1np0r6iqLby+f1lc1abnF7qxepLsJRMzPKPSakVzqF
         kpN2ZIT3ohhUc6/N6tYJgCpKGgaH9+Dzfr3zVvAN6IdkEQk0UE9mbbiUHetxpy9kuWdW
         KU71v2Mhma39eGx22umbqZZXB52vjLYRISOHgfPZa9e3URXJOb/+Nqi3F1fZNTR3fgi6
         kXFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744356423; x=1744961223;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+ENXPmp9Sy2IzNDd02W7czpvRgisjjQJ7XRFhqNoZ+g=;
        b=WxMM+HG9ovqiFHhihrRbmSYFcmZz/0UwYq5Iw3GLd83dx9UjBC8Mq7c60NeC1QWknb
         DQqlgGEdmvoiksBrPR1ILVmX9R6yDLGC221NqG2y+gGlyAShhZZya+fZJVKwa/fGdVxP
         6G+Y+jx1ALRZQc0ej2huXDR4j55hrhBwETbKqSdTVgJz1fph1jcmj+6zBYd4Jm2qHpaS
         Fsm1miNW2j07HrAb0AoDR1Y2Nk2KUZdwUFBFI83aO1d2jGyx92cXyFTIsvsyk4bw9ulg
         hfRgiha8qmgcsZ0/d/y8OR8J4d1gEk0+LP7L5nQU6U+VPq4R3atstJ7hhqAv2SyHw75K
         N59A==
X-Gm-Message-State: AOJu0YwB0zEf5wBeREeUsxx0UyXqP79t8kYCk76nV4Sv1HomW80vUccp
	8X8NSA5vlJwk2Wa7wnxyT9HUCWnwKNujB3JPTW2PKEuBabwcne+oGT8Th0BAmz20Bk5tIlWpK4x
	Ye0vHfhPtYWk4jVmuyRcF5pemoq4DxLqEe1llVJRcCG9fiMqDJT3pK3uj22rVfjcNRXBOUnlaWq
	gvrf3+FGG5KCx3Go1GrKyotqa7nIt6nLWnXVpleZ2Ni/kszZc=
X-Gm-Gg: ASbGncuM24B56kW5Ez3j+BoKFPGI1EJWiptmLHctYNhIneBfT21k/iCgS0tia+kmb5Y
	OJlNHI5NiCQI1KxZyq3Xf2FznN4WyYsDV2g2iAvTuM4njFij7pdEx8fbTq07IYWeN+Ysze2ccPo
	xjBSxFIKMHSFYZEQhtK+Qg/wipoeM9bgXVmAw2ukPBJAio8ju2yM9CBxpa8deRfG/70JdwJ0Zdg
	fNzhogPdNUcK4O6G1OrYW/RRDoCWkj/0muDyT4limQm+96eYY82AfWFuyTN4z2DwVpP+Z6GxCPe
	/N8X350ulpRsRSeERGWsd6HKTDFCA4SrQHaBXYEqYZJPNvjQyVWriEKClkXE3CQjIT7X+INl5Gt
	xXg==
X-Google-Smtp-Source: AGHT+IF6mn86yuiqI6kJMhDegTA4bq362CwYWfmUPLstVHdii8BaLlLtNTUJiV5Fpt/tDNcOxZpdgg==
X-Received: by 2002:a17:902:db0b:b0:224:10a2:cae7 with SMTP id d9443c01a7336-22bea4f666emr31781715ad.40.1744356423321;
        Fri, 11 Apr 2025 00:27:03 -0700 (PDT)
Received: from hsinchu36-syssw02.internal.sifive.com ([210.176.154.34])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22ac7b654adsm42523585ad.1.2025.04.11.00.27.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 11 Apr 2025 00:27:03 -0700 (PDT)
From: Nylon Chen <nylon.chen@sifive.com>
To: linux-kernel@vger.kernel.org
Cc: linux-riscv@lists.infradead.org,
	paul.walmsley@sifive.com,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu,
	alex@ghiti.fr,
	charlie@rivosinc.com,
	jesse@rivosinc.com,
	evan@rivosinc.com,
	nylon.chen@sifive.com,
	cleger@rivosinc.com,
	zhangchunyan@iscas.ac.cn,
	samuel.holland@sifive.com,
	zong.li@sifive.com
Subject: [PATCH 1/2] riscv: misaligned: Add handling for ZCB instructions
Date: Fri, 11 Apr 2025 15:38:49 +0800
Message-Id: <20250411073850.3699180-2-nylon.chen@sifive.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250411073850.3699180-1-nylon.chen@sifive.com>
References: <20250411073850.3699180-1-nylon.chen@sifive.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add support for the Zcb extension's compressed half-word instructions
(C.LHU, C.LH, and C.SH) in the RISC-V misaligned access trap handler.

Signed-off-by: Zong Li <zong.li@sifive.com>
Signed-off-by: Nylon Chen <nylon.chen@sifive.com>
---
 arch/riscv/kernel/traps_misaligned.c | 17 +++++++++++++++++
 1 file changed, 17 insertions(+)

diff --git a/arch/riscv/kernel/traps_misaligned.c b/arch/riscv/kernel/traps_misaligned.c
index 7cc108aed74e..d7275dfb6b7e 100644
--- a/arch/riscv/kernel/traps_misaligned.c
+++ b/arch/riscv/kernel/traps_misaligned.c
@@ -88,6 +88,13 @@
 #define INSN_MATCH_C_FSWSP		0xe002
 #define INSN_MASK_C_FSWSP		0xe003
 
+#define INSN_MATCH_C_LHU		0x8400
+#define INSN_MASK_C_LHU			0xfc43
+#define INSN_MATCH_C_LH			0x8440
+#define INSN_MASK_C_LH			0xfc43
+#define INSN_MATCH_C_SH			0x8c00
+#define INSN_MASK_C_SH			0xfc43
+
 #define INSN_LEN(insn)			((((insn) & 0x3) < 0x3) ? 2 : 4)
 
 #if defined(CONFIG_64BIT)
@@ -431,6 +438,13 @@ static int handle_scalar_misaligned_load(struct pt_regs *regs)
 		fp = 1;
 		len = 4;
 #endif
+	} else if ((insn & INSN_MASK_C_LHU) == INSN_MATCH_C_LHU) {
+		len = 2;
+		insn = RVC_RS2S(insn) << SH_RD;
+	} else if ((insn & INSN_MASK_C_LH) == INSN_MATCH_C_LH) {
+		len = 2;
+		shift = 8 * (sizeof(ulong) - len);
+		insn = RVC_RS2S(insn) << SH_RD;
 	} else {
 		regs->epc = epc;
 		return -1;
@@ -530,6 +544,9 @@ static int handle_scalar_misaligned_store(struct pt_regs *regs)
 		len = 4;
 		val.data_ulong = GET_F32_RS2C(insn, regs);
 #endif
+	} else if ((insn & INSN_MASK_C_SH) == INSN_MATCH_C_SH) {
+		len = 2;
+		val.data_ulong = GET_RS2S(insn, regs);
 	} else {
 		regs->epc = epc;
 		return -1;
-- 
2.34.1


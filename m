Received: from mail-pj1-f47.google.com (mail-pj1-f47.google.com [209.85.216.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA2311F866A;
	Fri, 11 Apr 2025 14:36:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744382221; cv=none; b=R5Q4BcbzW25g9hQpdNlK8Gcy6oPNgtoRhXob0/pObvAS1I1T0y6ont/DQd8iBmW/rkOXj5lomMeKEvESrQdyKStuDt8bU0fsAfGbM0s1j7IFu4qgiqIi3TyAWHhjEDWEZUpbltqgROQzzCPxrJlzZhffZgdP3h7GiRlxaKuMn1c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744382221; c=relaxed/simple;
	bh=4EGh63XRuAuHB8a4onBFSdynXxbrJNaPSvsOKaz9hpQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=vGY5zBAz1Oe26NPFyF//Jo2HZl215b47cGApBlV6UYh1DfwEnnZtbX95zYu/fYcswmwhAn2JEe72bE12xgOcpuAo3TUbi0tF8d2dzzNRlQfc+IXXEk2XrmJuUi7QjOJyaA/mNStxVzQduL9i7857VlcOPCJAejpyxTMtkhoyVHg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=h22/21C5; arc=none smtp.client-ip=209.85.216.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="h22/21C5"
Received: by mail-pj1-f47.google.com with SMTP id 98e67ed59e1d1-301302a328bso2038919a91.2;
        Fri, 11 Apr 2025 07:36:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744382219; x=1744987019; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=XqTAVted7iqBPlcImi6frgF4C0JiTn/d3SQ/Bon2Kfk=;
        b=h22/21C5iBTi7aZaAG9Iia2hCMX8V48pzFHX5BGbH24VVncUFLOkyOLQkv8ZLTq2oJ
         JG5ywu08wUaGp67pT2x6GvF2IrFV1VTCriEjPZBtVCodOaduCXn0ZRGAclZdduNi2p20
         2TOxD+CiPCFa3S8j9aTALv7lhD5yFFeVxYJrziJzaPr4Z/EH5/G4VaUkTb5XncLajO9J
         ru9tbpw4Q5yJKMf0htyKYKlw4x2yXiwGU0tdvmH8NSeV0eOvIN4r88N5OXV2t78yLa84
         BkHW/dRf45RiCKP+xoc00Ulf1Iix8OhVhGQMBVGo3jfeq0yUncWW1NgcWDwTtxqK3tn5
         I8Mg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744382219; x=1744987019;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=XqTAVted7iqBPlcImi6frgF4C0JiTn/d3SQ/Bon2Kfk=;
        b=OrF9pwys9aBS3xtnlv7gNykxyy3aWSHO2zFT0f2QIjc0+ihWkS0qIW5voeuFxYuRiW
         +Q8Np3YGnIh4PhgGBzuGQOe2ADBW7L27p4W1ikBN/LF8qSC2C3R4NgXuDQLc09YVcUCd
         sOal/FnWww2p//OxB1hdhg+2xBPfIhX1Fk8EdWg90YOG3bz0Vu9OCepGr+FWd5E8d7lZ
         3TV9yCYWGMgPP5QE4DPO5JZYWz+0Gyx4lUxRzt2TwTR/o9zj7tEy/+Sx87lwssGjYZyY
         41p0IoE8BnjctfmOoPajVsHOf3JKsMGAnbSXn4kMy2t1fzvO387tS6e6Z1cRCcaEOasa
         kY1w==
X-Forwarded-Encrypted: i=1; AJvYcCVPo9O/W8/3JEnRoODUpTNkhuSCWa9LR9EqDk1f7S0YqZGCMS9sOxUFDRRztWlTuWj/5QBZAnKGAzev4JE=@vger.kernel.org
X-Gm-Message-State: AOJu0YwM3R7D9tUFYogcJ0C9nKRD5ryiniwyJxX20iCH+FLfxartDKR2
	ZYx7MqeyakJvgoyGo1fjLLnv4LrGO+nC2Kj2m0bpPUKGNKm1Frt+
X-Gm-Gg: ASbGncuYm5EGn2MAsNfBotlK4EIKbIxUuodCeXN9HVeYapG4XgKPxjQgaLoBNFflz3J
	VPxqgSHuyUft4xm6Vwgm4VhK0vIWXteuSjm1MQvRCeqnmcsp4rIeevrp5koZEIhooyXOvTO+Zvj
	1QYblv68KZsknvupDGaAG+tRkM9BYGfeFIziJPf8E0G9tNDCulLYaKVmn/altPzZmcea/VDkO7d
	OPcRwLx6yG1BGujLs84Caf9M0JGuCphLI+IOJC5PiCKsKJrI1tAX11ajFUC6A59PNkcJ0JyAFlK
	DKWZ0TErmEMp6E78PLm6Osr/D4pJFbLSUjPDnZSO
X-Google-Smtp-Source: AGHT+IHp1fJp4vdoR7Bp2bZlgPyQkt+WYPsZWerRsS3J0wN3uhGugf3hfcYa1h0FQXbLnsmWiMN31Q==
X-Received: by 2002:a17:90b:5445:b0:2ff:5cb7:5e73 with SMTP id 98e67ed59e1d1-3082367ee62mr4132466a91.23.1744382218925;
        Fri, 11 Apr 2025 07:36:58 -0700 (PDT)
Received: from [192.168.1.26] ([181.91.133.137])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-306df06a14bsm5630754a91.1.2025.04.11.07.36.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 11 Apr 2025 07:36:58 -0700 (PDT)
From: Kurt Borja <kuurtb@gmail.com>
Date: Fri, 11 Apr 2025 11:36:42 -0300
Subject: [PATCH 2/3] platform/x86: dell-pc: Use non-atomic bitmap
 operations
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250411-dell-faux-v1-2-ea1f1c929b7e@gmail.com>
References: <20250411-dell-faux-v1-0-ea1f1c929b7e@gmail.com>
In-Reply-To: <20250411-dell-faux-v1-0-ea1f1c929b7e@gmail.com>
To: Lyndon Sanche <lsanche@lyndeno.ca>, Hans de Goede <hdegoede@redhat.com>, 
 =?utf-8?q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>, 
 Mario Limonciello <mario.limonciello@amd.com>
Cc: platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Kurt Borja <kuurtb@gmail.com>
X-Mailer: b4 0.14.2

The choices bitmap belongs only to this thread, therefore we can use the
non-atomic version of set_bit().

Signed-off-by: Kurt Borja <kuurtb@gmail.com>
---
 drivers/platform/x86/dell/dell-pc.c | 9 +++++----
 1 file changed, 5 insertions(+), 4 deletions(-)

diff --git a/drivers/platform/x86/dell/dell-pc.c b/drivers/platform/x86/dell/dell-pc.c
index 38f198a7330006333b01787a9934b8eb146ce75e..794924913be0c6f13ed4aed8b01ffd21f1d34dea 100644
--- a/drivers/platform/x86/dell/dell-pc.c
+++ b/drivers/platform/x86/dell/dell-pc.c
@@ -11,6 +11,7 @@
 #define pr_fmt(fmt) KBUILD_MODNAME ": " fmt
 
 #include <linux/bitfield.h>
+#include <linux/bitops.h>
 #include <linux/bits.h>
 #include <linux/dmi.h>
 #include <linux/err.h>
@@ -228,13 +229,13 @@ static int thermal_platform_profile_get(struct device *dev,
 static int thermal_platform_profile_probe(void *drvdata, unsigned long *choices)
 {
 	if (supported_modes & DELL_QUIET)
-		set_bit(PLATFORM_PROFILE_QUIET, choices);
+		__set_bit(PLATFORM_PROFILE_QUIET, choices);
 	if (supported_modes & DELL_COOL_BOTTOM)
-		set_bit(PLATFORM_PROFILE_COOL, choices);
+		__set_bit(PLATFORM_PROFILE_COOL, choices);
 	if (supported_modes & DELL_BALANCED)
-		set_bit(PLATFORM_PROFILE_BALANCED, choices);
+		__set_bit(PLATFORM_PROFILE_BALANCED, choices);
 	if (supported_modes & DELL_PERFORMANCE)
-		set_bit(PLATFORM_PROFILE_PERFORMANCE, choices);
+		__set_bit(PLATFORM_PROFILE_PERFORMANCE, choices);
 
 	return 0;
 }

-- 
2.49.0


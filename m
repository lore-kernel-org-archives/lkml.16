Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DEA01216384
	for <linux-kernel@vger.kernel.org>; Tue,  4 Feb 2025 17:43:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738690988; cv=none; b=pb6dmVE1dJvjcUv7wEXnR/cUtgjGUKUgdsP+eTohKXkTXKckW2RorksLZ1cD+V++f3kPXYHdL7a/T+mmRqdvUJU+7ZAO7z24JG7LUzQjB2DcOPpFx1rzSrnGCuMxLx5KqPTntHmrP/V06G01S5zG7V6tcgDN84MaFHxSu52A9Wo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738690988; c=relaxed/simple;
	bh=rkAC509swjdUrkNv3XMK82thHEYdK072zzRZ/sqDei8=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=u1vU7QUv61fIsAcASm0bAUbIAPCQP7OXKEeTaFLb+jRQpd3DceMRYIw3JAuXekW9zmUam0pOnliVFf/b6lwpna23QPmIi/rmTIJbqC67pm8od+V40sCOpz5PTi8woa/UQCFCgoZgXHJ6fCZMViQbUiYUxD2DFRooicF5iu07Xj0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Zw2dmD+o; arc=none smtp.client-ip=209.85.128.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Zw2dmD+o"
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-43690d4605dso40889215e9.0
        for <linux-kernel@vger.kernel.org>; Tue, 04 Feb 2025 09:43:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1738690985; x=1739295785; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=qmoBY2HKoC8vppS4FEhNVLtw+QQRzfa2YhjsykY8oaQ=;
        b=Zw2dmD+ozFSsyjYLo6xZnsyhS+KeYOfbhivA2Bs37iL2vKtci6LtKlpHJjhh3kHl/W
         15kcspNhsJm7HA38UJJfE67rHQLPqbP4QK0AavtxlaNViJl4kU0e51avpvosiZhNkbVE
         OzTjSwW9rntG7oXcWLWhnaZIz7GYI9aHp5tVWPWVhwaIeUR/YYLTRbUJ00YyNJEmiB5Q
         mokvnMQpo5H85pbRkdL6s4fxktNbtsq69TWkCYMK6NAwG7sUAruiWGbuHlVdgLCwQjeV
         x6Xu5k/37EFhy8flO/WFjjOom5NB8KEqcuvnaob82VTiO0U8nSZMepOhia2vhZb2RZV2
         nZUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738690985; x=1739295785;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=qmoBY2HKoC8vppS4FEhNVLtw+QQRzfa2YhjsykY8oaQ=;
        b=lylFLwgvzEBg62v/lZMaBvBa07vK8pSJBSTLzMMyPdjsIktTH4R33v2Z3Ud4He6p67
         48Xx5GM4TmpsbYWIJW5upmS+AUu/JSWcuBtof7AkC0XRrJpl5NIrHrJhjHsJo34ProUM
         fAvl3TlXe7+PO90xJMpr+0lIM3VjIKbMVF9GFBPTSQ8fbV1PI+E5eRp3chzqQMdyvVqE
         8cLf944AyH6CoKLmAQs9t9f8zcYWIqb8z7v1i8BMqOtHz6izfX0/RjYIBttICBbCLOTP
         vR68BPNWZDMLUOC80HnhvofhlnPaeMBuCe6Obp7XT6zwhNkP6cfhj4XCvEsY6KHRcUTD
         U3Xg==
X-Forwarded-Encrypted: i=1; AJvYcCUpmptABRbTcd8xJNtC32LcM3j/4O5RPViZsfkqExokYEZsuCCgndy4ZcaylgbjqoZcqKDI7xlHEqhTqC4=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx+xfZvH+YuVtgVqVd1beqg6AWA7EqxxL5sLj0XuoIRe7Gs6B1a
	FhDZe9PyxKs021A7vwYphpS93X7bmAky04fOKntvpxCrWtg2TDQr
X-Gm-Gg: ASbGncuHMYOZPOJQ+xuqnr4yjHosUqhUCPSiLWBHc2v24SoWAv180gQEqyYUVxsaB0K
	vfmNgFXL49YbVIpGZm+hNiVtLVMUyr1stP3Iwnxe0V9lLL8EDPtsSE1RTLFFW+AectI9EMt+VZl
	Qo9g1LjGR5RDI8glPiRIqpGimTyhe2qHafFa/g7hQ4zbHUqTBKVB9dybzjKSz5WN429XorTuwns
	yHnYHhBeFBRJLIqDhDiVw8t5+1rv0vuSTgwJdDtqQj44hHpXFIjg3TPzNK3BSCw4153Tj6ZzsyA
	3sl9/WII15QW7y7O0cDzZ0cpilpDav8Dy7gyG3rDUaeRA+xpLac=
X-Google-Smtp-Source: AGHT+IFReAXb4J/9mpQDDwFtQHAYn2WpKdyKw/glZFHckPLTAlF3J3XnGcDutFRQHyXG8M+u34vd5A==
X-Received: by 2002:a05:6000:186f:b0:385:f19f:5a8f with SMTP id ffacd0b85a97d-38c5194b92fmr19556504f8f.4.1738690984888;
        Tue, 04 Feb 2025 09:43:04 -0800 (PST)
Received: from localhost.localdomain (82-64-73-52.subs.proxad.net. [82.64.73.52])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38c5c102ac9sm16164380f8f.29.2025.02.04.09.43.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 Feb 2025 09:43:04 -0800 (PST)
From: Dave Penkler <dpenkler@gmail.com>
To: gregkh@linuxfoundation.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Cc: Dave Penkler <dpenkler@gmail.com>
Subject: [PATCH] staging: gpib: Remove dependencies on !X86_PAE
Date: Tue,  4 Feb 2025 18:42:54 +0100
Message-ID: <20250204174254.16576-1-dpenkler@gmail.com>
X-Mailer: git-send-email 2.48.1
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The dependecies on !X86_PAE were introduced to fix an i386
build issue due to drivers casting resource_type_t to void *
commit 48e8a8160dba ("staging: gpib: Fix i386 build issue")

Subsequently
commit baf8855c9160 ("staging: gpib: fix address space mixup")
properly resolved these issues by fixing the code in the
drivers.

Delete the lines "depends on !X86_PAE"

Signed-off-by: Dave Penkler <dpenkler@gmail.com>
---
 drivers/staging/gpib/Kconfig | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/drivers/staging/gpib/Kconfig b/drivers/staging/gpib/Kconfig
index 2bf11df122e2..aa01538d5beb 100644
--- a/drivers/staging/gpib/Kconfig
+++ b/drivers/staging/gpib/Kconfig
@@ -50,7 +50,6 @@ config GPIB_CEC_PCI
 	tristate "CEC PCI board"
 	depends on PCI
 	depends on HAS_IOPORT
-	depends on !X86_PAE
 	select GPIB_COMMON
 	select GPIB_NEC7210
 	help
@@ -64,7 +63,6 @@ config GPIB_NI_PCI_ISA
 	tristate "NI PCI/ISA compatible boards"
 	depends on ISA_BUS || PCI || PCMCIA
 	depends on HAS_IOPORT
-	depends on !X86_PAE
 	depends on PCMCIA || !PCMCIA
 	depends on HAS_IOPORT_MAP
 	select GPIB_COMMON
@@ -90,7 +88,6 @@ config GPIB_CB7210
        tristate "Measurement Computing compatible boards"
 	depends on HAS_IOPORT
 	depends on ISA_BUS || PCI || PCMCIA
-	depends on !X86_PAE
 	depends on PCMCIA || !PCMCIA
        select GPIB_COMMON
 	select GPIB_NEC7210
@@ -181,7 +178,6 @@ config GPIB_INES
 	depends on PCI || ISA_BUS || PCMCIA
 	depends on PCMCIA || !PCMCIA
 	depends on HAS_IOPORT
-	depends on !X86_PAE
        select GPIB_COMMON
        select GPIB_NEC7210
        help
-- 
2.48.1


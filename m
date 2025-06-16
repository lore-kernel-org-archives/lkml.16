Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C662C189F56
	for <linux-kernel@vger.kernel.org>; Mon, 16 Jun 2025 08:36:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750062977; cv=none; b=ioLmEt0AehDKQ2Txj32uELqaT0+CCCfZVjmHJe4GdOmnaQyDSTAU2uXGHOmVkFjjQhhMBuwZp084I5bTYm+zPBWSm5dQDEhrFGflXOL7sTG2H0LY01T73ddFw1TbEKABFWIa0QMHJHd2nw5i3stk0cYOhaU2NUXOcBDfGsGN8Mc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750062977; c=relaxed/simple;
	bh=KvuBapPFIUFpeO1GcEW+NVpFFKs9aE2atVl+Hcoz4dE=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=gkR3eqwL7rbGdrMGL+/wK4f7f4Enpn8DM1yqWEYDY30mt1LJ/3LwBjF1EtOWq00qruAXormCWRp6DYWbI3ms3Qoj3XkEYn/nDlLHxGokMr8hOZuhLU2mKr8ujeOK+qeSMaXPqT3gyH2IN7fMa0NyGd8qMnRD3zdFfJRLu2gzTzQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=RocffQMI; arc=none smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="RocffQMI"
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-452f9735424so13008345e9.3
        for <linux-kernel@vger.kernel.org>; Mon, 16 Jun 2025 01:36:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1750062974; x=1750667774; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=qDFMbaNBOZF6U3t9x/vAMuueUEpg2ql5GHLmS+YRkOg=;
        b=RocffQMIEbqrJ39yIzYNKhUZbld037aim0EcwtAQ57bUx0ol8NBqmmqBnr23p7+DlJ
         2GXNY8hVJ456qE74gwJR/kj+SYAEyRJtjyP8Yp5vjGtJDGicU+WOaYzjav1GUIrvimcR
         TFy/voZchhQUA2q9lqOkkoxnOi7wfludBa8GXPYF7f/IzaIEH9BJ+m+L8gcdr8sR+6lL
         /gkc+fVpQMNbdE++LiiOHPqi4bkDRQ/B5TqJjLOqRKJew7jR9wHhKJ+5WWXpPGmdJ9nE
         tACCO3GWnqmSb825f1/U0OdyUCqm13Lo9MJlD2gKN6Jl73ngr2qhKLQgewpYGCm4EICD
         I3BQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750062974; x=1750667774;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=qDFMbaNBOZF6U3t9x/vAMuueUEpg2ql5GHLmS+YRkOg=;
        b=Qe7Xm68LmLhzKQO8IYW6MaKB/VHVkPnP8taiWY3y19m0EiUQKzajKB4nN9owe3biJC
         sighiiEcDXdmXfGfXV7RYfG7hBdsFDPwsBLQv+vAF7d/p+U0wKWzPfthQ+UaD7MFkyOi
         0MVOMjT+X9F341CIRnmaKEij4Rsn+eZLmeQhsViIFmNajHxMt80VuRgXgrkJNoPKURB8
         aryfPxQD4dc1b0PK+RnlbfeyAlVQ4FAzk+qeLQie0l6Ov8BNUe+dwdE3llQ3ShWKPzUo
         An/Ssx4R8uv711QFbgDavkH9m1NbGPqfxu2rx30D7wKHYMvSd3H/pEt41Uz+U7/mhu2R
         P8Hg==
X-Forwarded-Encrypted: i=1; AJvYcCUIrfO88O2WZTtRHD0MxA1MODi+8SeAFkEdRux99AxAXQ+XdzfM77Ni4dFMbWW2BhtSCAaWgxSy2wdzmHQ=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx8AJwfki5Q6Cqrku5aSjsAw4p8/giT9LNsgEYV/86QWx6TYhIS
	egEalSW7eYk9VU2Ea8JestTdLPBwzbMIUure80ddhoDS/uTH0/K62a/r
X-Gm-Gg: ASbGncv49GuErhBx+lRMS4BH9zT9agLwCD9W6bqCr/A1BI95j4XVQy0BN/IKDwCDPfL
	Fyx5mwaWVzNBSj2NljnAxXN5dyXPZ5TCBs3dqlzJkrEvZz+AEmdNVSn9py+ZoEYIziMEhnUBpe+
	VCo8joT/r4NkLblRuCypyWFahIi9VGOOSBR/g9OfmOxMhP4AJweQ32AwPaZTIkpnrr/A1odQ0f1
	La5FHS3fMEdGmNwgXFGJUz9FEDIiE75PfNFT9IvPos+03jan6FH0ySTH9ofd9fN8+MBqNtRwGW5
	oZxVqr4VH5P4plRzHmCXE3XlRnkOpUG3G8zpf9wRP254QwJzqzrYbEIAf+pTdFZT
X-Google-Smtp-Source: AGHT+IFpuj8zGMKC22v1x08gRfVznZE4IbwhMqise4wL5yEimrHgA4V9FRrzjmQRaKLJRisxYdE6Pg==
X-Received: by 2002:a05:600c:3b98:b0:43c:fbba:41ba with SMTP id 5b1f17b1804b1-453418e0926mr45598435e9.28.1750062974069;
        Mon, 16 Jun 2025 01:36:14 -0700 (PDT)
Received: from fedora.. ([193.77.86.199])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a568b08c7csm10601966f8f.50.2025.06.16.01.36.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Jun 2025 01:36:13 -0700 (PDT)
From: Uros Bizjak <ubizjak@gmail.com>
To: x86@kernel.org,
	linux-kernel@vger.kernel.org
Cc: Uros Bizjak <ubizjak@gmail.com>,
	Thomas Gleixner <tglx@linutronix.de>,
	Ingo Molnar <mingo@kernel.org>,
	Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	"H. Peter Anvin" <hpa@zytor.com>
Subject: [PATCH] x86/asm: Use RDPKRU and WRPKRU mnemonics in <asm/special_insns.h>
Date: Mon, 16 Jun 2025 10:35:57 +0200
Message-ID: <20250616083611.157740-1-ubizjak@gmail.com>
X-Mailer: git-send-email 2.49.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Current minimum required version of binutils is 2.30,
which supports RDPKRU and WRPKRU instruction mnemonics.

Replace the byte-wise specification of RDPKRU and
WRPKRU with these proper mnemonics.

No functional change intended.

Signed-off-by: Uros Bizjak <ubizjak@gmail.com>
Cc: Thomas Gleixner <tglx@linutronix.de>
Cc: Ingo Molnar <mingo@kernel.org>
Cc: Borislav Petkov <bp@alien8.de>
Cc: Dave Hansen <dave.hansen@linux.intel.com>
Cc: "H. Peter Anvin" <hpa@zytor.com>
---
 arch/x86/include/asm/special_insns.h | 7 ++-----
 1 file changed, 2 insertions(+), 5 deletions(-)

diff --git a/arch/x86/include/asm/special_insns.h b/arch/x86/include/asm/special_insns.h
index ecda17efa042..13e272e1a53f 100644
--- a/arch/x86/include/asm/special_insns.h
+++ b/arch/x86/include/asm/special_insns.h
@@ -75,9 +75,7 @@ static inline u32 rdpkru(void)
 	 * "rdpkru" instruction.  Places PKRU contents in to EAX,
 	 * clears EDX and requires that ecx=0.
 	 */
-	asm volatile(".byte 0x0f,0x01,0xee\n\t"
-		     : "=a" (pkru), "=d" (edx)
-		     : "c" (ecx));
+	asm volatile("rdpkru" : "=a" (pkru), "=d" (edx) : "c" (ecx));
 	return pkru;
 }
 
@@ -89,8 +87,7 @@ static inline void wrpkru(u32 pkru)
 	 * "wrpkru" instruction.  Loads contents in EAX to PKRU,
 	 * requires that ecx = edx = 0.
 	 */
-	asm volatile(".byte 0x0f,0x01,0xef\n\t"
-		     : : "a" (pkru), "c"(ecx), "d"(edx));
+	asm volatile("wrpkru" : : "a" (pkru), "c"(ecx), "d"(edx));
 }
 
 #else
-- 
2.49.0


Received: from mail-pf1-f176.google.com (mail-pf1-f176.google.com [209.85.210.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A39FB72626
	for <linux-kernel@vger.kernel.org>; Sat, 10 May 2025 16:27:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746894455; cv=none; b=tDaoB14yN4aVC+TPiuGLBDLNc5N3upiW703s3rxcOnA302F7tlzB5FJ3zcRgIfyBK6KzLmiBAkIaFryKwHflVVVQKTMyyvF2O3lM5bFNKD3ZPb/WpJ49Q7YyY29w2ZisTfxiuGZ+x9TSSUsc8pLkVj9VsCeecnBF00LWA1g3MNg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746894455; c=relaxed/simple;
	bh=hlCUz5L7YYHCnAz5zXlcpfQ+9spDc53tAfo4cLSzHkA=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=FVpOK1ETOFXg/GYCVvnZmMp6rZnFz91UHRRZHNaRmK2FeX6K+ZqwtDwinGlnFQZ8zw7jakE4tLqoscyeeZFd26jnxjelkAsHJLLsN6mbpXFrhz40OsxaoOth1NbDeOZZ0+LVcwtQtfovVhSh7maCk01VmlmuBKCIK3RyOW49AI8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=VorTKi9A; arc=none smtp.client-ip=209.85.210.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="VorTKi9A"
Received: by mail-pf1-f176.google.com with SMTP id d2e1a72fcca58-73bf1cef6ceso3089711b3a.0
        for <linux-kernel@vger.kernel.org>; Sat, 10 May 2025 09:27:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1746894453; x=1747499253; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=iidseWrmQAaKmamWqRvKIa2BgakFXlBN60PWqSL08MA=;
        b=VorTKi9Ar3kvhqtt8FH4XieIxLAfCURQz+rxW7HSGD6D03NWA4v4o7uZU3hnGNNK2B
         UJ6j63YQ/XFwBJ8dt/EqENgfLdwwX/nfB/JxYQl4j5GHlc7hwIi1bvilmRnE6+WEgEaj
         A56ZcPGe3WeEAqeDAfD0BYchsS82bIBBTb/sOuRzZbXP5M89PUTLgrXS8IBb3EImgvRT
         a0TfTXZCXySCjxbgMmVfH0QSz37/pw3SapenVM4a5nqaCApeC4j3dAWvsoTUaqz3IpZc
         2IJEPTYuba5f0r5bI58IBMOQnAEivtp+YJaY6gDRN0csW1JWICz72ODCXIjNSd9hwNtU
         SRxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746894453; x=1747499253;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=iidseWrmQAaKmamWqRvKIa2BgakFXlBN60PWqSL08MA=;
        b=tMRtBnSavhvk/1Jv+52Ya9F+3cisiuSfDoebneu7l9UG/Pcu1LGQUFWyHrSl4xcCeV
         Gr/rOZl+Mrb8pgjyAsmAHHg6+QCURZ8XAqQF9+W5Yulb1krSe43SB/84XegNZeGQ0isV
         TFK4PfJEJXFZWIaCSNOP0YcI/dEMzxxlDf5AbgxN+HpDqhhD7RUjGelDAgBXjc7CBhD+
         8lFa56SUkucoURf78UiafZMoD2FGd7uL4cWZRLS2IzBNsXKLus/U1/10d/SGjGNfChBM
         FhsyWSxvOYiat7Fs8gFtnb1pKQ9ymYhPou80neibppJT+KDcWosNtIKhR6m9u9YMPj5X
         wDAA==
X-Forwarded-Encrypted: i=1; AJvYcCX6nGRg3qNHEJ9rsiMqqXimODEWQ/pnVDeNzccLg6Ie7kQWB4AWZ0GLYJ+jKspM7OjVQ0dJJuIc+6HptoQ=@vger.kernel.org
X-Gm-Message-State: AOJu0YwGMl6y3VfL+5QODZcVawF6+hpOBDh/QSGNQuYCYzMuHR6HmDgv
	Hrr6FG3yInTBFSc2/G1SSHXSpZLWsVCtjKu9DONgEbyrMCuN+bpR
X-Gm-Gg: ASbGncuamdnrZpDeLDmBX8ECSzjffuHvEn4ecd6GCaxoBDn5U8Mv/k9O5hV3TjNe+G/
	sOV+oVrVjo4vk2J9qgJHM7zQTxdN4MFsBc92M9r73RA2PKyOvKrJfC0lQi99l5kOtGraoUiTSjW
	EGjB3RcjBYst9bKS11Fc8uBdL2qSgZHavoZyRqKDP+QEvJ1CN6UdjeqBrS2b2Q0UsN1Z9At9I9m
	v49cHppxiD64deRElvCzd4yUTUpyjH1sCpQ+/qQeNRhlKMk5rDyQ64aLwCkUgyjAII+F5030fnO
	Ofsg6HZipRrf2tckXDzgryOl7UmvMXanqGi5uaB7Us4ZtmC01xdG2RQAHKCi5riOLx3uUkwW
X-Google-Smtp-Source: AGHT+IHK2beeCMsx/5Bzb+Gk5YE42dfO1pf769pj+RJ+6WHRlmFSwROvvhPL7g2xQITPSp6YBNMoDg==
X-Received: by 2002:a05:6a00:2353:b0:736:3ea8:4805 with SMTP id d2e1a72fcca58-7423bc5da8emr10943862b3a.7.1746894452823;
        Sat, 10 May 2025 09:27:32 -0700 (PDT)
Received: from gmail.com ([143.248.6.202])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-74237a0d012sm3483285b3a.93.2025.05.10.09.27.30
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Sat, 10 May 2025 09:27:32 -0700 (PDT)
From: Seongmanlee <cloudlee1719@gmail.com>
To: x86@kernel.org
Cc: leonardo-leecaprio <augustus92@kaist.ac.kr>,
	Thomas Gleixner <tglx@linutronix.de>,
	Ingo Molnar <mingo@redhat.com>,
	Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	"H. Peter Anvin" <hpa@zytor.com>,
	linux-kernel@vger.kernel.org (open list:X86 ARCHITECTURE (32-BIT AND 64-BIT))
Subject: [PATCH] x86/sev: Fix operator precedence in GHCB_MSR_VMPL_REQ_LEVEL macro
Date: Sun, 11 May 2025 01:27:24 +0900
Message-Id: <20250510162726.90681-1-cloudlee1719@gmail.com>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: leonardo-leecaprio <augustus92@kaist.ac.kr>

The GHCB_MSR_VMPL_REQ_LEVEL macro lacked parentheses around the bitmask
expression, causing the shift operation to bind too early. As a result,
when switching to VMPL2 from VMPL1 (e.g., GHCB_MSR_VMPL_REQ_LEVEL(1)),
incorrect values such as 0x000000016 were generated instead of the intended
0x100000016.

This patch fixes the precedence issue by grouping the masked value
before applying the shift.

Signed-off-by: leonardo-leecaprio <augustus92@kaist.ac.kr>
---
 arch/x86/include/asm/sev-common.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/x86/include/asm/sev-common.h b/arch/x86/include/asm/sev-common.h
index acb85b934..0020d77a0 100644
--- a/arch/x86/include/asm/sev-common.h
+++ b/arch/x86/include/asm/sev-common.h
@@ -116,7 +116,7 @@ enum psc_op {
 #define GHCB_MSR_VMPL_REQ		0x016
 #define GHCB_MSR_VMPL_REQ_LEVEL(v)			\
 	/* GHCBData[39:32] */				\
-	(((u64)(v) & GENMASK_ULL(7, 0) << 32) |		\
+	((((u64)(v) & GENMASK_ULL(7, 0)) << 32) |	\
 	/* GHCBDdata[11:0] */				\
 	GHCB_MSR_VMPL_REQ)
 
-- 
2.39.5 (Apple Git-154)


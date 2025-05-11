Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com [209.85.214.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2F1D5129E6E
	for <linux-kernel@vger.kernel.org>; Sun, 11 May 2025 09:24:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746955476; cv=none; b=fuC0Pqk9RG6ifpnLC7QPVJ8oVLHGN7P1xDvSPFUMUFXZ2MgZYhYA/17AcTRtulNKppoH0ZpDzS0FKk4d67UY9Z4QFv56rikBHVwd/GlBT/zB+WFDdbZvd+/Vlf9yl8iViKPkgpLigXgwEjn+KbgxLbSXP9bSuKH2bJaBTivHClY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746955476; c=relaxed/simple;
	bh=n7petmcWEhu5ZE4pI8JtVPeZjyto01Av+YaUcZsWgtA=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=iIofIXCnfERW90rZm++bT/++/kyI/Fn5pPj+mAkeRUSawGN7MWM563sK5h4BowId5ATadOV4xl2jxjAcAcLce1wFMcFd5QRk/xDUgugI4sQ2Ud+ukobcL7a2rENdS2gXMptiNOnGGGXr/oLyNzUDktPHoeu7w3TXuKl6dt8kJCQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=D7SMKpcK; arc=none smtp.client-ip=209.85.214.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="D7SMKpcK"
Received: by mail-pl1-f181.google.com with SMTP id d9443c01a7336-22e4d235811so50642885ad.2
        for <linux-kernel@vger.kernel.org>; Sun, 11 May 2025 02:24:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1746955473; x=1747560273; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=1fX4HJewtGhVdE48zpIdVL/o0o0tdKxzbqQzp9rYyxc=;
        b=D7SMKpcKFSsq+xYnEYpJlCyf8unueb4VSgvN0PoLquNjXrCzIKAwnoPfG/uIGbXxwH
         5BojrvlwMOYQfsys8j1ZwIsf9e5M1kuqDSTehxVIhySyrDMX5EfCShhfdGjYpa8n0hTh
         Zi3TcIcG141Uz5A+5e7iagKXXpiNAlFe4Xk598A3m65pH22JbYWP5ssoHpFxBUFLL93z
         xiLlmh741a9pE2xAy1vaVRjWbNYI3EIUCdj+thIWw3Me7cstFQMG0YsmzkyP+u9yFEmz
         HQWdsCF4do+xhIgDOHSeo6iWkBJKXT1quy+S60CASN1LCPS1j2MoMw3y1q3WpYu9Va0G
         e3lw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746955473; x=1747560273;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=1fX4HJewtGhVdE48zpIdVL/o0o0tdKxzbqQzp9rYyxc=;
        b=YZ2q0nOxn/9yA9saj8JkFsRjS6PXZHI6v8U2zJjZ/WG4JFpJiZ91PYdh0ib30JnH28
         RimApkHJn/DIpHplQ/gllx6BcTh7+VotvFKbi880NzeirjTT1pcryheuF2EfUvW0VH0y
         st+OIIH4fAkB4nJhhNm/sBinRaFWAaRb81wgSuyJZsMfHzaXH3v53usER62HUh8x0HWz
         NZ2tkPfASlJHtHRRRBhfh14xxXIevskftH0zICgLAaXaWwzuZxWNzkbzvxT0qN1aPe9q
         gLWMoziT+W+27iZr/RuNcvBhRywHtBZXXNtE1jZUtTBSTMit16dnJyLvQReFHTKaro7t
         HdIQ==
X-Forwarded-Encrypted: i=1; AJvYcCVT250tOcvOGn6cU6DucUViJLvCFlvKe0TmhYEEU13z1KkkMoWhAzghRY0CdBVN3UEp5EPflAeTo2mfRHs=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz6Nnx3SGwPaUZduKfgWbN+QcsKv8+xrrtv8SK5k2JJgc5XRZOS
	Wrqn2sO8FXR4Dr769KMGwug434P23+OMQfnC/2AfLFnHFYqdffAYRxZp2/EP
X-Gm-Gg: ASbGncsLY79OS6vL/xNU1LUC6QX4YW0cYKsa9MrD30CS4FKpF2bUVSBksH5YFUyQZXm
	cHHAorjJPtbqrC9O1QGSiTY7EYzTWoWbdsQtAmzIJ+5JnyLCO+331tKXmxg9cEK4/QkuGiJOFy2
	9mfPdYouOmuvrftVobf3o+q/AS6jIMd/v6+Zv8elyDaDIcjBZAUE60cbbs9bgbnmwOtRfnrwM20
	CkEwiqeUWpJXvIDWbZCyIGo9AeZ39Sd+lJddcM1EWcMnTyuLcSKDqdpWAfyaK4YXI2QTnUeX7/c
	Cqecf7JHK8k4HE0R9SSPbma1nH6HqjRurFCawRW1wrMNzTVQAKdHUXR00v4lgw==
X-Google-Smtp-Source: AGHT+IEQVhI09HetqzHXXKvTovEnX4JDk8W1v6y4xLbZuieisV1y4kcTYF/BakMsjQdL3D2q5RBwzw==
X-Received: by 2002:a17:903:2f88:b0:22e:1a41:a6de with SMTP id d9443c01a7336-22fc91a05d5mr151164725ad.32.1746955473312;
        Sun, 11 May 2025 02:24:33 -0700 (PDT)
Received: from gmail.com ([143.248.6.202])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22fc82c3063sm43388245ad.244.2025.05.11.02.24.31
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Sun, 11 May 2025 02:24:32 -0700 (PDT)
From: Seongmanlee <cloudlee1719@gmail.com>
To: x86@kernel.org
Cc: leonardo-leecaprio <augustus92@kaist.ac.kr>,
	Thomas Gleixner <tglx@linutronix.de>,
	Ingo Molnar <mingo@redhat.com>,
	Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	"H. Peter Anvin" <hpa@zytor.com>,
	linux-kernel@vger.kernel.org (open list:X86 ARCHITECTURE (32-BIT AND 64-BIT))
Subject: [PATCH v2] x86/sev: Fix operator precedence in GHCB_MSR_VMPL_REQ_LEVEL macro
Date: Sun, 11 May 2025 18:23:28 +0900
Message-Id: <20250511092329.12680-1-cloudlee1719@gmail.com>
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

Fixes the precedence issue by grouping the masked value before applying
the shift.

Fixes: 34ff65901735 ("x86/sev: Use kernel provided SVSM Calling Areas")

Signed-off-by: Seongman Lee <augustus92@kaist.ac.kr>
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


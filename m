Received: from mail-pf1-f171.google.com (mail-pf1-f171.google.com [209.85.210.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 622D128A1F3
	for <linux-kernel@vger.kernel.org>; Fri, 16 May 2025 03:06:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747364771; cv=none; b=YCPeM31SBFg1YrBgN14yJQ1cPPz7uImFkte7389iGlpHSYBcnHrz56gOgIZ5jwoWf+cFoq9SaNu4BzzNd/kd0QNHyWDdGTXd0PYOWbWEx2TVOByRPAWYdfMb2YjmfG6rL0/D6giLbVnr2H1v5Fo30hHssVgacGUbd7gGOEMOahA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747364771; c=relaxed/simple;
	bh=rf7VTAibhA1rsd++vGyUgsQGxAKMW4BWzucsOsuCqgw=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=C5FDYI9STc4hwLpPCSBfjWP7SzqZAVJcLHEkGyLax3tMkIz1lwqztVNqW5rV4G4cGSDXgD9p+Mpoo/bSNB0DjeV2D/fdqVqaxJZyG9mvK9Qf2DPWiuOBqoKhjv9K3/GMdnQCYdoKEJOvHs5+V6fk5od4LvU2HFcS7o1pR3l7m30=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=sifive.com; spf=pass smtp.mailfrom=sifive.com; dkim=pass (2048-bit key) header.d=sifive.com header.i=@sifive.com header.b=ANohnbXq; arc=none smtp.client-ip=209.85.210.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=sifive.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sifive.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sifive.com header.i=@sifive.com header.b="ANohnbXq"
Received: by mail-pf1-f171.google.com with SMTP id d2e1a72fcca58-73bf5aa95e7so1659779b3a.1
        for <linux-kernel@vger.kernel.org>; Thu, 15 May 2025 20:06:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1747364769; x=1747969569; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XAvviClstwfzUPfEFvJI1cAxXcDrrh9fZc4W+cMV6/0=;
        b=ANohnbXqXVg33Fh9fo4yuH/UVf8/s27vpKx36DmXdWsJ3ABJB/kZsGMAnF14nxTJ9s
         SvtpUsDdcmmWkeAs2SviehODZ8fjYY0lAIdeoSKMSplZUH1kfyx1LUkz/aQmhcK9oR6X
         pBCnfaZuXHdV5ObJ8rCJuFLMRaTwxNZ3wDOmuRl9HfGKp3kRrYtkWO0fz5NMmjUgZR9O
         gH/gRGRgBCuQe1sPybd6CF50KzRjeRSv/PGRWFHrySupvvhpafC9JUqy6i2EYOaJLOpg
         wHhouDT8H9EsD/KDTvdBaWiRBxN0BmwA9mktfY36g990U0o+Fj8VColAZG7RIDZ9BC5R
         OYYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747364769; x=1747969569;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=XAvviClstwfzUPfEFvJI1cAxXcDrrh9fZc4W+cMV6/0=;
        b=BUTygoXY1r4Rv2fuYvOHAKcH/6/tMYWw5pB3RY6LBPtR9+3a9mk2Aoq668OvyDxRsf
         7j7u36cPM7D19Gum45e0V6RlHMHasIBtYw6F/V12qMhwdPM3IZNA2/pPHPXuZRjLRsbW
         kE8s54YlV4Wa3H2TKc97QrPb9TFSbWF3mO13i2Gk9E8NBM47WlFbVBzOVl+wc1hZQKeM
         6VtU3q/anNK5LNPfNc63czMb2mNKpeC2NAHVFbvBS34msMJaJwqLjZ2dm2urO98Y3n6C
         by0TfhO+b8UPeE9aStu7UBH43R8LJXebQ9rOLKXU7bP7MQ3Uuo33p4PaRv6KZmZRQPcU
         Nfwg==
X-Forwarded-Encrypted: i=1; AJvYcCWS/8aqXed/f8QEwpK3o9g0sv2pNRxApRG75LhoAuI6IVut6YGNOWp+xkiQ3DVEXRFi6DxLZLJblA1oflI=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx8s+csp/V2II33YAKAfWV/QMTKVybaSUHUnvjmtpFX2iVMplgO
	FrkNs0kwIYo5HAVQ+BAYrbF4GpJ8rj0Ec8VyfpjLvGg9Fm9VwA627dDCkNS73wg0TEY=
X-Gm-Gg: ASbGncvbBNvLdLPoCBms7QAK5plChKb1hhSup2NZQhdUaFgGtEad1P/0NnEOBbC5rQY
	4wVZQMYC5roi40iE3V2ocDpRv0moOv/YPuFsEwHmWGw6RVUNXIXsrROQg9De2F3F7aJwImf5/8c
	t4A9J/0/q4FgWjFe4LtjGjLEeoQIy0fKbORP+VYyJnsVp2FzA+rQWpuWGHDoLHDO2xk+djw3nsh
	cJxvw8FAMIuy5K/vlv2BzSs7nHoTF3b0RX37/R0I0PDkP+9EG3uZK0wmEjeBfWWi9pV7ozwzw5J
	cnyiiRVQKSknRiLviF4LWt845ExymOHOX3FlCx89FXeX1J/N7lDROVd9mkd+oQGMvVzYBtUEf33
	VrR8SJzsJ08k=
X-Google-Smtp-Source: AGHT+IHVpCZywGkosLX5RQG0/6A89Lg45RQ0IyzHm6KOJO4LmSTZatNjMavA6pelGe0MU+ect8RLXQ==
X-Received: by 2002:a17:902:c951:b0:211:e812:3948 with SMTP id d9443c01a7336-231d334d209mr22719205ad.0.1747364769522;
        Thu, 15 May 2025 20:06:09 -0700 (PDT)
Received: from cyan-mbp.internal.sifive.com ([136.226.240.168])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-231d4ebb084sm4804405ad.201.2025.05.15.20.06.06
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Thu, 15 May 2025 20:06:08 -0700 (PDT)
From: Cyan Yang <cyan.yang@sifive.com>
To: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	corbet@lwn.net,
	paul.walmsley@sifive.com,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu,
	alex@ghiti.fr,
	samuel.holland@sifive.com
Cc: linux-doc@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Cyan Yang <cyan.yang@sifive.com>
Subject: [PATCH v2 11/12] riscv: hwprobe: Document SiFive xsfvfwmaccqqq vendor extension
Date: Fri, 16 May 2025 11:03:09 +0800
Message-Id: <20250516030310.16950-12-cyan.yang@sifive.com>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
In-Reply-To: <20250516030310.16950-1-cyan.yang@sifive.com>
References: <20250516030310.16950-1-cyan.yang@sifive.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Document the support for matrix multiply accumulate instruction
from SiFive using RISCV_HWPROBE_VENDOR_EXT_XSFVFWMACCQQQ.

Signed-off-by: Cyan Yang <cyan.yang@sifive.com>
---
 Documentation/arch/riscv/hwprobe.rst | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/Documentation/arch/riscv/hwprobe.rst b/Documentation/arch/riscv/hwprobe.rst
index e15405e12239..7c11351b1383 100644
--- a/Documentation/arch/riscv/hwprobe.rst
+++ b/Documentation/arch/riscv/hwprobe.rst
@@ -353,3 +353,7 @@ The following keys are defined:
     * :c:macro:`RISCV_HWPROBE_VENDOR_EXT_XSFVFNRCLIPXFQF`: The Xsfvfnrclipxfqf
         vendor extension is supported in version 1.0 of SiFive FP32-to-int8 Ranged
 	Clip Instructions Extensions Specification.
+
+    * :c:macro:`RISCV_HWPROBE_VENDOR_EXT_XSFVFWMACCQQQ`: The Xsfvfwmaccqqq
+        vendor extension is supported in version 1.0 of Matrix Multiply Accumulate
+	Instruction Extensions Specification.
\ No newline at end of file
-- 
2.39.5 (Apple Git-154)


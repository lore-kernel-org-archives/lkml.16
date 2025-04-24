Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com [209.85.214.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CF34528E5F7
	for <linux-kernel@vger.kernel.org>; Thu, 24 Apr 2025 17:33:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745516036; cv=none; b=Z+21Styb6dUg+DdyBPqo1giaculXoB07LJILGOicogTgvMeAgWlzl3skl2Kr+95oCnQPr0j7pk5FowrifBg50Aq0ZSiXfY2/FXPIk3tcXGojo7d61k4OHEywBw8fhYdNvFWqwqYTfNc0Ie5IGgSAXTkNM+UvOXBPSs5hEIW7h0g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745516036; c=relaxed/simple;
	bh=Hvkg2vuWcLH+loCVg3KfVBlKpSfZ+GMWX4LieYFjwwE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=JNUsd4ra+iKvLJ8GmnAOO9gph9m3zCollWkutebbaFlxvbUwhHgJhB8SQw6qfWkvHI/VleVLbrNCB+KMDhzceU1RN157JQGNkU8R+09dtgAjaAiLA7+JwjZDEEYsGyPvCeq6JNTJHX4zxAo4k1bfw1FqVqHoYWoNAGhET9vGLY4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com; spf=pass smtp.mailfrom=rivosinc.com; dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b=gKbkbaRd; arc=none smtp.client-ip=209.85.214.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rivosinc.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b="gKbkbaRd"
Received: by mail-pl1-f182.google.com with SMTP id d9443c01a7336-22c33ac23edso13514615ad.0
        for <linux-kernel@vger.kernel.org>; Thu, 24 Apr 2025 10:33:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1745516034; x=1746120834; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gvf5XOciI2RxholK/olnAUr6RSsyRw+cO5ZQm+/Dg/Y=;
        b=gKbkbaRdJYoVwsyPc3EomBxUmPD6s2gSEj8UW55j1mMS/jZ9Akw/CBTGI3I/tmi8c8
         QRUe1lirj8vIgl15mVPVE2tf7SI0WbtfYAJXfwbt01Trm1oRIyXdX/aaQRQ4wBguaf3m
         PjML0brUMIJj2+XlNO5u8gUO0FiB5vYmxNNCxvZWQvczN/TePt2/+MG+8pHVBX1148Tf
         EC8ho4ME1cz6M4BfdnPgSPZ4YFq7WTPuGm6p9GwgAYRdV0ABS21SpRY19liNIKeitbXR
         Pqy2OXZ5JwdhycOf8ZpGDvPLTKAdp5uGj5lOBBYf066LLebU4TVHGdsIjGSz65cs6UtR
         mJ5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745516034; x=1746120834;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=gvf5XOciI2RxholK/olnAUr6RSsyRw+cO5ZQm+/Dg/Y=;
        b=XmpxzU+GbPx6nJCbhf0DKacanFCQKFC7FIgT9ufS56dXyoA3Xz45eqyJaYywDsr/z2
         54JsgSdmB2PFHCQ31nBO2xw2f72i9CtOsgmiQ9IgQ1yN8CIUtlnf0WYlXPW4NHbUk7oP
         X0/KC0SHfBJ25duqHrHTXc1GnEcSiPBDRSHHGWJZ8D0OUxQ/TloA+6iZ0EoiJrP+U2aA
         eIH+1A4YSPPsH0zWMQeG6GgZhNlq9Y2w6nPXqzV4kjhTW0ixE3orOqe78V18Z223UdLy
         PHu8HePD51zKnT8mcASmKAi5xuZf5bTCbDh3QHb4hCoIzRxebOaAKbN4g3vrW8g3YwlP
         Hv3A==
X-Forwarded-Encrypted: i=1; AJvYcCXJrc3C+EcSyOp7saEpQzcUoad6OCC9Ms/4sP8HN5OMdB6wL/wLHxT7XLnubLhm5uIJGRIaiuB7g1R6i8Y=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx3MpuC0Ze+OLilJP9uLVQ1tZBllbixA2Ji9PiN0QwCWmqMXWZ/
	XnPP1KBMPhNoedRqg2d6ft69ncg90aKwKhkOEZsZy2ybJ5AhyK/sF0a7DImQ6GM=
X-Gm-Gg: ASbGncvGMgCvnBjL2JBKq1Rpe0T0LgpAD8DAlx6sCaDCclL0082+EZppMRdBPF6V41H
	LdxRE8S3SHS2Vcb+Xn+ViK4VqVt/NakOOyMbL6NABIIctk+URU/efdF9boucchFZfKMUln0V9c/
	kZBE8P7WDbHbnFwUMTqtawL1PTCbQAVdNt+wHqPLYhRX6NK++yAE9FHMxUM9PWOiyDNkpyeArDt
	kU2LL/vY0D4gyyPT8iBm6y52rz6Oh+ppCvCmptnd/otw0nfYo9TlR5GWZlQgdfh8f4cadRdQH+d
	26ld36EliNtk8C7nxMshwTaqfeml5BxLNEpGumwFUQ==
X-Google-Smtp-Source: AGHT+IHaM8bzJfRRvw0MkUxc3QW2tm+twyY3rgnrMs/7xPlJBt/0WAycPUEFxVys/K0zq71dkmTO4g==
X-Received: by 2002:a17:902:d489:b0:22d:b243:2fee with SMTP id d9443c01a7336-22dbd415915mr4178995ad.13.1745516034428;
        Thu, 24 Apr 2025 10:33:54 -0700 (PDT)
Received: from carbon-x1.. ([2a01:e0a:e17:9700:16d2:7456:6634:9626])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22db5100c4esm16270255ad.173.2025.04.24.10.33.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Apr 2025 10:33:53 -0700 (PDT)
From: =?UTF-8?q?Cl=C3=A9ment=20L=C3=A9ger?= <cleger@rivosinc.com>
To: Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Anup Patel <anup@brainfault.org>,
	Atish Patra <atishp@atishpatra.org>,
	Shuah Khan <shuah@kernel.org>,
	Jonathan Corbet <corbet@lwn.net>,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-doc@vger.kernel.org,
	kvm@vger.kernel.org,
	kvm-riscv@lists.infradead.org,
	linux-kselftest@vger.kernel.org
Cc: =?UTF-8?q?Cl=C3=A9ment=20L=C3=A9ger?= <cleger@rivosinc.com>,
	Samuel Holland <samuel.holland@sifive.com>,
	Andrew Jones <ajones@ventanamicro.com>,
	Deepak Gupta <debug@rivosinc.com>
Subject: [PATCH v6 02/14] riscv: sbi: remove useless parenthesis
Date: Thu, 24 Apr 2025 19:31:49 +0200
Message-ID: <20250424173204.1948385-3-cleger@rivosinc.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250424173204.1948385-1-cleger@rivosinc.com>
References: <20250424173204.1948385-1-cleger@rivosinc.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

A few parenthesis in check for SBI version/extension were useless,
remove them.

Signed-off-by: Clément Léger <cleger@rivosinc.com>
---
 arch/riscv/kernel/sbi.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/arch/riscv/kernel/sbi.c b/arch/riscv/kernel/sbi.c
index 1989b8cade1b..1d44c35305a9 100644
--- a/arch/riscv/kernel/sbi.c
+++ b/arch/riscv/kernel/sbi.c
@@ -609,7 +609,7 @@ void __init sbi_init(void)
 		} else {
 			__sbi_rfence	= __sbi_rfence_v01;
 		}
-		if ((sbi_spec_version >= sbi_mk_version(0, 3)) &&
+		if (sbi_spec_version >= sbi_mk_version(0, 3) &&
 		    sbi_probe_extension(SBI_EXT_SRST)) {
 			pr_info("SBI SRST extension detected\n");
 			pm_power_off = sbi_srst_power_off;
@@ -617,8 +617,8 @@ void __init sbi_init(void)
 			sbi_srst_reboot_nb.priority = 192;
 			register_restart_handler(&sbi_srst_reboot_nb);
 		}
-		if ((sbi_spec_version >= sbi_mk_version(2, 0)) &&
-		    (sbi_probe_extension(SBI_EXT_DBCN) > 0)) {
+		if (sbi_spec_version >= sbi_mk_version(2, 0) &&
+		    sbi_probe_extension(SBI_EXT_DBCN) > 0) {
 			pr_info("SBI DBCN extension detected\n");
 			sbi_debug_console_available = true;
 		}
-- 
2.49.0


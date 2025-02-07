Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 095C8182D9
	for <linux-kernel@vger.kernel.org>; Fri,  7 Feb 2025 16:20:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738945207; cv=none; b=XugmY+qxnosfWjTdFDMCcW36TiKGNUUQSCVhoarXIHK13teUMtzxvMJPH4PFRpMNPDvGBW3L6UdQktONI+HvJmzDVsPMH4DlzaQqRpgRQducnIh/nhkKPeI2PplQ6I2jhOoUGaIfq5ue73OUSaYqwPg+CyXoIcPxTQlDt6ManW4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738945207; c=relaxed/simple;
	bh=gt6Fw2XKGx6sF/gq8i36RjjcfICtnuHbiXOCGkVO0kk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=L2VjbfRxSqG/zzBaTcFVyWAol0IzuPVynkTBNdY2+PBuJOlK5/Nl9JUFfw7LiV14meFBrj0GTDLtQpiFoVSitHJNSmc9qJ2bVDVghWtDtUM7gz5czBA6YB+ETwzMWo8lKq5rqjHpYlhfTXsSQA34bAlhUb0D+6zyiVuv+btQzMY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ventanamicro.com; spf=pass smtp.mailfrom=ventanamicro.com; dkim=pass (2048-bit key) header.d=ventanamicro.com header.i=@ventanamicro.com header.b=KftCLIi6; arc=none smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ventanamicro.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ventanamicro.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ventanamicro.com header.i=@ventanamicro.com header.b="KftCLIi6"
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-4361b6f9faeso13800465e9.1
        for <linux-kernel@vger.kernel.org>; Fri, 07 Feb 2025 08:20:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1738945204; x=1739550004; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=uuW8lN3LlL4CuR3qOD5OEg9Po1ieu6WyRch8wZV6JCU=;
        b=KftCLIi6LniKERuAr+Q46HtLLq8dziUGUzUgH1F5/hkgui98HXRtszKAggsoZ2RtVh
         6HDDZEXDDuOmYoVF7NGJpp4lhxHDObvVHeeQFUL7kWptPixOhQnaQkY9QcWjmoKLvEiZ
         FREgClRHfp1z+0CcCophxk5+6fxi5p+sZVYkcJwZqhjQSkSRrawTu3vkk17JiphzRUEU
         705GgeT3WEFBNdJmDf21k8N84q7dbspKCmEzDA2MfY67mbKGhB/UJhZ1jBoADVPk/wVg
         Td2iNf+830SLw2zQuqf9am9dC+BL/u00AGXY0gDZ2fmWrGaOSyjsj5rGgXXbhkH31B8I
         DLpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738945204; x=1739550004;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=uuW8lN3LlL4CuR3qOD5OEg9Po1ieu6WyRch8wZV6JCU=;
        b=ZbmNTq23YKOJWChCLzEV/bAz+KR4GSI77k6XshNn/oHYcO31m/C8zzSTrY1FlHd3tF
         ZTlSyJkuQuvXVthSj5MD1RZtwSZ2hUz1p0S0X+SZTWhSvxapY2VEDnWTHl0nAi8RT8X1
         YCNbN7nA/Yt87YH5jcO0+O9WCgG4Lmkq5nKKbdgXXjV1NJmhC6jp7fUwiELiqgGoJ6K4
         fzwvVXk1dl1tuxuKu0M73sjcrhKzVkLx2/GaXvmw270syMfhpLWCz8d+g4guCBFzM4Vl
         Unr74owTa774+em4fFriW98fu9BVK6ORfkPdE3lQachRLgW4Y08h0eGZsb/EWuyeIxdt
         3utA==
X-Forwarded-Encrypted: i=1; AJvYcCVbxgzEmlc9eHJKw3GtTNwMQMHkQQcfsGE1OXQWZ5t5+9GOlnRoEKpPAamUVUj3xCIW5/xPS9Nzq2NGjKs=@vger.kernel.org
X-Gm-Message-State: AOJu0YwXevv03Gf/iQXiAOJx47FpHGNEhsLvnVveE6MDfOQBI/1hUehY
	LlL/MVX0JfPRmPbvmjTTa3SZir7x9bSt9xjV3+a1IxNyjN8tBwfwqbXcAQEOPW0=
X-Gm-Gg: ASbGncsTW8Bv55kxNAiRUPjnVBkF1HjhOJghIyRB218AlAvpW7kQ+CBkG+dDrTQXwWF
	OPIWjPPuXSTN8BdusoytdPz8/gDsPSQrvRPB+PFhmG2DPEQZDXctsXBzNAbao1dlsw3n9p2SeZf
	322L708oinVe/EM3dBA+5rwPRtIglHbpZc0AVpursPflOI3y1x6To6wSGzk10bmWTi774113Eer
	A17eYsJxwp/EnVB/ImbvrsA2tujUXu3IEM1Hc6oRMWVzwI0bKrvdgpuWc38SWvGs3dGTa9zL9rK
	A3iAgQV721B+Bfoj19KVMiDQLxrHhN15wLH2fxCqFnill71adEiu7qD0Zw==
X-Google-Smtp-Source: AGHT+IGMKi65e/Z5vWbx7WgCmphLVzyy3Q2WyYGIC9JFl7WcR1tKm4dOZKbtrD9rcb9U1JUgAquIdw==
X-Received: by 2002:a05:600c:6c01:b0:436:1b77:b5aa with SMTP id 5b1f17b1804b1-43912d22565mr59485145e9.8.1738945203976;
        Fri, 07 Feb 2025 08:20:03 -0800 (PST)
Received: from localhost (089144193052.atnat0002.highway.a1.net. [89.144.193.52])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4391da96640sm62546005e9.8.2025.02.07.08.20.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 07 Feb 2025 08:20:03 -0800 (PST)
From: Andrew Jones <ajones@ventanamicro.com>
To: linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org
Cc: paul.walmsley@sifive.com,
	palmer@dabbelt.com,
	charlie@rivosinc.com,
	jesse@rivosinc.com,
	Anup Patel <apatel@ventanamicro.com>
Subject: [PATCH 4/9] riscv: Change check_unaligned_access_speed_all_cpus to void
Date: Fri,  7 Feb 2025 17:19:44 +0100
Message-ID: <20250207161939.46139-15-ajones@ventanamicro.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250207161939.46139-11-ajones@ventanamicro.com>
References: <20250207161939.46139-11-ajones@ventanamicro.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The return value of check_unaligned_access_speed_all_cpus() is always
zero, so make the function void so we don't need to concern ourselves
with it. The change also allows us to tidy up
check_unaligned_access_all_cpus() a bit.

Signed-off-by: Andrew Jones <ajones@ventanamicro.com>
---
 arch/riscv/kernel/unaligned_access_speed.c | 15 +++++----------
 1 file changed, 5 insertions(+), 10 deletions(-)

diff --git a/arch/riscv/kernel/unaligned_access_speed.c b/arch/riscv/kernel/unaligned_access_speed.c
index 02b485dc4bc4..780f1c5f512a 100644
--- a/arch/riscv/kernel/unaligned_access_speed.c
+++ b/arch/riscv/kernel/unaligned_access_speed.c
@@ -218,7 +218,7 @@ static int riscv_offline_cpu(unsigned int cpu)
 }
 
 /* Measure unaligned access speed on all CPUs present at boot in parallel. */
-static int __init check_unaligned_access_speed_all_cpus(void)
+static void __init check_unaligned_access_speed_all_cpus(void)
 {
 	unsigned int cpu;
 	unsigned int cpu_count = num_possible_cpus();
@@ -226,7 +226,7 @@ static int __init check_unaligned_access_speed_all_cpus(void)
 
 	if (!bufs) {
 		pr_warn("Allocation failure, not measuring misaligned performance\n");
-		return 0;
+		return;
 	}
 
 	/*
@@ -261,12 +261,10 @@ static int __init check_unaligned_access_speed_all_cpus(void)
 	}
 
 	kfree(bufs);
-	return 0;
 }
 #else /* CONFIG_RISCV_PROBE_UNALIGNED_ACCESS */
-static int __init check_unaligned_access_speed_all_cpus(void)
+static void __init check_unaligned_access_speed_all_cpus(void)
 {
-	return 0;
 }
 #endif
 
@@ -403,10 +401,10 @@ static int __init vec_check_unaligned_access_speed_all_cpus(void *unused __alway
 
 static int __init check_unaligned_access_all_cpus(void)
 {
-	bool all_cpus_emulated;
 	int cpu;
 
-	all_cpus_emulated = check_unaligned_access_emulated_all_cpus();
+	if (!check_unaligned_access_emulated_all_cpus())
+		check_unaligned_access_speed_all_cpus();
 
 	if (!has_vector()) {
 		for_each_online_cpu(cpu)
@@ -417,9 +415,6 @@ static int __init check_unaligned_access_all_cpus(void)
 			    NULL, "vec_check_unaligned_access_speed_all_cpus");
 	}
 
-	if (!all_cpus_emulated)
-		return check_unaligned_access_speed_all_cpus();
-
 	return 0;
 }
 
-- 
2.48.1


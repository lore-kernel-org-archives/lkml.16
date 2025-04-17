Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com [209.85.214.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E2FBE24500A
	for <linux-kernel@vger.kernel.org>; Thu, 17 Apr 2025 12:24:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744892677; cv=none; b=k/+V+WIxcp4uM6dRLuHZUr02Z5w/u+zu4S3B0cqXHdmnRguzjpK7LHMnVBQt2KluzgNAU4TDCQLcmVrfVO0sNXooJSAURNEZVuSXYzDPjwlFePXjOfT9fxqzOWhH902nkS5IrUNrR+ANMmpiRWq6s5VYEPAp4lJhljyntVNRRn0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744892677; c=relaxed/simple;
	bh=qJu1m4hx4nbu+oDFlDHA2hR7AvuynQAz0skV827DhvM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=RK8li1Q8t3mI4xHjJsFkHdbjWsNC7xDjtEYPu4KVBfwysgWVPsgw7FTvcCQPUQgiaqMDEQy/1KnP12vxoIgXWZsi6hV0t8OynU4Go/sTIqqbnllB7nrldKaibEL/IXZ6lUD176j6icLV+R84lEf/bzeBZxuUfQA8kgnt3XiYI3k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com; spf=pass smtp.mailfrom=rivosinc.com; dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b=Gvcv5E0q; arc=none smtp.client-ip=209.85.214.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rivosinc.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b="Gvcv5E0q"
Received: by mail-pl1-f169.google.com with SMTP id d9443c01a7336-224191d92e4so7402725ad.3
        for <linux-kernel@vger.kernel.org>; Thu, 17 Apr 2025 05:24:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1744892675; x=1745497475; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DkvRtqiwpGFu2F2LneoosRxgLPIUe40LOw9HI4KIxXc=;
        b=Gvcv5E0q7WqcEvNo6Eg5joSeG01Iyyd0lKPavaMmhHr3u+PWN0xV4mFwfqRmSAB30o
         qUA/7LCPqp9+QlScp8y/95J/eJVwK0D9OOeSI+nioht74bY6oFljLxmg5DfM30v+BIgc
         HMtT4jD8vCrKvRau9K9pGlwr4rM0LIkBcAnnTeei9YX/fLZVzAFVztfaej6wQrqlhMLr
         sNlD+LX94iVvxutP4h3nLBAFrgSwiCLj3JTa7dOt2qVfnjEjR+aIuwugOicZriRCSGac
         plf9mnYgKJMqhWn5eQHTdulbIo8C/gL8d9/wX8ZCjUPcHzDFbq/GCc2rGkQL+YL0hhEC
         iTYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744892675; x=1745497475;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=DkvRtqiwpGFu2F2LneoosRxgLPIUe40LOw9HI4KIxXc=;
        b=m68AP+Pyio3HcXqoeJl9GquNiYPbNbPZ7lmqnls85nuIFMYvva0Yki/OK+YfIEec1h
         IkKp4SLKDcsN+w48q6bB8Ml9P1USdfrWXeCMpQSW04qgNyGqGb/0XzPyl8MlFkDOCfjV
         uoPpbAW6Tp1/xDxGH6kC6kK/pAVbQLQNSeb56qB/ZjNw4V/PBZ2HJcsCSomVjKIQDXKA
         3K7GbqMMAkegBtwxhZ941sO+FE+uMZWbdIB2HzA7domc5hLenZALQQ5LdSWQk5olQqlD
         IxP/bVAs+KO1SZLgmqg+ywb0jsf30Szq2mY1ywVzjI23anbcFmVROdKT4b0AQ2TtZRc1
         GGYg==
X-Forwarded-Encrypted: i=1; AJvYcCX+TP7xI3piONoC1Winf/7fyDXRBY1KaULLKRmAgdkKibliK+SS1WtcTcCMC+HKSteSgIqkRFj9x6mEe9E=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx8qiEOghWsA/NFuDFwFGtiBdkNtA1Te8eByqkkaNBznpSCstvU
	gmiqpnTXFM9vnaUwEznVYWvoIZrP8PkRVxj+Pa+ZLd/0zz5wfkf1r7fQ78/SRh4=
X-Gm-Gg: ASbGnctofRm/MANfGX2p8ZI7BG+Z6hzlMIpIIkX8ckrRtQXsnu2dq6XO/gVJhWou88H
	kua6fgsYwc8ERH0qbGUwHmEjKDTBYXOz4lXCzytd7gISdG/Nmp7EhUL/w8O2q3hTCE0MwB7abtQ
	E8qWAWWfUXPkmeK3gdKsbTy16wzFYG6KmTQSMBmz8SKrp2uNKkRj3R8sIXGZUu8pFS3fk92TZ6K
	vdLCkhsLwW4x3TzK537ogAW5C5cpuKDt4efP2orumT9adqfS/i1/ohwO64InXMyBtqzDtgmtQxv
	v3l1E+NvfWJFv7abOilyWehjbUgXgzzIh5N3VRKdDw==
X-Google-Smtp-Source: AGHT+IFwoPNkZRHRLCRUuOqGDF2uiHAGyCvd3q8quDmBUyk1f/F/4WvIpLrbGYXfNhaC6uEF0f4feg==
X-Received: by 2002:a17:903:2447:b0:227:eb61:34b8 with SMTP id d9443c01a7336-22c35916f13mr99932925ad.25.1744892675059;
        Thu, 17 Apr 2025 05:24:35 -0700 (PDT)
Received: from carbon-x1.. ([2a01:e0a:e17:9700:16d2:7456:6634:9626])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22c3ee1a78dsm18489415ad.253.2025.04.17.05.24.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Apr 2025 05:24:34 -0700 (PDT)
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
	Andrew Jones <ajones@ventanamicro.com>
Subject: [PATCH v5 04/13] riscv: sbi: add SBI FWFT extension calls
Date: Thu, 17 Apr 2025 14:19:51 +0200
Message-ID: <20250417122337.547969-5-cleger@rivosinc.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250417122337.547969-1-cleger@rivosinc.com>
References: <20250417122337.547969-1-cleger@rivosinc.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Add FWFT extension calls. This will be ratified in SBI V3.0 hence, it is
provided as a separate commit that can be left out if needed.

Signed-off-by: Clément Léger <cleger@rivosinc.com>
---
 arch/riscv/kernel/sbi.c | 20 +++++++++++++++++++-
 1 file changed, 19 insertions(+), 1 deletion(-)

diff --git a/arch/riscv/kernel/sbi.c b/arch/riscv/kernel/sbi.c
index 379981c2bb21..7b062189b184 100644
--- a/arch/riscv/kernel/sbi.c
+++ b/arch/riscv/kernel/sbi.c
@@ -299,6 +299,8 @@ static int __sbi_rfence_v02(int fid, const struct cpumask *cpu_mask,
 	return 0;
 }
 
+static bool sbi_fwft_supported;
+
 /**
  * sbi_fwft_set() - Set a feature on the local hart
  * @feature: The feature ID to be set
@@ -309,7 +311,15 @@ static int __sbi_rfence_v02(int fid, const struct cpumask *cpu_mask,
  */
 int sbi_fwft_set(u32 feature, unsigned long value, unsigned long flags)
 {
-	return -EOPNOTSUPP;
+	struct sbiret ret;
+
+	if (!sbi_fwft_supported)
+		return -EOPNOTSUPP;
+
+	ret = sbi_ecall(SBI_EXT_FWFT, SBI_EXT_FWFT_SET,
+			feature, value, flags, 0, 0, 0);
+
+	return sbi_err_map_linux_errno(ret.error);
 }
 
 struct fwft_set_req {
@@ -348,6 +358,9 @@ int sbi_fwft_local_set_cpumask(const cpumask_t *mask, u32 feature,
 		.error = ATOMIC_INIT(0),
 	};
 
+	if (!sbi_fwft_supported)
+		return -EOPNOTSUPP;
+
 	if (feature & SBI_FWFT_GLOBAL_FEATURE_BIT)
 		return -EINVAL;
 
@@ -679,6 +692,11 @@ void __init sbi_init(void)
 			pr_info("SBI DBCN extension detected\n");
 			sbi_debug_console_available = true;
 		}
+		if ((sbi_spec_version >= sbi_mk_version(3, 0)) &&
+		    (sbi_probe_extension(SBI_EXT_FWFT) > 0)) {
+			pr_info("SBI FWFT extension detected\n");
+			sbi_fwft_supported = true;
+		}
 	} else {
 		__sbi_set_timer = __sbi_set_timer_v01;
 		__sbi_send_ipi	= __sbi_send_ipi_v01;
-- 
2.49.0


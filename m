Received: from mail-pf1-f174.google.com (mail-pf1-f174.google.com [209.85.210.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 259EF229B27
	for <linux-kernel@vger.kernel.org>; Fri, 23 May 2025 10:21:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747995688; cv=none; b=CaJw3mzGgFPZCFoGQsJ+7E2gjzAt9Dx+jtf5E75Ic5jBfXyFJxveyItVsHNFDayaeXoJvZTcu6BjF65Xy9kwybsKzTlyO4b3BdDIOPDKXEt97vh/8vLbyWTsuSkLEVwl12dpJdoH9Z4wXqBhaX0115ssEeDEjnqOkTQHqkgtx4Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747995688; c=relaxed/simple;
	bh=IrQydkaY6DjwPRJK+9IUCeQaVW2h03QqX2m5JrkLHsM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=NQ21XKwqxg4d05G1Lg9FbKS5SSryBRgDqnkTYiyRKtK3LvLScejJVoWb/H+ONqWpQfMm8G54Z8J9hTvTWqA4/WrpGQJKQv0mdTD+wmgqLyzdEBDSvFRiQ/aCc+8EFTiQZ7MKT82l+w3YAGUc6iUTt3O+1C6ETqNFkXEOdiJxMOQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com; spf=pass smtp.mailfrom=rivosinc.com; dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b=gnlmb34n; arc=none smtp.client-ip=209.85.210.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rivosinc.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b="gnlmb34n"
Received: by mail-pf1-f174.google.com with SMTP id d2e1a72fcca58-739b3fe7ce8so7202390b3a.0
        for <linux-kernel@vger.kernel.org>; Fri, 23 May 2025 03:21:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1747995686; x=1748600486; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JOCKOWdc9Rm9mheK+/kf775/MsCKzvlzcdVw7vqLpnQ=;
        b=gnlmb34nVq9j9Zq8ABlOYHRqoBUDr0Y9DBNqWSzHmFm81V+lVCivLGkqXewwRpgRMQ
         +pjSJcP0fsKxhWHm50bqUZCaMy1Ojlh6gZ637LWkTBY245IPkSlpwgryphoS57XA6P6S
         Jc/J5Xqf/+KsKik49E262ItQ92hN4I12rxW/Xui3jY6BcnnemrXh1iKcGBFEwEFNKvoE
         vcNd5hpqiZLPjE/6nAPoezUc+s2bbsjsLElYRYoqot9LH5G6XXv4auCL9T/HJQLho13T
         IIkXzc4lI4lIXZKXMGbmLT5Upr9s+b7XEzY8MSm/la2Q3Aaj80TjwKLs5GbmKmY9ymXL
         uP4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747995686; x=1748600486;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=JOCKOWdc9Rm9mheK+/kf775/MsCKzvlzcdVw7vqLpnQ=;
        b=gRiZUH1Oawj72lMAdcJKxTrxq3NjKCicnLtnKQVcwEHfJa3Mg7LZyb1sH8faKnCfuL
         5OjBCgbzNb2ZDJDviktwdm9QsuXVV0cEBaWEgDE99gcTTaPjILyngOAzax8HTb4ggnHy
         WI2a97XBC6BewuTdm9i3Q7bhlSkIOnP8dhIjttQHDjNvEliq8oHtO0RcijlpXuEobzLZ
         0MLlpyIoFfIc3XnjgWfUdAM0mkXEn+qXnaxlDTeGAptBCTBnFKV+/Ou7h5ksslJueUJY
         5Hk/3vNshvFNYAUPjo9MeyBRHc4m+eDkYScXUdrXB8ev0MTJspsbyCTC9njK24jovFwk
         puDA==
X-Forwarded-Encrypted: i=1; AJvYcCXzKFpoat49t7bU6WGvx3oVtRJuxVeYe5PIHQdEUAy30mBOiOBRG/IUKqtinhowvPkoFjzcswAXfObKC+w=@vger.kernel.org
X-Gm-Message-State: AOJu0Ywxhs9ejjJlGoYPCJwcfMdCin4RI6BJ4GcLqynUVWQ+8g5Ni2/z
	102rlGx+0AJryghPFAktyXXliJ3UQycRtYRIdbLlpWJk9Q+52uyySGvtqtktvsGpULQ=
X-Gm-Gg: ASbGncuxnZTruNypSYA3lVie2IhfFMxOk3FXUCLxtEp83eIKyGKU/8fmq0+skpDBfNu
	YrnGfAj0WTHTin80gqB4JSvi4nSh/VBdNd4AvkrDAQdT6qfVFEb/1UplCV9OWortmI/3HGQ4R8B
	zU1wsxM6ivmoKiZShKuA7vGUv7+7HHLeXxJq67/FY7s9DVnGFSnxNBqJO9KwC/01y1X3KFZRByV
	onIT6qgkGRSceqXYTQKncwUZmSJ9cNuIGPwRTC2pQn2MdK5gA4k4wK32zAJs3zMyg6iEVa3hlhf
	o6OjZK80EjqaewWsZMVlgTXYJUaGhHj4QvEZGEyNKh7wS4C9VnfkhxsjMbBo4gw=
X-Google-Smtp-Source: AGHT+IHNfzHp2c4l+fFLy0Ork8ZH3OaE1w7FL08Zf1prOjyoxcu7ttu2ohtJhdZMuyb/aYjEahxS1Q==
X-Received: by 2002:a05:6a00:1788:b0:736:5544:7ad7 with SMTP id d2e1a72fcca58-742a97eb5b9mr40841129b3a.14.1747995686279;
        Fri, 23 May 2025 03:21:26 -0700 (PDT)
Received: from carbon-x1.. ([2a01:e0a:e17:9700:16d2:7456:6634:9626])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-742a9829ce8sm12466688b3a.118.2025.05.23.03.21.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 May 2025 03:21:25 -0700 (PDT)
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
	Deepak Gupta <debug@rivosinc.com>,
	Charlie Jenkins <charlie@rivosinc.com>,
	Atish Patra <atishp@rivosinc.com>
Subject: [PATCH v8 04/14] riscv: sbi: add FWFT extension interface
Date: Fri, 23 May 2025 12:19:21 +0200
Message-ID: <20250523101932.1594077-5-cleger@rivosinc.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250523101932.1594077-1-cleger@rivosinc.com>
References: <20250523101932.1594077-1-cleger@rivosinc.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

This SBI extensions enables supervisor mode to control feature that are
under M-mode control (For instance, Svadu menvcfg ADUE bit, Ssdbltrp
DTE, etc). Add an interface to set local features for a specific cpu
mask as well as for the online cpu mask.

Signed-off-by: Clément Léger <cleger@rivosinc.com>
Reviewed-by: Andrew Jones <ajones@ventanamicro.com>
Reviewed-by: Atish Patra <atishp@rivosinc.com>
---
 arch/riscv/include/asm/sbi.h | 17 +++++++++++
 arch/riscv/kernel/sbi.c      | 57 ++++++++++++++++++++++++++++++++++++
 2 files changed, 74 insertions(+)

diff --git a/arch/riscv/include/asm/sbi.h b/arch/riscv/include/asm/sbi.h
index 0938f2a8d01b..341e74238aa0 100644
--- a/arch/riscv/include/asm/sbi.h
+++ b/arch/riscv/include/asm/sbi.h
@@ -503,6 +503,23 @@ int sbi_remote_hfence_vvma_asid(const struct cpumask *cpu_mask,
 				unsigned long asid);
 long sbi_probe_extension(int ext);
 
+int sbi_fwft_set(u32 feature, unsigned long value, unsigned long flags);
+int sbi_fwft_set_cpumask(const cpumask_t *mask, u32 feature,
+			 unsigned long value, unsigned long flags);
+/**
+ * sbi_fwft_set_online_cpus() - Set a feature on all online cpus
+ * @feature: The feature to be set
+ * @value: The feature value to be set
+ * @flags: FWFT feature set flags
+ *
+ * Return: 0 on success, appropriate linux error code otherwise.
+ */
+static inline int sbi_fwft_set_online_cpus(u32 feature, unsigned long value,
+					   unsigned long flags)
+{
+	return sbi_fwft_set_cpumask(cpu_online_mask, feature, value, flags);
+}
+
 /* Check if current SBI specification version is 0.1 or not */
 static inline int sbi_spec_is_0_1(void)
 {
diff --git a/arch/riscv/kernel/sbi.c b/arch/riscv/kernel/sbi.c
index 1d44c35305a9..818efafdc8e9 100644
--- a/arch/riscv/kernel/sbi.c
+++ b/arch/riscv/kernel/sbi.c
@@ -299,6 +299,63 @@ static int __sbi_rfence_v02(int fid, const struct cpumask *cpu_mask,
 	return 0;
 }
 
+struct fwft_set_req {
+	u32 feature;
+	unsigned long value;
+	unsigned long flags;
+	atomic_t error;
+};
+
+static void cpu_sbi_fwft_set(void *arg)
+{
+	struct fwft_set_req *req = arg;
+	int ret;
+
+	ret = sbi_fwft_set(req->feature, req->value, req->flags);
+	if (ret)
+		atomic_set(&req->error, ret);
+}
+
+/**
+ * sbi_fwft_set() - Set a feature on the local hart
+ * @feature: The feature ID to be set
+ * @value: The feature value to be set
+ * @flags: FWFT feature set flags
+ *
+ * Return: 0 on success, appropriate linux error code otherwise.
+ */
+int sbi_fwft_set(u32 feature, unsigned long value, unsigned long flags)
+{
+	return -EOPNOTSUPP;
+}
+
+/**
+ * sbi_fwft_set_cpumask() - Set a feature for the specified cpumask
+ * @mask: CPU mask of cpus that need the feature to be set
+ * @feature: The feature ID to be set
+ * @value: The feature value to be set
+ * @flags: FWFT feature set flags
+ *
+ * Return: 0 on success, appropriate linux error code otherwise.
+ */
+int sbi_fwft_set_cpumask(const cpumask_t *mask, u32 feature,
+			       unsigned long value, unsigned long flags)
+{
+	struct fwft_set_req req = {
+		.feature = feature,
+		.value = value,
+		.flags = flags,
+		.error = ATOMIC_INIT(0),
+	};
+
+	if (feature & SBI_FWFT_GLOBAL_FEATURE_BIT)
+		return -EINVAL;
+
+	on_each_cpu_mask(mask, cpu_sbi_fwft_set, &req, 1);
+
+	return atomic_read(&req.error);
+}
+
 /**
  * sbi_set_timer() - Program the timer for next timer event.
  * @stime_value: The value after which next timer event should fire.
-- 
2.49.0


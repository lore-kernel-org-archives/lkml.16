Received: from mail-pf1-f177.google.com (mail-pf1-f177.google.com [209.85.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 63E0B29712E
	for <linux-kernel@vger.kernel.org>; Thu, 15 May 2025 09:44:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747302253; cv=none; b=q2VA53p3/f/Kz87JGVgxubPjJhDue/ezcrQ+Ocy7+cqOC1wtssjmBHBfdnlff6a4zLKKL7HfDxUVj6eReoxpXkhYNPpqrr/MMIP4GQHxNn05hJXrRGnQETdsh1dqXBTACuU1qZL5yQW3a6r5Aqv0ngOKOlqSOj82LFVsIUbEzCI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747302253; c=relaxed/simple;
	bh=9GNL33PY49lW6OGb3bRrDrd7fcNA7Gh2hmvPnbryDDo=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=F9XeRi/cvYlY/zUccVX4Od/7QIvUFZq5N6l/00AS7zSKyojoM/c8cloZQFIexpK5S0AhsNmK5gULalYGciK/6YGldydYvzuZ8XOM1GKoVesGLG0Rynjj8jZNLkthBOg/ESjHr8f2nbxsHMF3yqGRysL1Ghldy1DyCjwabutxq8g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com; spf=pass smtp.mailfrom=bytedance.com; dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.b=ABhYLL+G; arc=none smtp.client-ip=209.85.210.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bytedance.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.b="ABhYLL+G"
Received: by mail-pf1-f177.google.com with SMTP id d2e1a72fcca58-74264d1832eso925877b3a.0
        for <linux-kernel@vger.kernel.org>; Thu, 15 May 2025 02:44:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1747302250; x=1747907050; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=n6FV+5tXVPlvC+Cy3Z2x3GFn7teypKn9hvM6n9ipgsE=;
        b=ABhYLL+GiGq2PR/nvcerzw3z+vmBmjVmML2EpWI6MTHr1Xqcuhmi60fRJHcKDkj1PV
         qT29CUH5ygb2imSZhRymqeZXqz2c1aH3SIsW/RSxmqn7Qjt3dWpMmhWuu1IC1UYfQ/RN
         SdSL0/YQPKftP6VJP//nGSVQx9D3/vMOEd4ndinGtw09awh8VoZ4lqLWA7mGpM0XyV2Z
         QP7/+HZedidil0mIQftTyGxOQ6/QvBCVeVi6i+HfzwYq0CqX6x/uLqMk255keT+dADT6
         grGkG1BPwiXbME7IMkREBwYe93FjEEqwZDTKrnZotL+lS9qjonmDQPQYy9aknIKq7Tu1
         Mh6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747302250; x=1747907050;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=n6FV+5tXVPlvC+Cy3Z2x3GFn7teypKn9hvM6n9ipgsE=;
        b=MKdccb51cvnBbUyaQHiqoelPIdJNRZt7KzE3H+qzik+OUXjpvDda+Xne6Znoxma257
         PEvjrkUG2ybnvaLFtccABDW22pUGZQYucQMyS6BZeyP3Ea5EFXIIi7xxAi6Obq2PWzM+
         71y5M5mLsWRRMVReHA977fNvWjO2/SgsaYZ5bD2BhoyvjWXuU1TmqGsTIQaTrvt/d2Gp
         pEp87vYVs/cvDoJXMK0iGLboxTdNg44uS/SCpVRD8A8p4h7HagWPY771/JfzGrtDShRj
         pYr8SEi9HuHms0T3570ywK98QTvus58Aeax90xjoCb6/VV55UrXzk6i1lSiHC3p5IEEW
         rdGA==
X-Forwarded-Encrypted: i=1; AJvYcCX2uZpxkFQ2H+FN5lz+EkerbSku1gtYEEdTzCVhFPTZt4kBy1vjuJaUKM3Die+Y9GqC6MteC3/YABZuGMY=@vger.kernel.org
X-Gm-Message-State: AOJu0YxZkLgqML1OHKq9XkmR12uiJU+wg8rSJuI3zZvVD65RQBecVG26
	BvZ4/L7jVXRGuzKbQ7/LtjjvRaJmEdRZ+LzRM5P3+iEonzxNppaThM6E+iXpkzw=
X-Gm-Gg: ASbGnctXbHg/ASlVoGrx3DCBAJ6ZU4S5MtFYP7+bGvxTWJB9DwnclM1yr0MeoXv7/hf
	nKukJWCtYaZPokV2guwh6cXQMvYCdUGul+8UFdMIvWVSivrh9GNGAclu+r22PKbIqZHPCQunaPS
	+Lx23npecfTtgsoXcvTfoZ2NcF9j1lf2FwV+760q/PFg67id5yURHrDIMJvRzl7bXqNHpro+ufh
	nV0uKu+XYX00ASw0K3hZrWUHVnW2xKiRG+WCy21QTCWHXtK/ANZH99TKXd3mj4nJi4RnAqI8lpn
	f/5RYZfi970EYWBQKb1UEfwp/1QUtcGMYSEEJxZWmrJWF3FjZ0nrz5FRr27iGPr7BNJIxsW+/qN
	vOJuInqhrZCo1FFgm
X-Google-Smtp-Source: AGHT+IEh2dxMPj7kTH/MLpVyfxHPA3w9CgIogon2Q5H7XcXm3dZOwAfa/YfCslxFD2QlnH7LR4V86w==
X-Received: by 2002:a05:6a20:559c:b0:216:1476:f6c with SMTP id adf61e73a8af0-21614761195mr1115182637.13.1747302250378;
        Thu, 15 May 2025 02:44:10 -0700 (PDT)
Received: from L6YN4KR4K9.bytedance.net ([61.213.176.9])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b234941b886sm10299693a12.2.2025.05.15.02.44.07
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Thu, 15 May 2025 02:44:10 -0700 (PDT)
From: Yunhui Cui <cuiyunhui@bytedance.com>
To: sunilvl@ventanamicro.com,
	rafael@kernel.org,
	lenb@kernel.org,
	paul.walmsley@sifive.com,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu,
	alex@ghiti.fr,
	linux-acpi@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org
Cc: Yunhui Cui <cuiyunhui@bytedance.com>
Subject: [PATCH] ACPI: RISC-V: CPPC: Add CSR_CYCLE for CPPC FFH
Date: Thu, 15 May 2025 17:43:01 +0800
Message-Id: <20250515094301.40016-1-cuiyunhui@bytedance.com>
X-Mailer: git-send-email 2.39.2 (Apple Git-143)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add the read of CSR_CYCLE to cppc_ffh_csr_read() to fix the
warning message: "CPPC Cpufreq: cppc_scale_freq_wokrfn: failed
to read perf counters".

Signed-off-by: Yunhui Cui <cuiyunhui@bytedance.com>
---
 drivers/acpi/riscv/cppc.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/drivers/acpi/riscv/cppc.c b/drivers/acpi/riscv/cppc.c
index 4cdff387deff6..c1acaeb18eac3 100644
--- a/drivers/acpi/riscv/cppc.c
+++ b/drivers/acpi/riscv/cppc.c
@@ -69,11 +69,14 @@ static void cppc_ffh_csr_read(void *read_data)
 	struct sbi_cppc_data *data = (struct sbi_cppc_data *)read_data;
 
 	switch (data->reg) {
-	/* Support only TIME CSR for now */
 	case CSR_TIME:
 		data->ret.value = csr_read(CSR_TIME);
 		data->ret.error = 0;
 		break;
+	case CSR_CYCLE:
+		data->ret.value = csr_read(CSR_CYCLE);
+		data->ret.error = 0;
+		break;
 	default:
 		data->ret.error = -EINVAL;
 		break;
-- 
2.39.2


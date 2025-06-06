Received: from mail-pf1-f174.google.com (mail-pf1-f174.google.com [209.85.210.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F1B8021CC7D
	for <linux-kernel@vger.kernel.org>; Fri,  6 Jun 2025 20:27:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749241666; cv=none; b=TxZ6zaGmJgULR6Xj6p1wVY0zvARuHnCN2D3MaO9rW9pQ4F7Pkc21VEuYBJKG8NlO2z63cbS8h8EOyqBdpMtr3PTQ6ABqNpMFmGXdKdIEswLqF5xb9Ce/ZJAPXn3M50cDSzG/H2wlgxYPl6cul6NbnbYm6dVLty0ecvAbN8xYOf0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749241666; c=relaxed/simple;
	bh=imuK2T8drX+ZLlrEtBHjX3bcu+iaFBiL6jam/tfVMAA=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=nmnhgm3z+InUkIJg5FxrG43WK3Saiyr0khVAdfW/P++AhdtjuXI9fuCvvZtWR7LtY9UDAaqRLYnteAuRQB9JxIzv29EboS3E0liJfiP7c4B+6Tkl/sdCD4pLVwAMpEpCsxuXGjjcjvcolvFNi7ls/1XYQNyGBj67d1dyUH1LNHs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=hynTcdAT; arc=none smtp.client-ip=209.85.210.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="hynTcdAT"
Received: by mail-pf1-f174.google.com with SMTP id d2e1a72fcca58-7426c44e014so2238361b3a.3
        for <linux-kernel@vger.kernel.org>; Fri, 06 Jun 2025 13:27:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1749241664; x=1749846464; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=N7UVaCS12Xf6Wz8HX/a2PTgWqADCA4GJZ/2LGMJLYoE=;
        b=hynTcdATjDTZQznW5g+ehO2HQS0Ky5y5DC+CidUDvz71YHkR1a6I7HswOtku34wfss
         bAA7k6biIdoON2xtp/EAqb3WvZWVP2YucAwpo0pUjVr8I9r5VdkhgeqqX0dE1oHEvm19
         bsqPP3nekJvi6ZP9joCUPZ0UJxODXIdKgM47Rc3KSALeDZAqz8ICzCNGI7gb8H3hNGDg
         AixiDkNhZgPwi4mgARPXJxvRnWBhaWEg3LGqUSs61q4Wl993XYa5a4YL/CI6Q+BMZKSE
         2VPSEwhMDIBfggdztO//sAcz0j3R9n2nv+F0dCoH/Fg2bkBWHJvrw3oAUMN8QO8wN+xE
         WlEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749241664; x=1749846464;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=N7UVaCS12Xf6Wz8HX/a2PTgWqADCA4GJZ/2LGMJLYoE=;
        b=B2BTtQWqyYhJPDgKxQwu4qsgB0FYGEXk+RXM8gxhslkMeb3RhmsxaKwTu454yKpAhz
         vvbhUqeQ+ri4VL7cpJJqHKkImzG+EuLlZNCNsmBMQpwhRUiW12qG18ur9Zd6dOl2fpPP
         VKwBkLNzkeAc4wkbsAL6llpanCLvrfidsYOU3FiknXEiF39qW2NhOnOl+UBG0tEL9BkI
         LUcBi0IYOHFxnIkVZ+9IDqWePzxYXJA8941HEIyurG6UHgw4UqnLGyip5VAIv3OGAb0K
         juWOhtaWsE1dTsWK9HK1Y6dOirUpzeljMtr+RY2r2+Hl7RmVVRjvJqhOodoL99hVcK1V
         4vXw==
X-Forwarded-Encrypted: i=1; AJvYcCVA1D9n70nMm51LdKGfc1Bd8/lhB9fzvvrYWYmE/ml1I8oTPXenDn3wgd4K8zLVMd3x6wSS3aC3i1eEXNU=@vger.kernel.org
X-Gm-Message-State: AOJu0YysaGSz6qaY7Ox71KRAVyHJCTLDqjGK8WmpSfLeu5/blJyaxooc
	rFgDwtPYUr201x65cvnD4CM0ZvLPrBe1Icoq7HtgH12DHetgJUwiamsI
X-Gm-Gg: ASbGncuilrqy2x25K53IJIlm+rAxJcs48P2mnHpiOW7dsqin6D7MY/O+j15DlC7od3x
	KYNXCG0wqBl0YPPCKb8sWnligoDq+IoOKH5Ig27iMlXiAqusrPLKs8BmtoBsmnyuAL1Kd+0feRW
	w3Pm0QA9qwvcYr+/NTH7axx19qzlDzZ1c5k6XbzIkEI5a2vE8rNl1fIfjgE6/r67Nb7xWGZ2jaq
	crPrC4aBmzkqGjYij+8kcgGrrypR7RMjWsNjg1HOZHIxwsrveaVcEH3hNRROhyT9X+LmhG6xrZV
	jQFP0jociTXvum1HTPxVfymcWVfEH08GynvuW7xxrvL8bdLutYkBFsc/QHG2nA==
X-Google-Smtp-Source: AGHT+IF5fgvUogrWQAOgI5ismWWURFnFZHwy7H4dYKsH+jMRP7wpoiSIgYyWxU6LgGdYb21++M09OQ==
X-Received: by 2002:a05:6a00:194d:b0:740:b394:3ebd with SMTP id d2e1a72fcca58-74827e7faa7mr6654698b3a.7.1749241664288;
        Fri, 06 Jun 2025 13:27:44 -0700 (PDT)
Received: from localhost ([216.228.127.129])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7482b0847e9sm1673002b3a.87.2025.06.06.13.27.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Jun 2025 13:27:43 -0700 (PDT)
From: Yury Norov <yury.norov@gmail.com>
To: "Paul E. McKenney" <paulmck@kernel.org>,
	Neeraj Upadhyay <neeraj.upadhyay@kernel.org>,
	"Yury Norov [NVIDIA]" <yury.norov@gmail.com>,
	Thomas Gleixner <tglx@linutronix.de>,
	Thorsten Blum <thorsten.blum@linux.dev>,
	Zqiang <qiang.zhang1211@gmail.com>,
	Mathieu Desnoyers <mathieu.desnoyers@efficios.com>,
	linux-kernel@vger.kernel.org
Subject: [PATCH 3/4] smp: Don't wait until remote work done if not needed in smp_call_function_many_cond()
Date: Fri,  6 Jun 2025 16:27:30 -0400
Message-ID: <20250606202732.426551-4-yury.norov@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250606202732.426551-1-yury.norov@gmail.com>
References: <20250606202732.426551-1-yury.norov@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: "Yury Norov [NVIDIA]" <yury.norov@gmail.com>

If we don't actually send any IPIs, there's no need to wait for a job
completion.

Signed-off-by: Yury Norov [NVIDIA] <yury.norov@gmail.com>
---
 kernel/smp.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/kernel/smp.c b/kernel/smp.c
index 5871acf3cd45..715190669e94 100644
--- a/kernel/smp.c
+++ b/kernel/smp.c
@@ -849,6 +849,8 @@ static void smp_call_function_many_cond(const struct cpumask *mask,
 			send_call_function_single_ipi(last_cpu);
 		else if (likely(nr_cpus > 1))
 			send_call_function_ipi_mask(cfd->cpumask_ipi);
+		else
+			run_remote = false;
 	}
 
 	if (run_local) {
-- 
2.43.0


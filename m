Received: from mail-pf1-f171.google.com (mail-pf1-f171.google.com [209.85.210.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 37D94295502
	for <linux-kernel@vger.kernel.org>; Wed, 11 Jun 2025 13:54:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749650071; cv=none; b=mVui5aFx6RcczGF4fvwV9kUqBODojLGpUtROu0S2xGi4X6F1BOGfUoSaFX7axyANBBMC7KPZD/hAFupNfXK+BE1yuu2st/Bo41QurEFl//wVfV+MlP69uk3zzVYog/2XGh0fcw+KwYk785s1Ihq4jx9l5u2+6LMBEjvrqxzFySU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749650071; c=relaxed/simple;
	bh=5L1vIHR8TGG/tdz0Ehy1NjsEUUVfaCR5C7HcJeayTmc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=uGisShATYNebSLEF6wz2DNA2f/MCBKxA7iUhqdhc+2Xw+DBX+/8LPZMaMUbgx6qUQ4I6dyFDiX27UphjRuC0xPcZKuceIola9MF+aKHEmfzEMJDiceS/62Z7t5BvyS3r49qhhwtEK4h7iYgCT+3z8ox3tMn2cRyv3yyUC6TeVv4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=SrfToam1; arc=none smtp.client-ip=209.85.210.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="SrfToam1"
Received: by mail-pf1-f171.google.com with SMTP id d2e1a72fcca58-747e41d5469so7094360b3a.3
        for <linux-kernel@vger.kernel.org>; Wed, 11 Jun 2025 06:54:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1749650069; x=1750254869; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bkbrVc9Ysm1N35GkO2QgZpIQc5HrqYsMOh3qst28mJA=;
        b=SrfToam17q14Ottil4xiEQkF+byMGpf4HnIhY+vrD3LyAf1qZtZRl389mBT39m4Ayp
         Uz0utTRLqQYCG2APSUsw9hSfyfa4H/EpExDtq3uFLJb4Wi7Xee1wh1+Xq0oXrZEOW2UT
         9wlLeGN/FEbB+s3zA/iFX1+o6ZGcabthmRfgsYvysRC7wHu99ggx7jgVuW+H1p/tjWGL
         6c/ThD44cRCsj5z2iVJukFsUBkfOHH6VVYE17CGcp+/XrkNRxX8rxk9ZL2rXAyBXjDni
         WVWHDbPGD+IzLYLdQF9tW5pUezt2TINGtN9lit2peS/Y/c5IB/OLzEmZJHyloUZzLGzg
         jGRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749650069; x=1750254869;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=bkbrVc9Ysm1N35GkO2QgZpIQc5HrqYsMOh3qst28mJA=;
        b=IZtnt79dUZk4b+DIkYdhV7BBeApEOOScPrXXVIlhfYJuAt6uUgp2/MSvK0RbJ4n4zJ
         5cUMkX7skiSz2Xow6knYU6KKrWdjITXVu2+fs2Bu0wePw3eQXdAWpSgeDgo7AxQmzp47
         EoNT7A7Bhuv4BFTe35HTDeiycZ6ca6jSZAm5TLyi6WpEpJ54a+LkBsoiE2yG7c5n37k7
         qYUiwOjj5F5pFRF8Zlk/JW9ATYntthpsRTeXRrdopqg+vjk24P0PfHsPV5VD59ifyc/F
         e8lSTDoVFgTEonaDO0zkcz0jciSGHKwUtHRe0bR3Emr0zylyyhnWP2HIffoDaoBDD4Zc
         vDYg==
X-Gm-Message-State: AOJu0YzolugjZRID+cjVdAly+W1bEfBAU81cXKAvzc1pd2Ssi9BjwRKB
	PluPDwpuoNAoY75S2L/f1zNIzNPGLQfWAh57hMFe8wXJwISwe6xTLq5c7xbJsHKDbT8=
X-Gm-Gg: ASbGncuaB6+hoN/tTsbEDKXA5mIWr11Qn+2dpmvwmNEv/Un3awxKlb+65dUB7GummlJ
	p4Vgqjpml0IQ08AhSA4Z5iuYre25cYJjG2yaby/3S3EQdiXpy6AniM03SKo+xo9GjU7v8FVfC+7
	rSH+PPkbyhiJWXPNbCpyNDHVRrmZpr6FcSmf3fC8nlzruvtAb6dNMgzNTJCICFEUFDFZkt7XPhX
	vT3PsqkztMlIuV7MpdUZ4hnC8S4nwscRaYEEBnRFhVIXpzdkUJ4tqWISObV9tuuUPtfnXjdx04V
	P2zpfwXYGbDpaFAzKAYo5Ohd2S366SOVZwz+dynkm0UXIHkShHDA3d86dAK7JCGAT9ZtpfUxr49
	mEnzfitU2vJte/lXKE2tiIpkLlt9LSrt20opJx1Ij4Q==
X-Google-Smtp-Source: AGHT+IGq5z8uVoBSvKjd2tubxDY0MuW1gNIQ0n/WSZVlIDWZ7YcM/1ugFk08xbBN7SJm/Bp0iT/icg==
X-Received: by 2002:a05:6a20:7f8c:b0:21a:ef2f:100b with SMTP id adf61e73a8af0-21f8671587amr5346540637.24.1749650069127;
        Wed, 11 Jun 2025 06:54:29 -0700 (PDT)
Received: from eric-acer.tail151456.ts.net (36-225-84-3.dynamic-ip.hinet.net. [36.225.84.3])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7482b0ea3cdsm9247523b3a.159.2025.06.11.06.54.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Jun 2025 06:54:28 -0700 (PDT)
From: Cheng-Yang Chou <yphbchou0911@gmail.com>
To: linux-kernel@vger.kernel.org
Cc: tj@kernel.org,
	void@manifault.com,
	arighi@nvidia.com,
	changwoo@igalia.com,
	jserv@ccns.ncku.edu.tw,
	yphbchou0911@gmail.com
Subject: [PATCH 3/4] sched_ext: Clean up and standardize #if/#else/#endif markers in sched/ext_idle.c
Date: Wed, 11 Jun 2025 21:54:03 +0800
Message-ID: <20250611135404.13851-4-yphbchou0911@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250611135404.13851-1-yphbchou0911@gmail.com>
References: <20250611135404.13851-1-yphbchou0911@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Simplify the scheduler by making formerly SMP-only primitives and data
structures unconditional.

Signed-off-by: Cheng-Yang Chou <yphbchou0911@gmail.com>
---
 kernel/sched/ext_idle.c | 25 +------------------------
 1 file changed, 1 insertion(+), 24 deletions(-)

diff --git a/kernel/sched/ext_idle.c b/kernel/sched/ext_idle.c
index 6d29d3cbc670..6d01cfe10875 100644
--- a/kernel/sched/ext_idle.c
+++ b/kernel/sched/ext_idle.c
@@ -17,7 +17,6 @@ static DEFINE_STATIC_KEY_FALSE(scx_builtin_idle_enabled);
 /* Enable/disable per-node idle cpumasks */
 static DEFINE_STATIC_KEY_FALSE(scx_builtin_idle_per_node);
 
-#ifdef CONFIG_SMP
 /* Enable/disable LLC aware optimizations */
 static DEFINE_STATIC_KEY_FALSE(scx_selcpu_topo_llc);
 
@@ -794,7 +793,6 @@ static void reset_idle_masks(struct sched_ext_ops *ops)
 		cpumask_and(idle_cpumask(node)->smt, cpu_online_mask, node_mask);
 	}
 }
-#endif	/* CONFIG_SMP */
 
 void scx_idle_enable(struct sched_ext_ops *ops)
 {
@@ -808,9 +806,7 @@ void scx_idle_enable(struct sched_ext_ops *ops)
 	else
 		static_branch_disable_cpuslocked(&scx_builtin_idle_per_node);
 
-#ifdef CONFIG_SMP
 	reset_idle_masks(ops);
-#endif
 }
 
 void scx_idle_disable(void)
@@ -896,7 +892,6 @@ s32 select_cpu_from_kfunc(struct task_struct *p, s32 prev_cpu, u64 wake_flags,
 	if (!rq)
 		lockdep_assert_held(&p->pi_lock);
 
-#ifdef CONFIG_SMP
 	/*
 	 * This may also be called from ops.enqueue(), so we need to handle
 	 * per-CPU tasks as well. For these tasks, we can skip all idle CPU
@@ -913,9 +908,7 @@ s32 select_cpu_from_kfunc(struct task_struct *p, s32 prev_cpu, u64 wake_flags,
 		cpu = scx_select_cpu_dfl(p, prev_cpu, wake_flags,
 					 allowed ?: p->cpus_ptr, flags);
 	}
-#else
-	cpu = -EBUSY;
-#endif
+
 	if (scx_kf_allowed_if_unlocked())
 		task_rq_unlock(rq, p, &rf);
 
@@ -1010,11 +1003,7 @@ __bpf_kfunc const struct cpumask *scx_bpf_get_idle_cpumask_node(int node)
 	if (node < 0)
 		return cpu_none_mask;
 
-#ifdef CONFIG_SMP
 	return idle_cpumask(node)->cpu;
-#else
-	return cpu_none_mask;
-#endif
 }
 
 /**
@@ -1034,11 +1023,7 @@ __bpf_kfunc const struct cpumask *scx_bpf_get_idle_cpumask(void)
 	if (!check_builtin_idle_enabled())
 		return cpu_none_mask;
 
-#ifdef CONFIG_SMP
 	return idle_cpumask(NUMA_NO_NODE)->cpu;
-#else
-	return cpu_none_mask;
-#endif
 }
 
 /**
@@ -1057,14 +1042,10 @@ __bpf_kfunc const struct cpumask *scx_bpf_get_idle_smtmask_node(int node)
 	if (node < 0)
 		return cpu_none_mask;
 
-#ifdef CONFIG_SMP
 	if (sched_smt_active())
 		return idle_cpumask(node)->smt;
 	else
 		return idle_cpumask(node)->cpu;
-#else
-	return cpu_none_mask;
-#endif
 }
 
 /**
@@ -1085,14 +1066,10 @@ __bpf_kfunc const struct cpumask *scx_bpf_get_idle_smtmask(void)
 	if (!check_builtin_idle_enabled())
 		return cpu_none_mask;
 
-#ifdef CONFIG_SMP
 	if (sched_smt_active())
 		return idle_cpumask(NUMA_NO_NODE)->smt;
 	else
 		return idle_cpumask(NUMA_NO_NODE)->cpu;
-#else
-	return cpu_none_mask;
-#endif
 }
 
 /**
-- 
2.43.0


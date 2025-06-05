Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3EE3C207A18
	for <linux-kernel@vger.kernel.org>; Thu,  5 Jun 2025 07:14:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749107673; cv=none; b=uUIEK7JR6hnFb8vf2Vjbi/Wj5g5ObI3B3bmdiuY0jjOLwkitdTVLPx8rsuVOn1RDbBLgVVFal0ffZxxM8PKqu2bt6YYEPCgxhForfd6GoGD2nhJ/V7UIL13RkSZGNKPcQKA1KROGiKpIqWm06UInVQaoBssPfWZNiYPIr2gX5a4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749107673; c=relaxed/simple;
	bh=jbp15bWLpp9sT0GFj9cr7VfzaeOBTsXq09F5x17dSkg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Jjr2FxlNOvosvtK05MLXBP52U+REVH4kIuAVXufeL0sa2TCTkAUE+VT0y+jquol4jhtlV3lD4Fq4EblDFXi3HnRx+gY7vAeTpNhCPqP3svRRhIlW4bs1e8o74cy4q6nhlsuptmTGFKZCfzMBjR1ZBL0zO/vajIXOnsXhCmOO78w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=LKagQt6i; arc=none smtp.client-ip=209.85.221.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="LKagQt6i"
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-3a510432236so494678f8f.0
        for <linux-kernel@vger.kernel.org>; Thu, 05 Jun 2025 00:14:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1749107670; x=1749712470; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jVE56mb1hZ5CiRyJyad1+1WeIf3NNpyTOYbe0lP1OI4=;
        b=LKagQt6iYVedfWCxz3cFKUd16DM8fVw7kXtcu5U29ML94PVtNl5x7JB37eACJO+piA
         pJb6GhKHTu+nuqGvyK4fNdmcOE3igcS/e9efIxRgUvP3lkI0NKYU/WVb9+WriV7O54vL
         h7CcUFCWeauHQU4p314xYKtT7+0l8iv7XcivbMpTybgvGPbnUKT1NIVgtNU+yRtdwUFs
         Cfg+lPVXVlwTjP7mQNHwW2DFb9UqG60VBUKCqN70ZYpB6Rb7iNlAcfe+TfalI0mrR+mj
         OZS26QK5Wc7O1aYW05B0g7uzQuODEO9MEwXf49tYLBtuWWXN+pDMOUNN4XcmjWMZr/aB
         w5mA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749107670; x=1749712470;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=jVE56mb1hZ5CiRyJyad1+1WeIf3NNpyTOYbe0lP1OI4=;
        b=qC4X5u4qTSStWxQi5E2lwFIllEEYAz77nHlCFsfXXx2KE6WWyOfN/CVzK+QlTCXa/t
         MqQxdEVZd2uL/fLbmyNoRep/jk2TiF27xhw1Y96L3GgrusGbet5fEvMQtHtrNoXioSJp
         Bd9KyhtJgx65lI2p5Cy1TarS2tWqTrntaKYhdESJ3nfQ1Cyp7ygYph81cZWu/wS2L4ge
         fuN+DvmnW+V4zFM8lu31nYzX3y5bw/wtqhe04bTS85ziJ6DQ+CuKhtIh3cOf8o2KQxP3
         MzolLhvbgJSDFKHPYqowe9vwtPFppeX8LMo3nQ+wA72bDK/ZqRbaQwYiBT6D/NF2n5D5
         bA8w==
X-Gm-Message-State: AOJu0YyfcccGj3qWnWDnA//DSnUafKI3Mgricb69v3W5Qdf6v/FYBpMR
	7CcQV2K6Xp+imbxWjZyrdJOBUJRm84Asf7nLAUjT/1EdKaE/jf0UNGuh
X-Gm-Gg: ASbGncv3H0n0Esx4atujt4AT+VXLPj0R3FX6eDBIXe9T1fb8Gy9ad0w1bH5tyTZF+wa
	k12XXIKH+S/iw5in3H8CJ65MVOybPhCR8aRUDDTWnlM9arvjbnUS3wiEf5wXZWMJiIf5tUYQI4A
	AmPg1NJCbHNTRrZ1uLJEDb9pAOj1hZ65ON2ZEOj3ceRLSz9Hl1fd8q1DmlJ8knPKBgu3klltgVn
	E0RoLf3QO5rNnu6QxOSiMf5mAG/JB0HR5jK8pBdCRQP3t+0q5Ghp1nc7HQe3uZ+xXNuZXsIQk3A
	T16M9/+LBi3HIu3+fLDYvmWDl7v38xun2EsUubX2x7FHJMA+sP2X5msvP0DEDJTw
X-Google-Smtp-Source: AGHT+IEWYvSmAqefWRXcp7O40fgU9BhBsFjJ8qljeS80ykzX1zt6L0sTHDa4psnsHlWF1uTrvsk/5Q==
X-Received: by 2002:a05:6000:290d:b0:39c:1f02:5409 with SMTP id ffacd0b85a97d-3a51d8ef864mr4259853f8f.9.1749107670306;
        Thu, 05 Jun 2025 00:14:30 -0700 (PDT)
Received: from localhost.localdomain ([78.210.56.234])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a4f00972b5sm23885431f8f.76.2025.06.05.00.14.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Jun 2025 00:14:30 -0700 (PDT)
From: Yuri Andriaccio <yurand2000@gmail.com>
To: Ingo Molnar <mingo@redhat.com>,
	Peter Zijlstra <peterz@infradead.org>,
	Juri Lelli <juri.lelli@redhat.com>,
	Vincent Guittot <vincent.guittot@linaro.org>,
	Dietmar Eggemann <dietmar.eggemann@arm.com>,
	Steven Rostedt <rostedt@goodmis.org>,
	Ben Segall <bsegall@google.com>,
	Mel Gorman <mgorman@suse.de>,
	Valentin Schneider <vschneid@redhat.com>
Cc: linux-kernel@vger.kernel.org,
	Luca Abeni <luca.abeni@santannapisa.it>,
	Yuri Andriaccio <yuri.andriaccio@santannapisa.it>
Subject: [RFC PATCH 7/9] sched/core: Cgroup v2 support
Date: Thu,  5 Jun 2025 09:14:10 +0200
Message-ID: <20250605071412.139240-8-yurand2000@gmail.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250605071412.139240-1-yurand2000@gmail.com>
References: <20250605071412.139240-1-yurand2000@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: luca abeni <luca.abeni@santannapisa.it>

Make rt_runtime_us and rt_period_us virtual files accessible also to the cgroup
v2 controller, effectively enabling the RT_GROUP_SCHED mechanism to cgroups v2.

Signed-off-by: luca abeni <luca.abeni@santannapisa.it>
---
 kernel/sched/core.c | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/kernel/sched/core.c b/kernel/sched/core.c
index e90b3608a..cad2963a2 100644
--- a/kernel/sched/core.c
+++ b/kernel/sched/core.c
@@ -10134,6 +10134,18 @@ static struct cftype cpu_files[] = {
 		.seq_show = cpu_uclamp_max_show,
 		.write = cpu_uclamp_max_write,
 	},
+#endif
+#ifdef CONFIG_RT_GROUP_SCHED
+	{
+		.name = "rt_runtime_us",
+		.read_s64 = cpu_rt_runtime_read,
+		.write_s64 = cpu_rt_runtime_write,
+	},
+	{
+		.name = "rt_period_us",
+		.read_u64 = cpu_rt_period_read_uint,
+		.write_u64 = cpu_rt_period_write_uint,
+	},
 #endif
 	{ }	/* terminate */
 };
-- 
2.49.0


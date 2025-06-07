Received: from mail-pf1-f174.google.com (mail-pf1-f174.google.com [209.85.210.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 761E71C5496
	for <linux-kernel@vger.kernel.org>; Sat,  7 Jun 2025 14:11:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749305475; cv=none; b=UEERlMqq75SglVYaOkiryXK0lEGR/UK642Vy0kPuTVH5WoAltSrGyX7tQtCKNdR0cA/hq9HsbZX2o4pCd6pIFlcRmtBF5y7Y7VlPMGIwxBunA9Z3eXQdWHzeGZD3XqlKVkTJOSFphbMsUb26DubrVCbs6VsX7Wfl0Wv7xasBDGQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749305475; c=relaxed/simple;
	bh=KqkLjU7l3HTqAXMZcl1fvGDhzFY9ILsLlQ6f1OVTAf8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=FSh0DJHMuelkJxpm1xooEXft/aMyNszHnkUFUQHF+9U4RGGwCwXXsFTtO8pym8iomJ49XV44A4a3xNGsvJPdlXSSjzZTxqXBkcaaZsDFXfglBtQLxkeXv2G8AyaUFzjefUTE7X9/wEGp8jCBzver4Bbz8CLNXzWojKi9Y64FrSY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=S9f4xLXJ; arc=none smtp.client-ip=209.85.210.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="S9f4xLXJ"
Received: by mail-pf1-f174.google.com with SMTP id d2e1a72fcca58-7406c6dd2b1so3568280b3a.0
        for <linux-kernel@vger.kernel.org>; Sat, 07 Jun 2025 07:11:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1749305474; x=1749910274; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xEQwf9R8gHhh16PCGTrUgZCWBPOiRUZgQTXP+KLFi8M=;
        b=S9f4xLXJtGOdlPnIpnbyNAT/UxRTX6re/QrpuZRmIvyltIYXudixJ95xkCKE3QRL37
         37WXS7fPDkJMfVF2PcB6m3ccJ+NYk2Xx3R44UJltHRGKhPBaxigb5qAhxTscjZWCuvCz
         G+9RHdjc8RM7mcFrDgYRKCAfxGJN+4cT+fBKn+N8CPjF3Q0JsvNFxctSPYvvwWaX2Awx
         /4C8atjO0aHjkUUYpA2s8tSLZOIt1WcvF7jRQnThf3JqEqL7GRZlM1DHZMpy06MaacR4
         eI8MGK7Lo9hZDp607tzxSqvuu1DNTSwHekYBFe2IezuZ/hhtcCxMEI5NzDNQZW/4D43M
         2Gkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749305474; x=1749910274;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=xEQwf9R8gHhh16PCGTrUgZCWBPOiRUZgQTXP+KLFi8M=;
        b=m7swFtOaYcWyOLWLFfiGCg9Bu6eteTan4PzoUo7Eti4bXzw0cboBe/bDyeFuf8tkBM
         95E4a6TwKdQLMYQH2+iA1lW/itG89+Glb5RLpr2PLi1c+RWqqXDqdOpje1vvghG/Wta2
         mJCn7zjRxDEFlr6gz4kpPjItsoV6kxqz79DhnVqQCfZXjX3Ed5tKjUSmFrLzB0gA8soj
         XfOP0JAiPJBuRjl+xD4tZM/9fqSIjPuBuSLZit8Dq76sAYxXXmDVWDuJKuydft1LQyY+
         Jf3IRrrTyScuyZ5BrVSDoRw3dI+kr1qFOSm1O30ryW6YxyyrN5W9QOocR5jLAeci1dyb
         DB8A==
X-Gm-Message-State: AOJu0Yylzz4zdhAMY9oGdb5/x4CnDWG6yISHC53tiLKIOZZAkt1zMleg
	AvnKNgvduRc/pb8KFKqH/OekHvkEIM0YIaclUbKXLzYEX3t9VX5gvmocbNytZg==
X-Gm-Gg: ASbGnct+0cxKdWrESOCuVMfI9rvvLCUu1EzdZ+znHRjERk6r9/9mg6hfLoaFPjKFAkI
	yn8VwFwhcQF7AR7ePOF0qarGkOPxlTirZRNnVW81X4DW9GyQeESdYRNiG/ZVaMdnug6VyhC0qeo
	sbuAUUOI5EmtVUTnMtBuoz/eWvBKECW+qraw9VYmMik1KF4k7Fzjxnm8lbEHDStvOiuxZvjD3is
	cXUyQEFZFQYQKDv1SZbrpo5I4DY5PVBan0Is7Ue/5IQQQrnFXARVhqEZNynoqSfN1nCn6Rmre+J
	Sn1YbUHEb3zPVXjveh1jZQrwMWPOfJYd5NaddADPfcVoV0V0ZPi2bo3/t1jrzA==
X-Google-Smtp-Source: AGHT+IFbvAOC8KUp3OmgoKSfQ/4dJRw36lT87OdSm5FVJgh45DxC1n0q8r1p2Das9fMpvjSYAd2J4g==
X-Received: by 2002:a05:6a20:5493:b0:1f5:8cf7:de4b with SMTP id adf61e73a8af0-21ee2647b57mr9092140637.16.1749305473647;
        Sat, 07 Jun 2025 07:11:13 -0700 (PDT)
Received: from localhost ([216.228.127.129])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7482af7afdasm2875481b3a.51.2025.06.07.07.11.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 07 Jun 2025 07:11:13 -0700 (PDT)
From: Yury Norov <yury.norov@gmail.com>
To: linux-kernel@vger.kernel.org,
	John Stultz <jstultz@google.com>,
	Thomas Gleixner <tglx@linutronix.de>,
	Stephen Boyd <sboyd@kernel.org>
Cc: "Yury Norov [NVIDIA]" <yury.norov@gmail.com>
Subject: [PATCH 1/2] clocksource: Fix opencoded cpumask_any_but() in clocksource_verify_choose_cpus()
Date: Sat,  7 Jun 2025 10:11:04 -0400
Message-ID: <20250607141106.563924-2-yury.norov@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250607141106.563924-1-yury.norov@gmail.com>
References: <20250607141106.563924-1-yury.norov@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: "Yury Norov [NVIDIA]" <yury.norov@gmail.com>

cpumask_any_but() is more verbose than cpumask_first() followed by
cpumask_next(). Use it in clocksource_verify_choose_cpus().

Acked-by: John Stultz <jstultz@google.com>
Signed-off-by: "Yury Norov [NVIDIA]" <yury.norov@gmail.com>
---
 kernel/time/clocksource.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/kernel/time/clocksource.c b/kernel/time/clocksource.c
index 6a8bc7da9062..a2f2e9f4d37b 100644
--- a/kernel/time/clocksource.c
+++ b/kernel/time/clocksource.c
@@ -323,9 +323,7 @@ static void clocksource_verify_choose_cpus(void)
 		return;
 
 	/* Make sure to select at least one CPU other than the current CPU. */
-	cpu = cpumask_first(cpu_online_mask);
-	if (cpu == smp_processor_id())
-		cpu = cpumask_next(cpu, cpu_online_mask);
+	cpu = cpumask_any_but(cpu_online_mask, smp_processor_id());
 	if (WARN_ON_ONCE(cpu >= nr_cpu_ids))
 		return;
 	cpumask_set_cpu(cpu, &cpus_chosen);
-- 
2.43.0


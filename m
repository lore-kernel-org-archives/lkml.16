Received: from mail-pf1-f178.google.com (mail-pf1-f178.google.com [209.85.210.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B22782797AF
	for <linux-kernel@vger.kernel.org>; Tue, 10 Jun 2025 07:57:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749542241; cv=none; b=GlvWjQ/aZNIeLvLfCudXuBZ/H/qvSdldZ2Kq5JxB7+2TPCjhnVtla/fjrcHS09qnOwL2+9/VrFYtuuLgfqKAsrV/m0hQ0rFh/hBmdSlnRAexPGcJwGDSVraA59NIC2shEZ2qUqsZDvk+wzIX5v6BnrAsHTEwV8+TkUaauQtT8jY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749542241; c=relaxed/simple;
	bh=kZBrvPj167WOzb8MQki0NEhPkn+JbbZK90abYWGg5dM=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=gE1iDpVUsbl8ziItCFGSZKvaB39ymcto98hlmNiCZb0X6lAUWLCcFadMhuslz+VjDKkF8OPwzc5UQqRagxkIwW7qjJeoerw3FTLGAy3vaYDdZhR44i1okKLXJ+5wUfhQid88nhE/dvJamraix5YW5YdLZIsC4Ota3buh352Z0Z8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=EfsW1c9i; arc=none smtp.client-ip=209.85.210.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="EfsW1c9i"
Received: by mail-pf1-f178.google.com with SMTP id d2e1a72fcca58-747e41d5469so5630496b3a.3
        for <linux-kernel@vger.kernel.org>; Tue, 10 Jun 2025 00:57:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1749542238; x=1750147038; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=v701JTLhe+HIXnFVYLAylWorrP/855Ox/UyXNHWOfHo=;
        b=EfsW1c9iggdKYMNYgDjS+Jdpdwn0XE/umoVMw58GGU+dabV/x745J4/p9xKKY0KE+L
         URISN1Zqj6ZxJXcLXvwZHidMMm+KvgY45CQEwlR9bD69xYO7chaGbJer+AwYacYKk2SQ
         0sSIwSbpPd8A8sFZ2JCA1Tx6c7Yp0WJZRMufaQvCMOyaw1Sf2Mc3J6P7U3YGcFEgzzDH
         S62jb2fKnmNGWIQrKCawHhuuVm6ILOYMSkEV+sdIEkAnuOK+IGp4QT3oope28aN6euqS
         4efeZY2x9KLOE6dcduXgz2vp/pG2o73cFEjUCMPdBfB9Ab9Lsi455f7RWbLvs3oXxDa4
         EgCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749542238; x=1750147038;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=v701JTLhe+HIXnFVYLAylWorrP/855Ox/UyXNHWOfHo=;
        b=O5ZfYSnTkqKJfzYAzHH3099XkakUaO9XEprKTZk2+gFq8oApsBPGUjOkhIm80sqtml
         G9z5Rzgg5PgxnuNofpfVHHuCVOEOejOv4u76IBc4aGJFrVU6G6E4kdlu3Q7zNPV+AZi5
         HdviB2vbn+3tAyr9UMaSCT65t9IIeSjzdlNiuD+nsDdEZs7gih8r7XOfnrmJLg8lAjy/
         v8TqkPaT8+ebzV+w60fju5kOenYPLI/aMj2GbxUutcSYuSj258yXAIQNmRRVoZ1H4cim
         IXc0vIzoIwz/E4iI6QJAs4+RuzIepDC9imt9KKBiPG2KWMgz2KvCC91pFOJgdYVrlqGm
         cIig==
X-Gm-Message-State: AOJu0YxeUtkspiWgtizziPKLcjbGwJLxvAiHNxBCJNdVN4fi2svMNaz8
	AYH1fb/oade7vPbhCSBMPbx/B5CPGT72Wm7YtYAXf67oyQjkx1dqNrTko9M6hTwUZ3/szmTWvIL
	nH2LP
X-Gm-Gg: ASbGncunNGYH24q+fm+fQ1MyvcYPZT3b83apuAKcWBMRbyYwXo4SLszdvcd3/TERe3+
	U7dByDhHaLGExvZeDHSvHjZJXJ0ZWteSLELC5+YuAM8S9i/RXE2AjdTijlSQwYHRCVVLUVubVRG
	N6deyelRIVrj/D/PMM/MMyFuRWVAdq8wKvNvnmKh8rdF17X0OJWjfD3x6p45dksneqVe32cTLXS
	lTo8GAUmWxAa2QTIaXYPvMTrWIF2710eiRxkNq2WItz7QgTLjS3POP/9WDmHVXffcrfZYL2y+bC
	j6PrnTN80+oSP7QNkhUWYBaTGY3TsbmXZZc3gHhdvmYLtuTjLoGKjQ0F4RwMh7o=
X-Google-Smtp-Source: AGHT+IFXCv1hBEST/MH498dIZRG+1QKlTKtX10KGv2dyvxZqjQLK5+XBu2z3m11UDIwMZX3eb5ipdA==
X-Received: by 2002:a05:6a00:2e9a:b0:736:35d4:f03f with SMTP id d2e1a72fcca58-74827e7384dmr21300760b3a.6.1749542238005;
        Tue, 10 Jun 2025 00:57:18 -0700 (PDT)
Received: from localhost ([122.172.81.72])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7482af7b477sm7105983b3a.69.2025.06.10.00.57.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Jun 2025 00:57:17 -0700 (PDT)
From: Viresh Kumar <viresh.kumar@linaro.org>
To: linux-kernel@vger.kernel.org
Cc: Viresh Kumar <viresh.kumar@linaro.org>,
	Vincent Guittot <vincent.guittot@linaro.org>,
	Neeraj Upadhyay <neeraj.upadhyay@kernel.org>,
	Thomas Gleixner <tglx@linutronix.de>,
	"Paul E. McKenney" <paulmck@kernel.org>,
	Boqun Feng <boqun.feng@gmail.com>
Subject: [PATCH] smp: Fix typo in comment for raw_smp_processor_id()
Date: Tue, 10 Jun 2025 13:27:13 +0530
Message-Id: <d096779819962c305b85cd12bda41b593e0981aa.1749536622.git.viresh.kumar@linaro.org>
X-Mailer: git-send-email 2.31.1.272.g89b43f80a514
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The comment in `smp.h` incorrectly refers to `raw_processor_id()`
instead of the correct function name `raw_smp_processor_id()`.

Suggested-by: Boqun Feng <boqun.feng@gmail.com>
Signed-off-by: Viresh Kumar <viresh.kumar@linaro.org>
---
 include/linux/smp.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/include/linux/smp.h b/include/linux/smp.h
index f1aa0952e8c3..bea8d2826e09 100644
--- a/include/linux/smp.h
+++ b/include/linux/smp.h
@@ -234,7 +234,7 @@ static inline int get_boot_cpu_id(void)
 #endif /* !SMP */
 
 /**
- * raw_processor_id() - get the current (unstable) CPU id
+ * raw_smp_processor_id() - get the current (unstable) CPU id
  *
  * For then you know what you are doing and need an unstable
  * CPU id.
-- 
2.31.1.272.g89b43f80a514


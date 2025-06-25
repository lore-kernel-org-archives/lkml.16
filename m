Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F8051DB958
	for <linux-kernel@vger.kernel.org>; Wed, 25 Jun 2025 10:49:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750848589; cv=none; b=sZXvM/EVDXttQ/uHc9k4fuMW5Q6J8JvgjuofRTqcFd5XX3NwBPotsz3JKDAUimriT6/Hh1x/sIrcjDD8UFv2ftiSSxo2q9K1tma83HTljqOsWIS5rdAk6v1/Ydj6rOE2Kjji2InL0uzM4SBAw12CFkQdutnp8C8lc3DsFmzu2WM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750848589; c=relaxed/simple;
	bh=09ceZioxZvBbcSkKnBZnKjUIQi7bqYB4BMsAWIdwUeU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=qAPB7zoQ5cHqxIx87CEALhqNwWZ29yekUbohBGmPxuD0Tc8KhSCTvxSyq0T4QL5XAM2FFh61WZsVNx5c+SkgO1iQ+WAEgdzGzyY8pUVAjwkhzjzCL8ZCwcZed6PWDo4VCZ3QJL+flvS7+7kupBWVieRWMrD0HOlLQtWqgfDAmGk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=U9IoLQxd; arc=none smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="U9IoLQxd"
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-451d54214adso10053745e9.3
        for <linux-kernel@vger.kernel.org>; Wed, 25 Jun 2025 03:49:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1750848584; x=1751453384; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=z6NVBtkMgciKrf3fx54wkmNqszGIudA1B+3+8xolR2A=;
        b=U9IoLQxdrE2qzz4SrLDt9dAxEUsl2BB3xQ6X4AhTs8HQKpC/kS5yan9iPQdls0YY46
         BW6BkF2PDhT3LaWmEztoA4jjOeLXGa+vk85tWZfo0sW+P2HTe8CWGz8PeGQnNsIcWpIP
         3yW+s7aimJdd8Hp/0SERQVDUUexUyJmH50ODYu+x8o6JJ5MueIJLtP6LWKA/Qh67rF29
         ZoIMvNFT4+YdJWt9dIFG57tL81GXqXsOtqLi6qZPL0DTQ2aSKsYwdsYJc77gY1OuSggQ
         ESHoJW0nlW2MILwO2+od6CIAl3/g8qm8yd9DA/AJOt3vjzDVxQhmOED4c5ZkJK4lt/ql
         65tA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750848584; x=1751453384;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=z6NVBtkMgciKrf3fx54wkmNqszGIudA1B+3+8xolR2A=;
        b=S7Bw/XOyFZXC+qInNjRZHtSi2lVpkdtpbSJ3a31JcOY7qn9VUtI4U8y3JlQgE/asFZ
         Q2LV3ilIZ/JTA9HVBs7OMXqgCWI271RA6XpsqL6EnQudh9H6aQjjcbaUsVH3hkC+z19j
         6v4BUXqQps1plK+HRvprEgl/E49Srp/b75/Rj73cTPDm+G114ySGGisrebjTWis1vrVH
         iA3SyFUGw96gqpr7+AY3biIE8sMDgPomN8h1RRlO3aBmQtGhQksUCN8PwEbE3p68Lfi2
         4EXKJpmBe/mdB28a1Nqtu+/DWGaPTBbmLqZhS+jFpbIF3ex1FZCDkC/VfuobRbW7B1tc
         BaQg==
X-Gm-Message-State: AOJu0YxcNo9Pu9pn/aMaF57FRdKgMTdjIy6mNSUPBJ4V7PADzUPlXfMY
	dRbRKbjNqtVlgmJ99xbSLpnMtdRsjBGw2AD5ReBlPIjcwye6TLwEUkxsH1he5+100oQuoH6lvIN
	4G6k98u4=
X-Gm-Gg: ASbGnctwuONd60xsIurDhW2k4w1gUNmRvHQDCTKIyO12Vx/OrKdZzJruvvUg0Ww7Iz+
	dhmFdtSWMPsCskuib7GMFxI5qbncnpRL3TIt6bA6iy0njh7qeOfZErg7A4dK/GaVxmjm5LS9IL6
	A/7cCgM4tyWtPyoUBwkwAC54GlgZ3cFZ9JA8wCPC6AURgv64wefaojV592Y6HgmHRhGS7D1cxTj
	j+FDoivDueVbIK9zEI0j6Vrbeaxnvo8YJdCFEcQvv1ywo8bL6nv/MZvf+ek0NRDrQtjFdciTm71
	2Q2xvAa2d7PkZJqT2akbtfFpfN9ZRUjv2a6i43dhrEaOSowPY2rQ2Hz/Ds2OJc1QQZp+YxT/GWh
	W5pHTDlxCIQ==
X-Google-Smtp-Source: AGHT+IETWhNLKLb2HAwaU4u8nACbzAUIHWM8E/ISq2Rg3RpdU4pJrQpi0TmpBXJVpDZ3+igYsQXeKg==
X-Received: by 2002:a05:600c:4e8a:b0:43c:f0ae:da7 with SMTP id 5b1f17b1804b1-45381aa4ca1mr22106065e9.7.1750848584270;
        Wed, 25 Jun 2025 03:49:44 -0700 (PDT)
Received: from localhost.localdomain ([2a00:6d43:105:c401:e307:1a37:2e76:ce91])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4538233c49fsm16195055e9.7.2025.06.25.03.49.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Jun 2025 03:49:43 -0700 (PDT)
From: Marco Crivellari <marco.crivellari@suse.com>
To: linux-kernel@vger.kernel.org
Cc: Tejun Heo <tj@kernel.org>,
	Lai Jiangshan <jiangshanlai@gmail.com>,
	Thomas Gleixner <tglx@linutronix.de>,
	Frederic Weisbecker <frederic@kernel.org>,
	Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
	Marco Crivellari <marco.crivellari@suse.com>,
	Michal Hocko <mhocko@suse.com>,
	Andrew Morton <akpm@linux-foundation.org>
Subject: [PATCH v1 02/10] Workqueue: mm: replace use of system_wq with system_percpu_wq
Date: Wed, 25 Jun 2025 12:49:26 +0200
Message-ID: <20250625104934.184753-3-marco.crivellari@suse.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250625104934.184753-1-marco.crivellari@suse.com>
References: <20250625104934.184753-1-marco.crivellari@suse.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Currently if a user enqueue a work item using schedule_delayed_work() the
used wq is "system_wq" (per-cpu wq) while queue_delayed_work() use
WORK_CPU_UNBOUND (used when a cpu is not specified). The same applies to
schedule_work() that is using system_wq and queue_work(), that makes use
again of WORK_CPU_UNBOUND.

This lack of consistentcy cannot be addressed without refactoring the API.

system_wq is a per-CPU worqueue, yet nothing in its name tells about that
CPU affinity constraint, which is very often not required by users.
Make it clear by adding a system_percpu_wq to all the mm subsystem.

The old wq will be kept for a few release cylces.

Suggested-by: Tejun Heo <tj@kernel.org>
Signed-off-by: Marco Crivellari <marco.crivellari@suse.com>
CC: Andrew Morton <akpm@linux-foundation.org>
---
 mm/backing-dev.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/mm/backing-dev.c b/mm/backing-dev.c
index 783904d8c5ef..784605103202 100644
--- a/mm/backing-dev.c
+++ b/mm/backing-dev.c
@@ -966,7 +966,7 @@ static int __init cgwb_init(void)
 {
 	/*
 	 * There can be many concurrent release work items overwhelming
-	 * system_wq.  Put them in a separate wq and limit concurrency.
+	 * system_percpu_wq.  Put them in a separate wq and limit concurrency.
 	 * There's no point in executing many of these in parallel.
 	 */
 	cgwb_release_wq = alloc_workqueue("cgwb_release", 0, 1);
-- 
2.49.0


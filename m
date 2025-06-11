Received: from mail-pf1-f174.google.com (mail-pf1-f174.google.com [209.85.210.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D702D29ACF1
	for <linux-kernel@vger.kernel.org>; Wed, 11 Jun 2025 13:54:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749650073; cv=none; b=D7jNUyrZ0Xf+lB/quWp6v/qUrDucrWNi2/cBTel1+Ev5oRt3Th63qzmaE3JQcwO4glMTYKaT1k5/c5YCs9WuyseZIUzlWQDB8NgCxogwXMqyOA01KsPq0fFQoMzWQc66eN7FcCKeRrF6hxhC/wuyhE7xBF45bNtp60XzFWEPQwQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749650073; c=relaxed/simple;
	bh=edxnWgMRe12yk26KeyItjWTQwYTVb8+ySOLJEZ02jlQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=c/rRHxxBrVKg1fg1KoEOYP7koUxGdw4Ile/cnvJRAP+O8yj5GIC9AUBttaLZ/bRwimUUE5cCBmaR/+jUfTvwWis3hLULUtH4cFUsycFdZhDPmXitTctnmNM5sAlwTIuiucbkWAaFDh5XvRZT0tMzN/oNJZC+8QRtPBWo6r2+5t8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=XpwulRuk; arc=none smtp.client-ip=209.85.210.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="XpwulRuk"
Received: by mail-pf1-f174.google.com with SMTP id d2e1a72fcca58-742caef5896so5608510b3a.3
        for <linux-kernel@vger.kernel.org>; Wed, 11 Jun 2025 06:54:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1749650071; x=1750254871; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gwej+7RXCoLvIwzjqOEtOf4IscdkDTkk86t84fhTaT8=;
        b=XpwulRuk00Jq16phZaEGo7FXXdQb1l0KXt+vfAdbwD5tmTwoHeetE/h1iyKbIPaEVj
         SM4tyCzl4WOCI/2PMjB9NnCbohXo1SzGs6wMsRZAZ5ghAsUe+d3XgycvlFT/qojuA8dh
         HoJbLOldCJSYiEX4HzIWuGHXC/y1b7vf/EHUeGZJ+Dbn7z6PncBJImc3a6oqeFgVp1pU
         JEcQ5+M3mTxcCWIlYHArLgV3WuDVFcZxabyjvYYGfljb2nG3xwlpFjUd9zM05Xmb31+8
         voO51wynxIBe0A0/yuUNo9dEjOBG/abz2woZE/UwlsgSQ730t5ra7grGV+pqD/rRu58w
         qGmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749650071; x=1750254871;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=gwej+7RXCoLvIwzjqOEtOf4IscdkDTkk86t84fhTaT8=;
        b=ZUbvGsBF5KvpRcMZbyWwHoN9wWwGJhFnvTub3ylu5NAdNXwKJULuHuqz5RllNCrtES
         LmGRsaCVeIl4Qyv+uf/05ivDRg5sWcY8/e7SuHgJLp7R3bOxciDBnnvJvdEhIJqCgnjY
         ZjdGMjvJR9MBQOX8YNeUc/IB/VQ8lgahDGDTznSlEeYDbLLrv2WSJb2oo8d4bukb/iBU
         kjdDogTaJCfhb25aMIpu7uoYHb7IVgXiXMAT5TrfH76Ob7wBK9DTekJf3OA8IRhR1l0d
         zonC8c/q7EU8tA/rQhFEH9zNWsPkjYnYOIceaF70JjKXtlBhF2OyNiZux3pjn9gxywj3
         8Ekg==
X-Gm-Message-State: AOJu0Yzkj3BklTC0qLg4k/ja8Y3lcnfK/19RecQRofGQAbZm9DA5V9Zy
	BESkqDbqkgm+IU3CdIBbvQ1mYlmJYW36zIPGZKq2K79pbjISe5U6KUfrcn0r0rytHiQ=
X-Gm-Gg: ASbGncv6v/+MH9Pj3WpEZi/E6FGMjjN9+nzMBJ0sofOwmAXBiqFf3A98Ug1iZI9qhwU
	M4eq6ohGyoi8AEETf7GqZio+j0pJLqLEIiyb7UFykIqWDb3UTzhrySFho/p7fcqQkzGbcb2HqwZ
	LKWQIZ1W/tm5T6g63skQxiptm9AIzJpiJyKLLqKzKnPGykxlqU/8mIU30OVOv/cC7ADCDhAbpMT
	jgDVbnhYyJVbBZKghQ6jtwIAdT8UizbiBLrVi7IhrFYfwuLJQ7y97IEY6pFpKJB3U+IcYXbcyTa
	18WwSN/sgxg1YLkFOfJKPZj+6Fu3/IqaTn5GBobNgwZvmtMf3ymtWciG6N7+I1TEPyAU5FoLO7k
	n7Kt/B7Uah/WeBrjN2TJAJqyUZDIxmwnFclEb/FeXOQ==
X-Google-Smtp-Source: AGHT+IHbj6DYjUALG9JKwussK+VlVCr2ZyH9OjsqKrX0uBtfGhcudgVDTFPCQ9dCQ7hpPGK37nyuZg==
X-Received: by 2002:a05:6a00:92a0:b0:748:1bac:aff9 with SMTP id d2e1a72fcca58-7486cbd90f4mr5326703b3a.18.1749650070777;
        Wed, 11 Jun 2025 06:54:30 -0700 (PDT)
Received: from eric-acer.tail151456.ts.net (36-225-84-3.dynamic-ip.hinet.net. [36.225.84.3])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7482b0ea3cdsm9247523b3a.159.2025.06.11.06.54.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Jun 2025 06:54:30 -0700 (PDT)
From: Cheng-Yang Chou <yphbchou0911@gmail.com>
To: linux-kernel@vger.kernel.org
Cc: tj@kernel.org,
	void@manifault.com,
	arighi@nvidia.com,
	changwoo@igalia.com,
	jserv@ccns.ncku.edu.tw,
	yphbchou0911@gmail.com
Subject: [PATCH 4/4] sched_ext: Clean up and standardize #if/#else/#endif markers in sched/ext_idle.h
Date: Wed, 11 Jun 2025 21:54:04 +0800
Message-ID: <20250611135404.13851-5-yphbchou0911@gmail.com>
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
 kernel/sched/ext_idle.h | 10 ----------
 1 file changed, 10 deletions(-)

diff --git a/kernel/sched/ext_idle.h b/kernel/sched/ext_idle.h
index 37be78a7502b..906f1672c1d7 100644
--- a/kernel/sched/ext_idle.h
+++ b/kernel/sched/ext_idle.h
@@ -12,20 +12,10 @@
 
 struct sched_ext_ops;
 
-#ifdef CONFIG_SMP
 void scx_idle_update_selcpu_topology(struct sched_ext_ops *ops);
 void scx_idle_init_masks(void);
 bool scx_idle_test_and_clear_cpu(int cpu);
 s32 scx_pick_idle_cpu(const struct cpumask *cpus_allowed, int node, u64 flags);
-#else /* !CONFIG_SMP */
-static inline void scx_idle_update_selcpu_topology(struct sched_ext_ops *ops) {}
-static inline void scx_idle_init_masks(void) {}
-static inline bool scx_idle_test_and_clear_cpu(int cpu) { return false; }
-static inline s32 scx_pick_idle_cpu(const struct cpumask *cpus_allowed, int node, u64 flags)
-{
-	return -EBUSY;
-}
-#endif /* CONFIG_SMP */
 
 s32 scx_select_cpu_dfl(struct task_struct *p, s32 prev_cpu, u64 wake_flags,
 		       const struct cpumask *cpus_allowed, u64 flags);
-- 
2.43.0


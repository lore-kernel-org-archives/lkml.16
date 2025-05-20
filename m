Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A007A280CFF
	for <linux-kernel@vger.kernel.org>; Tue, 20 May 2025 19:29:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747769355; cv=none; b=fpu5g7/6xwRNlBkXSrhYe3zrZ6D6hL07maYEEBkXwZSyxY7xWZtKE/V3GtRMECmt0Ff/jtaTUPcQW8q/UDAosv6/+esNMz6mGGI3V0A6q2odrg8I0dfw/dNtEpyZNWULUh9hphoFQOAFW0lbPRoX2bWlRO5v4k6huJ7+WQ6xJ2E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747769355; c=relaxed/simple;
	bh=18Ba+RHfMxY/gKtuORTv0g0DXBi4zPzThwNe6vyvbfI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-type; b=naIhns/RmgXlFGR6ZLMiAO7mulm1Zwt/PBYqn0y4+vwoc6/jROVP8gC2c8RlQ1Toa2rUaZ1kyrkPLnrew4oBGFMV9PowCy6g1BwEsDjJO/Ufp2ZZlZqxWV4v5wasZ4wlxw3ugO5tcM5/fBOhjXm9zHnD0vKghC/Gm3CC5OZV2QE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=O5nD+3Sd; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="O5nD+3Sd"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1747769352;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=DzsRtio0TgvvI1C+UZLOxoBVzBQDVDWvWNtfXL5xstQ=;
	b=O5nD+3SdB7NIFt++5q9KC7H/0ZXSxpFxuHc2o9D16t1n9ShuDC0/EQrdBJp1lcF646sgcP
	KTnhodgERkKcc3Dc4AckChvpJG+l3pYSvpvOuAX8yKdXb2BxnouQKCYhTqMw/eHuFjdZeE
	aMG6LUvZaK3CQODq1/BfrHHj+2Y4c70=
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com
 [209.85.219.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-633-rQ4gfEbeNZegOcxfBzIu6Q-1; Tue, 20 May 2025 15:29:11 -0400
X-MC-Unique: rQ4gfEbeNZegOcxfBzIu6Q-1
X-Mimecast-MFC-AGG-ID: rQ4gfEbeNZegOcxfBzIu6Q_1747769351
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-6f8c461eea3so55988136d6.1
        for <linux-kernel@vger.kernel.org>; Tue, 20 May 2025 12:29:11 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747769350; x=1748374150;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=DzsRtio0TgvvI1C+UZLOxoBVzBQDVDWvWNtfXL5xstQ=;
        b=PfGPaMPnyYQorXoMlx12D4YBjy6zbOr1B/Lxj8ROirVylsFHHzrFuHC/Y1nBamiYw2
         utq4L5fydupp+FqvNSedN5K03F8bOp9Gbk+cJk9LCBkXhu/WLEHxeHXJr1auWZUEun5A
         gUJd5oee+TVh7OIKYsvaUw2wRFVUrEcahVCTTcfq7UwNpNV1y+6Tyed5GVl5gS99hq1/
         AWQDprYtzjhu54UViuT6WYZcal3NILLmznzmvJxlJj3/nUhYvl5ym8gNo7WyQlExqSX3
         lplzEWQ7qxWO4sOFFQz96vtyOB9pSmH9js+8fyAu6CtbuFuGbTdMHf+luJ2tLGlKWWiV
         pzMQ==
X-Forwarded-Encrypted: i=1; AJvYcCXwAFa1Xn5whY5Jtk3xqgpgzSzq47IG2yGmeU9qPUQt/VO2nTbMCiveGxS0ByPgfL3u9SaZmJklZRMPJwc=@vger.kernel.org
X-Gm-Message-State: AOJu0YywpuEcy1n9rBbQIGrQUFDA3DsX767Wd+8Y3fcG5Js/2IIBSLUr
	bDMi6jE7OJoObsb6gEueZlgSdvqrOB9trPPBbMzk2quNOCpAuR+4u0KGqlFNxXMCUXtzZZcKVzc
	YUH4TltFW8qluNvQQ2w/4MW9oEGiNpHyHV73dC51QmaFKoN7VApDt6Qb7bZYw+Z99fsPgXAN6Og
	==
X-Gm-Gg: ASbGncsBWexkplEigJoLu2bPOowSe/VpaVcQkVdxZ4k77hbBKb650Oye2bJVpKucs/P
	qUK6umpGDSmqK4CWXrvtcmTPoLaDGKo6dwcXJd5IdldyZQhQH/Lgp5IVE5mopRy/ts/q5sCzoe0
	3wb9jRU2IH8LvOMKVTc1bvIafAcMICrwNF1Yzt83aX/yu0XsFhEYQJr1dqomKKt6IjoooSdaRxP
	NiMVbZEvhQkpleBu69X47dcGI8rbY64x6b4hfttMs45deotJ5dywCZiqt4/U6ujAJHEIUydaqDi
	cMIU
X-Received: by 2002:a05:6214:212b:b0:6f4:c824:9d4a with SMTP id 6a1803df08f44-6f8b0841f3fmr314294456d6.13.1747769350018;
        Tue, 20 May 2025 12:29:10 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHzc/BZt8kmzPJX7qeEKqzgoGTlkuX63soDSgKGrZRrCBvknM8rHgo/ExmBavHZtf7qXFK7BQ==
X-Received: by 2002:a05:6214:212b:b0:6f4:c824:9d4a with SMTP id 6a1803df08f44-6f8b0841f3fmr314294006d6.13.1747769349512;
        Tue, 20 May 2025 12:29:09 -0700 (PDT)
Received: from x13s.. ([2600:382:810a:a775:a7c2:b4b2:4756:68b2])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6f8b08ac502sm76018156d6.42.2025.05.20.12.29.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 May 2025 12:29:08 -0700 (PDT)
From: Brian Masney <bmasney@redhat.com>
To: sboyd@kernel.org
Cc: mturquette@baylibre.com,
	mripard@kernel.org,
	linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 1/2] clk: preserve original rate when a sibling clk changes it's rate
Date: Tue, 20 May 2025 15:28:45 -0400
Message-ID: <20250520192846.9614-2-bmasney@redhat.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250520192846.9614-1-bmasney@redhat.com>
References: <20250520192846.9614-1-bmasney@redhat.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-type: text/plain
Content-Transfer-Encoding: 8bit

When a clk requests a new rate, there are times when the requested rate
cannot be fulfilled due to the current rate of the parent clk. If
CLK_SET_RATE_PARENT is set, then the parent rate can also be changed.
However, the clk core currently doesn't negotiate with any of the other
children to see if the new parent rate is acceptable, and will currently
just change the rates of the sibling clks.

When a parent changes it's rate, only ensure that the section of the
clk tree where the rate change request propagated up is changed. All
other sibling nodes should try to keep a rate close to where they
were originally at. The rate will go through a recalc_rate() with the
new parent rate, so the rate may possibly change.

This doesn't fix all of the issues where a clk can unknowingly change
the rate of it's siblings, however this is a relatively small change
that can fix some issues. A correct change that includes voting across
the various nodes in the subtree, and works across the various types
of clks will involve a much more elaborate patch set.

This change was tested with kunit tests, and also boot tested on a
Lenovo Thinkpad x13s laptop.

Signed-off-by: Brian Masney <bmasney@redhat.com>
---
 drivers/clk/clk.c | 28 ++++++++++++++++++++++++++--
 1 file changed, 26 insertions(+), 2 deletions(-)

diff --git a/drivers/clk/clk.c b/drivers/clk/clk.c
index 0565c87656cf..713d4d8a9b1e 100644
--- a/drivers/clk/clk.c
+++ b/drivers/clk/clk.c
@@ -72,6 +72,7 @@ struct clk_core {
 	unsigned long		rate;
 	unsigned long		req_rate;
 	unsigned long		new_rate;
+	bool			rate_directly_changed;
 	struct clk_core		*new_parent;
 	struct clk_core		*new_child;
 	unsigned long		flags;
@@ -2254,6 +2255,7 @@ static void clk_calc_subtree(struct clk_core *core, unsigned long new_rate,
 			     struct clk_core *new_parent, u8 p_index)
 {
 	struct clk_core *child;
+	unsigned long tmp_rate;
 
 	core->new_rate = new_rate;
 	core->new_parent = new_parent;
@@ -2264,7 +2266,14 @@ static void clk_calc_subtree(struct clk_core *core, unsigned long new_rate,
 		new_parent->new_child = core;
 
 	hlist_for_each_entry(child, &core->children, child_node) {
-		child->new_rate = clk_recalc(child, new_rate);
+		/*
+		 * When a parent changes it's rate, only ensure that the section
+		 * of the clk tree where the rate change request propagated up
+		 * is changed. All other sibling nodes should try to keep a rate
+		 * close to where they were originally at.
+		 */
+		tmp_rate = child->rate_directly_changed ? new_rate : child->rate;
+		child->new_rate = clk_recalc(child, tmp_rate);
 		clk_calc_subtree(child, child->new_rate, NULL, 0);
 	}
 }
@@ -2346,8 +2355,10 @@ static struct clk_core *clk_calc_new_rates(struct clk_core *core,
 	}
 
 	if ((core->flags & CLK_SET_RATE_PARENT) && parent &&
-	    best_parent_rate != parent->rate)
+	    best_parent_rate != parent->rate) {
+		parent->rate_directly_changed = true;
 		top = clk_calc_new_rates(parent, best_parent_rate);
+	}
 
 out:
 	clk_calc_subtree(core, new_rate, parent, p_index);
@@ -2487,6 +2498,15 @@ static void clk_change_rate(struct clk_core *core)
 	clk_pm_runtime_put(core);
 }
 
+static void clk_clear_rate_flags(struct clk_core *top)
+{
+	struct clk_core *child;
+
+	top->rate_directly_changed = false;
+	hlist_for_each_entry(child, &top->children, child_node) {
+		clk_clear_rate_flags(child);
+	}
+}
 static unsigned long clk_core_req_round_rate_nolock(struct clk_core *core,
 						     unsigned long req_rate)
 {
@@ -2537,6 +2557,8 @@ static int clk_core_set_rate_nolock(struct clk_core *core,
 	if (clk_core_rate_is_protected(core))
 		return -EBUSY;
 
+	core->rate_directly_changed = true;
+
 	/* calculate new rates and get the topmost changed clock */
 	top = clk_calc_new_rates(core, req_rate);
 	if (!top)
@@ -2559,6 +2581,8 @@ static int clk_core_set_rate_nolock(struct clk_core *core,
 	/* change the rates */
 	clk_change_rate(top);
 
+	clk_clear_rate_flags(top);
+
 	core->req_rate = req_rate;
 err:
 	clk_pm_runtime_put(core);
-- 
2.49.0


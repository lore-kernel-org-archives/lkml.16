Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2EB8C20C012
	for <linux-kernel@vger.kernel.org>; Thu, 10 Apr 2025 09:24:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744277083; cv=none; b=TzoOf39xfdnyejP37PexA5bPexRb2nkeeRi4eOI/qZAWr6tO76PsNwnLtgBE8CK9W5MfENGuL5VyaR8pUOUH1ySRD1L3EkVQrx358SAins570X71pRET/8H7i19FpixrGqlLFj2TJP5BbOvHAQd7b2Bj7elOt92CSh++9aUSkSY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744277083; c=relaxed/simple;
	bh=1rME6v6gtNb/UyD8b6NnpJlZDiSJcu7bGJOqqZsY4ss=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=RG7qnO9i9Bqxr7q5zjTp9hfIcfporVnnuuT8fI4BBzAz3AdkhrMwhGWIuuGA9F1+/BbqUoYyuxIVPAVJ0sW1h+8czEE9kZxHur0TiODKQ4rFtM8hVoJ4myygdF4HPD5HfNvO1eOA2CEz9OLKtj4q87l0Jwji6SvT3ozI3zjcvyI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=EenVMZ7c; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="EenVMZ7c"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4BC24C4CEDD;
	Thu, 10 Apr 2025 09:24:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744277082;
	bh=1rME6v6gtNb/UyD8b6NnpJlZDiSJcu7bGJOqqZsY4ss=;
	h=From:To:Cc:Subject:Date:From;
	b=EenVMZ7cR3M/EW8OKmstJ/KtKHKTuSzyU8rF71gbQ29mLNmcCI6zwNzq7mbmlevNx
	 J6kDyFq4IKeE7m7ZSzmksPX8/9G3BhJNDWPRSWSmTQ6I+BpHf69CCq7cvf0LMc7bqT
	 tnaW5Cw4tPoayATZYcVEqwad0aC2Gk98yq96EzlbHT5u1vsrXz7WYgyQWqxyd5/E0J
	 tnlPZyV/nfcN352XcG4dyVeaNV1Nn9rLYyHZyZgNszswXdlRGXzMWZ5sP9xuJzwNmL
	 BQDzDCl54CR2p2W48WjaYH/x1IRWakI1xfkaoNZ6l55UdRHTex9CRcTCN2hn5ZaaQi
	 2DWLT5eHCtwMQ==
From: alexs@kernel.org
To: 
Cc: linux-kernel@vger.kernel.org,
	Alex Shi <alexs@kernel.org>,
	Thomas Gleixner <tglx@linutronix.de>,
	Ingo Molnar <mingo@kernel.org>,
	Frederic Weisbecker <frederic@kernel.org>,
	Anna-Maria Behnsen <anna-maria@linutronix.de>
Subject: [PATCH 1/4] tick/nohz: remove function tick_nohz_full_add_cpus_to
Date: Thu, 10 Apr 2025 17:24:16 +0800
Message-ID: <20250410092423.9831-1-alexs@kernel.org>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Alex Shi <alexs@kernel.org>

This function isn't used by anyone. Remove it.

Signed-off-by: Alex Shi <alexs@kernel.org>
Cc: Thomas Gleixner <tglx@linutronix.de>
Cc: Ingo Molnar <mingo@kernel.org>
Cc: Frederic Weisbecker <frederic@kernel.org>
Cc: Anna-Maria Behnsen <anna-maria@linutronix.de>
---
 include/linux/tick.h | 7 -------
 1 file changed, 7 deletions(-)

diff --git a/include/linux/tick.h b/include/linux/tick.h
index b8ddc8e631a3..ac76ae9fa36d 100644
--- a/include/linux/tick.h
+++ b/include/linux/tick.h
@@ -195,12 +195,6 @@ static inline bool tick_nohz_full_enabled(void)
 	__ret;								\
 })
 
-static inline void tick_nohz_full_add_cpus_to(struct cpumask *mask)
-{
-	if (tick_nohz_full_enabled())
-		cpumask_or(mask, mask, tick_nohz_full_mask);
-}
-
 extern void tick_nohz_dep_set(enum tick_dep_bits bit);
 extern void tick_nohz_dep_clear(enum tick_dep_bits bit);
 extern void tick_nohz_dep_set_cpu(int cpu, enum tick_dep_bits bit);
@@ -281,7 +275,6 @@ extern void __init tick_nohz_full_setup(cpumask_var_t cpumask);
 #else
 static inline bool tick_nohz_full_enabled(void) { return false; }
 static inline bool tick_nohz_full_cpu(int cpu) { return false; }
-static inline void tick_nohz_full_add_cpus_to(struct cpumask *mask) { }
 
 static inline void tick_nohz_dep_set_cpu(int cpu, enum tick_dep_bits bit) { }
 static inline void tick_nohz_dep_clear_cpu(int cpu, enum tick_dep_bits bit) { }
-- 
2.47.1


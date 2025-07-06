Received: from sender4-op-o12.zoho.com (sender4-op-o12.zoho.com [136.143.188.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB9BB433CB
	for <linux-kernel@vger.kernel.org>; Sun,  6 Jul 2025 03:09:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.188.12
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751771370; cv=pass; b=D5PWeEEWJXx9fxC9oFRJx+SGUwcubIcv0fV1XcPoPCAdoJmUrazy5XNgEbV4ReS0FVVSIXool8yAM42KoN1kPA+u1+vHaoLQ2VyxbH65MKMKx+ZFKOlUXA8ewygT3/ZARgYrXrBwUMEpa+xJqLu+Ur5VdBN0JhkX3gDg+k8Ymbc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751771370; c=relaxed/simple;
	bh=sbFNafsvtu51o0eyrDKYUMuKkz3CUQWuPdMJ5NZeXz0=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=bOOziOIfe09ws+Zt52Zn4MKjO6EKv09apHK6ls45OaPWfXj6KmWjZF+l9GkPzKTtEwXSjoOIb7KHEYVyPaioouuqFnYUWnH9SVxyJXejK1fJU+HrYlfisAxn5Tlf/Q7hVaF9mY6X2kS+jO5piZsaqZnFcnxbzSnySYFyCjBPKbU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux.beauty; spf=pass smtp.mailfrom=linux.beauty; dkim=pass (1024-bit key) header.d=linux.beauty header.i=me@linux.beauty header.b=PNJY/okX; arc=pass smtp.client-ip=136.143.188.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux.beauty
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.beauty
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.beauty header.i=me@linux.beauty header.b="PNJY/okX"
ARC-Seal: i=1; a=rsa-sha256; t=1751771230; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=IPJVpQuRKPUZOmHoPff6Y7TvZL/UypJ/eGE4WhwtYtWhT4TqGrQZZvoDU5NMZlEUS0POpnop/0mBC5Pk9cFrM6hizpQ3MSGPaw2WtA2vTRK7O59RXHWb43g0bUFR32MjHWNahryIiOD0SugHkYeNEJnHNUvqZcb3raPBOF1DsYk=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1751771230; h=Content-Transfer-Encoding:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To:Cc; 
	bh=0QQA5XnseLrrWZ70NBGqrl483WRemympfW7X8ohQiWY=; 
	b=WmGUyd57mMcyUO1JQoLKC/ejX9EI6loKAUH6r6kNsn4rxGcT6LMhVIMSDm1vH0pYRRW7KJfh8GWL8ZIkuDOhu9DA/i/MCwT4WqPkxiZfuZDS6POUMCkcMu+qg/df8rSM1J/ct9YoD2NscFeLWaK9h41ROWIalzzUNd2nu9gAcis=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=linux.beauty;
	spf=pass  smtp.mailfrom=me@linux.beauty;
	dmarc=pass header.from=<me@linux.beauty>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1751771230;
	s=zmail; d=linux.beauty; i=me@linux.beauty;
	h=From:From:To:To:Subject:Subject:Date:Date:Message-ID:In-Reply-To:References:MIME-Version:Content-Transfer-Encoding:Message-Id:Reply-To:Cc;
	bh=0QQA5XnseLrrWZ70NBGqrl483WRemympfW7X8ohQiWY=;
	b=PNJY/okXJWU4RzXgoq4FN60Vior2b20Kvt3W04x9zssAbfIDPQxgyjgzakxZj3jZ
	LwZxQ6APmB8Ci+pECFU4IAGBgQ77UaTNmsf+8wNNScTNqxYn05xzAmiNaPHuw51KMG6
	gKy/Gym8rEN3h2F7HYNY3Gah23BV7JUULP1DsfPY=
Received: by mx.zohomail.com with SMTPS id 1751771228772345.1992660681566;
	Sat, 5 Jul 2025 20:07:08 -0700 (PDT)
From: Li Chen <me@linux.beauty>
To: Li Chen  <me@linux.beauty>," Thomas Gleixner "<tglx@linutronix.de>," Ingo Molnar "<mingo@redhat.com>," Borislav Petkov "<bp@alien8.de>," Dave Hansen "<dave.hansen@linux.intel.com>,<x86@kernel.org>," H . Peter Anvin "<hpa@zytor.com>," Rafael J . Wysocki "<rafael.j.wysocki@intel.com>," Peter Zijlstra "<peterz@infradead.org>," Sohil Mehta "<sohil.mehta@intel.com>," Brian Gerst "<brgerst@gmail.com>," Patryk Wlazlyn " <patryk.wlazlyn@linux.intel.com>,
	linux-kernel@vger.kernel.org,
	Thomas Gleixner <tglx@linutronix.de>,
	Ingo Molnar <mingo@redhat.com>,
	Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	x86@kernel.org,
	"H. Peter Anvin" <hpa@zytor.com>,
	"Rafael J. Wysocki" <rafael.j.wysocki@intel.com>,
	Li Chen <chenl311@chinatelecom.cn>,
	Brian Gerst <brgerst@gmail.com>,
	Patryk Wlazlyn <patryk.wlazlyn@linux.intel.com>,
	K Prateek Nayak <kprateek.nayak@amd.com>
Subject: [PATCH v4 2/4] x86/smpboot: remove redundant CONFIG_SCHED_SMT
Date: Sun,  6 Jul 2025 11:06:30 +0800
Message-ID: <20250706030636.397197-3-me@linux.beauty>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250706030636.397197-1-me@linux.beauty>
References: <20250706030636.397197-1-me@linux.beauty>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-ZohoMailClient: External

From: Li Chen <chenl311@chinatelecom.cn>

CONFIG_SCHED_SMT is default y if SMP is enabled,
so let's simply drop CONFIG_SCHED_SMT.

Signed-off-by: Li Chen <chenl311@chinatelecom.cn>
Suggested-by: Thomas Gleixner <tglx@linutronix.de>
---
 arch/x86/kernel/smpboot.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/arch/x86/kernel/smpboot.c b/arch/x86/kernel/smpboot.c
index 55f09946c791b..6e36306632792 100644
--- a/arch/x86/kernel/smpboot.c
+++ b/arch/x86/kernel/smpboot.c
@@ -484,9 +484,7 @@ static void __init build_sched_topology(void)
 {
 	int i = 0;
 
-#ifdef CONFIG_SCHED_SMT
 	x86_topology[i++] = SDTL(cpu_smt_mask, cpu_smt_flags, SMT);
-#endif
 #ifdef CONFIG_SCHED_CLUSTER
 	x86_topology[i++] = SDTL(cpu_clustergroup_mask, x86_cluster_flags, CLS);
 #endif
-- 
2.49.0


Received: from mail114-240.sinamail.sina.com.cn (mail114-240.sinamail.sina.com.cn [218.30.114.240])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 30C141DE4D2
	for <linux-kernel@vger.kernel.org>; Mon, 10 Feb 2025 10:50:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=218.30.114.240
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739184654; cv=none; b=BYoG1PxPaVNkS4mF4vt5RsYon7/cWgEt1skm0IJVQmbLnSVMz62OwynPjG93VXI6kvaecCI4gj23yIwX4orlWwSCqNQSPxAd/xdcitPGc5pSkmKInmNZY4r76d8npg626Dzv+yVIgF81hyuoVi0TplGCS5HWf8mOf6gBLDCq3jU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739184654; c=relaxed/simple;
	bh=TvXXUivX407DY/gmifCbKywhDh8VEHjdDnXGfiD6G4c=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=UgoeLyR7F+l07yrFGTDxQ3gxCd4LWvZ8ltMvMGaA+vSN9Promzr1X/9dx+v99OCUUp7Qz/plaLfxj2T9uOoXNHlUstjEhvJxyoUuddXaXqutsFBHuTlVG5EmpscAHbUaWkSzKCV9KrKV3E3KTEfhrE/jZwL/VtrVpwAQ1cS01NM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sina.com; spf=pass smtp.mailfrom=sina.com; arc=none smtp.client-ip=218.30.114.240
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sina.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sina.com
X-SMAIL-HELO: localhost.localdomain
Received: from unknown (HELO localhost.localdomain)([113.88.48.71])
	by sina.com (10.185.250.23) with ESMTP
	id 67A9D9FD00005AAF; Mon, 10 Feb 2025 18:50:39 +0800 (CST)
X-Sender: hdanton@sina.com
X-Auth-ID: hdanton@sina.com
Authentication-Results: sina.com;
	 spf=none smtp.mailfrom=hdanton@sina.com;
	 dkim=none header.i=none;
	 dmarc=none action=none header.from=hdanton@sina.com
X-SMAIL-MID: 767478913065
X-SMAIL-UIID: E840C1D2B535480A879B6F2B8A5037B5-20250210-185039-1
From: Hillf Danton <hdanton@sina.com>
To: Frederic Weisbecker <frederic@kernel.org>
Cc: Marcelo Tosatti <mtosatti@redhat.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	Michal Hocko <mhocko@kernel.org>,
	linux-mm@kvack.org,
	LKML <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH 6/6 v2] mm: Drain LRUs upon resume to userspace on nohz_full CPUs
Date: Mon, 10 Feb 2025 18:50:26 +0800
Message-ID: <20250210105028.2134-1-hdanton@sina.com>
In-Reply-To: <20250209223005.11519-7-frederic@kernel.org>
References: <20250209223005.11519-1-frederic@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On Sun,  9 Feb 2025 23:30:04 +0100 Frederic Weisbecker <frederic@kernel.org>
> @@ -769,6 +772,9 @@ static bool cpu_needs_drain(unsigned int cpu)
>  {
>  	struct cpu_fbatches *fbatches = &per_cpu(cpu_fbatches, cpu);
>  
> +	if (!housekeeping_cpu(cpu, HK_TYPE_KERNEL_NOISE))
> +		return false;
> +
>  	/* Check these in order of likelihood that they're not zero */
>  	return folio_batch_count(&fbatches->lru_add) ||
>  		folio_batch_count(&fbatches->lru_move_tail) ||
> -- 
> 2.46.0

Nit, I'd like to add a debug line to test your assumption that
isolated tasks are pinned to a single nohz_full CPU.

--- x/mm/swap.c
+++ y/mm/swap.c
@@ -767,9 +767,10 @@ static void lru_add_drain_per_cpu(struct
 static bool cpu_needs_drain(unsigned int cpu)
 {
 	struct cpu_fbatches *fbatches = &per_cpu(cpu_fbatches, cpu);
+	bool yes;
 
 	/* Check these in order of likelihood that they're not zero */
-	return folio_batch_count(&fbatches->lru_add) ||
+	yes = folio_batch_count(&fbatches->lru_add) ||
 		folio_batch_count(&fbatches->lru_move_tail) ||
 		folio_batch_count(&fbatches->lru_deactivate_file) ||
 		folio_batch_count(&fbatches->lru_deactivate) ||
@@ -777,6 +778,12 @@ static bool cpu_needs_drain(unsigned int
 		folio_batch_count(&fbatches->lru_activate) ||
 		need_mlock_drain(cpu) ||
 		has_bh_in_lru(cpu, NULL);
+
+	if (!housekeeping_cpu(cpu, HK_TYPE_KERNEL_NOISE)) {
+		VM_BUG_ON(yes);
+		return false;
+	}
+	return yes;
 }
 
 /*

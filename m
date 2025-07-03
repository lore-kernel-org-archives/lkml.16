Received: from mail3-164.sinamail.sina.com.cn (mail3-164.sinamail.sina.com.cn [202.108.3.164])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6693A1F956
	for <linux-kernel@vger.kernel.org>; Thu,  3 Jul 2025 01:08:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.108.3.164
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751504898; cv=none; b=lE8dpgfRC2idJBzZ9f3brNc+ElSmDwD0ViLiavjJqGEP6yXX1tb9DzDscF+Nw/X66niyVVY8N//EksWdFYWAwCDTpTTjBtT+y2/4iwtOAPS55KxwChnDGjZ2SVTyQqLvGeONl0AFowIuqC7pSRvxFNURYfW2qYBfWr1ITHmTG5o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751504898; c=relaxed/simple;
	bh=SUVlWdQqDyKJ4LhgmTpbGQqJAa4sQ+Phf/BlrfPW6h0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Pzvj0xGsrhHoZSlJjaRyCIQlyOeXvLcCPyotpIiuu7lkIMC1wJ1VSKomRCMuYva7gb8PCP81o9QDn/jCAYKLI56vuvnldLJid6Xp5FeqCgnPFrQj5TTn8ej4htKmoxZwLO1uLEdubi7dS2iMKEvGsb/wMRa1whfJ+SUQqHfEEt4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sina.com; spf=pass smtp.mailfrom=sina.com; dkim=pass (1024-bit key) header.d=sina.com header.i=@sina.com header.b=ude8dWvI; arc=none smtp.client-ip=202.108.3.164
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sina.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sina.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=sina.com header.i=@sina.com header.b="ude8dWvI"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sina.com; s=201208; t=1751504893;
	bh=1jJ//o1g6ALetyXYXwk4Tl4JBYGREwme42sNYEyCAjg=;
	h=From:Subject:Date:Message-ID;
	b=ude8dWvIkBhvmNrvzxoZDoY95EGpWER09emEpS6MTX9wd63LXNDpmIkzV3ikbpOP0
	 DP7/qVqAA38bkfi08gqKgf+GoSyCBvKNfNL3rfY7akB4+3qufxwFZF/iQlIuupYXLC
	 VtpdYLAYpS8OgFwc6X55MYWkGRJYvMHTBn1D0vuc=
X-SMAIL-HELO: localhost.localdomain
Received: from unknown (HELO localhost.localdomain)([114.249.58.236])
	by sina.com (10.54.253.32) with ESMTP
	id 6865D6AD00000771; Thu, 3 Jul 2025 09:02:39 +0800 (CST)
X-Sender: hdanton@sina.com
X-Auth-ID: hdanton@sina.com
Authentication-Results: sina.com;
	 spf=none smtp.mailfrom=hdanton@sina.com;
	 dkim=none header.i=none;
	 dmarc=none action=none header.from=hdanton@sina.com
X-SMAIL-MID: 1764334457055
X-SMAIL-UIID: 325FC3E2E72347A98D65E01A22244399-20250703-090239-1
From: Hillf Danton <hdanton@sina.com>
To: syzbot <syzbot+169412e85b1803dfda81@syzkaller.appspotmail.com>
Cc: linux-kernel@vger.kernel.org,
	syzkaller-bugs@googlegroups.com
Subject: Re: [syzbot] [kernel?] general protection fault in __cpa_flush_tlb
Date: Thu,  3 Jul 2025 09:02:26 +0800
Message-ID: <20250703010227.2223-1-hdanton@sina.com>
In-Reply-To: <6865460d.a00a0220.270cb1.0001.GAE@google.com>
References: 
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

> Date: Wed, 02 Jul 2025 07:45:33 -0700
> syzbot found the following issue on:
> 
> HEAD commit:    1343433ed389 Add linux-next specific files for 20250630
> git tree:       linux-next
> console output: https://syzkaller.appspot.com/x/log.txt?x=10aa93d4580000
> kernel config:  https://syzkaller.appspot.com/x/.config?x=c1ce97baf6bd6397
> dashboard link: https://syzkaller.appspot.com/bug?extid=169412e85b1803dfda81
> syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=10ed648c580000

#syz test

--- a/kernel/smp.c
+++ b/kernel/smp.c
@@ -802,7 +802,6 @@ static void smp_call_function_many_cond(
 
 	/* Check if we need remote execution, i.e., any CPU excluding this one. */
 	if (cpumask_any_and_but(mask, cpu_online_mask, this_cpu) < nr_cpu_ids) {
-		run_remote = true;
 		cfd = this_cpu_ptr(&cfd_data);
 		cpumask_and(cfd->cpumask, mask, cpu_online_mask);
 		__cpumask_clear_cpu(this_cpu, cfd->cpumask);
@@ -816,6 +815,7 @@ static void smp_call_function_many_cond(
 				continue;
 			}
 
+			run_remote = true;
 			csd_lock(csd);
 			if (wait)
 				csd->node.u_flags |= CSD_TYPE_SYNC;
@@ -843,8 +843,6 @@ static void smp_call_function_many_cond(
 			send_call_function_single_ipi(last_cpu);
 		else if (likely(nr_cpus > 1))
 			send_call_function_ipi_mask(cfd->cpumask_ipi);
-		else
-			run_remote = false;
 	}
 
 	/* Check if we need local execution. */
--

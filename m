Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9859225D1F9
	for <linux-kernel@vger.kernel.org>; Tue, 20 May 2025 10:18:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=90.155.92.199
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747736335; cv=none; b=Op9LxJyl8Y0MFFL+/EWo/F0Ls2ARf05OnQKTL6a8i6IIZk32jnoEcoUzXKpDlu2mFsxvcW8CNPHy3pzAWitRlRTQIXJoaUcjgVZTS2wWs/XFprjEvrNWwPO7muC2Tx8w5K11hbGsNieZrRZQBMfwPoSxOcAXRe5xij/0QsaW/sw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747736335; c=relaxed/simple;
	bh=mjb+AofgEQErmC1wLIMq2NamLveZrEDc/pwROLW6SLQ=;
	h=Message-ID:Date:From:To:Cc:Subject; b=BslNpb/cr0vG6t3SBObRJwydxPeYw9EQYPnZHR+5Db7JujSG2oqGxCagVLe8xxyAJJzpgP9eOBP96OdaLInL991ZSPtCM/eTJzctyM5ukeYIN4XybgaTWsG4SmnjCYvh1ACB7Dg5c2LWlb3IX7/gj5VQ65s+XyV6L/E7iaiZioQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org; spf=none smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=D1JnHBhU; arc=none smtp.client-ip=90.155.92.199
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="D1JnHBhU"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Subject:Cc:To:From:Date:Message-ID:
	Sender:Reply-To:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:In-Reply-To:References;
	bh=ZMi0U2zr4ZWzhpIPyVKhut6zuCHSmuHjaPz65LW/Ous=; b=D1JnHBhUyV3K6tksOdfPjzTu3n
	sidCxwfkJRewc4yh8ZacaP5OFxf5E+xSSYcsIN1IE3ZD/CNJx8wwVEn5q8Vabce+eHii0tNKjTf24
	05CWb25rNQMqAbEm79UwYSWAHTnMk7lQfus1IHSDzSiAM3TMeQCJbHA9PwF3UxiZ1WMkjrvWWK+Pi
	4pk6517Qic0OyJi/yVMt9dh+H71JPQ562HDVvlJOWuZm0YN2f8G9cwQRFEc6Jud/j6AFbz6cySmWY
	M6D3CSjpcCWMVDhMb0uqltT2vQUEz3kKR6ECRRO3UuPwwL7UlLYOYZ/4c6hz/WjHYdkkaGVFKyXmn
	KpFSl85g==;
Received: from 77-249-17-252.cable.dynamic.v4.ziggo.nl ([77.249.17.252] helo=noisy.programming.kicks-ass.net)
	by desiato.infradead.org with esmtpsa (Exim 4.98.1 #2 (Red Hat Linux))
	id 1uHK3Z-00000000lL3-3kLh;
	Tue, 20 May 2025 10:18:46 +0000
Received: by noisy.programming.kicks-ass.net (Postfix, from userid 0)
	id B27E9300677; Tue, 20 May 2025 12:18:44 +0200 (CEST)
Message-ID: <20250520094538.086709102@infradead.org>
User-Agent: quilt/0.66
Date: Tue, 20 May 2025 11:45:38 +0200
From: Peter Zijlstra <peterz@infradead.org>
To: mingo@redhat.com,
 juri.lelli@redhat.com,
 vincent.guittot@linaro.org,
 dietmar.eggemann@arm.com,
 rostedt@goodmis.org,
 bsegall@google.com,
 mgorman@suse.de,
 vschneid@redhat.com,
 clm@meta.com
Cc: linux-kernel@vger.kernel.org,
 peterz@infradead.org
Subject: [RFC][PATCH 0/5] sched: Try and address some recent-ish regressions
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>


Hi!

So Chris poked me about how they're having a wee performance drop after around
6.11. He's extended his schbench tool to mimic the workload in question.

Specifically the commandline given:

  schbench -L -m 4 -M auto -t 128 -n 0 -r 60

This benchmark wants to stay on a single (large) LLC (Chris, perhaps add an
option to start the CPU mask with
/sys/devices/system/cpu/cpu0/cache/index3/shared_cpu_list or something). Both
the machine Chris has (SKL, 20+ cores per LLC) and the machines I ran this on
(SKL,SPR 20+ cores) are Intel, AMD has smaller LLC and the problem wasn't as
pronounced there.

Use performance CPU governor (as always when benchmarking). Also, if the test
results are unstable as all heck, disable turbo.

After a fair amount of tinkering I managed to reproduce on my SPR and Thomas'
SKL. The SKL would only give usable numbers with the second socket offline and
turbo disabled -- YMMV.

Chris further provided a bisect into the DELAY_DEQUEUE patches and a bisect
leading to commit 5f6bd380c7bd ("sched/rt: Remove default bandwidth control")
-- which enables the dl_server by default.


SKL (performance, no_turbo):

schbench-6.9.0-1.txt:average rps: 2040360.55
schbench-6.9.0-2.txt:average rps: 2038846.78
schbench-6.9.0-3.txt:average rps: 2037892.28

schbench-6.15.0-rc6+-1.txt:average rps: 1907718.18
schbench-6.15.0-rc6+-2.txt:average rps: 1906931.07
schbench-6.15.0-rc6+-3.txt:average rps: 1903190.38

schbench-6.15.0-rc6+-dirty-1.txt:average rps: 2002224.78
schbench-6.15.0-rc6+-dirty-2.txt:average rps: 2007116.80
schbench-6.15.0-rc6+-dirty-3.txt:average rps: 2005294.57

schbench-6.15.0-rc6+-dirty-delayed-1.txt:average rps: 2011282.15
schbench-6.15.0-rc6+-dirty-delayed-2.txt:average rps: 2016347.10
schbench-6.15.0-rc6+-dirty-delayed-3.txt:average rps: 2014515.47

schbench-6.15.0-rc6+-dirty-delayed-default-1.txt:average rps: 2042169.00
schbench-6.15.0-rc6+-dirty-delayed-default-2.txt:average rps: 2032789.77
schbench-6.15.0-rc6+-dirty-delayed-default-3.txt:average rps: 2040313.95


SPR (performance):

schbench-6.9.0-1.txt:average rps: 2975450.75
schbench-6.9.0-2.txt:average rps: 2975464.38
schbench-6.9.0-3.txt:average rps: 2974881.02

schbench-6.15.0-rc6+-1.txt:average rps: 2882537.37
schbench-6.15.0-rc6+-2.txt:average rps: 2881658.70
schbench-6.15.0-rc6+-3.txt:average rps: 2884293.37

schbench-6.15.0-rc6+-dl_server-1.txt:average rps: 2924423.18
schbench-6.15.0-rc6+-dl_server-2.txt:average rps: 2920422.63

schbench-6.15.0-rc6+-dirty-1.txt:average rps: 3011540.97
schbench-6.15.0-rc6+-dirty-2.txt:average rps: 3010124.10

schbench-6.15.0-rc6+-dirty-delayed-1.txt:average rps: 3030883.15
schbench-6.15.0-rc6+-dirty-delayed-2.txt:average rps: 3031627.05

schbench-6.15.0-rc6+-dirty-delayed-default-1.txt:average rps: 3053005.98
schbench-6.15.0-rc6+-dirty-delayed-default-2.txt:average rps: 3052972.80


As can be seen, the SPR is much easier to please than the SKL for whatever
reason. I'm thinking we can make TTWU_QUEUE_DELAYED default on, but I suspect
TTWU_QUEUE_DEFAULT might be a harder sell -- we'd need to run more than this
one benchmark.

Anyway, the patches are stable (finally!, I hope, knock on wood) but in a
somewhat rough state. At the very least the last patch is missing ttwu_stat(),
still need to figure out how to account it ;-)

Chris, I'm hoping your machine will agree with these numbers; it hasn't been
straight sailing in that regard.


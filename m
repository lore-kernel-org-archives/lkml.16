Received: from sender4-op-o15.zoho.com (sender4-op-o15.zoho.com [136.143.188.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F18CD1FDD
	for <linux-kernel@vger.kernel.org>; Mon, 30 Jun 2025 06:08:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.188.15
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751263731; cv=pass; b=n9u6sK5Ml1nmPDGnsJm2i0DK+EZb4Rm60UFUwdFLcvZdHliJwAzsxa1tKOfOhpx+Yrg21Twnkc/yZSwU8Fx+Wro1MlrozrmJsPIVKtxqucw4MRHdKNroXIB0uRtI3Gu4bdz0W+yz/SlWDhsvtP3V35MX5h1tm6LXvTLj+8w9uCo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751263731; c=relaxed/simple;
	bh=iRC+tRRP8GrjsRatfB75fE9uiS5Yy6BjWAGhqaMFjTk=;
	h=From:To:Subject:Date:Message-ID:MIME-Version:Content-Type; b=miu3rk/+SdSqgjMH6GoisH575Qm/GNgk3/YLxqEIgsRdQr+jPMN5D82vpdA40gXvXJuXw7pvcyuxkCN6o0nq+4Mrmzq9AKURBLfn513e/JfIngZaVw/eMRpMfxu+YkO9qWmeobwHFd8HaSPoLyVhv87f5k86MhTomKpH9Up2C8I=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux.beauty; spf=pass smtp.mailfrom=linux.beauty; dkim=pass (1024-bit key) header.d=linux.beauty header.i=me@linux.beauty header.b=g3OX35y3; arc=pass smtp.client-ip=136.143.188.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux.beauty
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.beauty
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.beauty header.i=me@linux.beauty header.b="g3OX35y3"
ARC-Seal: i=1; a=rsa-sha256; t=1751263714; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=fNdim8rt3dYJWtzCAgZpYcSPqrCMUH/2cyNfkQ2Qa92I9A8IeAFfXk0fS3PN+Oa8w+Peh08lOal0tdSRR8LW55XbgvetrivcJoS6zQfQUKlLLjXHAxommEei+wIknoPdeHBcJpHKLsl8IVvyrOHKrHKz+Uz9+zoT0lEAH/jtlsw=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1751263714; h=Content-Type:Content-Transfer-Encoding:Date:Date:From:From:MIME-Version:Message-ID:Subject:Subject:To:To:Message-Id:Reply-To:Cc; 
	bh=7GLBN1xFjqC71Sa1Vn2ltQDBxX+pczKc5+Agjd3qE3E=; 
	b=FFtzCrzz6chxWHyAJt+f19bYdzIfPWo3OJzX4eOh7hp9PlCCofGo4CgsuC172W6t6/mYdcgDtQTMhxzC6E5itf2jahyhPljorjjaMzvsoldkE38EBh+VtfZyBNt1lx2zNeuiyMJkdUP8HlP43jmePUJU+n2qcGAtKEx/kB4FDBk=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=linux.beauty;
	spf=pass  smtp.mailfrom=me@linux.beauty;
	dmarc=pass header.from=<me@linux.beauty>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1751263714;
	s=zmail; d=linux.beauty; i=me@linux.beauty;
	h=From:From:To:To:Subject:Subject:Date:Date:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:Reply-To:Cc;
	bh=7GLBN1xFjqC71Sa1Vn2ltQDBxX+pczKc5+Agjd3qE3E=;
	b=g3OX35y3glpuE912Mx61jDeCZ18XTxWM0MuACRrX9VoGBuhZoHjakJOGCggwZibW
	gs77P/bf1wlGlk93gIiUVb8joZyoTPmsbguCZQgL/IXz9drial2g9VQFRXPvSf9QQXU
	4/slm2IpTI+ASLRiPo+C1vFzVuLSvwHcwulFv7WY=
Received: by mx.zohomail.com with SMTPS id 1751263711942212.35138684064486;
	Sun, 29 Jun 2025 23:08:31 -0700 (PDT)
From: Li Chen <me@linux.beauty>
To: Ingo Molnar <mingo@redhat.com>,
	Peter Zijlstra <peterz@infradead.org>,
	Juri Lelli <juri.lelli@redhat.com>,
	Vincent Guittot <vincent.guittot@linaro.org>,
	Dietmar Eggemann <dietmar.eggemann@arm.com>,
	Steven Rostedt <rostedt@goodmis.org>,
	Ben Segall <bsegall@google.com>,
	Mel Gorman <mgorman@suse.de>,
	Valentin Schneider <vschneid@redhat.com>,
	linux-kernel@vger.kernel.org
Subject: [PATCH] sched/debug: Add cond_resched() to sched_debug_show()
Date: Mon, 30 Jun 2025 14:08:26 +0800
Message-ID: <20250630060826.34217-1-me@linux.beauty>
X-Mailer: git-send-email 2.49.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ZohoMailClient: External

From: Li Chen <chenl311@chinatelecom.cn>

Running stress-ng on large CPUs (e.g., ≥256 cores) can
spawn numerous process/threads (e.g., over 70w told from
vmcore) and trigger softlockup watchdogs when read
/sys/kernel/debug/sched/debug:
https://github.com/ColinIanKing/stress-ng/blob/V0.18.10/stress-cpu-sched.c#L860

To improve responsiveness during extensive debug dumps,
insert cond_resched() into sched_debug_show(). This allows the
kernel to periodically yield and remain responsive, similar to how
cond_resched() is used in other iteration-heavy code paths.

Below is soft lockup call trace:

[ 1996.543070] RIP: 0010:print_cpu+0x2a4/0x770
[ 1996.543084] Code: f6 ff ff 49 81 ff 58 fc c0 b6 74 69 49 8b 8f 58 03 00 00 48 8b 41 10 48 8d 51 10 48 8d 98 20 f5 ff ff 48 39 c2 74 37 8b 43 14 <39> c5 75 19 49 8b b5 10 0a 00 00 48 89 da 4c 89 e7 e8 d6 f1 ff ff
[ 1996.543087] RSP: 0018:ffffc900704a7d40 EFLAGS: 00000202
[ 1996.543090] RAX: 0000000000000038 RBX: ffff88b1b9073900 RCX: ffff88b326b86880
[ 1996.543093] RDX: ffff88b326b86890 RSI: ffffffffb6527fde RDI: ffff88d579bd7256
[ 1996.543096] RBP: 0000000000000000 R08: 0000000000000028 R09: ffff88d679bd722d
[ 1996.543098] R10: ffffffffffffffff R11: 0000000000000000 R12: ffff88d4662cf880
[ 1996.543099] R13: ffff889045e34d40 R14: ffff88b1b9073900 R15: ffff88b1b9074258
[ 1996.543101] FS:  00007f0d2a254000(0000) GS:ffff88e04f080000(0000) knlGS:0000000000000000
[ 1996.543104] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
[ 1996.543106] CR2: 0000000000b6d7c0 CR3: 00000033f894a000 CR4: 0000000000350ee0
[ 1996.543108] Call Trace:
[ 1996.543115]  <TASK>
[ 1996.543122]  sched_debug_show+0x13/0x30
[ 1996.543127]  seq_read_iter+0x122/0x470
[ 1996.543133]  ? restore_fpregs_from_user+0xa9/0x150
[ 1996.543139]  seq_read+0xaa/0xe0
[ 1996.543148]  full_proxy_read+0x59/0x80
[ 1996.543155]  vfs_read+0xa1/0x1c0
[ 1996.543164]  ksys_read+0x63/0xe0
[ 1996.543168]  do_syscall_64+0x55/0x100
[ 1996.543175]  entry_SYSCALL_64_after_hwframe+0x78/0xe2

The full soft lockup message is here:
https://gist.github.com/FirstLoveLife/73f2185bed83a5faf7f94af8032a527b

Signed-off-by: Li Chen <chenl311@chinatelecom.cn>
---
 kernel/sched/debug.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/kernel/sched/debug.c b/kernel/sched/debug.c
index 9d71baf080751..9dd444c604a8b 100644
--- a/kernel/sched/debug.c
+++ b/kernel/sched/debug.c
@@ -1065,6 +1065,7 @@ static int sched_debug_show(struct seq_file *m, void *v)
 	else
 		sched_debug_header(m);
 
+	cond_resched();
 	return 0;
 }
 
-- 
2.49.0


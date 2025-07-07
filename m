Received: from baidu.com (mx24.baidu.com [111.206.215.185])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 855D6286D49
	for <linux-kernel@vger.kernel.org>; Mon,  7 Jul 2025 08:32:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=111.206.215.185
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751877163; cv=none; b=lK6QrxP8etHdxadWE3Xw3lE4pq8hOhB7JM3ueBBdhvT32pZUHPPjr2beOTmkvrG5y/ddTEZZqxsb/2OYalc39I3tISMCKvQtWKwsktL63BbRMH/zlebRacaYCq8ldctV9fyRFiZru82DKR4+R7CVoEqMX+gq6fDy1srF0yQZirs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751877163; c=relaxed/simple;
	bh=N28g1F/GAVhDi2xUO77/m6a0U1YY0tiDRP0slsHHAIs=;
	h=From:To:CC:Subject:Date:Message-ID:Content-Type:MIME-Version; b=U2OlzuKmx3xqmP3aTc6IJICgqG5EpVlTop2F7ZKXxOIMdHbAFd79xk2jHcjyawBdDpS+EYTqMG8XijJHLvuErqE0KUb2UYeTRZVZWtMIhiXu8InL4I2hD8B1jNakLpYg6Nbf7qpdHZF+tUrWAmZ+rQr8gWShMmf0wLJtdJjh+XU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=baidu.com; spf=pass smtp.mailfrom=baidu.com; arc=none smtp.client-ip=111.206.215.185
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=baidu.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baidu.com
From: "Li,Rongqing" <lirongqing@baidu.com>
To: "oleg@redhat.com" <oleg@redhat.com>
CC: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"vschneid@redhat.com" <vschneid@redhat.com>, "mgorman@suse.de"
	<mgorman@suse.de>, "bsegall@google.com" <bsegall@google.com>,
	"rostedt@goodmis.org" <rostedt@goodmis.org>, "dietmar.eggemann@arm.com"
	<dietmar.eggemann@arm.com>, "vincent.guittot@linaro.org"
	<vincent.guittot@linaro.org>, "juri.lelli@redhat.com"
	<juri.lelli@redhat.com>, "peterz@infradead.org" <peterz@infradead.org>,
	"mingo@redhat.com" <mingo@redhat.com>
Subject: divide error in x86 and cputime
Thread-Topic: divide error in x86 and cputime
Thread-Index: AdvvFOeRwP1XMiJ8Sh6ojy4vzov+4A==
Date: Mon, 7 Jul 2025 08:14:41 +0000
Message-ID: <78a0d7bb20504c0884d474868eccd858@baidu.com>
Accept-Language: zh-CN, en-US
Content-Language: zh-CN
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-FEAS-Client-IP: 172.31.50.16
X-FE-Policy-ID: 52:10:53:SYSTEM

Hi:

I see a divide error on x86 machine, the stack is below:


[78250815.703847] divide error: 0000 [#1] PREEMPT SMP NOPTI
[78250815.703852] CPU: 127 PID: 83435 Comm: killall Kdump: loaded Tainted: =
P           OE K   5.10.0 #1
[78250815.703853] Hardware name: Inspur SSINSPURMBX-XA3-100D-B356/NF5280A6,=
 BIOS 3.00.21 06/27/2022
[78250815.703859] RIP: 0010:cputime_adjust+0x55/0xb0
[78250815.703860] Code: 3b 4c 8b 4d 10 48 89 c6 49 8d 04 38 4c 39 c8 73 38 =
48 8b 45 00 48 8b 55 08 48 85 c0 74 16 48 85 d2 74 49 48 8d 0c 10 49 f7 e1 =
<48> f7 f1 49 39 c0 4c 0f 42 c0 4c 89 c8 4c 29 c0 48 39 c7 77 25 48
[78250815.703861] RSP: 0018:ffffa34c2517bc40 EFLAGS: 00010887
[78250815.703864] RAX: 69f98da9ba980c00 RBX: ffff976c93d2a5e0 RCX: 00000007=
09e00900
[78250815.703864] RDX: 00f5dfffab0fc352 RSI: 0000000000000082 RDI: ff07410d=
ca0bcd5e
[78250815.703865] RBP: ffffa34c2517bc70 R08: 00f5dfff54f8e5ce R09: fffd213a=
abd74626
[78250815.703866] R10: ffffa34c2517bed8 R11: 0000000000000000 R12: ffff976c=
93d2a5f0
[78250815.703867] R13: ffffa34c2517bd78 R14: ffffa34c2517bd70 R15: 00000000=
00001000
[78250815.703868] FS:  00007f58060f97a0(0000) GS:ffff976afe9c0000(0000) knl=
GS:0000000000000000
[78250815.703869] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
[78250815.703870] CR2: 00007f580610e000 CR3: 0000017e3b3d2004 CR4: 00000000=
00770ee0
[78250815.703870] PKRU: 55555554
[78250815.703871] Call Trace:
[78250815.703877]  thread_group_cputime_adjusted+0x4a/0x70
[78250815.703881]  do_task_stat+0x2ed/0xe00
[78250815.703885]  ? khugepaged_enter_vma_merge+0x12/0xd0
[78250815.703888]  proc_single_show+0x51/0xc0
[78250815.703892]  seq_read_iter+0x185/0x3c0
[78250815.703895]  seq_read+0x106/0x150
[78250815.703898]  vfs_read+0x98/0x180
[78250815.703900]  ksys_read+0x59/0xd0
[78250815.703904]  do_syscall_64+0x33/0x40
[78250815.703907]  entry_SYSCALL_64_after_hwframe+0x44/0xa9
[78250815.703910] RIP: 0033:0x318aeda360


It caused by a process with many threads running very long, and utime+stime=
 overflowed 64bit, then cause the below div

mul_u64_u64_div_u64(0x69f98da9ba980c00, 0xfffd213aabd74626, 0x09e00900);

I see the comments of mul_u64_u64_div_u64() say:

Will generate an #DE when the result doesn't fit u64, could fix with an
__ex_table[] entry when it becomes an issu


Seem __ex_table[] entry for div does not work ?

Thanks

-Li




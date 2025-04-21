Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F9E21E0DD1;
	Mon, 21 Apr 2025 16:34:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745253275; cv=none; b=sMcADD4soIFJsZzBbmGCJhAK1Na5J61rp+ekjVUZksxsdq4b7dkykJLrva/LHVTLKjp3fawErXQm7ClpcruawfqUkWUZpfrzcYtZVEH+fKzELsXHbUJa+o0aGfAsNGrlY8EAa9A5fxciHRSUkLMJEvoEciDApPE0/jJlHrKYwxs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745253275; c=relaxed/simple;
	bh=qKkW00yvCZcKhNrP0RVQ2wMTJHE5mjZGRt53TlYJczQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=CQkn496fXtqnBlTaML1lJ7adJZt0nHaqKEIqNfzT0g/uz9Bbvc+wYFVu4S6wYBztcaRZc9+H5/eqymtoqXXuj1UAgbVb6imH5L+Z2bsnEOSHDUZy/Mg+6haz9CuB0zZ2TA0v9/GMp+jbAz10ETXW1ZVHtsi26ds43xIG0LgEnMc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=U4JdENW8; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="U4JdENW8"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1B07FC4CEE4;
	Mon, 21 Apr 2025 16:34:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1745253275;
	bh=qKkW00yvCZcKhNrP0RVQ2wMTJHE5mjZGRt53TlYJczQ=;
	h=Date:From:To:Cc:Subject:Reply-To:References:In-Reply-To:From;
	b=U4JdENW8N2EQtfGdDXud4+sIugb6Byeh+vXlhMSxY5F6c58jaI10+Tdxbxnt3ydiX
	 zsc9XI/wv3rAUG4UbN2IHQTrAEIEckrwIoWvXv5eURIe8erEzWJk1UVJ2+8GklmzHn
	 rQZ+3mhjshNNowgcFUHH45ilJ8vRFH5MXbnxPqKDzYi0WqdSMRsN5iDhfyJuStrqE4
	 oC8Md18u1k6CcXC1hddizWy6pBl/wvgPUzKV2QCVLfWpl9fuHNXccr08li05k2297V
	 J7SexNSTHV46gbEBiZ0mcJuB0SqNfpzgsPGPEi23aZhaMD7McdnuMn/VxvMP5/9kBF
	 UZ2n28erYUiXg==
Received: by paulmck-ThinkPad-P17-Gen-1.home (Postfix, from userid 1000)
	id BBF62CE0855; Mon, 21 Apr 2025 09:34:34 -0700 (PDT)
Date: Mon, 21 Apr 2025 09:34:34 -0700
From: "Paul E. McKenney" <paulmck@kernel.org>
To: kernel test robot <oliver.sang@intel.com>
Cc: oe-lkp@lists.linux.dev, lkp@intel.com,
	Joel Fernandes <joelagnelf@nvidia.com>,
	linux-kernel@vger.kernel.org
Subject: Re: [linux-next:master] [rcutorture]  ddd062f753:
 WARNING:at_kernel/rcu/rcutorture.c:#rcu_torture_updown[rcutorture]
Message-ID: <9db0175d-eb50-4534-969f-35afaa677927@paulmck-laptop>
Reply-To: paulmck@kernel.org
References: <202504211513.23f21a0-lkp@intel.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <202504211513.23f21a0-lkp@intel.com>

On Mon, Apr 21, 2025 at 03:39:41PM +0800, kernel test robot wrote:
> 
> 
> Hello,
> 
> kernel test robot noticed "WARNING:at_kernel/rcu/rcutorture.c:#rcu_torture_updown[rcutorture]" on:
> 
> commit: ddd062f7536cc09fe7ff1a66816601984bc68af8 ("rcutorture: Complain if an ->up_read() is delayed more than 10 seconds")
> https://git.kernel.org/cgit/linux/kernel/git/next/linux-next.git master
> 
> [test failed on linux-next/master f660850bc246fef15ba78c81f686860324396628]
> 
> in testcase: rcutorture
> version: 
> with following parameters:
> 
> 	runtime: 300s
> 	test: cpuhotplug
> 	torture_type: srcud
> 
> 
> 
> config: x86_64-randconfig-123-20250415
> compiler: clang-20
> test machine: qemu-system-x86_64 -enable-kvm -cpu SandyBridge -smp 2 -m 16G
> 
> (please refer to attached dmesg/kmsg for entire log/backtrace)
> 
> 
> +-------------------------------------------------------------------------+------------+------------+
> |                                                                         | 1b983c34d5 | ddd062f753 |
> +-------------------------------------------------------------------------+------------+------------+
> | WARNING:at_kernel/rcu/rcutorture.c:#rcu_torture_updown[rcutorture]      | 0          | 24         |
> | RIP:rcu_torture_updown[rcutorture]                                      | 0          | 24         |
> +-------------------------------------------------------------------------+------------+------------+
> 
> 
> If you fix the issue in a separate patch/commit (i.e. not just a new version of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <oliver.sang@intel.com>
> | Closes: https://lore.kernel.org/oe-lkp/202504211513.23f21a0-lkp@intel.com
> 
> 
> The kernel config and materials to reproduce are available at:
> https://download.01.org/0day-ci/archive/20250421/202504211513.23f21a0-lkp@intel.com

Good catch, and thank you for your testing efforts!

Does the patch at the end of this email help?

							Thanx, Paul

> [  147.544571][  T727] ------------[ cut here ]------------
> [  147.545372][  T727] WARNING: CPU: 0 PID: 727 at kernel/rcu/rcutorture.c:2549 rcu_torture_updown+0xe0/0x430 [rcutorture]
> [  147.546643][  T727] Modules linked in: rcutorture torture
> [  147.547462][  T727] CPU: 0 UID: 0 PID: 727 Comm: rcu_torture_upd Not tainted 6.15.0-rc1-00008-gddd062f7536c #1 NONE  0a926b04a3771ed2623ec5d12c96d338a637f034
> [  147.549036][  T727] Hardware name: QEMU Standard PC (i440FX + PIIX, 1996), BIOS 1.16.2-debian-1.16.2-1 04/01/2014
> [  147.550241][  T727] RIP: 0010:rcu_torture_updown+0xe0/0x430 [rcutorture]
> [  147.551128][  T727] Code: 00 00 48 01 c3 48 8b 44 24 10 42 80 3c 20 00 74 0c 48 c7 c7 00 12 41 87 e8 fd 1b 49 e1 48 3b 1d a6 58 e0 e6 0f 89 84 01 00 00 <0f> 0b e9 7d 01 00 00 4c 89 7c 24 08 4f 8d 3c 2e 49 83 c7 60 4b 8d
> [  147.553366][  T727] RSP: 0000:ffff888150ebfe60 EFLAGS: 00210297
> [  147.554154][  T727] RAX: 1ffffffff0e82240 RBX: 00000000ffffc39e RCX: 0000000000000000
> [  147.555179][  T727] RDX: 0000000000000000 RSI: 0000000000000000 RDI: ffff888150eb3450
> [  147.572489][  T727] RBP: ffff888150eb6bd8 R08: 0000000000000000 R09: 0000000000000000
> [  147.573518][  T727] R10: 0000000000000000 R11: 0000000000000000 R12: dffffc0000000000
> [  147.574582][  T727] R13: ffff888150eb0000 R14: 0000000000003408 R15: ffff888150eb3448
> [  147.577955][  T727] FS:  0000000000000000(0000) GS:ffff888424c90000(0000) knlGS:0000000000000000
> [  147.579066][  T727] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
> [  147.579850][  T727] CR2: 00000000f729a000 CR3: 000000014d67f000 CR4: 00000000000406f0
> [  147.580851][  T727] DR0: 0000000000000000 DR1: 0000000000000000 DR2: 0000000000000000
> [  147.581887][  T727] DR3: 0000000000000000 DR6: 00000000fffe0ff0 DR7: 0000000000000400
> [  147.582799][  T727] Call Trace:
> [  147.583264][  T727]  <TASK>
> [  147.583703][  T727]  kthread+0x4b7/0x5e0
> [  147.584257][  T727]  ? rcu_torture_updown_hrt+0x60/0x60 [rcutorture 02ecf78e8bf32d7a769b787a1e354f19e873c8f2]
> [  147.591263][  T727]  ? kthread_unuse_mm+0x150/0x150
> [  147.591978][  T727]  ret_from_fork+0x3c/0x70
> [  147.592545][  T727]  ? kthread_unuse_mm+0x150/0x150
> [  147.593167][  T727]  ret_from_fork_asm+0x11/0x20
> [  147.593805][  T727]  </TASK>
> [  147.594276][  T727] irq event stamp: 340637
> [  147.597624][  T727] hardirqs last  enabled at (340653): [<ffffffff815a4e82>] __console_unlock+0x72/0x80
> [  147.598763][  T727] hardirqs last disabled at (340662): [<ffffffff815a4e67>] __console_unlock+0x57/0x80
> [  147.599920][  T727] softirqs last  enabled at (340578): [<ffffffff8148ecce>] handle_softirqs+0x5de/0x6e0
> [  147.601075][  T727] softirqs last disabled at (340569): [<ffffffff8148ef41>] __irq_exit_rcu+0x61/0xc0
> [  147.602178][  T727] ---[ end trace 0000000000000000 ]---
> 
> 
> -- 
> 0-DAY CI Kernel Test Service
> https://github.com/intel/lkp-tests/wiki

diff --git a/kernel/rcu/rcutorture.c b/kernel/rcu/rcutorture.c
index 3dd213bfc6662..53f0860b3748d 100644
--- a/kernel/rcu/rcutorture.c
+++ b/kernel/rcu/rcutorture.c
@@ -2557,6 +2557,7 @@ static void rcu_torture_updown_one(struct rcu_torture_one_read_state_updown *rto
 static int
 rcu_torture_updown(void *arg)
 {
+	unsigned long j;
 	struct rcu_torture_one_read_state_updown *rtorsup;
 
 	VERBOSE_TOROUT_STRING("rcu_torture_updown task started");
@@ -2564,8 +2565,9 @@ rcu_torture_updown(void *arg)
 		for (rtorsup = updownreaders; rtorsup < &updownreaders[n_up_down]; rtorsup++) {
 			if (torture_must_stop())
 				break;
+			j = smp_load_acquire(&jiffies); // Time before ->rtorsu_inuse.
 			if (smp_load_acquire(&rtorsup->rtorsu_inuse)) {
-				WARN_ON_ONCE(time_after(jiffies, rtorsup->rtorsu_j + 10 * HZ));
+				WARN_ON_ONCE(time_after(j, rtorsup->rtorsu_j + 10 * HZ));
 				continue;
 			}
 			rcu_torture_updown_one(rtorsup);

Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1306B22B59A;
	Fri, 16 May 2025 21:12:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747429978; cv=none; b=X1WoqRkh1sTs1lJLpfwEbIzrJglqK17xL9wr3ZpadGTY6/0T+8/kOL5m/l4fGnVpu/Z66ybH44tfx9pKXcrlpTFqztrwH0FOeY7MG8XyPkQvt02hSy69EXr5DYyaFbSJIRHg64ZGkBiTpJ6qKRmOFZq68FJ9d5BpAjV/C5pFvV4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747429978; c=relaxed/simple;
	bh=Fy4Y8kipSijwELgR6UsjOYS9RkWbQZVC+gC58ePPZLg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=MiRBwEkEbqHesITh5I6DeRsMWN7vnPt3JSL83H1rJ8Q/pylBIkdUWvTP4oMf5wbrefrWvseBEnmQg0dyu/4TfdBCN1e6rbshG2R7Hr1Flf5leHjgD9l96lFSB1p7km+cKD76Ti0JwDORro6cDrOpe+PALoI06pbr7mEIzSxulH4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=SNl6fTz9; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="SNl6fTz9"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 64B76C4CEE4;
	Fri, 16 May 2025 21:12:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747429977;
	bh=Fy4Y8kipSijwELgR6UsjOYS9RkWbQZVC+gC58ePPZLg=;
	h=Date:From:To:Cc:Subject:Reply-To:References:In-Reply-To:From;
	b=SNl6fTz9uH+SOeIbbcCtvO1w9eJd9Ta1wE5TQMXvNMn0M8vJaFilkyJ3U0RZgBAnJ
	 PP9D4Hl6Z38j6CSU90HE8SiPq0JkIaDZckRIpqZgQxrcDeQUEh9QPzRvydQg5lHjo2
	 8NsLdjzzN0viiXyo4i4TpN6kKoRSFWVVoorC5maXf5K+Eg/Av+mfEv8VJys0clMMh7
	 omAXsSVMuvCgAqnjw8Nc+Vy3cVwBnCIimP02CGVYguSutAG6zqBgDrZZBHV6mEV4Ix
	 M2p2XZr/3PbpuLW6hc/x4Y8qUC0oWybFiW9BPDDVf42gXaARQM2m7xQK9rnNbm4gIo
	 /BWNIy/sn2vvw==
Received: by paulmck-ThinkPad-P17-Gen-1.home (Postfix, from userid 1000)
	id 6CF7CCE0C93; Fri, 16 May 2025 14:12:56 -0700 (PDT)
Date: Fri, 16 May 2025 14:12:56 -0700
From: "Paul E. McKenney" <paulmck@kernel.org>
To: kernel test robot <oliver.sang@intel.com>
Cc: oe-lkp@lists.linux.dev, lkp@intel.com,
	Joel Fernandes <joelagnelf@nvidia.com>,
	Boqun Feng <boqun.feng@gmail.com>, linux-kernel@vger.kernel.org
Subject: Re: [paulmckrcu:dev.2025.05.05a] [rcutorture]  54d0803f63:
 WARNING:at_kernel/rcu/rcutorture.c:#rcu_torture_stats_print[rcutorture]
Message-ID: <7b11b0e1-9c96-4441-8905-a7fc5a3b49a0@paulmck-laptop>
Reply-To: paulmck@kernel.org
References: <202505131651.af6e81d7-lkp@intel.com>
 <620852c4-c2ae-4242-9996-1af248afba2c@paulmck-laptop>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <620852c4-c2ae-4242-9996-1af248afba2c@paulmck-laptop>

On Thu, May 15, 2025 at 05:37:03PM -0700, Paul E. McKenney wrote:
> On Wed, May 14, 2025 at 10:23:26AM +0800, kernel test robot wrote:
> > 
> > hi, Paul,
> > 
> > we noticed various issues for both 54d0803f63/parent in this test.
> > 
> > =========================================================================================
> > tbox_group/testcase/rootfs/kconfig/compiler/runtime/test/torture_type:
> >   vm-snb/rcutorture/debian-11.1-i386-20220923.cgz/i386-randconfig-061-20250510/clang-20/300s/default/trivial
> > 
> > ec3f43f72b268d44 54d0803f632b402e519c7d97a6b
> > ---------------- ---------------------------
> >        fail:runs  %reproduction    fail:runs
> >            |             |             |
> >            :100         71%          71:98    rcutorture.trivial.fail   <--- (1)
> >            :100         71%          71:98    dmesg.EIP:rcu_torture_stats_print   <--- (2)
> >          94:100          0%          94:98    dmesg.EIP:synchronize_rcu_trivial
> >         100:100         -2%          98:98    dmesg.UBSAN:implicit-conversion_in_drivers/firewire/core-transaction.c
> >         100:100         -2%          98:98    dmesg.UBSAN:negation-overflow_in_lib/sort.c
> >         100:100         -2%          98:98    dmesg.UBSAN:negation-overflow_in_mm/memcontrol.c
> >            :100         71%          71:98    dmesg.WARNING:at_kernel/rcu/rcutorture.c:#rcu_torture_stats_print[rcutorture]   <--- (3)
> >          94:100          0%          94:98    dmesg.WARNING:at_kernel/rcu/rcutorture.c:#synchronize_rcu_trivial[rcutorture]
> >         100:100         -2%          98:98    dmesg.boot_failures
> > 
> > 
> > but seems (1)(2)(3) are quite persistent on 54d0803f63 and clean on parent.
> > 
> > 
> > Hello,
> > 
> > kernel test robot noticed "WARNING:at_kernel/rcu/rcutorture.c:#rcu_torture_stats_print[rcutorture]" on:
> > 
> > commit: 54d0803f632b402e519c7d97a6b52d5ffb78ae78 ("rcutorture: Start rcu_torture_writer() after rcu_torture_reader()")
> > https://github.com/paulmckrcu/linux dev.2025.05.05a
> > 
> > in testcase: rcutorture
> > version: 
> > with following parameters:
> > 
> > 	runtime: 300s
> > 	test: default
> > 	torture_type: trivial
> 
> Huh.  This is the trivial RCU implementation that is not used in the
> Linux kernel (aside from rcutorture testing it), but verifies that my
> slideware/textbook implementation actually works.
> 
> So you didn't manage to break the Linux kernel, just some of my
> presentations.  ;-)
> 
> Still, this clearly needs to be fixed.
> 
> > config: i386-randconfig-061-20250510
> > compiler: clang-20
> > test machine: qemu-system-x86_64 -enable-kvm -cpu SandyBridge -smp 2 -m 16G
> > 
> > (please refer to attached dmesg/kmsg for entire log/backtrace)
> > 
> > 
> > 
> > If you fix the issue in a separate patch/commit (i.e. not just a new version of
> > the same patch/commit), kindly add following tags
> > | Reported-by: kernel test robot <oliver.sang@intel.com>
> > | Closes: https://lore.kernel.org/oe-lkp/202505131651.af6e81d7-lkp@intel.com
> > 
> > 
> > The kernel config and materials to reproduce are available at:
> > https://download.01.org/0day-ci/archive/20250513/202505131651.af6e81d7-lkp@intel.com
> > 
> > 
> > [  232.971337][  T965] trivial-torture: rtc: ef358cc0 ver: 9677 tfle: 0 rta: 9677 rtaf: 0 rtf: 9668 rtmbe: 0 rtmbkf: 0/0 rtbe: 0 rtbke: 0 rtbf: 0 rtb: 0 nt: 3782 onoff: 0/0:0/0 -1,0:-1,0 0:0 (HZ=300) barrier: 0/0:0 read-exits: 64 nocb-toggles: 0:0 gpwraps: 0
> > [  232.974503][  T965] trivial-torture: !!! 
> > [  232.974595][  T965] ------------[ cut here ]------------
> > [  232.976982][  T965] WARNING: CPU: 0 PID: 965 at kernel/rcu/rcutorture.c:2730 rcu_torture_stats_print+0x8e4/0x8f0 [rcutorture]
> 
> And this is a too-short grace period...
> 
> > [  232.980999][  T965] Modules linked in: rcutorture torture
> > [  232.982356][  T965] CPU: 0 UID: 0 PID: 965 Comm: rcu_torture_sta Tainted: G        W       T   6.15.0-rc1-00059-g54d0803f632b #1 PREEMPT(full)  5f9cb9cacb9aba8a18caee0ed4d4cf4452094bc2
> > [  232.990730][  T965] Tainted: [W]=WARN, [T]=RANDSTRUCT
> > [  232.992782][  T965] Hardware name: QEMU Standard PC (i440FX + PIIX, 1996), BIOS 1.16.2-debian-1.16.2-1 04/01/2014
> > [  232.995869][  T965] EIP: rcu_torture_stats_print+0x8e4/0x8f0 [rcutorture]
> > [  232.997526][  T965] Code: ff ff 0f 0b 83 3d 88 8f 35 ef 00 0f 84 b0 fb ff ff 0f 0b 83 3d 8c 8f 35 ef 00 0f 84 ae fb ff ff 0f 0b 84 db 0f 84 ac fb ff ff <0f> 0b e9 a5 fb ff ff 00 00 00 00 00 55 89 e5 53 57 56 83 ec 14 e8
> > [  233.002674][  T965] EAX: 00000004 EBX: 00000001 ECX: 00000000 EDX: 00000000
> > [  233.004477][  T965] ESI: 00000000 EDI: 00000000 EBP: 47efbf58 ESP: 47efbedc
> > [  233.006060][  T965] DS: 007b ES: 007b FS: 00d8 GS: 0000 SS: 0068 EFLAGS: 00010202
> > [  233.007496][  T965] CR0: 80050033 CR2: 353667f8 CR3: 7c473000 CR4: 000406d0
> > [  233.009173][  T965] DR0: 00000000 DR1: 00000000 DR2: 00000000 DR3: 00000000
> > [  233.010612][  T965] DR6: fffe0ff0 DR7: 00000400
> > [  233.011678][  T965] Call Trace:
> > [  233.012511][  T965]  ? rcu_torture_stats+0x24/0x70 [rcutorture 7eef68a8ad9c4bc219a4bda0dc180602dd9a9416]
> > [  233.014416][  T965]  ? kthread+0x1af/0x200
> > [  233.016388][  T965]  ? rcu_nocb_toggle+0x1c0/0x1c0 [rcutorture 7eef68a8ad9c4bc219a4bda0dc180602dd9a9416]
> > [  233.018427][  T965]  ? schedule_tail+0x79/0xf0
> > [  233.019297][  T965]  ? kthread_blkcg+0x30/0x30
> > [  233.020404][  T965]  ? kthread_blkcg+0x30/0x30
> > [  233.021230][  T965]  ? ret_from_fork+0x2c/0x40
> > [  233.022315][  T965]  ? ret_from_fork_asm+0x12/0x20
> > [  233.023169][  T965]  ? entry_INT80_32+0x10d/0x10d
> > [  233.024178][  T965] irq event stamp: 495
> > [  233.024991][  T965] hardirqs last  enabled at (509): [<4f981d9b>] __console_unlock+0x5b/0x70
> > [  233.026606][  T965] hardirqs last disabled at (520): [<4f981d82>] __console_unlock+0x42/0x70
> > [  233.028125][  T965] softirqs last  enabled at (282): [<51ba356a>] __do_softirq+0xa/0xe
> > [  233.029924][  T965] softirqs last disabled at (267): [<51ba356a>] __do_softirq+0xa/0xe
> > [  233.031571][  T965] ---[ end trace 0000000000000000 ]---
> > [  233.033193][  T965] Reader Pipe:  23875253 3963 1 0 0 0 0 0 0 0 0
> 
> ... as further indicated by the "1" after the "3963".  This means that
> there was one too-short trivial-RCU grace period in not quite four
> minutes of testing.
> 
> > [  233.034030][  T965] trivial-torture: Reader Batch:  23879217 0 0 0 0 0 0 0 0 0 0
> > [  233.035198][  T965] trivial-torture: Free-Block Circulation:  9676 9676 9675 9674 9673 9672 9671 9670 9669 9668 0
> > 
> > ...
> > 
> > [  472.316419][ T2339] trivial-torture:--- End of test: FAILURE: nreaders=1 nfakewriters=4 stat_interval=60 verbose=1 test_no_idle_hz=1 shuffle_interval=3 stutter=5 irqreader=1 fqs_duration=0 fqs_holdoff=0 fqs_stutter=3 test_boost=1/0 test_boost_interval=7 test_boost_duration=4 test_boost_holdoff=0 shutdown_secs=0 stall_cpu=0 stall_cpu_holdoff=10 stall_cpu_irqsoff=0 stall_cpu_block=0 stall_cpu_repeat=0 n_barrier_cbs=0 onoff_interval=0 onoff_holdoff=0 read_exit_delay=13 read_exit_burst=16 reader_flavor=1 nocbs_nthreads=0 nocbs_toggle=1000 test_nmis=0 preempt_duration=0 preempt_interval=1000 n_up_down=32
> 
> And this is one possible reason why:  "shuffle_interval=3".
> 
> The way that trivial RCU works is to schedule itself on each online CPU
> in turn in this function:
> 
> static void synchronize_rcu_trivial(void)
> {
> 	int cpu;
> 
> 	for_each_online_cpu(cpu) {
> 		torture_sched_setaffinity(current->pid, cpumask_of(cpu), true);
> 		WARN_ON_ONCE(raw_smp_processor_id() != cpu);
> 	}
> }
> 
> If torture_shuffle_tasks() moves this writer kthread just after the above
> torture_sched_setaffinity() completes, then synchronize_rcu_trivial()
> might miss its intended CPU, thus failing to wait for RCU readers on
> that CPU.  This can in turn result in a too-short grace period.
> 
> Except that I would expect the WARN_ON_ONCE() to trigger in that scenario.

Which you do have, now that I actually looked at the dmesg.  ;-)

> I will play with this a bit.  I don't want to force-disable shuffle
> in the torture_type=trivial case because it is a useful way of testing
> rcutorture itself.  But perhaps I can make the complaint more explicit.

And 200 hours of testing passed.  I am adding a change to splat, but to
force these kernel boot parameters to zero so as to avoid the spurious
grace-period failure.  I expect this to reach mainline during the v6.17
merge window.

							Thanx, Paul

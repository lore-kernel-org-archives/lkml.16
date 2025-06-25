Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D3A80254AF0;
	Wed, 25 Jun 2025 12:07:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750853275; cv=none; b=TDBD9kJ38WkMEa0timdASd3OcSKzkDtFNnkVTe4W//dwxbcJ3nQI8Kd6psfzVl/D1Ay4IVBX7dlZRAvKH1fA1NY6MZ4/AR7Z03ENqyLuYhms0rrGX8exaygvFNVGbuFtdVRnY3MSHnHGMwJdC+ZXzM1DNJu0emVkGo7bW9p77hM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750853275; c=relaxed/simple;
	bh=rx5eA8CotTkEwlv0x7GJV6zKKY+jOTfe4zVG7Np8Bqs=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=YqepuEJzCTet1ujOgyQ0GsIc86Olq+zr0HqJIxzd93m6bzLa5DxlRRk4Prri5N8IzpXlM72z2aQChcsvfm7B8cyq8Hrpih25vTa/nF73/e+kZxaSF7CyPPBOJXHWWP0GuzR3A3yn4VWdFma5bEHpQkov9on5RUeZW90aafre8SI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=QhxhIZ0D; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="QhxhIZ0D"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9C90AC4CEEE;
	Wed, 25 Jun 2025 12:07:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1750853275;
	bh=rx5eA8CotTkEwlv0x7GJV6zKKY+jOTfe4zVG7Np8Bqs=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References:From;
	b=QhxhIZ0Dfhy8DZNQB5pbUuu+O6hKtspID4yipZro17iDLbgVzs+gAA9v9cUyclI7r
	 xtRZ8qaGcKVQW39cXUlKmDlGIZSDvyRENBwVmIfPlESc3kJOaTG4WTjNbv9dsyD9SE
	 QQV2uhI1V7w21XBJCBkDNKMkoXDGvDYi74p73rWSapd/+SVeFsqyMXAWnTu60RL5Hn
	 RCYsJ1gUJhd+p5yh4oLs34NsO3iNYdbYo89srn+jthjV9rbgJJyoDqmgcjyeGlFsja
	 h0gl8FhshyolqiRFWOfu6FyC92hT7H9Q55THGxhzahkiJD16Gme+w5zgB/N6rTAxtm
	 FZ3tlMHyeLybg==
Message-ID: <3fb4046061853ec8786657f0bde7c0b49b4f37e0.camel@kernel.org>
Subject: Re: [linux-next:master] [ref_tracker]  65b584f536:
 BUG:spinlock_trylock_failure_on_UP_on_CPU
From: Jeff Layton <jlayton@kernel.org>
To: kernel test robot <oliver.sang@intel.com>, Jakub Kicinski
 <kuba@kernel.org>
Cc: oe-lkp@lists.linux.dev, lkp@intel.com, linux-kernel@vger.kernel.org
Date: Wed, 25 Jun 2025 08:07:53 -0400
In-Reply-To: <202506251406.c28f2adb-lkp@intel.com>
References: <202506251406.c28f2adb-lkp@intel.com>
Autocrypt: addr=jlayton@kernel.org; prefer-encrypt=mutual;
 keydata=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
 QZIQXVeAA+smfTT0tDrisj1U5x6ZB9b3nBg65kc=
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.2 (3.56.2-1.fc42) 
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

On Wed, 2025-06-25 at 14:32 +0800, kernel test robot wrote:
>=20
> Hello,
>=20
> kernel test robot noticed "BUG:spinlock_trylock_failure_on_UP_on_CPU" on:
>=20
> commit: 65b584f5361163ba539d2c7122ca792c3cc87997 ("ref_tracker: automatic=
ally register a file in debugfs for a ref_tracker_dir")
> https://git.kernel.org/cgit/linux/kernel/git/next/linux-next.git master
>=20
> [test failed on linux-next/master f817b6dd2b62d921a6cdc0a3ac599cd1851f343=
c]
>=20
> in testcase: boot
>=20
> config: i386-randconfig-141-20250623
> compiler: gcc-12
> test machine: qemu-system-i386 -enable-kvm -cpu SandyBridge -smp 2 -m 4G
>=20
> (please refer to attached dmesg/kmsg for entire log/backtrace)
>=20
>=20
> +------------------------------------------------+------------+----------=
--+
> >                                                | f6dbe294a1 | 65b584f53=
6 |
> +------------------------------------------------+------------+----------=
--+
> > BUG:spinlock_trylock_failure_on_UP_on_CPU      | 0          | 12       =
  |
> > WARNING:at_kernel/workqueue.c:#__queue_work    | 0          | 12       =
  |
> > EIP:__queue_work                               | 0          | 12       =
  |
> +------------------------------------------------+------------+----------=
--+
>=20
>=20
> If you fix the issue in a separate patch/commit (i.e. not just a new vers=
ion of
> the same patch/commit), kindly add following tags
> > Reported-by: kernel test robot <oliver.sang@intel.com>
> > Closes: https://lore.kernel.org/oe-lkp/202506251406.c28f2adb-lkp@intel.=
com
>=20
>=20
> [   51.542685][    T1] BUG: spinlock trylock failure on UP on CPU#0, swap=
per/1
> [ 51.543194][ T1] lock: debugfs_dentries+0x0/0x34, .magic: 00000000, .own=
er: <none>/-1, .owner_cpu: 0=20
> [   51.543194][    T1] CPU: 0 UID: 0 PID: 1 Comm: swapper Not tainted 6.1=
6.0-rc2-00006-g65b584f53611 #1 PREEMPTLAZY  672570e0a87e353b344c305ea64104c=
56bf67f95
> [   51.543194][    T1] Hardware name: QEMU Standard PC (i440FX + PIIX, 19=
96), BIOS 1.16.2-debian-1.16.2-1 04/01/2014
> [   51.543194][    T1] Call Trace:
> [ 51.543194][ T1] dump_stack_lvl (arch/x86/include/asm/irqflags.h:26 (dis=
criminator 3) arch/x86/include/asm/irqflags.h:109 (discriminator 3) arch/x8=
6/include/asm/irqflags.h:151 (discriminator 3) lib/dump_stack.c:123 (discri=
minator 3))=20
> [ 51.543194][ T1] dump_stack (lib/dump_stack.c:130)=20
> [ 51.543194][ T1] spin_bug (kernel/locking/spinlock_debug.c:71 kernel/loc=
king/spinlock_debug.c:78)=20
> [ 51.543194][ T1] do_raw_spin_trylock (kernel/locking/spinlock_debug.c:13=
3)=20
> [ 51.543194][ T1] _raw_spin_lock_irqsave (include/linux/spinlock_api_smp.=
h:111 kernel/locking/spinlock.c:162)=20
> [ 51.543194][ T1] ? ref_tracker_dir_exit (lib/ref_tracker.c:54 lib/ref_tr=
acker.c:226)=20
> [ 51.543194][ T1] ref_tracker_dir_exit (lib/ref_tracker.c:54 lib/ref_trac=
ker.c:226)=20
> [ 51.543194][ T1] free_netdev (net/core/dev.c:11880)=20
> [ 51.543194][ T1] smc_init (drivers/net/ethernet/smsc/smc9194.c:729)=20
> [ 51.543194][ T1] net_olddevs_init (drivers/net/Space.c:191 drivers/net/S=
pace.c:239 drivers/net/Space.c:248)=20
> [ 51.543194][ T1] ? ether_boot_setup (drivers/net/Space.c:244)=20
> [ 51.543194][ T1] do_one_initcall (init/main.c:1274)=20
> [ 51.543194][ T1] ? ether_boot_setup (drivers/net/Space.c:244)=20
> [ 51.543194][ T1] ? do_one_initcall (init/main.c:1291)=20
> [ 51.543194][ T1] do_initcalls (init/main.c:1335 init/main.c:1352)=20
> [ 51.543194][ T1] kernel_init_freeable (init/main.c:1588)=20
> [ 51.543194][ T1] ? rest_init (init/main.c:1466)=20
> [ 51.543194][ T1] kernel_init (init/main.c:1476)=20
> [ 51.543194][ T1] ret_from_fork (arch/x86/kernel/process.c:154)=20
> [ 51.543194][ T1] ? rest_init (init/main.c:1466)=20
> [ 51.543194][ T1] ret_from_fork_asm (arch/x86/entry/entry_32.S:737)=20
> [ 51.543194][ T1] entry_INT80_32 (arch/x86/entry/entry_32.S:945)=20
> [   51.578771][    T1] ------------[ cut here ]------------
> [ 51.579764][ T1] WARNING: CPU: 0 PID: 1 at kernel/workqueue.c:2325 __que=
ue_work (kernel/workqueue.c:2325)=20
> [   51.581319][    T1] Modules linked in:
> [   51.582069][    T1] CPU: 0 UID: 0 PID: 1 Comm: swapper Not tainted 6.1=
6.0-rc2-00006-g65b584f53611 #1 PREEMPTLAZY  672570e0a87e353b344c305ea64104c=
56bf67f95
> [   51.584508][    T1] Hardware name: QEMU Standard PC (i440FX + PIIX, 19=
96), BIOS 1.16.2-debian-1.16.2-1 04/01/2014
> [ 51.586299][ T1] EIP: __queue_work (kernel/workqueue.c:2325)=20
> [ 51.587177][ T1] Code: ff e8 ca 85 f7 ff e9 e5 fa ff ff 8d b4 26 00 00 0=
0 00 8d b4 26 00 00 00 00 90 e8 a5 85 f7 ff e9 1c fc ff ff 8d b6 00 00 00 0=
0 <0f> 0b 6a 00 31 c9 ba 01 00 00 00 b8 70 b3 dd 8a e8 1b 52 11 00 58
> All code
> =3D=3D=3D=3D=3D=3D=3D=3D
>    0:	ff                   	(bad)
>    1:	e8 ca 85 f7 ff       	call   0xfffffffffff785d0
>    6:	e9 e5 fa ff ff       	jmp    0xfffffffffffffaf0
>    b:	8d b4 26 00 00 00 00 	lea    0x0(%rsi,%riz,1),%esi
>   12:	8d b4 26 00 00 00 00 	lea    0x0(%rsi,%riz,1),%esi
>   19:	90                   	nop
>   1a:	e8 a5 85 f7 ff       	call   0xfffffffffff785c4
>   1f:	e9 1c fc ff ff       	jmp    0xfffffffffffffc40
>   24:	8d b6 00 00 00 00    	lea    0x0(%rsi),%esi
>   2a:*	0f 0b                	ud2		<-- trapping instruction
>   2c:	6a 00                	push   $0x0
>   2e:	31 c9                	xor    %ecx,%ecx
>   30:	ba 01 00 00 00       	mov    $0x1,%edx
>   35:	b8 70 b3 dd 8a       	mov    $0x8addb370,%eax
>   3a:	e8 1b 52 11 00       	call   0x11525a
>   3f:	58                   	pop    %rax
>=20
> Code starting with the faulting instruction
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
>    0:	0f 0b                	ud2
>    2:	6a 00                	push   $0x0
>    4:	31 c9                	xor    %ecx,%ecx
>    6:	ba 01 00 00 00       	mov    $0x1,%edx
>    b:	b8 70 b3 dd 8a       	mov    $0x8addb370,%eax
>   10:	e8 1b 52 11 00       	call   0x115230
>   15:	58                   	pop    %rax
> [   51.588586][    T1] EAX: 8addb388 EBX: 00000000 ECX: 00000000 EDX: 000=
00001
> [   51.588586][    T1] ESI: 8b872e60 EDI: 8125cd00 EBP: 813bbe34 ESP: 813=
bbe10
> [   51.588586][    T1] DS: 007b ES: 007b FS: 0000 GS: 0000 SS: 0068 EFLAG=
S: 00010082
> [   51.588586][    T1] CR0: 80050033 CR2: ffdd9000 CR3: 0b057000 CR4: 000=
40690
> [   51.588586][    T1] DR0: 00000000 DR1: 00000000 DR2: 00000000 DR3: 000=
00000
> [   51.588586][    T1] DR6: fffe0ff0 DR7: 00000400
> [   51.588586][    T1] Call Trace:
> [ 51.588586][ T1] queue_work_on (kernel/workqueue.c:2393)=20
> [ 51.588586][ T1] ref_tracker_dir_exit (lib/ref_tracker.c:227)=20
> [ 51.588586][ T1] free_netdev (net/core/dev.c:11880)=20
> [ 51.588586][ T1] smc_init (drivers/net/ethernet/smsc/smc9194.c:729)=20
> [ 51.588586][ T1] net_olddevs_init (drivers/net/Space.c:191 drivers/net/S=
pace.c:239 drivers/net/Space.c:248)=20
> [ 51.588586][ T1] ? ether_boot_setup (drivers/net/Space.c:244)=20
> [ 51.588586][ T1] do_one_initcall (init/main.c:1274)=20
> [ 51.588586][ T1] ? ether_boot_setup (drivers/net/Space.c:244)=20
> [ 51.588586][ T1] ? do_one_initcall (init/main.c:1291)=20
> [ 51.588586][ T1] do_initcalls (init/main.c:1335 init/main.c:1352)=20
> [ 51.588586][ T1] kernel_init_freeable (init/main.c:1588)=20
> [ 51.588586][ T1] ? rest_init (init/main.c:1466)=20
> [ 51.588586][ T1] kernel_init (init/main.c:1476)=20
> [ 51.588586][ T1] ret_from_fork (arch/x86/kernel/process.c:154)=20
> [ 51.588586][ T1] ? rest_init (init/main.c:1466)=20
> [ 51.588586][ T1] ret_from_fork_asm (arch/x86/entry/entry_32.S:737)=20
> [ 51.588586][ T1] entry_INT80_32 (arch/x86/entry/entry_32.S:945)=20
> [   51.588586][    T1] irq event stamp: 225562
> [ 51.588586][ T1] hardirqs last enabled at (225561): _raw_spin_unlock_irq=
restore (include/linux/spinlock_api_smp.h:151 kernel/locking/spinlock.c:194=
)=20
> [ 51.588586][ T1] hardirqs last disabled at (225562): _raw_spin_lock_irqs=
ave (include/linux/spinlock_api_smp.h:108 kernel/locking/spinlock.c:162)=
=20
> [ 51.588586][ T1] softirqs last enabled at (225310): neigh_parms_alloc (i=
nclude/linux/bitmap.h:236 include/net/neighbour.h:113 net/core/neighbour.c:=
1687)=20
> [ 51.588586][ T1] softirqs last disabled at (225308): neigh_parms_alloc (=
include/linux/list.h:169 net/core/neighbour.c:1684)=20
> [   51.588586][    T1] ---[ end trace 0000000000000000 ]---
>=20
>=20
> The kernel config and materials to reproduce are available at:
> https://download.01.org/0day-ci/archive/20250625/202506251406.c28f2adb-lk=
p@intel.com
>=20
>=20

I think I see the problem. The ref_tracker xarray and workqueue job
initializations are happening in late_initcall, but we need to do those
earlier since this is in subsys initcall (I think).

A patch like this should fix it. Is "postcore" the right stage to do
this? It looks like netdevs get set up in "subsys" but I wasn't sure
about the i915 driver.

Jakub, would you like me to send a patch on top of the series, or
should I respin and resend the pile?

Thanks,

------------------------8<---------------------------

[PATCH] ref_tracker: do xarray and workqueue job initializations earlier

Signed-off-by: Jeff Layton <jlayton@kernel.org>
---
 lib/ref_tracker.c | 10 ++++++++--
 1 file changed, 8 insertions(+), 2 deletions(-)

diff --git a/lib/ref_tracker.c b/lib/ref_tracker.c
index dcf923a1edf5..a9e6ffcff04b 100644
--- a/lib/ref_tracker.c
+++ b/lib/ref_tracker.c
@@ -516,13 +516,19 @@ static void debugfs_reap_work(struct work_struct *wor=
k)
 	} while (reaped);
 }
=20
-static int __init ref_tracker_debugfs_init(void)
+static int __init ref_tracker_debugfs_postcore_init(void)
 {
 	INIT_WORK(&debugfs_reap_worker, debugfs_reap_work);
 	xa_init_flags(&debugfs_dentries, XA_FLAGS_LOCK_IRQ);
 	xa_init_flags(&debugfs_symlinks, XA_FLAGS_LOCK_IRQ);
+	return 0;
+}
+postcore_initcall(ref_tracker_debugfs_postcore_init);
+
+static int __init ref_tracker_debugfs_late_init(void)
+{
 	ref_tracker_debug_dir =3D debugfs_create_dir("ref_tracker", NULL);
 	return 0;
 }
-late_initcall(ref_tracker_debugfs_init);
+late_initcall(ref_tracker_debugfs_late_init);
 #endif /* CONFIG_DEBUG_FS */
--=20
2.49.0

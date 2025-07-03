Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E29B2DE716;
	Thu,  3 Jul 2025 05:44:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751521479; cv=none; b=dhzqHGTFDAJpKzsWg1+steXd39PYJZirDfUvau2WZMkX/V78MwjW/eD1reOxqG9LADhpeMWHMBV60D1Yj2ydzELnDTzZ0bUOZsmB5El+5OVFEz3Qo19Y+94myGUxYieX+Hj6VmeY8yz43BDuMffUDUULPZxqCTLYYfad6NsZDgU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751521479; c=relaxed/simple;
	bh=yOfEIFqX2imR8AFW57bVZeSFTtG6JNpds2CoQPnAH9I=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=nfBCTTEkjAHafWEbH9yXLikqkCoBzxg1sg1t+Yu3gsCmliK/60bFknQO3wa6pAGKLCSE0s0l3DnDxHfyS9BFECi6lz63e8t2e5hfE7CPHC7YnZt84fBDNCzAl7/MZiKUCQIv2aZZxrrN80r/2MBiBUdkm1XyftzbrQ2SttmT1o0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=2uYPOsiP; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="2uYPOsiP"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 97DF3C4CEE3;
	Thu,  3 Jul 2025 05:44:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1751521479;
	bh=yOfEIFqX2imR8AFW57bVZeSFTtG6JNpds2CoQPnAH9I=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=2uYPOsiPguDEaYYyqvF0V/d3MGp0rYq+VKeFiE8LR/JTR1Bn+MvdoCIv+tdKqtwpw
	 7d0VOQdemZWTQ9fzsf/Wn+p8f2Hd4VPc8gYqgb760i9Xf2a39P3iHqg/4v2mauqQ63
	 12yKHm4LfKGz0BJdo3gjGhkrIj+SMon33XIWcso4=
Date: Thu, 3 Jul 2025 07:44:36 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Lin Ma <linma@zju.edu.cn>
Cc: wkang77@gmail.com, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org, stable@kernel.org
Subject: Re: [PATCH v1 1/2] staging: gdm724x: fix type confusion in
 gdm_lte_event_rcv()
Message-ID: <2025070343-halves-prison-c40f@gregkh>
References: <20250703052723.14616-1-linma@zju.edu.cn>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250703052723.14616-1-linma@zju.edu.cn>

On Thu, Jul 03, 2025 at 01:27:23PM +0800, Lin Ma wrote:
> This code assumes ifindex provided by user always result in device of
> gdb netdev type. Without proper type checking, the casting to nic type
> could cause type confusion.
> 
> Example crash trace shown as below:
> 
> [   49.516445] BUG: kernel NULL pointer dereference, address: 0000000000000000
> [   49.520016] #PF: supervisor read access in kernel mode
> [   49.520397] #PF: error_code(0x0000) - not-present page
> [   49.520780] PGD 0 P4D 0
> [   49.520997] Oops: 0000 [#1] PREEMPT SMP NOPTI
> [   49.521324] CPU: 0 PID: 172 Comm: trigger Tainted: G         C         6.1.90 #2
> [   49.521877] Hardware name: QEMU Standard PC (i440FX + PIIX, 1996), BIOS rel-1.16.0-0-gd239552ce722-prebuilt.qemu.org 04/01/2014
> [   49.522709] RIP: 0010:gdm_lte_event_rcv+0x17/0x40 [gdmulte]
> [   49.523121] Code: 48 89 e5 5d 31 ff c3 cc cc cc cc 0f 1f 84 00 00 00 00 00 0f 1f 44 00 00 55 48 8b 87 c8 09 00 00 48 89 d6 45 31 c0 89 ca 31 c9 <48> 8b 38 48 8b 40 28 48 89 e5 e8 3a 10 00 c2 5d 31 c0 31 d2 31 c9
> [   49.524533] RSP: 0018:ffffc900006879d0 EFLAGS: 00010246
> [   49.524929] RAX: 0000000000000000 RBX: ffff888004af8000 RCX: 0000000000000000
> [   49.525461] RDX: 0000000000000010 RSI: ffff888004aa1e14 RDI: ffff888004af8000
> [   49.525958] RBP: ffffc90000687a08 R08: 0000000000000000 R09: 0000000000000000
> [   49.526487] R10: 0000000000000000 R11: 0000000000000000 R12: 0000000000000010
> [   49.527029] R13: ffff888004aa1e00 R14: 0000000000000001 R15: ffff888004aa1e14
> [   49.527567] FS:  00007e6a8ab2c740(0000) GS:ffff88807dc00000(0000) knlGS:0000000000000000
> [   49.528122] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
> [   49.528544] CR2: 0000000000000000 CR3: 0000000005cc2000 CR4: 00000000000006f0
> [   49.529033] DR0: 0000000000000000 DR1: 0000000000000000 DR2: 0000000000000000
> [   49.529615] DR3: 0000000000000000 DR6: 00000000fffe0ff0 DR7: 0000000000000400
> [   49.530120] Call Trace:
> [   49.530310]  <TASK>
> [   49.530492]  ? __die_body.cold+0x1a/0x1f
> [   49.530790]  ? __die+0x2a/0x3b
> [   49.531024]  ? page_fault_oops+0x170/0x2f0
> [   49.531387]  ? gdm_lte_event_rcv+0x17/0x40 [gdmulte]
> [   49.531735]  ? kernelmode_fixup_or_oops+0xb2/0x140
> [   49.532105]  ? __bad_area_nosemaphore+0x197/0x1f0
> [   49.532492]  ? find_vma+0x30/0x50
> [   49.532739]  ? bad_area_nosemaphore+0x16/0x30
> [   49.533072]  ? do_user_addr_fault+0x2a8/0x5a0
> [   49.533403]  ? exc_page_fault+0x80/0x1b0
> [   49.533731]  ? asm_exc_page_fault+0x27/0x30
> [   49.534034]  ? gdm_lte_event_rcv+0x17/0x40 [gdmulte]
> [   49.534412]  ? netlink_rcv+0x9a/0xd0 [gdmulte]
> [   49.534748]  netlink_unicast+0x24d/0x390
> [   49.535059]  netlink_sendmsg+0x25e/0x4d0
> [   49.535350]  __sock_sendmsg+0x6d/0x70
> [   49.535664]  __sys_sendto+0x151/0x1b0
> [   49.535958]  __x64_sys_sendto+0x24/0x40
> [   49.536236]  x64_sys_call+0x18d4/0x21b0
> [   49.536533]  do_syscall_64+0x56/0x90
> [   49.536831]  ? kmem_cache_alloc+0x180/0x340
> [   49.537132]  ? security_file_alloc+0x2e/0xf0
> [   49.537500]  ? apparmor_file_alloc_security+0x40/0x1e0
> [   49.537897]  ? __wake_up_common_lock+0x8b/0xd0
> [   49.538237]  ? __check_object_size+0x71/0x260
> [   49.538623]  ? _copy_to_user+0x25/0x60
> [   49.538920]  ? move_addr_to_user+0x53/0xe0
> [   49.539228]  ? __sys_getsockname+0xa8/0x110
> [   49.539567]  ? exit_to_user_mode_prepare+0x49/0x230
> [   49.539958]  ? syscall_exit_to_user_mode+0x22/0x60
> [   49.540307]  ? do_syscall_64+0x62/0x90
> [   49.540618]  ? lock_mm_and_find_vma+0x43/0x220
> [   49.540945]  ? exit_to_user_mode_prepare+0x49/0x230
> [   49.541304]  ? irqentry_exit_to_user_mode+0x10/0x30
> [   49.541685]  ? irqentry_exit+0x43/0x50
> [   49.541995]  ? exc_page_fault+0x91/0x1b0
> [   49.542316]  entry_SYSCALL_64_after_hwframe+0x6e/0xd8
> [   49.542666] RIP: 0033:0x7e6a8abb6407
> 
> This bug was "fixed" in upstream kernel by the commit 1c2d364e7f7f
> ("staging: gdm724x: Remove unused driver"). However, other stable
> versions still contain it. Fix the confusion bug by adding checks.
> 
> Cc: stable@kernel.org
> Fixes: 61e121047645 ("staging: gdm7240: adding LTE USB driver")
> Signed-off-by: Lin Ma <linma@zju.edu.cn>
> ---
>  drivers/staging/gdm724x/gdm_lte.c | 3 +++
>  1 file changed, 3 insertions(+)
> 
> diff --git a/drivers/staging/gdm724x/gdm_lte.c b/drivers/staging/gdm724x/gdm_lte.c
> index 1f0283fc1d2c..73c7bea16b80 100644
> --- a/drivers/staging/gdm724x/gdm_lte.c
> +++ b/drivers/staging/gdm724x/gdm_lte.c
> @@ -522,6 +522,9 @@ static void gdm_lte_event_rcv(struct net_device *dev, u16 type,
>  {
>  	struct nic *nic = netdev_priv(dev);
>  
> +	if (dev->netdev_ops->ndo_open != gdm_lte_open)
> +		return;

Why should a driver be poking around in netdev_ops?  That feels wrong,
what would ever change this?  Why not fix that instead?

thanks,

greg k-h

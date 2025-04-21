Received: from szxga03-in.huawei.com (szxga03-in.huawei.com [45.249.212.189])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D8542566DF;
	Mon, 21 Apr 2025 02:53:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.249.212.189
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745203984; cv=none; b=cAEV1GdUeAGEwFTy3y46bO/baKJLIc6PhFWAv27eIDJvTGXpiGrMNRImOfUQN7AB/LhQq8W82cBPtlimJNNOy3BYWlparje2/65ZqpYDcw0V7v7XBiDg/vtI1Fqn6RzegvNWxflRhdNPFEySrvSClEfJp8INBEdi/kmd2bmSa94=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745203984; c=relaxed/simple;
	bh=76YqBZtheMprSrRFH1+QUbuhvLXmGgaCoHb4ztvhMlA=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=DmxQ3YleTJQc8d8FPx24oaFIBkij1NOd8yz6yKc7wxSBmI6BM5wPJA4ZhDhCe/UI9H+6cjGcVGIMMvK7B4llpFdVwoJAGWTgunMwrICosqQARNNzQjSnORN+HwHgZft6qZwueIBpRdybH6uKwrhKOqvPFGW+z2Yi7nXSxdBPEs8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com; spf=pass smtp.mailfrom=huawei.com; arc=none smtp.client-ip=45.249.212.189
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=huawei.com
Received: from mail.maildlp.com (unknown [172.19.163.48])
	by szxga03-in.huawei.com (SkyGuard) with ESMTP id 4ZgqZr2Nv0zHrPM;
	Mon, 21 Apr 2025 10:49:24 +0800 (CST)
Received: from kwepemg500010.china.huawei.com (unknown [7.202.181.71])
	by mail.maildlp.com (Postfix) with ESMTPS id E6AD6180080;
	Mon, 21 Apr 2025 10:52:52 +0800 (CST)
Received: from [10.174.178.209] (10.174.178.209) by
 kwepemg500010.china.huawei.com (7.202.181.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.11; Mon, 21 Apr 2025 10:52:52 +0800
Message-ID: <fa7af63c-899e-4eb5-89d2-27013f4d2618@huawei.com>
Date: Mon, 21 Apr 2025 10:52:51 +0800
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: CVE-2025-22077: smb: client: Fix netns refcount imbalance causing
 leaks and use-after-free
To: <cve@kernel.org>, <linux-kernel@vger.kernel.org>,
	<linux-cve-announce@vger.kernel.org>
CC: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
References: <2025041612-CVE-2025-22077-d534@gregkh>
From: Wang Zhaolong <wangzhaolong1@huawei.com>
In-Reply-To: <2025041612-CVE-2025-22077-d534@gregkh>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: dggems701-chm.china.huawei.com (10.3.19.178) To
 kwepemg500010.china.huawei.com (7.202.181.71)

Dear CVE Community,

As the author of commit 4e7f1644f2ac ("smb: client: Fix netns refcount imbalance
causing leaks and use-after-free"), I want to clarify some confusion around the
proper fixes for these issues:

1. Commit 4e7f1644f2ac is currently associated with CVE-2025-22077. However, this
patch was merely attempting to fix issues introduced by commit e9f2517a3e18 ("smb:
client: fix TCP timers deadlock after rmmod").

2. As I've previously discussed with Greg Kroah-Hartman on the kernel mailing list[1],
    commit e9f2517a3e18 (which was intended to address CVE-2024-54680):
    - Failed to address the actual null pointer dereference in lockdep
    - Introduced multiple serious issues:
      - Socket leak vulnerability (bugzilla #219972)
      - Network namespace refcount imbalance (bugzilla #219792)

3. Our testing and analysis confirms that the original fix by Kuniyuki Iwashima,
commit ef7134c7fc48 ("smb: client: Fix use-after-free of network namespace."), is
actually the correct approach. This patch properly handles network namespace
reference counting without introducing the problems that e9f2517a3e18 did.

4. The proper resolution for these issues was ultimately commit 95d2b9f693ff
("Revert 'smb: client: fix TCP timers deadlock after rmmod'"), which reverted
the problematic patch. In the latest Linux mainline code, the problematic patch and
my subsequent fix patch have been reverted.[2][3]

Thank you for your attention to this matter. I'm happy to provide additional details if needed.

[1] https://lore.kernel.org/all/2025040248-tummy-smilingly-4240@gregkh/
[2] https://github.com/torvalds/linux/commit/c707193a17128fae2802d10cbad7239cc57f0c95
[3] https://github.com/torvalds/linux/commit/4e7f1644f2ac6d01dc584f6301c3b1d5aac4eaef

Best regards,
Wang Zhaolong

> Description
> ===========
> 
> In the Linux kernel, the following vulnerability has been resolved:
> 
> smb: client: Fix netns refcount imbalance causing leaks and use-after-free
> 
> Commit ef7134c7fc48 ("smb: client: Fix use-after-free of network
> namespace.") attempted to fix a netns use-after-free issue by manually
> adjusting reference counts via sk->sk_net_refcnt and sock_inuse_add().
> 
> However, a later commit e9f2517a3e18 ("smb: client: fix TCP timers deadlock
> after rmmod") pointed out that the approach of manually setting
> sk->sk_net_refcnt in the first commit was technically incorrect, as
> sk->sk_net_refcnt should only be set for user sockets. It led to issues
> like TCP timers not being cleared properly on close. The second commit
> moved to a model of just holding an extra netns reference for
> server->ssocket using get_net(), and dropping it when the server is torn
> down.
> 
> But there remain some gaps in the get_net()/put_net() balancing added by
> these commits. The incomplete reference handling in these fixes results
> in two issues:
> 
> 1. Netns refcount leaks[1]
> 
> The problem process is as follows:
> 
> ```
> mount.cifs                        cifsd
> 
> cifs_do_mount
>    cifs_mount
>      cifs_mount_get_session
>        cifs_get_tcp_session
>          get_net()  /* First get net. */
>          ip_connect
>            generic_ip_connect /* Try port 445 */
>              get_net()
>              ->connect() /* Failed */
>              put_net()
>            generic_ip_connect /* Try port 139 */
>              get_net() /* Missing matching put_net() for this get_net().*/
>        cifs_get_smb_ses
>          cifs_negotiate_protocol
>            smb2_negotiate
>              SMB2_negotiate
>                cifs_send_recv
>                  wait_for_response
>                                   cifs_demultiplex_thread
>                                     cifs_read_from_socket
>                                       cifs_readv_from_socket
>                                         cifs_reconnect
>                                           cifs_abort_connection
>                                             sock_release();
>                                             server->ssocket = NULL;
>                                             /* Missing put_net() here. */
>                                             generic_ip_connect
>                                               get_net()
>                                               ->connect() /* Failed */
>                                               put_net()
>                                               sock_release();
>                                               server->ssocket = NULL;
>            free_rsp_buf
>      ...
>                                     clean_demultiplex_info
>                                       /* It's only called once here. */
>                                       put_net()
> ```
> 
> When cifs_reconnect() is triggered, the server->ssocket is released
> without a corresponding put_net() for the reference acquired in
> generic_ip_connect() before. it ends up calling generic_ip_connect()
> again to retry get_net(). After that, server->ssocket is set to NULL
> in the error path of generic_ip_connect(), and the net count cannot be
> released in the final clean_demultiplex_info() function.
> 
> 2. Potential use-after-free
> 
> The current refcounting scheme can lead to a potential use-after-free issue
> in the following scenario:
> 
> ```
>   cifs_do_mount
>     cifs_mount
>       cifs_mount_get_session
>         cifs_get_tcp_session
>           get_net()  /* First get net */
>             ip_connect
>               generic_ip_connect
>                 get_net()
>                 bind_socket
> 	         kernel_bind /* failed */
>                 put_net()
>           /* after out_err_crypto_release label */
>           put_net()
>           /* after out_err label */
>           put_net()
> ```
> 
> In the exception handling process where binding the socket fails, the
> get_net() and put_net() calls are unbalanced, which may cause the
> server->net reference count to drop to zero and be prematurely released.
> 
> To address both issues, this patch ties the netns reference counting to
> the server->ssocket and server lifecycles. The extra reference is now
> acquired when the server or socket is created, and released when the
> socket is destroyed or the server is torn down.
> 
> [1]: https://bugzilla.kernel.org/show_bug.cgi?id=219792
> 
> The Linux kernel CVE team has assigned CVE-2025-22077 to this issue.
> 
> 
> Affected and fixed versions
> ===========================
> 
> 	Issue introduced in 6.6.62 with commit e8c71494181153a134c96da28766a57bd1eac8cb and fixed in 6.6.87 with commit c6b6b8dcef4adf8ee4e439bb97e74106096c71b8
> 	Issue introduced in 6.12 with commit ef7134c7fc48e1441b398e55a862232868a6f0a7 and fixed in 6.12.23 with commit 7d8dfc27d90d41627c0d6ada97ed0ab57b3dae25
> 	Issue introduced in 6.12 with commit ef7134c7fc48e1441b398e55a862232868a6f0a7 and fixed in 6.13.11 with commit 961755d0055e0e96d1849cc0425da966c8a64e53
> 	Issue introduced in 6.12 with commit ef7134c7fc48e1441b398e55a862232868a6f0a7 and fixed in 6.14.2 with commit 476617a4ca0123f0df677d547a82a110c27c8c74
> 	Issue introduced in 6.12 with commit ef7134c7fc48e1441b398e55a862232868a6f0a7 and fixed in 6.15-rc1 with commit 4e7f1644f2ac6d01dc584f6301c3b1d5aac4eaef
> 	Issue introduced in 6.11.9 with commit c7f9282fc27fc36dbaffc8527c723de264a132f8
> 	Issue introduced in 6.6.68 with commit 906807c734ed219dcb2e7bbfde5c4168ed72a3d0
> 
> Please see https://www.kernel.org for a full list of currently supported
> kernel versions by the kernel community.
> 
> Unaffected versions might change over time as fixes are backported to
> older supported kernel versions.  The official CVE entry at
> 	https://cve.org/CVERecord/?id=CVE-2025-22077
> will be updated if fixes are backported, please check that for the most
> up to date information about this issue.
> 
> 
> Affected files
> ==============
> 
> The file(s) affected by this issue are:
> 	fs/smb/client/connect.c
> 
> 
> Mitigation
> ==========
> 
> The Linux kernel CVE team recommends that you update to the latest
> stable kernel version for this, and many other bugfixes.  Individual
> changes are never tested alone, but rather are part of a larger kernel
> release.  Cherry-picking individual commits is not recommended or
> supported by the Linux kernel community at all.  If however, updating to
> the latest release is impossible, the individual changes to resolve this
> issue can be found at these commits:
> 	https://git.kernel.org/stable/c/c6b6b8dcef4adf8ee4e439bb97e74106096c71b8
> 	https://git.kernel.org/stable/c/7d8dfc27d90d41627c0d6ada97ed0ab57b3dae25
> 	https://git.kernel.org/stable/c/961755d0055e0e96d1849cc0425da966c8a64e53
> 	https://git.kernel.org/stable/c/476617a4ca0123f0df677d547a82a110c27c8c74
> 	https://git.kernel.org/stable/c/4e7f1644f2ac6d01dc584f6301c3b1d5aac4eaef
> 


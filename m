Received: from fout-a7-smtp.messagingengine.com (fout-a7-smtp.messagingengine.com [103.168.172.150])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D9D4422A80C
	for <linux-kernel@vger.kernel.org>; Thu, 19 Jun 2025 11:24:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.150
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750332259; cv=none; b=CufC+YlgR1Q2hkNgFdx+Y1mFcZD08/JnSb8yU4CT5g0EMRV6EeMQgv67TYc+yFIYsX9jieDaF7Le1VRgCPkxVfuOLL0hobTbrhzI/yk1qT3E7k9cP0f+G+ExvTWv1SVPHOqrJ4wxPcH16YOt+DeC2BKTf7IryoWSFTLLd2mtEUI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750332259; c=relaxed/simple;
	bh=nbFUlruIfhnKCgAKo39jbc7ken3leedBDx5Yo04kI8Q=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=RybXEulYjjvoYgzduXNeUDcJ2nlyJxuOp4MnjIxY3WP69M6GrNgE54DereG4QsjpFiX9EAEdRrQB4o+XdkItQD+CvknR27V+l09ELNynxnvsnV6IEMZ+8nu1afT/lRB3zmAGm7EJgnOI7hnJ34KPzdqEWuZnq07fsW+8k9wdhAw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=invisiblethingslab.com; spf=pass smtp.mailfrom=invisiblethingslab.com; dkim=pass (2048-bit key) header.d=invisiblethingslab.com header.i=@invisiblethingslab.com header.b=Dgpab3/G; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=OGV6uCSh; arc=none smtp.client-ip=103.168.172.150
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=invisiblethingslab.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=invisiblethingslab.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=invisiblethingslab.com header.i=@invisiblethingslab.com header.b="Dgpab3/G";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="OGV6uCSh"
Received: from phl-compute-01.internal (phl-compute-01.phl.internal [10.202.2.41])
	by mailfout.phl.internal (Postfix) with ESMTP id 0254C1380645;
	Thu, 19 Jun 2025 07:24:16 -0400 (EDT)
Received: from phl-mailfrontend-02 ([10.202.2.163])
  by phl-compute-01.internal (MEProxy); Thu, 19 Jun 2025 07:24:16 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	invisiblethingslab.com; h=cc:cc:content-type:content-type:date
	:date:from:from:in-reply-to:message-id:mime-version:reply-to
	:subject:subject:to:to; s=fm1; t=1750332255; x=1750418655; bh=6Z
	9/mjif2iMkkUhK1vyWLAD+QEZ+bviX4PNajj4c42s=; b=Dgpab3/GOuMyX9/jSg
	F3FmaXxamBjqLIYewtOB6WABjs4BGVvVkaOZWL+4mfo5626KBmc8DOtFdvRt/ABB
	nR9TE1ZFGkSOhTeXwuZEZWH8AMPfzol/NH0OII3RoqT6QcjKxILINKMOS9WANaMJ
	gJcN2bGS1i5WDT4JoRfJS8sQ1N4M9oqQg4pAMyFEtGJ+sygKnxxh0zqrFf4M0O0m
	xFNWjdA30hzkZzLTTp/9IfalY8dz9NM/98+bNlqUEi7+BMFy6nuZ+HmdUMNvIc4T
	lSIs32B4BTga3DASCiw0au1OrrCuGyarr2umSg3NzRGfSYKeKE0t9YN9akYmkW1N
	2oUA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:message-id
	:mime-version:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1750332255; x=
	1750418655; bh=6Z9/mjif2iMkkUhK1vyWLAD+QEZ+bviX4PNajj4c42s=; b=O
	GV6uCShgtArJmrkRkGok5MwtYYtMo1JAbP7jyLFIAHtpM8yS82+CBctGjw9IUowF
	jj/oNQ27/Dt1s9rnps9nGjP8gCZHJOBEIgD8NBHQJGNQD8PMqiVl9WBOepxA01EO
	oEMXE8IOWGKjP9ZKIrP7zkGTFklu1NbYetarcX9rGhZfY07kVGthii9C8qVhnMba
	fB07vVj4OcQWnnonxRspksN+4XBthEHUJeEA1V2kOSoPvVx7yeYaMOnR1r7M3Qg3
	jVOi0MmHM7Wv01GuGMwoAhI1RLJ18BYxWLUbzD/CVuVDAV9RIJIS7uj6j0dFynWq
	0BHtDSAkdOl+MargT794g==
X-ME-Sender: <xms:X_NTaBaPjNONpkSmIZkqi1IiS438LhkxsrpgXeCqDT2Fgr114Sq8sQ>
    <xme:X_NTaIbMpJ8aE_eoaK2bSj1bfwvJAKhI1n9dQ9_vbKiRVevXKKpyKOsTb-sipKLTI
    L8oY135ZBfNAw>
X-ME-Received: <xmr:X_NTaD_R079ZGrQNRwfekWdG3r4Qp8GmvbwEyDXqFrg0dBpk9wiMHTbESixc22McbLVY_FNtxSDtJAPcWJZoGO8J6tKHChV3gSo>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtddvgdehfeelucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfurfetoffkrfgpnffqhgenuceurghi
    lhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurh
    epfffhvfevuffkgggtugesghdtreertddtjeenucfhrhhomhepofgrrhgvkhcuofgrrhgt
    iiihkhhofihskhhiqdfikphrvggtkhhiuceomhgrrhhmrghrvghksehinhhvihhsihgslh
    gvthhhihhnghhslhgrsgdrtghomheqnecuggftrfgrthhtvghrnhepjeehgfdvfffhffdv
    ffdvfeefueevgefgiedukeegveffteffhffggeehueejuedunecuffhomhgrihhnpehqvg
    hmuhdrohhrghdpghhithhhuhgsrdgtohhmpdhquhgsvghsqdhoshdrohhrghenucevlhhu
    shhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehmrghrmhgrrhgvkh
    esihhnvhhishhisghlvghthhhinhhgshhlrggsrdgtohhmpdhnsggprhgtphhtthhopeeh
    pdhmohguvgepshhmthhpohhuthdprhgtphhtthhopegurghvvgdrhhgrnhhsvghnsehlih
    hnuhigrdhinhhtvghlrdgtohhmpdhrtghpthhtoheplhhuthhosehkvghrnhgvlhdrohhr
    ghdprhgtphhtthhopehpvghtvghriiesihhnfhhrrgguvggrugdrohhrghdprhgtphhtth
    hopeigvghnqdguvghvvghlsehlihhsthhsrdigvghnphhrohhjvggtthdrohhrghdprhgt
    phhtthhopehlihhnuhigqdhkvghrnhgvlhesvhhgvghrrdhkvghrnhgvlhdrohhrgh
X-ME-Proxy: <xmx:X_NTaPodJsirzMx_MgoWinfB7dE8MWdOUpc9uL6N_5RwlfYY4xggHw>
    <xmx:X_NTaMoj5SFrCkDBWXtK-fY6xRFAXtNbdEvMRYi_XUs1ZJosCCRT6w>
    <xmx:X_NTaFRV1veNxV-QeZ-dsIvpzAzsoyijPZzNb0wcftXj0QpueBmCQw>
    <xmx:X_NTaEpe-Qqz5qdkTkAEz5Xfr9e_L3TSh6dHy7gQoR0AtLmZO-9lAA>
    <xmx:X_NTaOEcIGCXYcu7L_-ewz-G5SBed97VhGuWZdP5GMIj5W_95uyh2RHx>
Feedback-ID: i1568416f:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 19 Jun 2025 07:24:14 -0400 (EDT)
Date: Thu, 19 Jun 2025 13:24:13 +0200
From: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: Dave Hansen <dave.hansen@linux.intel.com>,
	Andy Lutomirski <luto@kernel.org>,
	Peter Zijlstra <peterz@infradead.org>
Cc: xen-devel <xen-devel@lists.xenproject.org>,
	linux-kernel@vger.kernel.org
Subject: Xen PV dom0 "tried to execute NX-protected page" when running nested
 in KVM - 6.15 regression
Message-ID: <aFPzXVl1pn1LtwoJ@mail-itl>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="C//JR/PbyCGvU4J9"
Content-Disposition: inline


--C//JR/PbyCGvU4J9
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Date: Thu, 19 Jun 2025 13:24:13 +0200
From: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: Dave Hansen <dave.hansen@linux.intel.com>,
	Andy Lutomirski <luto@kernel.org>,
	Peter Zijlstra <peterz@infradead.org>
Cc: xen-devel <xen-devel@lists.xenproject.org>,
	linux-kernel@vger.kernel.org
Subject: Xen PV dom0 "tried to execute NX-protected page" when running nested
 in KVM - 6.15 regression

Hi,

With Linux 6.15.2 I got a crash like below. It worked fine with Linux
6.14.11. Furthermore, the failure seems to be hardware-dependent. It
happens when running on Intel Core i9-13900H, but does not happen when
running on Intel Xeon E5-2620v4 (in both cases QEMU uses -cpu host).

The crash:
[    1.121608] ITS: Mitigation: Aligned branch/return thunks
[    1.122604] x86/fpu: Supporting XSAVE feature 0x001: 'x87 floating point=
 registers'
[    1.123656] x86/fpu: Supporting XSAVE feature 0x002: 'SSE registers'
[    1.124603] x86/fpu: Supporting XSAVE feature 0x004: 'AVX registers'
[    1.125603] x86/fpu: xstate_offset[2]:  576, xstate_sizes[2]:  256
[    1.126599] x86/fpu: Enabled xstate features 0x7, context size is 832 by=
tes, using 'compacted' format.
[    1.128391] kernel tried to execute NX-protected page - exploit attempt?=
 (uid: 0)
[    1.128391] kernel tried to execute NX-protected page - exploit attempt?=
 (uid: 0)
[    1.128391] BUG: unable to handle page fault for address: ffffffffc00007=
60
[    1.128391] #PF: supervisor instruction fetch in kernel mode
[    1.128391] #PF: error_code(0x0011) - permissions violation
[    1.128391] PGD 2433067 P4D 2433067 PUD 2435067 PMD 1002b7067 PTE 801000=
01002b6067
[    1.128391] Oops: Oops: 0011 [#1] SMP NOPTI
[    1.128391] CPU: 0 UID: 0 PID: 0 Comm: swapper/0 Not tainted 6.15.2-1.qu=
bes.fc41.x86_64 #1 PREEMPT(full)=20
[    1.128391] Hardware name: QEMU Standard PC (Q35 + ICH9, 2009), BIOS rel=
-1.16.3-2-gc13ff2cd-prebuilt.qemu.org 04/01/2014
[    1.128391] RIP: e030:0xffffffffc0000760
[    1.128391] Code: e0 cc ff e0 cc ff e0 cc cc cc cc cc cc cc cc cc cc cc =
cc cc cc cc cc cc cc cc cc cc cc cc cc cc cc cc cc cc cc cc cc cc cc cc <ff=
> e0 cc ff e0 cc ff e0 cc ff e0 cc ff e0 cc ff e0 cc ff e0 cc ff
[    1.128391] RSP: e02b:ffffc90040003b60 EFLAGS: 00010002
[    1.128391] RAX: ffffffff80f02190 RBX: ffffffff834da1b5 RCX: 00000000fff=
fffff
[    1.128391] RDX: ffffc90040003b78 RSI: 0000000000000001 RDI: ffff8881002=
9f400
[    1.128391] RBP: ffffc90040003b78 R08: 0000000000000000 R09: 205d3139333=
83231
[    1.128391] R10: 0000000000000029 R11: 000000006e72656b R12: 00000000000=
0000a
[    1.128391] R13: ffffffff834da1b5 R14: 0000000000000000 R15: ffff8881002=
9f400
[    1.128391] FS:  0000000000000000(0000) GS:ffff8881fc9c8000(0000) knlGS:=
0000000000000000
[    1.128391] CS:  e030 DS: 0000 ES: 0000 CR0: 0000000080050033
[    1.128391] CR2: ffffffffc0000760 CR3: 000000000242e000 CR4: 00000000000=
50660
[    1.128391] Call Trace:
[    1.128391]  <IRQ>
[    1.128391]  ? vt_console_print+0x2e6/0x500
[    1.128391]  ? console_emit_next_record+0x110/0x1b0
[    1.128391]  ? console_flush_all+0x1d5/0x2a0
[    1.128391]  ? console_unlock+0x7c/0x140
[    1.128391]  ? vprintk_emit+0x278/0x2d0
[    1.128391]  ? _printk+0x6b/0x90
[    1.128391]  ? show_fault_oops+0x17c/0x1b0
[    1.128391]  ? page_fault_oops+0x11b/0x160
[    1.128391]  ? exc_page_fault+0x189/0x1a0
[    1.128391]  ? asm_exc_page_fault+0x26/0x30
[    1.128391]  ? __pfx_evtchn_fifo_clear_pending+0x10/0x10
[    1.128391]  ? handle_percpu_irq+0x30/0x60
[    1.128391]  ? generic_handle_irq+0x3c/0x60
[    1.128391]  ? __evtchn_fifo_handle_events+0x1df/0x2c0
[    1.128391]  ? xen_evtchn_do_upcall+0x6d/0xc0
[    1.128391]  ? __xen_pv_evtchn_do_upcall+0x26/0x40
[    1.128391]  ? xen_pv_evtchn_do_upcall+0x84/0xa0
[    1.128391]  </IRQ>
[    1.128391]  <TASK>
[    1.128391]  ? exc_xen_hypervisor_callback+0x8/0x20
[    1.128391]  ? print_bpf_insn+0x322/0xb70
[    1.128391]  ? xen_save_fl_direct+0xf/0x20
[    1.128391]  ? text_poke_early+0x35/0xa0
[    1.128391]  ? print_bpf_insn+0x322/0xb70
[    1.128391]  ? apply_retpolines+0x1ad/0x1d0
[    1.128391]  ? print_bpf_insn+0x322/0xb70
[    1.128391]  ? print_bpf_insn+0x331/0xb70
[    1.128391]  ? print_bpf_insn+0x328/0xb70
[    1.128391]  ? alternative_instructions+0x56/0x200
[    1.128391]  ? arch_cpu_finalize_init+0x80/0x120
[    1.128391]  ? start_kernel+0x3f5/0x490
[    1.128391]  ? x86_64_start_reservations+0x24/0x30
[    1.128391]  ? xen_start_kernel+0x6d7/0x6f0
[    1.128391]  ? startup_xen+0x1b/0x20
[    1.128391]  </TASK>
[    1.128391] Modules linked in:
[    1.128391] CR2: ffffffffc0000760
[    1.128391] ---[ end trace 0000000000000000 ]---
[    1.128391] RIP: e030:0xffffffffc0000760
[    1.128391] Code: e0 cc ff e0 cc ff e0 cc cc cc cc cc cc cc cc cc cc cc =
cc cc cc cc cc cc cc cc cc cc cc cc cc cc cc cc cc cc cc cc cc cc cc cc <ff=
> e0 cc ff e0 cc ff e0 cc ff e0 cc ff e0 cc ff e0 cc ff e0 cc ff
[    1.128391] RSP: e02b:ffffc90040003b60 EFLAGS: 00010002
[    1.128391] RAX: ffffffff80f02190 RBX: ffffffff834da1b5 RCX: 00000000fff=
fffff
[    1.128391] RDX: ffffc90040003b78 RSI: 0000000000000001 RDI: ffff8881002=
9f400
[    1.128391] RBP: ffffc90040003b78 R08: 0000000000000000 R09: 205d3139333=
83231
[    1.128391] R10: 0000000000000029 R11: 000000006e72656b R12: 00000000000=
0000a
[    1.128391] R13: ffffffff834da1b5 R14: 0000000000000000 R15: ffff8881002=
9f400
[    1.128391] FS:  0000000000000000(0000) GS:ffff8881fc9c8000(0000) knlGS:=
0000000000000000
[    1.128391] CS:  e030 DS: 0000 ES: 0000 CR0: 0000000080050033
[    1.128391] CR2: ffffffffc0000760 CR3: 000000000242e000 CR4: 00000000000=
50660
[    1.128391] Kernel panic - not syncing: Fatal exception in interrupt

Full console log: https://gist.github.com/marmarek/7a4ad628c7bf76339aed79ff=
4478f8ea

Full QEMU command (if relevant) can be seen at https://openqa.qubes-os.org/=
tests/143860/logfile?filename=3Dautoinst-log.txt

At this point, I'm not even sure who to report it to... In an earlier
attempt I've got stack trace full of ext4 functions, which is unlikely
relevant (see revisions of the gist linked above). I'll try to bisect
this, but due to hardware-dependent nature it will take some time as I
have a bit limited access to that hardware.

--=20
Best Regards,
Marek Marczykowski-G=C3=B3recki
Invisible Things Lab

--C//JR/PbyCGvU4J9
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhrpukzGPukRmQqkK24/THMrX1ywFAmhT810ACgkQ24/THMrX
1yzzUgf6Av5gJw8K4okkye7Visd73CpLE89qp7hDSv68SJVgW2jsr16One3mWe6P
2jdd130SzYRE6MbdvM6Yoh0ciJdp+S2j0AT0Tkr5pFmNv/qGwd1hm1NFtq/fxnhS
JgYW7SVMu4dJPBm8PAqxgaktcJ/DjHsXGI2YqpBXd2xENxyPzjMc4ZdNPQrf9H+I
OOSIVYYGNNvPH2T3CSdAJ7whq8Ns8kN64NkjqsTjpKWXojKAkPLfsvneZcT8vT3s
hIcrrvRMYJdKXUNxN56CJPVOeI/eajqY6eo7QRf3vUq20QGShrdOMGhRSpva1qHH
4VSIfLhg/cMBJixR4xOjv4hYTXbn0w==
=cP1H
-----END PGP SIGNATURE-----

--C//JR/PbyCGvU4J9--

Received: from smtp-fw-52005.amazon.com (smtp-fw-52005.amazon.com [52.119.213.156])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 65F371A76BC
	for <linux-kernel@vger.kernel.org>; Fri,  4 Jul 2025 18:11:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=52.119.213.156
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751652682; cv=none; b=P1xmphqgG/PD853HzGHFiBvEtbTYEXMf02bXqIkfjl1NNun/ztT33670ke0xEGjYd7KHgJKA37Hk7KQy2xgMWdnAjbfidd4Hv+MqOndzJ+2Seu+KA4kiC1VuVppEa8D+YsdLJUsICG6SuPK7hGyJ+s0mSP0BisG2sFIWitzKGu8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751652682; c=relaxed/simple;
	bh=872BY+1ahn9Qyggyr6l/Ta8Jy7Rz097g0IPC5KN2KSg=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=dDL0j82STCfHH1e+FIPZnOZLh9WrFIRRgr5J0G7deksHUgFVOSBmDJfH7Df1Lt+qrsOuP27k/E/xxzjb8jBz5FdhHPMaMToi7TMnQgbiGN4oCqPzddQnhS095xofF2AFs7AcfeEiIhBt2+d5bT7YEb7CZJFdGkeTr11oywADVaQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amazon.com; spf=pass smtp.mailfrom=amazon.co.jp; dkim=pass (2048-bit key) header.d=amazon.com header.i=@amazon.com header.b=QMsag+MK; arc=none smtp.client-ip=52.119.213.156
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amazon.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amazon.co.jp
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=amazon.com header.i=@amazon.com header.b="QMsag+MK"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=amazon.com; i=@amazon.com; q=dns/txt; s=amazoncorp2;
  t=1751652681; x=1783188681;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=wTOtW5rGXf1q+l2Swc8p+Gzo0yomslN/7E7EHuxYMSY=;
  b=QMsag+MKl9PSKGgFFomgya1K486E1sVz+0hx4r/HfJzhlC/LeijjOIJT
   QLVN9j80/C0tfyXv09C/aBKWMNmJUJFfM5PSDCRiLoKIT09LYtSt1ID0H
   BHsd5cQGHeGV+EOG43DzfwLkebey+IUjLqEZkzIZ9e5aKfRSqdNDPHZtJ
   STLobN6GICysEHAI3TH4ceEca9UsiBuXvlzdiqA44PvdhCUh67wWv+I1Q
   w2x1D74Pv11ubtLlTkcdcKt3Nn7gVksvH5ji+VDC88r8S7+LsbXNTjQTP
   driMur9SD6HB9SZdAeMZ3ierOm4ySvMTeLc5w4lIOCqTekiHavTbntzI+
   Q==;
X-IronPort-AV: E=Sophos;i="6.16,287,1744070400"; 
   d="scan'208";a="761165871"
Received: from iad12-co-svc-p1-lb1-vlan3.amazon.com (HELO smtpout.prod.us-west-2.prod.farcaster.email.amazon.dev) ([10.43.8.6])
  by smtp-border-fw-52005.iad7.amazon.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Jul 2025 18:11:18 +0000
Received: from EX19MTAUWC002.ant.amazon.com [10.0.21.151:61709]
 by smtpin.naws.us-west-2.prod.farcaster.email.amazon.dev [10.0.12.232:2525] with esmtp (Farcaster)
 id d4074c0c-4932-4cc6-80c2-693e122bdb63; Fri, 4 Jul 2025 18:11:17 +0000 (UTC)
X-Farcaster-Flow-ID: d4074c0c-4932-4cc6-80c2-693e122bdb63
Received: from EX19D001UWA001.ant.amazon.com (10.13.138.214) by
 EX19MTAUWC002.ant.amazon.com (10.250.64.143) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id 15.2.1544.14;
 Fri, 4 Jul 2025 18:11:16 +0000
Received: from b0be8375a521.amazon.com (10.37.245.11) by
 EX19D001UWA001.ant.amazon.com (10.13.138.214) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id 15.2.1544.14;
 Fri, 4 Jul 2025 18:11:15 +0000
From: Kohei Enju <enjuk@amazon.com>
To: <syzbot+c52293513298e0fd9a94@syzkaller.appspotmail.com>
CC: <abbotti@mev.co.uk>, <hsweeten@visionengravers.com>,
	<linux-kernel@vger.kernel.org>, <syzkaller-bugs@googlegroups.com>
Subject: Re: [syzbot] [kernel?] UBSAN: shift-out-of-bounds in das16m1_attach
Date: Sat, 5 Jul 2025 03:10:32 +0900
Message-ID: <20250704181107.33961-1-enjuk@amazon.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <6867ff4d.a70a0220.29cf51.0023.GAE@google.com>
References: <6867ff4d.a70a0220.29cf51.0023.GAE@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-ClientProxiedBy: EX19D038UWC002.ant.amazon.com (10.13.139.238) To
 EX19D001UWA001.ant.amazon.com (10.13.138.214)

On Fri, 04 Jul 2025 09:20:29 -0700, syzbot wrote:=0D
=0D
> Hello,=0D
> =0D
> syzbot found the following issue on:=0D
> =0D
> HEAD commit:    4c06e63b9203 Merge tag 'for-6.16-rc4-tag' of git://git.ke=
r..=0D
> git tree:       upstream=0D
> console output: https://syzkaller.appspot.com/x/log.txt?x=3D102c73d458000=
0=0D
> kernel config:  https://syzkaller.appspot.com/x/.config?x=3D5ba6cef8f153b=
feb=0D
> dashboard link: https://syzkaller.appspot.com/bug?extid=3Dc52293513298e0f=
d9a94=0D
> compiler:       gcc (Debian 12.2.0-14) 12.2.0, GNU ld (GNU Binutils for D=
ebian) 2.40=0D
> syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=3D166c6c8c580=
000=0D
> C reproducer:   https://syzkaller.appspot.com/x/repro.c?x=3D142c73d458000=
0=0D
> =0D
> Downloadable assets:=0D
> disk image (non-bootable): https://storage.googleapis.com/syzbot-assets/d=
900f083ada3/non_bootable_disk-4c06e63b.raw.xz=0D
> vmlinux: https://storage.googleapis.com/syzbot-assets/15f2393c96b6/vmlinu=
x-4c06e63b.xz=0D
> kernel image: https://storage.googleapis.com/syzbot-assets/44c28e8ae1a0/b=
zImage-4c06e63b.xz=0D
> =0D
> IMPORTANT: if you fix the issue, please add the following tag to the comm=
it:=0D
> Reported-by: syzbot+c52293513298e0fd9a94@syzkaller.appspotmail.com=0D
> =0D
> UBSAN: shift-out-of-bounds in drivers/comedi/drivers/das16m1.c:525:9=0D
> shift exponent 67108867 is too large for 32-bit type 'int'=0D
> CPU: 0 UID: 0 PID: 6101 Comm: syz.0.16 Not tainted 6.16.0-rc4-syzkaller-0=
0123-g4c06e63b9203 #0 PREEMPT(full) =0D
> Hardware name: QEMU Standard PC (Q35 + ICH9, 2009), BIOS 1.16.3-debian-1.=
16.3-2~bpo12+1 04/01/2014=0D
> Call Trace:=0D
>  <TASK>=0D
>  __dump_stack lib/dump_stack.c:94 [inline]=0D
>  dump_stack_lvl+0x16c/0x1f0 lib/dump_stack.c:120=0D
>  ubsan_epilogue lib/ubsan.c:233 [inline]=0D
>  __ubsan_handle_shift_out_of_bounds+0x27f/0x420 lib/ubsan.c:494=0D
>  das16m1_attach.cold+0x19/0x1e drivers/comedi/drivers/das16m1.c:525=0D
>  comedi_device_attach+0x3b3/0x900 drivers/comedi/drivers.c:996=0D
>  do_devconfig_ioctl+0x1a7/0x580 drivers/comedi/comedi_fops.c:855=0D
>  comedi_unlocked_ioctl+0x15bb/0x2e90 drivers/comedi/comedi_fops.c:2136=0D
>  vfs_ioctl fs/ioctl.c:51 [inline]=0D
>  __do_sys_ioctl fs/ioctl.c:907 [inline]=0D
>  __se_sys_ioctl fs/ioctl.c:893 [inline]=0D
>  __x64_sys_ioctl+0x18b/0x210 fs/ioctl.c:893=0D
>  do_syscall_x64 arch/x86/entry/syscall_64.c:63 [inline]=0D
>  do_syscall_64+0xcd/0x4c0 arch/x86/entry/syscall_64.c:94=0D
>  entry_SYSCALL_64_after_hwframe+0x77/0x7f=0D
> RIP: 0033:0x7f1d8718e929=0D
> Code: ff ff c3 66 2e 0f 1f 84 00 00 00 00 00 0f 1f 40 00 48 89 f8 48 89 f=
7 48 89 d6 48 89 ca 4d 89 c2 4d 89 c8 4c 8b 4c 24 08 0f 05 <48> 3d 01 f0 ff=
 ff 73 01 c3 48 c7 c1 a8 ff ff ff f7 d8 64 89 01 48=0D
> RSP: 002b:00007ffe20aa5098 EFLAGS: 00000246 ORIG_RAX: 0000000000000010=0D
> RAX: ffffffffffffffda RBX: 00007f1d873b5fa0 RCX: 00007f1d8718e929=0D
> RDX: 0000200000000080 RSI: 0000000040946400 RDI: 0000000000000003=0D
> RBP: 00007f1d87210b39 R08: 0000000000000000 R09: 0000000000000000=0D
> R10: 0000000000000000 R11: 0000000000000246 R12: 0000000000000000=0D
> R13: 00007f1d873b5fa0 R14: 00007f1d873b5fa0 R15: 0000000000000003=0D
>  </TASK>=0D
> ---[ end trace ]---=0D
> =0D
> [...] =0D
=0D
A quick grep found similar patterns that could have the same issue.=0D
I think we should validate it->options[1] before shifting, right?=0D
=0D
  $ grep -nrIF "<< it->options[1]" ./drivers/comedi=0D
  ./drivers/comedi/drivers/aio_iiro_16.c:180:     if ((1 << it->options[1])=
 & 0xdcfc) {=0D
  ./drivers/comedi/drivers/das16m1.c:526:     (1 << it->options[1]) & 0xdcf=
c) {=0D
  ./drivers/comedi/drivers/das6402.c:570: if ((1 << it->options[1]) & 0x8ce=
c) {=0D
  ./drivers/comedi/drivers/pcl726.c:331:  if (it->options[1] && (board->irq=
_mask & (1 << it->options[1]))) {=0D
  ./drivers/comedi/drivers/pcl812.c:1152:         if ((1 << it->options[1])=
 & board->irq_bits) {=0D
=0D
#syz test=0D
=0D
diff --git a/drivers/comedi/drivers/das16m1.c b/drivers/comedi/drivers/das1=
6m1.c=0D
index b8ea737ad3d1..1b638f5b5a4f 100644=0D
--- a/drivers/comedi/drivers/das16m1.c=0D
+++ b/drivers/comedi/drivers/das16m1.c=0D
@@ -522,7 +522,8 @@ static int das16m1_attach(struct comedi_device *dev,=0D
 	devpriv->extra_iobase =3D dev->iobase + DAS16M1_8255_IOBASE;=0D
 =0D
 	/* only irqs 2, 3, 4, 5, 6, 7, 10, 11, 12, 14, and 15 are valid */=0D
-	if ((1 << it->options[1]) & 0xdcfc) {=0D
+	if (it->options[1] >=3D 2 && it->options[1] <=3D 15 &&=0D
+	    (1 << it->options[1]) & 0xdcfc) {=0D
 		ret =3D request_irq(it->options[1], das16m1_interrupt, 0,=0D
 				  dev->board_name, dev);=0D
 		if (ret =3D=3D 0)=0D

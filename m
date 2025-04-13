Received: from out162-62-58-211.mail.qq.com (out162-62-58-211.mail.qq.com [162.62.58.211])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ECAF0AD51
	for <linux-kernel@vger.kernel.org>; Sun, 13 Apr 2025 06:17:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=162.62.58.211
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744525041; cv=none; b=LTPdaAanz1VZxjnD0y2zremSEeiDe6ecgsddiIqevGzleZsX6KoTUXVLpaggNANVtIY06OFj6YtzPyTc/FBefeycog1/NpEBbw97+jG1OGrxU8Wud3+j2xn/j83aro3txFcYs0A4jWGgNp7cISaHbbfIMKc/LOljiqhAy23mRms=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744525041; c=relaxed/simple;
	bh=Yoq4L1+8A7XrTAZFoddY8DSgifS75oyCOY4YYU44hzI=;
	h=Message-ID:From:To:Cc:Subject:Date:In-Reply-To:References:
	 MIME-Version; b=IwlPQ2EpiT5hhDKYPLCa7q+KgqgrzVC6j3IhiYbv3NkRBgYDqeAy2NGaAFNvLY84SNeGDiRwvj2XHuEYUvIIJa9NuayeHpuFoH5ju6DNL2974wmn3mxADRMy6NLRGGODZUCiVf4ln1TfsTNCgSUxLgkaqDPR0PORjZwYLjtFDs0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=qq.com; spf=pass smtp.mailfrom=qq.com; dkim=pass (1024-bit key) header.d=qq.com header.i=@qq.com header.b=LD66cF0R; arc=none smtp.client-ip=162.62.58.211
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=qq.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=qq.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=qq.com header.i=@qq.com header.b="LD66cF0R"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qq.com; s=s201512;
	t=1744524727; bh=2yvmZAuH9j25eTkS6E+NJjKnimW3QAVF9M+qJhAohyg=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=LD66cF0RAdglWmaSxDnZ9O4GFeHpk74cT9ubTDeCVSBckeoNTy6fU4J9UQV2Dy4Ed
	 rDYQe0Po4cun1y0iNRZtEHAdxb5HLC5dhfzNpMRPjIY1U5gjw78tai/CFfI/xevrZb
	 jBdUipG1R45GjPm6jIV2j/aVIcwJdjCgSlGnun2k=
Received: from pek-lxu-l1.wrs.com ([114.244.57.157])
	by newxmesmtplogicsvrsza36-0.qq.com (NewEsmtp) with SMTP
	id 30523E86; Sun, 13 Apr 2025 14:12:05 +0800
X-QQ-mid: xmsmtpt1744524725trffrrpcl
Message-ID: <tencent_2A0DBB8A33499E9B1B374B021B8925D5BA08@qq.com>
X-QQ-XMAILINFO: NyTsQ4JOu2J2cFDr+85NpTYteCgurxpNhlOOuE+OAdPGDk/1u57mlWB9iRWYRC
	 hGpP4qCp42XkMrrEY+YfB/Irio0lBESFfzVfhOo5B2cIHG/8cSJO1z7Q+DmiO2c+sDghCgO5xEbZ
	 33KAPTt2v3k/sj3SZmll/g7LGe+SwhuETnKikNxsoVKj0Sbk+421ttoF/7emqNO1nZNsQn1tYFNx
	 DUKkYyISIxEYX0c0myBRps372kFfX0PNl5cQfNDB7quDR7Hm0i/PmFnI/a6Ht5tI6/Y48IHgUFVj
	 Kml5i5mwT45ORmA9HwsaHO6JrMNkr/1AzaLiEWU2ArDRRgwOyMeVbJuz/hWy4JMwSkP0brqpFlM9
	 edXsBAJOT005xL7aOL7/A+eC01N+Lkw8G2mz3bazfixKJzvt1DpiJZhlxb6X/le1vysnfg0kig+N
	 n369DOZX4N+Ln2iGh26rF75kvkrfwfM/uBt6tahHJ1JEAsZrQ/JREgp4Bnqs9vYe6NsoNVL5Cw3o
	 C8QDL8ksGX1hw0+nF/O5Mf/AObthTB4YAiPyGJRGHtyBTjA3KJadYT+o3aqoWe3BiftpFnfYCvJT
	 2yQx0iNdVnv0VchaBiyTzq9yHPMdN30MStfl5pvoZ1SmIIjmVQIDG/fFBH6N9/2L+z88voXE0ZPC
	 S26YNGPoN+gwOLEcTRHwwxjY5cWisi82XTC/4/Iz/rdjUTjsZrfeUEVpTvsNTEnI0gkLHcDr9wAH
	 R9QLlb/7R1cYUBg3ZKb7V2b0piJINCTm8Lq1nsLiUYgRy4C5tKri8S2UrN3+XCfwTVwM/LVAumA1
	 u+RUcFsBXnWT3dqBvzz5vaLYg8QynqCBiE/F2PbUfw+pnlEm8zinYMrGf2/tIIQdng4vx8ar0Mjo
	 W8tDh/UPta1M7oZGLzzIqf5GOub9F4rNthlKYRbEkiVqCylbrMpWs=
X-QQ-XMRINFO: OWPUhxQsoeAVDbp3OJHYyFg=
From: Edward Adam Davis <eadavis@qq.com>
To: syzbot+5c042fbab0b292c98fc6@syzkaller.appspotmail.com
Cc: dhowells@redhat.com,
	linux-afs@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	marc.dionne@auristor.com,
	syzkaller-bugs@googlegroups.com
Subject: [PATCH] afs: Set vllist to NULL if addr parsing fails
Date: Sun, 13 Apr 2025 14:12:05 +0800
X-OQ-MSGID: <20250413061204.184651-2-eadavis@qq.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <67fb3265.050a0220.2c5fcf.001a.GAE@google.com>
References: <67fb3265.050a0220.2c5fcf.001a.GAE@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

syzbot reported a bug in in afs_put_vlserverlist. [1]

Because afs_parse_text_addrs() parses incorrectly, its return value -EINVAL
is assigned to vllist, which results in -EINVAL being used as the vllist
address when afs_put_vlserverlist() is executed.

Set the vllist value to NULL when a parsing error occurs to avoid this issue.

[1]
kAFS: bad VL server IP address
BUG: unable to handle page fault for address: fffffffffffffffa
#PF: supervisor write access in kernel mode
#PF: error_code(0x0002) - not-present page
PGD e186067 P4D e186067 PUD e188067 PMD 0
Oops: Oops: 0002 [#1] SMP KASAN PTI
CPU: 1 UID: 0 PID: 5834 Comm: syz-executor362 Not tainted 6.15.0-rc1-syzkaller-00025-gbec7dcbc242c #0 PREEMPT(full)
Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS Google 02/12/2025
RIP: 0010:arch_atomic_fetch_add arch/x86/include/asm/atomic.h:93 [inline]
RIP: 0010:raw_atomic_fetch_sub_release include/linux/atomic/atomic-arch-fallback.h:949 [inline]
RIP: 0010:atomic_fetch_sub_release include/linux/atomic/atomic-instrumented.h:401 [inline]
RIP: 0010:__refcount_sub_and_test include/linux/refcount.h:389 [inline]
RIP: 0010:__refcount_dec_and_test include/linux/refcount.h:432 [inline]
RIP: 0010:refcount_dec_and_test include/linux/refcount.h:450 [inline]
RIP: 0010:afs_put_vlserverlist+0x3a/0x220 fs/afs/vl_list.c:67
Code: 53 48 83 ec 18 e8 e6 35 2f fe 48 85 ed 74 43 e8 dc 35 2f fe 4c 8d 65 10 be 04 00 00 00 bb ff ff ff ff 4c 89 e7 e8 76 ad 93 fe <f0> 0f c1 5d 10 31 ff 89 de e8 f8 30 2f fe 85 db 7e 29 e8 af 35 2f
RSP: 0018:ffffc90003e5fae0 EFLAGS: 00010246
RAX: 0000000000000001 RBX: 00000000ffffffff RCX: ffffffff838c071a
RDX: fffffc0000000000 RSI: 0000000000000004 RDI: fffffffffffffffa
RBP: ffffffffffffffea R08: 0000000000000001 R09: fffffbffffffffff
R10: fffffffffffffffd R11: 0000000000000001 R12: fffffffffffffffa
R13: ffffffffffffffea R14: ffff8880216ad700 R15: ffff888034ec2000
FS:  0000555561d3e380(0000) GS:ffff888124ab9000(0000) knlGS:0000000000000000
CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
CR2: fffffffffffffffa CR3: 000000007a922000 CR4: 00000000003526f0
DR0: 0000000000000000 DR1: 0000000000000000 DR2: 0000000000000000
DR3: 0000000000000000 DR6: 00000000fffe0ff0 DR7: 0000000000000400
Call Trace:
 <TASK>
 afs_alloc_cell fs/afs/cell.c:218 [inline]
 afs_lookup_cell+0x12a5/0x1680 fs/afs/cell.c:264
 afs_cell_init+0x17a/0x380 fs/afs/cell.c:386
 afs_proc_rootcell_write+0x21f/0x290 fs/afs/proc.c:247
 proc_simple_write+0x114/0x1b0 fs/proc/generic.c:825
 pde_write fs/proc/inode.c:330 [inline]
 proc_reg_write+0x23d/0x330 fs/proc/inode.c:342
 vfs_write+0x25c/0x1180 fs/read_write.c:682
 ksys_write+0x12a/0x240 fs/read_write.c:736
 do_syscall_x64 arch/x86/entry/syscall_64.c:63 [inline]
 do_syscall_64+0xcd/0x260 arch/x86/entry/syscall_64.c:94
 entry_SYSCALL_64_after_hwframe+0x77/0x7f

Fixes: e2c2cb8ef07a ("afs: Simplify cell record handling")
Reported-by: syzbot+5c042fbab0b292c98fc6@syzkaller.appspotmail.com
Closes: https://syzkaller.appspot.com/bug?extid=5c042fbab0b292c98fc6
Tested-by: syzbot+5c042fbab0b292c98fc6@syzkaller.appspotmail.com
Signed-off-by: Edward Adam Davis <eadavis@qq.com>
---
 fs/afs/cell.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/fs/afs/cell.c b/fs/afs/cell.c
index 0168bbf53fe0..f31359922e98 100644
--- a/fs/afs/cell.c
+++ b/fs/afs/cell.c
@@ -177,6 +177,7 @@ static struct afs_cell *afs_alloc_cell(struct afs_net *net,
 					      VL_SERVICE, AFS_VL_PORT);
 		if (IS_ERR(vllist)) {
 			ret = PTR_ERR(vllist);
+			vllist = NULL;
 			goto parse_failed;
 		}
 
-- 
2.43.0


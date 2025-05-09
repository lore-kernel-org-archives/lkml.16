Received: from out162-62-58-216.mail.qq.com (out162-62-58-216.mail.qq.com [162.62.58.216])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F7EB1F5EA
	for <linux-kernel@vger.kernel.org>; Fri,  9 May 2025 13:29:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=162.62.58.216
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746797360; cv=none; b=tRKH/MCEnwwyxSFmzAtN39VrIruKSXUaG8hMZyBzXVlJGNVxEtSOxrwtBRNAFh2IXBK0C/UTihHlDUeWryC0RXKkCrt90z6qpI2zp/2E8ZfrlSxL9KgmHpGO7knCMZEnPPJ4YrdWZPJQIua8iomMBPdP1C0cXU0yezpsoIkAIQQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746797360; c=relaxed/simple;
	bh=MTj9TZQ+BY6/MTtpPWymofbQAtiZE6jX4vb0VkAfINs=;
	h=Message-ID:From:To:Cc:Subject:Date:In-Reply-To:References:
	 MIME-Version; b=Vks/oMo1buQec/6Srh85RSV2p7Qgf852El+ap4lHWXOc44fMx0uZR+8Z6iaj+pQG4K+hjIlkkcd2XnpepTO4AlGYXtOSvl6arYJ27Ttoq75emsdaKDAgnSv60MLRBIBbQEjcn4A3+fCxGAzYiCDfM45dcFeHTXtfK4bzxWTMQHo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=qq.com; spf=pass smtp.mailfrom=qq.com; dkim=pass (1024-bit key) header.d=qq.com header.i=@qq.com header.b=beQBQ2qo; arc=none smtp.client-ip=162.62.58.216
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=qq.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=qq.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=qq.com header.i=@qq.com header.b="beQBQ2qo"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qq.com; s=s201512;
	t=1746797352; bh=+DfLy9VVsuDjVpvWLwxt7UO8WYmjnWcqaUp0dT6IgNM=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=beQBQ2qotpx6g1ue9FsCei+yZwoJ4/mU4vsXqtTfteog9ENCdyXO37qaRqaTSNfA2
	 Wb86WXNACc55hm2tMhZQHA/d5pbOSAJ4vC/SHY4dgEC3ctTHf6pyNqAxKuc2Wx+ssd
	 fgp13Nfo8M+z0RsIDiRz7CxSo9SLU6Ajcj8MnaMo=
Received: from pek-lxu-l1.wrs.com ([114.244.56.254])
	by newxmesmtplogicsvrszb20-0.qq.com (NewEsmtp) with SMTP
	id 749B16A6; Fri, 09 May 2025 21:29:09 +0800
X-QQ-mid: xmsmtpt1746797349tzxrmp483
Message-ID: <tencent_C2C42D3D6D8894E8E82EECD6CD707A026F0A@qq.com>
X-QQ-XMAILINFO: NFYAXF90nFLabo/cbrihUpamI9TOOJNsyNfnqidw7zjuctTvthsgeuL21sqdDS
	 3bFDSweyBq38xgI4nw33hC/LaYFjBqWcpgI1mq1RypBOTqii/BmBJs0T940hSIeSVgEH/DKADCLL
	 o8mXj1iOZoBqgSekVZA4Xfg3um/jVFtAi7wj9Lv4Ki9Kn8TSg51dnRTYFapFLsqXz/nutXDi8MmM
	 wlUleAZtJ/WlesznqlCzwd67mUvhF0S6SGZh4ZWtKQF5NVjMaETaW750FtjK/frg/lO6TP8TXJTC
	 VZVFZSfv3aLq7sDb0jhB+E2/u5ByzqFHvZT290lWfuaJA9fV1j89T7i7NloAsV6kWxDD3QoBoUy/
	 m29bmAfK9FmCQdaTtVVFs8T/2eLp+iTrZ627J1U9AKc82vE7zlkCKSs9ilxLksQSfgzTq/yfOwyV
	 4gNfN3xmWPL2OmxQjYw628FZMeTnKopibhwUD9/fsAvAHHJ6GkuJs7Ot0876PLkOYdlHf7+FcuDT
	 FR5yBZo28eIQ3cqDJ+YIQN7FslSXJh+6Qpzjr7Lf6P15XNUW3Zzex1MrCjmn2INBXY18WoWcHnYi
	 i8XJTfGzD8dO2HIz21eoo3rIZ0YZXNYrkv2LzfIwUE6FlPwCYH5jtV7VXycugkqGOyoWKExm0bGT
	 48P0oxUG6U7TCWGF5vk6SWajqoWKlATp0uBC8W3tTDP0XLD18cMZQREb92YRsoDT7SRvhvRUfIGe
	 bjJ2YqI29pGDbyvTnaqxaS/FXTY0L3/YHBfT5FZaLXaT5AnrEwwvWbvPOKDead1YGpC+c7W4ufFi
	 r/4XL04ypNCg7oj7dzAt+2lmUTMLOUAujnNtM9+TEorrKWCphtoe+1xwRwXyKPGHnp0/9WmB0EFB
	 D49I0m+bJofMxOOL0I/TQyrqOGMjBFG2hZBdozK6haDx4j6JGmizf65EwnY0zdcb46jNhlyDE9
X-QQ-XMRINFO: Nq+8W0+stu50PRdwbJxPCL0=
From: Edward Adam Davis <eadavis@qq.com>
To: syzbot+81394db39b0e2ed2db06@syzkaller.appspotmail.com
Cc: linux-kernel@vger.kernel.org,
	syzkaller-bugs@googlegroups.com
Subject: Re: [syzbot] [nilfs?] possible deadlock in nilfs_segctor_construct
Date: Fri,  9 May 2025 21:29:10 +0800
X-OQ-MSGID: <20250509132909.3626297-2-eadavis@qq.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <681cda41.050a0220.a19a9.0118.GAE@google.com>
References: <681cda41.050a0220.a19a9.0118.GAE@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

#syz test

diff --git a/fs/nilfs2/segment.c b/fs/nilfs2/segment.c
index 83970d97840b..d3076015771f 100644
--- a/fs/nilfs2/segment.c
+++ b/fs/nilfs2/segment.c
@@ -2582,8 +2582,8 @@ static void nilfs_segctor_thread_construct(struct nilfs_sc_info *sci, int mode)
 {
 	struct nilfs_transaction_info ti;
 
-	nilfs_transaction_lock(sci->sc_super, &ti, 0);
 	nilfs_segctor_construct(sci, mode);
+	nilfs_transaction_lock(sci->sc_super, &ti, 0);
 
 	/*
 	 * Unclosed segment should be retried.  We do this using sc_timer.


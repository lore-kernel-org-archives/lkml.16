Received: from mail3-164.sinamail.sina.com.cn (mail3-164.sinamail.sina.com.cn [202.108.3.164])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D2CD54723
	for <linux-kernel@vger.kernel.org>; Fri,  4 Jul 2025 23:46:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.108.3.164
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751672777; cv=none; b=OGYiNcdaHc3OucEimOhZCsnfNj3ogEX5a4SZU1/l7TW5ROFA6agDD1fh0L8MTZsVXSYdxQA0vRzwTQCbzr+AtG8ANuV2s35jrX37NZ4/3X9OfYizY7AYO4F9WTxgBUXwjApwo+A4uOJmmqxuWuGYnv0xBBtTMx0vbGfpQJnnXkw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751672777; c=relaxed/simple;
	bh=OlXpvVzublmpzcZs1WXLlpHn8HUh9C22Ev/qmySCF2M=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=k/qsehPsSZoIv4kbHfu2Ypxn4XYCLN4bUFuJ4lB2BzaXN7eVL0elL7V+ZF67Cf31//7wds20q+biq0V9uLybIGXRP008tuSrx+6gKlYhCB+zCwSb9No3Zi24oCkrNYwz9vNZjAYSOxCaqB2lpO0TjUC/YZErLyCqpFxAIJDHUMQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sina.com; spf=pass smtp.mailfrom=sina.com; dkim=pass (1024-bit key) header.d=sina.com header.i=@sina.com header.b=jbYad3TU; arc=none smtp.client-ip=202.108.3.164
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sina.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sina.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=sina.com header.i=@sina.com header.b="jbYad3TU"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sina.com; s=201208; t=1751672772;
	bh=vxGDDAIghtkSB0NURMJX0uAmy6KtjeRVKcUI16aLrBU=;
	h=From:Subject:Date:Message-ID;
	b=jbYad3TUM6GODyHkP4O2pDmBe0/WigVltfluy8HNx5dZxBa//M2mqg/WBpHXWHkQB
	 sedbtWb7GJhz2pkFGLQW64CHWV4LqDOJNWRP5Wlis2fuuD8BVFBOaN2bSJ9Zyq3q/F
	 LVcNOdJSYEAXWPXubK1HTKobqgKLn1GJRZ38F6RA=
X-SMAIL-HELO: localhost.localdomain
Received: from unknown (HELO localhost.localdomain)([114.249.58.236])
	by sina.com (10.54.253.32) with ESMTP
	id 686867BA0000406F; Fri, 5 Jul 2025 07:46:03 +0800 (CST)
X-Sender: hdanton@sina.com
X-Auth-ID: hdanton@sina.com
Authentication-Results: sina.com;
	 spf=none smtp.mailfrom=hdanton@sina.com;
	 dkim=none header.i=none;
	 dmarc=none action=none header.from=hdanton@sina.com
X-SMAIL-MID: 5830304456930
X-SMAIL-UIID: 45A23F742C9143F98C01E66E7F00AA3A-20250705-074603-1
From: Hillf Danton <hdanton@sina.com>
To: syzbot <syzbot+32de323b0addb9e114ff@syzkaller.appspotmail.com>
Cc: linux-kernel@vger.kernel.org,
	syzkaller-bugs@googlegroups.com
Subject: Re: [syzbot] [kernel?] UBSAN: shift-out-of-bounds in pcl812_attach
Date: Sat,  5 Jul 2025 07:45:32 +0800
Message-ID: <20250704234551.2525-1-hdanton@sina.com>
In-Reply-To: <68684cb9.a00a0220.c7b3.0027.GAE@google.com>
References: 
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

> Date: Fri, 04 Jul 2025 14:50:49 -0700
> syzbot found the following issue on:
> 
> HEAD commit:    4c06e63b9203 Merge tag 'for-6.16-rc4-tag' of git://git.ker..
> git tree:       upstream
> console output: https://syzkaller.appspot.com/x/log.txt?x=104a8f70580000
> kernel config:  https://syzkaller.appspot.com/x/.config?x=b29b1a0d7330d4a8
> dashboard link: https://syzkaller.appspot.com/bug?extid=32de323b0addb9e114ff
> syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=16b17ebc580000
> C reproducer:   https://syzkaller.appspot.com/x/repro.c?x=144a8f70580000

#syz test

--- x/drivers/comedi/drivers/pcl812.c
+++ y/drivers/comedi/drivers/pcl812.c
@@ -1148,6 +1148,8 @@ static int pcl812_attach(struct comedi_d
 					 I8254_OSC_BASE_2MHZ, I8254_IO8, 0);
 		if (IS_ERR(dev->pacer))
 			return PTR_ERR(dev->pacer);
+		if (it->options[1] < 0 || it->options[1] > 31)
+			return -EINVAL;
 
 		if ((1 << it->options[1]) & board->irq_bits) {
 			ret = request_irq(it->options[1], pcl812_interrupt, 0,
--

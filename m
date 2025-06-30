Received: from smtp153-141.sina.com.cn (smtp153-141.sina.com.cn [61.135.153.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1E0E321FF55
	for <linux-kernel@vger.kernel.org>; Mon, 30 Jun 2025 08:04:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=61.135.153.141
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751270682; cv=none; b=bXjIZf6GcI0JB7hbZN0gLenEzy5Wa3a+JaH+mI4i5bQ6TiImPyZcCrxdf0+VkqLxw0JzCkAAdRPcOLC0P5c9pvj0LyZPB1T/Wf0+ss+vLcpuh+MoQ0uj6UAgkWk0L1RG1XGdaDfAfGXbfio0r03SKCpJKQoHzLgypWyrgIE5mTU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751270682; c=relaxed/simple;
	bh=7YviEnvljY1YmjWL1oTg6VsTzCsymOlmrjp2jos3C4w=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=eKvty2BM6HNqeKTdiaswFZtxxMRTgFjBKNMOn4/ey6YlAhDpX5KCHYOljhBOM6u4WCoUYAEYr4RhNeH5jVMhAH5skBPGARmeqQvb58OjkE0bf2yc+3tSCd6iBFMHw6OsnEfARiQG/2XcXbaRrcdX3P3Ut57sem8T1LpCUhoBP0A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sina.com; spf=pass smtp.mailfrom=sina.com; dkim=pass (1024-bit key) header.d=sina.com header.i=@sina.com header.b=MrPfrNAn; arc=none smtp.client-ip=61.135.153.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sina.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sina.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=sina.com header.i=@sina.com header.b="MrPfrNAn"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sina.com; s=201208; t=1751270673;
	bh=m6wQ7chla6fTVKTzEUftRaOXCTPvdH1r/jT/x1EkH60=;
	h=From:Subject:Date:Message-ID;
	b=MrPfrNAnE16XVDlHFzFKuhSlYZImBZUemaAsSwHi2qCCKufluYxve/AIA2AwUCD5x
	 8SDzapes0ZVEsFXpict2SnU/SxrDoEtTxriCjJImb/F03LioWti6mknbeIzv6U5idk
	 03uPETSkikvTentiWIORCHHkwUGiBYGqTRtIvhbQ=
X-SMAIL-HELO: localhost.localdomain
Received: from unknown (HELO localhost.localdomain)([114.249.58.236])
	by sina.com (10.54.253.31) with ESMTP
	id 68624507000071DE; Mon, 30 Jun 2025 16:04:25 +0800 (CST)
X-Sender: hdanton@sina.com
X-Auth-ID: hdanton@sina.com
Authentication-Results: sina.com;
	 spf=none smtp.mailfrom=hdanton@sina.com;
	 dkim=none header.i=none;
	 dmarc=none action=none header.from=hdanton@sina.com
X-SMAIL-MID: 1717616816275
X-SMAIL-UIID: 7C8C06A5B3074BFA95CD8C43DE1B7EA7-20250630-160425-1
From: Hillf Danton <hdanton@sina.com>
To: syzbot <syzbot+4ed6852d4da4606c93da@syzkaller.appspotmail.com>
Cc: linux-kernel@vger.kernel.org,
	syzkaller-bugs@googlegroups.com
Subject: Re: [syzbot] [bluetooth?] general protection fault in bcsp_recv
Date: Mon, 30 Jun 2025 16:03:57 +0800
Message-ID: <20250630080413.2136-1-hdanton@sina.com>
In-Reply-To: <67edcea4.050a0220.297a31.0022.GAE@google.com>
References: 
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

> Date: Wed, 02 Apr 2025 16:56:20 -0700
> syzbot has found a reproducer for the following issue on:
> 
> HEAD commit:    acc4d5ff0b61 Merge tag 'net-6.15-rc0' of git://git.kernel...
> git tree:       upstream
> console output: https://syzkaller.appspot.com/x/log.txt?x=135a6178580000
> kernel config:  https://syzkaller.appspot.com/x/.config?x=410c49aba9aeb859
> dashboard link: https://syzkaller.appspot.com/bug?extid=4ed6852d4da4606c93da
> compiler:       gcc (Debian 12.2.0-14) 12.2.0, GNU ld (GNU Binutils for Debian) 2.40
> syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=134ec7cf980000
> C reproducer:   https://syzkaller.appspot.com/x/repro.c?x=13315274580000

#syz test

--- x/drivers/bluetooth/hci_ldisc.c
+++ y/drivers/bluetooth/hci_ldisc.c
@@ -615,7 +615,7 @@ static void hci_uart_tty_receive(struct
 
 	percpu_down_read(&hu->proto_lock);
 
-	if (!test_bit(HCI_UART_PROTO_READY, &hu->flags) &&
+	if (!test_bit(HCI_UART_PROTO_READY, &hu->flags) ||
 	    !test_bit(HCI_UART_PROTO_INIT, &hu->flags)) {
 		percpu_up_read(&hu->proto_lock);
 		return;
--

Received: from mail115-63.sinamail.sina.com.cn (mail115-63.sinamail.sina.com.cn [218.30.115.63])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 86B65151995
	for <linux-kernel@vger.kernel.org>; Wed,  5 Feb 2025 11:10:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=218.30.115.63
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738753864; cv=none; b=f++GQmnT3FYL3/+HmC9plBk5CC9aSWiu2JfAq+gAtUPYZN3e8kX4QePiTtO9SKsdcPdygQN488852NvuFLHuiltb5JhhnjAGtEDeTb/7CgghviDzAYEbD/kdwmLQqgOkaqAKYu6sok1JQwh5Wo7YCHgH5yt1rI++G0K6KmjRPsQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738753864; c=relaxed/simple;
	bh=b8GImN6auJ6IJxFqwWEyaNYoInP84sB9bc8kCpDXAVA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=tN44OaUfDPVVjI2O81hGj7DkMO6bJpPBB5NncFpKb27cdlw7UZCV93oB0LUlXCmyg0qAIDjuSpCIFYYZ3OvIbf+HP52MyPbitUyzpF1rv52pMSVafgPDJfW2LICYZ5AlXgWjcop0czUmiwOq/1u+TeUuDjdjjOA8xGWV/uctQ4Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sina.com; spf=pass smtp.mailfrom=sina.com; arc=none smtp.client-ip=218.30.115.63
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sina.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sina.com
X-SMAIL-HELO: localhost.localdomain
Received: from unknown (HELO localhost.localdomain)([113.88.48.12])
	by sina.com (10.185.250.22) with ESMTP
	id 67A345F6000015CE; Wed, 5 Feb 2025 19:05:27 +0800 (CST)
X-Sender: hdanton@sina.com
X-Auth-ID: hdanton@sina.com
Authentication-Results: sina.com;
	 spf=none smtp.mailfrom=hdanton@sina.com;
	 dkim=none header.i=none;
	 dmarc=none action=none header.from=hdanton@sina.com
X-SMAIL-MID: 9858987602512
X-SMAIL-UIID: 026D8255DB244289B7BD9E79412AF9DF-20250205-190527-1
From: Hillf Danton <hdanton@sina.com>
To: syzbot <syzbot+683f8cb11b94b1824c77@syzkaller.appspotmail.com>
Cc: linux-kernel@vger.kernel.org,
	syzkaller-bugs@googlegroups.com
Subject: Re: [syzbot] [bluetooth?] KASAN: slab-use-after-free Read in skb_queue_purge_reason (2)
Date: Wed,  5 Feb 2025 19:05:27 +0800
Message-ID: <20250205110528.1938-1-hdanton@sina.com>
In-Reply-To: <67a228ba.050a0220.d7c5a.00b9.GAE@google.com>
References: 
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On Tue, 04 Feb 2025 06:48:26 -0800
> syzbot has found a reproducer for the following issue on:
> 
> HEAD commit:    40b8e93e17bf Add linux-next specific files for 20250204
> git tree:       linux-next
> C reproducer:   https://syzkaller.appspot.com/x/repro.c?x=12f74f64580000

#syz test https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git  master

--- x/drivers/bluetooth/hci_mrvl.c
+++ y/drivers/bluetooth/hci_mrvl.c
@@ -97,11 +97,14 @@ static int mrvl_close(struct hci_uart *h
 	if (hu->serdev)
 		serdev_device_close(hu->serdev);
 
+	if (!mrvl)
+		goto out;
 	skb_queue_purge(&mrvl->txq);
 	skb_queue_purge(&mrvl->rawq);
 	kfree_skb(mrvl->rx_skb);
 	kfree(mrvl);
 
+out:
 	hu->priv = NULL;
 	return 0;
 }
--

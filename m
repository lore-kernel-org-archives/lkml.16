Received: from mail115-24.sinamail.sina.com.cn (mail115-24.sinamail.sina.com.cn [218.30.115.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5ECA21624D0
	for <linux-kernel@vger.kernel.org>; Sat,  8 Feb 2025 11:59:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=218.30.115.24
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739015956; cv=none; b=JqeDIGnbn8w2zOYVoSMK0lABsKT5B431UEcmQE4Cv7m2jXI3X4ykbIKYO5EuTMkkCI5jkAsQt41NpxYGS854R8yjzau0edPBG/FgyxgGkfEiuDahi9hVV2Z/hXupp3CO1o3s5Erw9PNGZxv8DcMbB7/113mdspMSAqSfQKbCcVk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739015956; c=relaxed/simple;
	bh=f5CmjleL+yl/FBvE/q9hOi3s8c5cjPH/yGKIvNStbdU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=SSPErQ5GpvS08/K3bij5poSGiqrb9joXQjgmOX4OpEcx2rFLbPbDcDc/sKSDn6biBT/byPhPnNqTu9FjQiJ4ntvwdm+md69eeTKSB3fCXtMRV7dBbUjhyLqKw8kb7k6koYsQD2ocRYh71pgStAPsenPDZAnQt6jRHQ07ZgBGDwI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sina.com; spf=pass smtp.mailfrom=sina.com; arc=none smtp.client-ip=218.30.115.24
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sina.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sina.com
X-SMAIL-HELO: localhost.localdomain
Received: from unknown (HELO localhost.localdomain)([113.118.67.230])
	by sina.com (10.185.250.22) with ESMTP
	id 67A746DD00003406; Sat, 8 Feb 2025 19:58:26 +0800 (CST)
X-Sender: hdanton@sina.com
X-Auth-ID: hdanton@sina.com
Authentication-Results: sina.com;
	 spf=none smtp.mailfrom=hdanton@sina.com;
	 dkim=none header.i=none;
	 dmarc=none action=none header.from=hdanton@sina.com
X-SMAIL-MID: 2847627602702
X-SMAIL-UIID: 0EE848358BAC4870A226E949884C2862-20250208-195826-1
From: Hillf Danton <hdanton@sina.com>
To: syzbot <syzbot+1eaee1ec18b9d18ca3b8@syzkaller.appspotmail.com>
Cc: linux-kernel@vger.kernel.org,
	syzkaller-bugs@googlegroups.com
Subject: Re: [syzbot] [bluetooth?] general protection fault in __timer_delete_sync
Date: Sat,  8 Feb 2025 19:58:23 +0800
Message-ID: <20250208115825.2077-1-hdanton@sina.com>
In-Reply-To: <67a66a14.050a0220.f64af.0005.GAE@google.com>
References: 
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On Fri, 07 Feb 2025 12:16:20 -0800
> syzbot found the following issue on:
> 
> HEAD commit:    808eb958781e Add linux-next specific files for 20250206
> git tree:       linux-next
> C reproducer:   https://syzkaller.appspot.com/x/repro.c?x=1043a4a4580000

#syz test

--- x/drivers/bluetooth/hci_ldisc.c
+++ y/drivers/bluetooth/hci_ldisc.c
@@ -711,6 +711,7 @@ static int hci_uart_set_proto(struct hci
 
 	err = hci_uart_register_dev(hu);
 	if (err) {
+		clear_bit(HCI_UART_PROTO_READY, &hu->flags);
 		return err;
 	}
 
--

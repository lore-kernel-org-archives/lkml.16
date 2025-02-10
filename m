Received: from smtp134-32.sina.com.cn (smtp134-32.sina.com.cn [180.149.134.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D4C1C1AE01B
	for <linux-kernel@vger.kernel.org>; Mon, 10 Feb 2025 11:09:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=180.149.134.32
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739185752; cv=none; b=qhr1lTw6EHhxCemTv71uLmwIb2A4bLoZ6fjfUsKuJbDXWztriEPuvAa3xTFaJ8oaxrgCujv+bjui9av0bMhQ23WBNkkb1LH+Q76qye7OWJOd9A4ibmykAz5RMkeMtTtKAbQGm78MtSQQifaxBspui7ojc088RVOYSdhV+zbdVZM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739185752; c=relaxed/simple;
	bh=jpLIWSx0dmnY19+fL2jpPHVCdejmh27SEWk5QkfdUoA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Kn4/bRK2rhCS4M/hf15kWMvr6i9uQvu2IgacpHtdH2NTcHZHv9MiIAzsV5CdoEf/UMzwvmz4+TXiGgZXAmhJu1Z0xgNe4BVFy8rZgyetRVcQhZVz46/F2YAGvLbOW2EHVCvDRHJpGJBTBDPv9nwEGbVqkTnFiwltjeEda64C1c4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sina.com; spf=pass smtp.mailfrom=sina.com; arc=none smtp.client-ip=180.149.134.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sina.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sina.com
X-SMAIL-HELO: localhost.localdomain
Received: from unknown (HELO localhost.localdomain)([113.88.48.71])
	by sina.com (10.185.250.21) with ESMTP
	id 67A9DD03000058C8; Mon, 10 Feb 2025 19:03:35 +0800 (CST)
X-Sender: hdanton@sina.com
X-Auth-ID: hdanton@sina.com
Authentication-Results: sina.com;
	 spf=none smtp.mailfrom=hdanton@sina.com;
	 dkim=none header.i=none;
	 dmarc=none action=none header.from=hdanton@sina.com
X-SMAIL-MID: 2655703408364
X-SMAIL-UIID: 6748359DFAE94FEDAC27D5376B6B1B4F-20250210-190335-1
From: Hillf Danton <hdanton@sina.com>
To: syzbot <syzbot+b5691bb559396b262064@syzkaller.appspotmail.com>
Cc: linux-kernel@vger.kernel.org,
	syzkaller-bugs@googlegroups.com
Subject: Re: [syzbot] [bluetooth?] general protection fault in h5_recv
Date: Mon, 10 Feb 2025 19:03:02 +0800
Message-ID: <20250210110322.2157-1-hdanton@sina.com>
In-Reply-To: <67a8cd8f.050a0220.3d72c.003f.GAE@google.com>
References: 
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On Sun, 09 Feb 2025 07:45:19 -0800
> syzbot found the following issue on:
> 
> HEAD commit:    ed58d103e6da Add linux-next specific files for 20250207
> git tree:       linux-next
> syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=137f2bdf980000

#syz test https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git  master

--- x/drivers/bluetooth/hci_ldisc.c
+++ y/drivers/bluetooth/hci_ldisc.c
@@ -711,6 +711,7 @@ static int hci_uart_set_proto(struct hci
 
 	err = hci_uart_register_dev(hu);
 	if (err) {
+		clear_bit(HCI_UART_PROTO_READY, &hu->flags);
 		return err;
 	}
 
--

Received: from mail-il1-f197.google.com (mail-il1-f197.google.com [209.85.166.197])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4E6E154BC6
	for <linux-kernel@vger.kernel.org>; Thu, 26 Jun 2025 02:17:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.197
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750904242; cv=none; b=qVlqWheD+6IWvMMLLNuYBJlaKw0Gc/z6GT0+QMLsFC9TPsqFAgQlqrLQeKhs57Zr37GdCJBx3m1zbfMOL0qPru8SWvrU1ySaZQ7od8FJEMhMrs1tieACVobDBO+p6oJfStF8PLexExA8Vgz0yep2sDWR6jtL6hpFLLM2MUWodho=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750904242; c=relaxed/simple;
	bh=7Qa+GklDAGzasOIuJhZ4fL4OS5E5tGU9W5R/ZqD/GT8=;
	h=MIME-Version:Date:In-Reply-To:Message-ID:Subject:From:To:
	 Content-Type; b=J1Xvx+1I3ZCifLc8xVQQxKzbed2ACOWFzO3t7mwzVrbhXobzdlfD5RjGIrjjLFJaeUYOppFoV9w/xZTwRGQo0nB0uJUdxMQFHBuTsCUXUOALFoofLbPd9+/0A8VYIeN91I8W+lBrdJnOtMJLDaYH7DdkkchNgehTCklM8ciwo4U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.166.197
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-il1-f197.google.com with SMTP id e9e14a558f8ab-3ddce213201so5755565ab.0
        for <linux-kernel@vger.kernel.org>; Wed, 25 Jun 2025 19:17:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750904239; x=1751509039;
        h=to:from:subject:message-id:in-reply-to:date:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=5YOODeU58lx9eP+f5RxFcGZApGO2XvIds84h6dWULXk=;
        b=TevCGWZmAE1fMTkuOIx71jojGLBR+ML7gwcqULjit1No7W5CfcVaXr/rZRc26qYrC6
         mkFEXWNnrHfy/9IHlEI7NF8ATeK/K1R+ASnwlrbVeLF9stmNUXGsNvavi2K6PO7MBrwv
         itwZt0nz14460DJuGlHaOFQqv9tO8x55Md7lFqBGSKBLEWFZ3yoS06ZwDGsTfJSs6b5j
         dGQFVgf1Ub4clEDtj9WfiwpIWZmsDPTmlln8JpclknEMseKqzzS5X6qghGq7gq8Axnl8
         y/EDFnqpcxdtEXNG7Ak2BK5jq9/FRCs3mxBHTdnHtw1FyPBRBE/tEnD8zGAyIbVnLbv9
         W0EA==
X-Gm-Message-State: AOJu0YzhuLejASfKATE0brB2dRe4DDr2pBRstwPSiXayZ2WBB105PfAn
	KVCJCkXTlbYA/nOxL7fU3Z7dYIQneRCNQzBz9KdZtMHBchJXYIwpHHMLSqh6j3ngHyiG3vdmZ67
	iO6CXCNK0oR7wU6Z2V7CPQ6VslqxeqP62bnafcPGmBYzXmv3t/iQd/sjkQQs=
X-Google-Smtp-Source: AGHT+IEqJPbq78DvJjusv6DjZ5y6MBRPFRjUnDoesiSaryCBB+ao+x55+4purie5Edvtp6f+rmQ45RwWIt0FnGZ8gON0/AljjEcN
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6e02:1889:b0:3dc:7b3d:6a45 with SMTP id
 e9e14a558f8ab-3df3e0b23dbmr29444345ab.0.1750904239504; Wed, 25 Jun 2025
 19:17:19 -0700 (PDT)
Date: Wed, 25 Jun 2025 19:17:19 -0700
In-Reply-To: <6854a3e6.a00a0220.137b3.0022.GAE@google.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <685cadaf.a00a0220.2e5631.01cf.GAE@google.com>
Subject: Re: [syzbot] Re: [syzbot] [kernel?] KMSAN: kernel-infoleak in
 vmci_host_unlocked_ioctl (3)
From: syzbot <syzbot+9b9124ae9b12d5af5d95@syzkaller.appspotmail.com>
To: linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

For archival purposes, forwarding an incoming command email to
linux-kernel@vger.kernel.org.

***

Subject: Re: [syzbot] [kernel?] KMSAN: kernel-infoleak in vmci_host_unlocked_ioctl (3)
Author: lizhi.xu@windriver.com

#syz test

diff --git a/drivers/misc/vmw_vmci/vmci_host.c b/drivers/misc/vmw_vmci/vmci_host.c
index b64944367ac5..8bca943b9f4b 100644
--- a/drivers/misc/vmw_vmci/vmci_host.c
+++ b/drivers/misc/vmw_vmci/vmci_host.c
@@ -91,7 +91,7 @@ struct vmci_host_dev {
 static struct vmci_ctx *host_context;
 static bool vmci_host_device_initialized;
 static atomic_t vmci_host_active_users = ATOMIC_INIT(0);
-
+static atomic_t vmci_host_dev_open = ATOMIC_INIT(0);
 /*
  * Determines whether the VMCI host personality is
  * available. Since the core functionality of the host driver is
@@ -120,6 +120,11 @@ static int vmci_host_open(struct inode *inode, struct file *filp)
 {
 	struct vmci_host_dev *vmci_host_dev;
 
+	if (atomic_inc_return(&vmci_host_dev_open) > 1) {
+		atomic_dec(&vmci_host_dev_open);
+		return -EBUSY;
+	}
+
 	vmci_host_dev = kzalloc(sizeof(struct vmci_host_dev), GFP_KERNEL);
 	if (vmci_host_dev == NULL)
 		return -ENOMEM;

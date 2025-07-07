Received: from smtp153-170.sina.com.cn (smtp153-170.sina.com.cn [61.135.153.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0D322191F98
	for <linux-kernel@vger.kernel.org>; Mon,  7 Jul 2025 11:27:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=61.135.153.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751887647; cv=none; b=ZiG2DgirkTDRz2P4CgaWYW9eqjg3zzC+AIzsNhEKzf/QZu83LtsdVUcO6negVQoxPDybWyBmMqHzl3jq3nvs2jF16hxfJYQ8Whr5O/Eed+R4bJkAVF7ASnGNHvh5S7pc9T/Mg5qz1zu4+ASJVJddWmfmG/OAO71rNaMkci039qI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751887647; c=relaxed/simple;
	bh=g+vvJB3WXfl2xhA7Q5Uia4MeTxDf2UERYo86cQ4YVPQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=aFrKPuAMQMkSCbQ7GbP2YT6iBsDm/YW67i86Pg23l2781gWBVgF2ZE9VK+4Ig2JoRXVonGg4crTl3TYGegIz6tDSDOOnEKVMt4wePt6mwocJkO/NScpF2hranwhV/MVh8fTKn5F7Bl0E0FwoyOBA7MiWSik6sTESrI6/jUF/6eg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sina.com; spf=pass smtp.mailfrom=sina.com; dkim=pass (1024-bit key) header.d=sina.com header.i=@sina.com header.b=In4futyK; arc=none smtp.client-ip=61.135.153.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sina.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sina.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=sina.com header.i=@sina.com header.b="In4futyK"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sina.com; s=201208; t=1751887640;
	bh=HGiW0pW1raEYw9x5KszA1dnRrGgit3o4p+Xv797shsI=;
	h=From:Subject:Date:Message-ID;
	b=In4futyKcvIbCeu6Kc8QjOi5vJKTlVvzAwJ27CGUTfGV77njUPX48JHvAM5MOd9do
	 NwqOGUfFiUN0Kbn44oyQro9gXvth31sCnWYAPdiVAj9Ua3iMHjBaMG7iq4eI+w/HLS
	 h6IjCE70qC+C87Bf9o9g9bqMFP/dAc6FoOfgIxcc=
X-SMAIL-HELO: localhost.localdomain
Received: from unknown (HELO localhost.localdomain)([114.249.58.236])
	by sina.com (10.54.253.34) with ESMTP
	id 686BAF0B00005B0E; Mon, 7 Jul 2025 19:27:09 +0800 (CST)
X-Sender: hdanton@sina.com
X-Auth-ID: hdanton@sina.com
Authentication-Results: sina.com;
	 spf=none smtp.mailfrom=hdanton@sina.com;
	 dkim=none header.i=none;
	 dmarc=none action=none header.from=hdanton@sina.com
X-SMAIL-MID: 1463686291937
X-SMAIL-UIID: B7B899CEF6914A2B852DE1CB19B06490-20250707-192709-1
From: Hillf Danton <hdanton@sina.com>
To: syzbot <syzbot+4e21d5f67b886a692b55@syzkaller.appspotmail.com>
Cc: linux-kernel@vger.kernel.org,
	syzkaller-bugs@googlegroups.com
Subject: Re: [syzbot] [fs?] BUG: corrupted list in remove_wait_queue (2)
Date: Mon,  7 Jul 2025 19:26:57 +0800
Message-ID: <20250707112658.2733-1-hdanton@sina.com>
In-Reply-To: <686b939a.a00a0220.c7b3.007e.GAE@google.com>
References: 
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

> Date: Mon, 07 Jul 2025 02:30:02 -0700
> syzbot has bisected this issue to:
> 
> commit 8ffdff6a8cfbdc174a3a390b6f825a277b5bb895
> Author: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
> Date:   Wed Apr 14 08:58:10 2021 +0000
> 
>     staging: comedi: move out of staging directory
> 
> bisection log:  https://syzkaller.appspot.com/x/bisect.txt?x=13009f70580000
> start commit:   05df91921da6 Merge tag 'v6.16-rc4-smb3-client-fixes' of gi..
> git tree:       upstream
> final oops:     https://syzkaller.appspot.com/x/report.txt?x=10809f70580000
> console output: https://syzkaller.appspot.com/x/log.txt?x=17009f70580000
> kernel config:  https://syzkaller.appspot.com/x/.config?x=45bd916a213c79bb
> dashboard link: https://syzkaller.appspot.com/bug?extid=4e21d5f67b886a692b55
> syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=161cdc8c580000
> C reproducer:   https://syzkaller.appspot.com/x/repro.c?x=14d1a582580000

#syz test upstream master

--- x/drivers/comedi/comedi_fops.c
+++ y/drivers/comedi/comedi_fops.c
@@ -2454,7 +2454,7 @@ static __poll_t comedi_poll(struct file
 	struct comedi_device *dev = cfp->dev;
 	struct comedi_subdevice *s, *s_read;
 
-	down_read(&dev->attach_lock);
+	down_write(&dev->attach_lock);
 
 	if (!dev->attached) {
 		dev_dbg(dev->class_dev, "no driver attached\n");
@@ -2484,7 +2484,7 @@ static __poll_t comedi_poll(struct file
 	}
 
 done:
-	up_read(&dev->attach_lock);
+	up_write(&dev->attach_lock);
 	return mask;
 }
 
--

Received: from exchange.fintech.ru (exchange.fintech.ru [195.54.195.159])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4F09D10E5;
	Sat, 26 Apr 2025 13:15:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.54.195.159
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745673329; cv=none; b=Wqc+1144yicD5ar42jAUaF4TRADwxCtpUfxUcHE1uQtwXwXCeq8Uf8vozwbKuujZkoEeypVt2o6UpWfoaFbbDQL7bqWv8C28URG9Rc+Y8eG3chs5qxq5+sChWBBfu5qGw6wwrnPMX7O47oZc0BhMqz81z/19IJgHPTBrN/gS4zU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745673329; c=relaxed/simple;
	bh=wmWtsJ24OwgPn4tBDpWsmi4U8Po3bYIO0oB2dXDrHuw=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=ItiaKTAN19N1T51U1a+F6R5i8IlxDhuu7PfQ4y9iNFj+BVXted65ISgur3iPhCky2io/mCZj8THrpl2HHg9BwC17GBlvr5rY2BA1T4O3NrTiKNLTmdjBgjsWDE1ToDHjPT9bZRQpkzR+08g57tGSbDkTo7UHzcfw3d0sawgKMBU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=fintech.ru; spf=pass smtp.mailfrom=fintech.ru; arc=none smtp.client-ip=195.54.195.159
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=fintech.ru
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fintech.ru
Received: from Ex16-01.fintech.ru (10.0.10.18) by exchange.fintech.ru
 (195.54.195.169) with Microsoft SMTP Server (TLS) id 14.3.498.0; Sat, 26 Apr
 2025 16:14:05 +0300
Received: from localhost (10.0.253.138) by Ex16-01.fintech.ru (10.0.10.18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2242.4; Sat, 26 Apr
 2025 16:14:05 +0300
From: Nikita Zhandarovich <n.zhandarovich@fintech.ru>
To: syzbot <syzbot+721071c10f3c7e4e5dcb@syzkaller.appspotmail.com>
CC: Nikita Zhandarovich <n.zhandarovich@fintech.ru>,
	<syzkaller-bugs@googlegroups.com>, <linux-kernel@vger.kernel.org>,
	<linux-usb@vger.kernel.org>, Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Alan Stern <stern@rowland.harvard.edu>
Subject: Re: [syzbot] [usb?] WARNING in gl861_ctrl_msg/usb_submit_urb
Date: Sat, 26 Apr 2025 16:13:53 +0300
Message-ID: <20250426131356.764288-1-n.zhandarovich@fintech.ru>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <680aaf92.050a0220.317436.0050.GAE@google.com>
References:
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: Ex16-02.fintech.ru (10.0.10.19) To Ex16-01.fintech.ru
 (10.0.10.18)

Hi,

> ------------[ cut here ]------------
> usb 2-1: BOGUS control dir, pipe 80000280 doesn't match bRequestType c0
> WARNING: CPU: 0 PID: 5845 at drivers/usb/core/urb.c:413 usb_submit_urb+0x11dd/0x18c0 drivers/usb/core/urb.c:411
> Modules linked in:
> CPU: 0 UID: 0 PID: 5845 Comm: syz-executor566 Not tainted 6.15.0-rc2-syzkaller-00488-g6fea5fabd332 #0 PREEMPT(full) 
> Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS Google 02/12/2025
> RIP: 0010:usb_submit_urb+0x11dd/0x18c0 drivers/usb/core/urb.c:411
> ...
> Call Trace:
>  <TASK>
>  usb_start_wait_urb+0x11a/0x530 drivers/usb/core/message.c:59
>  usb_internal_control_msg drivers/usb/core/message.c:103 [inline]
>  usb_control_msg+0x2b3/0x4c0 drivers/usb/core/message.c:154
>  gl861_ctrl_msg+0x332/0x6f0 drivers/media/usb/dvb-usb-v2/gl861.c:58
>  gl861_i2c_master_xfer+0x3b4/0x650 drivers/media/usb/dvb-usb-v2/gl861.c:144
>  __i2c_transfer+0x859/0x2250 drivers/i2c/i2c-core-base.c:-1
> ...

This issue seems similar to another one [1], syzkaller managing to
craft a I2C transfer request with 0-length read message. That
request is moved to 0-length USB read request, which is forbidden.

Alan suggested a fix [2] to issue [1]. I guess it makes sense to
do something similar here as well. Unless there is a consensus
about checking for such cases deeper in I2C core?

[1] https://syzkaller.appspot.com/bug?extid=c38e5e60d0041a99dbf5
[2] https://lore.kernel.org/all/c7f67d3b-f1e6-4d68-99aa-e462fdcb315f@rowland.harvard.edu/


Regards,
Nikita




Received: from mail-io1-f71.google.com (mail-io1-f71.google.com [209.85.166.71])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5EBE51547F2
	for <linux-kernel@vger.kernel.org>; Mon, 30 Jun 2025 03:03:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.71
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751252631; cv=none; b=Ib0cv8dElLC5g4RwKYSl/agW5vP5rOJpzJUk/a2apjByLNVhu8yKVxrxNFBiTy7gN5l8cdtA0c6fTLY9rdNk9o/0gU0agBldKS9mn+otHHWoP9OzAoVC669oWyLf1GdIVqhkkHMqsBNPoHZH7iPDX4rvp8YDVyZiDQhfYTZGMhc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751252631; c=relaxed/simple;
	bh=Bo/KBnCTQxdtF/gMInzkIEIRyZpmzyomSGMjTYtCTuw=;
	h=MIME-Version:Date:In-Reply-To:Message-ID:Subject:From:To:
	 Content-Type; b=Ch35O8xJ/H/77JvyfslBOmexGAqAAh/kvAkzOGdvrM768dktxGHRQoDtPDYyX6DplEt56HL58qy4NOmNO3FLz966Q1CapScWpYP9ZmpZF0ZNvYTehahhW3gQ833FqF8zYVeBCkrHnPSFR29reaHvpm3xcXGz1xDZMHH5XtPosF8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.166.71
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-io1-f71.google.com with SMTP id ca18e2360f4ac-86cfe68a8bbso263563439f.1
        for <linux-kernel@vger.kernel.org>; Sun, 29 Jun 2025 20:03:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751252629; x=1751857429;
        h=to:from:subject:message-id:in-reply-to:date:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=oFssnLrJFcbb+8id9zz+xxTncMWVIvRi+yvFBm2UedI=;
        b=Boc9sSGDYz22bO2UkhYngRvncqQ7lg/Fjk2Z/Y5Qg2S4w23VSbm3bmUym2KyxJo96g
         4a8T9cEsPF1eEae4Jt23jMklxajFJNaBj8uvW+YoJ4783h3Xwdet+1HA2/mzcD9fmFYK
         cHWv7FdIcXj9UH0dx4byR9XgFF4suP1Uapfqo3Mme90xZH1aqffnL1kYrCdy0+2WREyy
         5sKRd5VUrSUFm1SzCOQF7ZmKeSX8KUxNQQCnt1ELbPqAVAQzmHsCXMUcAWHptqodMosG
         REBRQ36lJCzW1qMNzd+Nk+S8VhOU46aQMUYp2hsaoSRipARrG7VMLBocQWZpY/FflRBX
         rqgA==
X-Gm-Message-State: AOJu0YxAx6piG7I8sdsj+94XOtBdTdiwBEaQRDpllJOgUHq21JBhn7Ah
	6n87yI42se2WefhMZ0eOQNtadcbiC/+BX4VAHtuD/40nDPiw5aPSwa1YQsSn91reTcbHB345ohy
	/eI3OXtfbcqOl54X5yf++GaWN+617nUn0+jousqoZKZQRKlxRkJZwwYphoJs=
X-Google-Smtp-Source: AGHT+IEMw6G1zZXbxcbPDJCf6akuEp+7Lv9JIlTWUxkOr7mFvdJYIK/2ZparG1098kdC3SiFOjS2E0LMbQ7hXDL5fDd9BBtnLSJR
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6e02:1a61:b0:3de:2102:f1d8 with SMTP id
 e9e14a558f8ab-3df4acc2025mr156082645ab.18.1751252629569; Sun, 29 Jun 2025
 20:03:49 -0700 (PDT)
Date: Sun, 29 Jun 2025 20:03:49 -0700
In-Reply-To: <67b0cc5b.050a0220.6f0b7.0014.GAE@google.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <6861fe95.a70a0220.3b7e22.0b8b.GAE@google.com>
Subject: Re: [syzbot] Re: [syzbot] [bluetooth?] general protection fault in bcsp_recv
From: syzbot <syzbot+4ed6852d4da4606c93da@syzkaller.appspotmail.com>
To: linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

For archival purposes, forwarding an incoming command email to
linux-kernel@vger.kernel.org.

***

Subject: Re: [syzbot] [bluetooth?] general protection fault in bcsp_recv
Author: ipravdin.official@gmail.com

#syz test

diff --git a/drivers/bluetooth/hci_bcsp.c b/drivers/bluetooth/hci_bcsp.c
index 610d0e3c36d4..de9a6ed3a8aa 100644
--- a/drivers/bluetooth/hci_bcsp.c
+++ b/drivers/bluetooth/hci_bcsp.c
@@ -739,8 +739,6 @@ static int bcsp_close(struct hci_uart *hu)

        timer_shutdown_sync(&bcsp->tbcsp);

-       hu->priv = NULL;
-
        BT_DBG("hu %p", hu);

        skb_queue_purge(&bcsp->unack);
@@ -753,6 +751,8 @@ static int bcsp_close(struct hci_uart *hu)
        }

        kfree(bcsp);
+       hu->priv = NULL;
+
        return 0;
 }

	Ivan Pravdin

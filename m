Received: from mail-il1-f199.google.com (mail-il1-f199.google.com [209.85.166.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 455C8282E1
	for <linux-kernel@vger.kernel.org>; Fri,  7 Feb 2025 02:38:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.199
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738895888; cv=none; b=jQYStGDdWiM0IIrQURDuhk7TFIXXZ8SC/0rI0pj0AhyijXZP+zIS4Kb+5WRLlNm0QPeqgDQQs4boio0U+C+t8OjDQzAPevUaNPqwzNdpG5/xrXyXdYykK78dnV/PZIBIjEvBRxe1/MPi8QY8TTlrPKozxERm25XqJLzUs9vzkjs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738895888; c=relaxed/simple;
	bh=HxsPzx3fxEgCEI/5h7f+/VjDbaMQnpvDyiBM/5px350=;
	h=MIME-Version:Date:In-Reply-To:Message-ID:Subject:From:To:
	 Content-Type; b=t37tjQFq79i6n4/VxdGy3VeJtcAqfjQvZ3szFTgmAb0z4pxewy/PiJPhNhj+6t4mT2OnsR5nUb4bt9W44fKfGW6/6udJj7YeVJrr4ZRvDn5jAP8IL1fX8GM+9ubv7KYgsCBcMdHsJyM9NWVjJ/4O6hD/AaJ3hcQPelqwLEEYsY0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.166.199
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-il1-f199.google.com with SMTP id e9e14a558f8ab-3d04db7732cso32420775ab.0
        for <linux-kernel@vger.kernel.org>; Thu, 06 Feb 2025 18:38:05 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738895885; x=1739500685;
        h=to:from:subject:message-id:in-reply-to:date:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ex7hBcibt/LzZ/XIEiktiEnjT27cJHZBQNolhhnHLhY=;
        b=YRJsXDOzhLrcK7zZsZ7JQib4EkjzKKlYmIG4gq3snnnjZfbo/WA3mvvMSnsc/gcGdt
         ea8KSFcU8gZEuF/76uO8T9lR+iM2VLkei/DRhbEWGvt2ZvkbU9a1ByMY6xdc5sjCtZa0
         nLYj6vWqr9fZ1R5P/9cYBGha7SSxPsq1/7As2uK/LZySUHDmoyrmnRmey6w4Yx/OriqR
         bwbbtb3ZoYdIm/U8VfOOl3mAVo24GnSw1dFkjnt6H0CBI745f/RJsf9YAoeTHWpjthib
         TGt14tXLA9cxfUN20rpXjoBcXSCCJ++UKl1i6L1MY4fuBIjxlS+CO/EbRpAoJ9Jsujvl
         ioNA==
X-Gm-Message-State: AOJu0YzGBTGwdmn2xDwNqGGPsLMhQi0dZ3m0pwHg3Y+LLiJIGDVE3g3M
	xJp8wb8husCmHgZFeP+ajkYrSzijm9kV5HDnRvc9B30V8mVzdVTz+48Cm08mxVRk/ZilWbd1gc0
	gHXXu5x8zBzfLR+MN3r+yC5jmT3L8h7FM3L+aL08//iwkfP8/v7Hu/EE=
X-Google-Smtp-Source: AGHT+IEiGNK3wYF25BlE9MxmoWi5oEfSmblSqXF2aYpwS94YzXiH5Vj3p0pzkvh9DjOsAcSrCfLWaA08RNqh5V9+Cj8qhseiIG2v
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6e02:156f:b0:3d0:239a:c46a with SMTP id
 e9e14a558f8ab-3d13dd38629mr12645985ab.9.1738895885429; Thu, 06 Feb 2025
 18:38:05 -0800 (PST)
Date: Thu, 06 Feb 2025 18:38:05 -0800
In-Reply-To: <67a4b4c3.050a0220.264083.0006.GAE@google.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <67a5720d.050a0220.2b1e6.0007.GAE@google.com>
Subject: Re: [syzbot] Re: [syzbot] [bluetooth?] general protection fault in qca_close
From: syzbot <syzbot+b9cff96f1ca33356d180@syzkaller.appspotmail.com>
To: linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

For archival purposes, forwarding an incoming command email to
linux-kernel@vger.kernel.org.

***

Subject: Re: [syzbot] [bluetooth?] general protection fault in qca_close
Author: lizhi.xu@windriver.com

if hci register device lose than clear HCI_UART_PROTO_READY bit.
And move closer set bit HCI_UART_PROTO_READY to hci_register_dev, make the window smaller.

#syz test

diff --git a/drivers/bluetooth/hci_ldisc.c b/drivers/bluetooth/hci_ldisc.c
index b955dc96b483..d5b97ff59330 100644
--- a/drivers/bluetooth/hci_ldisc.c
+++ b/drivers/bluetooth/hci_ldisc.c
@@ -683,8 +683,10 @@ static int hci_uart_register_dev(struct hci_uart *hu)
 	if (test_bit(HCI_UART_INIT_PENDING, &hu->hdev_flags))
 		return 0;
 
+	set_bit(HCI_UART_PROTO_READY, &hu->flags);
 	if (hci_register_dev(hdev) < 0) {
 		BT_ERR("Can't register HCI device");
+		clear_bit(HCI_UART_PROTO_READY, &hu->flags);
 		hu->proto->close(hu);
 		hu->hdev = NULL;
 		hci_free_dev(hdev);
@@ -707,8 +709,6 @@ static int hci_uart_set_proto(struct hci_uart *hu, int id)
 
 	hu->proto = p;
 
-	set_bit(HCI_UART_PROTO_READY, &hu->flags);
-
 	err = hci_uart_register_dev(hu);
 	if (err) {
 		return err;

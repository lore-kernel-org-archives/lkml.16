Received: from mail-il1-f200.google.com (mail-il1-f200.google.com [209.85.166.200])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 71E111474A7
	for <linux-kernel@vger.kernel.org>; Fri,  7 Feb 2025 02:20:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.200
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738894848; cv=none; b=FBdG36bCBgtItjpV2tpJ5WcOWlHQNDQIAvhJ9T0Mz3KsBGXW6FcJLvzbNXxMwrLOU8pevwmOa/ho1WLrsagttZK1QgnmQn+l4fikJAvAmbg7n654xxZ8zq2CyadNoeqjrxd1SQzqer+4z21DQx8fOSquxqopnt57NA1BrVV35Qs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738894848; c=relaxed/simple;
	bh=Ps6x4fYlzS4Xc+Of8fZpvjUMtFx8CH2m2GgPV5L0GDQ=;
	h=MIME-Version:Date:In-Reply-To:Message-ID:Subject:From:To:
	 Content-Type; b=RErGpAvKFM3dak9JPT/cTBdWJiqdRDyuHK9B4FuWwn/xNNCyAnkM0YrruWGp9oQWlKPLR+MA2Fciie7VFBnN4Pv0N6sTwGatrVd/f09oVzE+UrhGSmyqgNaDnWvHfC41Hqu4AEHZUKzcSyPj8j4kM46lgYVDMp5t8DgMztIAwMQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.166.200
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-il1-f200.google.com with SMTP id e9e14a558f8ab-3d05063cc0fso11256305ab.0
        for <linux-kernel@vger.kernel.org>; Thu, 06 Feb 2025 18:20:45 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738894844; x=1739499644;
        h=to:from:subject:message-id:in-reply-to:date:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=STqwlLXRhP7Q2EH3aoEynnmuPNiQOLMkRCTMgz7H7iA=;
        b=HsQ39tOLwmyA3wEdinT31pZHROqbhEZNgTsjK70KOMLnF+qBpguETlbSozKjQ/cHso
         EKxGypoK7sogXn1rgQxyWlvIHT6zK5Gpth8MjjYN5n+joxuvrDIBqAp7g9ZRkamSgPyE
         fXY/x8Ifvjt6/BmXbNP7bckVT2ApL3MvMK9qDLHVnvImIcEETOOkfWIpcAad5ISiuTo6
         qfQUe3Wn8bBR155PKlAB9I0jQ1YIxqNtSncbhFmrF/6dD+oGabfaik5/xAKiM6xtoL2q
         gI4Ph4ZanQ4DtwqYu8BLxRJ+KSnxNyR9tu75/kNVtMAunjQjYmAGivXLxQeoOn2ojFFR
         AhJA==
X-Gm-Message-State: AOJu0YzZ/9E7jHBYQhg58htGZMhmQeD9D/YWyxIS1gb5w+0xu77j+S1u
	x4W0dPeK87NnPYfPqJpcZh8BMzuzhyPGclxJBuvXD1OOZ3YQX+hVABVT807Z6rsIOuCR0KIq32K
	exVc2FyX7bfK40778tYcLnpLvoAchMb19bKR1+D2IrQQyi8UlADUbqlY=
X-Google-Smtp-Source: AGHT+IFU7HaLD+amfSxuMt0RX/VAoT2beJWpeb6ZYaxWOGH7v0BYn5tlABs34e4AAY+QJOpGDq2e6nfeU2r/Kc2CTBDBJkPAZluL
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6e02:348c:b0:3d0:f2ca:65aa with SMTP id
 e9e14a558f8ab-3d13e1ad5c5mr12410305ab.4.1738894844640; Thu, 06 Feb 2025
 18:20:44 -0800 (PST)
Date: Thu, 06 Feb 2025 18:20:44 -0800
In-Reply-To: <67a4b4c3.050a0220.264083.0005.GAE@google.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <67a56dfc.050a0220.2b1e6.0006.GAE@google.com>
Subject: Re: [syzbot] Re: [syzbot] [bluetooth?] BUG: corrupted list in
 hci_chan_del (2)
From: syzbot <syzbot+10bd8fe6741eedd2be2e@syzkaller.appspotmail.com>
To: linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

For archival purposes, forwarding an incoming command email to
linux-kernel@vger.kernel.org.

***

Subject: Re: [syzbot] [bluetooth?] BUG: corrupted list in hci_chan_del (2)
Author: lizhi.xu@windriver.com

old logical will make get/put unbalance in l2cap_recv_acldata.
so remote get/put conn.

#syz test

diff --git a/net/bluetooth/l2cap_core.c b/net/bluetooth/l2cap_core.c
index adb8c33ac595..503626f70be5 100644
--- a/net/bluetooth/l2cap_core.c
+++ b/net/bluetooth/l2cap_core.c
@@ -7497,8 +7497,6 @@ void l2cap_recv_acldata(struct hci_conn *hcon, struct sk_buff *skb, u16 flags)
 	if (!conn)
 		conn = l2cap_conn_add(hcon);
 
-	conn = l2cap_conn_hold_unless_zero(conn);
-
 	hci_dev_unlock(hcon->hdev);
 
 	if (!conn)
@@ -7592,8 +7590,6 @@ void l2cap_recv_acldata(struct hci_conn *hcon, struct sk_buff *skb, u16 flags)
 		break;
 	}
 
-	l2cap_conn_put(conn);
-
 drop:
 	kfree_skb(skb);
 }

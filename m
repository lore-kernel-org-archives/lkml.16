Received: from mail-il1-f198.google.com (mail-il1-f198.google.com [209.85.166.198])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 23DDC1E1023
	for <linux-kernel@vger.kernel.org>; Fri,  7 Feb 2025 12:25:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.198
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738931131; cv=none; b=tnmQQe9T+tqpTFXlccmkr98ZrtWyFQ2S4hUKoVTrI0hTi+cuxoGc38pc8iImKPT2cT1P35jO+rhxtHPnKeFcdrMh9cnhWT7NpbcuS1cioy6RoeKg6TJoqjAIt2n67Xqx6wW2erFO1jWe62IXmWzMMTxFMq5N2hSzgckv5ieWW44=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738931131; c=relaxed/simple;
	bh=/OTWA3NQpJyYtscxurp+YWx8AXPjN/31ZTP1WNlca2A=;
	h=MIME-Version:Date:In-Reply-To:Message-ID:Subject:From:To:
	 Content-Type; b=lUOfhev+UyTJPDQwyKzaiuKBPjBvOK/WiRPz91d9w419HPUKQ8KUmCKk51a4QOxlOmHJi7VE+qMeAVByXdKU1EImJ6F2ZcloTkHg8wD0iTD2lQCFJZdmFAP474inPd9jE8rcldpoGCjaGPtsDLZLK5CdqLoOjmgxx45qrBHiJfU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.166.198
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-il1-f198.google.com with SMTP id e9e14a558f8ab-3d00fe9f7b3so32583155ab.3
        for <linux-kernel@vger.kernel.org>; Fri, 07 Feb 2025 04:25:29 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738931129; x=1739535929;
        h=to:from:subject:message-id:in-reply-to:date:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=KoWvzWp6kyKQ0prHOOLvrFtt8oUbgZhqaz1NmpJHtuc=;
        b=B1cr6pW3YRN/leO504FqCgyaLiB2j5EHmQjZRNYmOPm6XsLgl5i7X94u2BzWRZnZyu
         R6DqSimkOqs6HMXFellegVnXa5pwNl/zAELmAJnz5nPi0hXQak6rmFcO6f98WpZCaUOh
         2DXSdcj+IvM8Ludd9xk9C1TZcP1anDyWhUtCNYjXCak/JvjIx9DsQWPcUF0JYeOyxen4
         6iOgXh9+5mbTUatpZhJPANM6tOUMaK4nSXMUtMr9Hzx/rp8BGyclBJ7ERV8BZ924oA7U
         cBLamo9RoMkc2dBLHx7ojbj8sYJpKB6nNiwxAfwYVMj6M5yAuq3VWzsqcEXceOe/Q4zk
         E4hw==
X-Gm-Message-State: AOJu0Yxu635QcnM71zPfcfO7OPAVhWD36yrj0a0G4MELRgbIvsnqm7zi
	FqjOoO0e1qh4j1D07BkJWll3428Mrj4OAuxnJndyTafC1aUp9+Wl4fv3di1NuZZFJuBifok8w4n
	H+Y7UFUFVc4EWFE1bQdXIVQAfm6hUsJwqbVcZKHUYgL2Se7KZfVEKHx8=
X-Google-Smtp-Source: AGHT+IF1HWCdNwykGCf0PWe+4Fq0/nmPEa7xnuNvwpD0rGoWO65qFZO0qEs0bFUQFRrJDTBHIj8hjEN9QTMnTh9fr4vL2taqZB2E
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6e02:1a23:b0:3d0:25d0:8507 with SMTP id
 e9e14a558f8ab-3d13dd23621mr21115055ab.6.1738931129252; Fri, 07 Feb 2025
 04:25:29 -0800 (PST)
Date: Fri, 07 Feb 2025 04:25:29 -0800
In-Reply-To: <67a4b4c3.050a0220.264083.0005.GAE@google.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <67a5fbb9.050a0220.2b1e6.001f.GAE@google.com>
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
protect conn refcnt under hci dev lock.

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
diff --git a/net/bluetooth/l2cap_sock.c b/net/bluetooth/l2cap_sock.c
index 46ea0bee2259..2a99394925a5 100644
--- a/net/bluetooth/l2cap_sock.c
+++ b/net/bluetooth/l2cap_sock.c
@@ -1359,10 +1359,12 @@ static int l2cap_sock_shutdown(struct socket *sock, int how)
 
 	l2cap_chan_lock(chan);
 	conn = chan->conn;
-	if (conn)
+	l2cap_chan_unlock(chan);
+	if (conn) {
+		hci_dev_lock(conn->hcon->hdev);
 		/* prevent conn structure from being freed */
 		l2cap_conn_get(conn);
-	l2cap_chan_unlock(chan);
+	}
 
 	if (conn)
 		/* mutex lock must be taken before l2cap_chan_lock() */
@@ -1375,6 +1377,7 @@ static int l2cap_sock_shutdown(struct socket *sock, int how)
 	if (conn) {
 		mutex_unlock(&conn->chan_lock);
 		l2cap_conn_put(conn);
+		hci_dev_unlock(conn->hcon->hdev);
 	}
 
 	lock_sock(sk);

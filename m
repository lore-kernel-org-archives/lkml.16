Received: from mail-io1-f69.google.com (mail-io1-f69.google.com [209.85.166.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 91C02155321
	for <linux-kernel@vger.kernel.org>; Fri,  7 Feb 2025 06:37:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.69
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738910248; cv=none; b=qcKTPID2CJu8+W6tThcb1/gFF/cFoWUyfPuC3GYcubp1yaopGACi+8YF1jerHck6i2eNzxEGXvHDCZxW21RTXpXka9EHFd+8qNTjWo5eynbJpb/wXKo3/jceXHvJG+qIDfSHdYuPlq4pZjZba+yRk4n8fW9zDLrFFm1CMNXiDjU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738910248; c=relaxed/simple;
	bh=zvvSwfZhokssicPOz/GZniR6nRr/fOMoBK3RtRr9VK8=;
	h=MIME-Version:Date:In-Reply-To:Message-ID:Subject:From:To:
	 Content-Type; b=porPK9B4YCqA6UB5GhRQDPS7LFtGWtRSqt8zqFeUrCPuVhA4GMfc4cQyFi2ne9hPrjUprjPhr1bo+jeOMrbbnyqgrtAv0oo5X3YrjVIzYukbGd5fcWcWqBAQqwfiPuGCrc/j2R5VZwyNiVuPa4R7RNehOfLavgIGQT2ilW/Gt48=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.166.69
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-io1-f69.google.com with SMTP id ca18e2360f4ac-845dee0425cso131462539f.0
        for <linux-kernel@vger.kernel.org>; Thu, 06 Feb 2025 22:37:26 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738910245; x=1739515045;
        h=to:from:subject:message-id:in-reply-to:date:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=jWFzVmwqFEPB3kVf0bBP7DTkmnEzFHeoLfS/hHQSWN4=;
        b=Mwrt9eZFlu+2+8rMwh4a2S630oNBhus0CZ7Io0tJ4ta6vcG/DKIwAVlzVNydrTm58Q
         i3Ec7UUQJlCcMn9bt3yr10ZpHP20DzKda296W9XOuXI59e5d/EhUXNklfy/LjW6hyUMh
         S91a+RfKUN+asGMwd20K8MchmHvQGw9Ua9PRwV2pZxt7pclKOMtlmdmJWJaY2FoHHDcp
         7NTRpJQWFan6MifRjzObktCnjkCcFxDQHN2o5XhIuF48dnkc2FxED3DvXc75nL0f0uGq
         h9i/GPaR/glfTvpg6m+3wmFsLShatNBj2n+3GJWXYPsHiwsSP97NBbs2CuXJZ6JoviHQ
         fNzQ==
X-Gm-Message-State: AOJu0YzcwwTM2dGKK+EWGqemt9VkmIWXZ+h6g+plUEc69Pnvea447Fc5
	ohuv31ecSZka846gLhkaAUrKjWPdeHZsMiUfshpj4x8gyooJCCrGAiAXrfpkHYHBgONvo8j883L
	JaZ+jQ1pk7SRCY8MFLz/D7UcOZ842SPaenRCIoUiLLHxBCIYuj9KKQiA=
X-Google-Smtp-Source: AGHT+IHFEy1v3wn6TYVcgSvKPv7Ni//qXmtJXo5uhXz5l6urrVzYuIRyCK/VDD3tbjH3fID1jIGDqXgtSBQLVPy1DrD2uwWUJNNv
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6e02:2166:b0:3d0:4700:db0f with SMTP id
 e9e14a558f8ab-3d13de8c643mr14753865ab.12.1738910245705; Thu, 06 Feb 2025
 22:37:25 -0800 (PST)
Date: Thu, 06 Feb 2025 22:37:25 -0800
In-Reply-To: <67a4b4c3.050a0220.264083.0005.GAE@google.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <67a5aa25.050a0220.2b1e6.0012.GAE@google.com>
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
index 46ea0bee2259..697e3b56f119 100644
--- a/net/bluetooth/l2cap_sock.c
+++ b/net/bluetooth/l2cap_sock.c
@@ -1359,9 +1359,11 @@ static int l2cap_sock_shutdown(struct socket *sock, int how)
 
 	l2cap_chan_lock(chan);
 	conn = chan->conn;
-	if (conn)
+	if (conn) {
+		hci_dev_lock(conn->hcon->hdev);
 		/* prevent conn structure from being freed */
 		l2cap_conn_get(conn);
+	}
 	l2cap_chan_unlock(chan);
 
 	if (conn)
@@ -1375,6 +1377,7 @@ static int l2cap_sock_shutdown(struct socket *sock, int how)
 	if (conn) {
 		mutex_unlock(&conn->chan_lock);
 		l2cap_conn_put(conn);
+		hci_dev_unlock(conn->hcon->hdev);
 	}
 
 	lock_sock(sk);

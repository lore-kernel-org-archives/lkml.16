Received: from mail-il1-f200.google.com (mail-il1-f200.google.com [209.85.166.200])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD81240C03
	for <linux-kernel@vger.kernel.org>; Fri,  7 Feb 2025 04:09:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.200
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738901377; cv=none; b=DnL2Pm811hXYrYse8c+4XbpF2vA2Sb45YIFx/tBPN+oGYfRKvFdcFPNbS4OYvQ7841/yrmi8nLFKpbzqK89gvxucgwy+OAlok6SuJ/CoI9aQljbxVEqlGoBynUwhACrOaBVfMfXSwUp+FZiyn5KaUcnQUxl8Y1SdLRmjh8dM/Do=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738901377; c=relaxed/simple;
	bh=kVIjufM+xP79ChpkG22ZCVY+SJNKwYtHhpL63nrNX78=;
	h=MIME-Version:Date:In-Reply-To:Message-ID:Subject:From:To:
	 Content-Type; b=J7cOdbIjePK0rfBuBvedq7fzK4N1J5VGmUIniCv9mym6fuR9Vd+qOo7rYtf1QzAoHWhyqxk2sTxkSSOl2J/q5WdY9QXJ56+fhWD5lNJlhRcRCeMvC4FJe9IChFCFVV7DjlGX7e6DpYVQ5LKGBOUcBoA67VyQe9QyFAF4Pk31p+c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.166.200
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-il1-f200.google.com with SMTP id e9e14a558f8ab-3d04f20f2baso31104195ab.1
        for <linux-kernel@vger.kernel.org>; Thu, 06 Feb 2025 20:09:34 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738901374; x=1739506174;
        h=to:from:subject:message-id:in-reply-to:date:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=uvO2T4ovsEBqWlaJQlD7g7dv9kIlFS7kzAm8DZ4WFBw=;
        b=DDuq1OLI3PhDmZpmX649y+Se80AuDugDUg4hrRiMf+1LWelmJWYDXpFWVtW1zgk4Yu
         QgLH4R6Cc+9vOZsZ4noCkhIKVpUgnayef89mDyDt8XGPx8JMJHpSAOhSEkRYxPF4+Hcz
         Sh7F3VYMmKcWwkDj/hHIzCHoTPU0KsgAKBtyHU7QT3Y/cmN9z9j43pTpclbWnlXOD/eE
         9il24QLh58OiHXpUZ70U1Rca1uznjQpeJg3jbH+w+I/vTDf8xHWwmD5wqvPdujJkbhV/
         j9+UoGQkP6n3udHPs/URuCpRk4bTfiuY2uXmxvKKR81KraX41nDT9KWjdEEuHx6ms30k
         vPxA==
X-Gm-Message-State: AOJu0YwHb4Fp2ojcB22sMQOJv8T8IiJO3y4gEJd97iZDNDvyfCA6jMkD
	4yUt7woLEUuknn4WRh7JQgEQsWzpEdXAoGqm6qvg4dQoysb9kGg7qMh3wivab03OCwf3ZcWdeQc
	SBR51/ksOt7CnUMzNO+336nWU09sl382mIG8uxro0bIUlcdAlSoNnyHQ=
X-Google-Smtp-Source: AGHT+IFrFZccUB83eclT4Prz4VZy/DP/RclzRXp6PYCJCxCIfwm7dMyGNf53Y+GkSc+NdQiBDIKIg3cAIhTUA4DWMJDv2JkQHt/c
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6e02:370f:b0:3d0:618c:1b18 with SMTP id
 e9e14a558f8ab-3d13de77aa1mr17015565ab.1.1738901373982; Thu, 06 Feb 2025
 20:09:33 -0800 (PST)
Date: Thu, 06 Feb 2025 20:09:33 -0800
In-Reply-To: <67a4b4c3.050a0220.264083.0005.GAE@google.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <67a5877d.050a0220.2b1e6.000e.GAE@google.com>
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
move chan_del from l2cap_conn_free to conn_del, avoid up level l2cap_sock_release double call it.

#syz test

diff --git a/net/bluetooth/l2cap_core.c b/net/bluetooth/l2cap_core.c
index adb8c33ac595..bbaf2141578b 100644
--- a/net/bluetooth/l2cap_core.c
+++ b/net/bluetooth/l2cap_core.c
@@ -1801,6 +1801,7 @@ static void l2cap_conn_del(struct hci_conn *hcon, int err)
 	}
 
 	mutex_unlock(&conn->chan_lock);
+	hci_chan_del(conn->hchan);
 
 	if (conn->info_state & L2CAP_INFO_FEAT_MASK_REQ_SENT)
 		cancel_delayed_work_sync(&conn->info_timer);
@@ -1813,7 +1814,6 @@ static void l2cap_conn_free(struct kref *ref)
 {
 	struct l2cap_conn *conn = container_of(ref, struct l2cap_conn, ref);
 
-	hci_chan_del(conn->hchan);
 	hci_conn_put(conn->hcon);
 	kfree(conn);
 }
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

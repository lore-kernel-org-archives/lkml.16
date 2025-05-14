Received: from mail-il1-f199.google.com (mail-il1-f199.google.com [209.85.166.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E597E25634
	for <linux-kernel@vger.kernel.org>; Wed, 14 May 2025 13:18:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.199
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747228714; cv=none; b=hjTAH7JMT9TGgwKI+JQofRPzbE7kqhCUcOlH5E/T4A21g8HG6y4d99Yja1Ck5bgEhq8+hG1i2vmsVtakIMyCcOpk6Z17F5DpnzwT45HDQDlG1QDv2Yg0/b5to4evVurnhr3B9djMsbqxpkI2FmNulT7ByTpgkR+clcPtR+Y7oK0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747228714; c=relaxed/simple;
	bh=1noKDeLhRTTVQNZL3sHPFk/SCxSZn2554AMJuECh1CU=;
	h=MIME-Version:Date:In-Reply-To:Message-ID:Subject:From:To:
	 Content-Type; b=gWSTCoXdhLTwzHLfZ/cCrtNaRljbol2jX8eff4kEfRgcA9/EeXSP56nhpBa9W6DXDhS+qQBWbHwULnojGa/l+UobuMEXfIc3ZWijyuhsrL5hytQXdyfK6hFIJgLWaZPbwkW5z/uT0HBadA4CUSwn8sz5IxZdKGSYF2aY5q8gXZk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.166.199
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-il1-f199.google.com with SMTP id e9e14a558f8ab-3d91a0d3e15so74334235ab.2
        for <linux-kernel@vger.kernel.org>; Wed, 14 May 2025 06:18:32 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747228712; x=1747833512;
        h=to:from:subject:message-id:in-reply-to:date:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=SgoHS6qkJPy8Y59B8RTWmb9wuJbrQKF5Fz2rzPXolfg=;
        b=mGZE3QcagloEE/fT3eERBnaDZtCnntuqMpli7yzHNDlcOQvSxmOsVaLSnYFkC3YHTE
         USwWQUJVQd910cstI1XqOfJQ8NYLU0/PR2/860mK4Jin7lcY8D3vk/XEtZcheUKvCZbI
         JHuTQhsmp1/Agri92NUaalMFNofQ+NbA+jc1DNBgi9rWDipeyw4Gw9EkoohK+zCqhDfS
         1Z/3WMVis0PBfiClBjrV8r7hDmshyzsciAXOVO6nLsOA32/gzSMvx/QYLa7NyMKlSikZ
         kJDZfwzNBShvF0DB7B3cqmE91kaTHCd6fA3TOvPPmGUWH1tRrsyXwG4ZF8YJhU+64Xik
         uCYg==
X-Gm-Message-State: AOJu0YzpwBp8WY3FAlE2eeJBISdXlEcL/rJgsmLu+x3qM2A974GeNnqh
	ljupRYy10bZspKkhnKKM7DiIAeG1g0yW9I8FqTZYT7HaV4Gk9x9yEY4kylsd5M6S7VESCt6EIow
	IjGC8eCiruCYF5Z86ad4Ag+83ozKpxNPV9vw7Dfub2g7I5qalroht76E=
X-Google-Smtp-Source: AGHT+IHEOm+mGCgtTz+kyR52qtXsmgCw0yF+YX2OZwBsnM1SN90AvyAYu8eOmkq+ejvZtj55qXzurqhJDwwEWmroF4752v1Duulc
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6e02:3f12:b0:3d9:65b6:d4db with SMTP id
 e9e14a558f8ab-3db6f7be2e1mr44266815ab.12.1747228712015; Wed, 14 May 2025
 06:18:32 -0700 (PDT)
Date: Wed, 14 May 2025 06:18:32 -0700
In-Reply-To: <000000000000ffc5d80616fea23d@google.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <68249828.a00a0220.104b28.000e.GAE@google.com>
Subject: Re: [syzbot] Re: possible deadlock in team_del_slave (3)
From: syzbot <syzbot+705c61d60b091ef42c04@syzkaller.appspotmail.com>
To: linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

For archival purposes, forwarding an incoming command email to
linux-kernel@vger.kernel.org.

***

Subject: Re: possible deadlock in team_del_slave (3)
Author: penguin-kernel@i-love.sakura.ne.jp

#syz test

diff --git a/net/wireless/core.c b/net/wireless/core.c
index dcce326fdb8c..ad812d4be773 100644
--- a/net/wireless/core.c
+++ b/net/wireless/core.c
@@ -1236,6 +1236,21 @@ void wiphy_rfkill_set_hw_state_reason(struct wiphy *wiphy, bool blocked,
 }
 EXPORT_SYMBOL(wiphy_rfkill_set_hw_state_reason);
 
+struct netdev_unregister_work {
+	struct work_struct work;
+	struct net_device *netdev;
+};
+
+static void cfg80211_unregister_netdevice_work(struct work_struct *work)
+{
+	struct netdev_unregister_work *w = container_of(work, struct netdev_unregister_work, work);
+
+	rtnl_lock();
+	unregister_netdevice(w->netdev);
+	rtnl_unlock();
+	kfree(w);
+}
+
 static void _cfg80211_unregister_wdev(struct wireless_dev *wdev,
 				      bool unregister_netdev)
 {
@@ -1252,8 +1267,14 @@ static void _cfg80211_unregister_wdev(struct wireless_dev *wdev,
 
 	if (wdev->netdev) {
 		sysfs_remove_link(&wdev->netdev->dev.kobj, "phy80211");
-		if (unregister_netdev)
-			unregister_netdevice(wdev->netdev);
+		if (unregister_netdev) {
+			struct netdev_unregister_work *w
+				= kmalloc(sizeof(*w), GFP_KERNEL | __GFP_NOFAIL);
+
+			INIT_WORK(&w->work, cfg80211_unregister_netdevice_work);
+			w->netdev = wdev->netdev;
+			schedule_work(&w->work);
+		}
 	}
 
 	list_del_rcu(&wdev->list);


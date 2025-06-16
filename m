Received: from mail-io1-f69.google.com (mail-io1-f69.google.com [209.85.166.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D9AC2BEFF9
	for <linux-kernel@vger.kernel.org>; Mon, 16 Jun 2025 15:18:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.69
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750087126; cv=none; b=bs7eRaYVeBFforIT+Bb38AcbSZSdQMeyJr8QncMrnprIU3k6F6IakbKpjPGtX/247JSXhdwJ0/MebbTqAeiv7+B1ZqV5x4DuvURDP5NTLyEYXzdy+M+aynEuUz9SWN5aQLuvHch+k84pbbRuq565V/IUdQ6akSSP22AINvW9qIc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750087126; c=relaxed/simple;
	bh=Tuzibk2DlH5Ipns7Ujv4PcGD1xdc1k2V17KPDpsOw4w=;
	h=MIME-Version:Date:In-Reply-To:Message-ID:Subject:From:To:
	 Content-Type; b=kWrfgkOgg09OT9UwqhrGVxhVP9VHLvLZM47zSXv7ckleRHkyWgZyY5Mqx67QcTGqXbwuKuUbVa+NyWFKvNm1dUlfJrVM+Po/V0ADc3xsKL4F9bFokwIDJX3mo8CYi/T2b0HXhHwnulp2ppy1PKL+SDW2bk+KuDFlNrVh5wBNuI0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.166.69
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-io1-f69.google.com with SMTP id ca18e2360f4ac-86463467dddso501028539f.3
        for <linux-kernel@vger.kernel.org>; Mon, 16 Jun 2025 08:18:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750087124; x=1750691924;
        h=to:from:subject:message-id:in-reply-to:date:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=w8dxOTrTDAJD1OCCztvcoAkhn+hL2VYiAjXZhSDtU8s=;
        b=ayzRxXnRGOVYhJDL6QrVsMsjA8i+eKHr/2vyfByf/5DGwspPOAlwpXDWFvu8tg0OAL
         BR/Zv4fJvfFCTA6huzn5ZttdsXx2QBw9TLwvLCj/isDCUqRJQvRkkHAOVeSTXxHgKgWU
         ssipsJBVmYgTQmGdP7MANgpKju1VnnkL9f48xGuEQb++phbop9tub6UTnjSZvOrv2RhG
         V8Ez6eVZUhL6ixb0dOBX5IgsmpENHBhCrR++3saXMMqv784ErFowCZScjoV0yvIkofVy
         emlB0+ksOEy3yWc8d9zy/KaIBRzEtYGRX2cv8NOFMS/0ag0zDMfotj2sryNcvb0ryuEg
         Utog==
X-Gm-Message-State: AOJu0YxG8ZXhKt/61Myx9wUIfrGq9UhyNGyqc0OrNfJVuz7jlvI3Q9Sd
	6CV772LgSZ/k9CtF/IIoeVennAdDyG1fP/zHpzXfSxmDYunCAbCJt0oO5/+QMgdvNGqzsBjWtv9
	APUC8r9sM37Pd/OLgicWiPEv2s7Lo1xRw15XqmXou5SS/f2KDDnUjYtUYi+w=
X-Google-Smtp-Source: AGHT+IHHd5k1z7UbhCr6Qf3FrKyqZi8Kqs55igMDltLnsdwFDJb2BYMxf8Ze6f0qTgygD/EKeILDJYSfbWBXl8EbHDXJUM/ic6gI
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6e02:2308:b0:3dd:f4d5:1c1a with SMTP id
 e9e14a558f8ab-3de07cd1771mr98353845ab.17.1750087124155; Mon, 16 Jun 2025
 08:18:44 -0700 (PDT)
Date: Mon, 16 Jun 2025 08:18:44 -0700
In-Reply-To: <673b71bc.050a0220.87769.004d.GAE@google.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <685035d4.050a0220.2608ac.0003.GAE@google.com>
Subject: Re: [syzbot] [PATCH wireless v2] wifi: mac80211: drop invalid source
 address OCB frames
From: syzbot <syzbot+8b512026a7ec10dcbdd9@syzkaller.appspotmail.com>
To: linux-kernel@vger.kernel.org, syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

For archival purposes, forwarding an incoming command email to
linux-kernel@vger.kernel.org, syzkaller-bugs@googlegroups.com.

***

Subject: [PATCH wireless v2] wifi: mac80211: drop invalid source address OCB frames
Author: johannes@sipsolutions.net

From: Johannes Berg <johannes.berg@intel.com>

In OCB, don't accept frames from invalid source addresses
(and in particular don't try to create stations for them),
drop the frames instead.

Reported-by: syzbot+8b512026a7ec10dcbdd9@syzkaller.appspotmail.com
Closes: https://lore.kernel.org/r/6788d2d9.050a0220.20d369.0028.GAE@google.com/
Signed-off-by: Johannes Berg <johannes.berg@intel.com>
---
#syz test
---
 net/mac80211/rx.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/net/mac80211/rx.c b/net/mac80211/rx.c
index 09beb65d6108..e73431549ce7 100644
--- a/net/mac80211/rx.c
+++ b/net/mac80211/rx.c
@@ -4432,6 +4432,10 @@ static bool ieee80211_accept_frame(struct ieee80211_rx_data *rx)
 		if (!multicast &&
 		    !ether_addr_equal(sdata->dev->dev_addr, hdr->addr1))
 			return false;
+		/* reject invalid/our STA address */
+		if (!is_valid_ether_addr(hdr->addr2) ||
+		    ether_addr_equal(sdata->dev->dev_addr, hdr->addr2))
+			return false;
 		if (!rx->sta) {
 			int rate_idx;
 			if (status->encoding != RX_ENC_LEGACY)
-- 
2.49.0


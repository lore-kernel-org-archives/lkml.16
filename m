Received: from mail-il1-f199.google.com (mail-il1-f199.google.com [209.85.166.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0DC1427605A
	for <linux-kernel@vger.kernel.org>; Mon, 16 Jun 2025 13:40:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.199
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750081251; cv=none; b=kOjTEDdPG9Ia+RxxPsapJSlpi5VA6GKFaExz7T2O2U3KGC29YX9cpaCY03KuJ4hEcay7D7REIpuprfBQW6cDo4b6JJtqt+ENs8L2xJVOqi8svDLwJg8AYsnsVy32JrXEp+UywhBqzdMvq/x6tCg58qcGdrO4wPXBPWPwTMeEm9M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750081251; c=relaxed/simple;
	bh=E6deyVxdIiTOKtPqEDHCmsQcDcYWc6rwq51aWS3r0z4=;
	h=MIME-Version:Date:In-Reply-To:Message-ID:Subject:From:To:
	 Content-Type; b=t193sNrqhGLpZXrJySBh44loBwm7S0sRdEN0TbJZ8wsBwd+jKpH4wjmycEbZ9iQmtKiiAbpRQ8wsG1C6fobLyPzOYBxPd3w1kxT5PhCHQpbjkevvmbE6qE64ff5+3987rv6DFKd8aIFqc+sHJKgmCWlWHJR4N0Yiek7cI7B/dTw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.166.199
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-il1-f199.google.com with SMTP id e9e14a558f8ab-3ddba1b53e8so49808665ab.1
        for <linux-kernel@vger.kernel.org>; Mon, 16 Jun 2025 06:40:49 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750081249; x=1750686049;
        h=to:from:subject:message-id:in-reply-to:date:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=eKVOVUfoPBnNfSHhGhHX8beS0CsyPJaHwLe0VYJW/Sg=;
        b=JeA+UVbztg3BUn9q73FHMlBwdEJg2j4hN3C20dErraMHli08RW6peJI9L+f2FASaGv
         tFGMVfaVLzQ988XjiLIIpwQJbU2fm4urnMM0MGEijuzdW+IYoqYO80yZXOErjxZDgmxf
         xoh6AJ4CcnOeiQLCqcBbl49epzq97HA+QyxhfuO9fOtjAkD3eqKamOH9ZK+0imTqX5LG
         kfNw3u89eaemk4fPOHFytLxZ9CXg7F+boPvVb8TsLPj8jCQmONufX4RoYm14IgnSE/AF
         m4pPQdr7PgJnY8lTJt5DYq/dlfgNQIRIW/gxjdviufEea6yB0jsiNyhk8hypd7qezccQ
         QkGw==
X-Gm-Message-State: AOJu0YyvHC/35KX6fBZWXogLmQR3D7NfimNGXQ5wlaOUwI66soeLIFYM
	wkMeSmcCp3U/70TjN8oOnaQUt7hUo8+JvtVEtAbPiWx9ZYupN8G4elnYqCABay5H0fPh73ODEcx
	4KjAMEyAmjyuLOiMupDQ8x+xu+vYhZVag6xAcBdQ4nKWK+f285E0WEP6aaKo=
X-Google-Smtp-Source: AGHT+IGedaX6Gauos9Kt6dFZozz1VCwm7F3kS961tZWkKKKaC8WloGjPXNcY/Iq+IYLSrLAicyjCVDzDAgmkL7cJQMGhgTYEFGho
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6e02:12e8:b0:3dd:d995:30ec with SMTP id
 e9e14a558f8ab-3de07cc8591mr113013155ab.12.1750081249020; Mon, 16 Jun 2025
 06:40:49 -0700 (PDT)
Date: Mon, 16 Jun 2025 06:40:49 -0700
In-Reply-To: <673b71bc.050a0220.87769.004d.GAE@google.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <68501ee1.a70a0220.395abc.01e2.GAE@google.com>
Subject: Re: [syzbot] [PATCH] wifi: mac80211: drop invalid source address OCB frames
From: syzbot <syzbot+8b512026a7ec10dcbdd9@syzkaller.appspotmail.com>
To: linux-kernel@vger.kernel.org, syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

For archival purposes, forwarding an incoming command email to
linux-kernel@vger.kernel.org, syzkaller-bugs@googlegroups.com.

***

Subject: [PATCH] wifi: mac80211: drop invalid source address OCB frames
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
index 09beb65d6108..fe53c664e7c2 100644
--- a/net/mac80211/rx.c
+++ b/net/mac80211/rx.c
@@ -4432,6 +4432,10 @@ static bool ieee80211_accept_frame(struct ieee80211_rx_data *rx)
 		if (!multicast &&
 		    !ether_addr_equal(sdata->dev->dev_addr, hdr->addr1))
 			return false;
+		/* reject invalid/our STA address */
+		if (!ether_addr_valid(hdr->addr2) ||
+		    ether_addr_equal(sdata->dev->dev_addr, hdr->addr2))
+			return false;
 		if (!rx->sta) {
 			int rate_idx;
 			if (status->encoding != RX_ENC_LEGACY)
-- 
2.49.0


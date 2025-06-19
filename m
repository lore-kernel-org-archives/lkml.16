Received: from mail-il1-f197.google.com (mail-il1-f197.google.com [209.85.166.197])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F0E4B259C87
	for <linux-kernel@vger.kernel.org>; Thu, 19 Jun 2025 07:37:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.197
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750318679; cv=none; b=p0TyDILZVmmWkHKJPnXGhfhcdkFkmxbBmpGn0WGzsQ5Ta6+JoFaaugOq97OMRaBp2DtYIvaCE/J73uooGsHYxGO+Ra5WWpv+n4HpCPe6MHuBvJdeMernPamz4YMRbVuLZqzH58Je9DOff0J+QdPjq92VQTTTf2mwRURpH2hyhuU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750318679; c=relaxed/simple;
	bh=zDX+PlWcsR4UfnNxihTWIcFrUqZJYmaTs9MtTUbeiFs=;
	h=MIME-Version:Date:In-Reply-To:Message-ID:Subject:From:To:
	 Content-Type; b=J6Zd0noMue1PPbMOxts4h8JWiX7MVK/Zqt4ihZeNsRGtNDwxbuKC0nOQ3JnhfcKGvRT8KfXW6ox/k1JYvoxTdqVmnGlnoodsNerx1jNB7NlXhhtBBhWZwITnNAIBgg80lgVzBc2VSYL6/le1uaueGwFs59gqwkzDGDNui/wOkPw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.166.197
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-il1-f197.google.com with SMTP id e9e14a558f8ab-3ddc65f95b8so11103845ab.3
        for <linux-kernel@vger.kernel.org>; Thu, 19 Jun 2025 00:37:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750318676; x=1750923476;
        h=to:from:subject:message-id:in-reply-to:date:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=jWfVoIoMsVK+rb4TyBPgmxq/IT7RuCFA4UPH3rbMRs4=;
        b=ZHoYA4IwmqFjpQC6mKbH3wIxq1x6lw+UeSQlxfybLKQuY4+4Kj7t238WII+Pgw07Qm
         taNxrQRMHC9gcK+tq6tHvIj3IH4fadMGHCMKqc6/Wu2FxP48eW5kPnwLtF1Iix9IyCHJ
         R+qRKwUtMQ6r+X/Ig+Ks0eg2PCebffvNYPRZLWYZB+87UnWi9ErcM1oCXFdjikS4wGhd
         DdJPiYAjohBqArnv6pLnpL7Ca6EVpqnBzQ3MaHn3d57BPHPN+duN+X4+eLZHI4RDrmjU
         FGEuHKYdrdcsXzJqhD5n5yrnncMlMUO4CdanUYyeujUdikYe7cK2vuDM5Kgm3pvOjRp2
         EaHw==
X-Gm-Message-State: AOJu0Yz1ulcQWhEhO2rTgyEEUX/iSLz9yvRAiAr4Yqhp16RivxdJv/yN
	PUoxLGew8nriQLq2viRz5YGHJbGNrL2JJhQ1KqZxsyiuZyELi6aCdvLTJl6zhV2tyo/3hnGzceW
	rycpH4uDM0XvY7R3AcxMwInYqJWe+Dc5pqE/1zvU+czB/+3Obsv/GwEo2yFw=
X-Google-Smtp-Source: AGHT+IHgHskAe1UKN86wKzRZXVRWc9+LbubRQQnxUmd4HJ0Y2iJYpSOYhEYpnc0k3t2POaE+mFavufyNrS7n/Zmj6yyPH/zQj/uX
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a92:c247:0:b0:3de:281b:d0e4 with SMTP id
 e9e14a558f8ab-3de281bd3f1mr100359605ab.2.1750318676177; Thu, 19 Jun 2025
 00:37:56 -0700 (PDT)
Date: Thu, 19 Jun 2025 00:37:56 -0700
In-Reply-To: <000000000000dbcd0f061f911231@google.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <6853be54.050a0220.216029.01c0.GAE@google.com>
Subject: Re: [syzbot] Re: [syzbot] [wireless?] WARNING in cfg80211_scan_done
From: syzbot <syzbot+189dcafc06865d38178d@syzkaller.appspotmail.com>
To: linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

For archival purposes, forwarding an incoming command email to
linux-kernel@vger.kernel.org.

***

Subject: Re: [syzbot] [wireless?] WARNING in cfg80211_scan_done
Author: lizhi.xu@windriver.com

#syz test

diff --git a/net/wireless/scan.c b/net/wireless/scan.c
index e8a4fe44ec2d..bfd40797e608 100644
--- a/net/wireless/scan.c
+++ b/net/wireless/scan.c
@@ -1176,10 +1176,14 @@ void cfg80211_scan_done(struct cfg80211_scan_request *request,
 			struct cfg80211_scan_info *info)
 {
 	struct cfg80211_scan_info old_info = request->info;
+	struct cfg80211_scan_request *rdev_req, *rdev_int_req;
+
+	rdev_req = wiphy_to_rdev(request->wiphy)->scan_req;
+	rdev_int_req = wiphy_to_rdev(request->wiphy)->int_scan_req;
 
 	trace_cfg80211_scan_done(request, info);
-	WARN_ON(request != wiphy_to_rdev(request->wiphy)->scan_req &&
-		request != wiphy_to_rdev(request->wiphy)->int_scan_req);
+	WARN_ON((rdev_req && request != rdev_req) &&
+		(rdev_int_req && request != rdev_int_req));
 
 	request->info = *info;
 

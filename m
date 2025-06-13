Received: from mail-il1-f199.google.com (mail-il1-f199.google.com [209.85.166.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0AC9928D8CB
	for <linux-kernel@vger.kernel.org>; Fri, 13 Jun 2025 21:30:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.199
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749850204; cv=none; b=LkQe4LtSngBFYHAbobq8soPo54iqSrncTXf7vcX7+zEFLnzJxP3+sQ7jUERcbdo2MEJUyzJHQJr+47Ejvn8cimeUvNoeqOSw4YuhQs85hOxuKIL9twmg5WDiB/LwXr8kkVxd887HNspGm2dRBGuZCj5aakREY7hlw+8wBflt7Ec=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749850204; c=relaxed/simple;
	bh=VVCtDi/THMNaziVez+/Kfyif66Kw1La+EoS6lUhoS30=;
	h=MIME-Version:Date:In-Reply-To:Message-ID:Subject:From:To:
	 Content-Type; b=IIr21xD9ZK3sTQFq3o8wTbi/ArQb1CCP21SY8E3OEpUllkxCWPv88Yc68PJqfhBAIH4KJCoN1gwV4xEcC0EFvT652OswRm2+faWuSz1w8haOviKiIvsMZAh4zCSKhGCiApohF5afIhiWDZBmWVLSlBqxsdsIH/q7xB3piP2aato=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.166.199
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-il1-f199.google.com with SMTP id e9e14a558f8ab-3ddbb34fc1cso29898065ab.1
        for <linux-kernel@vger.kernel.org>; Fri, 13 Jun 2025 14:30:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749850202; x=1750455002;
        h=to:from:subject:message-id:in-reply-to:date:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=39o0uOIy8QjGOd/DbwJtSHVgR+dZ0CHMjvotGtElSDE=;
        b=oxcxhjjNK6kooGSd5S1Tlv12yQJi+h5kmWVj/V1UK5foAz0wVSModooAjUbe3p44FV
         2pjXc9t9qnN4hwWf9VjTTEsPYbZbbxSJ933IjtM3hfX0DpvAxxFK6UqXFGsxwej/cgAx
         2x4FBWAK/eDL6jgocjdu+yu5Ya8jJzmYgjnzTwiC8lV76BRXlwX3nqdIVXe+kt2AEP/h
         DRIuH4IT1Mo5xJa0K7aMiOlLVEPH3dSoGzLx9dFZ4M//CSh9tbU76x+ztEjUUrjS//Nd
         WHNc9421CU+K7hZXvqogTrKQGI/yR8S7KqSJ1M80v+iwejQvsPMqgZayJgoFT1oIjccC
         NeIA==
X-Forwarded-Encrypted: i=1; AJvYcCVxYRbnOQL3iF81aVSn3iEhIZKuGtWkUbrX2ccWDcj889HmLNZOYxMKHYxSkbukd4BApGvYlEr73BnDzOg=@vger.kernel.org
X-Gm-Message-State: AOJu0YxB4d/DoprDPhxtlqskQgGeDoY168LcYkx6uMoSTDbJC8I23j+Q
	gyYlrnl2K1vLZmaCeo5jEg0zx8cQYaA56DCAxFlxsz6JI6xrITF2N8AI+vS6TBEQKes9ksTehZ5
	XnNPJJBQj55yd1L/EMfcmM8it5iZoq3Gk26lZ/cBq1cu19g4/fWKXCJj9+Ek=
X-Google-Smtp-Source: AGHT+IHkW+PxD4B9B39h1g7efcqLTlZYeOaomRymEnK4adDkhv/HoIAE6ytX221HzaU3iJ8HKARthzS1ikAXB3lVCeVNH10HpKzP
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6e02:1887:b0:3dd:d1bc:f08c with SMTP id
 e9e14a558f8ab-3de07da228dmr14435435ab.20.1749850202173; Fri, 13 Jun 2025
 14:30:02 -0700 (PDT)
Date: Fri, 13 Jun 2025 14:30:02 -0700
In-Reply-To: <684b6ff9.a00a0220.279073.0007.GAE@google.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <684c985a.050a0220.be214.02a7.GAE@google.com>
Subject: Re: [syzbot] [wireless?] UBSAN: array-index-out-of-bounds in cfg80211_inform_bss_frame_data
From: syzbot <syzbot+fd222bb38e916df26fa4@syzkaller.appspotmail.com>
To: johannes.berg@intel.com, johannes@sipsolutions.net, 
	lachlan.hodges@morsemicro.com, linux-kernel@vger.kernel.org, 
	linux-wireless@vger.kernel.org, netdev@vger.kernel.org, 
	syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

syzbot has bisected this issue to:

commit 1e1f706fc2ce90eaaf3480b3d5f27885960d751c
Author: Lachlan Hodges <lachlan.hodges@morsemicro.com>
Date:   Tue Jun 3 05:35:38 2025 +0000

    wifi: cfg80211/mac80211: correctly parse S1G beacon optional elements

bisection log:  https://syzkaller.appspot.com/x/bisect.txt?x=10f60e82580000
start commit:   d9816ec74e6d macsec: MACsec SCI assignment for ES = 0
git tree:       net
final oops:     https://syzkaller.appspot.com/x/report.txt?x=12f60e82580000
console output: https://syzkaller.appspot.com/x/log.txt?x=14f60e82580000
kernel config:  https://syzkaller.appspot.com/x/.config?x=73696606574e3967
dashboard link: https://syzkaller.appspot.com/bug?extid=fd222bb38e916df26fa4
syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=1042460c580000
C reproducer:   https://syzkaller.appspot.com/x/repro.c?x=1442460c580000

Reported-by: syzbot+fd222bb38e916df26fa4@syzkaller.appspotmail.com
Fixes: 1e1f706fc2ce ("wifi: cfg80211/mac80211: correctly parse S1G beacon optional elements")

For information about bisection process see: https://goo.gl/tpsmEJ#bisection

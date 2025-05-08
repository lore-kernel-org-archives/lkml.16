Received: from mail-il1-f200.google.com (mail-il1-f200.google.com [209.85.166.200])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 89748209F45
	for <linux-kernel@vger.kernel.org>; Thu,  8 May 2025 15:49:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.200
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746719346; cv=none; b=I4UT4JMBOyRbjQlCbVPVJsCTidySzRbjE5uxT/4ilZqfdwuc00h0PSipRBimR+9sVirvsqjnJZru7qIWfZw2Vw+xfEFRjV03/zM3/oNgyEC4n/RUHNRL51yvpplJCDBkfuuU+WTnaVC6Y3XMLCJn4469Vk2Bdx/e3N2NRMNJylU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746719346; c=relaxed/simple;
	bh=CThFNMFKx4HWp2XE28KqxH2Y1BwNwB82Ka51sKvSg2k=;
	h=MIME-Version:Date:In-Reply-To:Message-ID:Subject:From:To:
	 Content-Type; b=mUo64t8J2PNA+r784QP59idRVFdljXaP8GutDq/Qh6I7JIsdK7lfclPopgk+AnfYAb/fnjPS8eImpXTI2fmsERrlr4r5wJzH+lPdQVNkfQ5AI1dvCBzzKDhM3OFf+17CBKMk9pBGxr1cu1yaACmF6tIDCxAqvzWGm/hPZY/zDho=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.166.200
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-il1-f200.google.com with SMTP id e9e14a558f8ab-3d8eda6c48cso22148895ab.0
        for <linux-kernel@vger.kernel.org>; Thu, 08 May 2025 08:49:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746719343; x=1747324143;
        h=to:from:subject:message-id:in-reply-to:date:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=aD+jxVgbrfQVFDofzdatQtArk4oPWbWikKud7IOptlA=;
        b=GE5MSN4Ne3MziLT2EZSIS88K5uVkda4m9jvJicQA0W9rjJRXfO6DwYA+JCGavvyomM
         BxKTgpUt5j1L3rVWwp1YD5YxpLXOBjBXAocWeWGwvmXxzmWxsZqETETD7oepHrSK80Q4
         SBTAQiHKxVZ67XIsA6dhYxd4cpVES+Mlw7y+rjzgFvlIw0Aati+ZytyMs5DC9lYUzLOt
         ZzmLHR+C/TJ0PM42TnYMu5W63FUmN/VteiD4nmPIWvrBEd+OXPirX2RzzTTrIMBMLig/
         gYuPZ/rMJdnNQqWGEwwkmgst3J7cVBv07Cx4B/T73/XgowDMJYXYLUVdePxySIZsvfBy
         9FZw==
X-Forwarded-Encrypted: i=1; AJvYcCX20H8PjkOChJ12P50MCT/xQXH06Ecpm+bXkggAFlDSsn831oGNICVNcP8o1RtUGJevTWL9JFF/3/+QFws=@vger.kernel.org
X-Gm-Message-State: AOJu0YxrzaBOzemlWE07Q4jOaDUAHubKq0ZzB+WevcYrXoJOKCkGSxXg
	ZUwjtf2aDlizUa4bZD49mZAy5hErSbmAiF+couDv/Hpc+s6/DEWSU9YIx8fx4AcdHBznR5KrUC8
	Ou5yH7543O0MWbrHfUxgdlWd96fryUmBEHnAKNKabJy2nbOQRqwpslh8=
X-Google-Smtp-Source: AGHT+IFZWx+Z2aq+RnZG+0pCjh3GKc6ah8W6E1+BJ41KJTho9rKRkt85qUUCAas8WRzaxK7EdGyTRM8BLnJDYWP9m2RcKnrwtHLE
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6e02:174c:b0:3d3:fa69:6755 with SMTP id
 e9e14a558f8ab-3da7854f6b3mr43699355ab.5.1746719343684; Thu, 08 May 2025
 08:49:03 -0700 (PDT)
Date: Thu, 08 May 2025 08:49:03 -0700
In-Reply-To: <00000000000054bc390618ccb092@google.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <681cd26f.050a0220.a19a9.0116.GAE@google.com>
Subject: Re: [syzbot] [wireless?] WARNING in minstrel_ht_update_caps
From: syzbot <syzbot+d805aca692aded25f888@syzkaller.appspotmail.com>
To: davem@davemloft.net, edumazet@google.com, johannes.berg@intel.com, 
	johannes@sipsolutions.net, kuba@kernel.org, linux-kernel@vger.kernel.org, 
	linux-wireless@vger.kernel.org, m.lobanov@rosa.ru, netdev@vger.kernel.org, 
	pabeni@redhat.com, syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

syzbot suspects this issue was fixed by commit:

commit 16ee3ea8faef8ff042acc15867a6c458c573de61
Author: Mikhail Lobanov <m.lobanov@rosa.ru>
Date:   Mon Mar 17 10:31:37 2025 +0000

    wifi: mac80211: check basic rates validity in sta_link_apply_parameters

bisection log:  https://syzkaller.appspot.com/x/bisect.txt?x=101444f4580000
start commit:   0ec986ed7bab tcp: fix incorrect undo caused by DSACK of TL..
git tree:       net
kernel config:  https://syzkaller.appspot.com/x/.config?x=864caee5f78cab51
dashboard link: https://syzkaller.appspot.com/bug?extid=d805aca692aded25f888
syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=12fb56e1980000
C reproducer:   https://syzkaller.appspot.com/x/repro.c?x=17490685980000

If the result looks correct, please mark the issue as fixed by replying with:

#syz fix: wifi: mac80211: check basic rates validity in sta_link_apply_parameters

For information about bisection process see: https://goo.gl/tpsmEJ#bisection

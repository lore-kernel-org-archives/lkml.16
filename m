Received: from mail-io1-f72.google.com (mail-io1-f72.google.com [209.85.166.72])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E58419F130
	for <linux-kernel@vger.kernel.org>; Mon, 30 Jun 2025 20:06:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.72
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751313969; cv=none; b=EjdYuALKs7aWZo5OrC/5I/qP4h9yqN4Ma/hBcFE7T7XqecGsu5o5R7y8mQo2i3Dktyb3xEvbVUznNoOf/HikeaclTFMZXbg7Y4qG2dqbLp0/QbBdzPGZPUX2PAUNdcdNsiRZoUr7QjHiGfrGMFaxBPsuOhBJqVXrZQGS5IZMZNU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751313969; c=relaxed/simple;
	bh=vxqUvzEtycLX2uwSnwSxV7xuNpdTK19305Hle3yzfE0=;
	h=MIME-Version:Date:In-Reply-To:Message-ID:Subject:From:To:
	 Content-Type; b=k4QpIIPs2PZzA/Zh+/suSCjcCzsprgPjD6rKM6eWbUQ7V822mzTC5Ew0peCXkIcaCdoqQVpntNtmvcvWD1pzRa4+UfmwUuruxjW745YPcb5UE+VJ/PPPlgQNSb5X4+lEk9tWmhWHicosDqQNCwKiE4hFxw1vzI4ySjJ48NcEa1k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.166.72
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-io1-f72.google.com with SMTP id ca18e2360f4ac-86d07ccc9ecso200051139f.0
        for <linux-kernel@vger.kernel.org>; Mon, 30 Jun 2025 13:06:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751313966; x=1751918766;
        h=to:from:subject:message-id:in-reply-to:date:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=EgZa1K/vTllhUfzVk2VRrexnWLbHSyNeEOU66vsRy2Y=;
        b=IjxnkVdZ609GkF6sG2kiF9+R2DJwOl67PZsdL+fvF4ukFtZ4aOXorOScUT9owdbD8K
         OyCIJIx7wqjEdvfHeN5drp/+eRhePOZ7ezcJJWyIQL+wp5boXPhutilsQH+iJOHbK5M3
         av6Nm3zTJQOhbi6ZQya6lk+3DZ/ZV2AY62o9ysVqf/k4RQ9qomfHaR2GncV47e6vE9tT
         Q2+mLyDpR95R+gpLTsPwwCZlNJeOrSxcZN5/HontvnF+TFZZfhZPDFgJy77wu5UajGRZ
         iUMU7PdeLCLkv4HbZvESpotgk8sZYmeZ94Q62U+6NN6dtordIeHakuDjGKyaRYS+Ae3p
         1EcA==
X-Forwarded-Encrypted: i=1; AJvYcCW5IUvkIwDIGYGdh4fFXasQYQOV630W8YfLN0QnnWAutdHxd486MCa9Fy1auz6HSuBJkesrNvcQCbOhB04=@vger.kernel.org
X-Gm-Message-State: AOJu0YwP2Wd2bHAPW3R7oawU4dCgptr6vz1EN57fIei/8GC54QhbBzmc
	J4iQ5BgK2LZFRJzT2HaYst2QMVNoNSxxZvkAMqrDsuR10lPEFTyTYhoylNObJHr6l3U0w574xU0
	mS6WPx9mEoBe9AM5q04qBIuQFxdRlCBKxm8adOmP1H2q+4zi7JRWZnFbnF3Y=
X-Google-Smtp-Source: AGHT+IGFAg8qrKEAdfFKo+eetAWbYYHHguaEUgD7Sc0SNaNMdNoqOft/r0bJXnB+XkfOWXekaoKvyVK4MVidWaZ+nIK6IeW1+RRC
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6602:3f96:b0:876:8cb1:a010 with SMTP id
 ca18e2360f4ac-8768cb1a04bmr1412467139f.7.1751313966641; Mon, 30 Jun 2025
 13:06:06 -0700 (PDT)
Date: Mon, 30 Jun 2025 13:06:06 -0700
In-Reply-To: <000000000000ebc1a306219068a5@google.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <6862ee2e.a70a0220.2f4de1.002d.GAE@google.com>
Subject: Re: [syzbot] [kernel?] WARNING in get_pat_info
From: syzbot <syzbot+16b1da89309a06cd0e3a@syzkaller.appspotmail.com>
To: akpm@linux-foundation.org, bhelgaas@google.com, bp@alien8.de, 
	dave.hansen@linux.intel.com, david@redhat.com, guohui.study@gmail.com, 
	hpa@zytor.com, jannh@google.com, kirill.shutemov@linux.intel.com, 
	liam.howlett@oracle.com, linux-kernel@vger.kernel.org, linux-mm@kvack.org, 
	lorenzo.stoakes@oracle.com, luto@kernel.org, mingo@redhat.com, 
	peterz@infradead.org, seanjc@google.com, syzkaller-bugs@googlegroups.com, 
	tglx@linutronix.de, torvalds@linux-foundation.org, x86@kernel.org
Content-Type: text/plain; charset="UTF-8"

syzbot suspects this issue was fixed by commit:

commit f8e97613fed25758ddf52159b87e1c66e619a23a
Author: David Hildenbrand <david@redhat.com>
Date:   Mon May 12 12:34:17 2025 +0000

    mm: convert VM_PFNMAP tracking to pfnmap_track() + pfnmap_untrack()

bisection log:  https://syzkaller.appspot.com/x/bisect.txt?x=12f1448c580000
start commit:   fac04efc5c79 Linux 6.13-rc2
git tree:       upstream
kernel config:  https://syzkaller.appspot.com/x/.config?x=fee25f93665c89ac
dashboard link: https://syzkaller.appspot.com/bug?extid=16b1da89309a06cd0e3a
syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=13e2ab30580000
C reproducer:   https://syzkaller.appspot.com/x/repro.c?x=11d113e8580000

If the result looks correct, please mark the issue as fixed by replying with:

#syz fix: mm: convert VM_PFNMAP tracking to pfnmap_track() + pfnmap_untrack()

For information about bisection process see: https://goo.gl/tpsmEJ#bisection

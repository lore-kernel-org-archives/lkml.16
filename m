Received: from mail-io1-f71.google.com (mail-io1-f71.google.com [209.85.166.71])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A220A26B77C
	for <linux-kernel@vger.kernel.org>; Tue,  1 Jul 2025 21:43:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.71
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751406187; cv=none; b=K8ekv5ZeCSZJpECgIaX1yJqJHA89OuTXMz0NhwJYJ1smpIf74iKSEAwkJBaDSF5z9uC2Hy8Al7o59nS4WkN3tqZrNIRQo4Q+wCzqP26wtpn6APE4ayS4uzvINgHIvoEN/z6HQNbceN+a4weJ6MTlNceXEsfN8Yeim7TKrN2NObc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751406187; c=relaxed/simple;
	bh=GD1MbHI1UQGy1Mfi+FQPjWBjhErFOOxEujWPQoOI3Yo=;
	h=MIME-Version:Date:In-Reply-To:Message-ID:Subject:From:To:
	 Content-Type; b=KgRCOmPRrRcKV7yR/Eft8o8lSyp6C+nxKlEVPRJbeUDFjCmE033MC5nGKJ8KS+P9R+dWdIHO7WmMDqTGy0CKV94CNNfxrwAiWCMF1X5pJWCQdUKUBLDD1IaXieQ+IeYNEVYe/PQSqgGUG3U7Dh5gCmmsztyoXlnKKSsoMhRvees=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.166.71
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-io1-f71.google.com with SMTP id ca18e2360f4ac-86cfccca327so1218441639f.2
        for <linux-kernel@vger.kernel.org>; Tue, 01 Jul 2025 14:43:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751406185; x=1752010985;
        h=to:from:subject:message-id:in-reply-to:date:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=gX5XYkr7MyQHKzwHLNSXPRwkDTB9kEMGUknsdD0F2ko=;
        b=mTKye5VhU5OOKqHgED5Dia2fWMjYaOqsTwEUo6QT2uVCe8JJlqYRlpI8uUDDY6lDan
         6i5Atn9rH/UWjdazZd4j0jh2LfG5G2yO5R0BOr6c/YQONPI2YIvdVk01Ub/TrbZS1fij
         Ulo9FOY0lrSy1qPoF43YAP0E8bAdhrsnKv1faKEpXUTCOfymMHD+zw/JmQBibcHzpbOj
         8dPA96wJSimUYjj2+myjFrhta1VgsMpzHlxljH7tFh51F2eAYeta0XeAGzmdBjeXUun1
         5jpst71tCJ3JwzPzrGY7MpCiCNSDrlOnMNc3vFjfsxFz5mWvynEbP1/yCFR7H/Z5opPf
         A6pw==
X-Gm-Message-State: AOJu0Ywl9KlgPBTeqq3ZmkcF76/RM0rcRQaD+R5//OCOpRe5tEqeNY1G
	RJCSylCwgp4tcLrr7OkGH580TPnlK0GzzouAsrzZgwp2L8bkf0NW2aCaa1Uc333412A6xshanR4
	O7RTAfSQvgeimg1vT+kMMTCj1uavWJkEZtT67r7FmqbIBKEzeP19O6S1DOyU=
X-Google-Smtp-Source: AGHT+IE+EUrIwwDSAIX7BRsrVbgF3p13sUtOPrRJD+skSuXm4ROAIEOlq1H7mqtFySVoMqZ+haBK7P+1SYjrMGGkWi03l/wAQeSf
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6602:2c8c:b0:86c:e686:ca29 with SMTP id
 ca18e2360f4ac-876c69e2516mr98209939f.2.1751406184931; Tue, 01 Jul 2025
 14:43:04 -0700 (PDT)
Date: Tue, 01 Jul 2025 14:43:04 -0700
In-Reply-To: <20250701211105.280128-2-moonhee.lee.ca@gmail.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <68645668.a70a0220.3b7e22.1fb7.GAE@google.com>
Subject: Re: [syzbot] [wireless?] WARNING in _ieee80211_sta_cur_vht_bw
From: syzbot <syzbot+ededba317ddeca8b3f08@syzkaller.appspotmail.com>
To: linux-kernel@vger.kernel.org, moonhee.lee.ca@gmail.com, 
	syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

Hello,

syzbot has tested the proposed patch and the reproducer did not trigger any issue:

Reported-by: syzbot+ededba317ddeca8b3f08@syzkaller.appspotmail.com
Tested-by: syzbot+ededba317ddeca8b3f08@syzkaller.appspotmail.com

Tested on:

commit:         e34a79b9 Merge tag 'net-6.16-rc4' of git://git.kernel...
git tree:       git://git.kernel.org/pub/scm/linux/kernel/git/wireless/wireless.git main
console output: https://syzkaller.appspot.com/x/log.txt?x=1290b982580000
kernel config:  https://syzkaller.appspot.com/x/.config?x=cd6a0fc5a3df8326
dashboard link: https://syzkaller.appspot.com/bug?extid=ededba317ddeca8b3f08
compiler:       Debian clang version 20.1.6 (++20250514063057+1e4d39e07757-1~exp1~20250514183223.118), Debian LLD 20.1.6
patch:          https://syzkaller.appspot.com/x/patch.diff?x=13b39770580000

Note: testing is done by a robot and is best-effort only.

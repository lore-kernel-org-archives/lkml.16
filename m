Received: from mail-io1-f70.google.com (mail-io1-f70.google.com [209.85.166.70])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E5C923085D4
	for <linux-kernel@vger.kernel.org>; Thu, 19 Jun 2025 04:29:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.70
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750307345; cv=none; b=tFycTugWHxcqfbAgF5lcx4/xOibIv6lOPiW3RIcuTdxm6uwaqvyefPKRa1Zc06RIqL5Fe0DEmxDZvm3NFDTHdQ/tDyHQ7n4LVsF0d5J3ZhLtGFKpK/IBth+XRJNsKPbaUz869f3zigh1uV8DUB2RP/y4BcX+C6GNt6Wd1R6QKqk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750307345; c=relaxed/simple;
	bh=4lM1Pq8+OIPnLmUR0BvubcerHmS5fqj8yAXuchrWxrY=;
	h=MIME-Version:Date:In-Reply-To:Message-ID:Subject:From:To:
	 Content-Type; b=s4blMzB08zquoGrYHUJUQaJKyH0AHB+cV4Ah/LaPz9C0uZPBmOZQoBAZ47ghlvQhX/wFUYTQCmbmS7X/j6jT6Sj4nDpV+aWWkXvCtrMebL/czEk6yYRgFgu4sPUvBMZksXSct5rmaHzDs8XEok71YTNeIsxPHqQQDnJHnv2gQUE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.166.70
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-io1-f70.google.com with SMTP id ca18e2360f4ac-8754cf2d6e2so32043339f.3
        for <linux-kernel@vger.kernel.org>; Wed, 18 Jun 2025 21:29:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750307343; x=1750912143;
        h=to:from:subject:message-id:in-reply-to:date:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=0RTBHQGJ4o6rnPsqSnb4biPDUygoMp38eBwORzFpO5c=;
        b=NZ7xekRUrJqXLHyYOeiciLwCS8BG3II4CYO0aE1DidLL3lW2pBW/edlZejwKVSX980
         HWxxKmpWXtZclD0XEHGb5ABuBJbs+V61lg1sai4FKm4aDyyZJj+1/f6CgWOMAhml10zl
         ZB28ZzKaCWJgRXm+Dlin5lxMD0nixpYg8/2CKRcAkuurea+44hfy5Ys9UjztJ1vCLzOo
         aujcXWqKh72ompkrnYGhdbJExGAtVfZ53ZZgrf/xpsgcUYdLnuF4K/R2c9M6PN1zj0S9
         af5CDgsSabBYSKKCZBGFzT0LkEWL3ZfxSHSJJJqpbTPwt5lvtqpbMRrSOOaFVYh1GD13
         Hx5Q==
X-Forwarded-Encrypted: i=1; AJvYcCXFoyDP0Knd7yMgEl911/v8+oqcC8QYSOmo6QSo9DU8BqE4kWlyMYQq0zgOqz+YvtkZaEFmoNw4m+W7JPg=@vger.kernel.org
X-Gm-Message-State: AOJu0YyMXSRIZ+EviLP7uJEV/jdRwhRb62bEcT3U+rnZcSghHaUEBM4S
	uI98tEyBUPc2bWaMEAUBACi0TUu75SMZYxbesjZmxepGnji99cU658xzZQJg7QPZRRlFGxof5LC
	2FY/rQi7Uiq8NZ6nAQ2yIhA1wFXhae7+bYZeYBxi+2CSrh0LYoXVxcgqM/N4=
X-Google-Smtp-Source: AGHT+IH47ft2xBqsJgNwYhR12OCsOlAJNYrhkFplkeG8vasj3H+hW021FoknFfn/xqeoMarDrVNpaeHDJAZFMByJK1zAcJtHLgQ8
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6602:3fc3:b0:875:acf6:21a with SMTP id
 ca18e2360f4ac-875dedc39afmr2217590039f.11.1750307342971; Wed, 18 Jun 2025
 21:29:02 -0700 (PDT)
Date: Wed, 18 Jun 2025 21:29:02 -0700
In-Reply-To: <5a513fca-b8cd-40b9-9b28-9793cf80e293@linux.alibaba.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <6853920e.050a0220.216029.0165.GAE@google.com>
Subject: Re: [syzbot] [iomap?] [erofs?] WARNING in iomap_iter (5)
From: syzbot <syzbot+d8f000c609f05f52d9b5@syzkaller.appspotmail.com>
To: hsiangkao@linux.alibaba.com, linux-erofs@lists.ozlabs.org, 
	linux-kernel@vger.kernel.org, syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

Hello,

syzbot has tested the proposed patch and the reproducer did not trigger any issue:

Reported-by: syzbot+d8f000c609f05f52d9b5@syzkaller.appspotmail.com
Tested-by: syzbot+d8f000c609f05f52d9b5@syzkaller.appspotmail.com

Tested on:

commit:         0097d266 erofs: refuse crafted out-of-file-range encod..
git tree:       git://git.kernel.org/pub/scm/linux/kernel/git/xiang/erofs.git dev-test
console output: https://syzkaller.appspot.com/x/log.txt?x=1732b5d4580000
kernel config:  https://syzkaller.appspot.com/x/.config?x=162faeb2d1eaefb4
dashboard link: https://syzkaller.appspot.com/bug?extid=d8f000c609f05f52d9b5
compiler:       Debian clang version 20.1.6 (++20250514063057+1e4d39e07757-1~exp1~20250514183223.118), Debian LLD 20.1.6

Note: no patches were applied.
Note: testing is done by a robot and is best-effort only.

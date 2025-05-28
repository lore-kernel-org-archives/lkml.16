Received: from mail-oi1-f199.google.com (mail-oi1-f199.google.com [209.85.167.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A83113A26D
	for <linux-kernel@vger.kernel.org>; Wed, 28 May 2025 13:12:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.199
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748437934; cv=none; b=BPEWZJf6G2y0f+oTQdEFtM2fqa2FACKRBE3eOMmcuAseaHk6uRn0252HiJpthx7kPSR+bW9WRSmTjrqb5bj4xYw8LrqlKli/E2qYbWKH8Wbf6Z2QlJjpvKqZSHRBuxXy+X80Zxb7NrHYyuunaPQrPVuO6kqK/qJ7tew/qjqBrSY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748437934; c=relaxed/simple;
	bh=u3E+p0YK3EjavDdgvYc10Ll4ApdsWBtA5D7ZIeuCLA8=;
	h=MIME-Version:Date:In-Reply-To:Message-ID:Subject:From:To:
	 Content-Type; b=HtcxQvoD6u6lzh5S140rekGferzaFQjLF4I4jRVaK3V1blYIi0y1OhNi/lWPsNFZu80ZrSD6q6l9CHEolTyOG6BsfLmrpSXiW2HU/6KPksjkZFqu2bf7RCjN85uuQy7zufIcFafGJOMHYw2QplDOjea8i6zVZ3GKlEY49uz/RY0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.167.199
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-oi1-f199.google.com with SMTP id 5614622812f47-4063a606742so1150247b6e.3
        for <linux-kernel@vger.kernel.org>; Wed, 28 May 2025 06:12:13 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748437932; x=1749042732;
        h=to:from:subject:message-id:in-reply-to:date:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=NjMgq5YPEqClBeK1w0Fn9qy7mcRG8bP+yBk7386/22A=;
        b=dv8uIprV/9DbDNHx/m8xIgWOo/ItTks7dzDJv48t3ybHFcuF7nvRGLpMmzM5WMlSEj
         MkOOAoYxmPN07Ie5T3ZAOZnXimCcFNx/WR09qh97db3zYcQ7R73/ULnzmMH95w7ucIK2
         7N9LWv7UtSuhSGy3xgWnG71/ObSgqsKISZmgNSRlblQSB6dH4oKEQ2hY6ZrMwUGCEv5P
         2wvoPUFekvzn0dWoegh8z+jcsNGc8OkeuCpZw8EnDHWvc+ZF60Iu8uC7eQdQDpU9I284
         MYyy7pHxQFF3eVCAoqE5ZHipOgd/TMIWJhEa9q3dVpjb0Gd+vKGBRgMsGTQ1XqiiOE+w
         rWqQ==
X-Forwarded-Encrypted: i=1; AJvYcCUamfAhBSrXQp5vOHg42OJ+VE9k6yStult2w85x1N2FltCaS93DmVP0OYODXDU4R9StOhdNRj7xdEVweF0=@vger.kernel.org
X-Gm-Message-State: AOJu0YyJBFKbGVQF4ypXMPus9XJFRzA7SFVXAF2rM5lafZ1bCCWpgL4b
	8eo/gsBQk1GzGNCAE+CIWZArM2R85jTWJd4NnO2ouJqA6FnVb3UquqS4D+S9wn+nKx8DPA81vB2
	sAS0NTM4rHC+Bc1kFMx2pAuNrkP26vI6WTWHaUP2aa0jR6UhMG9+8F8Dl6YE=
X-Google-Smtp-Source: AGHT+IFvHD9chitsQ2/drZtV3SXkmJTqKG1P/5ky6Q16A7AZI2qwD4DbDQxH3sHJm6ZvU8cIiTNkl3kRjFEQEe4VmK2jFrM3zDIj
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6e02:2601:b0:3dc:79e5:e6a8 with SMTP id
 e9e14a558f8ab-3dc9b734464mr173032695ab.15.1748437922096; Wed, 28 May 2025
 06:12:02 -0700 (PDT)
Date: Wed, 28 May 2025 06:12:02 -0700
In-Reply-To: <CAGR7w82zibJcdbxq8d-VZDj-uO3kXZbMuSx=HZTMRVdfnLiaQA@mail.gmail.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <68370ba2.a70a0220.253bc2.00cc.GAE@google.com>
Subject: Re: [syzbot] [i2c?] KMSAN: uninit-value in __i2c_smbus_xfer
From: syzbot <syzbot+0a36c1fec090c67a9885@syzkaller.appspotmail.com>
To: abhinav.ogl@gmail.com, linux-kernel@vger.kernel.org, 
	syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

Hello,

syzbot tried to test the proposed patch but the build/boot failed:

kernel/futex/core.c:629:15: error: no member named 'page' in 'struct futex_key::(unnamed at ./include/linux/futex.h:33:2)'


Tested on:

commit:         feacb177 Merge tag 'sched_ext-for-6.16' of git://git.k..
git tree:       upstream
kernel config:  https://syzkaller.appspot.com/x/.config?x=9dc42c34a3f5c357
dashboard link: https://syzkaller.appspot.com/bug?extid=0a36c1fec090c67a9885
compiler:       Debian clang version 20.1.6 (++20250514063057+1e4d39e07757-1~exp1~20250514183223.118), Debian LLD 20.1.6
patch:          https://syzkaller.appspot.com/x/patch.diff?x=14ae03f4580000


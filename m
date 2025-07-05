Received: from mail-il1-f198.google.com (mail-il1-f198.google.com [209.85.166.198])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA6ED5383
	for <linux-kernel@vger.kernel.org>; Sat,  5 Jul 2025 03:12:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.198
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751685125; cv=none; b=AeNRSsPKYqHGW//JKGyPkbxY1aEes9SDT6x4LHAu1pUS5B41BxVTyuh58OKn2l2eJdZyC4VZB+nHDpe7J9mZzs4twBtOdlyKTWa143VPJx33hCGMmA6cJnAzINBDyLBl8DL7+jNFK7QP2M5WhibykL+41CgPPqGIN3JJcne7iV4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751685125; c=relaxed/simple;
	bh=FNbvqNkURquD762gS9STHl+hui1rN7Zfv7eGKT0HTPU=;
	h=MIME-Version:Date:In-Reply-To:Message-ID:Subject:From:To:
	 Content-Type; b=Iq5lP9YQZhhiAxj6wEtuldPNkoC0msSiy/1XIF7DV0U9giDVxohuCzTJrMS5PnPaoT32DFcCK2JQM8CB4E4HFfiMaVuSTcMJEHTTmqZ6JI92oKy6tteurnt34ju9O2S4R2Stm6h/DhIu2vLYgHF+QpkPXghPOLNb9Mfm807N/aY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.166.198
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-il1-f198.google.com with SMTP id e9e14a558f8ab-3df2e89fc8aso11702255ab.2
        for <linux-kernel@vger.kernel.org>; Fri, 04 Jul 2025 20:12:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751685123; x=1752289923;
        h=to:from:subject:message-id:in-reply-to:date:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=SfkYRZFY4qXPRYTlfsyUroMoRuRA8g4kZKpxKyWnTGk=;
        b=qTliNY3YhBwv9Exw1c9/g1MLw91Gx0yBnrP/yRrc5DAhaArwnZdskuCXup57mKi6Y5
         uGZxi9neVapMoJ2oYtj3Kj3tSFqq0KNvUdCX08TkdK7oBLjuAIYu/N7EHprVRXPXR7tp
         WjTOKZdLIOABVe+ykAv3and37YxuAE6Y/btmvp2fRQwcp5+Ar5m6BP1kikqMWhp/lRXv
         xALBWyR4gh8TEqP8WAuuWEJaqEUCSpvqN3ab8U/Qmc1ikdOUf0ABuCmfehZR3QZ5nSmv
         A3nUMtygcRNfD9Mi8cd015cck5sVDg7Awn9ZnlxkZHQHbdz7MxMsn4K1X/T7s4E6/egG
         fkoQ==
X-Forwarded-Encrypted: i=1; AJvYcCUCjjEsuMW1Ypem+pVhhEyBNTzgChNaPY4yZgvvIfWPMdWUAhPSCmPyCLHMxDk95diJ4kxdndWJ1dpAgxc=@vger.kernel.org
X-Gm-Message-State: AOJu0YyJ1n5jYzyneNYIMc7EVIqkhtC414K+YgSc55loxuO1WL8XGj8e
	LQJzhqKPppb8eRihbUL2+/AkGQcdQIPMaA+19+/9B9ALzu3/21uTEEM49MVinwNiL/CAHVfdNTl
	C1sc5RZqOyK16uIRPTluvqY0ShOqTvL5OQmAyXch+g/jdo1CYGOgj1rLsF6k=
X-Google-Smtp-Source: AGHT+IHWijliApL3W54b/2OC72jH2PIp0XFjn1rU+cfdJdc6LKhrnIFQkYjwDAj7qL6z3tFZr0fvj4P5ItUuMelhn/YS3e6jKPoY
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6e02:12cf:b0:3df:43ac:af5a with SMTP id
 e9e14a558f8ab-3e13ee82941mr10128465ab.2.1751685123080; Fri, 04 Jul 2025
 20:12:03 -0700 (PDT)
Date: Fri, 04 Jul 2025 20:12:03 -0700
In-Reply-To: <tcgpo4362fun5lfqbioewmnnoocpt7ryeezthhc4bfzagpw75n@t5cg6himsvmw>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <68689803.a70a0220.29cf51.002e.GAE@google.com>
Subject: Re: [syzbot] [ocfs2?] possible deadlock in __ocfs2_flush_truncate_log
From: syzbot <syzbot+6bf948e47f9bac7aacfa@syzkaller.appspotmail.com>
To: ipravdin.official@gmail.com, linux-kernel@vger.kernel.org, 
	syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

Hello,

syzbot tried to test the proposed patch but the build/boot failed:

failed to apply patch:
checking file fs/ocfs2/move_extents.c
patch: **** unexpected end of file in patch



Tested on:

commit:         a79a588f Merge tag 'pm-6.16-rc5' of git://git.kernel.o..
git tree:       upstream
kernel config:  https://syzkaller.appspot.com/x/.config?x=fd0cea6d0f67318f
dashboard link: https://syzkaller.appspot.com/bug?extid=6bf948e47f9bac7aacfa
compiler:       
patch:          https://syzkaller.appspot.com/x/patch.diff?x=15bcec8c580000


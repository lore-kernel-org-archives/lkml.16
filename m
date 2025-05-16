Received: from mail-io1-f72.google.com (mail-io1-f72.google.com [209.85.166.72])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 359891E5B97
	for <linux-kernel@vger.kernel.org>; Fri, 16 May 2025 19:05:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.72
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747422304; cv=none; b=O5w247EjEjpg+SWZt+NLq60AVeNP29e+EYHUhoyqdALnpkvyO1B0c2MMHpqZbL3olzYdLVltoKU/ze6/CmTBeq4BwISGzUtuiZyNnJcbjxzlGHZd4VBzFv0rlHhoskrQ1VxXGlHRG6Yl1+KYhRzaZkfdg/HF+wIpGXKzGGMTDD0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747422304; c=relaxed/simple;
	bh=gQlLtupqchd+VGw1m6GFog7hF1kAnH4Py+LcB/09kc8=;
	h=MIME-Version:Date:In-Reply-To:Message-ID:Subject:From:To:
	 Content-Type; b=adQObOz4yNr27E1q9vS/C7HkmrEkxpvV/3rAINo3hqUBOFGnsaN3O+rmHqWUcjocES4SqGhrVOoXaEECnYV46ZUQBlh6oFcsQZT2WFpMViIVbR8U7UVmaWw5+5h6cSvImEvKXdqBNoxKIB5CnoeOjd+lDtrBZoEwp3K0AaSz4zE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.166.72
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-io1-f72.google.com with SMTP id ca18e2360f4ac-85c552b10b9so217591039f.1
        for <linux-kernel@vger.kernel.org>; Fri, 16 May 2025 12:05:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747422302; x=1748027102;
        h=to:from:subject:message-id:in-reply-to:date:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=tG0uI48XtWaf/yGrkPFaLuTmk7Ns93cu4doQPAqa38A=;
        b=Ieuosq1+fE5Lka7lUAAx8LxdC6UeyzPsbClkmejz4yZwXcmIZxFdbygwyTZctvWczC
         UvmjW0Owk9e8mNMbByhqVAjgrqUyvxDq/rgVKUIiKb8JlXHSurqKZlJBfPzi8JlwpG8D
         hX7+AnveCBfjGoR9BWUzaKuqOijy00pHpdVmosZv/EMQvUHouf5dmj3vgn17yLnu+b8t
         qurzRuXIwQHdoStPA+zrPL11dxNmOy1AQO2cmEBfjm3yVnlfacjKowlnQnEUJjMXwRzM
         sOwO/JwaBUkmqy9Hnv2segd6DvY5luuzTd6ZKjHZESj7uUMQvEE4TY/y14JH8dyquAkJ
         nG5Q==
X-Forwarded-Encrypted: i=1; AJvYcCVX16Smk7/JZDbAAIQQnS1FDyAMdn7SyrCJTmMnlD6YQo34ZM0FpaU3ac/3PEPOLH8/P5Wx5DAphQFhmCY=@vger.kernel.org
X-Gm-Message-State: AOJu0YyWRsbDiA711+Y0rwe+p3QnaIo0WqHCERRbKifp9B2IOZcw2qjX
	hn04QD6F+0TUoJzYGz37e1KaBSXpH0jB13L82ndSK5vb4b7YeYjn5KtfSb88DCeo63d6CEXLUCn
	ZG6a07zm1/WdHbT17YgzfiaI6qXCYfsC0wG/ZQnlVncIuX+leb8xtinvzsq0=
X-Google-Smtp-Source: AGHT+IEvrHcKqeiGi7f4tEGfoyJCIL4pm1MR4Wh341A7kttwMiEMC+6SfCDPSGaCqjaLX/jGukj8N8JCMo45yinr01e95D8SiACc
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6602:3607:b0:867:237f:381e with SMTP id
 ca18e2360f4ac-86a2317b1f5mr656942039f.2.1747422302275; Fri, 16 May 2025
 12:05:02 -0700 (PDT)
Date: Fri, 16 May 2025 12:05:02 -0700
In-Reply-To: <20250512155843.20034-1-aha310510@gmail.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <68278c5e.a70a0220.38f255.0006.GAE@google.com>
Subject: Re: [syzbot] [ext4?] general protection fault in jbd2_journal_dirty_metadata
From: syzbot <syzbot+de24c3fe3c4091051710@syzkaller.appspotmail.com>
To: aha310510@gmail.com, linux-kernel@vger.kernel.org, 
	syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

Hello,

syzbot has tested the proposed patch and the reproducer did not trigger any issue:

Reported-by: syzbot+de24c3fe3c4091051710@syzkaller.appspotmail.com
Tested-by: syzbot+de24c3fe3c4091051710@syzkaller.appspotmail.com

Tested on:

commit:         3c21441e Merge tag 'acpi-6.15-rc7' of git://git.kernel..
git tree:       upstream
console output: https://syzkaller.appspot.com/x/log.txt?x=138b76f4580000
kernel config:  https://syzkaller.appspot.com/x/.config?x=97ce7f89bb9ce135
dashboard link: https://syzkaller.appspot.com/bug?extid=de24c3fe3c4091051710
compiler:       Debian clang version 20.1.2 (++20250402124445+58df0ef89dd6-1~exp1~20250402004600.97), Debian LLD 20.1.2
patch:          https://syzkaller.appspot.com/x/patch.diff?x=17ff92f4580000

Note: testing is done by a robot and is best-effort only.

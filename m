Received: from mail-il1-f198.google.com (mail-il1-f198.google.com [209.85.166.198])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 43595DDBC
	for <linux-kernel@vger.kernel.org>; Wed,  9 Apr 2025 00:51:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.198
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744159867; cv=none; b=XZOo1FfD0mNMiEgt0zmiHR2gFvjXRAjERZvnw9gooWHhEHrI2U+Ui4LBhVjV0tTDyw7KmAL4lPDVAyONdN8cR0qE/moO29GFD2P4qsEoP2825I9seMbTjrW7hyD9UWpwmTrwzEaAnIZixm37epx9j3Jpb4InVpa8iAzP3QQojp8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744159867; c=relaxed/simple;
	bh=TydRVdPn+p6hylClZuMmzrQoXaa/p+EK3FiKnsrOQRM=;
	h=MIME-Version:Date:In-Reply-To:Message-ID:Subject:From:To:
	 Content-Type; b=eqW1nQ5VTRqiEJrgCk61BW7Kd/4k9jHWj4KrfotsvwrNcgYFgHOVFlK9Ph4kZyerwOUAN6nSjHgcexb68v13TWWQZ6wIx+J8hMHosRg/3IrdaIRaajYWJoqNrV0oy5q7p20/q5Czbo/1CVMlSVGtQJQZjQvzdibO+liDDhNXiA4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.166.198
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-il1-f198.google.com with SMTP id e9e14a558f8ab-3d43d1df18bso66443035ab.0
        for <linux-kernel@vger.kernel.org>; Tue, 08 Apr 2025 17:51:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744159863; x=1744764663;
        h=to:from:subject:message-id:in-reply-to:date:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=pSzNwONIWh5y6FDtc3cWxp0nEsJS5BN4r4vz+IUgfpU=;
        b=wSc6AIPdG0wlkzFoxYRTX8pSVNazYB2/BF7+P7U0oB3pL7UHVmtEv0+kGNJ9wSzNUC
         OchhPmJdnshqq/Rkmm0CtVtVz2GkVjLyP+UJX2HKsmWmoYBkHSb2pp4AlaCzlB/ad/uO
         kbTst85QHPGEHX1xxmMO66eJUvEmUMPig6uaGIF8ovyiFzEW92ZXYmvmoaIvYnkA80l0
         Pg5DhpG5sQM36NPdQot07EmkEAE46dPH4Gap9Miw93wuCfT5sT9IRTHXHRP83c1d9ebN
         d8fZBhRrkMIkYbGVBk7OQ12oHx6erBpsr3MTlqaQ5yeKLeY3sIsYgcsVWi3oYRkHQID8
         pkPA==
X-Forwarded-Encrypted: i=1; AJvYcCVsDUbADqOCYl3l28fMzSdu/5HdLURUopfihUjdTmrQpWj6OSG3jXPDfiXGNvRo+EkgCRDw9JBmFw7MxDM=@vger.kernel.org
X-Gm-Message-State: AOJu0YwFfL9r4O6kxhf3N7qi2lA3XEVV3mS2MrPVHx7fywGHDLftS3rY
	NlF2oIo4CdcsBNTZzKqeb2t8GF37/auGGrr+NgJLC8a5Ku8hU37Rup/4iefKimy42T37HQpw2FO
	dLvi9CEGp6HuhXsnwZaKi2NCHqEYS/1bi22107DOUsXNJ8WV8JEjchi8=
X-Google-Smtp-Source: AGHT+IGP3SHGjP4CEscrYMBDEv2pt/DiAlII8XgEtwQLWd9ajzXsCEylkgmUCYsXFNDl6Ke3TjVsURm3qIa7TEqGyctboH+/nKuw
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6e02:1529:b0:3d3:dece:3dab with SMTP id
 e9e14a558f8ab-3d776c8075dmr9286035ab.1.1744159863337; Tue, 08 Apr 2025
 17:51:03 -0700 (PDT)
Date: Tue, 08 Apr 2025 17:51:03 -0700
In-Reply-To: <tencent_8AC8BB0933599E021BCA4B351B8B252FBA08@qq.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <67f5c477.050a0220.258fea.0004.GAE@google.com>
Subject: Re: [syzbot] [wireless?] general protection fault in cfg80211_mlme_deauth
From: syzbot <syzbot+00778a9a557a2a5e1a33@syzkaller.appspotmail.com>
To: eadavis@qq.com, linux-kernel@vger.kernel.org, 
	syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

Hello,

syzbot has tested the proposed patch but the reproducer is still triggering an issue:
unregister_netdevice: waiting for DEV to become free

unregister_netdevice: waiting for batadv0 to become free. Usage count = 3


Tested on:

commit:         a2458824 Merge tag 'linux_kselftest-kunit-6.15-rc2' of..
git tree:       upstream
console output: https://syzkaller.appspot.com/x/log.txt?x=1269b74c580000
kernel config:  https://syzkaller.appspot.com/x/.config?x=eecd7902e39d7933
dashboard link: https://syzkaller.appspot.com/bug?extid=00778a9a557a2a5e1a33
compiler:       Debian clang version 15.0.6, GNU ld (GNU Binutils for Debian) 2.40
patch:          https://syzkaller.appspot.com/x/patch.diff?x=1549b74c580000


Received: from mail-io1-f69.google.com (mail-io1-f69.google.com [209.85.166.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 29A464C6C
	for <linux-kernel@vger.kernel.org>; Mon, 30 Jun 2025 03:22:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.69
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751253724; cv=none; b=BxJK5p+9WEkvBixx86clfaQ0wwG2zrIMyQljkBPGCFazYnrVHt+cYmws6YUb6ylFGW9Re+G2c3EiFJmIiTGPWyvHNCrJoIZczU67gQ+2vGVFPyKB5/LCzhiwkIR9kdlxZ0OhjKIBwgxFkT0OUgvobrruHy5mjKfY2NBAUVguvvE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751253724; c=relaxed/simple;
	bh=uOWornTBWs9EqgNeYwRkEdGkZnM3Mpbh9ZeSQ6JqXoo=;
	h=MIME-Version:Date:In-Reply-To:Message-ID:Subject:From:To:
	 Content-Type; b=oHDziPmH6lmk0xlhCZQEjCKronPw1Gkd8Lm+XYy94qHz0/hQTB7natbc1VPxNJ9bX7t80Sm8Qu0I8DUDatxTnXDg0MiAa5QyExew/QHq1yUVJMOJuU+NS/bmb6PNNIR4IFVeRXl4onXDXcYyBknydOH9GuhWQ65EXuF6e1LDKnM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.166.69
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-io1-f69.google.com with SMTP id ca18e2360f4ac-87326a81ceaso420222739f.1
        for <linux-kernel@vger.kernel.org>; Sun, 29 Jun 2025 20:22:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751253722; x=1751858522;
        h=to:from:subject:message-id:in-reply-to:date:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=6dmo/Ho6Oqai/Lc1ieZWg3sVagbOK58/VG1TB3rW0V4=;
        b=R6p7RCM2fnjRW8YFMqYwXMDL5SsC30DiPRcAB3YBy1PUR6GkEI3hGxbMhHi/h6DrGw
         KOKb/1KaL4aUdD7tVFKb3Q1ZbSSJ7Iv16/0DI+turxBmQbDatLXX39WXn4BDA65H7im8
         GZWN0uQe+3qyVkvA3B6t2iJsOygxvEW2vfSuaQ+6cSNeytLUHdyW8qQvfUmSiiFKH54m
         nQfFDxUKbtQoYNKjpo1mGgAPNZ/tNUiNYZ8cJvs2oOG6f1yvS+huUR8pZEjZhexdePMY
         xNbABMiHw4AjXY7WJGCTOTY3K3NmoubjQKkYYxfIMVGR78k2FaU0ac3+6nGNe7hfPnz7
         2dMg==
X-Forwarded-Encrypted: i=1; AJvYcCUOqJt/8N3piaP3+oN2G3oMvAfdVTcBbg0q4ki+iXhTRBpwOIZtgrJxZa6Agwa/fr8uMWBG8O61fUgSQVw=@vger.kernel.org
X-Gm-Message-State: AOJu0YyRpuUAhE8+/v4s+18Dhhblofh2paJjcFUlooVaCzSQkSiNQtKm
	7eGputAGIpyzIZzmITHHmnjHigHcJNUwKv+UM6l+s/wXe8W6847Vy1RWZnZk3AK+MOHvGf5Giv7
	wkdz2UV0+OrDBWr9nxbcPhYfIaTIJ2yh/xmNYT9wriTdj1XlBYTbHOhOcQN8=
X-Google-Smtp-Source: AGHT+IGrL7X3/EGYETKEO0sTcgpieyZGSNrjfqM4MB96FbEh2uMbQNVyTli4nk3iVgF9Yh1Bs0Ae9vaxGywPbwrg07eGjN6qczO6
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6e02:1a82:b0:3dd:f1bb:c75a with SMTP id
 e9e14a558f8ab-3df4b48d29amr116176685ab.8.1751253722338; Sun, 29 Jun 2025
 20:22:02 -0700 (PDT)
Date: Sun, 29 Jun 2025 20:22:02 -0700
In-Reply-To: <pxrxtntcuuqt5opsno55wx62yqafwhfqkqhylpbwwkqt4iabdv@2nmky356ufdo>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <686202da.a70a0220.3b7e22.0b8d.GAE@google.com>
Subject: Re: [syzbot] [bluetooth?] general protection fault in bcsp_recv
From: syzbot <syzbot+4ed6852d4da4606c93da@syzkaller.appspotmail.com>
To: ipravdin.official@gmail.com, linux-kernel@vger.kernel.org, 
	syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

Hello,

syzbot tried to test the proposed patch but the build/boot failed:

failed to apply patch:
checking file drivers/bluetooth/hci_bcsp.c
patch: **** unexpected end of file in patch



Tested on:

commit:         d0b3b7b2 Linux 6.16-rc4
git tree:       upstream
kernel config:  https://syzkaller.appspot.com/x/.config?x=efa83f9a6dd67d67
dashboard link: https://syzkaller.appspot.com/bug?extid=4ed6852d4da4606c93da
compiler:       
patch:          https://syzkaller.appspot.com/x/patch.diff?x=13eb2770580000


Received: from mail-io1-f72.google.com (mail-io1-f72.google.com [209.85.166.72])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D92B3C2EF
	for <linux-kernel@vger.kernel.org>; Mon,  9 Jun 2025 06:01:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.72
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749448865; cv=none; b=h+nBTe5XPdxHXQCqN+HBfGV+O0JgHxjauPtsHuiNXLTrh+JQ+boZG5ZOsztpVrJ4RHLylVFKgtFF1Uw3zWPG0nrUpJDk/x4JHx4w0M5OGo21d/qn1Jjha2jyxZStGMsLLUT1SGMvuUEopIGlq4hdogQHRJ5Ej3C5JqpiVI4LrUQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749448865; c=relaxed/simple;
	bh=6WKYMtwaVANT3KD7Iqbt8pWwxp5AtjEeNgzBrsoJ0R0=;
	h=MIME-Version:Date:In-Reply-To:Message-ID:Subject:From:To:
	 Content-Type; b=BjiHWtd5dMMUVIEuwzjOU9W2eAY6SZRxGc+hFndoyQNrPZ3BXkZxyJcp8RwRiDKQtFK6tfYr4wxHmHv2b/aubJEeSBZjWsrostnHAjsjpYyj9j4hWE28SPdbloFNOeZSE4/GJpe+9UVQF1hLf+RZCRy3un0apySasnspOW/Nmu4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.166.72
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-io1-f72.google.com with SMTP id ca18e2360f4ac-87326a81ceaso365474739f.1
        for <linux-kernel@vger.kernel.org>; Sun, 08 Jun 2025 23:01:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749448863; x=1750053663;
        h=to:from:subject:message-id:in-reply-to:date:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=+HtvdPDLryju1c6n16xX6ii/dstcTQh43Wu1gPgUFFs=;
        b=aiBacUlbLijawiYV6IE9NTDKsH/HvHSHEnre9bRutCXz8HA0Lpx+55aV/5EIVqCc6I
         fcIgS8cJZvPaqEhnr0UV7aHtVNM1qRKDXVgutCyeJof5iaMz/a4qHhsuTtIsHpyLC852
         RymjSlMlgZfahCpO3jAMsD/LTI4RMLonfAjaox1Ji7sEj1Vdn7IkETarSZVnwnN/bL1b
         hnOwDC9mSB+3xDp+XFd+UNjrE1fC6tDz+ESUozAEQYmNDaosz8x9mfbKrBKm8dwYgawt
         bPD9QY2GRYtuU0f9VpnhTd3NE/HMqP5Iqgjzixx18xJ8Hqe0J9oKU31RrS8TrSH75Hne
         85cA==
X-Forwarded-Encrypted: i=1; AJvYcCU5Q+g8/pdyHaRd2dwChQJmGO27MjRyDEuZjTl4Tjb9RkUlcEjhfRMRZOTtJFNBDpNmdXHDUs3jnrWAog0=@vger.kernel.org
X-Gm-Message-State: AOJu0YytYgVqZnG3UvWIlqrUc8rdXlkeMXfawqf8/YD+GkW46tmtSuN8
	j8s25gV3HuGROGknG7uG+J/fcTNI9Vx2oKgN0kCby45Z7geoQrR7vg5orNnWarkDTsmd7KKpGAU
	MQCefbKV+S1tc0WXkDeD6EJMpcWT4gNqNQM46WTLHEhNwG8yDbBgcA6bFAFE=
X-Google-Smtp-Source: AGHT+IG891y9GGTVlN7Pv2Ri76sMX3/Q0+tR5FDwyE13C2Qp5DYzr+NNMCvZ+m1ZlNx6womkfXEH25iBcfcFMXqpkw5rO0CaWXvV
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6e02:1787:b0:3dc:79e5:ea30 with SMTP id
 e9e14a558f8ab-3ddd7eefa5emr59583295ab.9.1749448863027; Sun, 08 Jun 2025
 23:01:03 -0700 (PDT)
Date: Sun, 08 Jun 2025 23:01:03 -0700
In-Reply-To: <20250609052925.971-1-hdanton@sina.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <6846789f.050a0220.33aa0e.02ab.GAE@google.com>
Subject: Re: [syzbot] [bcachefs?] [rcu?] BUG: unable to handle kernel NULL
 pointer dereference in rcu_core (3)
From: syzbot <syzbot+80e5d6f453f14a53383a@syzkaller.appspotmail.com>
To: hdanton@sina.com, linux-kernel@vger.kernel.org, 
	syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

Hello,

syzbot has tested the proposed patch and the reproducer did not trigger any issue:

Reported-by: syzbot+80e5d6f453f14a53383a@syzkaller.appspotmail.com
Tested-by: syzbot+80e5d6f453f14a53383a@syzkaller.appspotmail.com

Tested on:

commit:         19272b37 Linux 6.16-rc1
git tree:       upstream
console output: https://syzkaller.appspot.com/x/log.txt?x=17e2ca82580000
kernel config:  https://syzkaller.appspot.com/x/.config?x=713d218acd33d94
dashboard link: https://syzkaller.appspot.com/bug?extid=80e5d6f453f14a53383a
compiler:       Debian clang version 20.1.6 (++20250514063057+1e4d39e07757-1~exp1~20250514183223.118), Debian LLD 20.1.6
patch:          https://syzkaller.appspot.com/x/patch.diff?x=1398f570580000

Note: testing is done by a robot and is best-effort only.

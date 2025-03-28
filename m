Received: from mail-io1-f72.google.com (mail-io1-f72.google.com [209.85.166.72])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BC0B61CD1E0
	for <linux-kernel@vger.kernel.org>; Fri, 28 Mar 2025 15:22:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.72
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743175326; cv=none; b=WRMlKk6nnkh3P5iQI3VLiMADF7ndQ/2gXSkDZhr2a3bRWpSl9B+lM+ViPfcedTCn/mbMZ6QmBbna/vgB6/4Bm3SpMNVEBGhWowytnSM3g3gwqt1ZYV9F8XZE1TR3zyY75LkNxqfmIjK8uz50ehvUxFA/4e+Igc7fIVROJXxWLhs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743175326; c=relaxed/simple;
	bh=9u95qfVKYEZf6M88dSEifsWoCD8sVYPu1+QrOe8tpdY=;
	h=MIME-Version:Date:In-Reply-To:Message-ID:Subject:From:To:
	 Content-Type; b=b9tFyM173okz8na6dimlA9ejvrAvgvKWEBj0MRQaWdxk2W1v4SsYn89/k9WOByIhs070IAsVO3r/ixl25PKGdNSe04bC2/GMrq0s1l9t1N+F3pgRo1ZUVfarWJPWpjtlMCudzeOU+yJE4T4kOdjmHG8BIHhGwoHLJrgxU0gnZGc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.166.72
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-io1-f72.google.com with SMTP id ca18e2360f4ac-85b5a7981ccso192399839f.2
        for <linux-kernel@vger.kernel.org>; Fri, 28 Mar 2025 08:22:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743175323; x=1743780123;
        h=to:from:subject:message-id:in-reply-to:date:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=jR1mo/hCOtE3isFlkNzr3KUW3jS8AIZP6mXHPyq23eY=;
        b=l3kd2ae/gfMXV0gKZ457bglT/UHrsFWI3noAYr/KWs0OrCTsLSiIfPaHZQCLKvHe9d
         s1vHrxhJkUxWGcUhE+c8e67Mf9p0umeMY3jCvFTRlte5MSV2m5TbhZbhjhuCOOrnI61C
         EG0dr99ADzrsL0Dg8GzOs9qERip1oYX6NLW3IJNzlJPx6QEWDff9yXrqsz0xKPLhc8Ru
         3FMsgus4jdqlqCFH+hVXW/cZG2faWO7AYrOYW7wqypEJUP94TXoSrBNM9tbzoOARVeCn
         p9bItzHQw15j5k6lnQ9+PVLXL/5keVf4uLeUHTzJkfqxmYpyPDU7yJDpmp36qIfD0GC8
         O/Ng==
X-Forwarded-Encrypted: i=1; AJvYcCVK4CNY6sE26V0lIA5hlc+Q+nTRw0bAeGsKm9MSwycX2v9Xopa7XJMOL2KkpW3XbeTMSOaGyd6V3cV3Gk8=@vger.kernel.org
X-Gm-Message-State: AOJu0YwNyBQoundTjU+SMpbEpMwUhcsY4SoibkgeiTV+ZY57fuTvOly8
	53M+GCkxVFpUt6LnbjLEIMHJ/xcVt/r5/fQRfy1ylPRYM1plb45B+B0ZsrG5rWsyhafRFCgsgxr
	bEVvEJuJEMOGSJCHbpuc/a8A7DOiHZoS+gJyZD14uwUZboizyzEfOoOY=
X-Google-Smtp-Source: AGHT+IElOaU5aRIupz74EKbuSIxjuKtTVjRX81gJc0lcI6gjdITkNBPpSaXxPL8+zRjuYGJj3QnRTP8hXZNuoJpP4xv0FZKbVDAc
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6e02:17c7:b0:3d1:79a1:5b85 with SMTP id
 e9e14a558f8ab-3d5cce290e8mr94000855ab.21.1743175322807; Fri, 28 Mar 2025
 08:22:02 -0700 (PDT)
Date: Fri, 28 Mar 2025 08:22:02 -0700
In-Reply-To: <20250328144928.GC29527@redhat.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <67e6be9a.050a0220.2f068f.007f.GAE@google.com>
Subject: Re: [syzbot] [netfs?] INFO: task hung in netfs_unbuffered_write_iter
From: syzbot <syzbot+62262fdc0e01d99573fc@syzkaller.appspotmail.com>
To: asmadeus@codewreck.org, brauner@kernel.org, dhowells@redhat.com, 
	ericvh@kernel.org, jack@suse.cz, jlayton@kernel.org, kprateek.nayak@amd.com, 
	linux-fsdevel@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux_oss@crudebyte.com, lucho@ionkov.net, mjguzik@gmail.com, 
	netfs@lists.linux.dev, oleg@redhat.com, swapnil.sapkal@amd.com, 
	syzkaller-bugs@googlegroups.com, v9fs@lists.linux.dev, 
	viro@zeniv.linux.org.uk
Content-Type: text/plain; charset="UTF-8"

Hello,

syzbot has tested the proposed patch and the reproducer did not trigger any issue:

Reported-by: syzbot+62262fdc0e01d99573fc@syzkaller.appspotmail.com
Tested-by: syzbot+62262fdc0e01d99573fc@syzkaller.appspotmail.com

Tested on:

commit:         aaec5a95 pipe_read: don't wake up the writer if the pi..
git tree:       git://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git
console output: https://syzkaller.appspot.com/x/log.txt?x=1598064c580000
kernel config:  https://syzkaller.appspot.com/x/.config?x=8d5a2956e94d7972
dashboard link: https://syzkaller.appspot.com/bug?extid=62262fdc0e01d99573fc
compiler:       gcc (Debian 12.2.0-14) 12.2.0, GNU ld (GNU Binutils for Debian) 2.40
patch:          https://syzkaller.appspot.com/x/patch.diff?x=16682a4c580000

Note: testing is done by a robot and is best-effort only.

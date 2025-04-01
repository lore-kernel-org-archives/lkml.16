Received: from mail-io1-f72.google.com (mail-io1-f72.google.com [209.85.166.72])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F2B891F099C
	for <linux-kernel@vger.kernel.org>; Tue,  1 Apr 2025 10:29:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.72
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743503344; cv=none; b=QYescxOszjDq9wYyYG//YAzWlGLLyomxww3tYxG2Ml/ChOCHiz21SQ03PQ6Prclcrr0nh05ryMa9Wid8eCVSElUdq5CNOynw0D2II9PvdsTMsKoeOy1KAaa0C8N4c91RACsZvg9c0anrgres0FHk/vBPmEF8tL/J6mloGBnKqUU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743503344; c=relaxed/simple;
	bh=R43ZC79x9qD65zhQOXtWAhvowTF98sIl42V83qh8Fh0=;
	h=MIME-Version:Date:In-Reply-To:Message-ID:Subject:From:To:
	 Content-Type; b=pyIw50IUF66uNT61CSaaplZRCDiRNPPC/HF/AwQdTrg4nr89xGXIRTQFYaDSJ8Ym+7Z9mZ/IO/NxfCFsKD8UVcq1YDSQYfWlrU9mE34FjMzO2buv+cHu+qyOxz20DG9BKm9v8grekfOB/RewvjL5tzRxncQYqqA6GpwTW9zFk+g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.166.72
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-io1-f72.google.com with SMTP id ca18e2360f4ac-85b5e46a526so556532939f.1
        for <linux-kernel@vger.kernel.org>; Tue, 01 Apr 2025 03:29:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743503342; x=1744108142;
        h=to:from:subject:message-id:in-reply-to:date:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=PuwKkrOFCT0uBhp8h+eKASz2M6aumhJyh+ZHO47yfHc=;
        b=Q+NtbxzyI1q8JeRZoezI39DI03fyBnIcK9AyGrpoAYH0mGIk0Su3G+NDBbj+ph/Wyx
         O5BCzXrnIl0zQL0GtL9t+9BAcBCAo8H3ybJA14b5ayP4eDuLBRC3afcQ0e9OCyYlnx9E
         cP0bf3rEA2mIck8w7gKU8dutyWXxktfYmHADDXU6L6BfZvZs0rz8gRd62knJr5rZuXMm
         g7ToHvG7K8a5bAWrNF3zrCOsc5vA/9y8zq8Dx5bRVEEmdn51IskQvNwRriQN4uPyKYgX
         u+VDJw/cd1mgLROc5D7dztEDkZHTCMY0Sbyl215LodbBQfUACilUxzjnwLr3a/iZ5hFe
         XqUg==
X-Gm-Message-State: AOJu0YzyqqagSgphdp6qOmOZ6qe+kRu4lk/kCtmXYkrTZUy932yaxjuq
	/R+XIEOZfjUXOyB32Qs5lD2W8gtI0EcAla30JBTVMMUdhH8iFXD4rCnwomTHjbt/5pcLD5wqWVI
	IHRP7VgjDpe37yyu2wtWLwj6Kum3jSQZwI0t3jB7zjFQ+YrKfap3BJro=
X-Google-Smtp-Source: AGHT+IF2MqTvMwHpN90+h4uzaIxuCQWTXAkWmyjDGcEYoyiZbKL5HdUt540rHtGTY9Ce9/6Rl2u/y+iQ+uLlf+PyDYtG2LVWhyFB
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6e02:4401:20b0:3cf:c9b9:3eb with SMTP id
 e9e14a558f8ab-3d5e07e22e5mr82703395ab.0.1743503342289; Tue, 01 Apr 2025
 03:29:02 -0700 (PDT)
Date: Tue, 01 Apr 2025 03:29:02 -0700
In-Reply-To: <Z-u9Z09A2Gu_A26l@qasdev.system>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <67ebbfee.050a0220.297a31.000b.GAE@google.com>
Subject: Re: [syzbot] [input?] [usb?] UBSAN: shift-out-of-bounds in __kfifo_alloc
From: syzbot <syzbot+d5204cbbdd921f1f7cad@syzkaller.appspotmail.com>
To: linux-kernel@vger.kernel.org, qasdev00@gmail.com, 
	syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

Hello,

syzbot tried to test the proposed patch but the build/boot failed:

drivers/hid/wacom_sys.c:2367:9: error: expected ';' before 'if'


Tested on:

commit:         08733088 Merge tag 'rust-fixes-6.15-merge' of git://gi..
git tree:       upstream
kernel config:  https://syzkaller.appspot.com/x/.config?x=a15c3c5deef99cef
dashboard link: https://syzkaller.appspot.com/bug?extid=d5204cbbdd921f1f7cad
compiler:       gcc (Debian 12.2.0-14) 12.2.0, GNU ld (GNU Binutils for Debian) 2.40
patch:          https://syzkaller.appspot.com/x/patch.diff?x=13d4b998580000


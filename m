Received: from mail-io1-f71.google.com (mail-io1-f71.google.com [209.85.166.71])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B0BBB2153E7
	for <linux-kernel@vger.kernel.org>; Fri,  4 Jul 2025 19:00:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.71
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751655605; cv=none; b=NVUZkigjCrcNDm+ZO87JILvwlYgEP1BYQ7tIObhUfU5K4I5dwbr+oY1T36R6ifLWnoew0HtPa4VZBeWn6YSBR36+G1jX8CAHR08CKX4/PgccGP/OB6/vWY+j2Px58gKcyyAav1kZ+AnPL4uteFREH3akY2pUqJ3/8R5Q81GhOFc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751655605; c=relaxed/simple;
	bh=SHxA1dv/+gICCLfumnnjKi0DbEkc6PSAHkvuY/qsF6U=;
	h=MIME-Version:Date:In-Reply-To:Message-ID:Subject:From:To:
	 Content-Type; b=au2R+GvQCxdcZSN3HDARvLZs5wXoK3gcCuI9X/lxKI4KAE+gWjtBDjj7st8+smWUCkUAV4wKB4d6yU3RZCFPwckLueCNb199o6LIlIh7fupzdnZ9yob7hZ7VrtPNREkXFD07M2cA7CjxqtNPyB+FK2/U8oXBtM44gSPSWpH2S58=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.166.71
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-io1-f71.google.com with SMTP id ca18e2360f4ac-86a5def8869so266462639f.0
        for <linux-kernel@vger.kernel.org>; Fri, 04 Jul 2025 12:00:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751655603; x=1752260403;
        h=to:from:subject:message-id:in-reply-to:date:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=AgYmEDNU5pmAm9t6e07cc46IBSLYMk37dtQuDd586w0=;
        b=YEhMf9d1pS2xGJw31bf210Hlk2uLwgmVts1sXbdxNVxDRjhX/d6yuzbiNbq6edPCm1
         eTvr4Lw9kTaa/NGVwEZ9LCQ5ppplUgqWlQtyVdtS31klqN4WAsY4hZ99E34gwm4SA+6l
         DB4xO3Fx0AS4/D1RTgOhOaHbkdA19JJNxhyjBfQVLTsLBK20CQvkjkAcNw9U3Mg5AQYd
         Qvd7qYlHh0NJn7wR5GEIg5D/oxQITDoKTNz+8ms9jJFXT1uCp/F1JSxLC8ELvFqlvhs7
         OckXLzV2ZFZkpt0uw2pkK3s6iR10xrkLwtBGSis2Y+NZ7MJxIYQrxsCrZCC0gY+vvuID
         TP4A==
X-Forwarded-Encrypted: i=1; AJvYcCVwDJREIx1d3qyRwWLt2thcxpZ3IhkTqJheLlvubRF6oEB0hMAMZIPC713ifK+AvS+TYmisSdfJn3s3Vao=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz6hdDh1qs9qb3wftcKo6DsDig+ACih54YUuM3w/2C+3oKbigty
	2W9i581OMlzmqoWJxMPigB8YBWZ9zLFIo4iWqF9o6J7n7ZmyNysUJhYMBeNnDRDA74/ECgsbfvn
	BRRHzyt5CaWo/cnriVqAFgAK+B9B4hV2ZGPhaKm3LuMw9fQijU5CBBkdLOR0=
X-Google-Smtp-Source: AGHT+IH2ZgNM717R1mynWYdlVTd8SH+et8An3Vks52sY0r0f4ZXcl7wh1HBFaTDYAyNFcelbHy41fcLhnL2YeQxKA4adKETzR3Jf
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6e02:97:b0:3df:460a:ec3c with SMTP id
 e9e14a558f8ab-3e1355e9c4cmr41019365ab.22.1751655602841; Fri, 04 Jul 2025
 12:00:02 -0700 (PDT)
Date: Fri, 04 Jul 2025 12:00:02 -0700
In-Reply-To: <20250704181107.33961-1-enjuk@amazon.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <686824b2.a00a0220.c7b3.0022.GAE@google.com>
Subject: Re: [syzbot] [kernel?] UBSAN: shift-out-of-bounds in das16m1_attach
From: syzbot <syzbot+c52293513298e0fd9a94@syzkaller.appspotmail.com>
To: abbotti@mev.co.uk, enjuk@amazon.com, hsweeten@visionengravers.com, 
	linux-kernel@vger.kernel.org, syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

Hello,

syzbot has tested the proposed patch and the reproducer did not trigger any issue:

Reported-by: syzbot+c52293513298e0fd9a94@syzkaller.appspotmail.com
Tested-by: syzbot+c52293513298e0fd9a94@syzkaller.appspotmail.com

Tested on:

commit:         c435a4f4 Merge tag 'riscv-for-linus-6.16-rc5' of git:/..
git tree:       upstream
console output: https://syzkaller.appspot.com/x/log.txt?x=139d4582580000
kernel config:  https://syzkaller.appspot.com/x/.config?x=5ba6cef8f153bfeb
dashboard link: https://syzkaller.appspot.com/bug?extid=c52293513298e0fd9a94
compiler:       gcc (Debian 12.2.0-14) 12.2.0, GNU ld (GNU Binutils for Debian) 2.40
patch:          https://syzkaller.appspot.com/x/patch.diff?x=149e6c8c580000

Note: testing is done by a robot and is best-effort only.

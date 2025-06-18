Received: from mail-il1-f200.google.com (mail-il1-f200.google.com [209.85.166.200])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 213EC191F66
	for <linux-kernel@vger.kernel.org>; Wed, 18 Jun 2025 02:55:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.200
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750215306; cv=none; b=rrLR7VRl7A1nM96rTIdIqyoYab8XNDNLp3WYhlFDbA9uVaFUgVSkKyp7WELLSeh74iOD/SPuQKwym4PGuS+GTJJ7UTod2ckA86Cfcqpgd4ky/75TU3Rysw/6DWIiOzs4jqU11ilGE9nrWyxOsHkmKpz7tpsxSuD/lyw5mcJPKY8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750215306; c=relaxed/simple;
	bh=nu+mwKMhCBwklb5Xp29TpJ2RRwLYjv/L8eJA8Ov2LzY=;
	h=MIME-Version:Date:In-Reply-To:Message-ID:Subject:From:To:
	 Content-Type; b=SlGMTB5hCe30YjrcxcdD6p73fumisJG7YLI0hjkpRNEZbpKHi0JXzKJXIY1ji++nOT7U2ZU3sRruY4HCA+Ut6zB/eGn3Djwyosdlk1dkkXOv9uhkrvJpuNdNbj01Y3tLizHI+6AyI1pCt+Y3fqVppIfgXqNNO5wj5L/poVhJuW0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.166.200
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-il1-f200.google.com with SMTP id e9e14a558f8ab-3ddb4a92e80so84977595ab.3
        for <linux-kernel@vger.kernel.org>; Tue, 17 Jun 2025 19:55:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750215304; x=1750820104;
        h=to:from:subject:message-id:in-reply-to:date:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=0HeUAvqtTNubWJzrUPcDBQgIgviue9U+K4gd0TwPBLQ=;
        b=SPPDXQjLwxW8fJOUOvsR8PPOlZl7NhLecbMfG2uDc2mgMdnTCUV9ERstkWX6zqSZfq
         dHnqUcZGkqKmeIJhQ9TAgXbPim7Nat/6GR1SrJo0hINJ2IkNkNDv2K+X6e7Sixd/Bxo2
         gQ5spCNxTQ2xobAa6drFVloi5bMR3nRyPjt4fxlMs4UQAa06EiQyJ4gS+QC/uewVhaa5
         v/o3Z3vAU9saXHbFcc3H61uZuNre2Ak+xQunHaFBDdccK4WtLxXUemouIBOLzCMW8Wdp
         iZiYPLGCfTouuX/cNgOHf8O36LQVjRyCTctTsr19Z7gh4+kMlfRxD/DDx6AJ+hWo0tkd
         Cbiw==
X-Forwarded-Encrypted: i=1; AJvYcCXSNjJKFnZo0amAp21JVmdKeoTayVSAH/diQgmeHU5x1SuETqTgOppJmoupdQVHlE9jE8AhycnqT2hpNHk=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy+B1HPlrQ+Bw9Lb0sL8AmSCeq4I5xy19lh/kYy1btDcZfBbysx
	Aqus3wytWDXJWtVeGPrgvnOAI3I8hP04mb0M3MPXgXrG3UUQiLXGiFTEQrraTHeEVyZhYMcHXtz
	+GmNLE2b3v3faHmir6z14jjO0eWIkpEGg6AaE0N1NFs50x06P/vcLgWDFfIo=
X-Google-Smtp-Source: AGHT+IF3mNR+cBnZinfP2wjXOOAHeHv/hSuP2N6nj+Agjju89ffZCg5Zfrol9ItbvRzgUW1mZdhZX/58t4Ouf623g795NN/1teUg
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6e02:3786:b0:3dc:8423:5440 with SMTP id
 e9e14a558f8ab-3de07c4506emr166712105ab.0.1750215304207; Tue, 17 Jun 2025
 19:55:04 -0700 (PDT)
Date: Tue, 17 Jun 2025 19:55:04 -0700
In-Reply-To: <tencent_FC196E4F848DEF25B88DCB12125D96DD9307@qq.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <68522a88.050a0220.2608ac.0028.GAE@google.com>
Subject: Re: [syzbot] [ntfs3?] general protection fault in pick_link (2)
From: syzbot <syzbot+1aa90f0eb1fc3e77d969@syzkaller.appspotmail.com>
To: eadavis@qq.com, linux-kernel@vger.kernel.org, 
	syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

Hello,

syzbot tried to test the proposed patch but the build/boot failed:

fs/namei.c:2009:16: error: call to undeclared function 'S_ISLINK'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
fs/namei.c:2009:32: error: no member named 'mode' in 'struct inode'


Tested on:

commit:         52da431b Merge tag 'libnvdimm-fixes-6.16-rc3' of git:/..
git tree:       upstream
kernel config:  https://syzkaller.appspot.com/x/.config?x=6a237c32900fc479
dashboard link: https://syzkaller.appspot.com/bug?extid=1aa90f0eb1fc3e77d969
compiler:       Debian clang version 20.1.6 (++20250514063057+1e4d39e07757-1~exp1~20250514183223.118), Debian LLD 20.1.6
patch:          https://syzkaller.appspot.com/x/patch.diff?x=1128750c580000


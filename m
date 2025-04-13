Received: from mail-il1-f199.google.com (mail-il1-f199.google.com [209.85.166.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CBB3E1684AE
	for <linux-kernel@vger.kernel.org>; Sun, 13 Apr 2025 21:44:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.199
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744580646; cv=none; b=JtxlJEMB1v0uISxnVJaY+/JxpxnWviuGieNT8ez0fsDF8c6hXqI+yYukXHvYaAlvvfD8e4XuFlVs3Sb0iGknNuQ++q8ZOfw+gOMuMbCoW/jrb00OZVT7FByeOjKWgJoYmG21dq6PhJlxHrxShqkTM7BHurVrzSaMrVIU4SkHHN0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744580646; c=relaxed/simple;
	bh=IBV5m84sDUINaPAtWzZoXJRZeUNDXlHqpbb2Bg/qkg4=;
	h=MIME-Version:Date:In-Reply-To:Message-ID:Subject:From:To:
	 Content-Type; b=kXcw+OyR6GU8zAEArYcbKETqiRqIZn7y5IfZAgcZ9LbRjtwcxgzW44VUraz6PRoUMHgbwkduj8wP5HdTds2yGmC/I/AhV5j4eY2SXbjOYoiJ88FzMnptDnjqN4Cqxw8pQXt8Rhh6jJjYRqqSSvPjvAelb9aMLpKvFD1I4dn/nZ4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.166.199
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-il1-f199.google.com with SMTP id e9e14a558f8ab-3d6e10e3644so38951435ab.1
        for <linux-kernel@vger.kernel.org>; Sun, 13 Apr 2025 14:44:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744580644; x=1745185444;
        h=to:from:subject:message-id:in-reply-to:date:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=J1txnWgtU8RQyOa828P2LoRE5i4oIfHS8ZwXuHV/jyU=;
        b=k5d4fDABugrBk8CHoa7MnOH/7sO+9geka0p0uNs73pT95wjni5yyRpwa4r3J5+w7Vk
         /ri8tDYF2ybeTSDNyAhGRXxUECbeDZ6MkTpcKwhofpeGPceFHCGyZQsGnzgJMU5/Netu
         n+bpixQL2AOYxg4XHL7eb6vT2Gj7UjR/GDgyC8BN0SwBByVSIc1ezcm0hNXvZqsJOA54
         TvNnkgdpYXip7hFOetdpFqAQtTtrIRQJknU+L6pYV30OQMAldq44r5jyJQ97jwbTsIU/
         owZ3tBe9eE0vjBwKH5rw38aKE4xqwvCphNiawYYTQhNUPKfjWzzRIKLqtnszX68w79fR
         9AiA==
X-Forwarded-Encrypted: i=1; AJvYcCXI4xJjikJcmm+/EKOt2urw22YCvfq4X5SvYizcoGSezyIWGqCNuCih2YAEJ/t5smEqlnyy+4PUBd5q7Ms=@vger.kernel.org
X-Gm-Message-State: AOJu0Ywy/Z4kqEIask3thrcqaJ118eqS1/IARI4sc3n4/bP5EMRcB4fi
	UYsM91TimGeRs6POyoGlIsuT0eGd1SrfEx7hR3tvEGyy80b34Dko8/ZxBbIgdhqEs9smurEQmo6
	CwISfbKAkFw7ZwBipA34rc6WoCi6iOjvPnJI69d3VHc1sZ0Tgddfc9rQ=
X-Google-Smtp-Source: AGHT+IGJsxAFKJy/nRo7m/UlNnZ9fULeDSQsk2Dq6/E68LZo2qm0BqMPAJtKGkj5mqLMq5eFpwR+DwA0uaNgHXh4JVuq9QJwFn4R
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6e02:16c9:b0:3d4:6f9d:c0d0 with SMTP id
 e9e14a558f8ab-3d7ec1f389cmr90320285ab.8.1744580643800; Sun, 13 Apr 2025
 14:44:03 -0700 (PDT)
Date: Sun, 13 Apr 2025 14:44:03 -0700
In-Reply-To: <67faff52.050a0220.379d84.001b.GAE@google.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <67fc3023.050a0220.2970f9.0361.GAE@google.com>
Subject: Re: [syzbot] [mm?] WARNING in move_to_new_folio
From: syzbot <syzbot+8bb6fd945af4e0ad9299@syzkaller.appspotmail.com>
To: akpm@linux-foundation.org, brauner@kernel.org, 
	jfs-discussion@lists.sourceforge.net, linux-kernel@vger.kernel.org, 
	linux-mm@kvack.org, shaggy@kernel.org, shivankg@amd.com, 
	syzkaller-bugs@googlegroups.com, willy@infradead.org
Content-Type: text/plain; charset="UTF-8"

syzbot has bisected this issue to:

commit 7ee3647243e5c4a9d74d4c7ec621eac75c6d37ea
Author: Matthew Wilcox (Oracle) <willy@infradead.org>
Date:   Wed Apr 2 14:59:57 2025 +0000

    migrate: Remove call to ->writepage

bisection log:  https://syzkaller.appspot.com/x/bisect.txt?x=15be8fe4580000
start commit:   01c6df60d5d4 Add linux-next specific files for 20250411
git tree:       linux-next
final oops:     https://syzkaller.appspot.com/x/report.txt?x=17be8fe4580000
console output: https://syzkaller.appspot.com/x/log.txt?x=13be8fe4580000
kernel config:  https://syzkaller.appspot.com/x/.config?x=db03cefa26ecf825
dashboard link: https://syzkaller.appspot.com/bug?extid=8bb6fd945af4e0ad9299
syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=10afca3f980000
C reproducer:   https://syzkaller.appspot.com/x/repro.c?x=116f5c04580000

Reported-by: syzbot+8bb6fd945af4e0ad9299@syzkaller.appspotmail.com
Fixes: 7ee3647243e5 ("migrate: Remove call to ->writepage")

For information about bisection process see: https://goo.gl/tpsmEJ#bisection

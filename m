Received: from mail-il1-f198.google.com (mail-il1-f198.google.com [209.85.166.198])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D002F2557C
	for <linux-kernel@vger.kernel.org>; Sun,  2 Feb 2025 17:27:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.198
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738517228; cv=none; b=s2M2kZf3KIuwRChJ8op+JjqUCzLgoWcKs6/HStLFvvGfdS9psC5YdbRNYjNzBcUHRenlJFPjSAjMHPBfynhdU6UkF5LW1Ch1E84ca/dV7Y1H2dJeLfz7NlUOflHcU1itxtHjRFOreyRKpNG+Ft3h0em4r+wBlWX02X6R+5yZkAk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738517228; c=relaxed/simple;
	bh=VxLen/kkuDBwrPUrHTtoZEJWZPWb0hF2aTJOyQfKHHs=;
	h=MIME-Version:Date:In-Reply-To:Message-ID:Subject:From:To:
	 Content-Type; b=nfach0d2mFpcY5wsCl378xbsz3Lny8VHqIh4GiSSNtNDDxWOoOJY3ljgs3/eVP25q8vVSlvlb4wmjUYv/TI5Ab8VUbDWNMw8Tvdk1dVWa/kv5yaCwtogmDOrGgzax1XIeW7j3csBjze0kbOv5dF1F958bWacx1OS4CtGsSxy2wg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.166.198
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-il1-f198.google.com with SMTP id e9e14a558f8ab-3d00f199b76so59618415ab.2
        for <linux-kernel@vger.kernel.org>; Sun, 02 Feb 2025 09:27:05 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738517225; x=1739122025;
        h=to:from:subject:message-id:in-reply-to:date:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=yXexU36OiSygy1VKoH+pvaXyLUZp8BcdvcSSrRQAfh8=;
        b=ludcN+zeORiVinqdosNKV+WDRuesOz1s3/vdoaoBHo4hK37LIEe9aK0Ob25zjwhtHV
         fqJQ9OLWEl40Y2ndUv0rZw15Y7yRvnYiy0cgVGUHcVxBd7BGXT4LhuSGMEz2GC7tHcci
         o1G0x0+hrSq80VQ7V1oewKqhRlLtyl2NVrRJ3ztFltRAv3SBjIFIFacOBS9wxX1b1u8D
         yjWCCtDNNcthvVkecPSPb6cVUbX5duUNLxbXCd+nueOs9N5KJlH6eskJdHKnXDtARpKU
         4BGS7XXbw6HfVTcpr5m07GvOhGbSFRAuegXrgjtyV2AIUQj5kDxgNx4Ex4Lz8OQ0amKY
         zAMw==
X-Forwarded-Encrypted: i=1; AJvYcCU57dnAT02HZqxqZdvnkEzJ+DNq0xriFSOYAcSJfuhjBhEzyXt+F00HZK7eh85+EHpSWLqlr1FgVy3d5EM=@vger.kernel.org
X-Gm-Message-State: AOJu0YxquPA+eomdsDyLLzdZxR8vhbunOCE0f7RLFlstpMmrG3LVPIjp
	FVpd8oT3qak8xTEGwOKbaXLYIfwvqc7VBhvk3RGoyMbsWIgFMoW2i/ASgR++WzWf7LSzOIn+PrD
	ekbkJrYTxEqEUm6WWelwCRyTTtT1xsFuseryS910uy6IyIfp2vP3ccmM=
X-Google-Smtp-Source: AGHT+IGF8I7415qb/43RYrrVed/7Jwn8N6ClVLyn1H7699DTvp3t166RV/QQQs3W3eWRqS9YuDOKJZhhfJ0DSc+G50LjShwjlLFi
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6e02:12c2:b0:3cf:cd87:1bf9 with SMTP id
 e9e14a558f8ab-3cffe46994fmr164810335ab.22.1738517225016; Sun, 02 Feb 2025
 09:27:05 -0800 (PST)
Date: Sun, 02 Feb 2025 09:27:04 -0800
In-Reply-To: <677928b5.050a0220.3b53b0.004d.GAE@google.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <679faae8.050a0220.d7c5a.0073.GAE@google.com>
Subject: Re: [syzbot] [mm?] kernel BUG in alloc_hugetlb_folio_reserve
From: syzbot <syzbot+a504cb5bae4fe117ba94@syzkaller.appspotmail.com>
To: airlied@redhat.com, akpm@linux-foundation.org, david@redhat.com, 
	dri-devel@lists.freedesktop.org, kraxel@redhat.com, 
	linux-kernel@vger.kernel.org, linux-mm@kvack.org, muchun.song@linux.dev, 
	steven.sistare@oracle.com, syzkaller-bugs@googlegroups.com, 
	vivek.kasireddy@intel.com
Content-Type: text/plain; charset="UTF-8"

syzbot has bisected this issue to:

commit c6a3194c05e7e6fd0e8fbfb1720084ae2503c4ac
Author: Vivek Kasireddy <vivek.kasireddy@intel.com>
Date:   Mon Jun 24 06:36:16 2024 +0000

    udmabuf: pin the pages using memfd_pin_folios() API

bisection log:  https://syzkaller.appspot.com/x/bisect.txt?x=12c71724580000
start commit:   69e858e0b8b2 Merge tag 'uml-for-linus-6.14-rc1' of git://g..
git tree:       upstream
final oops:     https://syzkaller.appspot.com/x/report.txt?x=11c71724580000
console output: https://syzkaller.appspot.com/x/log.txt?x=16c71724580000
kernel config:  https://syzkaller.appspot.com/x/.config?x=d033b14aeef39158
dashboard link: https://syzkaller.appspot.com/bug?extid=a504cb5bae4fe117ba94
syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=1324fddf980000
C reproducer:   https://syzkaller.appspot.com/x/repro.c?x=128b55f8580000

Reported-by: syzbot+a504cb5bae4fe117ba94@syzkaller.appspotmail.com
Fixes: c6a3194c05e7 ("udmabuf: pin the pages using memfd_pin_folios() API")

For information about bisection process see: https://goo.gl/tpsmEJ#bisection

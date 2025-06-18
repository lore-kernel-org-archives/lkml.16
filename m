Received: from mail-io1-f72.google.com (mail-io1-f72.google.com [209.85.166.72])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6D72B1990D9
	for <linux-kernel@vger.kernel.org>; Wed, 18 Jun 2025 05:07:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.72
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750223227; cv=none; b=BdcSwCKgnaYvRTj4SdbOEAYxs7J2mr2L1ne5rs5Y15AcZ4X/ASPr2g5N8Pb6UMQ/hwPwmUceTj10d9Hqp+JlC8nZpbdcbPtzWjZDwt5/7ghlPCk1NbDWGjBO/9OEP+OIspq9BREdThgA8uCJf9kAIC2oOxwbpym/nJqDXRAOa60=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750223227; c=relaxed/simple;
	bh=Fnqwo8jS0dl5XuWKQjwx+rIh//w5n+YHb34rC8qMk8U=;
	h=MIME-Version:Date:In-Reply-To:Message-ID:Subject:From:To:
	 Content-Type; b=Fdp6SzhC4PSNQql5JfaHE/rkEuNwZWPrWytEd50Hibfg7YqNiRmC00jCe5XtlD+nYtazwlX96vmpisZVUl3NaWmlUeqkRy66YPBZsMZVAND727q9qYhYSWSN6Lw79LoL0vIf4wrNz/liATzT1tyO87KBzO9wENB5/vVMMRKOhVQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.166.72
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-io1-f72.google.com with SMTP id ca18e2360f4ac-86cfe68a8bbso564140739f.1
        for <linux-kernel@vger.kernel.org>; Tue, 17 Jun 2025 22:07:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750223224; x=1750828024;
        h=to:from:subject:message-id:in-reply-to:date:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=co7EX5zOxh51edPwZs4y12iDgxmGBxYWGi9uWhN/jPo=;
        b=wPMPS5JbVbpOU1GV0I7II5irahWcdWR1toiVwp0RVBL+hcpwkK/G8WvYg9ArleuXK6
         iZ9o5g8w3uLUc4OtYKx+9ZQJ/qLtB2HeUPEpdeIdquCx+UP6fjDa6rpA5wy4wvQoWbaA
         aKYY0fmXR7wGyLk/luNRlQgrVmixpFnsJP2aHWb2kbml5tDo7Hs7BjirLKrZxStu4y0Y
         gyn3NKYUSs+yetEaeYn1RJsZtV8yjOWih3AFLmdi3XdXxS6j/RAcR6OuU1hXT2oA2u7W
         N5yX4wgZS9Abjnc/v1jgRZ5tfY2bTN79g7amSVARLpp3nx686nsWfRqT3afmiHMZoPL5
         fLOA==
X-Forwarded-Encrypted: i=1; AJvYcCWPQuKjZiylEBlYhLf1aU4K5Vbg4n2+RUWi2wOg1/Gl4w4UtGrud1DuKmDtAvk7UPiCmA4pMrRO2FllqJA=@vger.kernel.org
X-Gm-Message-State: AOJu0YzUUT3VlXVd7l8ipPLxBKMo8HAxNIhkyyzdLubX/edraAxOup3o
	5iI/eFp3pkHk2rpB+UnPRriNpp1WA0LESfGvYTj8yCepK1H7FC/sX89RztUC3/UAh6MW7Xn/D3u
	xsJLxYTAfKYQqZ6tz7aOP+1Wvug3+r10WkSjPU9bXu1iyBzgC6j38xMXjEaA=
X-Google-Smtp-Source: AGHT+IEK1H/9uK5DtBUeYSGrAvB0crn6Vsi9yitanpBohozM0vbaEqCK0BbzlGjRPxkqkppmY4Nf0Vnc90pCot7FEzEFaIq1aVP4
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6e02:1522:b0:3de:2102:f1d8 with SMTP id
 e9e14a558f8ab-3de2102f53dmr85750525ab.18.1750223224546; Tue, 17 Jun 2025
 22:07:04 -0700 (PDT)
Date: Tue, 17 Jun 2025 22:07:04 -0700
In-Reply-To: <68512333.a70a0220.395abc.0205.GAE@google.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <68524978.050a0220.2608ac.002a.GAE@google.com>
Subject: Re: [syzbot] [mm?] WARNING: bad unlock balance in move_pgt_entry
From: syzbot <syzbot+52343d77314d6c0447fe@syzkaller.appspotmail.com>
To: Jason@zx2c4.com, Liam.Howlett@oracle.com, akpm@linux-foundation.org, 
	david@redhat.com, harry.yoo@oracle.com, jannh@google.com, 
	liam.howlett@oracle.com, linux-kernel@vger.kernel.org, linux-mm@kvack.org, 
	lorenzo.stoakes@oracle.com, pfalcato@suse.de, riel@surriel.com, 
	syzkaller-bugs@googlegroups.com, vbabka@suse.cz
Content-Type: text/plain; charset="UTF-8"

syzbot has bisected this issue to:

commit aaf5c23bf6a474f11f48f03bd6a9b551f4e7d45a
Author: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
Date:   Mon Jun 9 13:26:35 2025 +0000

    mm/mremap: introduce more mergeable mremap via MREMAP_RELOCATE_ANON

bisection log:  https://syzkaller.appspot.com/x/bisect.txt?x=11f92370580000
start commit:   050f8ad7b58d Add linux-next specific files for 20250616
git tree:       linux-next
final oops:     https://syzkaller.appspot.com/x/report.txt?x=13f92370580000
console output: https://syzkaller.appspot.com/x/log.txt?x=15f92370580000
kernel config:  https://syzkaller.appspot.com/x/.config?x=d2efc7740224b93a
dashboard link: https://syzkaller.appspot.com/bug?extid=52343d77314d6c0447fe
syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=11389e82580000
C reproducer:   https://syzkaller.appspot.com/x/repro.c?x=16824370580000

Reported-by: syzbot+52343d77314d6c0447fe@syzkaller.appspotmail.com
Fixes: aaf5c23bf6a4 ("mm/mremap: introduce more mergeable mremap via MREMAP_RELOCATE_ANON")

For information about bisection process see: https://goo.gl/tpsmEJ#bisection

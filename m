Received: from mail-io1-f71.google.com (mail-io1-f71.google.com [209.85.166.71])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BDBC728DB67
	for <linux-kernel@vger.kernel.org>; Fri, 20 Jun 2025 13:09:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.71
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750424945; cv=none; b=T7709czrrXrbk8uFH4Ij/EuqdUuel9qc7nys5+KA1zqWX5PgKlGy9qthj+J6azaQYyMAveE+6XHu/JJYlJO98yNrRQq5VgB4vtYA2n2KJvaVpL9CO9IBIXEBNuFuZUuJvCourANfx88hoftXtD8Ut6rBguq3blRYn6Ypk4TgRFM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750424945; c=relaxed/simple;
	bh=a03GPhbXhB2cl+AE1QtrtXSnEV+4+bk7k99W898ZVlM=;
	h=MIME-Version:Date:In-Reply-To:Message-ID:Subject:From:To:
	 Content-Type; b=DFEKSxXLB/LrJqgra3OWI9rJ5Nnq2BUTM0plXoq5Pt+HrgmOIYis56h5haAXOrx6cR2Y46CN3xaEZ7XBf1TdImrEVQPTGMDA4qC6oo1hPP6HUfZtYAuJG459decPBu7bREm7PwnWwvttaJfk5DwyVNAMc8tGkJ9POZ4ElIrN6+s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.166.71
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-io1-f71.google.com with SMTP id ca18e2360f4ac-87595d00ca0so137847339f.2
        for <linux-kernel@vger.kernel.org>; Fri, 20 Jun 2025 06:09:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750424943; x=1751029743;
        h=to:from:subject:message-id:in-reply-to:date:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=S41u+OS0BXxizA1eY4QMD2CtJm8PEDugW3r2IepL8pE=;
        b=G60x1DKto+18KZmx/8r4RCosiSaidi36WXkuMTBbi+MyxZU61WNKWlJ9Ejj+Zfqqwg
         HSasAZZd0R+D6Z+dm1MY76XU0Zo304OKgZlSfMMbl/DQ2i38v4k1qPZbxHZLybF9fCU6
         jIUN+UejER2W4VxVbNfm5lHD/5u/9LBij2NxuSiKDyfNXNIJfe70riluZFTMTIMVLyOh
         /P1HrK4iLRbPcRB3HVHamBSJHeN/v888Z9dvFw91q12PCCN7r3dvn9DzSjbpCgrIgKXM
         Z4H4nLYZEQZHVkYGOPDpy2rMmNwc27g5G33xSfZXmDAdq+KMb5fQt2/XF2xAhcqweM83
         E28A==
X-Forwarded-Encrypted: i=1; AJvYcCW3QrwHFr8ry+3r6r1sH+tjK0fLnkgyE0IFOHHq4+MAwbxNhuu96ltzLL0HScXL1G0LWyxep4ihvhRM4/s=@vger.kernel.org
X-Gm-Message-State: AOJu0YzetVzNLgrP469K+CzWWVOEM1QSmBklt3Evk3d/OcKOcUBj9bvI
	jULzSUUGFDceIfrtinqQ8JjTmusZbyXL8RoK9PFqg/jMh7/X8yZ/RyvOYSR0PiDBouGRv0LwGM2
	T6hUcn5GK24cGFVToxIZFvCQAFPEEhFUYfsryLP2cL2Lt0HftCwwWMvMySqA=
X-Google-Smtp-Source: AGHT+IF53zvOU4+z5tn41o35G7gzCDDtflHZJVBAPgqTIBw+yLXf9YFil1k1FunrNM0xZ3IfMn4Il7e8WrzJZlW4jCHl8X/eeWUo
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6e02:164e:b0:3dd:d365:78bf with SMTP id
 e9e14a558f8ab-3de38cdac08mr27889265ab.22.1750424942885; Fri, 20 Jun 2025
 06:09:02 -0700 (PDT)
Date: Fri, 20 Jun 2025 06:09:02 -0700
In-Reply-To: <20250620114122.1338-1-hdanton@sina.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <68555d6e.a00a0220.137b3.004c.GAE@google.com>
Subject: Re: [syzbot] [mm?] KASAN: slab-use-after-free Read in do_sync_mmap_readahead
From: syzbot <syzbot+8e4be574cb8c40140a2a@syzkaller.appspotmail.com>
To: hdanton@sina.com, linux-kernel@vger.kernel.org, 
	syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

Hello,

syzbot has tested the proposed patch and the reproducer did not trigger any issue:

Reported-by: syzbot+8e4be574cb8c40140a2a@syzkaller.appspotmail.com
Tested-by: syzbot+8e4be574cb8c40140a2a@syzkaller.appspotmail.com

Tested on:

commit:         5d4809e2 Add linux-next specific files for 20250620
git tree:       linux-next
console output: https://syzkaller.appspot.com/x/log.txt?x=13495d0c580000
kernel config:  https://syzkaller.appspot.com/x/.config?x=58afc4b78b52b7e3
dashboard link: https://syzkaller.appspot.com/bug?extid=8e4be574cb8c40140a2a
compiler:       Debian clang version 20.1.6 (++20250514063057+1e4d39e07757-1~exp1~20250514183223.118), Debian LLD 20.1.6
patch:          https://syzkaller.appspot.com/x/patch.diff?x=11fe8182580000

Note: testing is done by a robot and is best-effort only.

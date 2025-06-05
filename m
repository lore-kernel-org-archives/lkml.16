Received: from mail-il1-f200.google.com (mail-il1-f200.google.com [209.85.166.200])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A6CBE33062
	for <linux-kernel@vger.kernel.org>; Thu,  5 Jun 2025 16:14:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.200
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749140045; cv=none; b=pcDJlm/TU+pjK7Pq+3T2XD9mnEP+56MO5D6/JKJXoBy6PwL75MyYJtNa1LEer/U1oYS/GxOxkKZwVMWrR5QiSNvgr1tODYdsalhpQVZv2bAWChmrl2wMMPLrYXodcfCzffflBuqeNGhApfHASwT8MksnQqQ6me6aVTUxdFnmRUs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749140045; c=relaxed/simple;
	bh=CoBZ1/d4VrSP6eFEOFXsI/O3ahaZ9G7q/alpCt/15l0=;
	h=MIME-Version:Date:In-Reply-To:Message-ID:Subject:From:To:
	 Content-Type; b=FnDayIVZzSVv3WD7BM+NQZrohp/vVkrYlb+f+E28xQ2JCcU4iX/xpV/2gIO/e7O/PXSlC+fJzvK2TS9wgJu+bc8rpjbJSwJuVeX9gIim7SD2cR3nRbVFDuWLJKM7IZJFB4JOD2WFta+TvwrNTh9CwH6JxZsMbXoQgBvDC1rv5TM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.166.200
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-il1-f200.google.com with SMTP id e9e14a558f8ab-3ddba1b53e8so13850375ab.1
        for <linux-kernel@vger.kernel.org>; Thu, 05 Jun 2025 09:14:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749140043; x=1749744843;
        h=to:from:subject:message-id:in-reply-to:date:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=lLcixu2J4gsaoZFhxwygcfRmuOJLLhBMCrdvAdyKPZU=;
        b=KX0sTga0FyotYDoUy3plePYEGpmrpGTrvurpR9WvlEmIL4aq7mrjmXSY/eaUjA3k0w
         0bW6ldu/5JbPV8Aqnw3shiiB6CtDPZ2CSL88ug/HwSj0Gqh/FyySw5/dqah9RNteSLyf
         CaewkDJXhYvizBwAlAGnaZ9uEnlHqdRDL60EGM+A+n7tNNyO009RkRmvRCiYDVZFBwRN
         SfEAx3GTRRgfHKL07QMoIYl9HzEom4y1Q6xHNb7unrnB4sokFZj7DUXpgp9kRpZBHcWU
         AePbDrhPJ5mgeNkqz7B8VzbEwGdYpJqiU9e6YJ71aIOGQCcMKOH9sWpq6fxxnYx+/EIn
         d+3A==
X-Forwarded-Encrypted: i=1; AJvYcCW7c5X03pxnGC/8aEbDdApMSOmhgWzpEf55Fq5eGwpM49YBpHbmK6IYULcfuPj12Kga06DtWpULNuTvud8=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw504aOxRwSQtcjv4/bwfJZ3tffYlz+dda8HJEOU1r0rcSHBNZv
	K8Of5+qcxuJ4hUvFMsKxRj+UBGqLvNWP65P2T2Ey9FeZbdCq6f4rQvOsLgSwzryAW7jBRgTtbom
	O9cmtShscHCdNVUty/bS8XVw/C1aa+WYfigUBcC4oG1r+TymlE1I6DPb2/WE=
X-Google-Smtp-Source: AGHT+IGMYqqsmgDQHi14dq1tm7Qz+j2NEWdtpQmK/ACPpjDOAQPTIaBiQ67gXI72bBTLP+Do0o6YW6PIWTqcPYtkUHPDIkYakO8H
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6e02:2148:b0:3d8:20fb:f060 with SMTP id
 e9e14a558f8ab-3ddbecfd784mr83662345ab.4.1749140042778; Thu, 05 Jun 2025
 09:14:02 -0700 (PDT)
Date: Thu, 05 Jun 2025 09:14:02 -0700
In-Reply-To: <CAGR7w82GyV+37kyf+y6NzSxrkeHqhjzaerC6mEqBJ1b4ACzz9g@mail.gmail.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <6841c24a.a00a0220.68b4a.0015.GAE@google.com>
Subject: Re: [syzbot] [bcachefs?] KASAN: slab-out-of-bounds Read in bch2_sb_members_v2_to_text
From: syzbot <syzbot+5138f00559ffb3cb3610@syzkaller.appspotmail.com>
To: abhinav.ogl@gmail.com, linux-kernel@vger.kernel.org, 
	syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

Hello,

syzbot tried to test the proposed patch but the build/boot failed:

fs/bcachefs/sb-members.c:68:39: error: no member named 'member_byets' in 'struct bch_sb_field_members_v2'; did you mean 'member_bytes'?


Tested on:

commit:         4f27f06e Add linux-next specific files for 20250605
git tree:       linux-next
kernel config:  https://syzkaller.appspot.com/x/.config?x=e7902c752bef748
dashboard link: https://syzkaller.appspot.com/bug?extid=5138f00559ffb3cb3610
compiler:       Debian clang version 20.1.6 (++20250514063057+1e4d39e07757-1~exp1~20250514183223.118), Debian LLD 20.1.6
patch:          https://syzkaller.appspot.com/x/patch.diff?x=17342c0c580000


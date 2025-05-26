Received: from mail-io1-f70.google.com (mail-io1-f70.google.com [209.85.166.70])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0D6E320B81D
	for <linux-kernel@vger.kernel.org>; Mon, 26 May 2025 14:53:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.70
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748271185; cv=none; b=HHQ5UzR7cr9KgqN7h2KblarZq/1ENyd7rWYDrcp/207cXNp7K6BFyktSViY/97HPNC8HSJ+fCDUUR4b6Yck4UcsJkz+ql299W3o4BgUCpafoP9zQJP7tVgPMaSlC5mqweIWZn1glcHEiXCfvMwjxmLKravbGzMnzyKT7xw1Ql94=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748271185; c=relaxed/simple;
	bh=rX//ZnAs4/gDdkckX/oa5gGporeBmWQngj8pvXA3luw=;
	h=MIME-Version:Date:In-Reply-To:Message-ID:Subject:From:To:
	 Content-Type; b=ZYKwagy9u8O2gIf0Oer8qWiqk/Or3yr0WtaMtig34c0C+opi16VVsPRTP0RJw8BjbnE1Gxwd3ylMaG7WXYh2oPskuuFA9cLhlGDikkH1/2Nr7RCZ5u6bJzvtdSdCnF3o9PrKDm/iWl++ZfdwHi4Uiybe5OrZMTvnQ59Z4RSfZPc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.166.70
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-io1-f70.google.com with SMTP id ca18e2360f4ac-85b3888569bso200745739f.1
        for <linux-kernel@vger.kernel.org>; Mon, 26 May 2025 07:53:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748271183; x=1748875983;
        h=to:from:subject:message-id:in-reply-to:date:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=UWjmY8aMLm+qwl1GELp08QuU0WZDXapUCNerLSYq98Y=;
        b=f1B+sBBsJg/5ON637F1Kz9D4xq1LBaMLG/lG2OIGz2BuPAZy1I4P+6JOelBqjjMEMk
         CkvTJgkepWk5aHVSK1lSCKf7ar1toIGHqdIiXzhWrvln5A4cHuqe9vjYur/02hi/eryZ
         0gfd07WUsQOw+149e2IVHIDFVvLpSaGnoUWQM/E2HIpukM/86VMOca2icxSt65JYqKls
         ETifaC2XAwLUNtmgSlXt/G3oUvSfYnY9FjKgGK2OU5EdpNb7Bo4TFierFAZVaJgsvqnd
         dZQu35CWUneFRtjUoNVtbn1UAF4aGi6uwQvbRt5uAH66becIQIf59wNmjwRCnWtkBtRk
         Cw/Q==
X-Forwarded-Encrypted: i=1; AJvYcCU6v5zcuxZ87vMfFm0UNzj6iJ/hECQCGj3lYh6Ib4HZ3pkoLqL9R5Y8d2P/rTi/GbCNW+HPD7xYqDutuLY=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy3lTBiQCZiX8FT0urDU+QwjnSKqpnti2VvD1hiZNzo2xWWI54F
	pfe9j49PJrjzIczZuqazW5c6v3D1h6Vfc2I2b1VYFYj0vjvpnIzsx/ZbP+jCeFW0Laqg0aC1m/v
	deoVVc1reZym2DFgE1g4ePlKNZSrAFyl549IcaCuUt7l5GURj9N/CudhRKM0=
X-Google-Smtp-Source: AGHT+IGfFM0VmJSiEl0hrfNOjF6WtTqtIlhLZ+/eBkY7mYSTPlJ9CVCTEW3f52OL2Z0rgZuHbBmZk1JpddObrgQyRrcEkS6I69Zv
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a5d:8e14:0:b0:85e:d0ca:b635 with SMTP id
 ca18e2360f4ac-86cadb95446mr1005245339f.2.1748271183134; Mon, 26 May 2025
 07:53:03 -0700 (PDT)
Date: Mon, 26 May 2025 07:53:03 -0700
In-Reply-To: <68335d8e.a70a0220.253bc2.008b.GAE@google.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <6834804f.a70a0220.1765ec.016b.GAE@google.com>
Subject: Re: [syzbot] [ext4?] KASAN: use-after-free Read in ext4_ext_insert_extent
From: syzbot <syzbot+9db318d6167044609878@syzkaller.appspotmail.com>
To: adilger.kernel@dilger.ca, akpm@linux-foundation.org, 
	dave.hansen@linux.intel.com, linux-ext4@vger.kernel.org, 
	linux-kernel@vger.kernel.org, syzkaller-bugs@googlegroups.com, tytso@mit.edu
Content-Type: text/plain; charset="UTF-8"

syzbot has bisected this issue to:

commit 665575cff098b696995ddaddf4646a4099941f5e
Author: Dave Hansen <dave.hansen@linux.intel.com>
Date:   Fri Feb 28 20:37:22 2025 +0000

    filemap: move prefaulting out of hot write path

bisection log:  https://syzkaller.appspot.com/x/bisect.txt?x=14435170580000
start commit:   d0c22de9995b Merge tag 'input-for-v6.15-rc7' of git://git...
git tree:       upstream
final oops:     https://syzkaller.appspot.com/x/report.txt?x=16435170580000
console output: https://syzkaller.appspot.com/x/log.txt?x=12435170580000
kernel config:  https://syzkaller.appspot.com/x/.config?x=a1de0d8596cea805
dashboard link: https://syzkaller.appspot.com/bug?extid=9db318d6167044609878
syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=16931170580000
C reproducer:   https://syzkaller.appspot.com/x/repro.c?x=14683ad4580000

Reported-by: syzbot+9db318d6167044609878@syzkaller.appspotmail.com
Fixes: 665575cff098 ("filemap: move prefaulting out of hot write path")

For information about bisection process see: https://goo.gl/tpsmEJ#bisection

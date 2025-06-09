Received: from mail-io1-f72.google.com (mail-io1-f72.google.com [209.85.166.72])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C06622A811
	for <linux-kernel@vger.kernel.org>; Mon,  9 Jun 2025 03:11:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.72
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749438664; cv=none; b=dSQVyvtNmnlul8Kk7jgBO9/wRYbKplyKIz8n4q3HKg25pEY/oOQojPyjJ4IpUvwrOEzif1mSE1wsC1CN68ZN9UPUnr7booU2Je3aiKPGfQLA+kKsKqk78r7P4h2VTx8nhZKcfLu1kQzIzKZpouIVG21rubAbVhA1+kEyb+l7teA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749438664; c=relaxed/simple;
	bh=XqX8W0WXjmvJmcTYPtm3CDkoRO35HGBnjqGMJwyZerM=;
	h=MIME-Version:Date:In-Reply-To:Message-ID:Subject:From:To:
	 Content-Type; b=SZdXywH9jQMrgG43xy0fYSk6zzjsLaikce/mI+9ixrmFHIUVoWW+QxkUe2bxC+TVYYY47bSAB3g07gYi1HR51AjXqCu0F0H0saiUmyszVuhqwqf9QDksd2gzDDhlscr/W5U+RejpA0o+oBDSD0WoLlaNtp92GJJbyxMM+l3FvTQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.166.72
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-io1-f72.google.com with SMTP id ca18e2360f4ac-869e9667f58so696339239f.3
        for <linux-kernel@vger.kernel.org>; Sun, 08 Jun 2025 20:11:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749438662; x=1750043462;
        h=to:from:subject:message-id:in-reply-to:date:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=wo7UpV8gmOqqjSSyDcx4sdLxk2Thz6qXIr6g3frrVp8=;
        b=u1O0U/s/pG6GCD838T0tQkve4ORhILs4xRLWEfb0UKm9Cqu6UOz4RdiEFb49toq9U2
         BPgz2Chre/TBDRNLwJlRJZknbU51bIXS+jhL3qYG+1B+oh/OneqnH626+UcPL/lzBU8Y
         qVrj/QOZERPe/K9lCUErLFRzLc5gh8x6ucJSFHtqFA8efCfFxfdytoEY1v9jFsZF3BZn
         JOHUHRL40iqfjiR/bRXNmzwi8iZ6vmCuRVNdBLyb6i2WYa6fZ44B2Hm9CdMzuuuayRNi
         NKozXbjKsfyh2EFtalueiMKHJxos3bLjYk8IM8nf2CvRFki5utw1+a1SiilKM3IZTqme
         nCuA==
X-Forwarded-Encrypted: i=1; AJvYcCXx55/Ewees06qFRCGssyCPCOHjPZSAHZe+VK+BpFIcTHLib0Mv/xwisNj+ef998iU4MU6tHbFyzR0qkHw=@vger.kernel.org
X-Gm-Message-State: AOJu0YwG6oiY2FBQzp3Y/412OVCsAkOJqVM0o3qjrYX7m8hhkHt6hees
	cunHL9V2hD9wlzfRkjz6goHliRGDcsqOZKIhAggVH6eg7FuIX7WEwMAqijBG3AjjWMquVdSq/pp
	BH41/L+JPmQYhU6qMKakNmjNKyjzlCeb5w2GDrJANhgswCIHmQBPrSZhP2wI=
X-Google-Smtp-Source: AGHT+IEpUfLTrGAb9S5XjnQfzSLe9AUGAJcv3mfxO7vTH7UhO3BuyGZJcFzIEYx7ZuJlkvXzjBZ3b7JZGRRDDZiZx0cs0Ss6h8uI
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6e02:188a:b0:3dd:b7da:5256 with SMTP id
 e9e14a558f8ab-3ddce48b1efmr123961825ab.19.1749438662672; Sun, 08 Jun 2025
 20:11:02 -0700 (PDT)
Date: Sun, 08 Jun 2025 20:11:02 -0700
In-Reply-To: <6745a8df.050a0220.1286eb.0015.GAE@google.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <684650c6.050a0220.d8705.0018.GAE@google.com>
Subject: Re: [syzbot] [kernfs?] general protection fault in kernfs_dop_revalidate
From: syzbot <syzbot+e37a1730d63d207fe403@syzkaller.appspotmail.com>
To: bfoster@redhat.com, gregkh@linuxfoundation.org, kent.overstreet@linux.dev, 
	linux-bcachefs@vger.kernel.org, linux-kernel@vger.kernel.org, 
	syzkaller-bugs@googlegroups.com, tj@kernel.org
Content-Type: text/plain; charset="UTF-8"

syzbot has bisected this issue to:

commit f7643bc9749f270d487c32dc35b578575bf1adb0
Author: Kent Overstreet <kent.overstreet@linux.dev>
Date:   Wed Apr 17 05:26:02 2024 +0000

    bcachefs: make btree read errors silent during scan

bisection log:  https://syzkaller.appspot.com/x/bisect.txt?x=17abb20c580000
start commit:   28eb75e178d3 Merge tag 'drm-next-2024-11-21' of https://gi..
git tree:       upstream
final oops:     https://syzkaller.appspot.com/x/report.txt?x=146bb20c580000
console output: https://syzkaller.appspot.com/x/log.txt?x=106bb20c580000
kernel config:  https://syzkaller.appspot.com/x/.config?x=402159daa216c89d
dashboard link: https://syzkaller.appspot.com/bug?extid=e37a1730d63d207fe403
syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=163706e8580000

Reported-by: syzbot+e37a1730d63d207fe403@syzkaller.appspotmail.com
Fixes: f7643bc9749f ("bcachefs: make btree read errors silent during scan")

For information about bisection process see: https://goo.gl/tpsmEJ#bisection

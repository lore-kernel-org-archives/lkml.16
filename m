Received: from mail-il1-f199.google.com (mail-il1-f199.google.com [209.85.166.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 85CFC3595A
	for <linux-kernel@vger.kernel.org>; Wed,  4 Jun 2025 14:13:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.199
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749046384; cv=none; b=Vl3L2KFFfs6GUS1Vs3xD5cZj0qhgXm880gPhdLVeSsxGY3KDtq6WHGeB+nukrPBcrta7EdwPKwUcLueDm+PnQY9JLgnzA9BqXRtl8K0frW2avRUiqUcoH/qr+Sp8xQQPm1lrsF4NgJ/1UPzOGU+EQIzneG+cHpRLUMvgBc4iK3o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749046384; c=relaxed/simple;
	bh=pETMmbNihg40xDEoVuVBBtU7KMobSfcxA2ZRhDoB1yk=;
	h=MIME-Version:Date:In-Reply-To:Message-ID:Subject:From:To:
	 Content-Type; b=Vtmb1dIVlxDvAu107XzwkTlAM+y3+O1BYgfELxoYWsep8l76jU7afaNEEXVKHCOV3mdSmv/LKqLxspsy2wuusYsvXaIjj0YtVc5yxt3BJKJeDA3sUn+8yYAqyAFbijZfLrWhuRoiVKAiH3fcsbyFO1EbNVerDfWa2Faq0kmQxnU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.166.199
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-il1-f199.google.com with SMTP id e9e14a558f8ab-3ddc3e2c428so3063935ab.2
        for <linux-kernel@vger.kernel.org>; Wed, 04 Jun 2025 07:13:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749046382; x=1749651182;
        h=to:from:subject:message-id:in-reply-to:date:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=phBjk/n9AOpiQJJb7voLYEGxDD9SpB+1TRkS+vnt9mg=;
        b=GnTwlM7RkvYsmCN49AQZauDi9jCB+TmAZxfk+fwABZuDomAIrEf9h6u6ImbCjTG9dA
         FuifLAtf0pnsalaiwkBIwFrnOUuf+slUKAp+OSsqQ27MZwlpYmcGM65uRNow94V4W5Qd
         yqgSCgDLvnuBUEv13G+aUZzAClMMX8uZadkYaDM/5828J9wdvW/8f06JoC1lqrdYatt3
         PQX0W+vTyMUafYV/dwT2J5P4fNinx5oI/10NWJtAKXH7Mq5a0nuzrPN8GRIxIbR46eqE
         6Z/MNRqZ2gV5U8x3nZw258DDxfJDFZi2mp9Kvgce4W74J4Xqs6/D2RePnzZ//JJeQHNk
         wEcQ==
X-Forwarded-Encrypted: i=1; AJvYcCV2jyuKlAm9caNKv8fZixV/KJx+tgJQIvbue5J3Av4ZQvf3QT+JGTPgzFHcj7ychKh3e5cAJ0NnLIqcDa4=@vger.kernel.org
X-Gm-Message-State: AOJu0YwQUgmWwmZ9nCnyzAUyGpeIXy+SAJqsgBdf5Ls2Xb1eHNcoeNOp
	7tDyhAEEdKFIgA868rdNAC2DvvVYl7SWblaEaxdxmCEpChTU/TRMalPDbQCbPCzC2DdKhFWxnnm
	bYkJ+rUIpq7tgm8u+jukWshWrHetTUfG2jewKKhAFVA6QqGGxQdRsX1MfzgU=
X-Google-Smtp-Source: AGHT+IH0H2h1Se/g/w8d2RcA094nAxjmvFtBQSlAfUSPtKtBqZQWfVQ8kTcEaiP9OMrYq5krd8lKt8eFthFiqpH0thIvJp2CvvLy
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6e02:216a:b0:3dc:8b29:3092 with SMTP id
 e9e14a558f8ab-3ddbed2be17mr35277295ab.5.1749046382538; Wed, 04 Jun 2025
 07:13:02 -0700 (PDT)
Date: Wed, 04 Jun 2025 07:13:02 -0700
In-Reply-To: <CAGR7w82vvJPoF4ptK5PvVCDSmK_PJ44DJyDBq0=q3_w-nKFc1A@mail.gmail.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <6840546e.a00a0220.d4325.000e.GAE@google.com>
Subject: Re: [syzbot] [i2c?] KMSAN: uninit-value in __i2c_smbus_xfer
From: syzbot <syzbot+0a36c1fec090c67a9885@syzkaller.appspotmail.com>
To: abhinav.ogl@gmail.com, linux-kernel@vger.kernel.org, 
	syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

Hello,

syzbot tried to test the proposed patch but the build/boot failed:

fs/bcachefs/sb-members.c:68:44: error: no member named 'size' in 'struct bch_sb_field'


Tested on:

commit:         5abc7438 Merge tag 'nfs-for-6.16-1' of git://git.linux..
git tree:       upstream
kernel config:  https://syzkaller.appspot.com/x/.config?x=9dc42c34a3f5c357
dashboard link: https://syzkaller.appspot.com/bug?extid=0a36c1fec090c67a9885
compiler:       Debian clang version 20.1.6 (++20250514063057+1e4d39e07757-1~exp1~20250514183223.118), Debian LLD 20.1.6
patch:          https://syzkaller.appspot.com/x/patch.diff?x=11f5c570580000


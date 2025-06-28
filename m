Received: from mail-il1-f197.google.com (mail-il1-f197.google.com [209.85.166.197])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D1FCA42AB0
	for <linux-kernel@vger.kernel.org>; Sat, 28 Jun 2025 13:22:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.197
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751116925; cv=none; b=VXS8663UToIthtd9VKukO51mJ2hk6+Wha/9QS7zNMdD6fYvoYJEo5cHH1Ub3YGiTbAc3wIRO11TImqDKctbLzkdJJ6CBwWBkEoheJyu5FdTbVNgfBCznfoSSHV+Puy0c9M7WpA+cr4sZnGG5Fib6ESxm3yxzSeNSVMe0rxoBP/I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751116925; c=relaxed/simple;
	bh=kyFuSw3RaAp5XFoJoJOD39ax1kJVatDnZsw9mJFCFtk=;
	h=MIME-Version:Date:In-Reply-To:Message-ID:Subject:From:To:
	 Content-Type; b=SmgKw+o75ONI6qjfWrn4ujpYE9ZSGpgcKkgiYqY390hyx5j20BpXxoUMT/Zp9UFqGcvJZlApokUQPMyIgfY5eBz2WgQo6iJ3yxAwyTGptxxpQvf6A9uZ48yqiw+bktHAuITBwAD07n3gaWSK4murdm5TwfJtNLRsVeWrgAx9okE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.166.197
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-il1-f197.google.com with SMTP id e9e14a558f8ab-3ddd97c04f4so41821735ab.2
        for <linux-kernel@vger.kernel.org>; Sat, 28 Jun 2025 06:22:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751116923; x=1751721723;
        h=to:from:subject:message-id:in-reply-to:date:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=WVT+Ku4vlzjWIdQNH/suncj4eKrbHMn6XIbhFVMQ4OQ=;
        b=wLWUMqojFtsiLEaE7vlCijkg78NqP75QYNGFKcBU9CsxlfEp+Uhi7KNTmozh2pRFlE
         vYEV35/D7SA7oQvHp8OKR/LwutMtYMnK6UpO1ugEssay3u6SUAhezE7+BuJD1HgMDsU5
         BEkteIUyuLLwV1tylXfOBupSq0YnLbL8I2fIeISyjcj9IbaDgS884B7BCeDjbN9KTert
         OzrXcY4VHqWL8+U5u4RmvXgLw9mHnm3sf0Wge4Z1mz7YS9Cx/SfI3Mqy5aN0ful81XUj
         ShFPYNkeTPqhp/1NsBOiei2ZezDxeWAyP7ZPBg3elspCR+aYBdaEIig5MEf4FAcqlGWT
         wMiw==
X-Forwarded-Encrypted: i=1; AJvYcCUrMauocQkZOuKIG6k6k0X5O1WyhAISKhudJeg2fDghDiA8xu3MhqXP0o/G97Ks/xTFEtYwIVbiLH1kiWo=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw1glO+iRVE+G39kVliOsc8ppQBgcQanSXuUPVtdPuoD5X1sVWr
	zK0LBCyC82b6kWNP4czaulzmLkxPNMvuCBkh8EsolY37PXVdxGYcH4X3eFY8op/T+0KUF3d+D+x
	dVqRmB9lmX6IBDOz6qDGi3L3eReCy6VxZRGQrOCQfpkfX+oP0mcRh/vJM+7E=
X-Google-Smtp-Source: AGHT+IGTXagmjKkVdQvjXymhxGh1YdAo4mbBxKpXdiHzoKPVtK9CHEy9iqwrBUvbi8Us1qdBE0SkQ+9TPGsdqlFcnEbp4rFTK63X
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6e02:1aaf:b0:3de:22f9:d338 with SMTP id
 e9e14a558f8ab-3df4ab5462amr79378905ab.6.1751116922936; Sat, 28 Jun 2025
 06:22:02 -0700 (PDT)
Date: Sat, 28 Jun 2025 06:22:02 -0700
In-Reply-To: <20250628120413.3247-1-enjuk@amazon.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <685fec7a.a70a0220.2f4de1.000d.GAE@google.com>
Subject: Re: [syzbot] [hams?] KASAN: slab-use-after-free Read in rose_get_neigh
From: syzbot <syzbot+e04e2c007ba2c80476cb@syzkaller.appspotmail.com>
To: enjuk@amazon.com, kohei.enju@gmail.com, linux-kernel@vger.kernel.org, 
	syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

Hello,

syzbot has tested the proposed patch and the reproducer did not trigger any issue:

Reported-by: syzbot+e04e2c007ba2c80476cb@syzkaller.appspotmail.com
Tested-by: syzbot+e04e2c007ba2c80476cb@syzkaller.appspotmail.com

Tested on:

commit:         aaf724ed Merge tag 'v6.16-rc3-smb3-client-fixes' of gi..
git tree:       upstream
console output: https://syzkaller.appspot.com/x/log.txt?x=16e1c88c580000
kernel config:  https://syzkaller.appspot.com/x/.config?x=4ec8b4e4d31ae914
dashboard link: https://syzkaller.appspot.com/bug?extid=e04e2c007ba2c80476cb
compiler:       Debian clang version 20.1.6 (++20250514063057+1e4d39e07757-1~exp1~20250514183223.118), Debian LLD 20.1.6
patch:          https://syzkaller.appspot.com/x/patch.diff?x=177df08c580000

Note: testing is done by a robot and is best-effort only.

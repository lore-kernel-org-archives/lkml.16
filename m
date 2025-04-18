Received: from mail-il1-f197.google.com (mail-il1-f197.google.com [209.85.166.197])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 85DD923817C
	for <linux-kernel@vger.kernel.org>; Fri, 18 Apr 2025 04:00:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.197
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744948815; cv=none; b=rMKEZypKeGF6NZXnD7kRH7i/ZaQgJZ8p8MGSSDFZODCwoLwgap1aVRUpYT9ZRlsbwMwx0FZ29xuUW2OdAKCQh4/IyURBEtoAoykYfza/gV6CUp72o+81IUlybDQpe+1P8Li89C+sOGA4Zsigptvmufxm6/oQ/O7pSBk80LL0Hw4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744948815; c=relaxed/simple;
	bh=fHKEKHdPjoZhYVJRZoCAKKckDq3mCm+7VXF61UEPMbE=;
	h=MIME-Version:Date:In-Reply-To:Message-ID:Subject:From:To:
	 Content-Type; b=V0GdInzA4BuMUd24OZykeTAX1mcercq5s/UMUzy07+LZfu7NnpUs39esGOH5FbuBj1zWdUn+K9SMjrdxy704uXTzpHb3GA2O9nlhi+L0fB4Wrsp/YVKNA7f4Z60enGW08fSsQK0044YMIcuiHZcL6hbWYrmKHJ4XqCGDt0Kv2Yk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.166.197
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-il1-f197.google.com with SMTP id e9e14a558f8ab-3d80ac98803so15215285ab.0
        for <linux-kernel@vger.kernel.org>; Thu, 17 Apr 2025 21:00:13 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744948812; x=1745553612;
        h=to:from:subject:message-id:in-reply-to:date:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=fHKEKHdPjoZhYVJRZoCAKKckDq3mCm+7VXF61UEPMbE=;
        b=UKpC6TRSJr+5mxkpYxHnjC2Vlv13ePW6jq5zQOfoHIJ8TOivrZJojaYGj20/wxCbe7
         zdhZZOHh9bP/TU0SGWSiH34FYLN9fynzVPwSlOHNdl8tWFmvqFufS0BavtMSOiVk/uDT
         ik2cNW4Dt2TC7JabUrkRN8XSKHSTd9SOHdTMJibY2ZQdWvgIDk13RrZoseNMm4P4Xo4a
         7/NNbm7M9M3juPiShtkwkB1/nLAT5Mhw9eaccjF+0UjwfFmPdpcSrzuHPbmWUz1d+uYP
         b7pkEst2WT19u+ie9yHk7rmJ5cCDGcJmDr8r6ykrx4iNby+aDcc7tXK7w4FsvTMCcjRZ
         xxyg==
X-Forwarded-Encrypted: i=1; AJvYcCXPA7THS0QoeOoVtbqyNY18Xsf90mjx7P1Xqc0DmSZMZx4KDGcD0Zkoymcr3abnRL4U4+J0h0Qen4VTfv8=@vger.kernel.org
X-Gm-Message-State: AOJu0YwKnj49oloEDsO0uNMe0s2IerHJ7A/aL4agFvauNKFA8BY6HnEz
	aQMHxSkD/FMPqcRAydKfySgjDHYBecKsfgv2E0nJ85Ejvjp0TV9nyYMwHqTO1u5Y/oi6GyYg19S
	k1j+X23+4s6Imydr3NO9SxBJkP+0MsECcWm3ls1/InCyADkKLGXVFJWI=
X-Google-Smtp-Source: AGHT+IEzUru6ibkgeGNXC8u7yW1ax0zndzgxv9QzoghfRsQZA4cfh1MH5s837125qe7BlITDquQbMeDZXaakdd4myRs206UoVCWu
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6e02:1565:b0:3d1:97dc:2f93 with SMTP id
 e9e14a558f8ab-3d88ee51213mr15844865ab.20.1744948812603; Thu, 17 Apr 2025
 21:00:12 -0700 (PDT)
Date: Thu, 17 Apr 2025 21:00:12 -0700
In-Reply-To: <676879e9.050a0220.226966.0031.GAE@google.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <6801ce4c.050a0220.5cdb3.0016.GAE@google.com>
Subject: Re: [moderation] KCSAN: data-race in io_sq_thread / io_sq_thread_stop
From: syzbot <syzbot+5988142e8a69a67b1418@syzkaller.appspotmail.com>
To: asml.silence@gmail.com, axboe@kernel.dk, io-uring@vger.kernel.org, 
	linux-kernel@vger.kernel.org, lizetao1@huawei.com, minhquangbui99@gmail.com, 
	syzkaller-upstream-moderation@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

Auto-closing this bug as obsolete.
Crashes did not happen for a while, no reproducer and no activity.

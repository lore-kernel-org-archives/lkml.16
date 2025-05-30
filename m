Received: from mail-il1-f199.google.com (mail-il1-f199.google.com [209.85.166.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B7742750FB
	for <linux-kernel@vger.kernel.org>; Fri, 30 May 2025 20:39:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.199
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748637546; cv=none; b=D2q0Kc5TvQXzbVLR3uGSiYSWo6CFSFPO5s/PJlzvlQj5fANrmYEBC0cyD6HrjE0XKBZc9BkkXQBqoWoX1Qsq3RMo5bNKRWzELV6Z3vq5jl8JyFy24pV1QP4jSzgtT1V/r/dDdxRrgKkI8ibFWtaVZiGEpPRjRhye000Tc2vxccc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748637546; c=relaxed/simple;
	bh=1q8KsXDzk9pyvLv7TcBN5dm8yJb6bNKJhffnCVdqsIY=;
	h=MIME-Version:Date:In-Reply-To:Message-ID:Subject:From:To:
	 Content-Type; b=tfIkg162DZsXhCCT6XgLsDXjnrkCTRQiZsuZj4QGEIOQ4pFfOnIzcGeRNvsE7mVF80wnllCplO2jzDbAIc/GId2+H6U1+Px7uEIP/pggHnxgH7nvEbvGZAEsZSHIZCOByHMC1/MT5LTpBlTeJaTe3oQ88bU2UKkqXs2UxOfUC3c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.166.199
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-il1-f199.google.com with SMTP id e9e14a558f8ab-3dd7e0c7195so27998975ab.2
        for <linux-kernel@vger.kernel.org>; Fri, 30 May 2025 13:39:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748637543; x=1749242343;
        h=to:from:subject:message-id:in-reply-to:date:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=b/ppmvmmTf2myprYnhp5r++NYHQNVyCC+00gyJtNv3A=;
        b=Xcn7nxMwfhQhq8BiN3YZQXOhYDWZDz7vIjQBXfsL2Y1sT9/9OmbkZl1FsxJ6qjqtfN
         LKB9hpTgyhCAilJ56truh8xZLwVukjTxw74pfJpDkOZJkd4pD/zHAc/3WD3DW85CIe4T
         ZyXQJ0j3j5DjsjVBdOwifZfBWooT/rPggl02eJzTxs7Ya5a2/uhvn7vY4x/1FsOcraAI
         FVOh0vbQ2iGyCRINl2aw7JJEwB6+XWk1c+byuDiUfJg2NyhHGdnGHOLc8hf5otj7FUeL
         oymmOydpbBevtnOYzYjxiwFEyyQ6NSeJnKAWoQwOIkNf3M2ehcO/utQXEB8xWTOT3AgW
         kxfw==
X-Forwarded-Encrypted: i=1; AJvYcCUBIFx24v6MqmMQM6c9IqSuasonFoglpOfoj0KGHNPIaTN7mbpJqCItWEkVx4WRRBUX6aAdl18CJBRuWVU=@vger.kernel.org
X-Gm-Message-State: AOJu0Yyw/jUVs/5v0NXQgDtk3hRFzscBShjDHl4XDJqdDeUDLbv554pD
	HQitV+qj4xNwxt/txUHTdnOnBwP6We6i98PeIYoggrANhmPi5rBaQOxu3Pym5DH03aZb2uL6hux
	V7edZI4pTy+wRStaMXY17waNqq/nSEEGtDH1ZyEaJKDMbO+gGslcsQa5WO9U=
X-Google-Smtp-Source: AGHT+IFgeUqiC/VyFjYu4mLZkeXLg5I2bqyMdhwt9jjxgE6kTE9v8EDlyLLAupV0ZU52QbcP9eRmoixNB5te77hfJKaOmV6U64UU
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a92:cda2:0:b0:3dc:8bb8:28ba with SMTP id
 e9e14a558f8ab-3dd99bcd748mr60117275ab.1.1748637543738; Fri, 30 May 2025
 13:39:03 -0700 (PDT)
Date: Fri, 30 May 2025 13:39:03 -0700
In-Reply-To: <aDoSoUiELaUMghP_@cache-sql13432>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <683a1767.a00a0220.d8eae.0010.GAE@google.com>
Subject: Re: [syzbot] [net?] possible deadlock in rtnl_newlink
From: syzbot <syzbot+846bb38dc67fe62cc733@syzkaller.appspotmail.com>
To: jdamato@fastly.com, linux-kernel@vger.kernel.org, 
	syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

Hello,

syzbot has tested the proposed patch but the reproducer is still triggering an issue:
no output from test machine



Tested on:

commit:         8477ab14 Merge tag 'iommu-updates-v6.16' of git://git...
git tree:       upstream
console output: https://syzkaller.appspot.com/x/log.txt?x=1768400c580000
kernel config:  https://syzkaller.appspot.com/x/.config?x=8a01551457d63a4b
dashboard link: https://syzkaller.appspot.com/bug?extid=846bb38dc67fe62cc733
compiler:       Debian clang version 20.1.6 (++20250514063057+1e4d39e07757-1~exp1~20250514183223.118), Debian LLD 20.1.6
patch:          https://syzkaller.appspot.com/x/patch.diff?x=17b46970580000


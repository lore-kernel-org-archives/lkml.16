Received: from mail-il1-f198.google.com (mail-il1-f198.google.com [209.85.166.198])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A42A114F98
	for <linux-kernel@vger.kernel.org>; Thu, 19 Jun 2025 06:02:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.198
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750312924; cv=none; b=Vj8bd3j54nuitRYcWWk0q/tAmD0LBkTrRnrkPqqyV9999dq19ZenpQcP81DEXLhpA7ca1Kwwv4CnvgcTKCZ/RHvIPgE3zV/miutAamm1E5ur6eLmrLMblYqPDf5REvyfXVVkP7vB3GiMhMvsGZdal6qVoxLgP7rYl8O5X+vvGm4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750312924; c=relaxed/simple;
	bh=RA+L/EWng3H2TZjKFJWHFe0TLotcExOaInhX4IF758w=;
	h=MIME-Version:Date:In-Reply-To:Message-ID:Subject:From:To:
	 Content-Type; b=TD6FUrcQD+cyJJifEUyzGM96MjaimBkhLX6WbRpto9ClZcQGU3GfKQf/jdVj1H1AyH/uYW2LAI3fXZ8C/ElIas6V2ZugL0cQXHIemfKzpewd3x7/zbw/SGCEF17jAVbjVCI+/fLA511OoRG0b3IB3YyyvctYNCO8bFqcxyEZu9E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.166.198
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-il1-f198.google.com with SMTP id e9e14a558f8ab-3ddbec809acso5163475ab.2
        for <linux-kernel@vger.kernel.org>; Wed, 18 Jun 2025 23:02:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750312921; x=1750917721;
        h=to:from:subject:message-id:in-reply-to:date:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Md5fZAX9vnt5Cga4HCnPRlHR0A0egiqUi1CoPwV7PMA=;
        b=leyLl/0pgGBqYr7YJMA6aFchySu8ee6HJiBc6d+gA8oO/aSNVBf4IoSbn/WCvaDxQf
         b1sM4GyVMCYCq5dqDkRzqN3pxVvagGP0AWGtA+bjYpiECM1+6ffZQiw4TDKy1EJqtHpu
         HZh80tFawxfG0QoI90w5iFRf2EG0gH2B0zuJcyy9hjDA3FBfH3AOydrGthMm2sFGwyJH
         GnbXaGyag6ayx9w6xAfRD7EmetrBhgvvkYgVeKof3ARId2ksITxs7FfVo4ycF2dgt3mW
         oizqucb9tRbbX7/yhwojsNBzb042xr/ochun9iab2abMVYEq5w7/p1vufjeUdUPJumYm
         eYHQ==
X-Forwarded-Encrypted: i=1; AJvYcCUW6ybKZxg65hEJU5Uw6X5WSLZPS7UYC75WQIADaYyGwvnZXtTFVG06cN0VrDZ5e1mOyQ7+Ft7VyucPY9k=@vger.kernel.org
X-Gm-Message-State: AOJu0YwfNri2APjtBDu4TBrjYVJ1qBzZiYvLAQalOXzBRcc99nrKBpMT
	RIu+OtVSWTeXyZFYCEYqcdQ4WEMA72F/9DFnZon4S/yyTcUiLgmWpdLSxpNAqVOjeRpbqbWur/n
	z4B6m6Yonq8/Ar4vz9UyPMWBLJS3xtikfbgB3Csd2DZbhQKxAHJv/0/EQ+NU=
X-Google-Smtp-Source: AGHT+IHV9QzO4kSgNs2f5Ltc+6bROOei/1qRSwFMV5aBIdmaFnD3U5vYFy3ZzqjhAFGTVBc50h22gO0ZNjBCd21dTlBM66r66Ufz
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6e02:178b:b0:3dd:a55b:39dd with SMTP id
 e9e14a558f8ab-3de07cd800cmr217807515ab.19.1750312921743; Wed, 18 Jun 2025
 23:02:01 -0700 (PDT)
Date: Wed, 18 Jun 2025 23:02:01 -0700
In-Reply-To: <CAGR7w80uuhA7ur91DoV32Ymr-eYpPWNvx9BCMCa_2HuvMTLurg@mail.gmail.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <6853a7d9.050a0220.216029.018c.GAE@google.com>
Subject: Re: [syzbot] [bcachefs?] KMSAN: uninit-value in __bch2_alloc_v4_to_text
From: syzbot <syzbot+8eb51728519f6659ef7b@syzkaller.appspotmail.com>
To: abhinav.ogl@gmail.com, linux-kernel@vger.kernel.org, 
	syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

Hello,

syzbot tried to test the proposed patch but the build/boot failed:

fs/bcachefs/btree_key_cache.c:141:13: error: incompatible integer to pointer conversion returning 'int' from a function with result type 'struct bkey_cached *' [-Wint-conversion]


Tested on:

commit:         fb4d33ab Merge tag '6.16-rc2-ksmbd-server-fixes' of gi..
git tree:       upstream
kernel config:  https://syzkaller.appspot.com/x/.config?x=db26f33438d76de9
dashboard link: https://syzkaller.appspot.com/bug?extid=8eb51728519f6659ef7b
compiler:       Debian clang version 20.1.6 (++20250514063057+1e4d39e07757-1~exp1~20250514183223.118), Debian LLD 20.1.6
patch:          https://syzkaller.appspot.com/x/patch.diff?x=12866370580000


Received: from mail-io1-f70.google.com (mail-io1-f70.google.com [209.85.166.70])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D461E8828
	for <linux-kernel@vger.kernel.org>; Sun, 29 Jun 2025 05:10:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.70
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751173804; cv=none; b=nXK6D+nS8q/RNpphxowT2uNN6CDpZtiSsO3xBi7TpITvibkPkuFNe0sBJ1uIUJaMWvM1kBOuwJcdS03vPB6pVkfmEY2sRvw5LprXQ6J503IuiNSMOxadcarJNK3nEpzNrdpTgp6VBWOoWwIu75bUwbBuxZ21QMnOS6mC67DcOzQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751173804; c=relaxed/simple;
	bh=aNiR3Lw9MNDSlRocyMPoiz+Do8n0Kkd/i/v0ChqN9+Y=;
	h=MIME-Version:Date:In-Reply-To:Message-ID:Subject:From:To:
	 Content-Type; b=YRukpj9Mjl8xufJljALtwdkljvRWXzbCldRNM693yCmdxY8y93fyMLswcfAdjqhAPfy+VIttiUudZiFp92oBKIJCM8ffRK1iGBxkXZCYqPJ4eca4afWMQ6Jx1DWDVKesxPx8q5iSeNcMSMIUpWDHdgOVvKcTfMFQrRXFUtChD3I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.166.70
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-io1-f70.google.com with SMTP id ca18e2360f4ac-875bd5522e9so82624039f.2
        for <linux-kernel@vger.kernel.org>; Sat, 28 Jun 2025 22:10:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751173802; x=1751778602;
        h=to:from:subject:message-id:in-reply-to:date:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=xfAPSBFodS1baEzZSVSrOtDU6GtBDxIYvoZte8GGu3Q=;
        b=uwEfcF2vEScmZJ3I60ok4Rdc6Rm9f2ANMuKqiZUlRHTY9ToANX66I5RPOnqVObrZJH
         rMj91Sr7aMp68YehzdSe/nTn/xBOQIAc/KOp4CrSCp1KpaiGhos4ken68OARbfQI74MF
         2+ziRDHoTlXjCZudPxjp1QDiretwsWzsxxv3HCtuIKZ9jNzjBD+zlFy9ERZd7QeJ1/kc
         sddF1a6qLLfV1RTKz+fYpDebcitPofrjGqpp8mLm1uACvEy9u2pSbwfDUepJid6JvtFM
         VxTO5mBlhI+mjps/QU28ghJBW+NpM9iXgvyQlp+qY+pwXrOnrrt+WHL6qEwIfWfd1P/O
         iDJA==
X-Forwarded-Encrypted: i=1; AJvYcCXhXtnzX9zoVgrYKgA4TdCiGPJpftte/9d/dYzyRY0A2IQBOW4/IiiJlivS6PKKQQqsdlUM45cARf0+8gc=@vger.kernel.org
X-Gm-Message-State: AOJu0YzVvDfmxyLNdPBURO/QZtYvLWNCSbEjjYpqmJNFKzZ11HGxeQCI
	webELLzQ6OOX9gEC6+cPrXU2fUHL1QwfcqQaup2W/gf+ImE3ruHEDLFsuz+EIs/aYHqT4MeztWI
	nr+i90vhUAH9KaNSHy4MGYZ1cfGbe7GMqxg6tFvI6AdTn9sCrE+xVhM32/z0=
X-Google-Smtp-Source: AGHT+IF3m9bBlVsKZz0AGHRHyIYQ9S4LRZ3vx30SyuVPQlv33/rFHSqNg/KF/RT1LyGjClooUbalVUkAYG+XvFvDhpNolEOHgkDw
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6e02:3d85:b0:3df:2a58:381a with SMTP id
 e9e14a558f8ab-3df4ab2c75dmr115400835ab.3.1751173802056; Sat, 28 Jun 2025
 22:10:02 -0700 (PDT)
Date: Sat, 28 Jun 2025 22:10:02 -0700
In-Reply-To: <67f94057.050a0220.2c5fcf.0001.GAE@google.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <6860caaa.a00a0220.274b5f.000d.GAE@google.com>
Subject: Re: [syzbot] [ext4?] kernel BUG in ext4_ext_insert_extent (2)
From: syzbot <syzbot+ad86dcdffd6785f56e03@syzkaller.appspotmail.com>
To: adilger.kernel@dilger.ca, akpm@linux-foundation.org, 
	dave.hansen@linux.intel.com, linux-ext4@vger.kernel.org, 
	linux-fsdevel@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-mm@kvack.org, syzkaller-bugs@googlegroups.com, tytso@mit.edu, 
	willy@infradead.org
Content-Type: text/plain; charset="UTF-8"

syzbot has bisected this issue to:

commit 665575cff098b696995ddaddf4646a4099941f5e
Author: Dave Hansen <dave.hansen@linux.intel.com>
Date:   Fri Feb 28 20:37:22 2025 +0000

    filemap: move prefaulting out of hot write path

bisection log:  https://syzkaller.appspot.com/x/bisect.txt?x=1434a3d4580000
start commit:   739a6c93cc75 Merge tag 'nfsd-6.16-1' of git://git.kernel.o..
git tree:       upstream
final oops:     https://syzkaller.appspot.com/x/report.txt?x=1634a3d4580000
console output: https://syzkaller.appspot.com/x/log.txt?x=1234a3d4580000
kernel config:  https://syzkaller.appspot.com/x/.config?x=d11f52d3049c3790
dashboard link: https://syzkaller.appspot.com/bug?extid=ad86dcdffd6785f56e03
syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=14fb2b0c580000

Reported-by: syzbot+ad86dcdffd6785f56e03@syzkaller.appspotmail.com
Fixes: 665575cff098 ("filemap: move prefaulting out of hot write path")

For information about bisection process see: https://goo.gl/tpsmEJ#bisection

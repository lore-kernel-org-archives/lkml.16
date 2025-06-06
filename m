Received: from mail-il1-f199.google.com (mail-il1-f199.google.com [209.85.166.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 275A019D06A
	for <linux-kernel@vger.kernel.org>; Fri,  6 Jun 2025 03:48:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.199
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749181686; cv=none; b=aA87a7CGJjonFpSkA4MGAp8tfucwFciwYbrX1pFh6wYU+wiWfLG4inMOd4/mZEkbQalw/OwI1XY/sY4GtFx5WW2VZEXXaLL2LI9NuNcdClgKi+zbYzftb6H0Hsm4dL76ZCwxfkSKGxCqNu4XwdUNkjChRvtDqSb5MrKt6AdwlCY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749181686; c=relaxed/simple;
	bh=+gFcRRwX4Qo39ESWHZakfHztExoituSWtC8IIuI1hjI=;
	h=MIME-Version:Date:In-Reply-To:Message-ID:Subject:From:To:
	 Content-Type; b=pd3ONdBNUZZJ7GRPuq76eNeOxe70Nmg/wXYhh6dC9rIWsYep7qetpB4HNSheuumgBhc2qcEs0giq7VSz6VTEfFWvO+PzBtH/uX/RImfW2QzzSkfi/cr/O3JGPEvT604r5UxN6563A2wQdpexIVVN2IA8SwCH+EdNVXTl/NtGYBQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.166.199
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-il1-f199.google.com with SMTP id e9e14a558f8ab-3ddc4908c4dso25732135ab.3
        for <linux-kernel@vger.kernel.org>; Thu, 05 Jun 2025 20:48:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749181684; x=1749786484;
        h=to:from:subject:message-id:in-reply-to:date:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=wpGDjiokXFib/0vIaMsVhfQoefT3iRkgdxyQhe9xd24=;
        b=vuYuMbq3W3MfJmOhSdFQYaHpsNYfhpnBKYvPJBwy5tQZv+D6mqen4cIz8bv8x4KIV3
         zDofSVLB3CNxu9Kemy+SNjS9pZqDBB6HDKMPoNtk2MPdlUjZw75Nl3riPyd8mLVfq4Cr
         YcS76yfnq66HCajRLlV1b/8yMb7opZ0Ux9i1ZavRp5WTcgLNz0HLNMRTlFmthbiMjBdp
         CkhvzESUFdZ/Cky3+9XLHO3hzrpjgrfyd70ui02zshFNs5QbYvSpse3xl20WHgiMFWaZ
         1bkRkNc14GwRA4H2XNoD3nI2azTkAHBT1aMkxxTf8YU2aOwLcNODN8LIH03lW2+CiKTn
         kRcA==
X-Gm-Message-State: AOJu0YyoyNz98BkmSEtBA0fpAl8P4G3F+NMRQp0GgXpmmh4v5mG86bNt
	+tVfa2NFuVMXpqGdZMwHG/7fLXAsj614iJMSY6g4tdx29ua5mv5BsYnKxBOhzXzxJ1fSedGnE0Q
	KDFWQRWbrLG84vDeo8Sf8hCxV9JCzjy8aLls25fY4j8jbJ/dgxkw9hdzunNQ=
X-Google-Smtp-Source: AGHT+IFPcpkzJEDvnI58dSaC7GWH3Eq6sUqwMx7SxUr/bFqVL5TFLgrGzzlkY5tU8YimBSKgS5egAWLBzk2q2eFU8rPVpLeilKjL
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6e02:2701:b0:3dd:b4f4:2bba with SMTP id
 e9e14a558f8ab-3ddce49a9bbmr22609955ab.22.1749181684135; Thu, 05 Jun 2025
 20:48:04 -0700 (PDT)
Date: Thu, 05 Jun 2025 20:48:04 -0700
In-Reply-To: <20250606031202.732946-1-lizhi.xu@windriver.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <684264f4.050a0220.2461cf.0037.GAE@google.com>
Subject: Re: [syzbot] [ntfs3?] KASAN: slab-out-of-bounds Read in ntfs_utf16_to_nls
From: syzbot <syzbot+598057afa0f49e62bd23@syzkaller.appspotmail.com>
To: linux-kernel@vger.kernel.org, lizhi.xu@windriver.com, 
	syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

Hello,

syzbot has tested the proposed patch and the reproducer did not trigger any issue:

Reported-by: syzbot+598057afa0f49e62bd23@syzkaller.appspotmail.com
Tested-by: syzbot+598057afa0f49e62bd23@syzkaller.appspotmail.com

Tested on:

commit:         e271ed52 Merge tag 'pm-6.16-rc1-3' of git://git.kernel..
git tree:       upstream
console output: https://syzkaller.appspot.com/x/log.txt?x=150e3282580000
kernel config:  https://syzkaller.appspot.com/x/.config?x=26abb92f9ef9d1d0
dashboard link: https://syzkaller.appspot.com/bug?extid=598057afa0f49e62bd23
compiler:       Debian clang version 20.1.6 (++20250514063057+1e4d39e07757-1~exp1~20250514183223.118), Debian LLD 20.1.6
patch:          https://syzkaller.appspot.com/x/patch.diff?x=15884c0c580000

Note: testing is done by a robot and is best-effort only.

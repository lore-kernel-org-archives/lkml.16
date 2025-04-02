Received: from mail-il1-f199.google.com (mail-il1-f199.google.com [209.85.166.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E27B92356A0
	for <linux-kernel@vger.kernel.org>; Wed,  2 Apr 2025 11:46:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.199
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743594365; cv=none; b=LVphOG1Fc6cnQQ5xGVQA1NdJujbpMurBQ6k9AGIYiWxxYvW3ZaCSk/m7fAdzM/BJUdW5DnQEUL8/KdL8PofwzSLzjPyONzYybCruNogFIWfBBfk0jf8zoIBxZ9pkm+feGBfT3mVVeCnB5yJn0furMyC2wOEs1n7hPKBCsWKdOw0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743594365; c=relaxed/simple;
	bh=aNMkM2/oqZ9nMCjFPqnNVR+sMmsTs8bfhq4pAvUOm3Q=;
	h=MIME-Version:Date:In-Reply-To:Message-ID:Subject:From:To:
	 Content-Type; b=u2Z1igkOohYINdNbk8T5TWiTxRH7pbJ9JJRmTj+Y+x5GSh3gEHopDYrnAEqXaPsd1rc2JEm1OQGqHMTfNCGY7eBX6ytBgz7peM93RCk7n6MFuAzDNaQ20C0MzaTM0tfyQWMUXQyY95XZIG24kso9Ox4jQaEkuPbzrHeqA9eWkIw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.166.199
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-il1-f199.google.com with SMTP id e9e14a558f8ab-3d44a3882a0so8202395ab.1
        for <linux-kernel@vger.kernel.org>; Wed, 02 Apr 2025 04:46:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743594363; x=1744199163;
        h=to:from:subject:message-id:in-reply-to:date:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=pAr0bHwAv+wEW9U+HD3Kl47Eakz9GlvcSplNmr7f9BI=;
        b=dm3ezrFvIwVNIlq+d3ZpALmFbg6G3J97ugpSTcjlLe0l+cMG5jJ/NCOZveLo0SzIk6
         BpTaOlMjTwNl5fkwA+ke3jnCFKunrQzudnjvajczmTo2uhHQtk2S+v++ArUn8eXdPtim
         5lxhZKT+z7HEl5/d2kW96IZd5MaMaHxqg2SiH6nn7OWDvCOsxbQi0nPRFva6upJGbdbf
         W/I9HwM/TeOS8pOk0jIW+cukxOucAyh/6ajydgORZGRR1yczzQhGMmUWnnxUw2tErEc0
         OQM7QpfdfWrheaViXh32gcxV3FKdQfSWMVuqYkgkRd1DDNkgRX+f/hsgbRbTqfcdQbrl
         ou4Q==
X-Forwarded-Encrypted: i=1; AJvYcCXQAjQuPdlNZTOge6lZ50bpIputTRp4gwECMaONLXcbmUVOunStoxH944vriUIhlM5CZ47Z1dxCYdru5Rc=@vger.kernel.org
X-Gm-Message-State: AOJu0Ywf8LfLhd1lH6tNM4THv0aZfLr5vDVzxjx+nWFAozk+WZLgZPEG
	HkaL0bQVJWYRscNW6ac9If2/4PcGIhZ5aXMJwmMv5cnAoxktKLUZWg0o+zc6ehij0pMUiKauYQV
	QXaZXaSMaYilKC00H5b0OJOSmyf+kZlrlogmAXIrJDjCgadR2pKL/v5k=
X-Google-Smtp-Source: AGHT+IFP8Vu8eyKnFDEOLX80bU32FaQbjtJMe0Q41pTgbxmHVqx+8RITthL/vxN/h82eq51cHnvzbsWK5X5Mc6OyG22i2roBc6Zb
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6e02:1a89:b0:3d4:6ed4:e0a with SMTP id
 e9e14a558f8ab-3d6d6cf7eb9mr13661855ab.4.1743594363044; Wed, 02 Apr 2025
 04:46:03 -0700 (PDT)
Date: Wed, 02 Apr 2025 04:46:03 -0700
In-Reply-To: <b648feeb-d33d-4476-bdac-1d1a28eb72a1@lucifer.local>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <67ed237b.050a0220.297a31.0019.GAE@google.com>
Subject: Re: [syzbot] [mm?] general protection fault in sys_mremap
From: syzbot <syzbot+e3385f43b2897a19be24@syzkaller.appspotmail.com>
To: akpm@linux-foundation.org, jannh@google.com, liam.howlett@oracle.com, 
	linux-kernel@vger.kernel.org, linux-mm@kvack.org, lorenzo.stoakes@oracle.com, 
	syzkaller-bugs@googlegroups.com, vbabka@suse.cz
Content-Type: text/plain; charset="UTF-8"

Hello,

syzbot has tested the proposed patch but the reproducer is still triggering an issue:
unregister_netdevice: waiting for DEV to become free

unregister_netdevice: waiting for batadv0 to become free. Usage count = 3


Tested on:

commit:         e20706d5 mseal sysmap: add arch-support txt
git tree:       https://git.kernel.org/pub/scm/linux/kernel/git/akpm/mm.git/ mm-stable
console output: https://syzkaller.appspot.com/x/log.txt?x=167a694c580000
kernel config:  https://syzkaller.appspot.com/x/.config?x=ccf540055069887f
dashboard link: https://syzkaller.appspot.com/bug?extid=e3385f43b2897a19be24
compiler:       Debian clang version 15.0.6, GNU ld (GNU Binutils for Debian) 2.40

Note: no patches were applied.

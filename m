Received: from mail-io1-f72.google.com (mail-io1-f72.google.com [209.85.166.72])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 314812AEF1
	for <linux-kernel@vger.kernel.org>; Tue, 15 Apr 2025 05:24:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.72
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744694647; cv=none; b=DbNmDwHqxIDOkw4QG7egKxKn/3r5XWho9CNqQQ2h7DbGtQ3Khn2/f+tcay1py78SJOkPttq2q80LrHf91TyzRgj2t8ughBWbPnLI82D6msYACgXBGjmtFkSRW486Ea8xfCmelxPdJY7gIgggmc5dlnNvgVMC+vCzt+tgfNF/ZkU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744694647; c=relaxed/simple;
	bh=cM/D2sFv07JzANozRWSqB6lNVtd78AhPK+CglyTxCDs=;
	h=MIME-Version:Date:In-Reply-To:Message-ID:Subject:From:To:
	 Content-Type; b=WBSgeoIOR5Tq/IiKCBM7F72x8xeF3DYpddVxbsP6w6NWxQIINSCWGf8ccM2zZVHlB2UU/AM3crj74zAM0IYUaq5L0oFGse30UaDUYV3WAIMHl/ET/fuNHwx1BUPZzQoPbrbObxyFt8FXsiKC8/7BKg/ZQLWMzguXKmxHq9Av7PM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.166.72
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-io1-f72.google.com with SMTP id ca18e2360f4ac-85b5e46a526so582737539f.1
        for <linux-kernel@vger.kernel.org>; Mon, 14 Apr 2025 22:24:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744694645; x=1745299445;
        h=to:from:subject:message-id:in-reply-to:date:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=JygxYQSn5S5PkFXpEtblNoqUiwTfAnSS1oE1AlV7IDU=;
        b=D8gS8Zg+7dtXV6FBzJwXGRXpbpGEk+kEPQU9AHBI9FjiDxNg5984KS1SnKgaZ2fD9g
         BNNLvAmlCKI5Re/EOkozoWJsVgUPo2d7L+gl4tB8Rr3kLt5/rEVYrAURPDtSyj3rtj5D
         zArHTMhGvzH0botJ5d4S8TlA4ACTWw/RqZROZKEO8B7LVLfr/TRccpjllvv+Z419+025
         rm4o7mvt8ViPzOFXUYE4733vR3VDoSyRCISg2TWrg8lh/is98Vw0kuEOmbzvavXzxYfM
         X0NlJGWICiHkaxYngdLQJeaGdY9BhjQ70psSjgFhQjAjOfcOQy/Cb8jCWDNshtgN4ZWb
         TrQQ==
X-Forwarded-Encrypted: i=1; AJvYcCUp+3S3Gtuk/ye2E38tMOsDlOjxNGyU6ffEMcO/HiQhzWTVPiELawnRHn9RDdf5W2h3Is3JBVQksSpRVYk=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw1X+AHqT5PmMKx5NxrFJwUUN+mV1o+E1A2ZGlJIHwBce5JCfwC
	cOK8wvAq1c+cAIr26NjOps7pFbq8LTnM5CVANjvaWf7T/BY+be+1/wBhYpigW8M3UOeQRi7OAXv
	lkRhbBsWm8v6iQNT8uLqGStm/SNg0NRyLxApKNNFYZDCcBL0iPvAvOsE=
X-Google-Smtp-Source: AGHT+IHkGF/DNEiT+aLRvJrtGD3TMmt6g+VZAgo4IOdzTge5lAzF0wNs5SstRvp3aDM3SdsK6ersYe+ZTd/PT3Cr9d7sn5DYrimQ
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6e02:16c9:b0:3d4:6f9d:c0d0 with SMTP id
 e9e14a558f8ab-3d7ec1f389cmr133822645ab.8.1744694645312; Mon, 14 Apr 2025
 22:24:05 -0700 (PDT)
Date: Mon, 14 Apr 2025 22:24:05 -0700
In-Reply-To: <cbbffb90-c342-4738-b7cd-76db8fd44556@amd.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <67fded75.050a0220.3483fc.0045.GAE@google.com>
Subject: Re: [syzbot] [mm?] WARNING in move_to_new_folio
From: syzbot <syzbot+8bb6fd945af4e0ad9299@syzkaller.appspotmail.com>
To: akpm@linux-foundation.org, brauner@kernel.org, 
	jfs-discussion@lists.sourceforge.net, linux-kernel@vger.kernel.org, 
	linux-mm@kvack.org, shaggy@kernel.org, shivankg@amd.com, 
	syzkaller-bugs@googlegroups.com, willy@infradead.org
Content-Type: text/plain; charset="UTF-8"

Hello,

syzbot has tested the proposed patch but the reproducer is still triggering an issue:
unregister_netdevice: waiting for DEV to become free

unregister_netdevice: waiting for batadv0 to become free. Usage count = 3


Tested on:

commit:         01c6df60 Add linux-next specific files for 20250411
git tree:       git://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
console output: https://syzkaller.appspot.com/x/log.txt?x=1142f0cc580000
kernel config:  https://syzkaller.appspot.com/x/.config?x=db03cefa26ecf825
dashboard link: https://syzkaller.appspot.com/bug?extid=8bb6fd945af4e0ad9299
compiler:       Debian clang version 15.0.6, GNU ld (GNU Binutils for Debian) 2.40
patch:          https://syzkaller.appspot.com/x/patch.diff?x=107a60cc580000


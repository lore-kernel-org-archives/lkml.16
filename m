Received: from mail-il1-f197.google.com (mail-il1-f197.google.com [209.85.166.197])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE4E12C3248
	for <linux-kernel@vger.kernel.org>; Mon,  2 Jun 2025 03:40:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.197
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748835605; cv=none; b=ihM9V+ZGz6PgRW5MXz6Srp5kSJrs1xD0RirKweYoKCQjFU45CjiFIUo0ujf3KTIcOzq9I50/n41WXUepCIqkrr1FLx/SzBMweKC9K+pv5VpCqdjnnSmnhOhQKWiiqZiebALOTT7fQmgZzpLFXLdcbdlLTmR6IPXsLODrvnpbFJw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748835605; c=relaxed/simple;
	bh=gTjz10ZJqqKfAf8JxjD3ikrUKTxKgNjM82IwYIQyCqU=;
	h=MIME-Version:Date:In-Reply-To:Message-ID:Subject:From:To:
	 Content-Type; b=UF/qKanGuqzOzie/ZoLEWBYvipPZxK1ChxxBtnIbK8gDYu/yvKOv1YTSi2Z21QqnwBeDZg/MGzTu/NoRbNLhKJkTYJ4aHUQPwR4YEVEqIIQbNzOrhtqMs+I6JccYxZzu5WRbc6eEmSK+57OvO2jypeSHezFSgXWL1QmWVtRpMZQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.166.197
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-il1-f197.google.com with SMTP id e9e14a558f8ab-3dcd10297d5so62906565ab.2
        for <linux-kernel@vger.kernel.org>; Sun, 01 Jun 2025 20:40:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748835603; x=1749440403;
        h=to:from:subject:message-id:in-reply-to:date:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=KV2mMgWGoIexSLOy1cAZdvuvJ4DmyVHPJBgL/ZYw2o8=;
        b=Zkas+HD9NiNWjKYM5aznClRah88iApLmNvXIGKFc4glqUCoO/yioYoTdF5Mp9rQp+x
         SDKZ3ePf7mnRx+75up7oOPxnZ+2CeN63p6NdJ5FsIpFincBkgIdElR4zKPzlpVRQkdlg
         qidPM8bargiBd/BNVgA2wtY5oT5MZrJemGuXWV0MoV09BA6OZnzJ3GZPYQ8U9HZQ/1+i
         qjHHVlG290Gx9fheUMRCjNyQ2LHtI0NugUGrAgWV43al3v7La/LVPx5ZqZsAoz4/3EH3
         QpDGd41GKUvRAAW6Js2Gbmdp0o7+aepA+5lCJppRdNZI2XFeTbkDML0I08wQuAoccbQ8
         3AFA==
X-Forwarded-Encrypted: i=1; AJvYcCVSVNz7xJeB/Uy6IMnHLPjNRQG88WYn4vvJJLgHIv0MKaWgTp/LeQRO1PwdJAhhjN42LAWDGtwF0yDN/+8=@vger.kernel.org
X-Gm-Message-State: AOJu0YzjCwC5uiOKZZj5KrDClTQETcs9jlBWqH4zGIgm5MuDXyriwsdp
	BTE5w4zLULdj/Uk38GJSzYZLA1sVCWA3QpVWCtEpenq+4XGDu6RN7BHsdWfibmdXWGXmmoZS5pV
	HOHyqh2WYoZj7bgvUFBPz1tPSt+tLn+KapFTutEXW+/ori5Wx/xSJX2qhyZw=
X-Google-Smtp-Source: AGHT+IG3fk84k9Uc4IpQkp0q46FY4NHxPTSFHp4OzFXhU6sfWEyq5sdh74upJVZvUF20i+ZN70DsSkiiiny0rXU1xOM6KbP1gKwg
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6e02:1b08:b0:3dc:8423:543e with SMTP id
 e9e14a558f8ab-3dd99c2c2b3mr136139095ab.17.1748835602891; Sun, 01 Jun 2025
 20:40:02 -0700 (PDT)
Date: Sun, 01 Jun 2025 20:40:02 -0700
In-Reply-To: <tencent_A10D9FA5B88DE792075D835DCD99474FC107@qq.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <683d1d12.a00a0220.d8eae.0040.GAE@google.com>
Subject: Re: [syzbot] [kernel?] KASAN: slab-out-of-bounds Read in __futex_pivot_hash
From: syzbot <syzbot+0a5079ee014f4b907817@syzkaller.appspotmail.com>
To: eadavis@qq.com, linux-kernel@vger.kernel.org, 
	syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

Hello,

syzbot has tested the proposed patch and the reproducer did not trigger any issue:

Reported-by: syzbot+0a5079ee014f4b907817@syzkaller.appspotmail.com
Tested-by: syzbot+0a5079ee014f4b907817@syzkaller.appspotmail.com

Tested on:

commit:         cd2e103d Merge tag 'hardening-v6.16-rc1-fix1-take2' of..
git tree:       upstream
console output: https://syzkaller.appspot.com/x/log.txt?x=135b700c580000
kernel config:  https://syzkaller.appspot.com/x/.config?x=4df26174733e11f3
dashboard link: https://syzkaller.appspot.com/bug?extid=0a5079ee014f4b907817
compiler:       gcc (Debian 12.2.0-14) 12.2.0, GNU ld (GNU Binutils for Debian) 2.40
patch:          https://syzkaller.appspot.com/x/patch.diff?x=107b01d4580000

Note: testing is done by a robot and is best-effort only.

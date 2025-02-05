Received: from mail-il1-f198.google.com (mail-il1-f198.google.com [209.85.166.198])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA22A1FF7D2
	for <linux-kernel@vger.kernel.org>; Wed,  5 Feb 2025 18:53:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.198
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738781585; cv=none; b=HZw+xewCZAyfRWTQ2pi6r6WKcG31eNR/azxbHi1WFv1DhIakjL0DtvYGFbxvKyYDioaO3FkgNv2KQBq81hDgYKm937sfvGZYSAn81xxLDerl5482vItPgSKD57E8uFF/Ochht4XOufzeqI9jc+s6LENzdgkpJnj34MkUs6oylqE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738781585; c=relaxed/simple;
	bh=tARMrWWTRtWys8PMKiHPgERjW0g1foV2+Wk2DGBu0Eo=;
	h=MIME-Version:Date:In-Reply-To:Message-ID:Subject:From:To:
	 Content-Type; b=M38me/mv/02VW6TUJcFOmReYWOI+Hx6Sr/W/q7HnlpYxX1F6JWIMX2K0JnUgpK72MeKdJxB7xhyEY7H9l7+o/zwQ9MQLLLLQlx91hgymUAlo8ICjTU1oiHke9gy7xSXZXIm07VxhJPiW2WSFP32YGJO1GxFch876Vb6a8RRTSyo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.166.198
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-il1-f198.google.com with SMTP id e9e14a558f8ab-3ce8cdf1898so495695ab.1
        for <linux-kernel@vger.kernel.org>; Wed, 05 Feb 2025 10:53:03 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738781583; x=1739386383;
        h=to:from:subject:message-id:in-reply-to:date:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=qDYV7j+0Ng3pBdeYSpKXURozsltAjUJSfrXA0FKOfCI=;
        b=dSt7VVU5HD66dKCjWSKevpg9AKjF9d6it428E7IHlajzyVXxr0C0WdEZU31pvGH2FU
         CUvoUcarPuP5A1E8tJi3jvsDqPgrBlGqIIsh9cw76C29dAlWEsutKnUMTRspaJWl02wv
         fkgV+fmtNFZxsiZWChuGvQVy/8zjdGoVC8lyeBs9L2Icqi2ud6cAt+plUglEgRsA5Qey
         9tZ+iVOfEyYyL2NupostoH4yNaa6zqSrgj26n2YgxmOhLTcsBjyQPcMiQYozZoeXnIMn
         q7L8RROrWEAcrbwDQ+nkTXxmBg+ilnER7cM63JtkrQth2uNiMC/JeW7KI0FmcvcQp7DU
         xLEA==
X-Forwarded-Encrypted: i=1; AJvYcCXj07YhRswYJ5PqN+kKKFTDZA5gzLfRorQcDbQMTD/t7yNHqSTxulSfeze8b88Y+5q07Gs34mpKAwTuUiI=@vger.kernel.org
X-Gm-Message-State: AOJu0YylKr6P+YydPgmcRsYIxg14FUZodjHtOaVl+a5N5+mw4+K4dS4Y
	mib9s00jTURST5l9/3aTloTroJ2JzF4/7fzdVAmSMllw5L8duecRXvw8R04iO0wTd1idifcJrxw
	bM9gJkTImc8EDUcNdFdv1e91D5+oGdTa5BlnGWNxuIukmY/fRD8aGhKI=
X-Google-Smtp-Source: AGHT+IEhJWeKOTmZ9PeHLjWCvfpb95n3CovTNjj5uKj5kahddtxpg7508wvgYjmxvMuvxjeEDXYHbYA+oqxj3rTamLCovc/dIMjw
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6e02:218f:b0:3d0:2a04:1ce2 with SMTP id
 e9e14a558f8ab-3d04f917778mr32567125ab.16.1738781583104; Wed, 05 Feb 2025
 10:53:03 -0800 (PST)
Date: Wed, 05 Feb 2025 10:53:03 -0800
In-Reply-To: <r7aylhww6ssce4uk4drib5c7awf6kcdgo5rzorbi3mve723hu6@6p7ij7t44ejq>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <67a3b38f.050a0220.19061f.05ea.GAE@google.com>
Subject: Re: [syzbot] [hardening?] [mm?] BUG: bad usercopy in vfs_readlink
From: syzbot <syzbot+48a99e426f29859818c0@syzkaller.appspotmail.com>
To: akpm@linux-foundation.org, brauner@kernel.org, gustavoars@kernel.org, 
	jack@suse.cz, kees@kernel.org, linux-hardening@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-mm@kvack.org, mjguzik@gmail.com, 
	syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

Hello,

syzbot has tested the proposed patch and the reproducer did not trigger any issue:

Reported-by: syzbot+48a99e426f29859818c0@syzkaller.appspotmail.com
Tested-by: syzbot+48a99e426f29859818c0@syzkaller.appspotmail.com

Tested on:

commit:         92514ef2 Merge tag 'for-6.14-rc1-tag' of git://git.ker..
git tree:       upstream
console output: https://syzkaller.appspot.com/x/log.txt?x=1770beb0580000
kernel config:  https://syzkaller.appspot.com/x/.config?x=207eb10d2de1b054
dashboard link: https://syzkaller.appspot.com/bug?extid=48a99e426f29859818c0
compiler:       Debian clang version 15.0.6, GNU ld (GNU Binutils for Debian) 2.40
patch:          https://syzkaller.appspot.com/x/patch.diff?x=16dde318580000

Note: testing is done by a robot and is best-effort only.

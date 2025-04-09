Received: from mail-il1-f197.google.com (mail-il1-f197.google.com [209.85.166.197])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7909782899
	for <linux-kernel@vger.kernel.org>; Wed,  9 Apr 2025 01:43:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.197
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744162985; cv=none; b=itaWITwAATtHjQvDF70LE05UcFVHDu4H5WmoVuMpyFaHAr93E02xZNaLxkU5NkRcJtaCcPKVq7vme0yRGnay8SNWc3KTe0ZcEbLdu0D2NJ3m8oQI/w5Z/khWRNCOnqv/xFAYLgKrshlmTh/2WZ8R23FI68ThD56+7ra7UVwaT4I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744162985; c=relaxed/simple;
	bh=vgM1y4gmQd6fBNreeyc7F97zSlZrcv+pQO5H/m37rxU=;
	h=MIME-Version:Date:In-Reply-To:Message-ID:Subject:From:To:
	 Content-Type; b=rnHxuBqV4ndOoWG3Wgb2V1qAVKUgaa+zz5Q0A8jWz0ZTeaCdh1JE5UxUEOPqMaSn7PONj5XWruqPLeuOQTARKBMEV4RP3UgWXG4aIXAQmFSrDiBGBdmoNmdlffdDQlUl4vBmuJscc35sBbRDAO/1qsXvSnPun/Ycrzeu8nGZpiQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.166.197
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-il1-f197.google.com with SMTP id e9e14a558f8ab-3d443811ed2so105278865ab.3
        for <linux-kernel@vger.kernel.org>; Tue, 08 Apr 2025 18:43:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744162982; x=1744767782;
        h=to:from:subject:message-id:in-reply-to:date:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=9VABebgRFNYD0ZIwfvNfEGJfhIQ/iGjXgRd/Sed5jwc=;
        b=oCXLzWyZyxUhwFnp+qif2QfHad36WdmXN38ejhMh4po+uGxWnwS0T/FjZ1PC+7rJOh
         Ph/LpMd2dp4RjupLaL0UvmvNpOwEm/aWLfFJIG4Vok46ZrhPibBUSGFG64Tuis20BpUm
         aCtx5d/QrhIODgHyz1OLsS+Yx49OsAKT4dHXjOrtC0/2KudWo1k3MIVqGdWfU3p6/Z5j
         pbIPNPpVO0dR/Zdthrsn7XAvxd7KbdWjAHcQWoPN51kRuPh2iGlWHr1HGb9qcnE/cb0H
         0iN4ayyF5wjne9d7XYiViMHlNQ+Uqvj8CqUrlip6RmARkGqKkfV8b06dbe0G3SpVVhne
         J7bg==
X-Forwarded-Encrypted: i=1; AJvYcCU86oyWv0HPxHQ9hRmFjwky2Kzg7qsQt0X23Hr3aWuZv34jL2SMZ7OLUjrI7IHtb+1gPEKFTRcDcbn51Ro=@vger.kernel.org
X-Gm-Message-State: AOJu0YwTz/v9AJ9Xpx3dMHD83xZMG4ePWMmFCCbUG+JJgqrlY+2Fy3n6
	DSm4/x+tnPdXDVgdot6mReACx6e1ddQakzikIz7D0XBoGIn7xL6Ws5S2GXxvCJUcGTddeBweJAQ
	l0ifcX4aMsn3KJS6B3/3RNn90fFSdbGjJGHQ84U/unlhoeF/qxHi76qs=
X-Google-Smtp-Source: AGHT+IFQll0kQj+lOi9ztlNV4Aa/qF+4//xkrFcKxhLf3OENwHF1SwQP1CWyQys/SwqRbAQBfWqOYUpfr2xJiQug/5oYVzCjf3re
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6e02:3712:b0:3d4:6e2f:b493 with SMTP id
 e9e14a558f8ab-3d77c282890mr9900475ab.11.1744162982657; Tue, 08 Apr 2025
 18:43:02 -0700 (PDT)
Date: Tue, 08 Apr 2025 18:43:02 -0700
In-Reply-To: <tencent_611BCC4B4F1B7A2556BA47BBBB33119E7108@qq.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <67f5d0a6.050a0220.258fea.0007.GAE@google.com>
Subject: Re: [syzbot] [wireless?] general protection fault in cfg80211_mlme_deauth
From: syzbot <syzbot+00778a9a557a2a5e1a33@syzkaller.appspotmail.com>
To: eadavis@qq.com, linux-kernel@vger.kernel.org, 
	syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

Hello,

syzbot has tested the proposed patch but the reproducer is still triggering an issue:
unregister_netdevice: waiting for DEV to become free

unregister_netdevice: waiting for batadv0 to become free. Usage count = 3


Tested on:

commit:         a2458824 Merge tag 'linux_kselftest-kunit-6.15-rc2' of..
git tree:       upstream
console output: https://syzkaller.appspot.com/x/log.txt?x=108bcc04580000
kernel config:  https://syzkaller.appspot.com/x/.config?x=eecd7902e39d7933
dashboard link: https://syzkaller.appspot.com/bug?extid=00778a9a557a2a5e1a33
compiler:       Debian clang version 15.0.6, GNU ld (GNU Binutils for Debian) 2.40
patch:          https://syzkaller.appspot.com/x/patch.diff?x=11bd323f980000


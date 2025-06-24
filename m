Received: from mail-io1-f69.google.com (mail-io1-f69.google.com [209.85.166.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B88A13B284
	for <linux-kernel@vger.kernel.org>; Tue, 24 Jun 2025 06:32:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.69
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750746725; cv=none; b=b4NiCw1ju7YTQAIJ2A24tHszCbeSyTCVDa94FJLE/dPmPNV3/uUECoYteSP9ok12Lv/tKFhX1jLdQZdKnhBz2u43RDkZoIgMrwO5bUpTtdMqC67Eh+rF8uOFEaL3ykxNrUhfnzY2BuGG9dzz6Kcqr1mcJhYBuXS+pJqM4UOZUQ4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750746725; c=relaxed/simple;
	bh=3Ta7cNZ+mYS8kufDyTDnV8ckwApvQxm2UP7jWIP4AHk=;
	h=MIME-Version:Date:In-Reply-To:Message-ID:Subject:From:To:
	 Content-Type; b=JAr+7Z6rbqmPQMCnrasEj77YW7z+UQuLrp3u/ZurLrd/wludw58oUhNOTXQ+YhhVo8VBp4ZzcMkaI17WowuPiq5QY1QAQqIlbCi7qdKK0FulVmnnYqug71yn0u2SXRK+dsTwvNnTmbo2e3IgLxZmVT3zLS0u5rxscYK1O4ZuirE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.166.69
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-io1-f69.google.com with SMTP id ca18e2360f4ac-86d1218df67so420873639f.1
        for <linux-kernel@vger.kernel.org>; Mon, 23 Jun 2025 23:32:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750746723; x=1751351523;
        h=to:from:subject:message-id:in-reply-to:date:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=8HKx8ItN89AGjL7nDr5qVKg0Vt7qL7se5BHwDIqnzP8=;
        b=qUQljdQ9nGGNmw2k/Q12iOtNFMR7zdXvu76AUi2CyNe15SJhMu8w55fV09ttPBPlAd
         FdQKB1GYcGag27nJODNQycLLRuXOCnOSfk1hwnARy5L8C7hrF5k9TQ2YEXGfg+BxYOX2
         QBjNE13hYu8O+6uYHQbCm6SwGfTByayhya2jMvjm1aOVczZP82O7EG9k/gK0vPs9WoNF
         +LYFoq0sfdY1oHlR2FeuJnONYe7FHMVh3rT7hWUfmZxh/LSMSCKx9JIFaULD3PQK/Cg0
         YCwsxiti3Z2FrAvlV21I9qQEQ7HUhTVwSA8yluZhAc5qxnPG7l31cPGq6WcV0GrN5qvu
         G8+g==
X-Forwarded-Encrypted: i=1; AJvYcCX0U5wTZpgYr1rjhyce+KHzab/fUL7Otl0RHGS2XfaS5BAlaFllNG6eKt77xpsiJKTAT44X9bo7qF6p5Ds=@vger.kernel.org
X-Gm-Message-State: AOJu0YxUwe4377V1f3/YeaHJJdojxl+PiGTkB4dkCaxkLi82vgIeMfkc
	SF3sjsVsApUbWHDtoeMIw9pbY3jINl4jJi0zrfiZ4TnJRVKXhmaWUsITU51a1MRF+IXith91o+E
	nW3EvBLWhrgBx6W+DPZeQq7OHymgXjxTMN5yre0MUGCXWzqkCRP8zlbc+OmU=
X-Google-Smtp-Source: AGHT+IH/mOlliNqfAwSEouLAo8EYuQoSEUu1bg2flpCR8pxbxbTAMmKoljw1jDUj7axtBN+7gr4jiUOq4ObMovRVr1cWuf5WCu8K
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a92:c267:0:b0:3de:25cb:42c2 with SMTP id
 e9e14a558f8ab-3de38cc4f87mr187833525ab.18.1750746722800; Mon, 23 Jun 2025
 23:32:02 -0700 (PDT)
Date: Mon, 23 Jun 2025 23:32:02 -0700
In-Reply-To: <tencent_04E8067F098D2ED5AEC04C86E7DA06EC1206@qq.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <685a4662.a00a0220.34b642.0013.GAE@google.com>
Subject: Re: [syzbot] [trace?] KASAN: slab-use-after-free Read in __free_filter
From: syzbot <syzbot+daba72c4af9915e9c894@syzkaller.appspotmail.com>
To: eadavis@qq.com, linux-kernel@vger.kernel.org, 
	syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

Hello,

syzbot has tested the proposed patch and the reproducer did not trigger any issue:

Reported-by: syzbot+daba72c4af9915e9c894@syzkaller.appspotmail.com
Tested-by: syzbot+daba72c4af9915e9c894@syzkaller.appspotmail.com

Tested on:

commit:         78f4e737 Merge tag 'for-6.16/dm-fixes' of git://git.ke..
git tree:       upstream
console output: https://syzkaller.appspot.com/x/log.txt?x=10884b70580000
kernel config:  https://syzkaller.appspot.com/x/.config?x=4ad206eb0100c6a2
dashboard link: https://syzkaller.appspot.com/bug?extid=daba72c4af9915e9c894
compiler:       gcc (Debian 12.2.0-14) 12.2.0, GNU ld (GNU Binutils for Debian) 2.40
patch:          https://syzkaller.appspot.com/x/patch.diff?x=10df7b0c580000

Note: testing is done by a robot and is best-effort only.

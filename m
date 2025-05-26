Received: from mail-io1-f71.google.com (mail-io1-f71.google.com [209.85.166.71])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7823A1F6667
	for <linux-kernel@vger.kernel.org>; Mon, 26 May 2025 18:41:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.71
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748284864; cv=none; b=mOVkSNvrgxzejJlxCyEYYaPA9vF1VeQbD9Jk73NTIANPqWmTFiyGrUOCotcuEHS2ZRiQERkkCVzqWeI7EFF4+0r0F6eLBTZTPfa6Zg76fNxn04dkcPebYEMmg1UdUytMR4SnDxd8ODPYaQJq7ynUVxHMoWviNHwD/hsIMUPT2w0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748284864; c=relaxed/simple;
	bh=4MBI4QO0e293H7noLQoz6P5dBJwn2LMrwVmWKAE5s04=;
	h=MIME-Version:Date:In-Reply-To:Message-ID:Subject:From:To:
	 Content-Type; b=oxpI0BSJYWYpQheYAUPGJVAXPV7A5a0rSGMrU7y8SZuK7WwOZ+wkm1y0KFYYnsB7Smz0QCYMZqvu9znOBifTl5XdT3rU1oQYzM4/mNtkfRTt+9yc7OtVSUGXL6ii3JGwX5VuCiu3kXP4tKgo/lXLfVwZTl3eZmUJKEJmA6VeN3Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.166.71
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-io1-f71.google.com with SMTP id ca18e2360f4ac-85b3b781313so497578239f.1
        for <linux-kernel@vger.kernel.org>; Mon, 26 May 2025 11:41:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748284862; x=1748889662;
        h=to:from:subject:message-id:in-reply-to:date:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=sANgMpkFwYeHTrhiuhnnFxkTIiQM3rzX2qKXmUr0/18=;
        b=M7KP8BUYBpfTbAxWqHME567u2NV/BTRR92aPmUzW56A/royxoj7bLvG+ivlFKWOC9v
         m3fzpLanxI6lXknWUUGLJ8GcOj2S/GyUSzx3RBDHXq1ZTl0nhxE3sZc0+MX9Pcb+sxk+
         0FeSGk7y1tsgJVd9OO9K06tPSD6HhH6tofpWUE96qOUgs2wRTUyVs3jUDTuINtKGOk0c
         um1o8eML6CqtPgBhzNIQvqKtgWLT4A1PGXiT0ulbzQs63UXsutH1LuIDXcLBVIUhSIAu
         xmSTgbKzL6Pfo3/k5cmrG+Vav0z6R6cebPGNgRPb0H5dK4zzKiKk10QgRE21q5j2Xa13
         0Sww==
X-Forwarded-Encrypted: i=1; AJvYcCX/sZ6c+0MuIKOPI8zJw478NScUYEynNMDMj4Ma9+/pUGimuLV1GXbOP4GtWkobhDyr5xw3jDm89AMtEB0=@vger.kernel.org
X-Gm-Message-State: AOJu0YzxqAUvb/ZopbgIG9cs1edhirzdaNQqlj1VsIG0QqTKOr5s8IIc
	1e6TVMagZg3fG6nXpY7p4oQzRVOsWRaN34TroiI1jpCYZrz31+YHZec0k/4indJgFsXQM/R7+i7
	c6G/i2CP5oiuHuyIgs4/S9W6Is+5MgoUyuWz0SCwGrr6cGrRgJF4Bp5JQmWE=
X-Google-Smtp-Source: AGHT+IHRJsvNtQ+zTrI31so/FnEBD39zhnMae+3fgekqUVucYEztyvYDcfcX84YX5ySL0/x+WxuW+mPR+3BhY8lNxlIYPI9F5gTg
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6602:389a:b0:85d:b7a3:b84d with SMTP id
 ca18e2360f4ac-86cbb8bee3emr795868839f.13.1748284862621; Mon, 26 May 2025
 11:41:02 -0700 (PDT)
Date: Mon, 26 May 2025 11:41:02 -0700
In-Reply-To: <87msazftff.fsf@posteo.net>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <6834b5be.a70a0220.253bc2.009a.GAE@google.com>
Subject: Re: [syzbot] [tipc?] WARNING: refcount bug in tipc_crypto_xmit
From: syzbot <syzbot+f0c4a4aba757549ae26c@syzkaller.appspotmail.com>
To: charmitro@posteo.net, davem@davemloft.net, edumazet@google.com, 
	horms@kernel.org, jmaloy@redhat.com, kuba@kernel.org, 
	linux-kernel@vger.kernel.org, netdev@vger.kernel.org, pabeni@redhat.com, 
	syzkaller-bugs@googlegroups.com, tipc-discussion@lists.sourceforge.net, 
	wangliang74@huawei.com
Content-Type: text/plain; charset="UTF-8"

Hello,

syzbot has tested the proposed patch and the reproducer did not trigger any issue:

Reported-by: syzbot+f0c4a4aba757549ae26c@syzkaller.appspotmail.com
Tested-by: syzbot+f0c4a4aba757549ae26c@syzkaller.appspotmail.com

Tested on:

commit:         d72ee421 net: tipc: fix refcount warning in tipc_aead_..
git tree:       https://github.com/charmitro/linux.git
console output: https://syzkaller.appspot.com/x/log.txt?x=10369df4580000
kernel config:  https://syzkaller.appspot.com/x/.config?x=9fd1c9848687d742
dashboard link: https://syzkaller.appspot.com/bug?extid=f0c4a4aba757549ae26c
compiler:       Debian clang version 20.1.6 (++20250514063057+1e4d39e07757-1~exp1~20250514183223.118), Debian LLD 20.1.6

Note: no patches were applied.
Note: testing is done by a robot and is best-effort only.

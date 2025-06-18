Received: from mail-io1-f70.google.com (mail-io1-f70.google.com [209.85.166.70])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0E5062EBBB6
	for <linux-kernel@vger.kernel.org>; Wed, 18 Jun 2025 15:07:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.70
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750259224; cv=none; b=cGYj3mUek7Eaf/Hfjhx/e0sT/ZmceD+D9ChHqErBQIdQNqKo4AMyOOCS0YhmtFa69iHn+g3oBavzDGXB+iyXxfiPVZ89kASZQeI+4LiO0MDHNglEo6kORllk4GLVZzw5KaGF83FUl2cZFqR+ZtV8zyYot7l3uWZ2ixVhwdCpnVs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750259224; c=relaxed/simple;
	bh=P2aimRirNcgIL6Ho4sklZIhHf933e7dpe4IoyiMRGJE=;
	h=MIME-Version:Date:In-Reply-To:Message-ID:Subject:From:To:
	 Content-Type; b=sXB3PAYObSWHg6P2OIZZld6r9KQ4clFxrpOnsuZz35BoOseo1OHWW+1EDlau4mymFQRud+UKYuL06r3wcNV0ey8bFgQaBe64S7b2d5Eflg9gv5DBe49Y+d0lot2azGSUJiiA6WtP+gAkJb/gImuKeAgoO9z/Rtv3qCzae/eMugc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.166.70
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-io1-f70.google.com with SMTP id ca18e2360f4ac-86a5def8869so1355057139f.0
        for <linux-kernel@vger.kernel.org>; Wed, 18 Jun 2025 08:07:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750259222; x=1750864022;
        h=to:from:subject:message-id:in-reply-to:date:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=kRDX5ia9y5BcNG/nL+CpwW3JfRIhx3CRudfoJpIg/QI=;
        b=cvnr14bvxf0c9GoDp3CmKUk8hJ3lbVqwv2/bnoul3WtZsQe1a0+h2m0TYrSTxtr6s1
         q1TKFGeVVXPyxx0FNI6ZdnMSn06laUL+1WPb0HaUrHDZnPzatjMimNkbrMHs7vpwvKtu
         3pXLclxhsPb9MS7o5sB9U6HMTUZETERhAPxKT9rEG30JIw6f0+m4GIPZCwJlDIUU1Dnq
         JeixWfHFbePShYIAwrB6S8Cwyj+EYrJ9NvkxWaUEkp1oBH7H9BzPNyhdOJQaog7/bWOw
         y3Q71qeTtkeTl59bfc5eZHAKyCNhCHEEfa+Qr9iVa2wgSnK+gIK8veJ/O/hq0RhHrs5P
         uMgg==
X-Gm-Message-State: AOJu0YznYEO4fx0eZGegQusi60reE1xA+Nhe5jITl+Hjaqah0a9B5YaR
	beEnw3x6B0RepyQ83td8BiYbXa1f8m8Z39irgTGCyuvWNzENzzU7ALeE4BGFmW1/UkGhmC6aK6y
	e+n5LdMG7NzDSQDfXk3z3ef4NeL9qJIMaHXjZpazX8f+QD8fHAWE+hJYBf9Q=
X-Google-Smtp-Source: AGHT+IHjXn3z3fSMZiexZ80ASZh54Qm/tzj6n0SQkNdUimZYgXkTCowp4ZCtavAKe7hwD4q2foS8MwsS9SnisA2kYg4iupOBfc/n
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6e02:b22:b0:3db:6fb2:4b95 with SMTP id
 e9e14a558f8ab-3de07cd17b8mr225886715ab.18.1750259222238; Wed, 18 Jun 2025
 08:07:02 -0700 (PDT)
Date: Wed, 18 Jun 2025 08:07:02 -0700
In-Reply-To: <CAHC9VhQkpNAsxy4rDf=qjwBrtCx5sXc74w5A=NU4R+8=FPa3Sw@mail.gmail.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <6852d616.050a0220.216029.0027.GAE@google.com>
Subject: Re: [syzbot] [selinux?] WARNING in hashtab_init
From: syzbot <syzbot+bc2c99c2929c3d219fb3@syzkaller.appspotmail.com>
To: linux-kernel@vger.kernel.org, omosnace@redhat.com, paul@paul-moore.com, 
	selinux@vger.kernel.org, stephen.smalley.work@gmail.com, 
	syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

Hello,

syzbot has tested the proposed patch and the reproducer did not trigger any issue:

Reported-by: syzbot+bc2c99c2929c3d219fb3@syzkaller.appspotmail.com
Tested-by: syzbot+bc2c99c2929c3d219fb3@syzkaller.appspotmail.com

Tested on:

commit:         52da431b Merge tag 'libnvdimm-fixes-6.16-rc3' of git:/..
git tree:       upstream
console output: https://syzkaller.appspot.com/x/log.txt?x=1206050c580000
kernel config:  https://syzkaller.appspot.com/x/.config?x=4130f4d8a06c3e71
dashboard link: https://syzkaller.appspot.com/bug?extid=bc2c99c2929c3d219fb3
compiler:       gcc (Debian 12.2.0-14) 12.2.0, GNU ld (GNU Binutils for Debian) 2.40
patch:          https://syzkaller.appspot.com/x/patch.diff?x=12163e82580000

Note: testing is done by a robot and is best-effort only.

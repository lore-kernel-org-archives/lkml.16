Received: from mail-il1-f197.google.com (mail-il1-f197.google.com [209.85.166.197])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 388AF27586A
	for <linux-kernel@vger.kernel.org>; Wed, 11 Jun 2025 18:02:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.197
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749664925; cv=none; b=Qcd/Wd8Ax4G06nnvlhigu+VKjOlFC8VZNfkTFydI9qiEWvssX+sCyAsTd3z/KiqZ7JqPRE5VeBMsfr8xspGG0GqTItj/JvhagZQLcAaK5lpkxrD/uchey5JO4ctocDYGsL7f4/Uck3YWP3adEuIAdyp0OBp3BEJaJT25X7ezrh0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749664925; c=relaxed/simple;
	bh=V1E7f5QusoelLMUHp3Yu2uLJI3CUAyfmQYr4cJCS8jM=;
	h=MIME-Version:Date:In-Reply-To:Message-ID:Subject:From:To:
	 Content-Type; b=CWncNJm3NnM5wZV8KA1AvkEPU2SsxNcuNpNlPH6hFz4Cg8fQ0E7pIEcmlHvTmzrV/po9gmMDPKtcXImSmHpIeCQxzhp/wmLy+bH0o4+38eZ3rb79AVxr/o74H5fHrZU8QrNCAx1tWM6ifrewpMUN4JWI48pxSmsLFo2F+2ZE3Nk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.166.197
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-il1-f197.google.com with SMTP id e9e14a558f8ab-3ddd03db24dso1157995ab.2
        for <linux-kernel@vger.kernel.org>; Wed, 11 Jun 2025 11:02:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749664923; x=1750269723;
        h=to:from:subject:message-id:in-reply-to:date:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=DnYzrXJvnrK56gfoRm+seV41wic4hiIzCla9ZFzIcZQ=;
        b=rHZ0ogFYsJFvlbl+mY1iSaQu5IWr2mVCPpvtH4y2xRl9huyyRsy2Z8DaHCjeHcW+Ls
         8J3+oA++vNLVamgBbtKqF4OzZ00TYHHbMXo7cZYnGpB1u/il/q68fSwyR4+nVCA7MZZy
         Ll+DOfPyhSIebgdq1HeJfUS7fM+JaNqlrH75oxnYpzVPN0zPCKFzH+s8W5wjkyd/5Iin
         MTnfWdq/L0m5oy2y2MBUygbeEAwfBPE0ZWxaEHZcCL0VDmyjNjaS+CoZi01EcAxP9552
         SpVdLUnvLY3CfgxNp1sAQ2aVFlFMOdORyc8WRpGT9yR1tZT4Tp7yovciEdQ3bZF69b3Y
         tZ5g==
X-Forwarded-Encrypted: i=1; AJvYcCWPK4gOiipJt7/vB8UeAZlVOvTmojoGGLO/cXoifnjmlkCGqdIsIMRmV/T5usv7TgnN7E0RjE88YZXlN6U=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw1UTuksz7Lx9oeDSTR6wD1BwuE2zF0DInyeUuim5Z6HLaGDve9
	MzxdaaKLfk1sKIU2uFURox5D+Lf9v50HC0C68thMKHVQpYWX+WhyLRgxPR395HEoh9NjJocOXyZ
	iilF6injtm97Q0TohFqxriV0wCQW7GXyFs6RCjArUHLDRSU0yRqdgFjZI6Ck=
X-Google-Smtp-Source: AGHT+IG8FjKx8LRHz/LA6R14C5WI1KhK0i9zeWL0MvJYVAiFKjgXESDWMm2bojrctLpZZlo55eSEZzjkqthnuN/oJbHiKPzJYNvT
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6e02:184a:b0:3dd:ceb0:f603 with SMTP id
 e9e14a558f8ab-3ddf42391cemr50493975ab.2.1749664923258; Wed, 11 Jun 2025
 11:02:03 -0700 (PDT)
Date: Wed, 11 Jun 2025 11:02:03 -0700
In-Reply-To: <aEmnv69zbkinkDVs@pc636>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <6849c49b.a00a0220.1eb5f5.00f2.GAE@google.com>
Subject: Re: [syzbot] [bcachefs?] [rcu?] BUG: unable to handle kernel NULL
 pointer dereference in rcu_core (3)
From: syzbot <syzbot+80e5d6f453f14a53383a@syzkaller.appspotmail.com>
To: akpm@linux-foundation.org, josh@joshtriplett.org, 
	kent.overstreet@linux.dev, linux-bcachefs@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-mm@kvack.org, paulmck@kernel.org, 
	rcu@vger.kernel.org, syzkaller-bugs@googlegroups.com, urezki@gmail.com
Content-Type: text/plain; charset="UTF-8"

Hello,

syzbot tried to test the proposed patch but the build/boot failed:

failed to apply patch:
checking file kernel/rcu/tree.c
patch: **** unexpected end of file in patch



Tested on:

commit:         aef17cb3 Revert "mm/damon/Kconfig: enable CONFIG_DAMON..
git tree:       upstream
kernel config:  https://syzkaller.appspot.com/x/.config?x=523d3ff8e053340a
dashboard link: https://syzkaller.appspot.com/bug?extid=80e5d6f453f14a53383a
compiler:       
patch:          https://syzkaller.appspot.com/x/patch.diff?x=17de99d4580000


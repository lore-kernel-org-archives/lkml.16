Received: from mail-io1-f70.google.com (mail-io1-f70.google.com [209.85.166.70])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C14ED1C6B4
	for <linux-kernel@vger.kernel.org>; Sun,  6 Apr 2025 03:24:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.70
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743909846; cv=none; b=IIERdlwdHDE1bhE5jFlXV1X2vJuwGBa9W7N3AOvicBYJGCru6azs9dNGg+Cv+LkG3xsRErQvR5lT49tv10I4XqxjI740kgk9emjKh5f6HMPWkjb/tPGs6rGLJSMcKiQefjJ0L/V59YagT8M99Oe0IXz8jW3kSDBDV+RgtbvAKnM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743909846; c=relaxed/simple;
	bh=ABLXLllwFo/q16PrmgXnzzFTa5COJm9krUHgWX+eBbo=;
	h=MIME-Version:Date:In-Reply-To:Message-ID:Subject:From:To:
	 Content-Type; b=Pkx9dDI0hIXJpW0Wgfu/oeTrZwpuyWJ3nkXTFc7ZXm4/7EndCu48SzzJkw6ms/oN6nbD4kYfmOuPO0DzkT1ipj7eKCavK+JnhF4/xvI7xtoYmudq1loB0Ic/4CKgN9rJtImzQtQEuFGGP97zUGATxRD1aSuXr5NF8kNYMueHv1U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.166.70
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-io1-f70.google.com with SMTP id ca18e2360f4ac-85e4f920dacso323788039f.2
        for <linux-kernel@vger.kernel.org>; Sat, 05 Apr 2025 20:24:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743909844; x=1744514644;
        h=to:from:subject:message-id:in-reply-to:date:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=yA+ww64jfHA1eAzMas24tic/XtRIkt+SowuHPK1+LmE=;
        b=ua8MWLRki/DLZZATIDSsiFVSsiQmR3pxKRcURUk7ShQ7UOp7PCpfd0AR0RJCHm9Zgp
         BPZ0k4fEhxdZrnB0P8ustQVWB1Gs/8xFhSY/YP7880uRDrlGMkela23aQtgJqf7ymPxs
         6LpLNLMwyiDrnLhuuXKOrXuIXwNzvP8hzp3ZZl3v9RHCNQjnScLExFc+jxYe8M2tX1Ry
         ngSYZpGCtZ/vzZH7AVhdZxeFMP8tIeV1zh5ZHIgC4J4yFJ9WbqZJ7jWtd9tTSscRaqsm
         +q6pu9SepSHmN9yxcj4DEZphUo0o9d8dVUAmvB+Ypgmr2ShjAhG4w8aE52t9GKyT5RB2
         SkXg==
X-Forwarded-Encrypted: i=1; AJvYcCUxyIngy/n4NAc8KN0rf06aCFhT1ik3SMEeLAAaru/QE5Kl9zRD8mQTC3+epxhmUJVwt59f1YU46bUfeEM=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx92dmlWwgnQdTQzbXj/uQ6VxqC7XCgY09rWo7AsLTtGPjR7oE/
	rxNY/CTZSoodZi9NKQ0t5782oSAYzWZIsyOahkUFTHjzziQs4K8ULM//pt6HA1sPOUKJxeDZnuW
	Oxk6T1A49cNiRZ1yPP5UMtjE+oafAZL+Omem3kTtZuZjQMfarTsB/1aE=
X-Google-Smtp-Source: AGHT+IGfCYBk66E5EOY9j6AlLnDFR67m7Aw1kxdODmlW2KlJYdLCEk9b7N7etmMawBLx8dJ2V83Q5cONLA8Jl/5NtJPBG7PCM0p+
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6e02:4401:10b0:3d3:dece:3dab with SMTP id
 e9e14a558f8ab-3d6e52f625cmr61663985ab.1.1743909843830; Sat, 05 Apr 2025
 20:24:03 -0700 (PDT)
Date: Sat, 05 Apr 2025 20:24:03 -0700
In-Reply-To: <tencent_58BA62BBDD331C9E981BDB4B611B6725A508@qq.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <67f1f3d3.050a0220.0a13.0259.GAE@google.com>
Subject: Re: [syzbot] [mm?] general protection fault in mremap
From: syzbot <syzbot+5250c4727db03e3436cc@syzkaller.appspotmail.com>
To: eadavis@qq.com, linux-kernel@vger.kernel.org, 
	syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

Hello,

syzbot tried to test the proposed patch but the build/boot failed:

patch is already applied


Tested on:

commit:         f4d2ef48 Merge tag 'kbuild-v6.15' of git://git.kernel...
git tree:       upstream
kernel config:  https://syzkaller.appspot.com/x/.config?x=adffebefc9feb9d6
dashboard link: https://syzkaller.appspot.com/bug?extid=5250c4727db03e3436cc
compiler:       
patch:          https://syzkaller.appspot.com/x/patch.diff?x=1529dd98580000


Received: from mail-il1-f199.google.com (mail-il1-f199.google.com [209.85.166.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 585C94EB51
	for <linux-kernel@vger.kernel.org>; Fri,  7 Feb 2025 03:23:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.199
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738898589; cv=none; b=fG1+mFsUZ14VYx6s0W2W9wjOrrhHJIh6ysV9P1DomgxDp3SHKC8UNzaZhCuvGID4tzLteOc2rURfx9bXgSaYZFxs+CJxXMhJ4hyhAWvGYvHH6yFGSCTqzWxdC0pmux6MA+69ue58/rZAfp91UmfD01x63xnI5u/Uw5sk0XZM6Xw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738898589; c=relaxed/simple;
	bh=BHOG030G1wT7bp+UFhFqN8KVkfS+ZnfpvkGRCB+5hmU=;
	h=MIME-Version:Date:In-Reply-To:Message-ID:Subject:From:To:
	 Content-Type; b=hGT8nHzGrWC7r5qSiOWypvYCFhf5KYkunuODt6xV5AP2MZQ/g4+IVU7q4179j7+3eXwFgiePtE205htqHkTKAg8dH0fMg9k7g2ybhbiZ+pzVcgMf4j/AHq2mB+baxQ9NsSWdSBTX7rdfOUU530rvgVBQZd09cTjAgXT2qZ2EyPE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.166.199
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-il1-f199.google.com with SMTP id e9e14a558f8ab-3d04b390e9cso11341675ab.3
        for <linux-kernel@vger.kernel.org>; Thu, 06 Feb 2025 19:23:07 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738898587; x=1739503387;
        h=to:from:subject:message-id:in-reply-to:date:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=VfSbqr6Tj8VVtpWyLsBORg/8nvfwvnihOqp6CnETHJU=;
        b=u9zL8bLTCo0dsJRY3ZETTJY1m7avXMZXPK5+o8/l4rp2u3k/lhNS79lw5zPyDxtUE9
         j2PkSppKtAhsPx5nX4K2BlhQLZgciO3VKfiOu9f+MUTjkQbFP5um3ktCSduo0K0Hb6j/
         vSNNCebdPfKCPT4HiknJV2EJRyq54RrJjOf786PlXFJzjJDK372hLrhu3juWERG0Ne2b
         nrm93DYljATOzH8Umr8AmnKKZoUWW1cYwNgYCRDnC3SeAHENvIDb1kKCej4Ibgobeqho
         xB/QVg2WIRjqAvwAiNSjDbEeQjUTuORA03Bf43LEmwuz4ypNhz5k/ORMXQmgkpCD2JRw
         iR7A==
X-Gm-Message-State: AOJu0YwT0aFem0KzlzgtRikSczfX3mdNFxW4Fm/Gy7Kor4u6hYwD7AxK
	nIXrLWVAL54x8cB2h6mNSzy0shkhLLh/aOhenKAeLGSpnlwaZzQs6YHMauaho99lV9mkNIKuVso
	mrB5DJuMPUX5tq3wDQ1XsjsIM+fKUDldVQwhd2YR9xrpgpYiiSAleefM=
X-Google-Smtp-Source: AGHT+IFS7gZsSQJVv2XR7SeBDFoHe5wYchoVjX3bMJ4zTdlwRnL56EaWc1AyubBYEd8zea4ZjoAgRMDCOcDITyzlNM3Wh2hyDj9J
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6e02:1aae:b0:3cf:fe1f:f5c5 with SMTP id
 e9e14a558f8ab-3d13dd13f64mr12577175ab.9.1738898587401; Thu, 06 Feb 2025
 19:23:07 -0800 (PST)
Date: Thu, 06 Feb 2025 19:23:07 -0800
In-Reply-To: <20250207023801.2519834-1-lizhi.xu@windriver.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <67a57c9b.050a0220.2b1e6.000b.GAE@google.com>
Subject: Re: [syzbot] [bluetooth?] general protection fault in qca_close
From: syzbot <syzbot+b9cff96f1ca33356d180@syzkaller.appspotmail.com>
To: linux-kernel@vger.kernel.org, lizhi.xu@windriver.com, 
	syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

Hello,

syzbot has tested the proposed patch and the reproducer did not trigger any issue:

Reported-by: syzbot+b9cff96f1ca33356d180@syzkaller.appspotmail.com
Tested-by: syzbot+b9cff96f1ca33356d180@syzkaller.appspotmail.com

Tested on:

commit:         808eb958 Add linux-next specific files for 20250206
git tree:       linux-next
console output: https://syzkaller.appspot.com/x/log.txt?x=1113edf8580000
kernel config:  https://syzkaller.appspot.com/x/.config?x=88b25e5d30d576e4
dashboard link: https://syzkaller.appspot.com/bug?extid=b9cff96f1ca33356d180
compiler:       Debian clang version 15.0.6, GNU ld (GNU Binutils for Debian) 2.40
patch:          https://syzkaller.appspot.com/x/patch.diff?x=15a164a4580000

Note: testing is done by a robot and is best-effort only.

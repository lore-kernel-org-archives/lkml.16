Received: from mail-io1-f69.google.com (mail-io1-f69.google.com [209.85.166.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 70F1A224F0
	for <linux-kernel@vger.kernel.org>; Sun,  6 Apr 2025 23:09:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.69
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743980944; cv=none; b=DOmS9flRH0KytefCVgbr6MieFTQM8ayupAxxD9ZtpGs1s6cOBm+5TslPuG1+aVxUWGtskH7dNbEGKmd8buxliXVbA9h2ruG5T/Vl73z8gYhQ8/2tGGhjX5KK8kCuvXWWGqXSWKYVB3aC1z8Fk/hphoO0CShSUnRGrFnzgXakABA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743980944; c=relaxed/simple;
	bh=nBx/MltWEgayUVotVSMqrSbGCkiOHklfegQP9SnZgEk=;
	h=MIME-Version:Date:In-Reply-To:Message-ID:Subject:From:To:
	 Content-Type; b=h3+1TgW4lbDw6BrQhxszw45bKVo672QHnXTah1IyC3pc/eQhgzWWErMxUwPNoKcG6XejakLKK9Q+dfDgTLfpDzApwppapVQaTyrPO16v1qt+XK06WINH6ersRd08UjussaLOCYaFe8VdASVLFvU4vzevPRUfyTFpHgLq8jH07nU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.166.69
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-io1-f69.google.com with SMTP id ca18e2360f4ac-84cdae60616so475453139f.3
        for <linux-kernel@vger.kernel.org>; Sun, 06 Apr 2025 16:09:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743980942; x=1744585742;
        h=to:from:subject:message-id:in-reply-to:date:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=+u0rYlPftXycLzardq4cSj1OE2iCZVoLU6ei3WvPyKI=;
        b=pRGHaNs5E8BxxdGiaLsyJc7Nh4RiDQHjndgld0fDkwGxV59TWepwECO3a2AD+w8LjS
         hvRE0mWeafKr0kOeCoJEKoUxDcAcGEK49moqAbZuLnBfiCYFR+rOfZavvfngsRPAzBcB
         hGkF9U//ZW5QZ6HbFcv3P0syXHgKF0D8uD+HBt0ZuuJK/NYq1BRstgtkgPkx+8Rr7JqS
         I3dJUlvrorMx+d1MVGsbYjw2kYgk6zFj50h6YQKrL5Zt08NbUxVTDXwmB1wRYwaQ8BAm
         wF2Yv9L5QqZ4wXcS87gldhbYGnMTGR/3uQjxPi5sVSORyey4W1FXpjPnLBcjdawpgDk3
         kySA==
X-Forwarded-Encrypted: i=1; AJvYcCXW1LMENiAjHnT6TAurLpm7s0rE9L5pdohKVlWIXqJk4BY1W3ginQKs0HhQsDNMGKwGOMsq57xbEli1BgI=@vger.kernel.org
X-Gm-Message-State: AOJu0Ywg130e76elb8fegsVkZ1gPEqkK0jk63taoXBDBjBwsaJIRH/No
	Xc16xllIuAxMCPud19z4I9PJYwR+wA6vEF+RuZl2Wos2CIk5lStEKMGx513ZWjzRk7Mlt08XUvV
	DXhpjdEDKpz7tBWLnI8tAaSXvittto2e59sgesdEvMIDXxcDCVDlgClo=
X-Google-Smtp-Source: AGHT+IHjPiOtD6eAAG4bJPmJWU+QCxmzHHl5XoGkvHZoAkjEA/DriSDK+8t1FrVUZldbqmOOLwht++CJOZIuegiF+zEKCHLUSsG7
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6e02:1a4d:b0:3d3:fdb8:1799 with SMTP id
 e9e14a558f8ab-3d6ec590c21mr75697825ab.22.1743980942635; Sun, 06 Apr 2025
 16:09:02 -0700 (PDT)
Date: Sun, 06 Apr 2025 16:09:02 -0700
In-Reply-To: <67392d6d.050a0220.e1c64.000a.GAE@google.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <67f3098e.050a0220.0a13.0276.GAE@google.com>
Subject: Re: [syzbot] [fs?] BUG: unable to handle kernel NULL pointer
 dereference in filemap_read_folio (4)
From: syzbot <syzbot+09b7d050e4806540153d@syzkaller.appspotmail.com>
To: akpm@linux-foundation.org, andrii@kernel.org, ast@kernel.org, 
	eddyz87@gmail.com, hdanton@sina.com, linux-fsdevel@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-mm@kvack.org, shakeel.butt@linux.dev, 
	syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

syzbot has bisected this issue to:

commit ad41251c290dfe3c01472c94d2439a59de23fe97
Author: Andrii Nakryiko <andrii@kernel.org>
Date:   Thu Aug 29 17:42:28 2024 +0000

    lib/buildid: implement sleepable build_id_parse() API

bisection log:  https://syzkaller.appspot.com/x/bisect.txt?x=1601923f980000
start commit:   a2cc6ff5ec8f Merge tag 'firewire-updates-6.15' of git://gi..
git tree:       upstream
final oops:     https://syzkaller.appspot.com/x/report.txt?x=1501923f980000
console output: https://syzkaller.appspot.com/x/log.txt?x=1101923f980000
kernel config:  https://syzkaller.appspot.com/x/.config?x=6fe3b5e6a2cb1cc2
dashboard link: https://syzkaller.appspot.com/bug?extid=09b7d050e4806540153d
syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=15743998580000
C reproducer:   https://syzkaller.appspot.com/x/repro.c?x=10143404580000

Reported-by: syzbot+09b7d050e4806540153d@syzkaller.appspotmail.com
Fixes: ad41251c290d ("lib/buildid: implement sleepable build_id_parse() API")

For information about bisection process see: https://goo.gl/tpsmEJ#bisection

Received: from mail-il1-f198.google.com (mail-il1-f198.google.com [209.85.166.198])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ACC041DED69
	for <linux-kernel@vger.kernel.org>; Thu, 24 Apr 2025 06:27:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.198
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745476027; cv=none; b=sUXCyuqp0SfDSuo5DOvzZhuM2FcLxlmnADP9Lw9/bUILzjlYJd4hDclwfvcinTXzKhFqr/QEl9boGpm95aFJeCPFc3l8s548VBRcOS+6uNiAbaLF6lUzQYMRsMFx2KAkEedPMVRQ7NgXpdcXbf7wBiCP3xw0PVyE6jm0ZwtEpT0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745476027; c=relaxed/simple;
	bh=1CEUNaxsGYi+QBHFI7XRuBkvQhG1Q2jnC2EGOCsAxeU=;
	h=MIME-Version:Date:In-Reply-To:Message-ID:Subject:From:To:
	 Content-Type; b=tUaK837ouu+7Xoh/cBKnMMytFYcWzEbofZa2BrcHQmmOm5wuMngCYUxxk6t4236ni7t/Pj4JUMo9D2aPTMW6vTQzkrEJwHx5mSSl0/6lR+DqZwQgwUSkJzL+RZxA7xl9eQe8n749qLEVDGP+E/9jKKgCObsvj7CS60CNihfTyJI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.166.198
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-il1-f198.google.com with SMTP id e9e14a558f8ab-3d5b38276deso12291645ab.3
        for <linux-kernel@vger.kernel.org>; Wed, 23 Apr 2025 23:27:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745476025; x=1746080825;
        h=to:from:subject:message-id:in-reply-to:date:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=abwTUHeE/uM/GG3wbgxZgYH14k44x/XKVziJanaRMJQ=;
        b=t7kSa+Uhc3u2UvW40nAzrLERW4GHEqOmsrRAMMK+axVoSievtz51H3UCzQaOv2fC5r
         VSZTumfk1ZlYUmEa8enEKBAASPOh8s9pKMy6Il+/rIaJlyAJZc+h+ShuBWWggcuINH3V
         GjBpKX80qMw4ITrx0PlUQfvKjoTJYLyaombnsO92fyimLUYSgdHy7e9IA6WeBhiDSMna
         h3EQlxEim9H1tshaRwJRyQCIvAjnCGba/syW0wNWy8S8YnksOhiw6JMnabuO8eXJCdbk
         JRX+9EAuGGruz2OBl28PI6OQBX62HAuTb4WEDq3HlxEVgRz4tdNOIbc0wA2AoqL7CSgI
         o6Gw==
X-Forwarded-Encrypted: i=1; AJvYcCVCZE6T4av4zC6nN5P0C3Q90o9qrX1CvcvLybAuwWcuFenyuFZqpdRZ61GriG1GciIkArTSB/QbqX+92to=@vger.kernel.org
X-Gm-Message-State: AOJu0YzpHqslgeeVIMg3eiJofUCp7ZYZbRn/45QMwu0ETcTJyN0hNajf
	Gh8bcv7uuLg+TfBY8bZycBEz/8xe8Vnn0ZvzukN0ZFAYgSvT77F1wcHL40qkodBQW6sQw7vUXRx
	FdRXNJ0yBFIWzWWy2xs3Bqp6SZcSiOdKYFBxBAlog0kY6aZwmQuKDMu8=
X-Google-Smtp-Source: AGHT+IFAG+7LNAPZtc1E5WJPuIr/o5oInRFOA+A/8lLUB47/WjeWDwH0OueyKOJzZl0O1FTB1Y/2Re9FjK7IGhotHKn+KtxGYm/U
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6e02:12c3:b0:3d3:f7ed:c903 with SMTP id
 e9e14a558f8ab-3d930234869mr14493155ab.0.1745476024913; Wed, 23 Apr 2025
 23:27:04 -0700 (PDT)
Date: Wed, 23 Apr 2025 23:27:04 -0700
In-Reply-To: <67f76c11.050a0220.258fea.0029.GAE@google.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <6809d9b8.050a0220.2c0118.0ac6.GAE@google.com>
Subject: Re: [syzbot] [bcachefs?] kernel BUG in __bch2_str_hash_check_key
From: syzbot <syzbot+843981bb836d699c07d1@syzkaller.appspotmail.com>
To: contact@arnaud-lcm.com, joshua@froggi.es, kent.overstreet@linux.dev, 
	linux-bcachefs@vger.kernel.org, linux-kernel@vger.kernel.org, 
	syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

syzbot has bisected this issue to:

commit d37c14ac6f05ec98db9b3d9db424dc73a0f5b1cd
Author: Joshua Ashton <joshua@froggi.es>
Date:   Sun Aug 13 17:34:17 2023 +0000

    bcachefs: bcachefs_metadata_version_casefolding

bisection log:  https://syzkaller.appspot.com/x/bisect.txt?x=10718ecc580000
start commit:   a79be02bba5c Fix mis-uses of 'cc-option' for warning disab..
git tree:       upstream
final oops:     https://syzkaller.appspot.com/x/report.txt?x=12718ecc580000
console output: https://syzkaller.appspot.com/x/log.txt?x=14718ecc580000
kernel config:  https://syzkaller.appspot.com/x/.config?x=3bbffc3b5b4301e1
dashboard link: https://syzkaller.appspot.com/bug?extid=843981bb836d699c07d1
syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=11f8c1b3980000
C reproducer:   https://syzkaller.appspot.com/x/repro.c?x=177ce574580000

Reported-by: syzbot+843981bb836d699c07d1@syzkaller.appspotmail.com
Fixes: d37c14ac6f05 ("bcachefs: bcachefs_metadata_version_casefolding")

For information about bisection process see: https://goo.gl/tpsmEJ#bisection

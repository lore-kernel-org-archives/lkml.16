Received: from mail-io1-f69.google.com (mail-io1-f69.google.com [209.85.166.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 660D219005D
	for <linux-kernel@vger.kernel.org>; Sat, 12 Apr 2025 06:26:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.69
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744439164; cv=none; b=UKhjtkPKSPJ/UEr8spg4JhpF3FGZybtzOARCXz2bJy6HrzGSihWV9bb0YAUf5w/JbYmWsIhMVeMYaSzZ9zv8rnA+kWbw2S1DMgiNm+RiTYwtqhO2rhbiTPmJyJRxNOWuEehSrBgm8/uvH0k+U8dISIUO/wPxN7CVT/PDOu0U5c8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744439164; c=relaxed/simple;
	bh=zjA9IMoXlF2IQ+gWITjMtMmmRvvzM1MQba86M1hAkkE=;
	h=MIME-Version:Date:In-Reply-To:Message-ID:Subject:From:To:
	 Content-Type; b=IMgQw/IHPUpusIYbhUHYnl6K96arRHheEIKRzfQbwLTXOwPQtjZCsDiaZtgDzKZFn+ttgAMW0Ii9EWJo9r5vwnTJNxW9tcLMAsQsn/oKYuSGDV4Jt5RW68ucIseSWE0TijDf0ju7Kz3yyFx/NimIokWEJmJOqhtBfheDT+NpUhs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.166.69
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-io1-f69.google.com with SMTP id ca18e2360f4ac-85e318dc464so532742739f.1
        for <linux-kernel@vger.kernel.org>; Fri, 11 Apr 2025 23:26:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744439162; x=1745043962;
        h=to:from:subject:message-id:in-reply-to:date:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=k7pttFx1O6P8ng4Jkcmf/T3DH7cXDuHmxWgJ1Rn6+98=;
        b=rUS1NT2RyzE/BTQ6AAEaCKKUMXGMjO0tOULiXA3AvDtit2gdnMUy4Q3eoda9aVQgXx
         SF49qdWSFM5j9qb9HBqRW0riBoIWWnHNRMOgZce4Yv1IZnJlc5fmCvpRx3w/2jyAiIbL
         hfIwLo1rlqalmp4gRXLUQ67R3nUiw0f08XcehN1SWDNN/u9JSfhJTJcKlVKUMEzrKI2B
         rOBe3JGbj1mKnRnuY+M50PbUS79iKYX6rOh4IxR/57iETDHMztVg4I0RsjnslHS616CE
         soTn9YNfYvwM8QCRhyPSsrV39/Yt1QKrhcKlRoq1Va/S4m6/oiXkHSP2+ikUACvXXWaG
         2URw==
X-Forwarded-Encrypted: i=1; AJvYcCXeFGV/eOSxwAwT/kS3zV0djhkq+0j4peygsAq8WB+iLkhPHQpQDCYJQcmFW4AwCq4v2uKuKw++WxuQXV0=@vger.kernel.org
X-Gm-Message-State: AOJu0YwsPk4myTweCC80nohNM5gbUr7w6OMMVhHRdWddsHRHGt0nhLZX
	ihcssNF/Y/p//8VzS7k07dR6xTtmoT4BoUd4/tW2BLkysiPgU37h/DSCF5KN1sEkuJaYXV1zO5W
	+94/wvioYmKl6LWM5sEIIsSg4De3AmH84hzCTYtt/dTD9DUePUsLgOdw=
X-Google-Smtp-Source: AGHT+IG34fLR8s87QCkirZyimVSt8DfVCzD5DN1vQwsxH5TRHhPhR+G8guF7fGAgVlg0wM0SP6SIA5hpf73XP5474nqpzyGkCsZb
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6e02:6:b0:3a7:88f2:cfa9 with SMTP id
 e9e14a558f8ab-3d7ec225f03mr53785075ab.11.1744439162437; Fri, 11 Apr 2025
 23:26:02 -0700 (PDT)
Date: Fri, 11 Apr 2025 23:26:02 -0700
In-Reply-To: <d16ba399-8ddb-4d4e-9c1c-3f657ea86abe@ovn.org>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <67fa077a.050a0220.378c5e.0003.GAE@google.com>
Subject: Re: [syzbot] [openvswitch?] KMSAN: uninit-value in validate_set (2)
From: syzbot <syzbot+b07a9da40df1576b8048@syzkaller.appspotmail.com>
To: aconole@redhat.com, davem@davemloft.net, dev@openvswitch.org, 
	echaudro@redhat.com, edumazet@google.com, horms@kernel.org, 
	i.maximets@ovn.org, kuba@kernel.org, linux-kernel@vger.kernel.org, 
	netdev@vger.kernel.org, pabeni@redhat.com, pshelar@ovn.org, 
	syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

Hello,

syzbot has tested the proposed patch and the reproducer did not trigger any issue:

Reported-by: syzbot+b07a9da40df1576b8048@syzkaller.appspotmail.com
Tested-by: syzbot+b07a9da40df1576b8048@syzkaller.appspotmail.com

Tested on:

commit:         8c1a4c54 net: openvswitch: fix nested key length valid..
git tree:       https://github.com/igsilya/linux.git tmp-validate-set
console output: https://syzkaller.appspot.com/x/log.txt?x=15a29c04580000
kernel config:  https://syzkaller.appspot.com/x/.config?x=36f90188412b4fb8
dashboard link: https://syzkaller.appspot.com/bug?extid=b07a9da40df1576b8048
compiler:       Debian clang version 15.0.6, GNU ld (GNU Binutils for Debian) 2.40

Note: no patches were applied.
Note: testing is done by a robot and is best-effort only.

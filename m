Received: from mail-il1-f198.google.com (mail-il1-f198.google.com [209.85.166.198])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F3D62AE6F
	for <linux-kernel@vger.kernel.org>; Sun,  8 Jun 2025 06:13:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.198
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749363184; cv=none; b=BPPardfqAmTXIFBxpY0dYErrtFEuNxyvzx+DV85/Wy5FIKRNLCsP3BTq8zN1pGoF2s/GW97u/6b78k2Z4GMNdoHMBR+MG3uLugCe3O3T+kfTN6qZhXi7NSE+fcoCXR2GktR3tnoK+rvgy7U/ER5mTGsdn7afmB9C6Pg5OahsysQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749363184; c=relaxed/simple;
	bh=banS8Im8D+4EymUmgquCmjjnmIq3TOYNQfR+UksTTFU=;
	h=MIME-Version:Date:In-Reply-To:Message-ID:Subject:From:To:
	 Content-Type; b=MOfaPG/AOQT+y1Q8xUvLsHc7zOEF2xLETF2fdao7qxN30ONtDt7XQ1JZS9WAtOU2xo2BX5s/c6HLm9/PXPplaUfUkoiD1E42Yzgo+Sg70GNJCXNuD1IuB4aUEqrxl2NQef+DqtN5rTcidydekIOOjQj6PxyFyjaiYiUlJ1g3M9U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.166.198
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-il1-f198.google.com with SMTP id e9e14a558f8ab-3ddb4dcebfaso79273095ab.1
        for <linux-kernel@vger.kernel.org>; Sat, 07 Jun 2025 23:13:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749363182; x=1749967982;
        h=to:from:subject:message-id:in-reply-to:date:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=k4u/+PVIsoFW3lTlJLCtnxq6Ama9WuRlhe1po2MbTd0=;
        b=J8CuJP+QnlsBM+cLbl1dJm2ecAh6peSDQj+fCVfNTCP1/wnhnlYhG2rFP9C78MPv/r
         MiNCziNLI42qJkEjGlh+KtLAR4ScUb0sXOjbW65rENeVNaFlvXU/sNhimCUkUEavqgHg
         J6+pb7h33uLeudczk88D3gfrwkgkGJURJ3dhe7zkOgFd9zpErIyczDTX/5KIccBjzMnr
         7IH+WCHs1y6YdvJje5UpuK9OM6lWUGQVb91TP1YlUG/cL9u/6r3RIMUXS1bTEMOj4WLt
         pjuB3Tl+pucZzxAhlUaEMSaRyGK78440EXWzETn6Y5N+D2ovKMniFL7lnbECW4PV0CoJ
         l0fA==
X-Forwarded-Encrypted: i=1; AJvYcCXLcmt9OAbZxBb7hPd5m7d3JycLlmKjAFazdt9ySAU3QQJn1ZabMosufuixhj/pO5DRxl8RoeXlQmUk7CE=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz7rGKiGMqWOGjOmeoljjDk9XmV7vpoLPvANsWUp/n9AA3rVBof
	1iY2tleEQtfnq2iAf29Z71IHvEFWvA5OpRS4/pwRM0QR6jHeZjnkJGsliQNKp4z5dfhdW22QKPi
	BFrHrcTgEj29HTY1Xv8iiuCrc04e/ozqfCubcTMMLIgyu5HmBBFjdEOPzRTA=
X-Google-Smtp-Source: AGHT+IHw4iEfWXDsL46PG7yHWQfEOLsPZmyRwjcEIUy8cuTkBmKDjBTF1rq7sEaWfFeIFbvm/jHVzKpbKOhcpqezVjijH33gJg+I
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6e02:1c0f:b0:3dd:cb82:3088 with SMTP id
 e9e14a558f8ab-3ddce3fce92mr100532285ab.6.1749363182287; Sat, 07 Jun 2025
 23:13:02 -0700 (PDT)
Date: Sat, 07 Jun 2025 23:13:02 -0700
In-Reply-To: <20250608054619.924-1-hdanton@sina.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <684529ee.a70a0220.27c366.004b.GAE@google.com>
Subject: Re: [syzbot] [afs?] INFO: task hung in afs_cell_purge (2)
From: syzbot <syzbot+750f21d691e244b473b1@syzkaller.appspotmail.com>
To: hdanton@sina.com, linux-kernel@vger.kernel.org, 
	syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

Hello,

syzbot has tested the proposed patch and the reproducer did not trigger any issue:

Reported-by: syzbot+750f21d691e244b473b1@syzkaller.appspotmail.com
Tested-by: syzbot+750f21d691e244b473b1@syzkaller.appspotmail.com

Tested on:

commit:         8630c59e Merge tag 'kbuild-v6.16' of git://git.kernel...
git tree:       upstream
console output: https://syzkaller.appspot.com/x/log.txt?x=1799120c580000
kernel config:  https://syzkaller.appspot.com/x/.config?x=d9ebb51ccc2ec42f
dashboard link: https://syzkaller.appspot.com/bug?extid=750f21d691e244b473b1
compiler:       Debian clang version 20.1.6 (++20250514063057+1e4d39e07757-1~exp1~20250514183223.118), Debian LLD 20.1.6
patch:          https://syzkaller.appspot.com/x/patch.diff?x=10620a82580000

Note: testing is done by a robot and is best-effort only.

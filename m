Received: from mail-io1-f69.google.com (mail-io1-f69.google.com [209.85.166.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 534A82556E
	for <linux-kernel@vger.kernel.org>; Sat, 31 May 2025 01:33:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.69
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748655185; cv=none; b=ItWhIiUp5MsiFJZ7uZUzKUrzuSS1cgtbnnxv+ZnRUTtecfuvvRs0hV72T1jC7FTU7vhIf09UjRx5H9v2Vf+pGwozFnyD8daagxcFB2YIGc9OUmCScho9tHcTI0qJvVlu8nBnnluxbE2ybg+4WqrEpi0QVr10zxV+XJ+KsBmhql0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748655185; c=relaxed/simple;
	bh=8AXhBefoFK/R4XBK96I+XaEw80nCTiWICu0cUz+1J5Y=;
	h=MIME-Version:Date:In-Reply-To:Message-ID:Subject:From:To:
	 Content-Type; b=bbqgauBK2LAuQtUYKAOv49sBY4nK6oDU1SrwjEjG1IdRe3idq6wqqCTEwq9AfWsebSJzC9kVxfvriaMA1sQg7cvKKrgwjdW9a6byRnpVHemXd7kQlsTeYYDefk3/PaTuJNtj03ynGFGqlvFsUMyqRDNomi+78ZEW9wNxajlpl0I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.166.69
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-io1-f69.google.com with SMTP id ca18e2360f4ac-86d0bac7afbso89978039f.3
        for <linux-kernel@vger.kernel.org>; Fri, 30 May 2025 18:33:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748655183; x=1749259983;
        h=to:from:subject:message-id:in-reply-to:date:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=qrAooAO0eA9dkl4xsiBOdhOrw7MeEo/UVhjo5DU+RhM=;
        b=Dm3+DBgdGfRIrOD38XLkfAMad2rQavUIagzhFDDq/IdvCXJEhfzYFlY+BWP+UaZScP
         CZ2gn2rwwQJb2go5E9Kn+uc5JJczLoVULIBESUPsmWcOrGiiGKUqNM9K9qRw1wRILqDA
         83rfJB3Bkr8ilvr/2ssdmZ+vh+JRsLUDOoa9/wTdrxRXTQbtWpmfD5e7IdIOtvX0DAv0
         3pChAZ2K4rvci17KjNzn3QdftHf8OgwKJrLylUa+TX7JAFQqp8p2hWU0Etni9mniElVI
         cD4kYvpqjoR0DwQXfTKtzw7FrL9rkGkRoaKFJ5In9kx/VI+Q9Axg9aUbcBo/E7YM2mUZ
         tQMg==
X-Forwarded-Encrypted: i=1; AJvYcCWLVsgDJtU25y4qRt2WPgYGlfTrC3Z7MJaBJtPH8f1lc8GT/Cv2et3Pc8fECy81/0zDSXodfwkcXENVKxM=@vger.kernel.org
X-Gm-Message-State: AOJu0YyiTUfkKyg3j9Qx+dideK7RbEQFfSvuMSVq/ofX6HjD6grIYKBk
	uFYTT0aScq/6H6H8fyv1VMDJ8N4aVJOWeI/j03kCacrMeHte5eAi1ysTZ/dUttLyuEA2SgMHkY6
	B2pXpSRapRm3429kTgve6dNPhCG73kqS+HraMh/Gc21hsgeXfnzdTEPvf2XE=
X-Google-Smtp-Source: AGHT+IGx4jTzgiH+6ygy7tZbN+oY9byRGDtT48Ip+NBhJ4baZT9lgdMEXUTOuy6g36q5sW9IXOeLgCilTsf4anolmqp0Dg2t/s7e
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6e02:1fec:b0:3dc:8667:342d with SMTP id
 e9e14a558f8ab-3dd9cacc967mr45817895ab.12.1748655182810; Fri, 30 May 2025
 18:33:02 -0700 (PDT)
Date: Fri, 30 May 2025 18:33:02 -0700
In-Reply-To: <20250531011248.2445-1-hdanton@sina.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <683a5c4e.a70a0220.1a6ae.0007.GAE@google.com>
Subject: Re: [syzbot] [net?] possible deadlock in rtnl_newlink
From: syzbot <syzbot+846bb38dc67fe62cc733@syzkaller.appspotmail.com>
To: edumazet@google.com, hdanton@sina.com, jdamato@fastly.com, 
	john.cs.hey@gmail.com, linux-kernel@vger.kernel.org, netdev@vger.kernel.org, 
	stfomichev@gmail.com, syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

Hello,

syzbot has tested the proposed patch but the reproducer is still triggering an issue:
no output from test machine



Tested on:

commit:         0f70f5b0 Merge tag 'pull-automount' of git://git.kerne..
git tree:       upstream
console output: https://syzkaller.appspot.com/x/log.txt?x=15927ff4580000
kernel config:  https://syzkaller.appspot.com/x/.config?x=8a01551457d63a4b
dashboard link: https://syzkaller.appspot.com/bug?extid=846bb38dc67fe62cc733
compiler:       Debian clang version 20.1.6 (++20250514063057+1e4d39e07757-1~exp1~20250514183223.118), Debian LLD 20.1.6
patch:          https://syzkaller.appspot.com/x/patch.diff?x=17b8ded4580000


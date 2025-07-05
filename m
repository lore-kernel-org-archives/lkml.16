Received: from mail-io1-f69.google.com (mail-io1-f69.google.com [209.85.166.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EAEA41991D2
	for <linux-kernel@vger.kernel.org>; Sat,  5 Jul 2025 05:43:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.69
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751694185; cv=none; b=qo4LYfWpAOJIpJfrz0qU0a3ISUarEBYGEVJafrngtYvuP3LBgNaR6HkyXdAsKMYKnfTkri0C3CiK6M6aBdbVPoSvrKjLxGcNuNq/6hDkz5tW2H0gkN0nDL7OXY/aejStK1cs0Qo1tRwDoPwE0EvRo2p3TzCO+7F3x3pbhgBKDjw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751694185; c=relaxed/simple;
	bh=CM6lUohq5ywUspKxV0/n4f/M5Qwl4T9xM2ssjXsyyY8=;
	h=MIME-Version:Date:In-Reply-To:Message-ID:Subject:From:To:
	 Content-Type; b=hfFs6xnUYDLx94IVjJLBEx+v1TcBEdyOMt8ELe54WE9ANEZ+94rKMkueWZbXwVt2HztcVWWDA0DzkEGUuriA1l1ABMydtE2WutVTNUO2l1Y3u7n/t2taz0fOugqHZu+/zRrBDyxxiZqQ9WA8HmiOfzXnzBT2sfOZoS3U6+XQxc4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.166.69
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-io1-f69.google.com with SMTP id ca18e2360f4ac-876a65a7157so125890039f.1
        for <linux-kernel@vger.kernel.org>; Fri, 04 Jul 2025 22:43:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751694183; x=1752298983;
        h=to:from:subject:message-id:in-reply-to:date:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=kc59fg6FdWXRC5411Fspbd54oUUViS20A4uqc5h8iw8=;
        b=Am686l6PyCnpsxHBOpgmZy3LQfiFhbW9R/fZbgwIM7b8SZ9i+h/F742peJw5wuIoVd
         FhKajmKIA3hnCyh1eu3laeIm1uD+olOuRzdqpnjJ+5m+CcgHdpf+2d1FzT79ELULCOvj
         vTKWKW2pz4xMRf26zsUaQAqt8afVRc7aNSCxEJZYKnw9lUDhsID8a/yKYKbiTTQ1jVUj
         GB8MQBOHCMIhW5Rru+pk16bU4kWWODLHBnZly6x+nf/YtDSwRvxj7khxKkr23NEUd+la
         S/VlCC82TpPMDoZc355QynhuBbyYtzGHuXSY9D1CZUPrf+Y7jbqAOM81Dc3eX1gr3lm3
         0RXw==
X-Forwarded-Encrypted: i=1; AJvYcCUxJzgKuJTqhcis51xV/1+wn67WlhSjNWl8MWCybMiJX0Ctv2l6IZFGnfuM/3qvGIAMTE7ffD+OxFhPJ/I=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw3kE0WfyUYeX6TZAkaTtG8zDMmRMHKdwgoC2X4qdlUeNoclhao
	PW8Z+3ObJcNdkOA2WMz2Ffz4RLUQuxSciv8jtZslXDxOGHeKmx/LdWIG7Zu9k+PLuhJzmWLRZMR
	6DYJnVKb9K3MsmQm+LsMPdKRw8shZMWMFvJvvpmizanmz2yA6VQ25neznlKU=
X-Google-Smtp-Source: AGHT+IHKt+Afq8uNiZ9S2sR1SyxCRMBe2UUFBU7QoKGVD21ViQHiJ+1y1AdJHX+nIHjV3T0VWiAIXxwifJ+YCX7rXIQCMHH9HXY4
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6e02:178d:b0:3dd:e6b2:1078 with SMTP id
 e9e14a558f8ab-3e13483b9b7mr46830485ab.6.1751694183116; Fri, 04 Jul 2025
 22:43:03 -0700 (PDT)
Date: Fri, 04 Jul 2025 22:43:03 -0700
In-Reply-To: <68663c93.a70a0220.5d25f.0857.GAE@google.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <6868bb67.a70a0220.29cf51.0032.GAE@google.com>
Subject: Re: [syzbot] [net?] general protection fault in htb_qlen_notify
From: syzbot <syzbot+d8b58d7b0ad89a678a16@syzkaller.appspotmail.com>
To: davem@davemloft.net, edumazet@google.com, horms@kernel.org, 
	jhs@mojatatu.com, jiri@resnulli.us, kuba@kernel.org, 
	linux-kernel@vger.kernel.org, netdev@vger.kernel.org, nnamrec@gmail.com, 
	pabeni@redhat.com, pctammela@mojatatu.com, syzkaller-bugs@googlegroups.com, 
	victor@mojatatu.com, xiyou.wangcong@gmail.com
Content-Type: text/plain; charset="UTF-8"

syzbot has bisected this issue to:

commit 103406b38c600fec1fe375a77b27d87e314aea09
Author: Lion Ackermann <nnamrec@gmail.com>
Date:   Mon Jun 30 13:27:30 2025 +0000

    net/sched: Always pass notifications when child class becomes empty

bisection log:  https://syzkaller.appspot.com/x/bisect.txt?x=14c9c582580000
start commit:   bd475eeaaf3c Merge branch '200GbE' of git://git.kernel.org..
git tree:       net
final oops:     https://syzkaller.appspot.com/x/report.txt?x=16c9c582580000
console output: https://syzkaller.appspot.com/x/log.txt?x=12c9c582580000
kernel config:  https://syzkaller.appspot.com/x/.config?x=36b0e72cad5298f8
dashboard link: https://syzkaller.appspot.com/bug?extid=d8b58d7b0ad89a678a16
syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=171af48c580000
C reproducer:   https://syzkaller.appspot.com/x/repro.c?x=151b33d4580000

Reported-by: syzbot+d8b58d7b0ad89a678a16@syzkaller.appspotmail.com
Fixes: 103406b38c60 ("net/sched: Always pass notifications when child class becomes empty")

For information about bisection process see: https://goo.gl/tpsmEJ#bisection

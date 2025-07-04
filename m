Received: from mail-il1-f200.google.com (mail-il1-f200.google.com [209.85.166.200])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A4A81367
	for <linux-kernel@vger.kernel.org>; Fri,  4 Jul 2025 01:12:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.200
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751591529; cv=none; b=CRTwKulEglczy/HK69YeMzDuN/e9s7pvIWi0A6h/YCvYQoi842/Xg5fbQaf9WxtGyFHpb0nTjxudRc/3tU6yrx/8QTsR+RqfBewLnIOei6yTmEKZlHTd3EFsDyt943UkaJn5efMpFc8JYIB7fh+oag5zzjx2/WkEljuTUmAHejI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751591529; c=relaxed/simple;
	bh=v4ljxXh9jmLHKzoGwMvcVw2+anv/viIoaS532cR4bqI=;
	h=MIME-Version:Date:In-Reply-To:Message-ID:Subject:From:To:
	 Content-Type; b=nSMkB0TSgNxbflutDE3oaO6IyiMGggh7ubc5SH2ynir1PWjLtCaLWGa8DsdrfWIyUZ9E2lz1I5hyZTToLdHMwwy0Z91ZyPs6dsl8iE4FcLS6MqpsTVUg5k/ccBeqBDRz2hmsY+h4YqKlWdsmA6NuYR7rN71O1Ppw+A62SzilBmg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.166.200
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-il1-f200.google.com with SMTP id e9e14a558f8ab-3df4022687eso4716395ab.1
        for <linux-kernel@vger.kernel.org>; Thu, 03 Jul 2025 18:12:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751591525; x=1752196325;
        h=to:from:subject:message-id:in-reply-to:date:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=MkuOwkFiGaiAuFJlUywvo+QnqLqF8JrCZ3yBHoZeImQ=;
        b=Ph2SGFBFUamYMxrzMzW/yv3T2p1JsRftwRGLLB0p5TRi4t39aTgHMrHhJmrYauwRVP
         V/P6cY4eXUUWYyPuYMevmtR1GE4WEmCFSnvLt+iZaXh5Jvs9MQnc8/CGW9RMDdtpYa4x
         3BumTMhVTXaLgSUeXM+TskJhl2PjU58hf/KoHCqycv6mmJqpkfsTchGQJpQqjsH+0VIz
         0r8xaPGpM81PrKsqEL35xFHiCIOaAd1A2TWVP8ABanfsZVzRowHta2mmJid20umeCsNi
         xeZbCMA3kaw+DPzm1GrCW3Ek08E+eiMkSmzZtaLctyC0hheM/nngQgW2hoNvY1Iq0ATc
         ircQ==
X-Forwarded-Encrypted: i=1; AJvYcCV9fWZPJ5h8iDtPrbKuPdxJQP9fUdLaIwyyc/FasKRTKQS7+jENte+/CRwc8iU7RLQ1X25zEBkBlI08IPU=@vger.kernel.org
X-Gm-Message-State: AOJu0YwUUViwz/PrqUktw42nSQf9dMhfEZW74H8BIPx2VvS+K3Hsplk3
	hl76yMmgHCsUyA464V2O+welNZWlkir+v40ozkKDjqAZPHlqb8/6dv2daK9YjyqP5rVsXiPjjeh
	F/rIlcx/kvisd/u/7v4sulxv4oskT6++LuQYDldZcvokYOJYyhvtARk7bBWg=
X-Google-Smtp-Source: AGHT+IHwNUtJNYBWi9dh6hlhmUWt01g4j478p8KSAzt2iVqzGD7y+FBKavq1knyjjnEO5w2MgU6suKIGkQtwvL2xzu7Ovu7k6N+J
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a92:c52b:0:b0:3e1:3491:e873 with SMTP id
 e9e14a558f8ab-3e13491e9d2mr8427755ab.10.1751591525652; Thu, 03 Jul 2025
 18:12:05 -0700 (PDT)
Date: Thu, 03 Jul 2025 18:12:05 -0700
In-Reply-To: <f14f4c0f-dc5d-454e-b5ef-1143b5a8f512@mojatatu.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <68672a65.a00a0220.c7b3.000c.GAE@google.com>
Subject: Re: [syzbot] [net?] general protection fault in htb_qlen_notify
From: syzbot <syzbot+d8b58d7b0ad89a678a16@syzkaller.appspotmail.com>
To: davem@davemloft.net, edumazet@google.com, horms@kernel.org, 
	jhs@mojatatu.com, jiri@resnulli.us, kuba@kernel.org, 
	linux-kernel@vger.kernel.org, netdev@vger.kernel.org, pabeni@redhat.com, 
	syzkaller-bugs@googlegroups.com, victor@mojatatu.com, 
	xiyou.wangcong@gmail.com
Content-Type: text/plain; charset="UTF-8"

Hello,

syzbot has tested the proposed patch and the reproducer did not trigger any issue:

Reported-by: syzbot+d8b58d7b0ad89a678a16@syzkaller.appspotmail.com
Tested-by: syzbot+d8b58d7b0ad89a678a16@syzkaller.appspotmail.com

Tested on:

commit:         223e2288 vsock/vmci: Clear the vmci transport packet p..
git tree:       net
console output: https://syzkaller.appspot.com/x/log.txt?x=16685ebc580000
kernel config:  https://syzkaller.appspot.com/x/.config?x=36b0e72cad5298f8
dashboard link: https://syzkaller.appspot.com/bug?extid=d8b58d7b0ad89a678a16
compiler:       Debian clang version 20.1.7 (++20250616065708+6146a88f6049-1~exp1~20250616065826.132), Debian LLD 20.1.7
patch:          https://syzkaller.appspot.com/x/patch.diff?x=141d8c8c580000

Note: testing is done by a robot and is best-effort only.

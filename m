Received: from mail-il1-f198.google.com (mail-il1-f198.google.com [209.85.166.198])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0A9A079F5
	for <linux-kernel@vger.kernel.org>; Fri,  4 Apr 2025 01:44:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.198
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743731044; cv=none; b=OOhfWLVtTlauqbpckrMN1PQoYmtL33sY0QfHE5IJ2pGmV1yrB5EVkVfKC/nYq976zTabUuR85mXQw3NZNI3LHP9Yy7QuVrnhe2fL9TzlnQ28pDGomG2XMjQijXZwQYqXgA0hH+vmrnB/lDFOabmLpRdHoezSrlGg9v960GV5YV0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743731044; c=relaxed/simple;
	bh=A393Gx2pK/Ku/cFvRGlnYxqYTsuIduB+8xOBy8MxwTQ=;
	h=MIME-Version:Date:In-Reply-To:Message-ID:Subject:From:To:
	 Content-Type; b=uR2MQ6CV7netauEpoM6ggWuFhynBxZtbWlo6qqdWI95rU7ujgLOny8p5lNSVn+SuY8oWPxXdcYr9/Wrl4gWXVeEXuMlpRbdFRLNRQYVhkrz4ytZt8Rvd39cPNSSwTlvAKdzTTE753dC7Sgvy9YACQgOFaAfmPdQbVW6Vq9mNRg8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.166.198
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-il1-f198.google.com with SMTP id e9e14a558f8ab-3d5da4fd946so30354925ab.1
        for <linux-kernel@vger.kernel.org>; Thu, 03 Apr 2025 18:44:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743731042; x=1744335842;
        h=to:from:subject:message-id:in-reply-to:date:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=DoiImokpJQCJ328qckmZBvIfg+4Z/tOC/nua1/PJ5gI=;
        b=nCdST3cr6uULBB2eb4KNp0Q+TcNQL/Kyeltk0ANSAyWpses6e2IdfmjgpkTNCfeeSM
         UsTyL4fSUnEUj+ecuFoN7LqeQ0zeKjkv1gTtZqFnttGheA4NERnv6ZuwdCqTvk2w5zmP
         C4UzjE8Z4VxYFEDoZK2bqPSiWVnM/64eDEjcnsFjBFKDFHUvwM6TMgBYoEkMgEe1+zf0
         ZkPTHrsSZDB0D2bQ6vhscFLCteZPE2kxk7tnUHg4rmfSTLqofQvbM/NYKuOcOj8WUnGt
         76LWY474Y35t4tCB95eTPDH8AegMTUnYw7rZm7BtUT7k48CputF9IJ6BXNJl4O7rWYVs
         GmYw==
X-Forwarded-Encrypted: i=1; AJvYcCWvfq7rSwKK8LeiDcT8y5pCgBN9JMIqk0VxE0m700Kv1SV8OFk0Sb/8QKAjf8XIQqeOFOf09gxUJ/KIMbs=@vger.kernel.org
X-Gm-Message-State: AOJu0YxXwyxtGRqbj5NwuOqiy1428u1EMs0xUitgvWbeBhiG4fw3wump
	Y77XQFw1PXaRoAg/fiTLLxvk+lOw8X1dhty5Kb68QLItM/SM/SaSv1zzsU3ewD3ylePSz+PUeB+
	pRHAwetgRcTPk86QNnZJqbSQv0ImSIEoLsc0jNOGagc9+hJyFtsSkac4=
X-Google-Smtp-Source: AGHT+IF7DJ2NzSfVkrdjsOZO3G1uAps/3BIEHQP77pCq+DcF1yaZ6jYdc/l+/2JmYgNrMsrkgcIl6UsXPJNj5ujFtW+EBSIWW2Kq
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a92:cda7:0:b0:3d4:6e2f:b493 with SMTP id
 e9e14a558f8ab-3d6e3f19ebfmr17080835ab.11.1743731042233; Thu, 03 Apr 2025
 18:44:02 -0700 (PDT)
Date: Thu, 03 Apr 2025 18:44:02 -0700
In-Reply-To: <20250404011510.3744-1-hdanton@sina.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <67ef3962.050a0220.9040b.02b9.GAE@google.com>
Subject: Re: [syzbot] [bluetooth?] possible deadlock in l2cap_conn_del
From: syzbot <syzbot+b71bb48c13bf3fed3692@syzkaller.appspotmail.com>
To: dan.carpenter@linaro.org, hdanton@sina.com, 
	linux-bluetooth@vger.kernel.org, linux-kernel@vger.kernel.org, 
	luiz.dentz@gmail.com, syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

Hello,

syzbot has tested the proposed patch but the reproducer is still triggering an issue:
unregister_netdevice: waiting for DEV to become free

unregister_netdevice: waiting for batadv0 to become free. Usage count = 3


Tested on:

commit:         06a22366 Merge tag 'v6.15rc-part2-ksmbd-server-fixes' ..
git tree:       upstream
console output: https://syzkaller.appspot.com/x/log.txt?x=110c194c580000
kernel config:  https://syzkaller.appspot.com/x/.config?x=2f0adb9bdfa87dbd
dashboard link: https://syzkaller.appspot.com/bug?extid=b71bb48c13bf3fed3692
compiler:       Debian clang version 15.0.6, GNU ld (GNU Binutils for Debian) 2.40
patch:          https://syzkaller.appspot.com/x/patch.diff?x=172e023f980000


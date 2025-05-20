Received: from mail-io1-f70.google.com (mail-io1-f70.google.com [209.85.166.70])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D2CCA2AF11
	for <linux-kernel@vger.kernel.org>; Tue, 20 May 2025 13:30:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.70
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747747859; cv=none; b=DaSTqZdREPsnKSyA0+qVXAeDdwT6e/mmS+tIq2lMwP19PV2pUoYb7QsminOgZhwCZPeLy3nnY6pcbJOswKTOxCtq3wJDLFGpRu89XVLPWEe5j11r29eFjB6RAuygjjauA66AfsxTFICEMmgGTUVWU8O6BZtHtLCb0CcVZzIGzOw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747747859; c=relaxed/simple;
	bh=W0YLvYOCbvovLYSsNp/KOavwpsF+cvSD398Eesud/ew=;
	h=MIME-Version:Date:In-Reply-To:Message-ID:Subject:From:To:
	 Content-Type; b=P/lJtySB3TIbFCApZC5V/NWEGzJ4gb6ULPkF/QqBzVY8PLtPyS5iYtw9/yOkDh7KFaSWVzq5kr0B6H47Ee45RyymktrnfzmKTryIBWF6scFwXUZccdWgxV+Qvq3pq5EJI0L6Ya4etYpKl9qJXBYspJ38GpRFEkYjYPBki65fI8U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.166.70
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-io1-f70.google.com with SMTP id ca18e2360f4ac-85b53875729so1009485639f.2
        for <linux-kernel@vger.kernel.org>; Tue, 20 May 2025 06:30:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747747857; x=1748352657;
        h=to:from:subject:message-id:in-reply-to:date:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=W0YLvYOCbvovLYSsNp/KOavwpsF+cvSD398Eesud/ew=;
        b=I71qHMhhrLU8juICceKGTdcKULJipSQIZHcx9C/tqMA8iuThetJrku0/kH8dQIKNBB
         bfzL9m2rSylJ+fnWl8Tr+AA67+kaBVR7fqvRDbN1Wv6btaM+iSbtBsK7SDYJjtktIryK
         9kwU1++1autZC+JDJa4Sc645gPvwUvdUISNelzI7n5SbaZ7WYVYExlAc+2BegfbTZieG
         A6eVUt9KAAP0THvi7v61sn48RSxk+vxfReMj36pmC6WIo7DrEQ96A1EbdFjyFLKJF1op
         +fLbNxnjifi/hBEJfJmlH2YgPV6PuK7ssSvChO0F0v2dM//PflJLpOd9g0E3syilA4Zf
         iKAw==
X-Gm-Message-State: AOJu0YyBGUOAbWueas86t8AxgT2wPKRknHJ7alLnt0pkQ4otJFqJSjwx
	DhTMpc9tr8Ak37HNXWUcrzowStWDoWH/8YZhkF2OXFuPmn0KKeKAECoTq5zw2+vAGpLD20Uc97S
	n7jIe2h35jMxu5K3QuyBktUH1QBq59DIsssHNPksC/FtWn36IQkuOjhTIE8I=
X-Google-Smtp-Source: AGHT+IEAp0zGlWcdgrGDR2tOr/ebL3nUIQ7w3oKrIzwKyVryzBYSPB31ol1+iisBNRIXPs8XnImoz4fSl3Dg+s3YHtYHkTJdb+GZ
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6602:3a81:b0:867:3889:45e2 with SMTP id
 ca18e2360f4ac-86a2322a6cfmr2008743939f.10.1747747856952; Tue, 20 May 2025
 06:30:56 -0700 (PDT)
Date: Tue, 20 May 2025 06:30:56 -0700
In-Reply-To: <68241bb2.a70a0220.3e9d8.0005.GAE@google.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <682c8410.050a0220.ade60.09bc.GAE@google.com>
Subject: Re: [syzbot] #syz test https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git
 a5806cd506af5a7c19bcd596e4708b5c464bfd21
From: syzbot <syzbot+feb0dc579bbe30a13190@syzkaller.appspotmail.com>
To: linux-kernel@vger.kernel.org, syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

For archival purposes, forwarding an incoming command email to
linux-kernel@vger.kernel.org, syzkaller-bugs@googlegroups.com.

***

Subject: #syz test https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git a5806cd506af5a7c19bcd596e4708b5c464bfd21
Author: dmantipov@yandex.ru

#syz test https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git a5806cd506af5a7c19bcd596e4708b5c464bfd21

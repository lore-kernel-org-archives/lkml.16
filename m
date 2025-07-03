Received: from mail-io1-f69.google.com (mail-io1-f69.google.com [209.85.166.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E34C828DB4A
	for <linux-kernel@vger.kernel.org>; Thu,  3 Jul 2025 09:11:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.69
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751533865; cv=none; b=nuZ6ffgem6/l+NjUV9UiDJBvDkdYf/LHZK/+CYDkJqukG3VHiV336V7bSs+AfJ7iXJ9S0hb1bOcCJfHCLEyaqFpYf2bUCEt4sgjbmXhsfYoAgAJI95hW5uMc1710RMBcrMSj+Jz2uc8dvju60aetMfDFpm/qAZ/xiSAJakVa+as=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751533865; c=relaxed/simple;
	bh=FSnWyhULt+8qNj/pQpL8m+1t/YkTEOioRkGgaHHVfg0=;
	h=MIME-Version:Date:In-Reply-To:Message-ID:Subject:From:To:
	 Content-Type; b=IMg5EVy9/WqWJbO49iwbsFLFneesajJTwTBYBkOLmf2Q2DkJAIjLrdrZJGvEK6afQ59q8F4utnmsYpmkL/ZP6ITi9ipIS7QOhlJfYBZaRxNnFCeFIX87MpJlBYkeLi1F3WdUkPUpdr6TYLffL9lz3lxm8fbjVzGA9szSFCTLs70=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.166.69
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-io1-f69.google.com with SMTP id ca18e2360f4ac-8760733a107so759851239f.3
        for <linux-kernel@vger.kernel.org>; Thu, 03 Jul 2025 02:11:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751533863; x=1752138663;
        h=to:from:subject:message-id:in-reply-to:date:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=2Efdj3HghN61h5La1iiYSMoZDZpnzZ9XZixUD39oRCo=;
        b=g9iKPkqJoCbZsj0PGlrK1D+IWMjgHRzC+DW5SJlpd4+nejhjn3H7tcRz1Jzc7cSMS9
         B6ywTnvv16QtD0pviqPA+j+cWGFcgAFMxpfs4Not33n93bGOMpN5/QdfAD9o1l4Hsw8m
         gcdnl9z9tajdtbUfNny5M8TSf3BWk4VJ+jYWk4Z2HkAhX/tY7wF0D75IrBsAKVp2F3pR
         f3aMnB422o5qNezdT0tBeWeiaEpgT3aM6CFeh5j1QpbIrILLF+UDrkENvmavkTqREy1Z
         a6XJzuuMaj+lVEFUeGk4aGvxhHzb8di+sfoZ9SJhe1wdsd+bmFfAmBfqty2rQqrgqxiI
         Myhw==
X-Gm-Message-State: AOJu0Yw6oYAUA2uZofBLDLO0ydWAEYNZAosOogqzUoFfJC8Wo+YrEr8F
	Irny99iczp3RBTPdmjB/mHuSBfFAKnW7jvUN/fubsTTW5+PGLg4GH0V4dZbo/pdkOC8w75GgUFE
	UwrzpCRDXK6bNZwMbqlnDCVVKxHWGFbI5g+XUDZMYqWO9is36TFz85x8Gozo=
X-Google-Smtp-Source: AGHT+IF8L7KgUVlLdyNNFNxlBocn7RDmxwdr7FO2JdGzh7WBFHDh+QNUEQFU3HaQrFjnW6MGnROiNYri9EEEsJ/ye+zDBYKvknvQ
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6602:1501:b0:86c:f0d9:553 with SMTP id
 ca18e2360f4ac-876d1e9d88emr398862439f.5.1751533863092; Thu, 03 Jul 2025
 02:11:03 -0700 (PDT)
Date: Thu, 03 Jul 2025 02:11:03 -0700
In-Reply-To: <20250703024751.1194841-1-lizhi.xu@windriver.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <68664927.a70a0220.5d25f.0862.GAE@google.com>
Subject: Re: [syzbot] [nfs?] [net?] possible deadlock in rpc_close_pipes
From: syzbot <syzbot+169de184e9defe7fe709@syzkaller.appspotmail.com>
To: linux-kernel@vger.kernel.org, lizhi.xu@windriver.com, 
	syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

Hello,

syzbot has tested the proposed patch and the reproducer did not trigger any issue:

Reported-by: syzbot+169de184e9defe7fe709@syzkaller.appspotmail.com
Tested-by: syzbot+169de184e9defe7fe709@syzkaller.appspotmail.com

Tested on:

commit:         50c8770a Add linux-next specific files for 20250702
git tree:       linux-next
console output: https://syzkaller.appspot.com/x/log.txt?x=16dff982580000
kernel config:  https://syzkaller.appspot.com/x/.config?x=76d012e863976d4c
dashboard link: https://syzkaller.appspot.com/bug?extid=169de184e9defe7fe709
compiler:       Debian clang version 20.1.7 (++20250616065708+6146a88f6049-1~exp1~20250616065826.132), Debian LLD 20.1.7
patch:          https://syzkaller.appspot.com/x/patch.diff?x=1336f982580000

Note: testing is done by a robot and is best-effort only.

Received: from mail-io1-f70.google.com (mail-io1-f70.google.com [209.85.166.70])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0581C23DE
	for <linux-kernel@vger.kernel.org>; Fri, 27 Jun 2025 03:11:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.70
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750993865; cv=none; b=KGCwsQlDHXi1aGX3XM3v9gdDDrXVSxLoWS70p/8gKry+kmHmYsBbDo6wBoNEDMtbNIsPl7QRE1BxlhucHu05xlUNREDRiJAYRptrakZ3sGO0wXCIIO4hpYat9qThZDGcttgX3uc8hfNMkf4BHBQAqTzQU9n8CCwLKdhnP6hC/hk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750993865; c=relaxed/simple;
	bh=sCt1kmFQFrRYMrSvrxn6+Q214kp6L+54pQydD62V1io=;
	h=MIME-Version:Date:In-Reply-To:Message-ID:Subject:From:To:
	 Content-Type; b=sianORrK2V9qFV5UH7uociICisxz+beDfutsb6OZrxulsW5ltPEJsyNSnDGcC9HGgPk+hDBXIZBRPX9iYuKpAGmS6vPdWGBFI04mbu0ZNfS6HJo9aifubfhSJPBneIR18xxFowy5O7z7yA6jdzgrc5qzT2X7WY2VmTKRqNKNARY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.166.70
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-io1-f70.google.com with SMTP id ca18e2360f4ac-8649be94fa1so284788639f.0
        for <linux-kernel@vger.kernel.org>; Thu, 26 Jun 2025 20:11:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750993863; x=1751598663;
        h=to:from:subject:message-id:in-reply-to:date:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ZYm1DerhX9+i4FSoIxNmNfd2oR0TQz90H/WFeOBLX4Q=;
        b=MHsz30nZ3FLLPK9LGw4gGm4LSUxoUJfU17/6N6VQVIhWlWwmUMNXTqwv6f+KlwL08Q
         7HVAc/FURd3FerAvLDcO/abnJVmkrThb+xgbrWTYjLcQQI+I9OtMhV8FAGq9I8nyRry/
         nSotFRlV3+ldUd2pyUTAoRIjsidb8OLFp6N0HQbriH77n22Uw2gmZn0vPlntjqUVPsTK
         7VXTTtV2VsUHBjZwYkQrQLHkUV7MgnQqebV62yW8dGs3FrDTGdp+uoh4UQMr3ben0QKU
         NxV7f0lyJGnj7TgFHJYhrjzZNJNkLI+mE2og7x1G0vxb5cR/OXuq4lmJVqbygZQohsOy
         jRNw==
X-Forwarded-Encrypted: i=1; AJvYcCXIcuTptKy6+5IS9ZzzgUeJPeTBXBN/mknKxiQk8stEyEvPaEEHIUqr2+KzqndpJC0FTF1iOW7RsG4eNUc=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw3oA01bl1blLiu+uaM+kCAZOs8fA1hC/PEnpQ2XndX3OF8RPcC
	gjGXjk3ST7zKK7cniqnu2F0cvNABnx4TXQa1quBnKbCZdvDB/QB36UxM7AV6tDFwy4dnrazH7Zy
	qZyWP/+qgGDb8c/xtxp2b9Lsea1Wnbu7V7YSuIjglfSQxWuX9/P2Oa13MstQ=
X-Google-Smtp-Source: AGHT+IHh1nFsPM8aTo14FoQAfaLjNnSiaNy26ysfY/Lg1H3kteqN/NUm0ZIOGP409Tnat6G2Zx9ycIpKJn8YGbAkTndU7YRiItYJ
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6e02:168f:b0:3d8:2085:a188 with SMTP id
 e9e14a558f8ab-3df4ab4ee37mr24558505ab.1.1750993863234; Thu, 26 Jun 2025
 20:11:03 -0700 (PDT)
Date: Thu, 26 Jun 2025 20:11:03 -0700
In-Reply-To: <850c0f71-ae74-4a06-bf40-fc44c6ceede7@linux.dev>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <685e0bc7.050a0220.d71a0.0006.GAE@google.com>
Subject: Re: [syzbot] [rdma?] WARNING in rxe_skb_tx_dtor
From: syzbot <syzbot+8425ccfb599521edb153@syzkaller.appspotmail.com>
To: jgg@ziepe.ca, leon@kernel.org, linux-kernel@vger.kernel.org, 
	linux-rdma@vger.kernel.org, syzkaller-bugs@googlegroups.com, 
	yanjun.zhu@linux.dev, zyjzyj2000@gmail.com
Content-Type: text/plain; charset="UTF-8"

Hello,

syzbot has tested the proposed patch and the reproducer did not trigger any issue:

Reported-by: syzbot+8425ccfb599521edb153@syzkaller.appspotmail.com
Tested-by: syzbot+8425ccfb599521edb153@syzkaller.appspotmail.com

Tested on:

commit:         f648fc0a Revert "RDMA/rxe: Let destroy qp succeed with..
git tree:       https://github.com/zhuyj/linux.git v6.16_fix_rxe_skb_tx_dtor
console output: https://syzkaller.appspot.com/x/log.txt?x=14372f0c580000
kernel config:  https://syzkaller.appspot.com/x/.config?x=79da270cec5ffd65
dashboard link: https://syzkaller.appspot.com/bug?extid=8425ccfb599521edb153
compiler:       Debian clang version 20.1.6 (++20250514063057+1e4d39e07757-1~exp1~20250514183223.118), Debian LLD 20.1.6

Note: no patches were applied.
Note: testing is done by a robot and is best-effort only.

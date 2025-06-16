Received: from mail-il1-f199.google.com (mail-il1-f199.google.com [209.85.166.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 08B0BBA53
	for <linux-kernel@vger.kernel.org>; Mon, 16 Jun 2025 17:42:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.199
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750095772; cv=none; b=P3qv3L++iZQlktHxd0zHvtL6tkUeiuqMJLa3j17P4TKFUqADhIGvxPLXznswtN7gBtJMhy9zes2T1KizSZegVK7APR2ag0yuEzknKtA9StDinln9BxCWTinRpjkvPRhzvLlv3D+ANKLZIbsDV25gkKSHrdKW4X6GIh+Tk9HkFZQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750095772; c=relaxed/simple;
	bh=vxpaOH/Gox36dSnCROY4WD3ZR+EVmjITyBrlZ7VmBTA=;
	h=MIME-Version:Date:In-Reply-To:Message-ID:Subject:From:To:
	 Content-Type; b=TlSrProJoAahMMEh/Dse6qataaQ6ZAy7tu68+ZVn5KjC/t4pPm+cMWH7IWZZ6Li/iPlhkkXAo9K0joxTIUN8vkuycJZP6erYduVuuKg451FsSQRN2xqvhyp5mmnmM0iVguXfn73U1aQxOgFJDiwnxBRlbFEsRBMDJoZOsmJ4qyU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.166.199
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-il1-f199.google.com with SMTP id e9e14a558f8ab-3ddd5311fd3so49217955ab.3
        for <linux-kernel@vger.kernel.org>; Mon, 16 Jun 2025 10:42:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750095770; x=1750700570;
        h=to:from:subject:message-id:in-reply-to:date:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=vxpaOH/Gox36dSnCROY4WD3ZR+EVmjITyBrlZ7VmBTA=;
        b=o0n4ZaVVkYnMl4chTDXCPL0NI/SUFuTppEAACun5Vq4+/+EADmzJi6sO7BHrgWOaM3
         lvipCpWY2+dXUzI5agudlRHn/bVJemWfNqvmZaU43FTlvBdueG2tJdrX1CL48Coz0yMv
         sAgcwF+Qw3X9vtmEZ4uMAT4BhqbClG2tgPKM3COAR+IXiaPM0XBwHDGuMz2NXR2PAX+h
         HXjUrt8Q40YMn9bQuLXE9wZ99Kx48SiyTJI5Aq/VP/ns2xy6vL+JcT60NxzwJ46kfgWj
         FVWWmtbemytBgKJ4yjK1e6XMh2uN8BgGjyDav/lfaFiQRXG4/qRPF3ePnT7d9J62EOaG
         4L6g==
X-Gm-Message-State: AOJu0YwOR1/X/f5ifx9w7U0Y65Ktm8ztKHoyV+8/o0PrB0R4vhYgbkLv
	zfPtKPzLT7sLeaDmsqUhnSQakAAG9grl4kBS6fyjU6bBRn2bNGJo/U2a6dQ/GcmM09djD6snK0b
	fMshUM8KauErrGrjz43XR1KqfqxkdD5FW8vBTwoBdUOEjgogvRffTbwYhDrA=
X-Google-Smtp-Source: AGHT+IEA2/jWHjUgXCeJcQuRTcZefeXc+khv9vSfJOPZg23X8Y5jz51aEbjN5DqBvquf5EIzbq8d+pFcYk7NvaFpfT12B4w2+rk7
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a92:cdaa:0:b0:3dd:b808:be59 with SMTP id
 e9e14a558f8ab-3de07cee48cmr128039315ab.21.1750095770148; Mon, 16 Jun 2025
 10:42:50 -0700 (PDT)
Date: Mon, 16 Jun 2025 10:42:50 -0700
In-Reply-To: <68432451.a00a0220.29ac89.0047.GAE@google.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <6850579a.050a0220.2608ac.0005.GAE@google.com>
Subject: Re: [syzbot] #syz test https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git
 44a5ab7a7958fbf190ae384b8ef252f23b840c1b
From: syzbot <syzbot+0d8afba53e8fb2633217@syzkaller.appspotmail.com>
To: linux-kernel@vger.kernel.org, syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

For archival purposes, forwarding an incoming command email to
linux-kernel@vger.kernel.org, syzkaller-bugs@googlegroups.com.

***

Subject: #syz test https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git 44a5ab7a7958fbf190ae384b8ef252f23b840c1b
Author: dmantipov@yandex.ru

#syz test https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git 44a5ab7a7958fbf190ae384b8ef252f23b840c1b

Received: from mail-io1-f69.google.com (mail-io1-f69.google.com [209.85.166.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3CD991B3937
	for <linux-kernel@vger.kernel.org>; Fri, 16 May 2025 15:15:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.69
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747408504; cv=none; b=lVxcGtoDEBk3x/2kyR2iNTbWKsUswQKTHC5hqCBgLo/PT2LrOQkA1YbyoEe/ISKJrf7/XBNT9aZKGuZO7scSVEHA9lRvWkRpAaNYRhzQJumj1Tj5pyHWDXf9PcY+EJNrcLIJko2VrTxf6OGeUWESSPSbCiKTnhNmjVT73OAJ54A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747408504; c=relaxed/simple;
	bh=UpLGJf3OPE9GMWL4sC0+OLHG97A+eSxXqSms1FpjmE0=;
	h=MIME-Version:Date:In-Reply-To:Message-ID:Subject:From:To:
	 Content-Type; b=pvYbRl15CMRawWbe4QbGt9fpdw3DxOH/yCQGlI4ClnZN8CF9Zxyy7dtNuUeC7cjwShGn+iNse2NBSRdM/Uoyrkmw1oDVdB4BxUg0kKN42p/nw3hwuA0NgiIEX9jZDH3ZQLJrwf0rd6C6MXOjXkjn21zXyaWh0L9S8VCKhAXxTog=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.166.69
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-io1-f69.google.com with SMTP id ca18e2360f4ac-85b3888569bso224352739f.1
        for <linux-kernel@vger.kernel.org>; Fri, 16 May 2025 08:15:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747408502; x=1748013302;
        h=to:from:subject:message-id:in-reply-to:date:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=I8TIblvZhOQhLL4Pxw/m1vqfucWk2yjMHnkRmJsUESM=;
        b=aQqDIm6kd9yu9H8J9ApiVZ2T+mJHdDmy1unOzt8mMF9fsgO+LnJNcQ4uYYOnnJuvrx
         nvV/i1jNs5/YPS6C5AvcXr717KxPbM/aseYvBcgFNet6P85ta9dK2+bDb+UVbVX60vfL
         17HuqFgpqA+VOvd0am0hYlOG9FcZuP9lrHfP/C308DFh/NcP5BQL+5P/JTPh8iMhuwGi
         rweUHSeQOWTwp/mSo7VC0HSHPP0l52Q8wBKVkrbQC1laqk2OjH5NN9HzOKMgS4RSI+Pu
         cjcxdnWsS0AuQkrGah+G3T6mx/eGxsmah66CRHZb6PJwc2vGEAG07Vk1ABvCfEQEJJ4A
         NoEQ==
X-Gm-Message-State: AOJu0YwhjfJQ5OUg1aGQJT+GpdoJRBoi9Ev/l9raNiANxcvNvc60c7Zk
	UXpd8FrxRTYzEnPZbdiORaYr0cWkrltE8m1642J7YtSWK5SZsw2iA54zy3jB0KH0eDPNnNYWsjh
	0v8Q6N7c58M6yp1nANbP8TmqMq86JCWcXBJrPoytIr0as7t1402BD623rxHk=
X-Google-Smtp-Source: AGHT+IFZU+ueiGIxzHGz/fVVUE2gTJfN1l3tQ7KHQFqKbI44lJYd4xfxrWIc5GNhh/5vfk63AHLp6je765g/hCPpV3NInduXEBrT
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6602:3899:b0:867:8d3:9864 with SMTP id
 ca18e2360f4ac-86a237cb6bfmr565547439f.4.1747408502244; Fri, 16 May 2025
 08:15:02 -0700 (PDT)
Date: Fri, 16 May 2025 08:15:02 -0700
In-Reply-To: <9d977b09-72b6-40bb-bfb6-c8884b2436e0@I-love.SAKURA.ne.jp>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <68275676.a00a0220.398d88.0213.GAE@google.com>
Subject: Re: [syzbot] [net?] possible deadlock in team_del_slave (3)
From: syzbot <syzbot+705c61d60b091ef42c04@syzkaller.appspotmail.com>
To: linux-kernel@vger.kernel.org, penguin-kernel@i-love.sakura.ne.jp, 
	syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

Hello,

syzbot has tested the proposed patch and the reproducer did not trigger any issue:

Reported-by: syzbot+705c61d60b091ef42c04@syzkaller.appspotmail.com
Tested-by: syzbot+705c61d60b091ef42c04@syzkaller.appspotmail.com

Tested on:

commit:         fee3e843 Merge tag 'bcachefs-2025-05-15' of git://evil..
git tree:       upstream
console output: https://syzkaller.appspot.com/x/log.txt?x=1493f6f4580000
kernel config:  https://syzkaller.appspot.com/x/.config?x=ea35e429f965296e
dashboard link: https://syzkaller.appspot.com/bug?extid=705c61d60b091ef42c04
compiler:       Debian clang version 20.1.2 (++20250402124445+58df0ef89dd6-1~exp1~20250402004600.97), Debian LLD 20.1.2
patch:          https://syzkaller.appspot.com/x/patch.diff?x=148676f4580000

Note: testing is done by a robot and is best-effort only.

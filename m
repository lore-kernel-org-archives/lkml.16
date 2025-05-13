Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF9601E885A
	for <linux-kernel@vger.kernel.org>; Tue, 13 May 2025 07:20:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.199
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747120817; cv=none; b=Tu1ZtBieNAGOkBbwkd3gAxS6FCoekZ7otibKISTKCEXrlfx+6Boqf+uEHqiwkoFRbwVnTOGlHfv0hNEh3o9/7ruxo5AaafdhOzFcLEyh8hMQ56cVSejSFjxDGyi3FDw6wRbw1EHnnD2/cRcz77BpaHZLxtl66fJSe9MQXljWORs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747120817; c=relaxed/simple;
	bh=z89cV37A1BzKVH5waNhFO0vTDICN0cpfkHVfKGEx1HM=;
	h=MIME-Version:Date:In-Reply-To:Message-ID:Subject:From:To:
	 Content-Type; b=D7//grbciWGSMrhwo6nvKc1iiSlF6kP57uDqxRmQKkPD+s15t+iEC54gEB2fR3yzJoEfncQtYTPxQTdE3ILDTvL5F0WUk8BfkQoPVRiQDR5E95+TMPhj/u3YNz83CEfPGa6Q4R/xhI8p9w6Rt8CrmnCVXBC3v3FW8Ryyoh7tpvY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.214.199
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-22fafbbe51fso75470185ad.0
        for <linux-kernel@vger.kernel.org>; Tue, 13 May 2025 00:20:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747120814; x=1747725614;
        h=to:from:subject:message-id:in-reply-to:date:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=MeRMeXbTDrvhPp+1BOYIczfNEGi+t+SLBi0QtIycPH8=;
        b=LGlgwCXGt0a5jQLjMuei/3G/8q5D+dCMnw7fWBa68SepQSSBLu8ztfecqffyX1TmP+
         cR/uk8rqgs5jZJGiW1xj61OV6doA0ExkT1F2rqj5oZhHBJFV0Mirm7lOrJpsdovI3nmB
         2LiGStfCVh4EofptfAZ6yvBv5lBTfCif/Vx81huKVClKZdojiAlhvoBmuGgf6eQAcg/b
         0JP8O8CUN2b+0sdL664e6cJCYt/ahro5MXC1Q4gCwDk3lJderVIgGPfFPOqdsGE5ir5R
         ZgVl5w6me6qYmU3pbeKA6FgkYLfIYfHJTnUtrbfbImdLikpQuOD56qH1aYFTUBb5tm3f
         ky4A==
X-Forwarded-Encrypted: i=1; AJvYcCURUG6h/FTh0zezeSyyXVHUIrWGkTPPLqeLzRnNl8KZyr6Zew5g0Fabds/MFL3NXPfw7Oc5VoZ8ShaOYiY=@vger.kernel.org
X-Gm-Message-State: AOJu0YyG49sP/98Oc0mtJZ378gBTKXWSv1OxN9l0XcAyflLyKxFLuBkq
	8xxkLGMemoQfNr2aIG3fPlHLHRUX8AcLL7KTy0zRZdDOYjJPOI3P5JWcRiIEMYBPFdV4uH1o7ek
	7+qsk172tkuDbG+WrU6VRaa45+RyLtsdeadyvZtN0MGZ88as/mz39T0E=
X-Google-Smtp-Source: AGHT+IHkvnZLGzM8GIvS9rpIvhqGG29wKFa6dseqNcftKL44TEPKgL2MlP8nj1Ok1QbFjPtxMGKC9Y40GMBfMMynzFPAV6dx7ANM
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6e02:1fc6:b0:3d8:1b25:cc2 with SMTP id
 e9e14a558f8ab-3da7e1e34b0mr191437605ab.8.1747120803765; Tue, 13 May 2025
 00:20:03 -0700 (PDT)
Date: Tue, 13 May 2025 00:20:03 -0700
In-Reply-To: <tencent_B0F292D9064049B26EFC6ECACC8227E4C606@qq.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <6822f2a3.050a0220.f2294.0120.GAE@google.com>
Subject: Re: [syzbot] [usb?] INFO: task hung in dvb_usb_i2c_exit
From: syzbot <syzbot+0dcc341ee61fc9e4032f@syzkaller.appspotmail.com>
To: eadavis@qq.com, linux-kernel@vger.kernel.org, 
	syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

Hello,

syzbot tried to test the proposed patch but the build/boot failed:

drivers/media/usb/dvb-usb/cxusb.c:1668:13: error: invalid storage class for function 'cxusb_disconnect'
drivers/media/usb/dvb-usb/cxusb.c:2389:27: error: initializer element is not constant
drivers/media/usb/dvb-usb/cxusb.c:2393:19: error: invalid storage class for function 'cxusb_driver_init'
./include/linux/compiler.h:286:52: error: initializer element is not constant
drivers/media/usb/dvb-usb/cxusb.c:2393:19: error: invalid storage class for function 'cxusb_driver_exit'
drivers/media/usb/dvb-usb/cxusb.c:2393:19: error: initializer element is not constant
drivers/media/usb/dvb-usb/cxusb.c:2400:1: error: expected declaration or statement at end of input


Tested on:

commit:         e9565e23 Merge tag 'sched_ext-for-6.15-rc6-fixes' of g..
git tree:       upstream
kernel config:  https://syzkaller.appspot.com/x/.config?x=ca17f2d2ba38f7a0
dashboard link: https://syzkaller.appspot.com/bug?extid=0dcc341ee61fc9e4032f
compiler:       gcc (Debian 12.2.0-14) 12.2.0, GNU ld (GNU Binutils for Debian) 2.40
patch:          https://syzkaller.appspot.com/x/patch.diff?x=1509e2f4580000


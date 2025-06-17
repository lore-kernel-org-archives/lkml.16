Received: from mail-il1-f199.google.com (mail-il1-f199.google.com [209.85.166.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 491EE2DBF4B
	for <linux-kernel@vger.kernel.org>; Tue, 17 Jun 2025 10:11:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.199
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750155073; cv=none; b=kjToEpt1eXPcuK639Lv40vtd8RlLzB9FabFRfNUOxfVyw6DfnSDcPxtHFYzKdJaJZ9Cuge86/WGkmp0izIiuv0BLcQL8RGqZC66z3KpaqGT9vuaDbvjdrUj7hAvafoQN5ZqzPry7DxotTjYG3MxdLr9itZXGagSzLG184q1xj7Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750155073; c=relaxed/simple;
	bh=q89/whoFUSh/lpgn1D+A7Xy7nFLWAWNcFH75xlrf9Ec=;
	h=MIME-Version:Date:In-Reply-To:Message-ID:Subject:From:To:Cc:
	 Content-Type; b=UgJC8lstlUzeYDrXLICvebH8VgsS+cbAIQZlFjhVzRkNgjnrjPmcsounSwdBnqGFSnMJnlLil/fdrOXe5/NlMaaL/ENdegNYqVfv5xo59qqUoxYmdYNB5KJnJt5UXPY1Yiu7rtaAHKK0MvROdhj6Rbgvr23rnw3qo5BeUDX82HM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.166.199
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-il1-f199.google.com with SMTP id e9e14a558f8ab-3ddafe52d04so149771795ab.1
        for <linux-kernel@vger.kernel.org>; Tue, 17 Jun 2025 03:11:11 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750155071; x=1750759871;
        h=cc:to:from:subject:message-id:in-reply-to:date:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=bU8jxuypBIeCipDGMKJZV00Yh3TyA52Eh4b2Ss+Z56U=;
        b=vqDUo6EWUP+GftWSK92zyXjhjVysw65ksBrrlNe0qo1r5qBvevH2YS8i3gzD9zpWrb
         axAhWVgCWHlIScHTGqJ+Oc9Q65QEwGQHXI4JLkWaJmxXcA3qjxmvFl5FWCqxsXYLUoPE
         pBBGJ/WiM6E8W1UAw7q8mKo9Mc7FFKXjhF3O+6n+Kld67ole2Mn+0/WWPINsy/1p5Qxe
         j3Z6/T7Z1OoBEPg3cSdzi5kCEYteKlrwR0X9xX7iOEXwredU89wgEAaCt+TzgiCrVrCH
         krDVgjQJHNkdw8SQhbbtV1DJO2oFlsTEzDxWVxacJNvxm3iLiNpwxl/NxZYofzdLT35+
         F8aQ==
X-Forwarded-Encrypted: i=1; AJvYcCVhzqC6tUXJJKPKG6cp7acjDT78VZeI9bQnT8CSnkaBI0HYaP77SqU5mK8k1PxtcgKqIBgmYgG+fbx13Dw=@vger.kernel.org
X-Gm-Message-State: AOJu0YxeTeVz+E2HxYaBP6s2KnIUR+6/hgxC29Z0uofrkfBfHRcboCog
	KSoGOn7mRk23/xh0p1fXQOXQ6mEwqWjc0Z09TpAmUR55pe+cJyrfgtR0+M8nzQzeWCxQp/8PKVK
	sgduQejvvT+Z6wVhZTCHJsKev9nZSAThwPk9b+2N2XA7EcxBdfgyHJBtIraE=
X-Google-Smtp-Source: AGHT+IEcCVAuVhXLIiMMU25iSD04Qh+NI7iBsDqlJl72My7Y3XEKENaQPgfJwdK/fzx40DevEcMi0Zu5FU0pLhHXfc7HwwSSTdIY
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6e02:5e0a:b0:3de:1200:219f with SMTP id
 e9e14a558f8ab-3de12002a2fmr76370115ab.22.1750155071350; Tue, 17 Jun 2025
 03:11:11 -0700 (PDT)
Date: Tue, 17 Jun 2025 03:11:11 -0700
In-Reply-To: <67fa81579ed1e4bf289235863eb5728b243a58ba.camel@sipsolutions.net>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <68513f3f.050a0220.2608ac.0018.GAE@google.com>
Subject: Re: [syzbot] [wireless?] INFO: task hung in rfkill_global_led_trigger_worker
 (3)
From: syzbot <syzbot+50499e163bfa302dfe7b@syzkaller.appspotmail.com>
To: johannes@sipsolutions.net
Cc: davem@davemloft.net, edumazet@google.com, johannes@sipsolutions.net, 
	kuba@kernel.org, linux-kernel@vger.kernel.org, linux-wireless@vger.kernel.org, 
	netdev@vger.kernel.org, pabeni@redhat.com, syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

> On Fri, 2024-07-19 at 06:15 -0700, syzbot wrote:
>> 
>> dashboard link: https://syzkaller.appspot.com/bug?extid=50499e163bfa302dfe7b
>
> #syz dup: INFO: task hung in rfkill_unregister (3)
> #syz set label: nfc
>
> johannes

Command #2:
The specified label "label" is unknown.
Please use one of the supported labels.

The following labels are suported:
missing-backport, no-reminders, prio: {low, normal, high}, subsystems: {.. see below ..}
The list of subsystems: https://syzkaller.appspot.com/upstream/subsystems?all=true


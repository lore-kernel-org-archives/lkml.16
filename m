Received: from mail-il1-f199.google.com (mail-il1-f199.google.com [209.85.166.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2730134545
	for <linux-kernel@vger.kernel.org>; Wed, 30 Apr 2025 22:26:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.199
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746051966; cv=none; b=heFp4XOGhkUA7TEkDCv2cz5450eCrMvWU8KSBOFVzJs7Yi42RGEEL0aGKnbSAZJuXoeXDULI1oriTLAndR0PMAwCMzy85IjPusApn6aUkENBN6a6Hr4BhfSmYHa5f/+M4AmgKUJZxjuvriSIHrXVn/wCvFYqXakdxYCKJqjSyKI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746051966; c=relaxed/simple;
	bh=IfhiXlIIJ5GpNh+qHlYkYj5F42Ux7gnIgA8XzIgqmos=;
	h=MIME-Version:Date:In-Reply-To:Message-ID:Subject:From:To:
	 Content-Type; b=Y5Zcv/mXALu7PRqhecqX6+l/NYBGCCMg+omIO9FwiSq3JPWQGPyp+WzYvXfg6Ais2nfz6cTQZCML/tDCkzrOGghOz8OoxUd4DF6uRCSVOeyhrW3XkjTfBYVdmx7N/zT7AWQfjT87TKV8H4Au1ZKlnc9+hxAtNBNloEQ/J+dDgBo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.166.199
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-il1-f199.google.com with SMTP id e9e14a558f8ab-3d90ba11afcso4944935ab.0
        for <linux-kernel@vger.kernel.org>; Wed, 30 Apr 2025 15:26:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746051964; x=1746656764;
        h=to:from:subject:message-id:in-reply-to:date:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=O//HsoEYqnOi9gZqa+zVd+M7p5dt3lnMJTyaQ6oGy/U=;
        b=pD/fqLlTcNVNZh/HtTT32v03Mqkz6MSPMrj7fjXN4dzDDfBnVBuY55Ee3WV6a+9gsD
         rP8Xx98KLKu6JLnAT3kECGExGRNANb+oANquPdjk+dpOugmb7pOc5PA3ZuZ+5i7Gp9kk
         DZaBdv53sCcNJPkdA0aSKz7bRK8/N0EQ6vHNtUgjcXyVTDABE8MJ/239ipoWMbMQx+jr
         JHU5M9uM1Ag9O+dT8Q/94xnlY72e2DCF4lKnz3mDdWC4at+qsV2aSygxBFShlMD+qs1/
         QBV2m6vJ/MWclGkTK7WB90X4S/pvnpEVTRbstv6/Bb8m6iiYD7+LRFf6ngG3QBciRxNz
         pw/g==
X-Forwarded-Encrypted: i=1; AJvYcCX1R6YvIOdmb5+giF95gx+YAi7IxHuW7LOmBiQTetd8u7KK1Tm8q3NywNoBnDTKRtOA9mAF6n9N5jUUISk=@vger.kernel.org
X-Gm-Message-State: AOJu0YyyCYu0PHqCZIjDqh9/J2DjGrRXCnQ/MsuulVJgDmIfOoiT5c5r
	QppeI8n5It2twpLTaviX27voWkpKwZRvjoCx8rMMMIJkHHUSvHF7LMwMykNZCC+n8eXVrMqi+U4
	jIi0bmHfNwqXha15ghtnC2MkXVZYZxUzFSnZQeukKFJ1nw3SBmM+SH7Y=
X-Google-Smtp-Source: AGHT+IE7HnxzczIysrs7ORVMk/CyNb8ONVV8GX6K8JL0LVHOAbKFN8w4G6Kz4WfLXV4QThJEcRkkGWDvMmCKS1j8z6xah9buVNGW
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6e02:190e:b0:3d1:97dc:2f93 with SMTP id
 e9e14a558f8ab-3d9703b263fmr3615575ab.20.1746051964284; Wed, 30 Apr 2025
 15:26:04 -0700 (PDT)
Date: Wed, 30 Apr 2025 15:26:04 -0700
In-Reply-To: <20250501.014805.2174568059164798902.konishi.ryusuke@gmail.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <6812a37c.050a0220.3a872c.000b.GAE@google.com>
Subject: Re: [syzbot] [nilfs?] possible deadlock in nilfs_get_block
From: syzbot <syzbot+f30591e72bfc24d4715b@syzkaller.appspotmail.com>
To: konishi.ryusuke@gmail.com, linux-kernel@vger.kernel.org, 
	syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

Hello,

syzbot has tested the proposed patch and the reproducer did not trigger any issue:

Reported-by: syzbot+f30591e72bfc24d4715b@syzkaller.appspotmail.com
Tested-by: syzbot+f30591e72bfc24d4715b@syzkaller.appspotmail.com

Tested on:

commit:         7a13c14e Merge tag 'for-6.15-rc4-tag' of git://git.ker..
git tree:       upstream
console output: https://syzkaller.appspot.com/x/log.txt?x=1073502f980000
kernel config:  https://syzkaller.appspot.com/x/.config?x=dab654a85b8f48fe
dashboard link: https://syzkaller.appspot.com/bug?extid=f30591e72bfc24d4715b
compiler:       Debian clang version 20.1.2 (++20250402124445+58df0ef89dd6-1~exp1~20250402004600.97), Debian LLD 20.1.2
patch:          https://syzkaller.appspot.com/x/patch.diff?x=1652af74580000

Note: testing is done by a robot and is best-effort only.

Received: from mail-il1-f199.google.com (mail-il1-f199.google.com [209.85.166.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 14BDF1D5CDD
	for <linux-kernel@vger.kernel.org>; Tue,  6 May 2025 14:16:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.199
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746540964; cv=none; b=ioS8BkiYTeJA/CK6kPhkCW0Qy2bCx17HZChKyY119PGvTqJHpfX81VoOEgInGonIROqefUQ67E9bagQZLz9bLJSE98VA6H83ni/vL5xE0CwuY8G35sgqnmOhRAqpK95WPakSEz7w2S7C+32Hjy3ex3vz/drprAHFCj6eiaJt3tc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746540964; c=relaxed/simple;
	bh=2NUzb6dt0+Kf7NwI/puJC/XRcNAJiBt8qXgSVnuGB/E=;
	h=MIME-Version:Date:In-Reply-To:Message-ID:Subject:From:To:
	 Content-Type; b=AX/HquS5DwLyxEcSFFKKem6IMcVi3DtpOTT1lWpLg3+Gw3EbH4WFpg6Nig+t8kx/ARLWl87t4x3/rlDeJwvE0RMjgBumaFAjti7tb/uggHNSEf6/eOE4jhm8UIh9zZCPszrzovBWvQDzR8l35ItBQRDpsqJWqbCh6qVCRpcCpa4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.166.199
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-il1-f199.google.com with SMTP id e9e14a558f8ab-3d6e10f8747so52072895ab.3
        for <linux-kernel@vger.kernel.org>; Tue, 06 May 2025 07:16:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746540962; x=1747145762;
        h=to:from:subject:message-id:in-reply-to:date:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=hky2IywNLv7i8r2D+MKLfNzUkY8ve0/we1ZU1qY+4c8=;
        b=f0m4jQLLuayqsVNwgnCm722HA/7mpYUW9t0cDnrecXFKCUnsr+UdkQk3JtiDl4HceH
         vv45mVXksYXlSJd7OA0UmQySbf7JLaYcNgNYsc6g+VU90Plybs6JKcx5IvvnX2pjaNr+
         OhqGJUht3p3k9oFMb/8RGvPOvAhswNUviiPDXggEmGAmKXyvEJDMDLLZJBlTV9uC1Ze1
         xt/9KhyV7RR6RNqlmuJIQKkgSrL2YMJQIMpP6bkoDo+Jm+ds0+qvW6+sx0XaGt4WTXyn
         C0Iko+9f0/glv8SvBOq1X18e7FmIBXnZJhALG59y+oiaI1E2vpmMIr/nvKuPfVXoNn5p
         zMSQ==
X-Forwarded-Encrypted: i=1; AJvYcCW/xRPbcfhzZr9CPKI8QDDcDed1TZELEtF8eMgosM3gFtcAzG6btEtb3SSMS1kXdmprbItdp/lZuM4uvxw=@vger.kernel.org
X-Gm-Message-State: AOJu0YyrGSgiGLLSl7SNKkXYpKRcWmK5piz55aUVYTUAtEMGthkFtq2m
	RJXpbt7t8NjoRP2893zlDaieS16iflHUsI0a+IcwVLRwG/OVkvzhyAk9EGm8j1un/Q+q7ztQj2Q
	H5KkkHrfbSCyW4oKaXdWU17uVOgakL7U02h5KZq/DNYm19Ff5KxP5ESk=
X-Google-Smtp-Source: AGHT+IF6VEiLTffvSV4+UmNe55akkMHZrRrtLt6kf4mg+shDSrfH2d9sol0FCJzULP1LO8N6Jj5fMT2e9UuUDZ21nlC2XGzt+sPX
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6e02:3a01:b0:3d3:fbf9:194b with SMTP id
 e9e14a558f8ab-3da5b1331damr98586735ab.0.1746540962125; Tue, 06 May 2025
 07:16:02 -0700 (PDT)
Date: Tue, 06 May 2025 07:16:02 -0700
In-Reply-To: <4a21d4ea-e726-4e0a-a3b9-42c65430b6ad@yandex.ru>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <681a19a2.050a0220.a19a9.000e.GAE@google.com>
Subject: Re: [syzbot] [bluetooth?] [usb?] general protection fault in lookup_or_create_module_kobject
From: syzbot <syzbot+7fb8a372e1f6add936dd@syzkaller.appspotmail.com>
To: dmantipov@yandex.ru, linux-kernel@vger.kernel.org, 
	syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

Hello,

syzbot has tested the proposed patch and the reproducer did not trigger any issue:

Reported-by: syzbot+7fb8a372e1f6add936dd@syzkaller.appspotmail.com
Tested-by: syzbot+7fb8a372e1f6add936dd@syzkaller.appspotmail.com

Tested on:

commit:         01f95500 Merge tag 'uml-for-linux-6.15-rc6' of git://g..
git tree:       https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git
console output: https://syzkaller.appspot.com/x/log.txt?x=1635c8f4580000
kernel config:  https://syzkaller.appspot.com/x/.config?x=91c351a0f6229e67
dashboard link: https://syzkaller.appspot.com/bug?extid=7fb8a372e1f6add936dd
compiler:       Debian clang version 20.1.2 (++20250402124445+58df0ef89dd6-1~exp1~20250402004600.97), Debian LLD 20.1.2
patch:          https://syzkaller.appspot.com/x/patch.diff?x=1777c1cc580000

Note: testing is done by a robot and is best-effort only.

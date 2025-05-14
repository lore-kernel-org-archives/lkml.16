Received: from mail-il1-f200.google.com (mail-il1-f200.google.com [209.85.166.200])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 82E071DE3CA
	for <linux-kernel@vger.kernel.org>; Wed, 14 May 2025 18:13:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.200
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747246390; cv=none; b=JCWqUAYIqLclItOUp+XiU9syaOWsdhKCdr+hFtOEmccsEC3RtVVHH8duRSHqux1nZIDyg91Fm3QZRwq84DU/5i/nogsb8q3qLez69GpsKSPDvNKTcKJ7gC23TegbbjldV8uZpOkGPsEKGYp+vv8k9Pl7i5hfmTAs85UjoxgMyH4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747246390; c=relaxed/simple;
	bh=dgcGY0n7AGbPNs8raw5es+rISDV20LNw9fg4lNhJ+u0=;
	h=MIME-Version:Date:In-Reply-To:Message-ID:Subject:From:To:
	 Content-Type; b=g6ZGrwb1x2TTbbHazxBkgv8EtIkDYUJ5e+VHhW0BWsbaLNhOrHK9EjE39sO8vuzvfAEp2i136grtpMzvbUR6Hw1PLQx37ZaCcWf1BeWt0SFoJJizRABYYoU5FyIAVcHwNxT441IKyUJG6+IxONi28ZXz3SIC9x/BRzd2t2NeofY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.166.200
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-il1-f200.google.com with SMTP id e9e14a558f8ab-3da741bcf90so909355ab.1
        for <linux-kernel@vger.kernel.org>; Wed, 14 May 2025 11:13:09 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747246388; x=1747851188;
        h=to:from:subject:message-id:in-reply-to:date:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=UpqvsPH3r8Qt61VZkW9wvmDGOmauoC7zd8i7QeBr8aA=;
        b=NU9h2qHCWZvlZBWXa70QZpEf/o/EWJPrm/MITBurv7UiLaFIAqzpOqDmaWDzWgWurk
         TB3bsZQoSwovogAORjoBJBF+RBTBbIBPftiVlXcIyznESCnkZrKceJKkBlu7lGy33sk9
         Qs+B0pFtsp6pBmnUlCKEWvnkAN1NdEwhluyFUHRFRVKm3c5LLl5E9Utg4yM6510ZxeXt
         SBR9Jg4t8RPCV45ZbSmES+BErTjgTKEr/CXDrqZzvnhO2V19xogwpnTLPTAYj1V5zMUV
         5cd/WSNytfSEcvP5tigJASYYsvUVBgMOuNOD3HWgjOSiYcZj2FokLl96FJndAbjBXzBO
         OKRg==
X-Forwarded-Encrypted: i=1; AJvYcCUVuqW7x41eKL/CLdyO1S5TUTRbtrn3TooJC1OWJfp2qDHsmjt7012odCE04iAdchMVBCfCOZp5PoakDoM=@vger.kernel.org
X-Gm-Message-State: AOJu0YxecTn6Qsghmt/EDTD65D7T5vHWAkrvcJIDcJCEaTvBmaWw/hER
	mpJ/ic8+YOnH8h4NjqzuP9StZojskkFYYv2FTOIfGguquilBDuyMZADRxRx1I9Pq6z5TzkWeVcS
	+lpC6x0ZD7pEEAFLPyJx30xGSxXQysJICwiWfHDFC3+o9Sc8n+z2CoIE=
X-Google-Smtp-Source: AGHT+IF8WqWJm382Apupy6220IhksEs5T0AYLujAMicasvj3LnuzCjw08FBNmwXuEMOYK/+uAVYNTjQ72t3jPgzTArcbEef2UDHq
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6e02:1d97:b0:3da:7176:81bf with SMTP id
 e9e14a558f8ab-3db6f802380mr54368075ab.21.1747246388573; Wed, 14 May 2025
 11:13:08 -0700 (PDT)
Date: Wed, 14 May 2025 11:13:08 -0700
In-Reply-To: <20250514180521.GN2023217@ZenIV>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <6824dd34.a00a0220.104b28.0013.GAE@google.com>
Subject: Re: [syzbot] [xfs?] general protection fault in do_move_mount (3)
From: syzbot <syzbot+799d4cf78a7476483ba2@syzkaller.appspotmail.com>
To: brauner@kernel.org, cem@kernel.org, jack@suse.cz, 
	linux-fsdevel@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-xfs@vger.kernel.org, syzkaller-bugs@googlegroups.com, 
	viro@zeniv.linux.org.uk
Content-Type: text/plain; charset="UTF-8"

Hello,

syzbot tried to test the proposed patch but the build/boot failed:

failed to checkout kernel repo git://git.kernel.org//pub/scm/linux/kernel/git/viro/vfs.git/fixes: failed to run ["git" "fetch" "--force" "8a6d8037a5deb2a9d5184f299f9adb60b0c0ae04" "fixes"]: exit status 128
fatal: remote error: access denied or repository not exported: //pub/scm/linux/kernel/git/viro/vfs.git



Tested on:

commit:         [unknown 
git tree:       git://git.kernel.org//pub/scm/linux/kernel/git/viro/vfs.git fixes
kernel config:  https://syzkaller.appspot.com/x/.config?x=b9683d529ec1b880
dashboard link: https://syzkaller.appspot.com/bug?extid=799d4cf78a7476483ba2
compiler:       

Note: no patches were applied.

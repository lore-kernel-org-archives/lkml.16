Received: from mail-il1-f198.google.com (mail-il1-f198.google.com [209.85.166.198])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F286625CC74
	for <linux-kernel@vger.kernel.org>; Mon, 30 Jun 2025 23:45:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.198
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751327105; cv=none; b=mPoa5ssHKmPzpry6uBKBhHapIDg5xDV4lNxuYYIT1oIeNiO0pWl8dsan7yQBnRpUN3Azd5uZS7oRIx2xUV2Izzo3NJmmN5AW3YNp5//sNWrFCCQJEddFCDzNX/48WLap72NXri6Q47O4mNKPyOhYXMGMx2L9PjVmycVkOiiUppA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751327105; c=relaxed/simple;
	bh=ta3OveW5vIr5JuwmqvFOouYb/ZzL/pObjorwQd7Bct0=;
	h=MIME-Version:Date:In-Reply-To:Message-ID:Subject:From:To:
	 Content-Type; b=O4vPge5x8VEl2B77Mqhsst7plkXEZDUz6vFFkv4Pwp7ByIJoBQrWzFEH5rsNDk1opojQk89sFqrLswb8wl5AdchuZkpb4aApGN1VBTJHxXRwa+faT+MhDl88pVLk41IVNzkL0GUdF9ysnIOozxLpzWaciwYskfEoPD9HmIeoJv0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.166.198
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-il1-f198.google.com with SMTP id e9e14a558f8ab-3ddc5137992so29494605ab.2
        for <linux-kernel@vger.kernel.org>; Mon, 30 Jun 2025 16:45:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751327103; x=1751931903;
        h=to:from:subject:message-id:in-reply-to:date:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=8ztG+Qg6Q6GK8Ex93lkPogPDE+G1bKolWmqpqidQOR4=;
        b=ELJivzvxAu0blDWdnpJfxQJH+6N8znEXKibMs0kNQaFVhGwTpy/rAgMdbPaABh5Y1y
         ODIL8gA6e12A3ZZQOT42U1pIFjp6XVLM39XHO0T255aGZjXkaErPgzbAukfprI6zTLtT
         c5CbPvys6Ju0EJgwQ3er21chLi+Zd4ZTxOp3tP6f/gJRE/rDjfVWXsdeudqFma55RBrz
         UPO7YfgRrixb5E4I8Vcl2haFfpYgeS3j5xs2NC3mp/3aYNmUzApj+ghY38Q3rJd+4mI2
         CfBpNcMsHZvW9+kAUFeBDeFQtLHXCBLJjHzhL6HAquK10PZZW9SZJBWSKL4DaP8YnOG4
         nHZg==
X-Forwarded-Encrypted: i=1; AJvYcCXmnlpqkZiV9tInndC7mx2B2pkTCH39dDp4y25PqSFbWbgqxk+647yf7x3MGki+q99II/6wXSJ+400F9vw=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz8jvkef1wcRcK6a8tSrj3vNCOJaXmK0aCw1uvzBxAVXrWmrVDK
	6ZIbXuHMM7GbkRK+tmi082URpItZpKt/GVTbDZH/abBs7SJJuABmQ97AxGKfiGHoZ620ObgW974
	iIYC2fsqRLrBErQIICyX4XX7+RknfHFMZ3vUjK5HLB+Z/Ac1ck+Lh198bqdE=
X-Google-Smtp-Source: AGHT+IHMTvHzvEwxX1+wzpwqQFf7Sqd5ufbFa3zcS8NI0Xbtg/l37/LhDU10crpE7q2s7m1HJBLRSMueTxCLjTGHmBZrErf/fVcb
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6e02:b49:b0:3df:3a07:a208 with SMTP id
 e9e14a558f8ab-3df4ab2b877mr189022435ab.4.1751327103230; Mon, 30 Jun 2025
 16:45:03 -0700 (PDT)
Date: Mon, 30 Jun 2025 16:45:03 -0700
In-Reply-To: <e4eb2024-f891-4548-ac08-4f224877c902n@googlegroups.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <6863217f.a70a0220.3b7e22.138e.GAE@google.com>
Subject: Re: [syzbot] [ntfs3?] WARNING in ni_rename
From: syzbot <syzbot+b0373017f711c06ada64@syzkaller.appspotmail.com>
To: kapoorarnav43@gmail.com, linux-kernel@vger.kernel.org, 
	syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

Hello,

syzbot tried to test the proposed patch but the build/boot failed:

failed to apply patch:
checking file fs/ntfs3/frecord.c
patch: **** unexpected end of file in patch



Tested on:

commit:         1343433e Add linux-next specific files for 20250630
git tree:       linux-next
kernel config:  https://syzkaller.appspot.com/x/.config?x=a3d8d413c6928dae
dashboard link: https://syzkaller.appspot.com/bug?extid=b0373017f711c06ada64
compiler:       
patch:          https://syzkaller.appspot.com/x/patch.diff?x=174b448c580000


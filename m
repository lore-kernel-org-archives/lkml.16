Received: from mail-pg1-f174.google.com (mail-pg1-f174.google.com [209.85.215.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 057295FB95
	for <linux-kernel@vger.kernel.org>; Tue, 22 Apr 2025 14:43:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745333011; cv=none; b=L85nmUE5/dHsUdYmmEC8ky+k0vicUSBye7E7kApdszOjFUz9BV/cM6k0wT++u9lw+KM1MaxsorU0gRLFJbovNtqfSwB1gus7cUerWidcb1g3ExfYfKagTgr+55eqj7YW5Gi7Dc4XBwDbqxQrNs3zhx6qIVkX+fY5WvyStrsvaL8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745333011; c=relaxed/simple;
	bh=LJ81ySCYhjh27+riOuL7JsTqHpiQvvFaxk4COY0scGc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=NQG5JU95QbGStFhBqIibddRvLKlj5apHbG7NnGTT7pKUfrCQaNja2Dvpo0KcZGh3FmcYRv/BD0ZKo1lE8cCXY+uC68aLVx+lgAqfpG4ZZtgIxe4KTprN22CFv2jbW+2TtKtNGc+8iECs25i3ytxdjIq+5a4eQrPY7mWF4+cz12o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=DrBbjy/B; arc=none smtp.client-ip=209.85.215.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="DrBbjy/B"
Received: by mail-pg1-f174.google.com with SMTP id 41be03b00d2f7-af590aea813so5849653a12.0
        for <linux-kernel@vger.kernel.org>; Tue, 22 Apr 2025 07:43:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1745333009; x=1745937809; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=6eckKDMmSuKFTzro6yB1ZcThs4CchkkZ6Dh7/jmsEGc=;
        b=DrBbjy/BSPlJJr/GfhMad5hH/NT/Sg4n8KjmJSvlXTAZLEZ86Zfq1Va96OMyBRtmEf
         hbkUvfMhCj8Ufv1M87yZxLi8ABJVPusq6CmociDWV2Dkbe2LgFAGD5f+ix92hlCXpNRs
         FlzPLChHm7SFA9x+upgh1rdIrpnWs/06DHoROBFE8tqOX1edrU1p7Cb5YqheyCEXqsGE
         YtOTmhrnRP+pnHm0K5A9xL8hvlbM0GYfK3a+jcNleCvz09hMYVkcp76Z7ch2ux+ehymq
         8sF/AjxbefKyPt5s3nDiqLSMJ/TUPP7A+rb5KC2Wfq2W2cmpOv/SMXz9VmEjo4GEsfWb
         QAeg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745333009; x=1745937809;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=6eckKDMmSuKFTzro6yB1ZcThs4CchkkZ6Dh7/jmsEGc=;
        b=eydYsJbVYmLiAJwPK1Qi+J8mBccWA+uNc0BXwKZdnU803Ne6jHVFkc9I/C2OvFgg5h
         fxvXvu1zDRRcHWza9fvtINWrebdfp/x6LFYBDl7xCZ8KPCJx6kZwkaG0sc97oWN5pfID
         hOZZxYG8mKbCbFW9hQranVHbUlmMMvo1itaU+hqqIFTG+Fq7MgxRdLgV65s6+lAKTQqD
         oPxsj8W+Qks8rv9QmUCUeV+mH2YAmuE5KNswurwnF7TngEJssD3vpvjZOTs1d637GjpQ
         LbobTJgM7nbcRYhCRFF0fE/iyXiCQnKGDdR5ImbBCQXi1gNs76J9HxmBccKh/dXTjRSg
         9IOA==
X-Forwarded-Encrypted: i=1; AJvYcCWv3NgkaKMTURkSOpXvFzmQVnuER+wJlAooKR7leg7HuX8iI1/3BoKpqFv2do1IZ6BwzvKYUwT8PKl0trU=@vger.kernel.org
X-Gm-Message-State: AOJu0YxbwC5X1VYqTvAhM00aTNs6QoqvCF3xM8AxGEJ+mfD72ey0yrs0
	KWl9szEL5qMES9X1Elxb4GgMkXGGqddQxnqRv0SO+nTCXvrAFNrmFkqPxkCwzebrIWsk8OAcdTY
	gAGfZLk5F2s7tM+HZk9Epg7y0Jx6YBuslKZEt
X-Gm-Gg: ASbGncuoMChg4W0eVoP7fnsU5OvHYSStsdNW2IsoOklQc0AkAZkNg6bVoZUf4S6K7WM
	gjnSUmV399TYopjtJOSCidMUAn04CnVBfSLt6rgbsEryw53xeEQ9PMUYho6NXSDrM6fVjR82INY
	0FIz6cbEocgE8H2yLuzKntjEi+sDc3bOG+bE6id3X6nqGbZgxch3sSInnoz994Lpg=
X-Google-Smtp-Source: AGHT+IEMBJHGqdBdhaSKOmXeGG1tXBALAWr21yAGW4a9jZMoK/NIGLNrkodjNR5e/EOkzdm1rmdlcQ4lveOWH29CAO4=
X-Received: by 2002:a17:902:db02:b0:21f:58fd:d215 with SMTP id
 d9443c01a7336-22c50cfaa36mr210689785ad.11.1745333009069; Tue, 22 Apr 2025
 07:43:29 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <6807876f.050a0220.8500a.000f.GAE@google.com> <20250422-flogen-firmieren-105a92fbd796@brauner>
In-Reply-To: <20250422-flogen-firmieren-105a92fbd796@brauner>
From: Marco Elver <elver@google.com>
Date: Tue, 22 Apr 2025 16:42:52 +0200
X-Gm-Features: ATxdqUFIFyu6PcnxydXd-sfMerWWJ7SU96EUcuRo5wELlKkcu-wX78VIJvj3cZU
Message-ID: <CANpmjNPbVDaw8hzYRRe2_uZ45Dkc-rwqg9oUhoiMo2zg6D0XKw@mail.gmail.com>
Subject: Re: [syzbot] [fs?] KCSAN: data-race in choose_mountpoint_rcu / umount_tree
To: Christian Brauner <brauner@kernel.org>
Cc: syzbot <syzbot+81fdaf0f522d5c5e41fb@syzkaller.appspotmail.com>, jack@suse.cz, 
	linux-fsdevel@vger.kernel.org, linux-kernel@vger.kernel.org, 
	syzkaller-bugs@googlegroups.com, viro@zeniv.linux.org.uk
Content-Type: text/plain; charset="UTF-8"

On Tue, 22 Apr 2025 at 15:43, 'Christian Brauner' via syzkaller-bugs
<syzkaller-bugs@googlegroups.com> wrote:
>
> On Tue, Apr 22, 2025 at 05:11:27AM -0700, syzbot wrote:
> > Hello,
> >
> > syzbot found the following issue on:
> >
> > HEAD commit:    a33b5a08cbbd Merge tag 'sched_ext-for-6.15-rc3-fixes' of g..
> > git tree:       upstream
> > console output: https://syzkaller.appspot.com/x/log.txt?x=1058f26f980000
> > kernel config:  https://syzkaller.appspot.com/x/.config?x=85dd0f8b81b9d41f
> > dashboard link: https://syzkaller.appspot.com/bug?extid=81fdaf0f522d5c5e41fb
> > compiler:       Debian clang version 15.0.6, Debian LLD 15.0.6
> >
> > Unfortunately, I don't have any reproducer for this issue yet.
> >
> > Downloadable assets:
> > disk image: https://storage.googleapis.com/syzbot-assets/718e6f7bde0a/disk-a33b5a08.raw.xz
> > vmlinux: https://storage.googleapis.com/syzbot-assets/20f5e402fb15/vmlinux-a33b5a08.xz
> > kernel image: https://storage.googleapis.com/syzbot-assets/2dd06e277fc7/bzImage-a33b5a08.xz
> >
> > IMPORTANT: if you fix the issue, please add the following tag to the commit:
> > Reported-by: syzbot+81fdaf0f522d5c5e41fb@syzkaller.appspotmail.com
> >
> > ==================================================================
> > BUG: KCSAN: data-race in choose_mountpoint_rcu / umount_tree
>
> Benign, as this would be detected by the changed sequence count of
> @mount_lock. I hope we won't end up with endless reports about:w
> anything that we protect with a seqlock. That'll be very annoying.

Seqlocks are generally supported, but have caused headaches in the
past, esp. if the reader-side seqlock critical section does not follow
the typical do-seqbegin-while-retry pattern, or the critical section
is too large. If I read this right, the

  struct dentry *mountpoint = m->mnt_mountpoint;

is before the seqlock-reader beginning with "*seqp =
read_seqcount_begin(&mountpoint->d_seq);" ?

In fact, a lot of the special seqlock rules for KCSAN were conceived
due to irregular seqlock patterns in fs/ - I wouldn't be surprised
there still is the odd false positive here or there. There have also
been recent improvements to KCSAN's seqlock handling, but 6.15-rc*
should have those fixes already.

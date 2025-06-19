Received: from mail-il1-f197.google.com (mail-il1-f197.google.com [209.85.166.197])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA7F32459DD
	for <linux-kernel@vger.kernel.org>; Thu, 19 Jun 2025 12:21:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.197
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750335664; cv=none; b=NHnqV5nL2+uarDZxMCpLrdOWgdQpRF/j6Ve4DRXUroGwuYDDoz+W+eVb2rm6d9/CdWFVi1ovJwXWyYdWTyVETjX2TGb5NHDqD8te3Y6wQ4e0OqwDj3ExtV8DPiFpRwquHxm2XMmpAM7dQ78UXRjBeL9jMnk0dRZ/wm77GnPkltY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750335664; c=relaxed/simple;
	bh=eiCTPLQ8Eoe4o5v3kDdar/nTl718WdwpOtQgUTgyU/E=;
	h=MIME-Version:Date:In-Reply-To:Message-ID:Subject:From:To:
	 Content-Type; b=Ef3eT1z7zg0oHQV8wYj+qY/En9sEjHyHg5VHeLIvsFg0SwuQchXjK5PNSctOiBq1YG71oFb0xge4llVkj7YYtTiNq3EUY4NVBnzQQrtVJVjz5ilMmZ4EUUurQ+hu9bSZl5cyHTkvmY8DYA7ubJubBTIVKx59Xel8vlhSH5m6O6E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.166.197
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-il1-f197.google.com with SMTP id e9e14a558f8ab-3ddc5137992so8033775ab.2
        for <linux-kernel@vger.kernel.org>; Thu, 19 Jun 2025 05:21:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750335662; x=1750940462;
        h=to:from:subject:message-id:in-reply-to:date:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=OpO0LFL24L4S8EF9wKFiyJXm5Ur6T78b7l7xpEpr2pg=;
        b=M6PpRMRrKj8AJ+sh/EwlWlHk9cpjiHOrz3WUWtwFExsaFv/yALQus5YZSYYj9UE6wQ
         Sc1hBL3krsuwS/KsSQMAY28QBjjG0iRqrmlL+v2aUOayEY5lPDMnr2P6ZpQYKR0WfBqe
         RJ4OEA/SrhOEMsEhm+xfZXGQo3rAsPDvp09zd1sqJ0OH7aibTrPqNwmElLroOHBIaJ8+
         goDT3OHBobx/SGpuSg/MyZgvjqxbRjeQrt+gogCm4Phk8XGSJnSQ/kR7TtkQFgcfEhi+
         1kPjMuGge+ibom32u/BYSn6ZkySCwUaj3k8vplDkR5OA27HaowW1gTfusJVaBk6bXmLs
         wUUA==
X-Forwarded-Encrypted: i=1; AJvYcCVUamb06fkXHeS/MwH6nXQCcxz0Z9w/Lnv9F/bocBmfGtB4GVbgAH+4Ke//5Ja7G7YpVT+6UvM+w9LmA4I=@vger.kernel.org
X-Gm-Message-State: AOJu0YwRbFPsAakU2pJ7axU9wFayh7XtFPeWpF/LlHC5cS7pCNzDNQEA
	FbIPoQO9YyKArTCrH0aLQGGImwS/6c89xF0VnCS4qCulTfSCrt5TBkmxbKnYV+HSU0GA0C9Oz1s
	loQdtZvoitsNZ0+n0kVf/irrypsWQUPvJG7WpNOexzxLpJbMCkzVOWH6hxxI=
X-Google-Smtp-Source: AGHT+IFw9G2E9X+wQxp8B3w6mBU+QSrALBtNMVET7/VtS1GSeEWzws8fsoKTbyRUGKwkS4yZRlE0pKomkY13YLlMkwbfQ/1h44gX
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6e02:1c09:b0:3db:86fc:d328 with SMTP id
 e9e14a558f8ab-3de07c3ef41mr250426945ab.5.1750335662082; Thu, 19 Jun 2025
 05:21:02 -0700 (PDT)
Date: Thu, 19 Jun 2025 05:21:02 -0700
In-Reply-To: <CAGR7w83zZMTvdNiL_iPVP-qF0epKDi3QAyKWgQqOgg1gHwEY5Q@mail.gmail.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <685400ae.a00a0220.137b3.000b.GAE@google.com>
Subject: Re: [syzbot] [bcachefs?] KMSAN: uninit-value in __bch2_alloc_v4_to_text
From: syzbot <syzbot+8eb51728519f6659ef7b@syzkaller.appspotmail.com>
To: abhinav.ogl@gmail.com, linux-kernel@vger.kernel.org, 
	syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

Hello,

syzbot tried to test the proposed patch but the build/boot failed:

failed to checkout kernel repo git://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/master: failed to run ["git" "fetch" "--force" "f569e972c8e9057ee9c286220c83a480ebf30cc5" "master"]: exit status 128
fatal: unable to connect to git.kernel.org:
git.kernel.org[0: 172.105.4.254]: errno=Connection refused
git.kernel.org[1: 2600:3c04:e001:324:0:1991:8:25]: errno=Network is unreachable




Tested on:

commit:         [unknown 
git tree:       upstream
kernel config:  https://syzkaller.appspot.com/x/.config?x=db26f33438d76de9
dashboard link: https://syzkaller.appspot.com/bug?extid=8eb51728519f6659ef7b
compiler:       
patch:          https://syzkaller.appspot.com/x/patch.diff?x=15a8ed0c580000


Received: from mail-io1-f72.google.com (mail-io1-f72.google.com [209.85.166.72])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A1321E7C27
	for <linux-kernel@vger.kernel.org>; Wed, 30 Apr 2025 10:38:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.72
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746009488; cv=none; b=nP275t4QfvKFJ/fCmLJsnCfv6tfh6QwFAAzK5oNTqn7o4tcR69Loo3s1c88/f+xmnm8KMbtdgilqaZqAEhvwF8UX5QUMvztx+N9OsCBoX9I17jejZfO56+zGACoPmxjz71dIXI4X8idXextXb9wlA0er5JlE1455Z5MxmtzHRlo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746009488; c=relaxed/simple;
	bh=SDgGLFycsnobAE0TAlFw8htn9YGH0/tT58fJ5btXRb4=;
	h=MIME-Version:Date:In-Reply-To:Message-ID:Subject:From:To:
	 Content-Type; b=toywtHPaV+QxoOKqT1XukpP6gh7mELrXCB+Ut9gRYpg/cPSLZI+ERFtYhRLPq3/R0jAi2SXhZhZbiZefOetA71frqN+SenVSpkvx9IVTHBFRcBtrarNNVitxn5utK4ekOqSTOeODn3oTA1vofa45l2PM4da5Ap/HUDd/Nig5FxM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.166.72
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-io1-f72.google.com with SMTP id ca18e2360f4ac-85b5e46a526so716267039f.1
        for <linux-kernel@vger.kernel.org>; Wed, 30 Apr 2025 03:38:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746009486; x=1746614286;
        h=to:from:subject:message-id:in-reply-to:date:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=zXN82wcI/IbCtTFLNoxHu+KyZbBxiqezwrjpxJTKZks=;
        b=cpW3ju5g1yWEJ+R+QQMbqT0lnvUQFvN7l8onkTleKQAWKES4FNvsAzxnEMbOqsOCge
         j2A/ClR0PGxJ078QhT+FnH//RA93g6aRJMCaRUHOCcVZnepCU0OF1YK07+BqjN2H7Ca9
         56U6S5sLb/557PevY9Hi2BZsB2p6Z6n7ngNf8AtxQ+pmDqNfU7OXMNbn3f9k1O+GOeDh
         Z1QfRbLDiKlS3dBlBzPtFy07DeGl7hV41xzy9DUJD5w5K1ETvw0eoPgQeLYAngvgd28G
         ku0GI5j5a0hLdZw06CNozFMMVcusNMAo+nJVP0tjaSz3MgFISgMePv2kprtIOlr27ui0
         tz8w==
X-Forwarded-Encrypted: i=1; AJvYcCUjY9UZCjgw6e4inwNKv0g4F7qYgLXhgMohjTyJyDDsh18rTPbeBo8zvvQ/Rsb+idsEMwj1CNUVhasxNqk=@vger.kernel.org
X-Gm-Message-State: AOJu0YxxEKDUbzjMSayp4TPMW+YceKaAfbW4dXq8k9AfrZt2Dpp7vQWW
	sRsMyxwvtob71mbTv9lyQdtJqQdgDZjWauGfj+hqUDEtX2jTbn3dLh5TEfSncMqqB8+DZk8miae
	R6AYgAodc302+xCRdY+pKc58SrKdlfyV0ScjZapRVQEq2Co9yjPD6zDM=
X-Google-Smtp-Source: AGHT+IFhpytsmVF/KwUgWFCLf+SiYl6EPhWzgg7n4M0CKLvrJN6q1ASyMrNdevDN2uUhNPTkalK6C6X8KS1qQh8b6S8K3aM7d7A+
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6602:3a0c:b0:864:4911:f463 with SMTP id
 ca18e2360f4ac-8649806122fmr160611539f.10.1746009486478; Wed, 30 Apr 2025
 03:38:06 -0700 (PDT)
Date: Wed, 30 Apr 2025 03:38:06 -0700
In-Reply-To: <20250430100150.279751-1-shivankg@amd.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <6811fd8e.050a0220.16fb2c.000c.GAE@google.com>
Subject: Re: [syzbot] [mm?] WARNING in move_to_new_folio
From: syzbot <syzbot+8bb6fd945af4e0ad9299@syzkaller.appspotmail.com>
To: akpm@linux-foundation.org, apopple@nvidia.com, david@redhat.com, 
	donettom@linux.ibm.com, jane.chu@oracle.com, 
	jfs-discussion@lists.sourceforge.net, linux-kernel@vger.kernel.org, 
	linux-mm@kvack.org, shaggy@kernel.org, shivankg@amd.com, 
	syzkaller-bugs@googlegroups.com, wangkefeng.wang@huawei.com, 
	willy@infradead.org, ziy@nvidia.com
Content-Type: text/plain; charset="UTF-8"

Hello,

syzbot has tested the proposed patch and the reproducer did not trigger any issue:

Reported-by: syzbot+8bb6fd945af4e0ad9299@syzkaller.appspotmail.com
Tested-by: syzbot+8bb6fd945af4e0ad9299@syzkaller.appspotmail.com

Tested on:

commit:         69a58d52 Revert "x86/mm: Add 'mm' argument to unuse_te..
git tree:       https://github.com/shivankgarg98/linux.git
console output: https://syzkaller.appspot.com/x/log.txt?x=137a68d4580000
kernel config:  https://syzkaller.appspot.com/x/.config?x=f002bbe3fe2ccafa
dashboard link: https://syzkaller.appspot.com/bug?extid=8bb6fd945af4e0ad9299
compiler:       Debian clang version 20.1.2 (++20250402124445+58df0ef89dd6-1~exp1~20250402004600.97), Debian LLD 20.1.2

Note: no patches were applied.
Note: testing is done by a robot and is best-effort only.

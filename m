Received: from mail-io1-f72.google.com (mail-io1-f72.google.com [209.85.166.72])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6267A3FBA7
	for <linux-kernel@vger.kernel.org>; Fri, 25 Apr 2025 01:19:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.72
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745543985; cv=none; b=XzBSpwulk4332gaHikMa2k0qqHPs4BXUCPri0LSKe+DPw04ev26k6/2waLzeW+lPbLRQgLxV60z7nf+nQ5PmE+ngyJ76PagGJLf9zUrQ+jaL7+OIpw/cK3rHQu6UH3ntaFUbaeMv+u2KsA0SM3aJi2z9Ui+xwexHmu6ohN/gPrY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745543985; c=relaxed/simple;
	bh=tZa4PC+4XVBeg0hOZXvb94j0GbfYiUOtNu48NwfWU6w=;
	h=MIME-Version:Date:In-Reply-To:Message-ID:Subject:From:To:
	 Content-Type; b=jS9ntGfpQ2qPnYvRQils0sNHD/YdTxMMKRTq4jHAtBlziGe9wr52fKwrDLZjfUymSfE9PFYvDVkxQx6aP21urKuqgAXRq+ST1vqOkStbUPMFaZEjOZ4rYmLiAu47EfKvtEMOwNVs/ECnjmnHx2ZITdE+gMQa2gte/UjkRwKXBMc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.166.72
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-io1-f72.google.com with SMTP id ca18e2360f4ac-86176e300fdso184736339f.1
        for <linux-kernel@vger.kernel.org>; Thu, 24 Apr 2025 18:19:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745543983; x=1746148783;
        h=to:from:subject:message-id:in-reply-to:date:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=eZ+fJp4cpSsOSZIf8u5iCXo8he11YqWesXespw4qaX4=;
        b=OPqFdr+3hkhDc7OMOVRJ2llyCsvgDW4E/qaRVz9YubVlx+t7S0McawHeohYkyWeCf3
         Hlz3WmyQ5FVVkiUSe4guMjt/mnfOE6CUht4Od3VkytsVXDPFS6wRluxkm5RXvu8do3wD
         SDzEFo8SNAL+gghXV4ybIek3Dr07uvm/jjpW33HdLuRJIXiuClAh1IW2vEqL+UmtBc7z
         nYcFPJwcdbR4COrBIE4M79i+oKHilEI0/mNxwYrw9s/ne1/PMb31bQUmhopRFafsAbtN
         n7MRx6qSq1ugLLtgaflYj71sA6GUnyrEJWhlRthZbiLGiNvLiVg7kNc52+lhAqNziNzG
         Scsg==
X-Gm-Message-State: AOJu0YytQ0Exj5Yf8g24AEK1SRjahq9JcLrTIa3RBAMFQPjIq256FQgv
	A9c6x4Vamz/63YdJQRi1PDDGr67WS+3BrWbDe6i+h5ep7vo7Rn/+FjyhzpHVXnKbsjqv+d4YDfH
	aSb79oWdEf56Y183fmkGACYZI1kj0TncJ8bKTK6670G1P61pAZeqwP8g=
X-Google-Smtp-Source: AGHT+IFwpqOiL8RBVTkSFTe8tRRKPp5Fc8A7I1FEnZVGy69fVhdGh3Q95kKHlkx9hVH60EMydHDGFnEvUxX98e1Oso0NI4cqbzcC
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6602:2cc4:b0:864:4a9b:f1f1 with SMTP id
 ca18e2360f4ac-8645cfacf61mr57267539f.14.1745543983651; Thu, 24 Apr 2025
 18:19:43 -0700 (PDT)
Date: Thu, 24 Apr 2025 18:19:43 -0700
In-Reply-To: <680a45db.050a0220.10d98e.000a.GAE@google.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <680ae32f.050a0220.317436.0051.GAE@google.com>
Subject: Re: [syzbot] Re: [syzbot] [block?] BUG: unable to handle kernel NULL
 pointer dereference in lo_rw_aio
From: syzbot <syzbot+6af973a3b8dfd2faefdc@syzkaller.appspotmail.com>
To: linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

For archival purposes, forwarding an incoming command email to
linux-kernel@vger.kernel.org.

***

Subject: Re: [syzbot] [block?] BUG: unable to handle kernel NULL pointer dereference in lo_rw_aio
Author: lizhi.xu@windriver.com

selinux policy not support read_iter

#syz test

diff --git a/security/selinux/selinuxfs.c b/security/selinux/selinuxfs.c
index 47480eb2189b..e71936c6d82d 100644
--- a/security/selinux/selinuxfs.c
+++ b/security/selinux/selinuxfs.c
@@ -484,6 +484,7 @@ static int sel_mmap_policy(struct file *filp, struct vm_area_struct *vma)
 static const struct file_operations sel_policy_ops = {
 	.open		= sel_open_policy,
 	.read		= sel_read_policy,
+	.read_iter      = generic_file_read_iter,
 	.mmap		= sel_mmap_policy,
 	.release	= sel_release_policy,
 	.llseek		= generic_file_llseek,

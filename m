Received: from mail-io1-f69.google.com (mail-io1-f69.google.com [209.85.166.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C98F19DF60
	for <linux-kernel@vger.kernel.org>; Sat, 24 May 2025 10:05:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.69
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748081137; cv=none; b=GJHXjPN/ysSk2kxYNaz7NtpfdDtpinJADnYnkUBnPvLXX8Nf+Md6oG3iiN/auFeiaavDWknDGXsim8qYftViv2xCeXXZx37jotomfmHOZSnK1Uo3f58OkSrsi9pUnwIHsEH+/1+F0XwIllgo6U9nip4wKlvgzL/sd+b5GAdJLXU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748081137; c=relaxed/simple;
	bh=5Dho/UhyNhw8Xndxbgw5Ks5g3QE7trd4nZhV1x2fZMk=;
	h=MIME-Version:Date:Message-ID:Subject:From:To:Content-Type; b=synx/VH43JPTfMHOISxZ2O/f9pCNj+ppraFHMPQ3y1IE07juvMPvO0GOWWRzTB3DKo7wqxaW8GS5rmf4ZOAMFS7qX1mpULCv6IqRS4YPLRcR2Ng6HTW/u1I6SfcYS8ChakilUc9ZnO0WATR9LY2dX5MaRXMfdUspVZNZr4ekSOA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.166.69
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-io1-f69.google.com with SMTP id ca18e2360f4ac-869e9667f58so152450539f.3
        for <linux-kernel@vger.kernel.org>; Sat, 24 May 2025 03:05:35 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748081134; x=1748685934;
        h=to:from:subject:message-id:date:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=RD2cV1CO1dNEpaup5SvqkbO53KQufDr6yCliucKyjDk=;
        b=NQBAlPjMLgTKJs+MZbfD5qsn8QaFgHdU3FVyFXvLV0/n6MMoyywkqczOPplNA8TV8g
         gwJvhmVzHztlt7oUgZAsY9JgpPp7H57cNexOajfSQFV9cYgMFuDeU4l08XSTC1JU+TJa
         seHONWIr6XWXJodmnu2YKLgPB1tj3YOOJ9vK2+Sjdg0ySBvSFSnIUORFADi/h4r6SfYJ
         IUaA/YptbANtDKiD+9+HyBWm9Kc9NpNiHOvGjQtGKNd+4PxJAFiJ23ebZnlLBafOX//p
         bN2FHsWY+IE7pOcU+dRaVFW/TjCFYN93kP9QcuGs/T5nkB785hOeS6S+LLntr5Ow1dLx
         a/3g==
X-Forwarded-Encrypted: i=1; AJvYcCVuCtEhNd12CV9VwiwsZJXcgxgPTaq+WTEHNeuI8TcIIxAzoRe5VHSdKIDiKFccu34LeoR8fqvbOTj2Ovo=@vger.kernel.org
X-Gm-Message-State: AOJu0YxPVcl8pyG3Wg0dkdIU8GPY5UxfoXM3War8NQc9shsGzTlSEDxA
	mQK2KFulM36h0kB/uY4S8dxl+a9GHi40pb+h7NUiNQgRxDScUWGRCTWVqsEyI/usSDOmHLbr+xt
	Bna/6lFcufPB/AhN6jELsCyEE76rPP+WYYZ59Ms5en3WmAL5zv0Y6XcOAmJ0=
X-Google-Smtp-Source: AGHT+IE56ITQSR7t/xGPzhiObRt51qFb/wjZMl6ZpVRw288eRFFCX2f6FHydabgtfUXFrTQ+cEWS57Coa/uo0cxRHL6dBlphRXMX
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6602:6a87:b0:864:4aa2:d796 with SMTP id
 ca18e2360f4ac-86cbb7fc708mr255484939f.8.1748081134606; Sat, 24 May 2025
 03:05:34 -0700 (PDT)
Date: Sat, 24 May 2025 03:05:34 -0700
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <683199ee.a70a0220.29d4a0.07fa.GAE@google.com>
Subject: [syzbot] Monthly hfs report (May 2025)
From: syzbot <syzbot+listdc2978c83beda70d5e82@syzkaller.appspotmail.com>
To: linux-fsdevel@vger.kernel.org, linux-kernel@vger.kernel.org, 
	syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

Hello hfs maintainers/developers,

This is a 31-day syzbot report for the hfs subsystem.
All related reports/information can be found at:
https://syzkaller.appspot.com/upstream/s/hfs

During the period, 1 new issues were detected and 0 were fixed.
In total, 45 issues are still open and 23 have already been fixed.

Some of the still happening issues:

Ref  Crashes Repro Title
<1>  82181   Yes   kernel BUG in hfs_write_inode
                   https://syzkaller.appspot.com/bug?extid=97e301b4b82ae803d21b
<2>  16625   Yes   kernel BUG in __hfsplus_setxattr
                   https://syzkaller.appspot.com/bug?extid=1107451c16b9eb9d29e6
<3>  13051   Yes   possible deadlock in hfsplus_get_block
                   https://syzkaller.appspot.com/bug?extid=b7ef7c0c8d8098686ae2
<4>  7316    Yes   KMSAN: uninit-value in hfsplus_cat_case_cmp_key
                   https://syzkaller.appspot.com/bug?extid=50d8672fea106e5387bb
<5>  4019    Yes   KMSAN: uninit-value in hfsplus_delete_cat
                   https://syzkaller.appspot.com/bug?extid=fdedff847a0e5e84c39f
<6>  3876    Yes   KMSAN: uninit-value in hfsplus_attr_bin_cmp_key
                   https://syzkaller.appspot.com/bug?extid=c6d8e1bffb0970780d5c
<7>  3686    Yes   possible deadlock in hfs_find_init (2)
                   https://syzkaller.appspot.com/bug?extid=e390d66dda462b51fde1
<8>  3653    Yes   KMSAN: uninit-value in hfs_find_set_zero_bits
                   https://syzkaller.appspot.com/bug?extid=773fa9d79b29bd8b6831
<9>  3080    Yes   KASAN: slab-out-of-bounds Read in hfsplus_uni2asc
                   https://syzkaller.appspot.com/bug?extid=076d963e115823c4b9be
<10> 2849    Yes   KMSAN: uninit-value in hfsplus_lookup
                   https://syzkaller.appspot.com/bug?extid=91db973302e7b18c7653

---
This report is generated by a bot. It may contain errors.
See https://goo.gl/tpsmEJ for more information about syzbot.
syzbot engineers can be reached at syzkaller@googlegroups.com.

To disable reminders for individual bugs, reply with the following command:
#syz set <Ref> no-reminders

To change bug's subsystems, reply with:
#syz set <Ref> subsystems: new-subsystem

You may send multiple commands in a single email message.

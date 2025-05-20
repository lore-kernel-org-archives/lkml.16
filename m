Received: from mail-io1-f79.google.com (mail-io1-f79.google.com [209.85.166.79])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E892B1E25EB
	for <linux-kernel@vger.kernel.org>; Tue, 20 May 2025 05:46:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.79
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747720008; cv=none; b=TSQu1i4f0cmu/n/n67yPb8pycy+dNfUPkGhiVxjdinJ+u/xYgK10OnExXwD4Lpm0KPvTgRfIo/jftyRRXY4wWKUJnUehKtTqUBPmicIeg60MnUPv0joFLXrCv1wjW2M3bXLogGtVo7Uqk/MVaFeYRltlWV4KEGWxxh2OaKzrfQ4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747720008; c=relaxed/simple;
	bh=PNoG/wTpGCsBMaQKcduz80Xs9yYBCEsC/9yl958TjZw=;
	h=MIME-Version:Date:In-Reply-To:Message-ID:Subject:From:To:Cc:
	 Content-Type; b=UleSHsWgksab9Sy+mrLEnfFAIKG8X/Zfq16v9gwHqtADFJzfzTnqwNdW28ClrutdBRhK/glvXjy8H39b+klICKCsH221dq9vBRw79lMl6WhvbmZx3ZaQ4RUzwVE6gCxZFQ7osKNN8IC/m9zaseRweef0aMkdCeP8paucMQ7hwQ8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.166.79
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-io1-f79.google.com with SMTP id ca18e2360f4ac-86186c58c41so449347639f.1
        for <linux-kernel@vger.kernel.org>; Mon, 19 May 2025 22:46:46 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747720006; x=1748324806;
        h=content-transfer-encoding:cc:to:from:subject:message-id:in-reply-to
         :date:mime-version:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PNoG/wTpGCsBMaQKcduz80Xs9yYBCEsC/9yl958TjZw=;
        b=JOsNnvzpyYd0uHhgcrwbB6xKqJCpnX8b5f/Lzjn6SvL8Nf2kGfqgqX8aWc7ICikj+H
         Vl66rRrwpn00plowP5M7MQWpfGtJVlL10vodMUKhSee+ydf3D6XrETU8+dwZTwBObio0
         xG0SXs6kMiNXhKBF8SOdeLO353kaDGK915qdTryxNxXLGipr1d76mJXiSVIf/LTihwfp
         1mp4D8V5PIggyo2x8hYNhlhfCAqINZ4s8yz2tVgek7+A51eFO2XzV0Aciieju8DJemYk
         EmYRnZi/g7x3P01uGdJQ6fphiP7FgStqxQlrLyXAaBXhcZZYtUGDQN7gHf5SEuKrugQ9
         OdVw==
X-Forwarded-Encrypted: i=1; AJvYcCVjgsphq4K8T81CMCJaJX5Xz14yVNcDR4UvslwV15h1+d4UgRkhbsQ65qcNGxx6UEWAhd6KHKBtiFQWkLc=@vger.kernel.org
X-Gm-Message-State: AOJu0YyroTNpepmecpMFKSiFAL61A+oGuuOKhWOK6yEhaSfkjXHl0A75
	bJru/WZJhLbfDTpuKd9pOfb/Dhdm0klo3zmkKZJJLUoE5wq5YDi7UT34wotOyzGfR2ZVnFJnOA6
	XlQ54El2XHRFoezMqio3eGW43fDCIrOQmnMhcOU8baVWOIvyb1jU2CC2CzWE=
X-Google-Smtp-Source: AGHT+IHwccDPA1cEqwcwfB8eC6CziO5xr+ZVahkvrfS91r0ruV2eplPGRD79WYA3JhaUPNg4S4ItsuFfW05fguSvlH7BFnK3ZtB+
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6602:274b:b0:85b:476e:ede2 with SMTP id
 ca18e2360f4ac-86a24cc8825mr2017333539f.13.1747720005901; Mon, 19 May 2025
 22:46:45 -0700 (PDT)
Date: Mon, 19 May 2025 22:46:45 -0700
In-Reply-To: <7d20b14c-5739-4556-9f6e-d19cc7e3ee9b@amd.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <682c1745.a00a0220.7a43a.0084.GAE@google.com>
Subject: Re: [syzbot] [mm?] WARNING in folio_large_mapcount
From: syzbot <syzbot+2b99589e33edbe9475ca@syzkaller.appspotmail.com>
To: shivankg@amd.com
Cc: akpm@linux-foundation.org, baolin.wang@linux.alibaba.com, david@redhat.com, 
	dev.jain@arm.com, liam.howlett@oracle.com, linux-kernel@vger.kernel.org, 
	linux-mm@kvack.org, lorenzo.stoakes@oracle.com, npache@redhat.com, 
	ryan.roberts@arm.com, shivankg@amd.com, syzkaller-bugs@googlegroups.com, 
	willy@infradead.org, ziy@nvidia.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

> On 5/19/2025 6:56 PM, David Hildenbrand wrote:
>> On 17.05.25 10:21, syzbot wrote:
>>> Hello,
>>>
>>> syzbot found the following issue on:
>>>
>>> HEAD commit:=C2=A0=C2=A0=C2=A0 627277ba7c23 Merge tag 'arm64_cbpf_mitig=
ation_2025_05_08' ..
>>> git tree:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 upstream
>>> console output: https://syzkaller.appspot.com/x/log.txt?x=3D1150f670580=
000
>>> kernel config:=C2=A0 https://syzkaller.appspot.com/x/.config?x=3D5929ac=
65be9baf3c
>>> dashboard link: https://syzkaller.appspot.com/bug?extid=3D2b99589e33edb=
e9475ca
>>> compiler:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 Debian clang version 20.1=
.2 (++20250402124445+58df0ef89dd6-1~exp1~20250402004600.97), Debian LLD 20.=
1.2
>>>
>>> Unfortunately, I don't have any reproducer for this issue yet.
>>>
>>> Downloadable assets:
>>> disk image: https://storage.googleapis.com/syzbot-assets/0a42ae72fe0e/d=
isk-627277ba.raw.xz
>>> vmlinux: https://storage.googleapis.com/syzbot-assets/0be88297bb66/vmli=
nux-627277ba.xz
>>> kernel image: https://storage.googleapis.com/syzbot-assets/31808a4b1210=
/bzImage-627277ba.xz
>>>
>>> IMPORTANT: if you fix the issue, please add the following tag to the co=
mmit:
>>> Reported-by: syzbot+2b99589e33edbe9475ca@syzkaller.appspotmail.com
>>>
>>> ------------[ cut here ]------------
>>> WARNING: CPU: 1 PID: 38 at ./include/linux/mm.h:1335 folio_large_mapcou=
nt+0xd0/0x110 include/linux/mm.h:1335
>>=20
>> This should be
>>=20
>> VM_WARN_ON_FOLIO(!folio_test_large(folio), folio);
>>=20
>>> Modules linked in:
>>> CPU: 1 UID: 0 PID: 38 Comm: khugepaged Not tainted 6.15.0-rc6-syzkaller=
-00025-g627277ba7c23 #0 PREEMPT(full)
>>> Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS=
 Google 05/07/2025
>>> RIP: 0010:folio_large_mapcount+0xd0/0x110 include/linux/mm.h:1335
>>> Code: 04 38 84 c0 75 29 8b 03 ff c0 5b 41 5e 41 5f e9 96 d2 2b 09 cc e8=
 d0 cb 99 ff 48 89 df 48 c7 c6 20 de 77 8b e8 a1 dc de ff 90 <0f> 0b 90 eb =
b6 89 d9 80 e1 07 80 c1 03 38 c1 7c cb 48 89 df e8 87
>>> RSP: 0018:ffffc90000af77e0 EFLAGS: 00010246
>>> RAX: e1fcb38c0ff8ce00 RBX: ffffea00014c8000 RCX: e1fcb38c0ff8ce00
>>> RDX: 0000000000000001 RSI: ffffffff8d9226df RDI: ffff88801e2fbc00
>>> RBP: ffffc90000af7b50 R08: ffff8880b8923e93 R09: 1ffff110171247d2
>>> R10: dffffc0000000000 R11: ffffed10171247d3 R12: 1ffffd4000299000
>>> R13: dffffc0000000000 R14: 0000000000000000 R15: dffffc0000000000
>>> FS:=C2=A0 0000000000000000(0000) GS:ffff8881261fb000(0000) knlGS:000000=
0000000000
>>> CS:=C2=A0 0010 DS: 0000 ES: 0000 CR0: 0000000080050033
>>> CR2: 00007ffe58f12dc0 CR3: 0000000030e04000 CR4: 00000000003526f0
>>> DR0: 0000000000000000 DR1: 0000000000000000 DR2: 0000000000000000
>>> DR3: 0000000000000000 DR6: 00000000fffe0ff0 DR7: 0000000000000400
>>> Call Trace:
>>> =C2=A0 <TASK>
>>> =C2=A0 folio_mapcount include/linux/mm.h:1369 [inline]
>>=20
>> And here we come through
>>=20
>> if (likely(!folio_test_large(folio))) {
>> =C2=A0=C2=A0=C2=A0=C2=A0...
>> }
>> return folio_large_mapcount(folio);
>>=20
>>=20
>> So the folio is split concurrently. And I think there is nothing stoppin=
g it from getting freed.
>>=20
>> We do a xas_for_each() under RCU. So yes, this is racy.
>>=20
>> In=C2=A0 collapse_file(), we re-validate everything.
>>=20
>> We could
>>=20
>> (A) Take proper pagecache locks
>>=20
>> (B) Try grabbing a temporary folio reference
>>=20
>> (C) Try snapshotting the folio
>>=20
>> Probably, in this code, (B) might be cleanest for now? Handling it just =
like other code in mm/filemap.c.
>>=20
>
> Hi,
>
> I've implemented your suggestion (B) using folio_try_get().
> Could you please review if my patch looks correct?
>
> Tested it using existing selftests: sudo make -C tools/testing/selftests/=
mm run_tests
>
> Other two instances of is_refcount_suitable() uses folio locking. Should =
we maintain
> consistency with those?
>
> Thanks,
> Shivank
>
> #syz test

This crash does not have a reproducer. I cannot test it.


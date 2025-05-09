Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9137C25D1E2
	for <linux-kernel@vger.kernel.org>; Fri,  9 May 2025 19:56:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746820581; cv=none; b=kOeMzuHVryKfHf0GGLuv13XHHSBpOR6ktLkBzA6MgG9+0bGD59tcqowQ7FIcs9/adkaVayfXV9z8x/3n6Uu52KXXUUuPM+FJCbmSLkXcom+vBMOAmHfkrZhLGYeUi15HAyRkZVwoFM3mE4M5xKqWImXNZREkdkp/numiNTCPfhA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746820581; c=relaxed/simple;
	bh=cyMjJqJFxpHJvRHZCJS6oIZRRQbK2lOv3fPfQO1GnDo=;
	h=From:Message-ID:Date:MIME-Version:Subject:To:References:
	 In-Reply-To:Content-Type; b=SXBsz8+ybZ2VCwpvpB9D6pw9Wbl1IUfngsapAPFYP76mxwtSEeVvMka/vLR+RYy1WOcS216TEQswQLc/6O7S5c3JNSMZudcRcBtpGBT7y+8VZEtf6mfoP8JvzgOOZ+zwtciKK7wc5WU3mX8B5h5PPOwAr8hny/MwTT4zgx/J0a8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=OwYzNcoV; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="OwYzNcoV"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1746820578;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=wcq6m7DForSHJL6LSulH9JvfbMjK/OXkEDKmD5DV3tw=;
	b=OwYzNcoVnSFUkQbO8GNa4xiUPnc0jKlGAgIXAcGW3bfcWq6BZR+zby3OpmOw25uEpr7qHa
	A9hnCltPOLVJRcWdwf0ClFhMlcPWgWv0HJiAlop+b/6J5z3sf5+A4Z03hzCKb7RY+ioerU
	98kvnE6Bb6s4T2rdngv2LJVoPsD6fmc=
Received: from mail-vs1-f69.google.com (mail-vs1-f69.google.com
 [209.85.217.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-672-che5r0g5Mn6Zthl2F9HylA-1; Fri, 09 May 2025 15:56:17 -0400
X-MC-Unique: che5r0g5Mn6Zthl2F9HylA-1
X-Mimecast-MFC-AGG-ID: che5r0g5Mn6Zthl2F9HylA_1746820577
Received: by mail-vs1-f69.google.com with SMTP id ada2fe7eead31-4c31917ec85so2553418137.0
        for <linux-kernel@vger.kernel.org>; Fri, 09 May 2025 12:56:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746820574; x=1747425374;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :to:subject:user-agent:mime-version:date:message-id:from
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=wcq6m7DForSHJL6LSulH9JvfbMjK/OXkEDKmD5DV3tw=;
        b=IB8//iznWlkrXO+yv5xm9yKJgYEBwmb46SBkHjJ4mqjKt2LaLbF2rurT4/hcD7J3Co
         BqaaHzk7Gdgq2RWsKrkYqkxdvA5hp36Pvkc908G5FFSV0VmFQIYFAOvDU1ZHyPQcbrNw
         3mWesQrULS7tQWU1p+WAyskait3tu5FhGB1o9RdLCF/V8zmXvwago3/vcOMTkwoWpNv7
         sYmErpARj/RiadtFRzXYXZz3e0ty6cUdsDFKqIiHDsqkK+sFSszef0yoVz5/mVhNt1jk
         u3f3rYt6i1AiI58Aq1iXThTJa8b1tAJt7soXxmuefI7WnOK579BBUgPHeiUaOOtVmlTu
         9xJA==
X-Forwarded-Encrypted: i=1; AJvYcCXMspw7iEepcR/HcFdVA2Kp/FMc7OOIOn9iOV1KZdcDWYd+ho4DGSRH+rqtAPAzi+48TfMLIrLv+KEQO1A=@vger.kernel.org
X-Gm-Message-State: AOJu0YwGO/2LoBG31NahX/S4x1SEDREye/2bm8UJhDDN5koVRXMwLf7y
	RocNnl/7XEq6ow7VlRove+2OcWFOMZ8RIqn23oM6BQqhAbzVF8QtBdQeb3gyOeA7OuLKa6Cdnc5
	Evzp25pWkmyuxteyt4x6Uo96vP1to+Ub+REiNLhsrMml1dlRbCowg5BsXFd5mZt+jn65qOcMQ
X-Gm-Gg: ASbGnctBrxWim058ymZFmGE4F/qUdPq7O1zN5lAykjNerW16749LGrX7XA3J7M394n0
	NlRSGYqAJIlgUtoC/C4O+Y8Efm4lpEk5+M5sm4YbzsF8Sz4gDVfDR9uF/tue8YPas8PqUeJO/5x
	r4glQwK2byTEKZJyHsAj5bhgsDL6BGsj0sEm3senTaqpezo41fzpTOPZc5lD7LJ/b7oNkYEt1CK
	ZJgWYRXSfaiAlq99plmwX7PxI+rLRKYT5+iT2rvoQF0DrLmlmeE62IAfmQN2mACjDB/FWvcpMHv
	PEfstGTYIm3SM3ALG8l/Dn0WHTlUcBY+E7Nm5F2gdSeeuUIXKnfrx14yew==
X-Received: by 2002:a05:6102:825:b0:4c0:435b:5dd2 with SMTP id ada2fe7eead31-4ddac83476amr6817618137.1.1746820574233;
        Fri, 09 May 2025 12:56:14 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHMMgzXkj8maUm6O5syz3eXyoWnOlg1S8nru/gD7G5Q4V57S9d1AbWSLXEKJwij7FAjONx6wQ==
X-Received: by 2002:a05:620a:26a9:b0:7c7:c6e9:963c with SMTP id af79cd13be357-7cd0175fc7emr730920485a.4.1746820562967;
        Fri, 09 May 2025 12:56:02 -0700 (PDT)
Received: from ?IPV6:2601:188:c102:9c40:1f42:eb97:44d3:6e9a? ([2601:188:c102:9c40:1f42:eb97:44d3:6e9a])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7cd00f63bbesm180535585a.40.2025.05.09.12.56.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 09 May 2025 12:56:02 -0700 (PDT)
From: Waiman Long <llong@redhat.com>
X-Google-Original-From: Waiman Long <longman@redhat.com>
Message-ID: <23203b71-c2fe-4c0c-b121-95368678eaa5@redhat.com>
Date: Fri, 9 May 2025 15:56:01 -0400
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [syzbot] [cgroups?] general protection fault in
 cgroup_rstat_flush
To: syzbot <syzbot+175b931e69c9ad9e1945@syzkaller.appspotmail.com>,
 cgroups@vger.kernel.org, hannes@cmpxchg.org, linux-kernel@vger.kernel.org,
 mkoutny@suse.com, syzkaller-bugs@googlegroups.com, tj@kernel.org
References: <681e51ba.050a0220.a19a9.013a.GAE@google.com>
Content-Language: en-US
In-Reply-To: <681e51ba.050a0220.a19a9.013a.GAE@google.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 5/9/25 3:04 PM, syzbot wrote:
> Hello,
>
> syzbot found the following issue on:
>
> HEAD commit:    9c69f8884904 Merge tag 'bcachefs-2025-05-08' of git://evil..
> git tree:       upstream
> console output: https://syzkaller.appspot.com/x/log.txt?x=1440acf4580000
> kernel config:  https://syzkaller.appspot.com/x/.config?x=b9683d529ec1b880
> dashboard link: https://syzkaller.appspot.com/bug?extid=175b931e69c9ad9e1945
> compiler:       Debian clang version 20.1.2 (++20250402124445+58df0ef89dd6-1~exp1~20250402004600.97), Debian LLD 20.1.2
>
> Unfortunately, I don't have any reproducer for this issue yet.
>
> Downloadable assets:
> disk image: https://storage.googleapis.com/syzbot-assets/062b75278fb3/disk-9c69f888.raw.xz
> vmlinux: https://storage.googleapis.com/syzbot-assets/868b31a2cf71/vmlinux-9c69f888.xz
> kernel image: https://storage.googleapis.com/syzbot-assets/e773657fdf9c/bzImage-9c69f888.xz
>
> IMPORTANT: if you fix the issue, please add the following tag to the commit:
> Reported-by: syzbot+175b931e69c9ad9e1945@syzkaller.appspotmail.com
>
> Oops: general protection fault, probably for non-canonical address 0xe7ffed1c349f36f7: 0000 [#1] SMP KASAN PTI
> KASAN: maybe wild-memory-access in range [0x3fff88e1a4f9b7b8-0x3fff88e1a4f9b7bf]
> CPU: 0 UID: 0 PID: 52 Comm: kworker/u8:3 Not tainted 6.15.0-rc5-syzkaller-00136-g9c69f8884904 #0 PREEMPT(full)
> Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS Google 04/29/2025
> Workqueue: events_unbound flush_memcg_stats_dwork
> RIP: 0010:cgroup_rstat_push_children kernel/cgroup/rstat.c:165 [inline]
> RIP: 0010:cgroup_rstat_updated_list kernel/cgroup/rstat.c:245 [inline]
> RIP: 0010:cgroup_rstat_flush+0x840/0x1e70 kernel/cgroup/rstat.c:325
> Code: 70 74 08 48 89 df e8 ef e6 66 00 4c 8b 23 4b 8d 1c 3c 48 81 c3 a0 00 00 00 49 89 dd 49 c1 ed 03 48 b8 00 00 00 00 00 fc ff df <41> 80 7c 05 00 00 74 08 48 89 df e8 c0 e6 66 00 48 8b 03 48 3b 44
> RSP: 0018:ffffc90000bd7920 EFLAGS: 00010003
> RAX: dffffc0000000000 RBX: 3fff88e1a4f9b7bd RCX: 1ffffffff1b2b383
> RDX: 0000000000000000 RSI: ffffffff8bc0fec0 RDI: ffff88806481c5c1
> RBP: ffffc90000bd7b08 R08: ffffffff8f7da777 R09: 1ffffffff1efb4ee
> R10: dffffc0000000000 R11: fffffbfff1efb4ef R12: ffff888126200000
> R13: 07fff11c349f36f7 R14: 0000000000000000 R15: 400000607ed9b71d
> FS:  0000000000000000(0000) GS:ffff888126100000(0000) knlGS:0000000000000000
> CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
> CR2: 00005598d2923440 CR3: 000000005d74e000 CR4: 00000000003526f0
> DR0: 0000000000000000 DR1: 0000000000000000 DR2: 0000000000000000
> DR3: 0000000000000000 DR6: 00000000fffe0ff0 DR7: 0000000000000400
> Call Trace:
>   <TASK>
>   flush_memcg_stats_dwork+0x15/0x60 mm/memcontrol.c:653
>   process_one_work kernel/workqueue.c:3238 [inline]
>   process_scheduled_works+0xadb/0x17a0 kernel/workqueue.c:3319
>   worker_thread+0x8a0/0xda0 kernel/workqueue.c:3400
>   kthread+0x70e/0x8a0 kernel/kthread.c:464
>   ret_from_fork+0x4b/0x80 arch/x86/kernel/process.c:153
>   ret_from_fork_asm+0x1a/0x30 arch/x86/entry/entry_64.S:245
>   </TASK>
144 static struct cgroup *cgroup_rstat_push_children(struct cgroup *head,
   :
161                 while (child != parent) {
162                         child->rstat_flush_next = head;
163                         head = child;
164                         crstatc = cgroup_rstat_cpu(child, cpu);
165                         grandchild = crstatc->updated_children; <-- 
Crash here
166                         if (grandchild != child) {
167                                 /* Push the grand child to the next 
level */
168                                 crstatc->updated_children = child;
169                                 grandchild->rstat_flush_next = ghead;
170                                 ghead = grandchild;
171                         }
172                         child = crstatc->updated_next;
173                         crstatc->updated_next = NULL;

It looks like crstatc is invalid. That means the updated_next list may 
contain invalid data. Maybe it becomes NULL terminated somehow, but that 
should not normally happen.

Anyway, there isn't enough data to determine the root cause yet.

Regards,
Longman


> Modules linked in:
> ---[ end trace 0000000000000000 ]---
> RIP: 0010:cgroup_rstat_push_children kernel/cgroup/rstat.c:165 [inline]
> RIP: 0010:cgroup_rstat_updated_list kernel/cgroup/rstat.c:245 [inline]
> RIP: 0010:cgroup_rstat_flush+0x840/0x1e70 kernel/cgroup/rstat.c:325
> Code: 70 74 08 48 89 df e8 ef e6 66 00 4c 8b 23 4b 8d 1c 3c 48 81 c3 a0 00 00 00 49 89 dd 49 c1 ed 03 48 b8 00 00 00 00 00 fc ff df <41> 80 7c 05 00 00 74 08 48 89 df e8 c0 e6 66 00 48 8b 03 48 3b 44
> RSP: 0018:ffffc90000bd7920 EFLAGS: 00010003
> RAX: dffffc0000000000 RBX: 3fff88e1a4f9b7bd RCX: 1ffffffff1b2b383
> RDX: 0000000000000000 RSI: ffffffff8bc0fec0 RDI: ffff88806481c5c1
> RBP: ffffc90000bd7b08 R08: ffffffff8f7da777 R09: 1ffffffff1efb4ee
> R10: dffffc0000000000 R11: fffffbfff1efb4ef R12: ffff888126200000
> R13: 07fff11c349f36f7 R14: 0000000000000000 R15: 400000607ed9b71d
> FS:  0000000000000000(0000) GS:ffff888126100000(0000) knlGS:0000000000000000
> CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
> CR2: 00005598d2923440 CR3: 000000005d74e000 CR4: 00000000003526f0
> DR0: 0000000000000000 DR1: 0000000000000000 DR2: 0000000000000000
> DR3: 0000000000000000 DR6: 00000000fffe0ff0 DR7: 0000000000000400
> ----------------
> Code disassembly (best guess):
>     0:	70 74                	jo     0x76
>     2:	08 48 89             	or     %cl,-0x77(%rax)
>     5:	df e8                	fucomip %st(0),%st
>     7:	ef                   	out    %eax,(%dx)
>     8:	e6 66                	out    %al,$0x66
>     a:	00 4c 8b 23          	add    %cl,0x23(%rbx,%rcx,4)
>     e:	4b 8d 1c 3c          	lea    (%r12,%r15,1),%rbx
>    12:	48 81 c3 a0 00 00 00 	add    $0xa0,%rbx
>    19:	49 89 dd             	mov    %rbx,%r13
>    1c:	49 c1 ed 03          	shr    $0x3,%r13
>    20:	48 b8 00 00 00 00 00 	movabs $0xdffffc0000000000,%rax
>    27:	fc ff df
> * 2a:	41 80 7c 05 00 00    	cmpb   $0x0,0x0(%r13,%rax,1) <-- trapping instruction
>    30:	74 08                	je     0x3a
>    32:	48 89 df             	mov    %rbx,%rdi
>    35:	e8 c0 e6 66 00       	call   0x66e6fa
>    3a:	48 8b 03             	mov    (%rbx),%rax
>    3d:	48                   	rex.W
>    3e:	3b                   	.byte 0x3b
>    3f:	44                   	rex.R
>
>
> ---
> This report is generated by a bot. It may contain errors.
> See https://goo.gl/tpsmEJ for more information about syzbot.
> syzbot engineers can be reached at syzkaller@googlegroups.com.
>
> syzbot will keep track of this issue. See:
> https://goo.gl/tpsmEJ#status for how to communicate with syzbot.
>
> If the report is already addressed, let syzbot know by replying with:
> #syz fix: exact-commit-title
>
> If you want to overwrite report's subsystems, reply with:
> #syz set subsystems: new-subsystem
> (See the list of subsystem names on the web dashboard)
>
> If the report is a duplicate of another one, reply with:
> #syz dup: exact-subject-of-another-report
>
> If you want to undo deduplication, reply with:
> #syz undup
>


Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com [209.85.214.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD79526D4FC
	for <linux-kernel@vger.kernel.org>; Mon, 23 Jun 2025 14:58:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750690696; cv=none; b=rk0xcCq8oY/un3e9UuzhjitorHw4KKjn4PHa/dFhiRW2EYbvtSl4ELMXGv/T7vnUkkIZeaPLL8qfi/pZaCf0+DQWDh0A1/cTJ2929/efun87gaa5TEOfWbQvK1zGdZCe+FflkKKXBn5f0/SuH3fCZJnBySmfGWnAlFIIz65y2CI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750690696; c=relaxed/simple;
	bh=kzpB/oTMZD+YxEDYXaetf/sCSy199yXiANp2zlXAnmo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=eaWCTIsuis0Xp17Uc6iYYgcH3CvrMk48X1q7NhE0lwyfUQrLPMRdyZktAOWW5u2sCksfd7WtWIzreLl1L4QdSwaHWLp2uzEBj8sTsLDdRGD1L3DN2qePFBv/CX8tLEPGqXC8JkTqxKxLMFB57LxX9JlHTXBRbMo1wwQCZGztvYA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernel.dk; spf=pass smtp.mailfrom=kernel.dk; dkim=pass (2048-bit key) header.d=kernel-dk.20230601.gappssmtp.com header.i=@kernel-dk.20230601.gappssmtp.com header.b=rTT2f75t; arc=none smtp.client-ip=209.85.214.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernel.dk
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kernel.dk
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel-dk.20230601.gappssmtp.com header.i=@kernel-dk.20230601.gappssmtp.com header.b="rTT2f75t"
Received: by mail-pl1-f171.google.com with SMTP id d9443c01a7336-23526264386so46962435ad.2
        for <linux-kernel@vger.kernel.org>; Mon, 23 Jun 2025 07:58:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernel-dk.20230601.gappssmtp.com; s=20230601; t=1750690692; x=1751295492; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=00yFHLwjKSmyTnldm5//Ve8YQJQIpSkCGJjKg7cs2a0=;
        b=rTT2f75tufZHb3LLzHORLJjbtnoIVGvWL4uTcvmHtp4kheGVGGe6N0RtO0IGD0y7yz
         hGaTfd058CIBPwF7pW6blwmEdVY/BzqtxgKIVekrkjJBMcybZQuE265x3lMw3RBEQkUb
         OCg4izrxTQtRU5+jinuy2X+iP1lJ7m0Llij5dDmCRZJEXDeP4xNpOaamiB3wa+4dbpqG
         taXq3O+C4kwgY723cXqHQZfhvA3SU8n6VpOzMn73RRdJFagjlJx7loCy1dO3a7NxgjLV
         K3JYL+o+8/AOADbPOR3ALNt4dVnPbW+EDEjMXkvHoXkFdlin+vbiRoft+PBpdd7k0z45
         dkfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750690692; x=1751295492;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=00yFHLwjKSmyTnldm5//Ve8YQJQIpSkCGJjKg7cs2a0=;
        b=FB0f0emRG5Yp3zEMHwiBhY8RPd60S5Mvyk7el32U7jNOcDtWnvN7p/4qifenabVOeU
         UCAzhneMyChscGrSsssrNVsoxfbNnbbBDvmna+D/enDmLh68cYao43w8tCfHmiXCz334
         s7pFC3WW5AdW1SBheNsCxCedJsDGhYp+Q6KFGMUNocszRUCaBhh9gOctu35neN+6PLKN
         uSCealfNlxMx5PaWSi4bEOo4Ms/nMldSympw6f7P+0PD+BywpnjXLbw9DISSLcAvACH8
         Ywj0IPkN7GbaPrVsZqmwEkW7ErapfFmydXwna47gc3pDrhoEadc7NLsL+bZ9Lp6uhUnL
         0Etg==
X-Forwarded-Encrypted: i=1; AJvYcCUobhaUvrSD87TxJ8kqWKXH1tPl1+yoZxxbyd1vCgaP9U/aDeY1Penl4oFZg6QoV91LfAJrE6s3jZc0+Y4=@vger.kernel.org
X-Gm-Message-State: AOJu0Yzhumc3xkX+uxp3E2JqnXUOIr5VlkqT7i2BAMz8LF6QjdKQ+kRa
	5s1oRGoMhTJM2Gelkn1/Z/zRxHhD3Rc+7wcoI2Y6xIjzRxR7qZt3L0wZwSbPqXVw+ok=
X-Gm-Gg: ASbGncua9oIoSRdodG4R0+Bq7979peArcr8W1mgLapJquFypMuTcvKIXhpeQcrD0VEk
	qlu10r7aghWWBOdprCoZRI2mxMYabgT79saUMh9wDKjx24cunw9hVZH+OhL9ymbahxJEXGBPelN
	zLxAA2mqtZo8dz0FoIzFHke+BWt4M5LBS/LjBMQpOLd2OCib5tEJfCOSZrol5gQL603lLtiO6CQ
	YntplCSfvvbiwlvaWduVhJArBH+kt+BfG3ncrTNFs0eTjS03YPk6N9dB0Pbx+pYwnTmJfLhPuD2
	DT3bj38SYCzlMYtYWTO42sbBDO3cf0ZboCVDBm9RCkaYiA0PQHrQpYjGjHDMm+lL3A5i
X-Google-Smtp-Source: AGHT+IFGJyaGlJ9kXniwK2TToGvQCZVPPliQLaHQMpaenA5QkeVuVo0fNAgLTHhZ/5bpw7VBsHsoHA==
X-Received: by 2002:a17:902:c94e:b0:235:f18f:2924 with SMTP id d9443c01a7336-237d97cf9e2mr186776515ad.15.1750690691712;
        Mon, 23 Jun 2025 07:58:11 -0700 (PDT)
Received: from [172.20.0.228] ([12.48.65.201])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-237d860a387sm85254815ad.115.2025.06.23.07.58.10
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 23 Jun 2025 07:58:10 -0700 (PDT)
Message-ID: <014a3820-8082-43a6-8bb2-70859cabdbc0@kernel.dk>
Date: Mon, 23 Jun 2025 08:58:09 -0600
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [syzbot] [mm?] kernel BUG in sanity_check_pinned_pages
To: David Hildenbrand <david@redhat.com>,
 Alexander Potapenko <glider@google.com>
Cc: syzbot <syzbot+1d335893772467199ab6@syzkaller.appspotmail.com>,
 akpm@linux-foundation.org, catalin.marinas@arm.com, jgg@ziepe.ca,
 jhubbard@nvidia.com, linux-kernel@vger.kernel.org, linux-mm@kvack.org,
 peterx@redhat.com, syzkaller-bugs@googlegroups.com,
 Pavel Begunkov <asml.silence@gmail.com>
References: <6857299a.a00a0220.137b3.0085.GAE@google.com>
 <b5aa34ed-d7d4-4445-b8bb-6187b4100682@redhat.com>
 <CAG_fn=WBBwkZZZzBMp0SO3=POgKzNaJGkU_YJKcAKRVQdEYPqw@mail.gmail.com>
 <56862a1d-71c0-4f07-9c1a-9d70069b4d9e@redhat.com>
 <b79acb4e-8a50-4d72-9aaa-0ec5dba25678@redhat.com>
From: Jens Axboe <axboe@kernel.dk>
Content-Language: en-US
In-Reply-To: <b79acb4e-8a50-4d72-9aaa-0ec5dba25678@redhat.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 6/23/25 6:22 AM, David Hildenbrand wrote:
> On 23.06.25 12:10, David Hildenbrand wrote:
>> On 23.06.25 11:53, Alexander Potapenko wrote:
>>> On Mon, Jun 23, 2025 at 11:29?AM 'David Hildenbrand' via
>>> syzkaller-bugs <syzkaller-bugs@googlegroups.com> wrote:
>>>>
>>>> On 21.06.25 23:52, syzbot wrote:
>>>>> syzbot has found a reproducer for the following issue on:
>>>>>
>>>>> HEAD commit:    9aa9b43d689e Merge branch 'for-next/core' into for-kernelci
>>>>> git tree:       git://git.kernel.org/pub/scm/linux/kernel/git/arm64/linux.git for-kernelci
>>>>> console output: https://syzkaller.appspot.com/x/log.txt?x=1525330c580000
>>>>> kernel config:  https://syzkaller.appspot.com/x/.config?x=27f179c74d5c35cd
>>>>> dashboard link: https://syzkaller.appspot.com/bug?extid=1d335893772467199ab6
>>>>> compiler:       Debian clang version 20.1.6 (++20250514063057+1e4d39e07757-1~exp1~20250514183223.118), Debian LLD 20.1.6
>>>>> userspace arch: arm64
>>>>> syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=16d73370580000
>>>>> C reproducer:   https://syzkaller.appspot.com/x/repro.c?x=160ef30c580000
>>>>
>>>> There is not that much magic in there, I'm afraid.
>>>>
>>>> fork() is only used to spin up guests, but before the memory region of
>>>> interest is actually allocated, IIUC. No threading code that races.
>>>>
>>>> IIUC, it triggers fairly fast on aarch64. I've left it running for a
>>>> while on x86_64 without any luck.
>>>>
>>>> So maybe this is really some aarch64-special stuff (pointer tagging?).
>>>>
>>>> In particular, there is something very weird in the reproducer:
>>>>
>>>>      syscall(__NR_madvise, /*addr=*/0x20a93000ul, /*len=*/0x4000ul,
>>>>              /*advice=MADV_HUGEPAGE|0x800000000*/ 0x80000000eul);
>>>>
>>>> advise is supposed to be a 32bit int. What does the magical
>>>> "0x800000000" do?
>>>
>>> I am pretty sure this is a red herring.
>>> Syzkaller sometimes mutates integer flags, even if the result makes no
>>> sense - because sometimes it can trigger interesting bugs.
>>> This `advice` argument will be discarded by is_valid_madvise(),
>>> resulting in -EINVAL.
>>
>> I thought the same, but likely the upper bits are discarded, and we end
>> up with __NR_madvise succeeding.
>>
>> The kernel config has
>>
>>     CONFIG_TRANSPARENT_HUGEPAGE_MADVISE=y
>>
>> So without MADV_HUGEPAGE, we wouldn't get a THP in the first place.
>>
>> So likely this is really just like dropping the "0x800000000"
>>
>> Anyhow, I managed to reproduce in the VM using the provided rootfs on
>> aarch64. It triggers immediately, so no races involved.
>>
>> Running the reproducer on a Fedora 42 debug-kernel in the hypervisor
>> does not trigger.
> 
> Simplified reproducer that does not depend on a race with the
> child process.
> 
> As expected previously, we have PAE cleared on the head page,
> because it is/was COW-shared with a child process.
> 
> We are registering more than one consecutive tail pages of that
> THP through iouring, GUP-pinning them. These pages are not
> COW-shared and, therefore, do not have PAE set.
> 
> #define _GNU_SOURCE
> #include <stdio.h>
> #include <string.h>
> #include <stdlib.h>
> #include <sys/ioctl.h>
> #include <sys/mman.h>
> #include <sys/syscall.h>
> #include <sys/types.h>
> #include <liburing.h>
> 
> int main(void)
> {
>         struct io_uring_params params = {
>                 .wq_fd = -1,
>         };
>         struct iovec iovec;
>         const size_t pagesize = getpagesize();
>         size_t size = 2048 * pagesize;
>         char *addr;
>         int fd;
> 
>         /* We need a THP-aligned area. */
>         addr = mmap((char *)0x20000000u, size, PROT_WRITE|PROT_READ,
>                     MAP_FIXED|MAP_ANONYMOUS|MAP_PRIVATE, -1, 0);
>         if (addr == MAP_FAILED) {
>                 perror("MAP_FIXED failed\n");
>                 return 1;
>         }
> 
>         if (madvise(addr, size, MADV_HUGEPAGE)) {
>                 perror("MADV_HUGEPAGE failed\n");
>                 return 1;
>         }
> 
>         /* Populate a THP. */
>         memset(addr, 0, size);
> 
>         /* COW-share only the first page ... */
>         if (madvise(addr + pagesize, size - pagesize, MADV_DONTFORK)) {
>                 perror("MADV_DONTFORK failed\n");
>                 return 1;
>         }
> 
>         /* ... using fork(). This will clear PAE on the head page. */
>         if (fork() == 0)
>                 exit(0);
> 
>         /* Setup iouring */
>         fd = syscall(__NR_io_uring_setup, 1024, &params);
>         if (fd < 0) {
>                 perror("__NR_io_uring_setup failed\n");
>                 return 1;
>         }
> 
>         /* Register (GUP-pin) two consecutive tail pages. */
>         iovec.iov_base = addr + pagesize;
>         iovec.iov_len = 2 * pagesize;
>         syscall(__NR_io_uring_register, fd, IORING_REGISTER_BUFFERS, &iovec, 1);
>         return 0;
> }
> 
> [  108.070381][   T14] kernel BUG at mm/gup.c:71!
> [  108.070502][   T14] Internal error: Oops - BUG: 00000000f2000800 [#1]  SMP
> [  108.117202][   T14] Modules linked in:
> [  108.119105][   T14] CPU: 1 UID: 0 PID: 14 Comm: kworker/u32:1 Not tainted 6.16.0-rc2-syzkaller-g9aa9b43d689e #0 PREEMPT
> [  108.123672][   T14] Hardware name: QEMU KVM Virtual Machine, BIOS edk2-20250221-8.fc42 02/21/2025
> [  108.127458][   T14] Workqueue: iou_exit io_ring_exit_work
> [  108.129812][   T14] pstate: 60000005 (nZCv daif -PAN -UAO -TCO -DIT -SSBS BTYPE=--)
> [  108.133091][   T14] pc : sanity_check_pinned_pages+0x7cc/0x7d0
> [  108.135566][   T14] lr : sanity_check_pinned_pages+0x7cc/0x7d0
> [  108.138025][   T14] sp : ffff800097ac7640
> [  108.139859][   T14] x29: ffff800097ac7660 x28: dfff800000000000 x27: 1fffffbff80d3000
> [  108.143185][   T14] x26: 01ffc0000002007c x25: 01ffc0000002007c x24: fffffdffc0698000
> [  108.146599][   T14] x23: fffffdffc0698000 x22: ffff800097ac76e0 x21: 01ffc0000002007c
> [  108.150025][   T14] x20: 0000000000000000 x19: ffff800097ac76e0 x18: 00000000ffffffff
> [  108.153449][   T14] x17: 703e2d6f696c6f66 x16: ffff80008ae33808 x15: ffff700011ed61d4
> [  108.156892][   T14] x14: 1ffff00011ed61d4 x13: 0000000000000004 x12: ffffffffffffffff
> [  108.160267][   T14] x11: ffff700011ed61d4 x10: 0000000000ff0100 x9 : f6672ecf4f89d700
> [  108.163782][   T14] x8 : f6672ecf4f89d700 x7 : 0000000000000001 x6 : 0000000000000001
> [  108.167180][   T14] x5 : ffff800097ac6d58 x4 : ffff80008f727060 x3 : ffff80008054c348
> [  108.170807][   T14] x2 : 0000000000000000 x1 : 0000000100000000 x0 : 0000000000000061
> [  108.174205][   T14] Call trace:
> [  108.175649][   T14]  sanity_check_pinned_pages+0x7cc/0x7d0 (P)
> [  108.178138][   T14]  unpin_user_page+0x80/0x10c
> [  108.180189][   T14]  io_release_ubuf+0x84/0xf8
> [  108.182196][   T14]  io_free_rsrc_node+0x250/0x57c
> [  108.184345][   T14]  io_rsrc_data_free+0x148/0x298
> [  108.186493][   T14]  io_sqe_buffers_unregister+0x84/0xa0
> [  108.188991][   T14]  io_ring_ctx_free+0x48/0x480
> [  108.191057][   T14]  io_ring_exit_work+0x764/0x7d8
> [  108.193207][   T14]  process_one_work+0x7e8/0x155c
> [  108.195431][   T14]  worker_thread+0x958/0xed8
> [  108.197561][   T14]  kthread+0x5fc/0x75c
> [  108.199362][   T14]  ret_from_fork+0x10/0x20
> 
> 
> When only pinning a single tail page (iovec.iov_len = pagesize), it works as expected.
> 
> So, if we pinned two tail pages but end up calling io_release_ubuf()->unpin_user_page()
> on the head page, meaning that "imu->bvec[i].bv_page" points at the wrong folio page
> (IOW, one we never pinned).
> 
> So it's related to the io_coalesce_buffer() machinery.
> 
> And in fact, in there, we have this weird logic:
> 
> /* Store head pages only*/
> new_array = kvmalloc_array(nr_folios, sizeof(struct page *), GFP_KERNEL);
> ...
> 
> 
> Essentially discarding the subpage information when coalescing tail pages.
> 
> 
> I am afraid the whole io_check_coalesce_buffer + io_coalesce_buffer() logic might be
> flawed (we can -- in theory -- coalesc different folio page ranges in
> a GUP result?).
> 
> @Jens, not sure if this only triggers a warning when unpinning or if we actually mess up
> imu->bvec[i].bv_page, to end up pointing at (reading/writing) pages we didn't even pin in the first
> place.
> 
> Can you look into that, as you are more familiar with the logic?

Leaving this all quoted and adding Pavel, who wrote that code. I'm
currently away, so can't look into this right now.

-- 
Jens Axboe

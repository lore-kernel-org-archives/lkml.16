Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B0E61276023
	for <linux-kernel@vger.kernel.org>; Mon, 23 Jun 2025 15:11:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750691515; cv=none; b=dGvI0TucIB2EkLLYsRbs6OUOZB1ykR/of9/BsxH8pHtnl52xaYEvNkSbfuEZfS+TR8UVQS72u86NFqay6R/2pMdtHfGwiDdA+NtMIjoSN9dcQQASP+YsbNnE570GXPGmJnDqdMu02jsO373EVDP0io50t7iiRnmPaNOYnpB81rw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750691515; c=relaxed/simple;
	bh=QyKurjUIp90TvWg32gOKnXqIskf2wXgaUE1TTf81rDY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=lArz41gjAn3hCs0P8x2aZDqvKCA7DH5Q4iYW+ZJna/nCu5Y1eMnYaj0LSeG7ST1Xbmjjlrx3qlTVQyK3pZk/tzk7v1Kqny05zW86HTC/1OukphFCtkMrsHgNbYTbZ+JO/XrecKwGMg2bkmUSCrehD1Hrf6LVn18aausq0anrGAY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=FW37MA2f; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="FW37MA2f"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1750691512;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=30EKKzX3/wz748aX+KM5fhJzkqwVUZAmRWvRyVzm5Bs=;
	b=FW37MA2fS3E2fT4b+zX3EdWEI5m3RaFCIxfXKMLBv08ompAfuzZkA71LPvyI38YgcFnamu
	Aa3ufQG04DuwnrnGnMR2uOPOE8TOYpRzE8/M5fw1US74ZPo+TNc4RPS4f8ylTdIFBM1K0H
	O1a23TeRNoBGwbLQ0/fT9kfjpuFYU78=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-424-HzYcM-hKPdmO1YxYuSLA0Q-1; Mon, 23 Jun 2025 11:11:50 -0400
X-MC-Unique: HzYcM-hKPdmO1YxYuSLA0Q-1
X-Mimecast-MFC-AGG-ID: HzYcM-hKPdmO1YxYuSLA0Q_1750691509
Received: by mail-wm1-f71.google.com with SMTP id 5b1f17b1804b1-4530c186394so19476935e9.0
        for <linux-kernel@vger.kernel.org>; Mon, 23 Jun 2025 08:11:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750691509; x=1751296309;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:from:references:cc:to:subject:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=30EKKzX3/wz748aX+KM5fhJzkqwVUZAmRWvRyVzm5Bs=;
        b=JG9WPGv1K2geXDBuifrwv9M/Pfb+ytznyCJVSG7voBFEPWRfZHS/Zh6LX3IXYC3ovL
         OOIRxgSfx/L/YuE8+qGZBSZc4dMaHdyKivYc9YlQPp/f4t7x/ji6QVX1lwYOekmMMHdq
         1rkzlt2q7AqVX2MPS/4n3+NyE7BgdU76uzQyvgEn96F9uvNdeFhos4Thkezyu4nslpOS
         PUoFxtEuDPMA+0wqucpKFhLGY8lLQ61Lvn9mxE8tEbM0RZTXALVtRLic61PEeJrJZcPN
         UHJw/3BdFTHl3pd3JGmQZjI2Ze88KshI8TANCram0TebSQkeUeCq4KuZ3C06tImhSXSj
         8OtQ==
X-Forwarded-Encrypted: i=1; AJvYcCW7QK91Rulr90fCWncd/FlZZ6nK3OkhKlwME68ECcbKZJNuDYbwTVEYdSowLnvD/IJpYQ095NcvUNoELAQ=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw/oJ5e2VKszRhsXovXjCgoXHEDMtaCGqAEyVS0aPxNSwBIiVBz
	TnHy+oaX7+cdU6ntdDH/+xDUW4JrxjyX7qTMprF1d8l7K4gutvDck0ADDZIbs8PmHr8yqNPqoub
	zLN2fZLE3DGJ4CSmnwlMN9B6q8BBZ7uIvajv4dnw6XF/ASBEcHLHYSLkj7MwLIGlWLw==
X-Gm-Gg: ASbGncv5C18baAMaRTRCv4xbdfKrGZjNuYjGvaD9wt63jgfbEFQValO0lCxGuWMw8Jy
	s7D6THyIhfJBkBt4kqVHc/R13W/nB8YHJ1WmuNpNxMva06PUGSSBag3044/p0vVNbytySCFM7jl
	uGUkvqwNVdSDb4CwbJbszfyMWR98j5es5RhZHaJh4oVOVPL1SGX4IHiIYKOv7RHdYTLZQdx+acc
	Vg6i+hsEQ5IhmmUZUBuOGcrZp7jFUNsv9m53pX0/EqXSEME322PRbGYTalraZfTots2uOrfKdd/
	vJcRpByKW5oHhi6YcHvgZphjMIWENw4g0NDZgyIAZ0gIS1WHaUb8/DT/cCtf7fvMga542QTmMm3
	C3bPFmtIrdu4/1b6+isp2CKeX8nwZay+PgcdLvWSAf+dTTAqZMg==
X-Received: by 2002:a05:600c:1f0e:b0:43d:563:6fef with SMTP id 5b1f17b1804b1-453659ec182mr111582995e9.21.1750691509378;
        Mon, 23 Jun 2025 08:11:49 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IER7kqjX/fwbLXz4Hgn88K/2PiKvwcjHsM77U+wmaeJVRSm8neDOpthOtyDADOoDqRUtXUXwQ==
X-Received: by 2002:a05:600c:1f0e:b0:43d:563:6fef with SMTP id 5b1f17b1804b1-453659ec182mr111582605e9.21.1750691508810;
        Mon, 23 Jun 2025 08:11:48 -0700 (PDT)
Received: from ?IPV6:2003:d8:2f4e:fd00:8e13:e3b5:90c8:1159? (p200300d82f4efd008e13e3b590c81159.dip0.t-ipconnect.de. [2003:d8:2f4e:fd00:8e13:e3b5:90c8:1159])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a6d1190cc3sm9635460f8f.89.2025.06.23.08.11.47
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 23 Jun 2025 08:11:48 -0700 (PDT)
Message-ID: <a72fe0ba-b022-4f6e-b401-78e93aadc5ce@redhat.com>
Date: Mon, 23 Jun 2025 17:11:47 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [syzbot] [mm?] kernel BUG in sanity_check_pinned_pages
To: Jens Axboe <axboe@kernel.dk>, Alexander Potapenko <glider@google.com>
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
 <014a3820-8082-43a6-8bb2-70859cabdbc0@kernel.dk>
From: David Hildenbrand <david@redhat.com>
Content-Language: en-US
Autocrypt: addr=david@redhat.com; keydata=
 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
 WNyWQQ==
Organization: Red Hat
In-Reply-To: <014a3820-8082-43a6-8bb2-70859cabdbc0@kernel.dk>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 23.06.25 16:58, Jens Axboe wrote:
> On 6/23/25 6:22 AM, David Hildenbrand wrote:
>> On 23.06.25 12:10, David Hildenbrand wrote:
>>> On 23.06.25 11:53, Alexander Potapenko wrote:
>>>> On Mon, Jun 23, 2025 at 11:29?AM 'David Hildenbrand' via
>>>> syzkaller-bugs <syzkaller-bugs@googlegroups.com> wrote:
>>>>>
>>>>> On 21.06.25 23:52, syzbot wrote:
>>>>>> syzbot has found a reproducer for the following issue on:
>>>>>>
>>>>>> HEAD commit:    9aa9b43d689e Merge branch 'for-next/core' into for-kernelci
>>>>>> git tree:       git://git.kernel.org/pub/scm/linux/kernel/git/arm64/linux.git for-kernelci
>>>>>> console output: https://syzkaller.appspot.com/x/log.txt?x=1525330c580000
>>>>>> kernel config:  https://syzkaller.appspot.com/x/.config?x=27f179c74d5c35cd
>>>>>> dashboard link: https://syzkaller.appspot.com/bug?extid=1d335893772467199ab6
>>>>>> compiler:       Debian clang version 20.1.6 (++20250514063057+1e4d39e07757-1~exp1~20250514183223.118), Debian LLD 20.1.6
>>>>>> userspace arch: arm64
>>>>>> syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=16d73370580000
>>>>>> C reproducer:   https://syzkaller.appspot.com/x/repro.c?x=160ef30c580000
>>>>>
>>>>> There is not that much magic in there, I'm afraid.
>>>>>
>>>>> fork() is only used to spin up guests, but before the memory region of
>>>>> interest is actually allocated, IIUC. No threading code that races.
>>>>>
>>>>> IIUC, it triggers fairly fast on aarch64. I've left it running for a
>>>>> while on x86_64 without any luck.
>>>>>
>>>>> So maybe this is really some aarch64-special stuff (pointer tagging?).
>>>>>
>>>>> In particular, there is something very weird in the reproducer:
>>>>>
>>>>>       syscall(__NR_madvise, /*addr=*/0x20a93000ul, /*len=*/0x4000ul,
>>>>>               /*advice=MADV_HUGEPAGE|0x800000000*/ 0x80000000eul);
>>>>>
>>>>> advise is supposed to be a 32bit int. What does the magical
>>>>> "0x800000000" do?
>>>>
>>>> I am pretty sure this is a red herring.
>>>> Syzkaller sometimes mutates integer flags, even if the result makes no
>>>> sense - because sometimes it can trigger interesting bugs.
>>>> This `advice` argument will be discarded by is_valid_madvise(),
>>>> resulting in -EINVAL.
>>>
>>> I thought the same, but likely the upper bits are discarded, and we end
>>> up with __NR_madvise succeeding.
>>>
>>> The kernel config has
>>>
>>>      CONFIG_TRANSPARENT_HUGEPAGE_MADVISE=y
>>>
>>> So without MADV_HUGEPAGE, we wouldn't get a THP in the first place.
>>>
>>> So likely this is really just like dropping the "0x800000000"
>>>
>>> Anyhow, I managed to reproduce in the VM using the provided rootfs on
>>> aarch64. It triggers immediately, so no races involved.
>>>
>>> Running the reproducer on a Fedora 42 debug-kernel in the hypervisor
>>> does not trigger.
>>
>> Simplified reproducer that does not depend on a race with the
>> child process.
>>
>> As expected previously, we have PAE cleared on the head page,
>> because it is/was COW-shared with a child process.
>>
>> We are registering more than one consecutive tail pages of that
>> THP through iouring, GUP-pinning them. These pages are not
>> COW-shared and, therefore, do not have PAE set.
>>
>> #define _GNU_SOURCE
>> #include <stdio.h>
>> #include <string.h>
>> #include <stdlib.h>
>> #include <sys/ioctl.h>
>> #include <sys/mman.h>
>> #include <sys/syscall.h>
>> #include <sys/types.h>
>> #include <liburing.h>
>>
>> int main(void)
>> {
>>          struct io_uring_params params = {
>>                  .wq_fd = -1,
>>          };
>>          struct iovec iovec;
>>          const size_t pagesize = getpagesize();
>>          size_t size = 2048 * pagesize;
>>          char *addr;
>>          int fd;
>>
>>          /* We need a THP-aligned area. */
>>          addr = mmap((char *)0x20000000u, size, PROT_WRITE|PROT_READ,
>>                      MAP_FIXED|MAP_ANONYMOUS|MAP_PRIVATE, -1, 0);
>>          if (addr == MAP_FAILED) {
>>                  perror("MAP_FIXED failed\n");
>>                  return 1;
>>          }
>>
>>          if (madvise(addr, size, MADV_HUGEPAGE)) {
>>                  perror("MADV_HUGEPAGE failed\n");
>>                  return 1;
>>          }
>>
>>          /* Populate a THP. */
>>          memset(addr, 0, size);
>>
>>          /* COW-share only the first page ... */
>>          if (madvise(addr + pagesize, size - pagesize, MADV_DONTFORK)) {
>>                  perror("MADV_DONTFORK failed\n");
>>                  return 1;
>>          }
>>
>>          /* ... using fork(). This will clear PAE on the head page. */
>>          if (fork() == 0)
>>                  exit(0);
>>
>>          /* Setup iouring */
>>          fd = syscall(__NR_io_uring_setup, 1024, &params);
>>          if (fd < 0) {
>>                  perror("__NR_io_uring_setup failed\n");
>>                  return 1;
>>          }
>>
>>          /* Register (GUP-pin) two consecutive tail pages. */
>>          iovec.iov_base = addr + pagesize;
>>          iovec.iov_len = 2 * pagesize;
>>          syscall(__NR_io_uring_register, fd, IORING_REGISTER_BUFFERS, &iovec, 1);
>>          return 0;
>> }
>>
>> [  108.070381][   T14] kernel BUG at mm/gup.c:71!
>> [  108.070502][   T14] Internal error: Oops - BUG: 00000000f2000800 [#1]  SMP
>> [  108.117202][   T14] Modules linked in:
>> [  108.119105][   T14] CPU: 1 UID: 0 PID: 14 Comm: kworker/u32:1 Not tainted 6.16.0-rc2-syzkaller-g9aa9b43d689e #0 PREEMPT
>> [  108.123672][   T14] Hardware name: QEMU KVM Virtual Machine, BIOS edk2-20250221-8.fc42 02/21/2025
>> [  108.127458][   T14] Workqueue: iou_exit io_ring_exit_work
>> [  108.129812][   T14] pstate: 60000005 (nZCv daif -PAN -UAO -TCO -DIT -SSBS BTYPE=--)
>> [  108.133091][   T14] pc : sanity_check_pinned_pages+0x7cc/0x7d0
>> [  108.135566][   T14] lr : sanity_check_pinned_pages+0x7cc/0x7d0
>> [  108.138025][   T14] sp : ffff800097ac7640
>> [  108.139859][   T14] x29: ffff800097ac7660 x28: dfff800000000000 x27: 1fffffbff80d3000
>> [  108.143185][   T14] x26: 01ffc0000002007c x25: 01ffc0000002007c x24: fffffdffc0698000
>> [  108.146599][   T14] x23: fffffdffc0698000 x22: ffff800097ac76e0 x21: 01ffc0000002007c
>> [  108.150025][   T14] x20: 0000000000000000 x19: ffff800097ac76e0 x18: 00000000ffffffff
>> [  108.153449][   T14] x17: 703e2d6f696c6f66 x16: ffff80008ae33808 x15: ffff700011ed61d4
>> [  108.156892][   T14] x14: 1ffff00011ed61d4 x13: 0000000000000004 x12: ffffffffffffffff
>> [  108.160267][   T14] x11: ffff700011ed61d4 x10: 0000000000ff0100 x9 : f6672ecf4f89d700
>> [  108.163782][   T14] x8 : f6672ecf4f89d700 x7 : 0000000000000001 x6 : 0000000000000001
>> [  108.167180][   T14] x5 : ffff800097ac6d58 x4 : ffff80008f727060 x3 : ffff80008054c348
>> [  108.170807][   T14] x2 : 0000000000000000 x1 : 0000000100000000 x0 : 0000000000000061
>> [  108.174205][   T14] Call trace:
>> [  108.175649][   T14]  sanity_check_pinned_pages+0x7cc/0x7d0 (P)
>> [  108.178138][   T14]  unpin_user_page+0x80/0x10c
>> [  108.180189][   T14]  io_release_ubuf+0x84/0xf8
>> [  108.182196][   T14]  io_free_rsrc_node+0x250/0x57c
>> [  108.184345][   T14]  io_rsrc_data_free+0x148/0x298
>> [  108.186493][   T14]  io_sqe_buffers_unregister+0x84/0xa0
>> [  108.188991][   T14]  io_ring_ctx_free+0x48/0x480
>> [  108.191057][   T14]  io_ring_exit_work+0x764/0x7d8
>> [  108.193207][   T14]  process_one_work+0x7e8/0x155c
>> [  108.195431][   T14]  worker_thread+0x958/0xed8
>> [  108.197561][   T14]  kthread+0x5fc/0x75c
>> [  108.199362][   T14]  ret_from_fork+0x10/0x20
>>
>>
>> When only pinning a single tail page (iovec.iov_len = pagesize), it works as expected.
>>
>> So, if we pinned two tail pages but end up calling io_release_ubuf()->unpin_user_page()
>> on the head page, meaning that "imu->bvec[i].bv_page" points at the wrong folio page
>> (IOW, one we never pinned).
>>
>> So it's related to the io_coalesce_buffer() machinery.
>>
>> And in fact, in there, we have this weird logic:
>>
>> /* Store head pages only*/
>> new_array = kvmalloc_array(nr_folios, sizeof(struct page *), GFP_KERNEL);
>> ...
>>
>>
>> Essentially discarding the subpage information when coalescing tail pages.
>>
>>
>> I am afraid the whole io_check_coalesce_buffer + io_coalesce_buffer() logic might be
>> flawed (we can -- in theory -- coalesc different folio page ranges in
>> a GUP result?).
>>
>> @Jens, not sure if this only triggers a warning when unpinning or if we actually mess up
>> imu->bvec[i].bv_page, to end up pointing at (reading/writing) pages we didn't even pin in the first
>> place.
>>
>> Can you look into that, as you are more familiar with the logic?
> 
> Leaving this all quoted and adding Pavel, who wrote that code. I'm
> currently away, so can't look into this right now.

I did some more digging, but ended up being all confused about 
io_check_coalesce_buffer() and io_imu_folio_data().

Assuming we pass a bunch of consecutive tail pages that all belong to 
the same folio, then the loop in io_check_coalesce_buffer() will always
run into the

if (page_folio(page_array[i]) == folio &&
     page_array[i] == page_array[i-1] + 1) {
	count++;
	continue;
}

case, making the function return "true" ... in io_coalesce_buffer(), we 
then store the head page ... which seems very wrong.

In general, storing head pages when they are not the first page to be 
coalesced seems wrong.

-- 
Cheers,

David / dhildenb


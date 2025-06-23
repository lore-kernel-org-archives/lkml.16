Received: from mail-ed1-f46.google.com (mail-ed1-f46.google.com [209.85.208.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9FD111684A4
	for <linux-kernel@vger.kernel.org>; Mon, 23 Jun 2025 18:01:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750701663; cv=none; b=TlTGwzERgEX5LeaLqxLe3tO2zmYEUk+ApWoccxFTBI98CZ5MXC4O+9fqq/44HbCxoTjw83NfwPINvqei4xK5V4xsytCNAwfUJqoyNeyXB7RySBIho+zfM+XMeTsOo07Sa8Bq/T12gt/ZsAbRNP020PDDx20lF/wr3oj9qrEN1vY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750701663; c=relaxed/simple;
	bh=tizdmluRp8pdkLTi/UIsGhLAHFsyj9dlvsR6nlstrX4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=nbtsSQ+Q7Lg/cgqkqMXzZYmRD5f70h8OPCmKNH8TGLf/qJRqFn6AN98OD0qWeAhr5CtYFda5cV4iBt5n4gbeRaS+YeXOVSFYuPP/0zVnVegPRj6XCzZ/lNZaUHdkdOoZ43cdJ6Ml67UOCGZnc2YXnBX/BwVrxG0HQLjE7YYaaIQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Lw3IWraw; arc=none smtp.client-ip=209.85.208.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Lw3IWraw"
Received: by mail-ed1-f46.google.com with SMTP id 4fb4d7f45d1cf-607b59b447bso6855954a12.1
        for <linux-kernel@vger.kernel.org>; Mon, 23 Jun 2025 11:01:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1750701660; x=1751306460; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=D0Wn4FHAOI4GGZOGOV7lgNZvwN/fhscsGQ+OpVSAn/M=;
        b=Lw3IWrawOphZ4TVP2BKWD5VKkwc/zUjbKUw0zyvXpd8nLlX++vhgEZ1IZatDjM40mQ
         2mbfu5cH+yyEFUSMLRq0H/V5ynN09MFwM4ukcDBcXpcyOCiVeA6wtvMKt4pmtv+56euo
         VCXo7h8KLnP19iXYF+WvBgaUpSGI3GlOz2Fepdp7228IHi8Pvi7xP+xOLj4GKxmOOxLX
         OUjaBjbRSGBNxsf/FEkrcfvxIMrYk2f/8/ah2QxhhDQnjX4l2xIebIDCrNEbI/ntNqxX
         sAJk0uVvhVyVF662x15SBwATQmqSa6yx1isvwgGQfT0s4KIAXG4hbRWlG7me8ChcBClk
         TrUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750701660; x=1751306460;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=D0Wn4FHAOI4GGZOGOV7lgNZvwN/fhscsGQ+OpVSAn/M=;
        b=g67DNqrhYEBEFKY7JQP8mOJ1IOvLAhyK9e446X/RbTPnzuxpcJIb6tVq/+6FAIfKC8
         BSejPDdvv5npCh7ocHvcQql1A7knDAqyCW/oUKKX/KhuBREsxo6Jdal5/A9xETZDFb5t
         iVAbkXCQK+9H0dY5ePjEM+F7p4+BAFS+xBWX3X/5NqnbuXTu9N13xWV2CEhlhhyvq6JR
         lxJYbKgI1GjnL2Ks4ryCbD3y28WZoUyrFKo5lj+6thHi2MuBUS/abYL4A2RU0fINHByX
         ahZeArT4AqWaLTUkZ1sxCNbdrBBVs91usf5Ccw+IrvNyFEwSOGHzYvccjjNHVWtwoK3F
         od9Q==
X-Forwarded-Encrypted: i=1; AJvYcCXrv9e0ut3I/m5KQoksf5FPsYycgjSfgLgtMHlzjnLo4MUqH01rVaqr/0qzZxqZEwHiAqESXkPVpDfgsW0=@vger.kernel.org
X-Gm-Message-State: AOJu0YzWznPCVUw0ikG4r/3H9f8tQfTr/acDMni7HLynFs5bZj7Qq7wE
	q1KpuBMuJTPrawCYj7k/80sp0LR5vPHbqewb/Lh+y9uB1uwjDqsXYjPw
X-Gm-Gg: ASbGncvvtzmijooDBsqWA2Euyez2Sbbby75ND8+uITZbwPJ0jDihlGFEIpitGas65c0
	/fbINMW0LsX6zHXumoZo8Z/4rlvMc4rZs4RxHLctFhpyQmmUTSoz6TTuWixH5y5411S9EJO4Pf3
	pJvIu1OnxFWmoOIhw+LKEuHw+JOyTRzVuIOsUTVXVG4bCK0LEyprUqkmlMO1jfPKpYpYs63C/Ug
	CXfVIFpdGZa7P9whJFW/OKWabODzGje3xi9V5NImgW04YRQt+e4jUpRbdVCJObsYCv6Fg7Utsr8
	q/dH7+0mGN9Q8HOi9dXdGtSM8ME4tGQ/n0HcYsABtOVGNtDxHVpYadskgukSYwVPrO2LFGw=
X-Google-Smtp-Source: AGHT+IH+WX5YjMaWSzQ+wgC6H1DgVK2YKPU0OPyIfBETYAwTkxu63TuCd7oKiw+ZMxEZJTytDHQoDA==
X-Received: by 2002:a05:6402:50d0:b0:601:a681:4d5c with SMTP id 4fb4d7f45d1cf-60a1cf3dc39mr12447439a12.32.1750701659466;
        Mon, 23 Jun 2025 11:00:59 -0700 (PDT)
Received: from [192.168.8.100] ([148.252.128.65])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-60a18cbab17sm6438828a12.64.2025.06.23.11.00.57
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 23 Jun 2025 11:00:58 -0700 (PDT)
Message-ID: <da071ca9-ff7f-4c3c-8be9-f01b93abb1ff@gmail.com>
Date: Mon, 23 Jun 2025 19:02:21 +0100
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [syzbot] [mm?] kernel BUG in sanity_check_pinned_pages
To: David Hildenbrand <david@redhat.com>, Jens Axboe <axboe@kernel.dk>,
 Alexander Potapenko <glider@google.com>
Cc: syzbot <syzbot+1d335893772467199ab6@syzkaller.appspotmail.com>,
 akpm@linux-foundation.org, catalin.marinas@arm.com, jgg@ziepe.ca,
 jhubbard@nvidia.com, linux-kernel@vger.kernel.org, linux-mm@kvack.org,
 peterx@redhat.com, syzkaller-bugs@googlegroups.com
References: <6857299a.a00a0220.137b3.0085.GAE@google.com>
 <b5aa34ed-d7d4-4445-b8bb-6187b4100682@redhat.com>
 <CAG_fn=WBBwkZZZzBMp0SO3=POgKzNaJGkU_YJKcAKRVQdEYPqw@mail.gmail.com>
 <56862a1d-71c0-4f07-9c1a-9d70069b4d9e@redhat.com>
 <b79acb4e-8a50-4d72-9aaa-0ec5dba25678@redhat.com>
 <014a3820-8082-43a6-8bb2-70859cabdbc0@kernel.dk>
 <a72fe0ba-b022-4f6e-b401-78e93aadc5ce@redhat.com>
 <ea748461-2059-4aca-81a0-4d01c34926da@gmail.com>
 <6f92b7d6-7d3c-4830-a591-75dc4d55c46c@redhat.com>
 <aef06093-6081-460e-8452-87b522b06050@redhat.com>
Content-Language: en-US
From: Pavel Begunkov <asml.silence@gmail.com>
In-Reply-To: <aef06093-6081-460e-8452-87b522b06050@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 6/23/25 18:36, David Hildenbrand wrote:
> On 23.06.25 18:59, David Hildenbrand wrote:
>> On 23.06.25 18:48, Pavel Begunkov wrote:
>>> On 6/23/25 16:11, David Hildenbrand wrote:
...>>> Yes, it stores the head page even if the range passed to
>>> pin_user_pages() doesn't cover the head page.
>>   > > It should be converted to unpin_user_folio(), which doesn't seem
>>> to do sanity_check_pinned_pages(). Do you think that'll be enough
>>> (conceptually)? Nobody is actually touching the head page in those
>>> cases apart from the final unpin, and storing the head page is
>>> more convenient than keeping folios. I'll take a look if it can
>>> be fully converted to folios w/o extra overhead.
>>
>> Assuming we had from GUP
>>
>> nr_pages = 2
>> pages[0] = folio_page(folio, 1)
>> pages[1] = folio_page(folio, 2)
>>
>> After io_coalesce_buffer() we have
>>
>> nr_pages = 1
>> pages[0] = folio_page(folio, 0)
>>
>>
>> Using unpin_user_folio() in all places where we could see something like
>> that would be the right thing to do. The sanity checks are not in
>> unpin_user_folio() for exactly that reason: we don't know which folio
>> pages we pinned.

Let's do that for starters

>> But now I wonder where you make sure that "Nobody is actually touching
>> the head page"?
>>
>> How do you get back the "which folio range" information after
>> io_coalesce_buffer() ?
>>
>>
>> If you rely on alignment in virtual address space for you, combined with
>> imu->folio_shift, that might not work reliably ...
> 
> FWIW, applying the following on top of origin/master:
> 
> diff --git a/tools/testing/selftests/mm/cow.c b/tools/testing/selftests/mm/cow.c
> index dbbcc5eb3dce5..e62a284dcf906 100644
> --- a/tools/testing/selftests/mm/cow.c
> +++ b/tools/testing/selftests/mm/cow.c
> @@ -946,6 +946,7 @@ static void do_run_with_thp(test_fn fn, enum thp_run thp_run, size_t thpsize)
>                          log_test_result(KSFT_FAIL);
>                          goto munmap;
>                  }
> +               mem = mremap_mem;
>                  size = mremap_size;
>                  break;
>          case THP_RUN_PARTIAL_SHARED:
> 
> 
> and then running the selftest, something is not happy:
> 
> ...
> # [RUN] R/O-mapping a page registered as iouring fixed buffer ... with partially mremap()'ed THP (512 kB)
> [34272.021973] Oops: general protection fault, maybe for address 0xffff8bab09d5b000: 0000 [#1] PREEMPT SMP NOPTI
> [34272.021980] CPU: 3 UID: 0 PID: 1048307 Comm: iou-wrk-1047940 Not tainted 6.14.9-300.fc42.x86_64 #1
> [34272.021983] Hardware name: LENOVO 20WNS1F81N/20WNS1F81N, BIOS N35ET53W (1.53 ) 03/22/2023
> [34272.021984] RIP: 0010:memcpy+0xc/0x20
> [34272.021989] Code: cc cc cc 66 2e 0f 1f 84 00 00 00 00 00 90 90 90 90 90 90 90 90 90 90 90 90 90 90 90 90 90 f3 0f 1e fa 66 90 48 89 f8 48 89 d1 <f3> a4 e9 4d f9 00 00 66 66 2e 0f 1f 84 00 00 00 00 00 66 90 90 90
> [34272.021991] RSP: 0018:ffffcff459183c20 EFLAGS: 00010206
> [34272.021993] RAX: ffff8bab09d5b000 RBX: 0000000000000fff RCX: 0000000000000fff
> [34272.021994] RDX: 0000000000000fff RSI: 0021461670800001 RDI: ffff8bab09d5b000
> [34272.021995] RBP: ffff8ba794866c40 R08: ffff8bab09d5b000 R09: 0000000000001000
> [34272.021996] R10: ffff8ba7a316f9d0 R11: ffff8ba92f133080 R12: 0000000000000fff
> [34272.021997] R13: ffff8baa85d5b6a0 R14: 0000000000000fff R15: 0000000000001000
> [34272.021998] FS:  00007f16c568a740(0000) GS:ffff8baebf580000(0000) knlGS:0000000000000000
> [34272.021999] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
> [34272.022000] CR2: 00007fffb6a10b00 CR3: 00000003df9eb006 CR4: 0000000000f72ef0
> [34272.022001] PKRU: 55555554
> [34272.022002] Call Trace:
> [34272.022004]  <TASK>
> [34272.022005]  copy_page_from_iter_atomic+0x36f/0x7e0
> [34272.022009]  ? simple_xattr_get+0x59/0xa0
> [34272.022012]  generic_perform_write+0x86/0x2e0
> [34272.022016]  shmem_file_write_iter+0x86/0x90
> [34272.022019]  io_write+0xe4/0x390
> [34272.022023]  io_issue_sqe+0x65/0x4f0
> [34272.022024]  ? lock_timer_base+0x7d/0xc0
> [34272.022027]  io_wq_submit_work+0xb8/0x320
> [34272.022029]  io_worker_handle_work+0xd5/0x300
> [34272.022032]  io_wq_worker+0xda/0x300
> [34272.022034]  ? finish_task_switch.isra.0+0x99/0x2c0
> [34272.022037]  ? __pfx_io_wq_worker+0x10/0x10
> [34272.022039]  ret_from_fork+0x34/0x50
> [34272.022042]  ? __pfx_io_wq_worker+0x10/0x10
> [34272.022044]  ret_from_fork_asm+0x1a/0x30
> [34272.022047]  </TASK>
> 
> 
> There, we essentially mremap a THP to not be aligned in VA space, and then register half the
> THP as a fixed buffer.
> 
> So ... my suspicion that this is all rather broken grows :)

It's supposed to calculate the offset from a user pointer and
then work with that, but I guess there are masking that violate
it, I'll check.

-- 
Pavel Begunkov


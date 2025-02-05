Received: from mail-ed1-f52.google.com (mail-ed1-f52.google.com [209.85.208.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 00F2D155747
	for <linux-kernel@vger.kernel.org>; Wed,  5 Feb 2025 14:39:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738766380; cv=none; b=bSIbcqSctY141Yovc+S9/9dC5ko/FnCj79lZLtHVjI1bIp3OPlpmmOjR3+Edy60TgJQLFeAadqloVYh0yeg8UPHBsPWtDyp+gV0qeN+lav1/tjz3bXBDOgqhBVkiDKbpCT9TqmXQO4I8cuDHpHlQb1QXH6d7u+ZKQ8y8tZCdq0M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738766380; c=relaxed/simple;
	bh=Qwsq9u/rD2Fqt7Op/6fmGL1FLaKX6Jq6Vt2Wf9t1TBg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=qgLlrBtY3BLF1YYKNqG5JY6M86m0+Xd//ofBqpV6UMJnwed6beLBKmJ+7JnMc4x9qtuFnZcWa3d40RttHHw+dufVJ5aQIcIqvuXvRFH9Qvp0eA+YLGsMQ8e8/gBvFA1f12ka6ZP70I2lato591p/In79QgUyaW2Nx6KdY92DclM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=njzDd755; arc=none smtp.client-ip=209.85.208.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="njzDd755"
Received: by mail-ed1-f52.google.com with SMTP id 4fb4d7f45d1cf-5dc82e38c10so10830109a12.3
        for <linux-kernel@vger.kernel.org>; Wed, 05 Feb 2025 06:39:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1738766377; x=1739371177; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yg6Tg4DF+QuWwfNfh/wFRO7JO+rdVERpEIIZMGAFCL8=;
        b=njzDd755eB3qJGQTFV9pyuwIR/QWzOS7JJn1VfSQBgGJWtm2r6EfKC5wUbMSLm77x/
         kxOaS5Z4ab3iASwZMKVT+no6FIxpILyFDhpy/M/Tlm5SpJPVqZj2eiaVTL0Nd6w+b1wn
         e5ApPlNXOHZuouViB9fITP5uUb7nW8mz1TlkYSPZkQrYMryKrdMBdBVAeRU/oJPuYqmQ
         7NaJw/tdu2Min1+0baQ7xotTtQVXw8puT/PRxIH/+uJju8WiohGmLyzci8CinLyCjHuf
         HFDrIRTmJ3ALf/A+C4XRLrDnT1HNxOZgjlQfxUGEFYZop53G2/q2ME4p0hGiWQdvyOLX
         OrGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738766377; x=1739371177;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=yg6Tg4DF+QuWwfNfh/wFRO7JO+rdVERpEIIZMGAFCL8=;
        b=KZ4+kv1MOklGTIYimmhFvcsAUuwl7+IkaCActFMLXGU3GnjoO6p9kT1hU70SBgy+41
         q/FK9D251wZnRj4zhjrODzPvs8OG2AK480BirUqOH0LlESs0dm0RtNPLYjZimGp4IGPB
         y71M4FVCOmp6gFGqNHtswQbQN4PPPDqKAxJsWQmOgUPfIPfC6vtnKJTzpnV4Am7zOTw2
         jPPLjKtdulJf4gsM4prfM6uZ/cGCG8+BQg5b4A44h3MLJ1iaCnSN9q0QMDYWhCP1bF7+
         l6TeAADdmMnLCPMQ4TPhhcHgmQY7Ee4tNMtvjUsFjaq+mQ0AySXzg2lsblJB5vwTDb3E
         40Fw==
X-Forwarded-Encrypted: i=1; AJvYcCX4Joe7TIkt0f2eHJdkqR6Y3xCNKi3Gis2NIMz27khBeDLhUzoxjqGzkY/AtrPFm+MXEuxSKrm0DbM9CRc=@vger.kernel.org
X-Gm-Message-State: AOJu0YyVEZyfzBj4JO05cMbqCPJY3XVphjrc9MpYnwYow3mfqLLbnMaU
	XzR5db1/YhV1D2XYJRvXD+cyAUFXchmCxWagFBanDMkYqtvKsKO/HDLWTJQQwcW6G/yov0gmQ+8
	vGo4ELdVkj4d+2KhQrBL88AS/G4Y=
X-Gm-Gg: ASbGnctCZAjO1WM34HLUtNNThuAdfMocW0XLKnkrDaUAHc/yAJz1ohPNs3uiycx+SQG
	07hCQlLZTB2INouk1ft78hrHyvlNQo9+mr9PCT2UR+TNfvDEgx5aMh/kxWnqpi9nX/a17Usfa
X-Google-Smtp-Source: AGHT+IEQJEOMLKLa01xt1xRmixXdCYk2PgZrzjG46Q/rviLbmu9ckrktfQst6PD6k8Qvh8O53LejRbNmJlM31b9I9Cc=
X-Received: by 2002:a05:6402:13c8:b0:5d0:81af:4a43 with SMTP id
 4fb4d7f45d1cf-5dcdb5873damr3534222a12.0.1738766376802; Wed, 05 Feb 2025
 06:39:36 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <1738717785.im3r5g2vxc.none.ref@localhost> <1738717785.im3r5g2vxc.none@localhost>
 <25e2d5e4-8214-40de-99d3-2b657181a9fd@linux.alibaba.com> <5dd39b03-c40e-4f34-bf89-b3e5a12753dc@linux.alibaba.com>
In-Reply-To: <5dd39b03-c40e-4f34-bf89-b3e5a12753dc@linux.alibaba.com>
From: Lance Yang <ioworker0@gmail.com>
Date: Wed, 5 Feb 2025 22:39:00 +0800
X-Gm-Features: AWEUYZlm0TareJhuDBCQ5cF_oL3r7WkbrBn6iLTvPxztLLi0FHnOGoQFyEPYfG8
Message-ID: <CAK1f24ni707gcGpYKXqsb9XHxjx3froLs3DzVqkkNZdca_pw4Q@mail.gmail.com>
Subject: Re: Hang when swapping huge=within_size tmpfs from zram
To: Baolin Wang <baolin.wang@linux.alibaba.com>
Cc: "Alex Xu (Hello71)" <alex_y_xu@yahoo.ca>, linux-mm@kvack.org, 
	Daniel Gomez <da.gomez@samsung.com>, Barry Song <baohua@kernel.org>, 
	David Hildenbrand <david@redhat.com>, Hugh Dickins <hughd@google.com>, 
	Kefeng Wang <wangkefeng.wang@huawei.com>, Matthew Wilcox <willy@infradead.org>, 
	Ryan Roberts <ryan.roberts@arm.com>, linux-kernel@vger.kernel.org, 
	Andrew Morton <akpm@linux-foundation.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Feb 5, 2025 at 2:38=E2=80=AFPM Baolin Wang
<baolin.wang@linux.alibaba.com> wrote:
>
>
>
> On 2025/2/5 09:55, Baolin Wang wrote:
> > Hi Alex,
> >
> > On 2025/2/5 09:23, Alex Xu (Hello71) wrote:
> >> Hi all,
> >>
> >> On 6.14-rc1, I found that creating a lot of files in tmpfs then deleti=
ng
> >> them reliably hangs when tmpfs is mounted with huge=3Dwithin_size, and=
 it
> >> is swapped out to zram (zstd/zsmalloc/no backing dev). I bisected this
> >> to acd7ccb284b "mm: shmem: add large folio support for tmpfs".
> >>
> >> When the issue occurs, rm uses 100% CPU, cannot be killed, and has no
> >> output in /proc/pid/stack or wchan. Eventually, an RCU stall is
> >> detected:
> >
> > Thanks for your report. Let me try to reproduce the issue locally and
> > see what happens.
> >
> >> rcu: INFO: rcu_preempt detected stalls on CPUs/tasks:
> >> rcu:     Tasks blocked on level-0 rcu_node (CPUs 0-11): P25160
> >> rcu:     (detected by 10, t=3D2102 jiffies, g=3D532677, q=3D4997 ncpus=
=3D12)
> >> task:rm              state:R  running task     stack:0     pid:25160
> >> tgid:25160 ppid:24309  task_flags:0x400000 flags:0x00004004
> >> Call Trace:
> >>   <TASK>
> >>   ? __schedule+0x388/0x1000
> >>   ? kmem_cache_free.part.0+0x23d/0x280
> >>   ? sysvec_apic_timer_interrupt+0xa/0x80
> >>   ? asm_sysvec_apic_timer_interrupt+0x16/0x20
> >>   ? xas_load+0x12/0xc0
> >>   ? xas_load+0x8/0xc0
> >>   ? xas_find+0x144/0x190
> >>   ? find_lock_entries+0x75/0x260
> >>   ? shmem_undo_range+0xe6/0x5f0
> >>   ? shmem_evict_inode+0xe4/0x230
> >>   ? mtree_erase+0x7e/0xe0
> >>   ? inode_set_ctime_current+0x2e/0x1f0
> >>   ? evict+0xe9/0x260
> >>   ? _atomic_dec_and_lock+0x31/0x50
> >>   ? do_unlinkat+0x270/0x2b0
> >>   ? __x64_sys_unlinkat+0x30/0x50
> >>   ? do_syscall_64+0x37/0xe0
> >>   ? entry_SYSCALL_64_after_hwframe+0x50/0x58
> >>   </TASK>
> >>
> >> Let me know what information is needed to further troubleshoot this
> >> issue.
>
> Sorry, I can't reproduce this issue, and my testing process is as follows=
:
> 1. Mount tmpfs with huge=3Dwithin_size
> 2. Create and write a tmpfs file
> 3. Swap out the large folios of the tmpfs file to zram
> 4. Execute 'rm' command to remove the tmpfs file

I=E2=80=99m unable to reproduce the issue as well, and am following steps s=
imilar
to Baolin's process:

1) Mount tmpfs with the huge=3Dwithin_size option and enable swap (using
zstd/zsmalloc without a backing device).
2) Create and write over 10,000 files in the tmpfs.
3) Swap out the large folios of these tmpfs files to zram.
4) Use the rm command to delete all the files from the tmpfs.

Testing with both 2MiB and 64KiB large folio sizes, and with
shmem_enabled=3Dwithin_size, but everything works as expected.

Thanks,
Lance

>
> Do you have any reproduction scripts or reproduction steps guide? Thanks.

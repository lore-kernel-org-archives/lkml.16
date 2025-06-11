Received: from mail-lj1-f180.google.com (mail-lj1-f180.google.com [209.85.208.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 19C4A3EA98
	for <linux-kernel@vger.kernel.org>; Wed, 11 Jun 2025 16:07:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749658037; cv=none; b=LiWKqkUdWMgR3PbANGyUEzKkpfQZA53+ZsxTmYHNsYttbGurrkv+q5tAPX6QjMAEEpNp2G1rFHXp7sjEdpi7tn7FMEtDbqGTi+U8dcHSkK1Yx8UPzee+2S3AvA7W/4dXSC0ZgVSwgrT6SKcl20Hxc91+txGs3GswHpCamPAa0zU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749658037; c=relaxed/simple;
	bh=AnyJHhL++25q/RG47chxqn4DLIREpyQ7n2CKRiqDD/w=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=JdOnR/5OQQgmmCx8RTGyi0ebhATiMWtXvodgW/dbXcVoZqySniKASzv32QedsdG6PE8TxhTZchZz9M6znQQ9vGPoIDn0dN/fKHq1s2aMbDrY1GI+w2qSFAJo5A4DxlCpyi5IsTFzX4zZuEdNE+jR79ZFxohLFXmZ4gJLsetKnjY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=gcItYL+2; arc=none smtp.client-ip=209.85.208.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="gcItYL+2"
Received: by mail-lj1-f180.google.com with SMTP id 38308e7fff4ca-32addf54a01so56894021fa.3
        for <linux-kernel@vger.kernel.org>; Wed, 11 Jun 2025 09:07:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1749658034; x=1750262834; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/lOaEEbGcex2RKREBh63AjMstfcYn+UkvC0+JjT1LQo=;
        b=gcItYL+2FM7ZmMQD2vr6vqE0y+QxIi3c4XArs1YhEXo6jmlq8tQV+LJdyxwpjbqpsg
         p3JEksxOH6C5kZjr2dmFiavq0wKotiJ7weFolGDXdnY2lzVdntyzxmduQgaExxcR8L7A
         j6poydbygXXyid9fzIo2W4k08Iho5dGMclx6k9Jo4rS01FwpOvd1M/WNTHwIzKo0hwqo
         pHbqvs2m69VR/hsWpuq0njc6owfLDWTFPe4tyEY9Hnmop7Q5+7mhvVcYxWq6bVF0Us2X
         U0EPU4bjFBCP9SUwFvqGdoh6Iv54E650vpyE4rEL0EJGQKuRD/WVWIX0R5Oj5TvUYNUL
         ktaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749658034; x=1750262834;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/lOaEEbGcex2RKREBh63AjMstfcYn+UkvC0+JjT1LQo=;
        b=pViLrSPNAMFDXSIde1TIlJpL4LjQR59VBH66UawYxUJAUG74RrykqFcM4S350V20vp
         Idv4rwbI3Gig9O8KcwtepGAUZ6isRYj/PqePbPeZCFw+5mhjXCiVvUpN4CmfQKnYQ5Ys
         b1TXxItUkw2KsN71S7RNN3rl3E+9Vd/CBevZ3MZVHvrO4YZKtwxJjFUXwLsOeZXYlkVc
         F1AqUnRr1kJbGLhY8Tz8is+Yjh3zJYegSgOv3TLUomw4fNtTy1NubwoGGTg4ly8C+GzC
         7DmL5e4P9b2PUyMTpqF3ibeZfMA5oicWQMntn1itxFoBwdeIM0WjOkXGinP7y96ugS6u
         EGJg==
X-Forwarded-Encrypted: i=1; AJvYcCUbTCG1CUShfZYzHfjdjXOI5/pA5MpMkOfP69XKQRKiUpfOfOpQ1/lbujRNRPVQvdF/q5IWTqE+sFPPofE=@vger.kernel.org
X-Gm-Message-State: AOJu0YzRXDKWPCb8sJWARqd9AlT9BMKGE64jkpdIL9TQmfhG21QBnk8p
	Bj3gTJ6egFptBsNf3kf7L5/zsQQOBFEag/kQLv+BFbY26PimM1wj0teJ+mEvJTGSM3PMl92ClKe
	ER7Eq8EQmKbVsiXOYYmaPKKWmg2g3WdM=
X-Gm-Gg: ASbGnctSxdrG7OPt1sC93dVIMi5ycSLWfwvQIp2bLn99glj3RqpRkkhWKZbRSj6K1nD
	YxwPE0pgwH7uWLR1Gvlhex/s05Lj4PnZeNaOw/cGSQIa0PDdcrIbW7Q79CKfChlf6xxukWZ8YFk
	eVrIecvLILeylqtPoCK9XlgickAnHmPvcnyS8o6g4wcCA=
X-Google-Smtp-Source: AGHT+IGNGlG+aNsJoJS7p9MAby4PeXXjfTISX9AqQisekrFt2LD9uKzx7WLFPADso6PHLqRJPaaYkWRfwpkVSxZArQY=
X-Received: by 2002:a2e:bc16:0:b0:329:2135:9cb2 with SMTP id
 38308e7fff4ca-32b21e89080mr10519961fa.41.1749658033782; Wed, 11 Jun 2025
 09:07:13 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250610181645.45922-1-ryncsn@gmail.com> <aEj47L/qO+llWcvH@MiWiFi-R3L-srv>
In-Reply-To: <aEj47L/qO+llWcvH@MiWiFi-R3L-srv>
From: Kairui Song <ryncsn@gmail.com>
Date: Thu, 12 Jun 2025 00:06:56 +0800
X-Gm-Features: AX0GCFt4t_8yDOu11d-KG53Oczm6SR3x8UIXqkMwAnKPuK9iGpQph60ayJCC9M0
Message-ID: <CAMgjq7CHMHwCsWZnEPUTg2fq7wRdQAMD3ESGa+GBBp=U0Ld7ag@mail.gmail.com>
Subject: Re: [PATCH v3] mm/shmem, swap: fix softlockup with mTHP swapin
To: Baoquan He <bhe@redhat.com>, Andrew Morton <akpm@linux-foundation.org>
Cc: linux-mm@kvack.org, Hugh Dickins <hughd@google.com>, 
	Baolin Wang <baolin.wang@linux.alibaba.com>, Kemeng Shi <shikemeng@huaweicloud.com>, 
	Chris Li <chrisl@kernel.org>, Nhat Pham <nphamcs@gmail.com>, Barry Song <baohua@kernel.org>, 
	Usama Arif <usamaarif642@gmail.com>, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Jun 11, 2025 at 11:33=E2=80=AFAM Baoquan He <bhe@redhat.com> wrote:
>
> On 06/11/25 at 02:16am, Kairui Song wrote:
> > From: Kairui Song <kasong@tencent.com>
> >
> > Following softlockup can be easily reproduced on my test machine with:
> >
> > echo always > /sys/kernel/mm/transparent_hugepage/hugepages-64kB/enable=
d
> > swapon /dev/zram0 # zram0 is a 48G swap device
> > mkdir -p /sys/fs/cgroup/memory/test
> > echo 1G > /sys/fs/cgroup/test/memory.max
> > echo $BASHPID > /sys/fs/cgroup/test/cgroup.procs
> > while true; do
> >     dd if=3D/dev/zero of=3D/tmp/test.img bs=3D1M count=3D5120
> >     cat /tmp/test.img > /dev/null
> >     rm /tmp/test.img
> > done
> >
> > Then after a while:
> > watchdog: BUG: soft lockup - CPU#0 stuck for 763s! [cat:5787]
> > Modules linked in: zram virtiofs
> > CPU: 0 UID: 0 PID: 5787 Comm: cat Kdump: loaded Tainted: G             =
L      6.15.0.orig-gf3021d9246bc-dirty #118 PREEMPT(voluntary)=C2=B7
> > Tainted: [L]=3DSOFTLOCKUP
> > Hardware name: Red Hat KVM/RHEL-AV, BIOS 0.0.0 02/06/2015
> > RIP: 0010:mpol_shared_policy_lookup+0xd/0x70
> > Code: e9 b8 b4 ff ff 31 c0 c3 cc cc cc cc 90 90 90 90 90 90 90 90 90 90=
 90 90 90 90 90 90 90 66 0f 1f 00 0f 1f 44 00 00 41 54 55 53 <48> 8b 1f 48 =
85 db 74 41 4c 8d 67 08 48 89 fb 48 89 f5 4c 89 e7 e8
> > RSP: 0018:ffffc90002b1fc28 EFLAGS: 00000202
> > RAX: 00000000001c20ca RBX: 0000000000724e1e RCX: 0000000000000001
> > RDX: ffff888118e214c8 RSI: 0000000000057d42 RDI: ffff888118e21518
> > RBP: 000000000002bec8 R08: 0000000000000001 R09: 0000000000000000
> > R10: 0000000000000bf4 R11: 0000000000000000 R12: 0000000000000001
> > R13: 00000000001c20ca R14: 00000000001c20ca R15: 0000000000000000
> > FS:  00007f03f995c740(0000) GS:ffff88a07ad9a000(0000) knlGS:00000000000=
00000
> > CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
> > CR2: 00007f03f98f1000 CR3: 0000000144626004 CR4: 0000000000770eb0
> > DR0: 0000000000000000 DR1: 0000000000000000 DR2: 0000000000000000
> > DR3: 0000000000000000 DR6: 00000000fffe0ff0 DR7: 0000000000000400
> > PKRU: 55555554
> > Call Trace:
> >  <TASK>
> >  shmem_alloc_folio+0x31/0xc0
> >  shmem_swapin_folio+0x309/0xcf0
> >  ? filemap_get_entry+0x117/0x1e0
> >  ? xas_load+0xd/0xb0
> >  ? filemap_get_entry+0x101/0x1e0
> >  shmem_get_folio_gfp+0x2ed/0x5b0
> >  shmem_file_read_iter+0x7f/0x2e0
> >  vfs_read+0x252/0x330
> >  ksys_read+0x68/0xf0
> >  do_syscall_64+0x4c/0x1c0
> >  entry_SYSCALL_64_after_hwframe+0x76/0x7e
> > RIP: 0033:0x7f03f9a46991
> > Code: 00 48 8b 15 81 14 10 00 f7 d8 64 89 02 b8 ff ff ff ff eb bd e8 20=
 ad 01 00 f3 0f 1e fa 80 3d 35 97 10 00 00 74 13 31 c0 0f 05 <48> 3d 00 f0 =
ff ff 77 4f c3 66 0f 1f 44 00 00 55 48 89 e5 48 83 ec
> > RSP: 002b:00007fff3c52bd28 EFLAGS: 00000246 ORIG_RAX: 0000000000000000
> > RAX: ffffffffffffffda RBX: 0000000000040000 RCX: 00007f03f9a46991
> > RDX: 0000000000040000 RSI: 00007f03f98ba000 RDI: 0000000000000003
> > RBP: 00007fff3c52bd50 R08: 0000000000000000 R09: 00007f03f9b9a380
> > R10: 0000000000000022 R11: 0000000000000246 R12: 0000000000040000
> > R13: 00007f03f98ba000 R14: 0000000000000003 R15: 0000000000000000
> >  </TASK>
> >
> > The reason is simple, readahead brought some order 0 folio in swap cach=
e,
> > and the swapin mTHP folio being allocated is in confict with it, so
>                                                   ^^^typo, conflict
>

Nice catch, thanks!

Hi Andrew, it's only one typo in the commit message here, will you
help update the commit message while merging it or should I send a new
version?

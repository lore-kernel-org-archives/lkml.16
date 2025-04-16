Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com [209.85.214.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7335423C8CB
	for <linux-kernel@vger.kernel.org>; Wed, 16 Apr 2025 22:30:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744842630; cv=none; b=oR2ejkypDrtwCLLR3y9oRNzsb0VTfgaTm23yp+QLAmxcCPsCMUBlCK1Z9aNfdPpnEnQ91IJh2mYnntUcf3ZXTsKSwVsoBXTbirEx/DzufsJhpc5ZnfvT0Q97m0g6LuiSTFBUO0dIEC0ZrAueDKKs/Qq2Rh632af6qws7ui2rrEw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744842630; c=relaxed/simple;
	bh=MPVCVS5EIDloMkwegAhAEvIZ3bIKWpMIJfYkR8t3UUQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=CrDbgLe7wUbW0BlPOSdVD2scVIQeZXh8tzw0VOpj69vinVzFkuK0TAcE9iQJ1ncDJFiF38A0qZYkRU10ujPpKXupmiRqOc9lId32sU6/8YK4C5G/cBt0rIrqemBCFIvArBelH1WALGDDwGzpGd4uso4CkkmECj/Lif+fcHCufRo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=purestorage.com; spf=fail smtp.mailfrom=purestorage.com; dkim=pass (2048-bit key) header.d=purestorage.com header.i=@purestorage.com header.b=gvvA14F0; arc=none smtp.client-ip=209.85.214.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=purestorage.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=purestorage.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=purestorage.com header.i=@purestorage.com header.b="gvvA14F0"
Received: by mail-pl1-f172.google.com with SMTP id d9443c01a7336-2240b4de10eso375715ad.1
        for <linux-kernel@vger.kernel.org>; Wed, 16 Apr 2025 15:30:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=purestorage.com; s=google2022; t=1744842627; x=1745447427; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XfRJOJ9CRsHZJefMhleN5QEhzGV0ETX7MtMvPUoW28c=;
        b=gvvA14F0Kau2L3+XYbsglsV11/yJ+ywMP2CsH03c9VrBBP6PByLxZS/EY+4xGE9rrq
         STRLX2XLF6exnc8Bl/Q2aDkt1Z+aZLbxojyVlCgBy5oUnvWDUFNuwecluXuxSfq64jmQ
         hls9xXdG4Hkbz1CgLVYyZk9hoUaRiFEoPrTONIOJnTOpIvrYADMsZpnDklypkyuRhPbA
         hMhYFUnQhK7dikvgpPDDjP+8PN+9k400wZh80EIcT4Jx+OxJWfkYOOMy00PJTH5hSQis
         AOipkYDyrjOwY49YxW9QMQa9h6GhrFmWdSXrLJJzTv7nlPlJt87u79WIRLaDRIZvEbSB
         2+6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744842627; x=1745447427;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=XfRJOJ9CRsHZJefMhleN5QEhzGV0ETX7MtMvPUoW28c=;
        b=RkvUXZL6BXfK+a5//efMOTWQBxK2YqafCvxDhe5VEiIFAddwLyKrpfoI/GNFmx3AAx
         bfMehYNPW7foNCNtBQ0/k/rE6Spf2huIzZk7kn6/Yb7PGPURojBnnNsge7jqXTP9wqMJ
         jNdHMK3ytge80brsz0zhxuxSvwLSWvePS284GomvdwvT79HnTebjb4K9berpOaqnXMQ9
         BYbDXZSxCmT78KvaDW0wwOxmaca1kVxmgCnUI/SgsRdwZjYbGnPdSR7KJjNz9Dzhra9b
         dlbk9SXTjpRvNHURGCA+5wjjdrlxjXJFZYZKRVtUNuaAbwDwdT6mZ4FeLvmyFlHY+uVC
         mEDA==
X-Forwarded-Encrypted: i=1; AJvYcCUyUkF0n0zPpQpXd/GiLeqFGZjpdBtmdXPYRxe9SRdcGLTMohXt23T/lp8Y44Tco8mvJ6QuqynaV7FQJek=@vger.kernel.org
X-Gm-Message-State: AOJu0YwqFLk3VxJTNfHm9cTb4Vwfv76S/YvOLx0WiSP4XW3L94II+s5Q
	C4C49AXwI43pjjR2COKH4S4ZvrUnJRW88q7tQZU9eBllanRvJdVHajUJkFzHcsPIxWp8obq8qX7
	nWTgXA2rvv5Pn8/j2kO+/UxDYmd5QURX2Tf4eNQ==
X-Gm-Gg: ASbGncsJ5LeOomPSvSvEyjwwfNCOCwVEIjW+nuRE9b9P2I9gj8PtOcyRA0c7LHP5WMb
	Xpil1RyiOoxoE4aFSZ4bjmy4UqYY7qsgm3Rv3UdTYcNX5/nlo+XpQfwQsq0rtuMB/+zuJeF17RZ
	Hir2BVThz0Trqcbt/R9Z+muvyc
X-Google-Smtp-Source: AGHT+IFPCjiCP4UFzZ0MkuOGd+hSWcQBivXnxmbuOQEvtCyO5XP28tMDmUgVwNQMpakN6HjgMHswlg1t+ZtZyAQy8wk=
X-Received: by 2002:a17:90b:3ece:b0:2ff:5540:bb48 with SMTP id
 98e67ed59e1d1-3086d477001mr818376a91.8.1744842626698; Wed, 16 Apr 2025
 15:30:26 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250416160615.3571958-1-csander@purestorage.com> <20250416150529.1e24677e3798cd783f4adb8f@linux-foundation.org>
In-Reply-To: <20250416150529.1e24677e3798cd783f4adb8f@linux-foundation.org>
From: Caleb Sander Mateos <csander@purestorage.com>
Date: Wed, 16 Apr 2025 15:30:15 -0700
X-Gm-Features: ATxdqUFBl5hBWIF_oWQiK-ZiCgPwok2zNFOKH2CPgKufEkvUGI0fDCz9XU9nTSs
Message-ID: <CADUfDZpH5v8jxphVRGvD5o-jLXiDbTw0SsAxzTSCLGyua9erjQ@mail.gmail.com>
Subject: Re: [PATCH] scatterlist: inline sg_next()
To: Andrew Morton <akpm@linux-foundation.org>
Cc: linux-mm@kvack.org, linux-block@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Eric Biggers <ebiggers@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Apr 16, 2025 at 3:05=E2=80=AFPM Andrew Morton <akpm@linux-foundatio=
n.org> wrote:
>
> On Wed, 16 Apr 2025 10:06:13 -0600 Caleb Sander Mateos <csander@purestora=
ge.com> wrote:
>
> > sg_next() is a short function called frequently in I/O paths. Define it
> > in the header file so it can be inlined into its callers.
>
> Does this actually make anything faster?
>
> net/ceph/messenger_v2.c has four calls to sg_next().  x86_64 defconfig:

Hmm, I count 7 calls in the source code. And that excludes possible
functions defined in included header files that also call sg_next().
And the functions which call sg_next() could themselves be inlined,
resulting in even more calls. The object file looks to have 7 calls to
sg_next():
$ readelf -r net/ceph/messenger_v2.o | grep -c sg_next
7

>
> x1:/usr/src/25> size net/ceph/messenger_v2.o
>    text    data     bss     dec     hex filename
>   31486    2212       0   33698    83a2 net/ceph/messenger_v2.o
>
> after:
>
>   31742    2212       0   33954    84a2 net/ceph/messenger_v2.o
>
> More text means more cache misses.  Possibly the patch slows things down?=
?

Yes, it's true that inlining doesn't necessarily improve performance.
For reference, the workload I am looking at is issuing 32 KB NVMe
reads, which results in calling sg_next() from nvme_pci_setup_prps().
About 0.5% of the CPU time is spent in sg_next() itself (not counting
the cost of calling into it).
Inlining the function could help save the cost of the call + return,
as well as improve branch prediction rates for the if (sg_is_last(sg))
check by creating a separate copy of the branch in each caller.
My guess is that most workloads (like mine) don't call sg_next() from
all that many places. So even though inlining would duplicate the code
into all callers, not all the callers are hot. The number of locations
actually loaded into the instruction cache are likely to be relatively
few, so the increase in cached instructions wouldn't be as steep as
the text size suggests.
That's all to say: the costs and benefits are workload-dependent. And
in all likelihood, they will be pretty small either way.

Best,
Caleb

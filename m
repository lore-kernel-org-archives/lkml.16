Received: from mail-yw1-f181.google.com (mail-yw1-f181.google.com [209.85.128.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 070C31E9B06
	for <linux-kernel@vger.kernel.org>; Fri,  4 Apr 2025 13:37:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743773849; cv=none; b=OUqiNZhyqjgenwNens0Fpfk258EubTowYNCGXwVsfC9sD6BP1cSujDjuaYFQmboalr8NGnpbkt6/G8MA2qbg7eBZ0I+NlhiQLJ+IJmj4y5V0IRIXkkQpbROSlEmj7n2LlBdlf7g2qxniUI1lzrPI3BQr8DnszeexCWVpEUWIwTE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743773849; c=relaxed/simple;
	bh=NuVsaJvg0QOtGpDbYv9ickHpkPwNziXJ+FWb6yYn5tw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=gbzEDww2bT9ZtS1aBjuv7HvClNgkSrIPf7NfS2LoRn459NIMBuCX33oiU+EtR/9147cjvW9BY4GETrlvYsbPaNo6lnCc9JKmII1IMBL/iXyIjCSbQBke0Ibxd9JULXMUt2+8ySZcKZ6vFs5J+YM5DFjODJitVRL0aWNDiiZcHdg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=SbYNXi6K; arc=none smtp.client-ip=209.85.128.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="SbYNXi6K"
Received: by mail-yw1-f181.google.com with SMTP id 00721157ae682-6f768e9be1aso36529777b3.0
        for <linux-kernel@vger.kernel.org>; Fri, 04 Apr 2025 06:37:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1743773845; x=1744378645; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GxbZagmBwC/wl/GfsJMJrzVX6h8neaRQ1Nn+nU+FoIg=;
        b=SbYNXi6KPN6+k7vr3RBDCCvIlMd76cgxneMmZzLDpwd4U4a8ixj33qhKASV8lhh1C/
         furNS/rXbI74ptd/ad949W9+Nhs0otVLCfqAIwJF0xeNFD8W9/4iq1lxFvRLlXM9wz87
         VD2Y8UXdxB07AhSiYcUWQgaUvHaxcv4FwX1j1uBo6Tt4P8p3z+1U2MwjPmXJoDTbjnlK
         Xl237bovnyveZeI1X4ObsuzTyoK+Zh4x1VupC/0Pmkf+eGzKGKVqizQ8TZAxKnb/LJbm
         GnvQNxH3nIGxcdSTyAjfJd1Uwjjx6X1mtdmX7sPz0GLJjfVnYAyu38svE1xbXNy5AZhl
         2mTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743773845; x=1744378645;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=GxbZagmBwC/wl/GfsJMJrzVX6h8neaRQ1Nn+nU+FoIg=;
        b=J3YbmPoNeyUOlOnWGsAxTmcrfl2u0yO+YvZtAUT2ZnBPiomscKAfBIRyKxWoujF5v8
         3KL7RKk2KbB5vpVHb68w+UfwT28K7V9X7KeOSPkUSI3BCRKHWS26SQ10nUUVAdjpm7Ds
         EU7JIB8wu9rnngUpp7+LWMMU/yfMW5eAFX2nmL1ldN1+HII0J4mWVq9vV+D3vN0cJu0+
         w2Pvjc5VUKIv+t0EFrWLor0wHdcmzY4yqo9PynPpyGnhbscOUxlhAdaBGmngHorc2968
         yiG1AJnElz9sJP4rJlo/adI239zRFCj6Hp0+k6615LM/wC11FUgK/7JAK+zLHtIzdPME
         DZKQ==
X-Forwarded-Encrypted: i=1; AJvYcCUgS9GijcoJsP/V0eVWtezUTZwV2j8UVN55u9NnNmYItE2Grwf8+HI4bvt94V1Ww9ghgY9KzfI2s4KhNM0=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz7BSkISc4/PBJrjgGP1v8GuH4FWeMks1YfkVah2YJX3u6kQmWT
	zT8Ckg5nFK0ELBhSm/11iI26HV8EF1RJc5Hpw1U1pM6NUOGAS5abxaUe69nnplEs63kiQX0aNXk
	NEpcOLYU+bfLSjWPkEyZnmC742ZF+VRyXfx/PjfcrjCso7t7kskq4fjw=
X-Gm-Gg: ASbGncvRMmgVg0kS1X9V8V0eC/Zy2qOD7d7ubVT7SrYg2gud/a8Xr3uyn2b8wvrSwtf
	ywOJb+JLR9fZGNHaSE095WaZOovg9vwSfpU/372XJrefec4207Y8oq1CJfAnGPxDx1yRtbWBvvl
	tETquSsEKG/O3mT64jXyiMVBA=
X-Google-Smtp-Source: AGHT+IE49jluc25XCC6KwW5XyS869R0j51R9CEaS+F33GdMhH1lt50gslQleZPCt8DrKu2m5zayZ2fbtZ4GKxdJ0g1A=
X-Received: by 2002:a25:d648:0:b0:e64:3f66:90b8 with SMTP id
 3f1490d57ef6-e6e1ce8a9a0mr4831050276.3.1743773844689; Fri, 04 Apr 2025
 06:37:24 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250328142055.313916d1@fangorn> <20250403150055.94a38bc7e6e3f618fbc23ddd@linux-foundation.org>
In-Reply-To: <20250403150055.94a38bc7e6e3f618fbc23ddd@linux-foundation.org>
From: Vinay Banakar <vny@google.com>
Date: Fri, 4 Apr 2025 08:37:13 -0500
X-Gm-Features: ATxdqUFlRYmMZcSEAkjFOm9V1cNcKDKC2DRLB8Q1RsZAL3bqsppVl5Z_t8nQsAw
Message-ID: <CALf+9Ye0zKcAQq2eKGkBPCxReaUJxaCar3K8PvvOUGnLOT2sAQ@mail.gmail.com>
Subject: Re: [PATCH v2] mm/vmscan: batch TLB flush during memory reclaim
To: Andrew Morton <akpm@linux-foundation.org>
Cc: Rik van Riel <riel@surriel.com>, linux-mm@kvack.org, linux-kernel@vger.kernel.org, 
	kernel-team@meta.com, liuye <liuye@kylinos.cn>, Hugh Dickins <hughd@google.com>, 
	Mel Gorman <mgorman@techsingularity.net>, Yu Zhao <yuzhao@google.com>, 
	Shakeel Butt <shakeel.butt@linux.dev>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Apr 3, 2025 at 5:00=E2=80=AFPM Andrew Morton <akpm@linux-foundation=
.org> wrote:
> Were any runtime benefits observable?

I had replied as follows on another chain related to this patch:

Yes, the patch reduces IPIs by a factor of 512 by sending one IPI (for TLB
flush) per PMD rather than per page. Since shrink_folio_list()
usually operates on one PMD at a time, I believe we can safely batch
these operations here, but I would appreciate your feedback on this.

Here's a concrete example:
When swapping out 20 GiB (5.2M pages):
- Current: Each page triggers an IPI to all cores
  - With 6 cores: 31.4M total interrupts (6 cores =C3=97 5.2M pages)
- With patch: One IPI per PMD (512 pages)
  - Only 10.2K IPIs required (5.2M/512)
  - With 6 cores: 61.4K total interrupts
  - Results in ~99% reduction in total interrupts

Application performance impact varies by workload, but here's a
representative test case:
- Thread 1: Continuously accesses a 2 GiB private anonymous map (64B
chunks at random offsets)
- Thread 2: Pinned to different core, uses MADV_PAGEOUT on 20 GiB
private anonymous map to swap it out to SSD
- The threads only access their respective maps.
Results:
  - Without patch: Thread 1 sees ~53% throughput reduction during
swap. If there are multiple worker threads (like thread 1), the
cumulative throughput degradation will be much higher
  - With patch: Thread 1 maintains normal throughput


On Thu, Apr 3, 2025 at 5:00=E2=80=AFPM Andrew Morton <akpm@linux-foundation=
.org> wrote:
>
> On Fri, 28 Mar 2025 14:20:55 -0400 Rik van Riel <riel@surriel.com> wrote:
>
> > The current implementation in shrink_folio_list() performs a full TLB
> > flush for every individual folio reclaimed. This causes unnecessary
> > overhead during memory reclaim.
> >
> > The current code:
> > 1. Clears PTEs and unmaps each page individually
> > 2. Performs a full TLB flush on every CPU the mm is running on
> >
> > The new code:
> > 1. Clears PTEs and unmaps each page individually
> > 2. Adds each unmapped page to pageout_folios
> > 3. Flushes the TLB once before procesing pageout_folios
> >
> > This reduces the number of TLB flushes issued by the memory reclaim
> > code by 1/N, where N is the number of mapped folios encountered in
> > the batch processed by shrink_folio_list.
>
> Were any runtime benefits observable?

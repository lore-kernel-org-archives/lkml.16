Received: from mail-ej1-f49.google.com (mail-ej1-f49.google.com [209.85.218.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A5B3224B03
	for <linux-kernel@vger.kernel.org>; Fri,  2 May 2025 11:23:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746185011; cv=none; b=hdXixWJt8YiHcHpfD9uGxpgVuQnxWVBwQCS8X3sP0fwvrWkrnyFWGyelFA2oyQUD7/hjXVh74HLodc48uxzmRTShDK1jbQ2u2+0ES8i/GHpr/Fj5EUSNteRnG0/w+Xdxe4xO39VdxqeWL6UU+bvZ+FLlmyGsloFBZYcB5nmSXjE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746185011; c=relaxed/simple;
	bh=/8HjksHxnR/LYWVqNif9GxKSelg3nmmTb3Hq2VrAvkc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=JPSIdZ2ZQdlWQSlDthVSoqCEgoXMC83gZGHF9n0pRL7Ywh8qzEpYNaIbdQhSrh2rGpTUs+hLaqgdBvxjNguPg2qoKXE0T/fcXpL4g4Cj5S3FSXbdrMrstvU2X4QXfTTjL+itWRWTdkIFWZYR/t7EwZvuBDk6s8H8MpRVAPEfHy4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=UIq+AH4A; arc=none smtp.client-ip=209.85.218.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="UIq+AH4A"
Received: by mail-ej1-f49.google.com with SMTP id a640c23a62f3a-ac3fcf5ab0dso301927166b.3
        for <linux-kernel@vger.kernel.org>; Fri, 02 May 2025 04:23:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1746185007; x=1746789807; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=kbObYtDFx1qro1bvSu2kf9oWhwh2pZ6u6GB8eCByqt4=;
        b=UIq+AH4A3aBH1zasRm1+GKpkM+tUMuTsSCFDdCOQc7PNZmonNYmH4TX6eaH/00ziVj
         vpQtOzeJvOn9gmkn0Gz9hbrnb0Wto5rPthd1/44Q8ivtvx2HxkMkB3cGyCaVUJq+4GuZ
         6plsTMM85VoyI8413nii/ieaXuZ87GHGHPJCGPPK+IvjxOUBSEDd9eYLgC6FtEdVqGKU
         adONr+vW2o+c5H1CE/aGSnnWu5oVjqcBMp7bYwD2VdZsEmmPi2zD6q0Ej8mT5/3zvb/U
         FOh71OXDkNOA3GNP+TVG6ZBDwg/3mnF8xCVfVql5sVT7y4W7jQBox/I1lDornUvwLe8Y
         TaKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746185007; x=1746789807;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=kbObYtDFx1qro1bvSu2kf9oWhwh2pZ6u6GB8eCByqt4=;
        b=KcgoWTBEzR83t5UXpew4g+5Y2Na+Ic+WCoFG+vNAm+VT0Q03NdzxUSxIA5z9UHXtTl
         9GXp+Yb2YTzwL/BmI7GRxG5YDaP8KGYOnW69TTss3jZmcggA28WiFvQ7cWw7YXMbBGaX
         iQ4NjajqlCo0BMd6xW9rX9hd2Y1DPRypnDle5pSVUEkLXOh+BEqIdAM87vc++g/0nxlX
         GqChnRCooO1IXNnf9tRlYuv45dl0lu5KGzRnGNY3xZ9zQjVXfxtS1hc3OjqinQbXuH2N
         0GnMUTIOAQR3IaEGVFH428y6JSDwQvZyNir+w3qCxAI5eA8D1WV4BwxVOdeDUoFpN60E
         beLQ==
X-Forwarded-Encrypted: i=1; AJvYcCXpzWKSNv2Ry/qoUos6ULQ5IH+fwyvBn81y4P39vgBldNkHKgqFu2Hpa7NtA09Ai41C2gPGEWyPT+j/BIk=@vger.kernel.org
X-Gm-Message-State: AOJu0YyNONY0cNjh7Ux58uzddbHM3V/JZTCuEIZIqt1CdlzkfVean7hB
	m3BHDnNWzT+8Vwy4uZVA7UufNlyGsI7JJqJdrDDv3SauzDrAl0ZGnYPv/LeERxvZj7ng7dh9ix0
	b86IICSCU4yAbolMHD60BzahtF138aDrnX7apyw==
X-Gm-Gg: ASbGncuj61RkLq0jZFcRR34sW0Y95tASTIYmMWEWIHR2hRu2biaRxpQYOoucSCukhZg
	ekOj+cdLeojbU0bUcHLbhi6NvyukB462Z+/UGkiRJf0WiW9AC9uza1Chj2mVvEhHa0AOjHoaJHx
	QLPb0jUjCg4AwmkqCalL/9
X-Google-Smtp-Source: AGHT+IGcHZhjWLByBsMxPMPruZs0xWBL5PKE+RQGiE6tacXkOtMX3cecKZVa20XY0Ly27mWWYpAz6Vbn3JDoG9Qnmag=
X-Received: by 2002:a17:906:ba83:b0:ac7:95b5:f5d1 with SMTP id
 a640c23a62f3a-ad17af4f980mr196136366b.42.1746185006625; Fri, 02 May 2025
 04:23:26 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250429151800.649010-1-neelx@suse.com> <20250430080317.GF9140@twin.jikos.cz>
 <CAPjX3FfBoU9-wYP-JC63K6y8Pzocu0z8cKvXEbjD_NjdxWO+Og@mail.gmail.com>
 <CAPjX3FdpjOfu61KTnQFKdGgh4u5eVz_AwenoPVNgP_eiuka3hw@mail.gmail.com> <20250502103014.GN9140@suse.cz>
In-Reply-To: <20250502103014.GN9140@suse.cz>
From: Daniel Vacek <neelx@suse.com>
Date: Fri, 2 May 2025 13:23:15 +0200
X-Gm-Features: ATxdqUFsCAE23vInO_k8SiCRrPA6hEZ9aX390SzLq56qcaA2sgLYgWUY9M-tHYY
Message-ID: <CAPjX3FeNcwQrBofsHppQpua7e7UwbwRAKKaz0KHS9ypEfntTDA@mail.gmail.com>
Subject: Re: [PATCH] btrfs: remove extent buffer's redundant `len` member field
To: dsterba@suse.cz
Cc: Chris Mason <clm@fb.com>, Josef Bacik <josef@toxicpanda.com>, David Sterba <dsterba@suse.com>, 
	linux-btrfs@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Fri, 2 May 2025 at 12:30, David Sterba <dsterba@suse.cz> wrote:
>
> On Wed, Apr 30, 2025 at 02:31:33PM +0200, Daniel Vacek wrote:
> > On Wed, 30 Apr 2025 at 10:21, Daniel Vacek <neelx@suse.com> wrote:
> > >
> > > On Wed, 30 Apr 2025 at 10:03, David Sterba <dsterba@suse.cz> wrote:
> > > >
> > > > On Tue, Apr 29, 2025 at 05:17:57PM +0200, Daniel Vacek wrote:
> > > > > Even super block nowadays uses nodesize for eb->len. This is since commits
> > > > >
> > > > > 551561c34663 ("btrfs: don't pass nodesize to __alloc_extent_buffer()")
> > > > > da17066c4047 ("btrfs: pull node/sector/stripe sizes out of root and into fs_info")
> > > > > ce3e69847e3e ("btrfs: sink parameter len to alloc_extent_buffer")
> > > > > a83fffb75d09 ("btrfs: sink blocksize parameter to btrfs_find_create_tree_block")
> > > > >
> > > > > With these the eb->len is not really useful anymore. Let's use the nodesize
> > > > > directly where applicable.
> > > >
> > > > I've had this patch in my local branch for some years from the times we
> > > > were optimizing extent buffer size. The size on release config is 240
> > > > bytes. The goal was to get it under 256 and keep it aligned.
> > > >
> > > > Removing eb->len does not change the structure size and leaves a hole
> > > >
> > > >  struct extent_buffer {
> > > >         u64                        start;                /*     0     8 */
> > > > -       u32                        len;                  /*     8     4 */
> > > > -       u32                        folio_size;           /*    12     4 */
> > > > +       u32                        folio_size;           /*     8     4 */
> > > > +
> > > > +       /* XXX 4 bytes hole, try to pack */
> > > > +
> > > >         long unsigned int          bflags;               /*    16     8 */
> > > >         struct btrfs_fs_info *     fs_info;              /*    24     8 */
> > > >         void *                     addr;                 /*    32     8 */
> > > > @@ -5554,8 +5556,8 @@ struct extent_buffer {
> > > >         struct rw_semaphore        lock;                 /*    72    40 */
> > > >         struct folio *             folios[16];           /*   112   128 */
> > > >
> > > > -       /* size: 240, cachelines: 4, members: 14 */
> > > > -       /* sum members: 238, holes: 1, sum holes: 2 */
> > > > +       /* size: 240, cachelines: 4, members: 13 */
> > > > +       /* sum members: 234, holes: 2, sum holes: 6 */
> > > >         /* forced alignments: 1, forced holes: 1, sum forced holes: 2 */
> > > >         /* last cacheline: 48 bytes */
> > > >  } __attribute__((__aligned__(8)));
> > > >
> > > > The benefit of duplicating the length in each eb is that it's in the
> > > > same cacheline as the other members that are used for offset
> > > > calculations or bit manipulations.
> > > >
> > > > Going to the fs_info->nodesize may or may not hit a cache, also because
> > > > it needs to do 2 pointer dereferences, so from that perspective I think
> > > > it's making it worse.
> > >
> > > I was considering that. Since fs_info is shared for all ebs and other
> > > stuff like transactions, etc. I think the cache is hot most of the
> > > time and there will be hardly any performance difference observable.
> > > Though without benchmarks this is just a speculation (on both sides).
> > >
> > > > I don't think we need to do the optimization right now, but maybe in the
> > > > future if there's a need to add something to eb. Still we can use the
> > > > remaining 16 bytes up to 256 without making things worse.
> > >
> > > This really depends on configuration. On my laptop (Debian -rt kernel)
> > > the eb struct is actually 272 bytes as the rt_mutex is significantly
> > > heavier than raw spin lock. And -rt is a first class citizen nowadays,
> > > often used in Kubernetes deployments like 5G RAN telco, dpdk and such.
> > > I think it would be nice to slim the struct below 256 bytes even there
> > > if that's your aim.
> >
> > Eventually we can get there by using ushort for bflags and moving
> > log_index and folio_shift to fill the hole.
> > Let me know what you think.
>
> The bflags are atomic bits and this requires unsigned long. Also the

I realized and dropped that idea. Which means we can save just 8 bytes
on -rt and nothing on default config. Still a good win for free. I
mean in case we end up removing the `len` field.

> short int type is something we want to avoid because it's not a natural
> type on many architectures and generates worse code. I don't think we
> need to optimize for RT kernels, it's now part of mainline kernel but by
> far not a common configuration.

Received: from mail-yw1-f174.google.com (mail-yw1-f174.google.com [209.85.128.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0479B1E89C
	for <linux-kernel@vger.kernel.org>; Thu,  5 Jun 2025 07:41:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749109296; cv=none; b=RvdDCt+2+GIrWm57vXkxrRedPHDiFp1KRGGrLP48NHsE8C1MT/wgLAvtcWiB/6z8XKIZSB1l/DwPxeslzTfROcmy0kkcg6CbcumGo73K5AqysFFXbHMADd+ugedwCaYPEX+K4+ZaNNkpb/9fW/UWe74P3mb2Rbzt/qEmQAcmU8g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749109296; c=relaxed/simple;
	bh=y1PCGFlWWPF3JvL3K1/6MNl0+ee8mQIKVLCRzu/rCdk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ToOFXFn8O+HJ5dZiJ9DqCjFnZD7RiOYTHtjzCuR2E/cXjsaMfufYAcJH3UetoNIs9hRsRgRq370bWxWZ+cbFj0KFXIatsLLWjTU7kI7k5At4QJUyPZ2NbxhXBcnSTD1hjvTt+viURvwV8U5pJbU++O9p8ksBCv3IH8jHb1iPQD0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tomeuvizoso.net; spf=pass smtp.mailfrom=tomeuvizoso.net; dkim=pass (2048-bit key) header.d=tomeuvizoso-net.20230601.gappssmtp.com header.i=@tomeuvizoso-net.20230601.gappssmtp.com header.b=AvtEnnUF; arc=none smtp.client-ip=209.85.128.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tomeuvizoso.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tomeuvizoso.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tomeuvizoso-net.20230601.gappssmtp.com header.i=@tomeuvizoso-net.20230601.gappssmtp.com header.b="AvtEnnUF"
Received: by mail-yw1-f174.google.com with SMTP id 00721157ae682-70e3e0415a7so7045447b3.0
        for <linux-kernel@vger.kernel.org>; Thu, 05 Jun 2025 00:41:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tomeuvizoso-net.20230601.gappssmtp.com; s=20230601; t=1749109293; x=1749714093; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DGC12m9VHJaicWgWsYknA1yUSyETrOF70heDVG+923I=;
        b=AvtEnnUFiCbqdKUJR/5y8se9zttMaZFrP48dR46QN4PvDk2YEm1I4y1LfiFISV6D6Y
         pnlIj6d3bYFhWLImoUo7Rhit5Ob6E7iTbCowLrqn30IcIVufa6Fgh4/p/+vUqv8cQaBM
         AyurBErJyDnZy6MXcdYSDP9sSRGxEajFNHlvI8MiQ26zF4X3OQof8jRRMtuWNOgmm4zT
         oSwSJ9uDJHjhmMEqgS0crNvXrClSJcTgSs3+FxJ65DtspcGv8/rDrIHGR02hdgSq5O61
         tTxSpuYJHamlbucy2xgqpfnPZ6ItOMsQatjetBlbIN9BvTHx8Qbyn9zYXrQOXVUrLO69
         pH8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749109293; x=1749714093;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=DGC12m9VHJaicWgWsYknA1yUSyETrOF70heDVG+923I=;
        b=ecreYzzcSsDj+frRftXn0nTVXm2SjZS5t/q41+61xvEkCuRMqPBw+9hrmL2mPUYgrm
         9UJWtSWiatjDZKmWcGyiT81u2VeDnsUhadHbAUy+jUOvW6PUTXBwZIXXMQOPm1eQiQgb
         lwLqFhmo2Qte88CWlDjFDXM4H0YgIMX3dV4UCggfLZSfd1WtRABumpmPp456M7fUu6m3
         PZjDjG5igl4/2BSbUHLY8bzMBVSdg5U998ZRPSTJnaoctD/ZsRpzVFr/iawvf9vrjSE4
         PqtXWEEgTAR2NAr3vidInyR7NYDLcOhQX1rRd4vaC4vS/BYOb9pjnpPgQiQgozoH1SZl
         gUSw==
X-Forwarded-Encrypted: i=1; AJvYcCWHpGzJYJTkL3ZIK8wOnTxQpcyXaitUXilNdLkPKuQ79qpxVQjiLDEIAFRYjPppfUu0m4NSiEontOcwHkE=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw99wHZYFerEUThlHL2UkTU1l3m49Cxj2K9HwrAO9A238KvdAtK
	m8Btec8FHnWYeBrIL9SBbGvLY+1MYm4qm6vdkpoyTXHa+ERsC9sILfU6bp2xivURCjIRhJN8oQi
	Xhbxbk3YMzg==
X-Gm-Gg: ASbGncvdTQapW8jaEyKdG8Qya9cxXsjLmr2Ke/15BYNDUls0V0DvSmiek8jyCfTSF/w
	Kf7QLJ829cDCvxA/wGwS/0tot7+U85giOgFQt4DhxzMlz7O6VE+U0BqZW5rZMZtFDNjzpPMDOhP
	Cw0m8dAF28GcL2S3skLA3JKxCXOhIeKy4gXFa0StliNVtPZbFo8yyu5TPXBfi/cfgtGBkkX6TwI
	cCKwFVkOzLTKh1/6yrVOOTX4lOJQ/H1Aos9rv+OWV7JebZpI4V4TxB4d4dhUk+XWAHEx+F9YpO0
	6Y8ytBctAaYG3LKGSSkpR57zkaOSIP5l0OLkg/n5QAGY69bwlY8d6yQeJWdV/LVc707pfYxZAjt
	JLXTmfgGou8QuAluVS5U=
X-Google-Smtp-Source: AGHT+IHSJQoOVDMsY5oOs2JgiDzu6MEMr27+gFA96Ya7nkRDGs1fqMFbGKKIQ41a/6AmuF3Kn2zMMA==
X-Received: by 2002:a05:690c:6ac7:b0:70e:2063:a5dd with SMTP id 00721157ae682-710e7dcfd84mr36042057b3.8.1749109292708;
        Thu, 05 Jun 2025 00:41:32 -0700 (PDT)
Received: from mail-yb1-f169.google.com (mail-yb1-f169.google.com. [209.85.219.169])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-70f9fcdae38sm29580447b3.50.2025.06.05.00.41.32
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 05 Jun 2025 00:41:32 -0700 (PDT)
Received: by mail-yb1-f169.google.com with SMTP id 3f1490d57ef6-e7db5c13088so635980276.1
        for <linux-kernel@vger.kernel.org>; Thu, 05 Jun 2025 00:41:32 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCVhsFcr3cDmJa3Q33V8iKediXAKfaCQdI2GJJ5AGIJVD8TH97+/PlN3MxXIM4UUCNhUN6nCAedYp3Wx9eM=@vger.kernel.org
X-Received: by 2002:a05:6902:1387:b0:e7d:c621:33d1 with SMTP id
 3f1490d57ef6-e81882c7d19mr3544074276.14.1749109291936; Thu, 05 Jun 2025
 00:41:31 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250604-6-10-rocket-v6-0-237ac75ddb5e@tomeuvizoso.net>
 <20250604-6-10-rocket-v6-6-237ac75ddb5e@tomeuvizoso.net> <CAPj87rPv7Pd5tbXhpRLaUJCGB8JmD4kfF50WRsEiST2gvtg3Bg@mail.gmail.com>
 <cc21a090-801d-4b32-bac2-01cebf896c85@arm.com>
In-Reply-To: <cc21a090-801d-4b32-bac2-01cebf896c85@arm.com>
From: Tomeu Vizoso <tomeu@tomeuvizoso.net>
Date: Thu, 5 Jun 2025 09:41:21 +0200
X-Gmail-Original-Message-ID: <CAAObsKDMhuqYtn=+xR6-n=Uk+5_rU91OqVKyQ5cxhqfTo5svjg@mail.gmail.com>
X-Gm-Features: AX0GCFucQ_FiqAlA0rjsUQpt2JT7jK-lOTeRvMqo5HOGrCT-6j2Gn-ED1Jn3Rvg
Message-ID: <CAAObsKDMhuqYtn=+xR6-n=Uk+5_rU91OqVKyQ5cxhqfTo5svjg@mail.gmail.com>
Subject: Re: [PATCH v6 06/10] accel/rocket: Add IOCTL for BO creation
To: Robin Murphy <robin.murphy@arm.com>
Cc: Daniel Stone <daniel@fooishbar.org>, Rob Herring <robh@kernel.org>, 
	Maxime Ripard <mripard@kernel.org>, David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Sebastian Reichel <sebastian.reichel@collabora.com>, 
	Nicolas Frattaroli <nicolas.frattaroli@collabora.com>, Kever Yang <kever.yang@rock-chips.com>, 
	linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, 
	linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Jun 4, 2025 at 7:03=E2=80=AFPM Robin Murphy <robin.murphy@arm.com> =
wrote:
>
> On 2025-06-04 5:18 pm, Daniel Stone wrote:
> > Hi Tomeu,
> > I have some bad news ...
> >
> > On Wed, 4 Jun 2025 at 08:57, Tomeu Vizoso <tomeu@tomeuvizoso.net> wrote=
:
> >> +int rocket_ioctl_create_bo(struct drm_device *dev, void *data, struct=
 drm_file *file)
> >> +{
> >> +       [...]
> >> +
> >> +       /* This will map the pages to the IOMMU linked to core 0 */
> >> +       sgt =3D drm_gem_shmem_get_pages_sgt(shmem_obj);
> >> +       if (IS_ERR(sgt)) {
> >> +               ret =3D PTR_ERR(sgt);
> >> +               goto err;
> >> +       }
> >> +
> >> +       /* Map the pages to the IOMMUs linked to the other cores, so a=
ll cores can access this BO */
> >
> > So, uh, this is not great.
> >
> > We only have a single IOMMU context (well, one per core, but one
> > effective VMA) for the whole device. Every BO that gets created, gets
> > mapped into the IOMMU until it's been destroyed. Given that there is
> > no client isolation and no CS validation, that means that every client
> > has RW access to every BO created by any other client, for the
> > lifetime of that BO.
> >
> > I really don't think that this is tractable, given that anyone with
> > access to the device can exfiltrate anything that anyone else has
> > provided to the device.
> >
> > I also don't think that CS validation is tractable tbh.
> >
> > So I guess that leaves us with the third option: enforcing context
> > separation within the kernel driver.
> >
> > The least preferable option I can think of is that rkt sets up and
> > tears down MMU mappings for each job, according to the BO list
> > provided for it. This seems like way too much overhead - especially
> > with RK IOMMU ops having been slow enough within DRM that we expended
> > a lot of effort in Weston doing caching of DRM BOs to avoid doing this
> > unless completely necessary. It also seems risky wrt allocating memory
> > in drm_sched paths to ensure forward progress.
> >
> > Slightly more preferable than this would be that rkt kept a
> > per-context list of BOs and their VA mappings, and when switching
> > between different contexts, would tear down all MMU mappings from the
> > old context and set up mappings from the new. But this has the same
> > issues with drm_sched.
> >
> > The most preferable option from where I sit is that we could have an
> > explicit notion of driver-managed IOMMU contexts, such that rkt could
> > prepare the IOMMU for each context, and then switching contexts at
> > job-run time would be a matter of changing the root DTE pointer and
> > issuing a flush. But I don't see that anywhere in the user-facing
> > IOMMU API, and I'm sure Robin (CCed) will be along shortly to explain
> > why it's not possible ...
>
> On the contrary, it's called iommu_attach_group() :)
>
> In fact this is precisely the usage model I would suggest for this sort
> of thing, and IIRC I had a similar conversation with the Ethos driver
> folks a few years back. Running your own IOMMU domain is no biggie, see
> several other DRM drivers (including rockchip). As long as you have a
> separate struct device per NPU core then indeed it should be perfectly
> straightforward to maintain distinct IOMMU domains per job, and
> attach/detach them as part of scheduling the jobs on and off the cores.
> Looks like rockchip-iommu supports cross-instance attach, so if
> necessary you should already be OK to have multiple cores working on the
> same job at once, without needing extra work at the IOMMU end.

Ok, so if I understood it correctly, the plan would be for each DRM
client to have one IOMMU domain per each core (each core has its own
IOMMU), and map all its buffers in all these domains.

Then when a job is about to be scheduled on a given core, make sure
that the IOMMU for that core uses the domain for the client that
submitted the job.

Did I get that right?

> > Either way, I wonder if we have fully per-context mappings, userspace
> > should not manage IOVAs in the VM_BIND style common to newer drivers,
> > rather than relying on the kernel to do VA allocation and inform
> > userspace of them?
>
> Indeed if you're using the IOMMU API directly then you need to do your
> own address space management either way, so matching bits of process VA
> space is pretty simple to put on the table.

My impression was that the VM_BIND facility is intended for SVM as in
OpenCL and maybe Vulkan?

Guess my question is, what would such an accelerator driver win by
letting userspace manage the address space?

Thanks,

Tomeu

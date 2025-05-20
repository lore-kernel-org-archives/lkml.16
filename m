Received: from mail-yw1-f170.google.com (mail-yw1-f170.google.com [209.85.128.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 487B21FECC3
	for <linux-kernel@vger.kernel.org>; Tue, 20 May 2025 18:09:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747764547; cv=none; b=nR4JJjX3DKjZnOQSse8fbyWKgwzp0UP1rzqHGr43HiZdzxAB2qFWa7lj7Edrqr8uvtvqdS5SMdBmQ4CTFdCaRTdIsAfvP6vTbczMNfPN7arJRFad/Ejt2dwfFScOlbXhLecDlOvfJJvW3MEy/LCuSRgicJVyCz1txxG/h/1S6mo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747764547; c=relaxed/simple;
	bh=BaHb9YepuQP9xeHP9Bjcl5awLxF3SDbjBMq2/oSPwMQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=RU4iTStK7TXMYcCeViobr3VfBB2stHEfJ6ckWVT2fZsrF15CdRXe6C7VD8N34KWn66B3hs1z3rh1HfaaO5MPSSRHD+25K9SERkvprI+9s9YA4gjL7kvznX9z+eiAF7QFBUwiMskwAZyYFO28SfSXcZPLG+nSKJZ+kDsieq9gbFQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=paul-moore.com; spf=pass smtp.mailfrom=paul-moore.com; dkim=pass (2048-bit key) header.d=paul-moore.com header.i=@paul-moore.com header.b=ZR0u9wVD; arc=none smtp.client-ip=209.85.128.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=paul-moore.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=paul-moore.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=paul-moore.com header.i=@paul-moore.com header.b="ZR0u9wVD"
Received: by mail-yw1-f170.google.com with SMTP id 00721157ae682-7080dd5fe92so48493007b3.3
        for <linux-kernel@vger.kernel.org>; Tue, 20 May 2025 11:09:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=paul-moore.com; s=google; t=1747764544; x=1748369344; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WU5udPTppsA55f4dR4/qInsRJDN9j9dX+VCWH1iJNOg=;
        b=ZR0u9wVDuhtIZjvVK6P7ZIx8ZC+Jfsz8zMXZCENHW6Q1spqYxp1fgHcUovF1clzN6x
         jYgRPW0qPRdQCf0YY7SO2qPzJ3JHd0jaHTow8gLRq212/xPIjAZml/bO7eoDghN2nupM
         Q7BPZXwtz2k0DiYbfoHxzbiWCVHkwocI5pAMDf/nO0JhMsKePZUFAGaXZWlABRAVaz2t
         jBHnqBCawJf5RdJYW4foAuahMe/irze9tmjYXphOdDvZwQ1ZUPIzfk/SmvcuzT2A+oX+
         uZLZxHmghka2F7wmJEWFtEQHZwtqcssLUTuJLDc5tQwdVr2Cn9eL3xhxOIY/mfMpw0aU
         S5Ng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747764544; x=1748369344;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=WU5udPTppsA55f4dR4/qInsRJDN9j9dX+VCWH1iJNOg=;
        b=YKP7YGstZnFCHvtoHWddx9PSKK1Ksqdd1M2KhEOumrUPu3JTeLblRIH2VGMh8hnZNK
         FLbd30dPvBtCFRcO4AP2hVjHTqgXOXHbY1iXsinSrDvqtZ/N+3d4LSrvr79A0R9hdniw
         n0BkpRnRb2u1nLVjrzm1tbPsjuZ2ZRB73lQlEdICeg4TYvCWZbsFdEfYJrY/bSuhAyWW
         fG/3tQU6kKDmwEHMLjfezCyv13LJq/9+gC7dbjObObqztXKum1lwki+q4+UFE6IsMuvK
         aginT9yKm5Um9nXVezibM0FZUX6WB4OwAu8+U8WcD0M9yzWf8sYm9sb4s3/TSQsRJw7t
         dmRQ==
X-Forwarded-Encrypted: i=1; AJvYcCVYO1djM6I2Yv4CPBzCm9XxciqGI/i1NpRD5wcl/EGg0qDKgoDD75xDg8nC45HIO+7JFUd5DapHL6jQlhI=@vger.kernel.org
X-Gm-Message-State: AOJu0YwC/ZHPgr1XDnXJBojA5Bzap887LbOvLYzHCDjCgVFCgxPY7EBD
	4xWRwDMYdEqxZB6vLODl7iIuIQrP1RaZbTXT3So1baIiJPD7ATUVcglM7UWLgn5fgfTBfJKmPs0
	Z+Hd89a/+ZG4fGqI6uCj1q4oK4R10eRWukNAu/wG5
X-Gm-Gg: ASbGnctS5/rZN8WM/lxOT/2FVJLtRQM5PHllz48AdRmk5B0MTDQ/qF2QJpbw3zb2tmt
	iYu+uubK7ZeUxXPFJyV6i9wDM2SViSxx7gt4TPAlQJxLBCSDmNKfCeY/VJkhexfRB6QFNp9OQ5M
	cfnqULvIPT1xwJ0v3CdF+okFtrVDCbMg5M
X-Google-Smtp-Source: AGHT+IGNWng09pZ5ljk/Okxa5nCSJCuR564MKYI0xijFRLTiDNOVwhoe3rjTtp+IDNpD1Sbw9/3ctQDVNFoPrswyl9o=
X-Received: by 2002:a05:690c:fc2:b0:70d:ee3b:bec8 with SMTP id
 00721157ae682-70dee3bc898mr20129937b3.16.1747764543919; Tue, 20 May 2025
 11:09:03 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <669e1abd542da9fbcfb466d134f01767@paul-moore.com> <20250520163355.13346-1-chath@bu.edu>
In-Reply-To: <20250520163355.13346-1-chath@bu.edu>
From: Paul Moore <paul@paul-moore.com>
Date: Tue, 20 May 2025 14:08:53 -0400
X-Gm-Features: AX0GCFs7DIkpyyhcy91W1pEATOT-GDHk2nbEDGbNZtBIXc8wd9A2olpvkvz8kXw
Message-ID: <CAHC9VhTx72aCwfR7rOCmsscEJBPHkDqdsJePGP6eW=DE0ZUSWA@mail.gmail.com>
Subject: Re: [PATCH RFC 2/2] audit accesses to unassigned PCI config regions
To: Chathura Rajapaksha <chathura.abeyrathne.lk@gmail.com>
Cc: Yunxiang.Li@amd.com, alex.williamson@redhat.com, audit@vger.kernel.org, 
	avihaih@nvidia.com, bhelgaas@google.com, chath@bu.edu, eparis@redhat.com, 
	kevin.tian@intel.com, kvm@vger.kernel.org, linux-kernel@vger.kernel.org, 
	schnelle@linux.ibm.com, xin.zeng@intel.com, xwill@bu.edu, yahui.cao@intel.com, 
	zhangdongdong@eswincomputing.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, May 20, 2025 at 12:34=E2=80=AFPM Chathura Rajapaksha
<chathura.abeyrathne.lk@gmail.com> wrote:
> On Fri, May 16, 2025 at 4:41=E2=80=AFPM Paul Moore <paul@paul-moore.com> =
wrote:
>
> > In the commit description you talk about a general PCIe device issue
> > in the first paragraph before going into the specifics of the VFIO
> > driver.  That's all well and good, but it makes me wonder if this
> > audit code above is better done as a generic PCI function that other
> > PCI drivers could use if they had similar concerns?  Please correct
> > me if I'm wrong, but other than symbol naming I don't see anyting
> > above which is specific to VFIO.  Thoughts?
>
> While the issue is independent of VFIO, the security and availability
> concerns arise when guests are able to write to unassigned PCI config
> regions on devices passed through using VFIO. That's why we thought it
> would be better to audit these accesses in the VFIO driver. Given this
> context, do you think it would be more appropriate to audit these
> accesses through a generic PCI function instead?

I would suggest a generic PCI function, e.g. pci_audit_access(...),
that lives in the general PCI code and would be suitable for callers
other than VFIO, that you can call from within vfio_config_do_rw()
when Bad Things happen.

Does that make sense?

--=20
paul-moore.com

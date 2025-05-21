Received: from mail-lf1-f47.google.com (mail-lf1-f47.google.com [209.85.167.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A6B8422D4F2
	for <linux-kernel@vger.kernel.org>; Wed, 21 May 2025 08:20:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747815626; cv=none; b=hphgFeKwqLK0wrcscJ/DJQlcxT5qAJpKCzQTIvDkDKDL6AIajtx0Iqi7Wz21WY+aoPrKdqpnsYK9i+xeAeQAWJT39HIzEMPo78iUCQ0SziGTU4NuKVdZk/tXihlXKyhYGXZ+mnRt73yJ0OktbO2eFchPQJWW1vhj0QSCka7Apko=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747815626; c=relaxed/simple;
	bh=eOL1R1O0BCf7+HZRp3jizjioh6TZ8xIibHNK5145KS8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=aFLKS5K/ey1ayyAPWeh0TKlFv2ZpWi/A6HJAzcSznA2QgNd1TmLPBZQHXiin7LJ6ruWKmXOUpGGAeSKwXoxERJA7J0YKHQLmyvnv5dwkUr7pJ3l7CMGXhV5W9/d+A3Gw8H2obv2Pmk9i0mdey0Vfi4ugo0GiuzdLpU3C3jJG4dk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=V7JT7mA2; arc=none smtp.client-ip=209.85.167.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="V7JT7mA2"
Received: by mail-lf1-f47.google.com with SMTP id 2adb3069b0e04-550eb498fbbso5683067e87.2
        for <linux-kernel@vger.kernel.org>; Wed, 21 May 2025 01:20:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1747815623; x=1748420423; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=LtasUDW1f3ccxjkgC1bFaImij2iQPxeE88j2RBRC/bs=;
        b=V7JT7mA2tmHI/oUAReEOtYtnSZAlMYTh5wqV2Vn1/BrVu+Lb40s9wc7L3I/ZddJd8q
         s0yy6o1qAQIFHtsuuzxvPP/GxNN1qmwHv8ZLHX2Yl8XsxSrfD25SJ7JLfdy3Ckp/wYtX
         6o1vUCQbZZCDcbaxCMKVj3Lr1qZBDvBzUcyqPeWnJTD3DzYy//vewW45ojKohL6kyl+0
         37syAQfhIY0CYUXhUp7nZg6KF+aTA8H+QnBpviWxUhq8q0ILb7wO5zpQeg4hHKFqQhZb
         Td7Haouf/Mb2Czd3U14cKcP7xrjWCP9gI8wpqwNHqoXp2WDNdKw8EzgGBd9tN+AHqPXI
         kT5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747815623; x=1748420423;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=LtasUDW1f3ccxjkgC1bFaImij2iQPxeE88j2RBRC/bs=;
        b=Q/jiJf62W+4sis3O1oFRDVm3RjhOSzMNlo39LhmHpj+yJduKsEdqeUIU+PgVAplD0H
         58abPNoo6+wARpZgn/mfpw6QnO7jAQoD4lZPpxLHCSxQCHcY+BtVXK/BS8R66ZZ5u0eK
         sZCvKY9APqtvN0kYbIumL1nPKf68bZ5zhTjWNJsvLN31VxZf6PrXGAf3tGyvIUFY+Bsd
         pi+UbeJqphhM6ZCE48nsuPvD2LGXWcpXPFuIDWLX1NE39dA/3vKbuGOhAaqilVX0qi4Z
         rGpf618XBroNnYIB64ggtu5cX5qH+scfsMQnroQGcUeajQRdtfLCSf4LZJz/P2UjlS11
         tliw==
X-Forwarded-Encrypted: i=1; AJvYcCWQ4Y/vsiN3jU9L3h1CpZ4uaVaT8ZBN9fYGpSelrY0q/BUGeJERK5R679P0Ovpzca1pjp1Ew93+EvUaxc8=@vger.kernel.org
X-Gm-Message-State: AOJu0YyQMo8IiG0y70OvWb7WnlAtkm5Zaui7t7qs4F/X8EO3KdCjh5H+
	PZa3IzDMzLilkUQoVY1fToO/Wx5WiuEb0Dt5CUEiF4fxMK8xkeng8Zye5mqeEzvcP+j9Pm0zvDS
	PT0xAN5Uep9YpzwJnLK1r9wi/v6+7H/xJkubeyv4U
X-Gm-Gg: ASbGncvwxqlZJ1bIIppvhWjWO6VMGyHqT+vaes7cJi8s0DsfjrLOy7Zy9IMJFqZ2y5c
	PWiFnY/nhRqM3Ye4l583EcijIif/fRXj0mp5BAI1vWyTOo6KJ6cIZNh3Boyir1ftyHxqs8YVHWB
	1kz7rsQLIYR4Gko2hAEG45yTWeAt1PbnUx5OwxKpezqIyr7JYsyA67t24axlB2eqqmn6H6dB1vm
	K0=
X-Google-Smtp-Source: AGHT+IEMWtJLGE/gzZgwy5FBOQ1xBYd7QmUR2dcgczvtRqtG1XCYXEQDQhwTF2dLXkGRWQiuMb0dlAEmjs7g7NFfh7s=
X-Received: by 2002:a05:6512:4602:b0:545:2950:5360 with SMTP id
 2adb3069b0e04-550e97b5bfemr6490779e87.22.1747815622550; Wed, 21 May 2025
 01:20:22 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <2025040820-REJECTED-6695@gregkh> <20250509072033.1335321-1-dvyukov@google.com>
 <2025050940-marrow-roundish-8b98@gregkh> <CACT4Y+aiQcbHfj2rB6pGKevUbUoYwrHMu+aC-xh0BCKE8D-8sQ@mail.gmail.com>
 <2025050924-marmalade-overfill-fc5a@gregkh>
In-Reply-To: <2025050924-marmalade-overfill-fc5a@gregkh>
From: Dmitry Vyukov <dvyukov@google.com>
Date: Wed, 21 May 2025 10:20:10 +0200
X-Gm-Features: AX0GCFvT_jNV7oRFaGugvDdKrejLWDKjMzcuRRdquhjg84BVxd1sI0cbQXu1fG0
Message-ID: <CACT4Y+az8zu+n_z=amp1Z_ezni-UVTrd0GgUvSzjji2RsjexQQ@mail.gmail.com>
Subject: Re: REJECTED: CVE-2025-0927: heap overflow in the hfs and hfsplus
 filesystems with manually crafted filesystem
To: Greg KH <gregkh@linuxfoundation.org>
Cc: cve@kernel.org, linux-cve-announce@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Fri, 9 May 2025 at 09:55, Greg KH <gregkh@linuxfoundation.org> wrote:
>
> On Fri, May 09, 2025 at 09:47:20AM +0200, Dmitry Vyukov wrote:
> > On Fri, 9 May 2025 at 09:34, Greg KH <gregkh@linuxfoundation.org> wrote:
> > >
> > > On Fri, May 09, 2025 at 09:20:33AM +0200, Dmitry Vyukov wrote:
> > > > > CVE-2025-0927 has now been rejected and is no longer a valid CVE.
> > > >
> > > > > Filesystem bugs due to corrupt images are not considered a CVE for any
> > > > > filesystem that is only mountable by CAP_SYS_ADMIN in the initial user
> > > > > namespace. That includes delegated mounting.
> > > >
> > > > I wonder if this should be the case only if the image is flagged by fsck
> > > > as corrupted? Otherwise I am not sure what's "trusted". It's not about
> > > > somebody's "honest eyes", right. E.g. in the context of insider risks
> > > > the person providing an image may be considered "trusted", or in the
> > > > context of Zero Trust Architecture nothing at all is considered trusted,
> > > > or a trusted image may be tampered with while stored somewhere.
> > > >
> > > > Without any formal means to classify an image as corrupted or not,
> > > > this approach does not look very practical to me. While flagging by fsck
> > > > gives concrete workflow for any context that requires more security.
> > >
> > > And how do we know of fsck can flag anything,
> >
> > By running fsck on the image. Or what do you mean?
>
> That requires us to attempt to reproduce stuff when assigning CVEs?
>
> And what architecture/target?  How do we do this for all of them?
>
> Remember, we are averaging 13 CVE assignments a day, this has to be
> automated in order for us to be able to manage this with the volunteer
> staff we have.
>
> > > AND which version of fsck?
> >
> > This needs to be answered as part of establishing the vulnerability
> > triage process. I would go for a relatively fresh version. That will
> > remove bugs fixed a long time ago, and if users rely on it for
> > security purposes they have to update it.
>
> Remember older kernels are updated but userspace isn't on many
> platforms, so the combinations of userspace tools and the kernel
> versions is not anything we are going to even be aware of.
>
> > > We'll defer to the fs developers as to what they want here, but note, we
> > > do not determine "trusted" or not, that is a use case that is outside of
> > > our scope entirely.
> >
> > I think classification should be tied to users and use cases in the
> > first place. I, as a developer, wouldn't want any CVEs assigned to my
> > code, if I could just wish so :)
>
> This is open source, we can not, and do not, dictate use.  It is up to
> the users of our software to determine if their use case matches up with
> the reported vulnerability or not.  We can not do it the other way
> around, that is impossible from our side.

So based on this, and Ted's confirmation that using fsck to validate
images is valid [1], it looks like we should create CVEs for such
bugs, right?

Re making the process scalable and what version of fsck to use, I
think it's reasonable to offload this to users. If they use fsck for
validation, they can check a particular CVE if it's caught by _their_
version of fsck, and if yes, ignore such CVEs.
This looks in line with the rest of the CVE process. Some users don't
enable some configs. Kernel CNA still creates a CVE, a user checks
that this CVE is related to config they don't enable and ignores the
CVE.

[1] https://lore.kernel.org/all/20250513120549.GA9943@mit.edu/

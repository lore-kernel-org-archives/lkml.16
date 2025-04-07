Received: from mail-yw1-f169.google.com (mail-yw1-f169.google.com [209.85.128.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 451F320A5E5
	for <linux-kernel@vger.kernel.org>; Mon,  7 Apr 2025 16:14:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744042447; cv=none; b=ajuZG0nezOiFRrd59oMD1b7DE2icNKpGWFiTGb+CCzyJsb8+RZAXFvNOOBNIjz4jwHGFQ3eNZ05JKIP2M4RQQWQ701flgSdIsilqHnt1wfzP4Ryk7jpVw3hD2ipR3q1/O80m/HKY6t84dQdXWCcILL8VvYJEVbTHoST3nikFNBo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744042447; c=relaxed/simple;
	bh=MZ1+v4Yr8SrxsYFLNiPWcJ3X3rXXmM+Atb5i9VRwigw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=XBrMfSKNYrKYTFvNcjfU92+MkXV+1e2DJH2ny8lafziEHvJoGFUkAqh5mjTNo9WPj88v20F+7zLjUfD8v2lokWhaYfoEFI3gZ2+AXEuhr0w9L84GmPXUeWajVlCfZKRQR3qNUhf9W9vvTbc1WK84KIXiyziiAutFQ7lPqj6Je1Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=endZq3d6; arc=none smtp.client-ip=209.85.128.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="endZq3d6"
Received: by mail-yw1-f169.google.com with SMTP id 00721157ae682-6feab7c5f96so43068217b3.3
        for <linux-kernel@vger.kernel.org>; Mon, 07 Apr 2025 09:14:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1744042445; x=1744647245; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=bod33nGx35GYDGeyLDpG4qYPRiHJzUFJHwZD8P4WupU=;
        b=endZq3d6f2rGBycLrcxNGnEUlxVaR8NwpKrT1XudIkVdUOkbzPggfFGfOlzpYKnUOF
         D1Lga+Nwnt+zVDusaHfz9jmONa54DD7079bRQQA1oafjVIxsPCdLrQQ5bwpsowclji+d
         YSImJOejdLXF6oGTGmuGaj3qaMGVPpXI8ptu/890dc5FwuPqR7xZG4rOJM9hcfKOAi5o
         Jtm1E6S1BsPzc56+0MZh1izD70z/ge+ViuYlo2CQIfmR/2iSioQkql9KHoIiw7zk2enj
         z7RPhShjiortuBqkwrbW8HGxxENiigwiS9dsDhANO0Lz+VKOR6nozIaM55La461Tfn9W
         0QBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744042445; x=1744647245;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=bod33nGx35GYDGeyLDpG4qYPRiHJzUFJHwZD8P4WupU=;
        b=SBO7SUBHWTM7vCNdnVIJ088XWTGsX/S/X2KyNNlQALC8R1fwDjE0URVw8A+4NETyoC
         b6+W1Fq3WoVQehrOwSKPmlUQB6nhi1spFoqGBzEFswxb8f5xQMa4qteTwiX+i+XXEWG6
         4DlVZ/SlylUchtbzmGqxGvOzpj5df6zT9ocw2ZmV3C4BlQfscKhcsS1vfM+CfaErBMOr
         dNpodec3J0fNiAvjASlAVu1BCaTuYTzmmOcl9I7B0gAKf/7sDYOfe4tS6PCIrJ71fivg
         epf61HuJvOP+mt9xlUmqOiK4WmPY3bZHmikg7wkI02Px7thGfcKLgGX8SFrNAfrp2Dq4
         Z3Bg==
X-Forwarded-Encrypted: i=1; AJvYcCXpn6KaLP6s/352VsTt3jgB2v3mED/Ts8uN391SKSLgBi4OdI3WH9nuGRP1aTQRyuwS1o2bcIM3W90TUCg=@vger.kernel.org
X-Gm-Message-State: AOJu0YwlZvnEii0Xo2Y0lUsaeu8FOFOPflUl3TNwp1G5izlNrb8hbdKU
	GGJrXNrxCsk4iG6eZrKld/xtL74wPd+pvQz0gBsC2/A/Qpa9Nc78tacUv6fkksg4gayLJR2J0Gu
	U4svUXCB6PWaQ2K1d7LiToCMRmIPT/dwQCL1vAA==
X-Gm-Gg: ASbGncutFGGxb1M8GJj7zHqBvUgQrKlyElS+nwWEhn+zSUCTX0FYp1earD9N1L2CwhR
	eXlH0NR9rvroDqv04rQnjtMnt0jba+PvaFvcg2z7uSQ+5+r6hMpUUpDrziZ4IZtuEW45C4BZn68
	I71fv4i6S1BzHq8M4NJjKX7QMNoO4=
X-Google-Smtp-Source: AGHT+IFoDbEoYCGI/fKsfvc1W3WRJ48PIrl3shNMLSyLyHUCZEKjVWa8xv5qbOXVgK1f6QWGAMLLH1qGHEVK9aquLzg=
X-Received: by 2002:a05:690c:4c11:b0:702:5689:356e with SMTP id
 00721157ae682-703e1546003mr227916307b3.12.1744042445057; Mon, 07 Apr 2025
 09:14:05 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20230621144019.3219858-1-abel.vesa@linaro.org> <2786d9ff-0579-429b-b431-a8547cbf6fb6@ti>
In-Reply-To: <2786d9ff-0579-429b-b431-a8547cbf6fb6@ti>
From: Ulf Hansson <ulf.hansson@linaro.org>
Date: Mon, 7 Apr 2025 18:13:28 +0200
X-Gm-Features: ATxdqUG2bTsfDvA_PWKUIhjRNtwJmFpgrRLM7JC797JM0tWqTf0FSYOqcVvkHm8
Message-ID: <CAPDyKFodE6KokC9uwZZgF+VGCc5JCA5YjB7okUkELAn16V=nvA@mail.gmail.com>
Subject: Re: [RFC PATCH v5 0/4] PM: domain: Support skiping disabling unused
 domains until sync state
To: Devarsh Thakkar <devarsht@lewv0571a.ent.ti.com>
Cc: Abel Vesa <abel.vesa@linaro.org>, "Rafael J . Wysocki" <rafael@kernel.org>, 
	Kevin Hilman <khilman@kernel.org>, Len Brown <len.brown@intel.com>, Pavel Machek <pavel@ucw.cz>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Saravana Kannan <saravanak@google.com>, 
	Bjorn Andersson <andersson@kernel.org>, linux-pm@vger.kernel.org, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, linux-arm-msm@vger.kernel.org, 
	Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Content-Type: text/plain; charset="UTF-8"

On Mon, 7 Apr 2025 at 16:13, Devarsh Thakkar
<devarsht@lewv0571a.ent.ti.com> wrote:
>
> Hi Abel,
>
> On 21/06/23 20:10, Abel Vesa wrote:
>
> Thanks a lot for working on this.
>
> > This new approach drops the is_off change that was part of v4. That was
> > kind of beyond the scope of this patchset. This new approach changes the
> > boot_keep_on in such a way that we won't need any kind of new locking
> > for a PD. This involves using the patch [1] for adding dev_set_drv_sync_state
> > from Saravana for allowing the genpd core to set a default sync state
> > callback for a provider that doesn't register one by itself. While at it,
> > we can add another such API but this time to query a device's sync state.
> > Then, we filter out each power off request in such a way that if a boot
> > powered on power domain is not attached to its consumer device and
> > the provider has not state synced yet, the power off request is skipped.
> >
> > [1] https://lore.kernel.org/all/20210407034456.516204-2-saravanak@google.com/
> >
> > No worth mentioning what changed since v4 as this version is almost
> > entirely reworked.
> >
> > Abel Vesa (3):
> >    driver core: Add dev_is_drv_state_synced()
> >    PM: domains: Ignore power off request for enabled unused domains
> >    PM: domains: Add and set generic sync state callback
> >
> > Saravana Kannan (1):
> >    driver core: Add dev_set_drv_sync_state()
> >
>
> Could you please share if you are planning to re-spin this series as
> non-RFC in near future ?
>
> We think that these patches would be useful to enable smooth display
> transition from boot-loader to kernel space, something which our team is
> working on, so just wanted to know your plans for this series.

I am working on it as we speak, but I need a few more days for
testing. You should expect something to hit LKML later this week or at
least early next week.

I will keep you posted!

Kind regards
Uffe

>
>
> Regards
> Devarsh
>
> >   drivers/base/power/domain.c | 72 +++++++++++++++++++++++++++++++++++++
> >   include/linux/device.h      | 26 ++++++++++++++
> >   include/linux/pm_domain.h   |  4 +++
> >   3 files changed, 102 insertions(+)
> >
>

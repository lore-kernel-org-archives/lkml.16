Received: from mail-lj1-f176.google.com (mail-lj1-f176.google.com [209.85.208.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C4E79264A76
	for <linux-kernel@vger.kernel.org>; Tue,  8 Apr 2025 11:44:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744112690; cv=none; b=cpI/MxQERrpMOeQtomZVsBhtnWh3lJs5ua3MpJWiHnOA8goxZegoMuBvNucvWAnC2vRLb2zTpRfIOFMt2IEq81eBHeGjdMjo3MvgtMHeszRm5Z8TBjHPI94y8yAKfJZghK5QlmErgxhmUwLKY/CrDl9zNnbpU0zzR4/3BERxhjQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744112690; c=relaxed/simple;
	bh=sVnWWYifDzNHWDD5ZdDHNMXXvkM1H7Mr10Ssgl0n+6I=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=KTzyhBYx9G20UwmWfWKnShwpRzcFxx1O4Ctrj4mASHpkHcFYFQCvzU0KB7VB0hXPO4HKGZ9OhLmrV7WS73SlH2CrJvb8Qtvjph54MSpN5BsdLWANco9C+wC/OmZRMicBlaobdiij+GEjF5CuHKmw576U2pbhm59JzToUrzvNdnU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=gEDnffPo; arc=none smtp.client-ip=209.85.208.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="gEDnffPo"
Received: by mail-lj1-f176.google.com with SMTP id 38308e7fff4ca-30c461a45f8so53524271fa.1
        for <linux-kernel@vger.kernel.org>; Tue, 08 Apr 2025 04:44:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1744112687; x=1744717487; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=JrYauhzusPrI0iXB3x51m5sg6uFNXWBUmKbASQyHV2k=;
        b=gEDnffPoi/BaYCY/J0wQAXVy/xuJWs0K1YXcXKq+noC3BsdYmtR5bE+9n25XPFai04
         AUK9YLeLUJ0uGcpgf0cn5swmDSIuv6gCUL3B1BlkxQ3zek2kR3j0TWU+rOPnUGxeRL4E
         r70lAnJg2Yqq6aU0jAn5hpTug2In0gbLnP+jfJpNhpb82xmV7BB32Vf1xdKyp0mG4dni
         RJ33XTbj7v8rCotisfpi3K5J8G+hdoC2BHXxONUPQikSsH4YJgASgdBg4Rd69E1HtGX7
         hn6MvEn+bs09blcdaXc9NQrvHWvePjzQxO/Rqx0GVkMbhbzQPuISgDxiZi/k8s/LsWMH
         oJhw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744112687; x=1744717487;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=JrYauhzusPrI0iXB3x51m5sg6uFNXWBUmKbASQyHV2k=;
        b=UWZcXsRO12oEhz9Y34uch1bIYJp5suPZCg+1uCgSbhINzRna5p0+LNVyJR1InknYSW
         jJ8zZ/fu/o6L7AbQwBM0MNOioisHNN2U+jK7eNcTLqNHZZ75VnmAy/65tJIWYv+k+KhG
         u4A09TVCINQHImP9npBP+I0jG7GoFzLRtoTK9Ch3TtI9KmXXE0UHFuup66rGDrh7VemS
         ZKaET7bxD3lvOFr1ut69InpybfOaWjWXG2TAq7akIPJH9fJldG8AS/pR+wW3LUMbpEfs
         wEvbzKWdR7sVg5xF3wGU8K4GBqejl9xtBM0Jaq800Fns01CfwzpUKrtp7GUHAn1go8QB
         +ULQ==
X-Forwarded-Encrypted: i=1; AJvYcCVNu/H2JGSz7ubWyxEqTPyvhAjxDVWyne/+t8I7jkN2X1ACZGvNUBWZawccPizTuhYT+D2ene0TDzAo2uc=@vger.kernel.org
X-Gm-Message-State: AOJu0Yyd2BUzb1b+tAXAYVYpCeiFUT73b9XqKhVynNUpssxHWZtFeAbC
	YmhzsPxiaOLvN6DoNlIMwP1fvz5PGp2cy8C7OGTUgLdUdg/FXTjpXI9TSWJENpPpLZwXTEaNvRJ
	aEdw3C+rhH/A37Axo5Tupq3EpbdWkKjrcCjAxZQ==
X-Gm-Gg: ASbGnctZxrbOWSAbsO5X72exFIE0p+Dps0f/k8hSym4EOLbJXXvaC2twH93uQOrQXvu
	JlplQxbnmBv17ovbJRQMsGtQ7T2hxiqMPRMFIkO0NdCwunKZiPJDO4xCEdSMyczG1/Ymxwe9uuN
	yHM7bzN3KGWnirpyITTsyCmHcyEPJ0tAI=
X-Google-Smtp-Source: AGHT+IHjL36c4DD0hqrS7NUmvzOjx/3kG/kPwxU+j7cHEhXKV/Zh3wqhtcKt/lEg9h3aP4E8pKAxMXueT2IArw3DOF0=
X-Received: by 2002:a05:651c:882:b0:307:9555:dc5e with SMTP id
 38308e7fff4ca-30f0be04016mr46411251fa.3.1744112686911; Tue, 08 Apr 2025
 04:44:46 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <cover.1740504232.git.nicolinc@nvidia.com> <f205a4e2f5971cd4b1033d7cac41683e10ebabfb.1740504232.git.nicolinc@nvidia.com>
 <CABQgh9Fuh2HdBH7pyAteawZBpa55ZzfR9dv2K4RF=Ps4yhREbw@mail.gmail.com> <Z/QSuMzJVGOcTx60@nvidia.com>
In-Reply-To: <Z/QSuMzJVGOcTx60@nvidia.com>
From: Zhangfei Gao <zhangfei.gao@linaro.org>
Date: Tue, 8 Apr 2025 19:44:34 +0800
X-Gm-Features: ATxdqUE5HzSx71KLyQAI3wDnKvY_BQRF_RJmPVNkaKt2N6Ua3aAx7RZCkWtktDg
Message-ID: <CABQgh9FObG8-Qsp-nqoTP-fC7VkPoi1ooHPQ1=s5uW_2BTL9vw@mail.gmail.com>
Subject: Re: [PATCH v8 12/14] iommu/arm-smmu-v3: Introduce struct arm_smmu_vmaster
To: Nicolin Chen <nicolinc@nvidia.com>
Cc: jgg@nvidia.com, kevin.tian@intel.com, corbet@lwn.net, will@kernel.org, 
	joro@8bytes.org, suravee.suthikulpanit@amd.com, robin.murphy@arm.com, 
	dwmw2@infradead.org, baolu.lu@linux.intel.com, linux-kernel@vger.kernel.org, 
	iommu@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
	linux-kselftest@vger.kernel.org, linux-doc@vger.kernel.org, 
	eric.auger@redhat.com, jean-philippe@linaro.org, mdf@kernel.org, 
	mshavit@google.com, shameerali.kolothum.thodi@huawei.com, smostafa@google.com, 
	ddutile@redhat.com, yi.l.liu@intel.com, praan@google.com, 
	patches@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

On Tue, 8 Apr 2025 at 02:00, Nicolin Chen <nicolinc@nvidia.com> wrote:
>
> On Mon, Apr 07, 2025 at 08:08:57PM +0800, Zhangfei Gao wrote:
> > Hi, Nico
> >
> > On Wed, 26 Feb 2025 at 01:35, Nicolin Chen <nicolinc@nvidia.com> wrote:
> > >
> > > Use it to store all vSMMU-related data. The vsid (Virtual Stream ID) will
> > > be the first use case. Since the vsid reader will be the eventq handler
> > > that already holds a streams_mutex, reuse that to fenche the vmaster too.
> > >
> > > Also add a pair of arm_smmu_attach_prepare/commit_vmaster helpers to set
> > > or unset the master->vmaster point. Put these helpers inside the existing
> > > arm_smmu_attach_prepare/commit().
> > >
> > > For identity/blocked ops that don't call arm_smmu_attach_prepare/commit(),
> > > add a simpler arm_smmu_master_clear_vmaster helper to unset the vmaster.
> > >
> > > Reviewed-by: Jason Gunthorpe <jgg@nvidia.com>
> > > Reviewed-by: Pranjal Shrivastavat <praan@google.com>
> > > Signed-off-by: Nicolin Chen <nicolinc@nvidia.com>
> > > ---
> >
> > >
> > > +int arm_smmu_attach_prepare_vmaster(struct arm_smmu_attach_state *state,
> > > +                                   struct arm_smmu_nested_domain *nested_domain)
> > > +{
> > > +       struct arm_smmu_vmaster *vmaster;
> > > +       unsigned long vsid;
> > > +       int ret;
> > > +
> > > +       iommu_group_mutex_assert(state->master->dev);
> > > +
> > > +       /* Skip invalid vSTE */
> > > +       if (!(nested_domain->ste[0] & cpu_to_le64(STRTAB_STE_0_V)))
> > > +               return 0;
> >
> > Why this is removed in v9 and 6.15-rc1?
> >
> > I tested 6.15-rc1 the qemu failed to boot with qemu branch:
> > for_iommufd_veventq-v8
> > "failed to attach the bypass pagetable"
>
> Here is the problem: v9 isn't compatible with v8 :)
>
> Would you please try for-v9 version?
> https://github.com/nicolinc/qemu/commits/wip/for_iommufd_veventq-v9

Thanks Nico

I tried this branch, it works with 6.15-rc1

Thanks

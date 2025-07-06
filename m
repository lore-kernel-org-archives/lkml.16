Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B8AB1F8AC8
	for <linux-kernel@vger.kernel.org>; Sun,  6 Jul 2025 15:11:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751814680; cv=none; b=LYVClWRYBw2vjNh2lW7kQXfRFh/AbmF6pJkYNrktQ3js2g1nPesMyJq6AxhKua2/YHCTns/n+1abtTHsbz+hI7DmqPiRbLVIlnuib49JQNZBIXzoQPNSgpZfkSlvsl3+XiZkQOwfov5M/Z1NPpCM1tha4iIPIVmTi20u6L7JmJA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751814680; c=relaxed/simple;
	bh=QEedb3gvKUnOPqlhv4FlNyLU4cBMnRFmbVLsO9eB2bk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=YQac8Kqk26gYzGLYviSpN8LB9FjNQ6RIFRD2uEK0s+vbK0oH5VHnMzqT5SQVHpvjGiHBFwjiSVL2nKXTaeHCAK1N2GELLXxMUp1QnS6/j5wK5eqj0nNr6F1azImRctE1rCBVt38vjys/hm1IqzB0b/FsS2clT1CdAmeFWKMw9kA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=KleaMkK9; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="KleaMkK9"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 566BDFMk015547
	for <linux-kernel@vger.kernel.org>; Sun, 6 Jul 2025 15:11:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:reply-to:subject:to; s=
	qcppdkim1; bh=deOGb66htBHQke4mAZ1lh4AWcMp6dCPlP5Iwn3G7D+E=; b=Kl
	eaMkK9gP9gNKG5XeBj9jBgcBp7vENfmcsh0/TCHTmmdbaXEeDcTbiUI6qblYfgwT
	NeXqP5alMjTm2/J6W5GC+1UQP+rLsza5wO+4w5vOR4icdopGWfT9cxgUkwE2Ag7j
	dWWk1qfaS9yJ644gqYQ6ua8L6xy9ByARWBS8P8nrJAdNq2tlbJNwzQd90ieDnY/U
	8EdJ9BZUx6IsGZyUf987cN/v6z1ON4/iNrfpR3j5BqZLo15mC7HA/5cLAqcoYnX4
	JVVacZWyKtuy20VWSGESwN1mXY7CrT28lSVYFVSzIubUGxVwdNlv9ZddNR8bl5KV
	BK3fPxj2AWM+488DZB8g==
Received: from mail-oi1-f198.google.com (mail-oi1-f198.google.com [209.85.167.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47pv4xd1xe-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Sun, 06 Jul 2025 15:11:17 +0000 (GMT)
Received: by mail-oi1-f198.google.com with SMTP id 5614622812f47-40abfc09f67so565709b6e.3
        for <linux-kernel@vger.kernel.org>; Sun, 06 Jul 2025 08:11:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751814677; x=1752419477;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :reply-to:in-reply-to:references:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=deOGb66htBHQke4mAZ1lh4AWcMp6dCPlP5Iwn3G7D+E=;
        b=cUOvALmC8ZZ6V44j69URg9UPnYKNi+j8NMm1QPLvFeqEfdDGjrYt/MK3utHtBFzcVu
         xyL4kNxtgQ5GP5DSbU2jSsnG/CNl85UFU9N1tJIgDFptrPcFHw2ioKcLMKN8NDJMYEnM
         EmfnVuxvOl6AwzQ9eLCsm5QLZM4ZIRpssbFzh46gX/07/5+aaP+1I+TBUV4V3thoXA83
         b4ZZOtzZkDkJ1lxx4hHiQ+wV8cwgRnoTOwxoMaowY5kX+SgHSsYfWdWZktSUHNh36UMO
         OYeqynRjOba+hVukX9hi89X7vxK0Rmzh6NoW+4DJ41yso+4GjdsCs0sF9dSIZsHwwMZi
         J48A==
X-Forwarded-Encrypted: i=1; AJvYcCUcU9N9I53eu+CY8DAQVBwKnMazD6I/S21peWbNM0qQ5YMtR/swzbJUvHH8sgFgK73AsYxzEN9IerI1Knk=@vger.kernel.org
X-Gm-Message-State: AOJu0YytmEz0p0qIF9W2gShVFz8DxFpdKQ/+VDhc40ofF1WIIClHiTk+
	NDp2Rh+DErCPxQvVkIvwl2N4oDRf2cN0Ge56LXL5LfzktUY0D6JGx5VoHr2fGEXE3x+3dZqtWuT
	mZ/oZLIbFdc2j06Fvw+Wiv2M8sbIXf6BP3atcz8flfMNBYyMrUTl+DK4ER+oBjf0ntAdXNKvrzb
	HwolmTw9y9cQLQmq04X+1w2pSq/y8tdhqVja+cohMBQg==
X-Gm-Gg: ASbGncvq1FhgHR35pDx6hDNPKYtXqbtENOxwZylxn7r5Wfz9hra/7QDvxsLBNYCF2b/
	lhXQ4yEtcsckwWB0phJN+IOf/gqbI6ZRmAxET8EGsLditCS9tnjv7COWVcOSNgz185krHVaEURz
	yHXet4yJfquc9WR1gN6sV6poGpuEoFUkfyBP8=
X-Received: by 2002:a05:6808:4fde:b0:3f4:1c2:874a with SMTP id 5614622812f47-40d2cf2d360mr3898514b6e.24.1751814676744;
        Sun, 06 Jul 2025 08:11:16 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGCvcckgznjdGp/NHPpmur+SYkh7MSUDwzMDpYV3OdsMstVz6vnUJ6ymJyEyW6a8CETCNZtwOf5LWMCyVbpVT0=
X-Received: by 2002:a05:6808:4fde:b0:3f4:1c2:874a with SMTP id
 5614622812f47-40d2cf2d360mr3898492b6e.24.1751814676366; Sun, 06 Jul 2025
 08:11:16 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250706-msm-no-iommu-v1-0-9e8274b30c33@oss.qualcomm.com>
 <20250706-msm-no-iommu-v1-3-9e8274b30c33@oss.qualcomm.com>
 <CACSVV00Cdwjhta+ozoQAy0QQ81LM8Skf8RcnFGKscbc03xBA=w@mail.gmail.com> <CAO9ioeV47NAo=j=QHdZPSZT_f31jTT=cFSN=EjihboTr4Pmzkw@mail.gmail.com>
In-Reply-To: <CAO9ioeV47NAo=j=QHdZPSZT_f31jTT=cFSN=EjihboTr4Pmzkw@mail.gmail.com>
Reply-To: rob.clark@oss.qualcomm.com
From: Rob Clark <rob.clark@oss.qualcomm.com>
Date: Sun, 6 Jul 2025 08:11:05 -0700
X-Gm-Features: Ac12FXwWOIs0xq3UqgUHa5M8SliZdTa3qi5qoPVNxk89mJts5QGe6lLAnY2HFko
Message-ID: <CACSVV01QLz40_sU4-jD6EHpnZ8ECRgxqQTaRjNdtRtgrDbAMCA@mail.gmail.com>
Subject: Re: [PATCH 3/3] drm/msm/mdp4: use msm_kms_init_vm() instead of
 duplicating it
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
        Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Antonino Maniscalco <antomani103@gmail.com>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzA2MDA5NyBTYWx0ZWRfX70ce0Ig02TQt
 2poaAtO8w+PGg46Xb6qLYeT1b1DYRP2BxlEp0GrzUKzG4SbwyzfZYZwQicrO4mFU2TojERiD3Xc
 fT+A6/cBDy/ovvjAPPy7ibBG3coCrsZ91yjWdU5L+NOW2BrfVSAg4mI2DMzbeUePdETmCmLt69w
 GR8e3h6i4IJ+013Wu7G2Cq2q+JfcnGiemieuPHkPk/M9x8ubJBhjx9O0JA+FeqxIdT3EfqyNxCH
 4+kgZiITbLcc+FZfKE4mtmUO3rtyDEnEpV4Sek1NS1ycEnHgP0DydMLOJoQTWPSI7TO1HAU9sWu
 hTLZKMqxauViQZm4PovfuXAN4IGr/BFKRmoHBZRa5OdC4342YKoq/vBpFxf4K489KR+c7nR3/95
 5SzV8XrcuOX9qENm1WXhi1gF6Dx8dkL5l6MUthHNHZsAOE5od4QuW+pE6Cm1eCobYy6nbdTw
X-Proofpoint-ORIG-GUID: c43iPVQrCNK4jWdOxRYs0l8BVAJz_Gz5
X-Authority-Analysis: v=2.4 cv=DNCP4zNb c=1 sm=1 tr=0 ts=686a9215 cx=c_pps
 a=4ztaESFFfuz8Af0l9swBwA==:117 a=IkcTkHD0fZMA:10 a=Wb1JkmetP80A:10
 a=EUspDBNiAAAA:8 a=q-jfb1koqDsd5eNGIpgA:9 a=QEXdDO2ut3YA:10
 a=TPnrazJqx2CeVZ-ItzZ-:22
X-Proofpoint-GUID: c43iPVQrCNK4jWdOxRYs0l8BVAJz_Gz5
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-07-04_07,2025-07-04_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 adultscore=0 spamscore=0 clxscore=1015 phishscore=0
 malwarescore=0 mlxlogscore=948 mlxscore=0 lowpriorityscore=0 bulkscore=0
 impostorscore=0 suspectscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2507060097

On Sun, Jul 6, 2025 at 7:02=E2=80=AFAM Dmitry Baryshkov
<dmitry.baryshkov@oss.qualcomm.com> wrote:
>
> On Sun, 6 Jul 2025 at 16:11, Rob Clark <rob.clark@oss.qualcomm.com> wrote=
:
> >
> > On Sun, Jul 6, 2025 at 3:50=E2=80=AFAM Dmitry Baryshkov
> > <dmitry.baryshkov@oss.qualcomm.com> wrote:
> > >
> > > Use the msm_kms_init_vm() function to allocate memory manager instead=
 of
> > > hand-coding a copy of it. Although MDP4 platforms don't have MDSS
> > > device, it's still safe to use the function as all MDP4 devices have
> > > IOMMU and the parent of the MDP4 is the root SoC device.
> >
> > So, originally the distinction was that mdp4 didn't have the mdss
> > wrapper.  Maybe it works out because device_iommu_mapped(mdp_dev)
> > returns true?
>
> Yes, as expressed in the cover letter.

Right, but with this patch, I think nothing is enforcing that, so we
could end up dereferencing mdp_dev->parent if the device did not have
an iommu.

I guess you could solve that with an extra device_iommu_mapped() in
mdp4_kms_init()

BR,
-R

> >
> > BR,
> > -R
> >
> > > Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> > > ---
> > >  drivers/gpu/drm/msm/disp/mdp4/mdp4_kms.c | 27 +++++-----------------=
-----
> > >  1 file changed, 5 insertions(+), 22 deletions(-)
> > >
> > > diff --git a/drivers/gpu/drm/msm/disp/mdp4/mdp4_kms.c b/drivers/gpu/d=
rm/msm/disp/mdp4/mdp4_kms.c
> > > index 88296c41d1a5eb0e16cb6ec4d0475000b6318c4e..41d236d30e71ebb6ac8a5=
9052529f36fadf15cd7 100644
> > > --- a/drivers/gpu/drm/msm/disp/mdp4/mdp4_kms.c
> > > +++ b/drivers/gpu/drm/msm/disp/mdp4/mdp4_kms.c
> > > @@ -391,11 +391,9 @@ static void read_mdp_hw_revision(struct mdp4_kms=
 *mdp4_kms,
> > >
> > >  static int mdp4_kms_init(struct drm_device *dev)
> > >  {
> > > -       struct platform_device *pdev =3D to_platform_device(dev->dev)=
;
> > >         struct msm_drm_private *priv =3D dev->dev_private;
> > >         struct mdp4_kms *mdp4_kms =3D to_mdp4_kms(to_mdp_kms(priv->km=
s));
> > >         struct msm_kms *kms =3D NULL;
> > > -       struct msm_mmu *mmu;
> > >         struct drm_gpuvm *vm;
> > >         int ret;
> > >         u32 major, minor;
> > > @@ -458,29 +456,14 @@ static int mdp4_kms_init(struct drm_device *dev=
)
> > >         mdp4_disable(mdp4_kms);
> > >         mdelay(16);
> > >
> > > -       mmu =3D msm_iommu_new(&pdev->dev, 0);
> > > -       if (IS_ERR(mmu)) {
> > > -               ret =3D PTR_ERR(mmu);
> > > +       vm =3D msm_kms_init_vm(mdp4_kms->dev);
> > > +       if (IS_ERR(vm)) {
> > > +               ret =3D PTR_ERR(vm);
> > >                 goto fail;
> > > -       } else if (!mmu) {
> > > -               DRM_DEV_INFO(dev->dev, "no IOMMU configuration is no =
longer supported\n");
> > > -               ret =3D -ENODEV;
> > > -               goto fail;
> > > -       } else {
> > > -               vm  =3D msm_gem_vm_create(dev, mmu, "mdp4",
> > > -                                       0x1000, 0x100000000 - 0x1000,
> > > -                                       true);
> > > -
> > > -               if (IS_ERR(vm)) {
> > > -                       if (!IS_ERR(mmu))
> > > -                               mmu->funcs->destroy(mmu);
> > > -                       ret =3D PTR_ERR(vm);
> > > -                       goto fail;
> > > -               }
> > > -
> > > -               kms->vm =3D vm;
> > >         }
> > >
> > > +       kms->vm =3D vm;
> > > +
> > >         ret =3D modeset_init(mdp4_kms);
> > >         if (ret) {
> > >                 DRM_DEV_ERROR(dev->dev, "modeset_init failed: %d\n", =
ret);
> > >
> > > --
> > > 2.39.5
> > >
>
>
>
> --
> With best wishes
> Dmitry

Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC2762D5C8D
	for <linux-kernel@vger.kernel.org>; Sat, 14 Jun 2025 15:03:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749913416; cv=none; b=Z/UULIKfGiogeNyYIlO1jcyDSAgJwkRVVPHuDl1bEvnJVC0cv633vmGnXfEhjH6ka7Zs38pdDVJuS4Zl7rrMNU7FwsZ4WQ+pAeVY6qsNPOyQP4wYagUyspjsBNO6l3I7ErkQYi8WYQI/s17Itv5oOvgyMz2xY3i0iQRfrTiZ0X4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749913416; c=relaxed/simple;
	bh=eyKzlsL5WCqtOQn/qbqrDuEpDBlTABg2pPwALeld87M=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=iUlpXuHPvWrqIAh35Fzsy4iff7q1tGTHZgKujIYZlDYrzJgyhs2EYOVpF76uVOhE5WWZdQAkXbrvNOFQuFJ7SKrfPikq9J7p09RqZe5LK0K5AUyDNPSiPTMeqO2jKp6vpdywpbAa54CG+JZKQOKeE1pcYrxyf7O1IqYHcjBMdiE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=LUZiKVOG; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="LUZiKVOG"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55EAFaom012596
	for <linux-kernel@vger.kernel.org>; Sat, 14 Jun 2025 15:03:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:reply-to:subject:to; s=
	qcppdkim1; bh=vdZjz7M5I67BPSXAHPCUJIISpaR/LhGu3qlg97D2mDw=; b=LU
	ZiKVOGP5NR6khOyl2rNr7XgTkZSlm0WFeJPyhpqm2UY6fXzYLpwkFiwk+O5XszI0
	v4DoKqjQTE1yoVvDpQwIiwRWk8exgl2+lxkHloPy7vnUG9oXMdwcErjtGWBgm6T3
	63YwTIyJ6oMMwYHVqU5QU2siMgik3oRSGwauJW76fmybcsnIXRYg/1/mbyxO0zK0
	hvBID1Hg2ogWZqWlusjEcmmwjkthf/RNuZEbhbaOe3Ytrt/EnNWtonJuO2EeUBIX
	WRS3DHTtaCcKngK2NbcQn+7KPHn3UVZWXW61I16RN3wRwIjc7Vta+OHAz/hDXJj3
	o4LYZUim0znUr9/ypbRQ==
Received: from mail-oa1-f71.google.com (mail-oa1-f71.google.com [209.85.160.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4791h90p87-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Sat, 14 Jun 2025 15:03:33 +0000 (GMT)
Received: by mail-oa1-f71.google.com with SMTP id 586e51a60fabf-2eacd9f1342so1780817fac.1
        for <linux-kernel@vger.kernel.org>; Sat, 14 Jun 2025 08:03:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749913412; x=1750518212;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :reply-to:in-reply-to:references:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=vdZjz7M5I67BPSXAHPCUJIISpaR/LhGu3qlg97D2mDw=;
        b=c7vTEz/wDRnU5n/Z1xsq9O+OHYomUfwNmGS0ssDgNVQakzRaCOkj/XL1tRiJCp/YB1
         MnxfLYj+8ARabZL7gNOjblzSSnMkYI3NVyJshroudAltl+2DFAeymuXX4LMOCIjB9vdm
         nKEEWewHO8SU5BMlTI33cH2bsAev2Del22QosqpUxjUmp9+R1VyapRNGwXVVMLy9QBNF
         LByHIMYtEIJJgxWO+tIAXqCYKIWbOodZamstG81Fg+1vRh3JKob/cDQxlZDIcMDN1B0P
         n68r0ViZkLfrHUPUVVjZWFurBwBBTKc22uZgd93H1bz/4BKZAs+32H6WOaGqIncA3X03
         YIGQ==
X-Forwarded-Encrypted: i=1; AJvYcCW5+bYiD9GG8QTjck9i21I2kd7mdXifJqcSeYRacVbIce/DkjkJpiZzfkdFEb7Vrni5CuQwyFij4ZdekGM=@vger.kernel.org
X-Gm-Message-State: AOJu0YwRwCFu/aka70DFfKlRIttLJd/p3G0r+n4xYhTRmcEM2fPl8rOJ
	8plNa5P1Xm0NE9OoM0wukg8qAKAF+mtMWESU039CtQYJEMe0hkrel5QDYv73fyVoC9GyJ/JylSJ
	9QsWDuaUiXgv8DV9TnEfsMpDkw2iM3HykDSLnIIQ2D/3iapNiD+NGEm4cIYohvZGoyVTwsK9rqu
	mWdeZm4YoICu5x0AP6mr2+0eaQC572DhB5I1a6r2Gy6A==
X-Gm-Gg: ASbGnctmQtele2HjPuLjFTj8vK8hxSuJiCdjrFivZWcwZYAelAJs+Vbx42OKlaOLjg7
	PUltHT8F4ZhWml9hH05JWK8TC4gZKKZBCsjD+5ZvwDY8uCkK3MQrs3MI+vbqvv2M+I6OcZ6ARhl
	BbZeNZDDeVewuLH9wkSFo7CzMzZz8z4PrGb04=
X-Received: by 2002:a05:6870:71c2:b0:2d5:cae:5426 with SMTP id 586e51a60fabf-2eaf0710cd1mr2237171fac.3.1749913412488;
        Sat, 14 Jun 2025 08:03:32 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFAs1udGbCcoyJZ53+Qfx4mGg5AUdc8UuyxtXcDaTDAUoh8mUnFpiYIv5F7guhSyFn8Bsz+1/5o15pIN8xWHG0=
X-Received: by 2002:a05:6870:71c2:b0:2d5:cae:5426 with SMTP id
 586e51a60fabf-2eaf0710cd1mr2237149fac.3.1749913412064; Sat, 14 Jun 2025
 08:03:32 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250613235705.28006-1-robin.clark@oss.qualcomm.com>
 <20250613235705.28006-3-robin.clark@oss.qualcomm.com> <aE1RPZ_-oFyM4COy@pollux>
In-Reply-To: <aE1RPZ_-oFyM4COy@pollux>
Reply-To: rob.clark@oss.qualcomm.com
From: Rob Clark <rob.clark@oss.qualcomm.com>
Date: Sat, 14 Jun 2025 08:03:20 -0700
X-Gm-Features: AX0GCFvhxCLQ_vMYEmvmkp5K4B4S-_ACriEJ6pzrfWq_hvEdUauhp-cferZaueE
Message-ID: <CACSVV00uwmuAC4eMi-4QiF4sOu4r9u8eXxyAgt83YS8Yfgoemg@mail.gmail.com>
Subject: Re: [PATCH 2/2] drm/gpuvm: Add locking helpers
To: Danilo Krummrich <dakr@redhat.com>
Cc: dri-devel@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
        freedreno@lists.freedesktop.org,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        open list <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-ORIG-GUID: k8Jij2zIE5jF4kMCTaBaV55bZJc7iU6r
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjE0MDEyNiBTYWx0ZWRfX7IyZCxQsydHc
 MJp+wimrjHnQjgZnvG6fklOQ5yVuUNvCdGYkFohyFb/pvtVELzDU87sXszharfIngsvWPT3+syb
 RNnrTQPAKVGUv665QKdjI7GXxPI94ziHNq6rKLhsuQdVfcLGCg9unRYDsKz/CgzvetWoabdpwef
 k1Y0IhwqQBBs81/eE0Va3Wz3WD+0yGT83xHvdrosEAwrHcF97H+AG69vaQGPGmV+vJGztuQX4XF
 iKrzdY7jsJGyePjY/s4J8pzmaed8yEuUSOapwv1LYiCdFGn0aYGqG6GIecexzb9ynAAWSTpYH/t
 OhBz24BGLmGN+qDrQVcH5in+kHxW2Tdp3Use30oCTDafb1HVZgK+dsjAOPP1XH71JXMgurGuITE
 Uz2jfu4JQxugo+xOJJyGHa82Sd2GfxE64jGXWybYBMzrMcmr/JKyuidYcylQz4sYK3r3CJVE
X-Authority-Analysis: v=2.4 cv=UL/dHDfy c=1 sm=1 tr=0 ts=684d8f45 cx=c_pps
 a=CWtnpBpaoqyeOyNyJ5EW7Q==:117 a=IkcTkHD0fZMA:10 a=6IFa9wvqVegA:10
 a=e5mUnYsNAAAA:8 a=20KFwNOVAAAA:8 a=EUspDBNiAAAA:8 a=ldQU9O5Iyk-eXRRwSokA:9
 a=QEXdDO2ut3YA:10 a=vh23qwtRXIYOdz9xvnmn:22 a=Vxmtnl_E_bksehYqCbjh:22
X-Proofpoint-GUID: k8Jij2zIE5jF4kMCTaBaV55bZJc7iU6r
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-14_05,2025-06-13_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 clxscore=1015 suspectscore=0 priorityscore=1501 adultscore=0
 lowpriorityscore=0 bulkscore=0 spamscore=0 phishscore=0 mlxlogscore=999
 malwarescore=0 impostorscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2506140126

On Sat, Jun 14, 2025 at 3:39=E2=80=AFAM Danilo Krummrich <dakr@redhat.com> =
wrote:
>
> On Fri, Jun 13, 2025 at 04:57:03PM -0700, Rob Clark wrote:
> > For UNMAP/REMAP steps we could be needing to lock objects that are not
> > explicitly listed in the VM_BIND ioctl in order to tear-down unmapped
> > VAs.  These helpers handle locking/preparing the needed objects.
>
> Yes, that's a common use-case. I think drivers typically iterate through =
their
> drm_gpuva_ops to lock those objects.
>
> I had a look at you link [1] and it seems that you keep a list of ops as =
well by
> calling vm_op_enqueue() with a new struct msm_vm_op from the callbacks.
>
> Please note that for exactly this case there is the op_alloc callback in
> struct drm_gpuvm_ops, such that you can allocate a custom op type (i.e. s=
truct
> msm_vm_op) that embedds a struct drm_gpuva_op.

I did use drm_gpuvm_sm_xyz_ops_create() in an earlier iteration of my
VM_BIND series, but it wasn't quite what I was after.  I wanted to
apply the VM updates immediately to avoid issues with a later
map/unmap overlapping an earlier map, which
drm_gpuvm_sm_xyz_ops_create() doesn't really handle.  I'm not even
sure why this isn't a problem for other drivers unless userspace is
providing some guarantees.  Once I realized I only wanted to defer the
application of the pgtable changes, but keep all the
locking/allocation/etc in the synchronous part of the ioctl,
vm_op_enqueue() was the natural solution.

> Given that, I think the proposed locking helpers here would make more sen=
se to
> operate on struct drm_gpuva_ops, rather than the callbacks.

Hmm, perhaps, but that requires building an otherwise unneeded ops
list.  So the current approach seemed simpler, and something that
would work regardless of whether the driver was using an ops list.

An alternative I was considering was letting the driver pass it's own
drm_gpuvm_ops struct where it could implement the locking callback.
But locking is enough of a common thing that this approach seemed
cleaner.

> Besides that, few comments below.
>
> --
>
> One additional unrelated note, please don't use BUG_ON() in your default =
op
> switch case. Hitting this case in a driver does not justify to panic the =
whole
> kernel. BUG() should only be used if the machine really hits an unrecover=
able
> state. Please prefer a WARN_ON() splat instead.
>
> [1] https://gitlab.freedesktop.org/robclark/msm/-/blob/sparse-newer/drive=
rs/gpu/drm/msm/msm_gem_vma.c?ref_type=3Dheads#L1150

ok, fair

> > Note that these functions do not strictly require the VM changes to be
> > applied before the next drm_gpuvm_sm_map_lock()/_unmap_lock() call.  In
> > the case that VM changes from an earlier drm_gpuvm_sm_map()/_unmap()
> > call result in a differing sequence of steps when the VM changes are
> > actually applied, it will be the same set of GEM objects involved, so
> > the locking is still correct.
>
> I'm not sure about this part, how can we be sure that's the case?

I could be not imaginative enough here, so it is certainly worth a
second opinion.  And why I explicitly called it out in the commit msg.
But my reasoning is that any new op in the second pass that actually
applies the VM updates which results from overlapping with a previous
update in the current VM_BIND will only involve GEM objects from that
earlier update, which are already locked.

> > Signed-off-by: Rob Clark <robin.clark@oss.qualcomm.com>
> > ---
> >  drivers/gpu/drm/drm_gpuvm.c | 81 +++++++++++++++++++++++++++++++++++++
> >  include/drm/drm_gpuvm.h     |  8 ++++
> >  2 files changed, 89 insertions(+)
> >
> > diff --git a/drivers/gpu/drm/drm_gpuvm.c b/drivers/gpu/drm/drm_gpuvm.c
> > index 0ca717130541..197066dd390b 100644
> > --- a/drivers/gpu/drm/drm_gpuvm.c
> > +++ b/drivers/gpu/drm/drm_gpuvm.c
> > @@ -2390,6 +2390,87 @@ drm_gpuvm_sm_unmap(struct drm_gpuvm *gpuvm, void=
 *priv,
> >  }
> >  EXPORT_SYMBOL_GPL(drm_gpuvm_sm_unmap);
> >
> > +static int
> > +drm_gpuva_sm_step_lock(struct drm_gpuva_op *op, void *priv)
> > +{
> > +     struct drm_exec *exec =3D priv;
> > +
> > +     switch (op->op) {
> > +     case DRM_GPUVA_OP_REMAP:
> > +             if (op->remap.unmap->va->gem.obj)
> > +                     return drm_exec_lock_obj(exec, op->remap.unmap->v=
a->gem.obj);
> > +             return 0;
> > +     case DRM_GPUVA_OP_UNMAP:
> > +             if (op->unmap.va->gem.obj)
> > +                     return drm_exec_lock_obj(exec, op->unmap.va->gem.=
obj);
> > +             return 0;
> > +     default:
> > +             return 0;
> > +     }
> > +}
> > +
> > +static const struct drm_gpuvm_ops lock_ops =3D {
> > +     .sm_step_map =3D drm_gpuva_sm_step_lock,
> > +     .sm_step_remap =3D drm_gpuva_sm_step_lock,
> > +     .sm_step_unmap =3D drm_gpuva_sm_step_lock,
> > +};
> > +
> > +/**
> > + * drm_gpuvm_sm_map_lock() - locks the objects touched by a drm_gpuvm_=
sm_map()
>
> I think we should name this drm_gpuvm_sm_map_exec_lock() since it only ma=
kes
> sense to call this from some drm_exec loop.

fair

> > + * @gpuvm: the &drm_gpuvm representing the GPU VA space
> > + * @exec: the &drm_exec locking context
> > + * @num_fences: for newly mapped objects, the # of fences to reserve
> > + * @req_addr: the start address of the range to unmap
> > + * @req_range: the range of the mappings to unmap
> > + * @req_obj: the &drm_gem_object to map
> > + * @req_offset: the offset within the &drm_gem_object
> > + *
> > + * This function locks (drm_exec_lock_obj()) objects that will be unma=
pped/
> > + * remapped, and locks+prepares (drm_exec_prepare_object()) objects th=
at
> > + * will be newly mapped.
> > + *
> > + * Returns: 0 on success or a negative error code
> > + */
> > +int
> > +drm_gpuvm_sm_map_lock(struct drm_gpuvm *gpuvm,
> > +                   struct drm_exec *exec, unsigned int num_fences,
> > +                   u64 req_addr, u64 req_range,
> > +                   struct drm_gem_object *req_obj, u64 req_offset)
> > +{
> > +     if (req_obj) {
> > +             int ret =3D drm_exec_prepare_obj(exec, req_obj, num_fence=
s);
> > +             if (ret)
> > +                     return ret;
> > +     }
>
> Let's move this to drm_gpuva_sm_step_lock().

My reasoning to handle this special case here is that it avoided
passing num_fences down to the callback (which would necessitate
having an args struct).  I can change this if you feel strongly about
it, but this seemed simpler to me.

BR,
-R

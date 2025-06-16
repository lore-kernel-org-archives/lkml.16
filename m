Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ACE1B20F085
	for <linux-kernel@vger.kernel.org>; Mon, 16 Jun 2025 22:25:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750112724; cv=none; b=pVB51jGM3DLP31QBj8IeO5xbpujNe1DIaWS76KOu6CxBq9FXtdIvknHt9ALaTJBXjiBjR7gDFugb7joi34/hf32CCj1knHi8+KH26af3pDfYer/5pNsq3u/rssVxGHyQrxYMpCE0chUaw+esjg55bxs91DUliFwAuUTSbLNpryI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750112724; c=relaxed/simple;
	bh=DXsKmMG9HTfhTGoXnHGhFoBv1gsxV17dbOhCXqmASYc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=dAT0rDKstnhwdkY0Prhao3l0nyZGk3D1aGp8S6Y9x3PvAFdzk00udncmj0TR1a+5ZCbOs+Vs6dCw4UsHlKR92gh4bs5NSySJsQi4FRLzQSubg9+8dLBYj1eO1U74GnzdsxuoA8Fowq4EFEAQMJx3twZQM2WXNntxWzV0LCwrxm0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=QWcv7X10; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="QWcv7X10"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55GKCPSF024672
	for <linux-kernel@vger.kernel.org>; Mon, 16 Jun 2025 22:25:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:reply-to:subject:to; s=
	qcppdkim1; bh=BKywj4VHkEs0JU42aBEgCevEgvNKao+BH8DsvhKGCeQ=; b=QW
	cv7X101Rmwv6xFw+4znvDH6w6EZfXm+oYvYXcRBhXYo5xJWI78z9xk6jhBWuBH5N
	ZAvzMWBrPvPlBclgm0e8bTpCUgPJfX26iI31cUEp60M499IGVguwBfaZIEDYw4Xt
	bXY2DzqODWsXDStlJ7s0lMb9ILHmI16M6Ygq0GsET9R6K2uIQ/B3Z1f9xzP/uSCB
	Btb6S0Am+V3pTUVBZtAES+SRO8Ti0/ntw3SbCpDv1h04jZWMHx6f8bDDRzaYuFKJ
	cm3wxiEjQg4U5pg8UqqZsBRGGBwrKz7Dja3rXjSvcXwHerdGW/yn7eAdHmSfzNBi
	Cjs5Qa+y6dXiKMC9fW8A==
Received: from mail-ot1-f72.google.com (mail-ot1-f72.google.com [209.85.210.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4792c9x1pc-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 16 Jun 2025 22:25:21 +0000 (GMT)
Received: by mail-ot1-f72.google.com with SMTP id 46e09a7af769-72c3169fa24so1169033a34.3
        for <linux-kernel@vger.kernel.org>; Mon, 16 Jun 2025 15:25:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750112720; x=1750717520;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :reply-to:in-reply-to:references:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=BKywj4VHkEs0JU42aBEgCevEgvNKao+BH8DsvhKGCeQ=;
        b=lRTRZjmF5whQG8yovGZvvDFGNxwrwYkB3HGhesprpF4bOHNdkQ806KiKmNmyfY06DX
         CiHV2IpxsfxcI8Zm2C7vYbEh0+WnRYriz+U1mmD0LuYijqWJnwCpjxL6CiyCMUfM8zr4
         UBIG1GI5ViwxD3nPP7zVqBKnRCTvZZllZyNYvmR7Lw1l/elGRh6+dfgVY+hnuArp4Ujg
         /0YJ0wvnpE3UTz9CZ5nOgL1F/Whui3QMQ6G7fXYQ1DatFw1GK+JNKQ/ATE8aPK7X/PtS
         DTFcv5vT6ntrHZQlg06croFOHpO9wOfpW39dy2qo3ndlEXj9UIeE3tgKrlUU1sAZR2jD
         CopQ==
X-Forwarded-Encrypted: i=1; AJvYcCVfdnn0OfpNTDWzDMtTABi+K9dPprS+FfDnZ94YtuOhUO0YDfKXy2GukgcGBqAA3vdoPzLtFVMYgPzyIgQ=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw9WxWtHgJRT3qrxsOQ+LDnjDcJ7U2ANROraRStYFKf6UN/V77a
	PiQ7y5cfHonKQbY+zEw8TEDIhgN3Kmtd87q0WWo2TQOKneORUfKaMyaESRQtxyI6Thb82c23Fmv
	GZifb5bu8ceW+cEoaw8Thu9PQR+ggA5t2a/8yArmNODxjo2lPl3oSu9T+VdKUSAgHqS+7pYMp9x
	egNMeHem3iJj8ENKxg8DLpayZ8XxiW9Jktk3mSKriMYg==
X-Gm-Gg: ASbGncslVVMZraEYkAusyPeWRJD/KM8q1nFn3jNpGotHBA9Gmuzu/oniBZQXGkIKNDD
	c/UVoxBcO7tikjvidliFRfUO7xSEHpLGN8EPU7v+vNg5eAWW1j+XdmIW+R94BRW8ra02sQnqG2q
	CXe1AdjVqOlWVOg0/CRS3JoVEtdUMVHnJH7Xo=
X-Received: by 2002:a05:6871:3a06:b0:2b7:7abf:df6b with SMTP id 586e51a60fabf-2eaf08af8f4mr6927182fac.26.1750112720124;
        Mon, 16 Jun 2025 15:25:20 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFqmXfWLhQeUMt/Jl85rjVo4uK/LrD8KsRZegFSv17dxtAYSc5JIIXm1M0FOijdpfihvv5RfghpXpsD5Ezmz34=
X-Received: by 2002:a05:6871:3a06:b0:2b7:7abf:df6b with SMTP id
 586e51a60fabf-2eaf08af8f4mr6927167fac.26.1750112719638; Mon, 16 Jun 2025
 15:25:19 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250613235705.28006-1-robin.clark@oss.qualcomm.com>
 <20250613235705.28006-3-robin.clark@oss.qualcomm.com> <aE1RPZ_-oFyM4COy@pollux>
 <CACSVV00uwmuAC4eMi-4QiF4sOu4r9u8eXxyAgt83YS8Yfgoemg@mail.gmail.com> <aFCO7_RHuAaGyq1Q@pollux>
In-Reply-To: <aFCO7_RHuAaGyq1Q@pollux>
Reply-To: rob.clark@oss.qualcomm.com
From: Rob Clark <rob.clark@oss.qualcomm.com>
Date: Mon, 16 Jun 2025 15:25:08 -0700
X-Gm-Features: AX0GCFtOto0zyVpQeYp5jBop9UvSHgX2u-zFbK-GGootkeuIkxZ2PZ8ZpDl8bmA
Message-ID: <CACSVV03WboQp_A1bzQ+xpX5DDkfaoXmbTuo9RfZ9bMaVTqdU+A@mail.gmail.com>
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
X-Proofpoint-GUID: YD2clWepG0jppUWe_uUfHeD7EwLKUhQe
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjE2MDE1NyBTYWx0ZWRfX/bh2HlOdX1uB
 kJjEhFfs63omUnhog94n2jkSEbn525Yc/sl8YZYzDA93tQWbxc8ybCUVWWMZQSyaoxnvjw9vXfs
 c4m8rKth6pb3LMANjjagpXBOUkYQ5tr9kQae0O9lchsHnFB6FOlHOPyoLNZje5tZZmJi5U3o/KO
 R6mvyS/S4Fvezd5foYrlingPPcWY6h51Q/n0F0r9jxXbHW42/e1wNi0qxBoA0y2gXIMszWQXlQi
 t8duxY6gjEZ3W6wc4C7xZ5RYQUr56UVGQGW6xG+Yq9uL3T5nkGrC/ffz76oLTt/ACZ8jxvdFvUf
 7YlhmRsHQOOPX/7FDc7e1He8DyJOG73aRyn0z2N2gH3Bl6inznNMOG/ooSbWnX3Ima4gJB5cFWj
 38mOTknFR78cwm8KJzQpeI5V1wS5g2NySOCQacCET/5mtUxmpaQisM6Waj+J7nLLjpBXjBLx
X-Proofpoint-ORIG-GUID: YD2clWepG0jppUWe_uUfHeD7EwLKUhQe
X-Authority-Analysis: v=2.4 cv=etffzppX c=1 sm=1 tr=0 ts=685099d1 cx=c_pps
 a=+3WqYijBVYhDct2f5Fivkw==:117 a=IkcTkHD0fZMA:10 a=6IFa9wvqVegA:10
 a=20KFwNOVAAAA:8 a=PboIhGL1U7HzPZusu2gA:9 a=QEXdDO2ut3YA:10
 a=eYe2g0i6gJ5uXG_o6N4q:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-16_11,2025-06-13_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 impostorscore=0 adultscore=0 spamscore=0 malwarescore=0
 priorityscore=1501 suspectscore=0 phishscore=0 mlxlogscore=999
 lowpriorityscore=0 bulkscore=0 mlxscore=0 classifier=spam authscore=0
 authtc=n/a authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2506160157

On Mon, Jun 16, 2025 at 2:39=E2=80=AFPM Danilo Krummrich <dakr@redhat.com> =
wrote:
>
> On Sat, Jun 14, 2025 at 08:03:20AM -0700, Rob Clark wrote:
> > On Sat, Jun 14, 2025 at 3:39=E2=80=AFAM Danilo Krummrich <dakr@redhat.c=
om> wrote:
> > >
> > > On Fri, Jun 13, 2025 at 04:57:03PM -0700, Rob Clark wrote:
> > > > For UNMAP/REMAP steps we could be needing to lock objects that are =
not
> > > > explicitly listed in the VM_BIND ioctl in order to tear-down unmapp=
ed
> > > > VAs.  These helpers handle locking/preparing the needed objects.
> > >
> > > Yes, that's a common use-case. I think drivers typically iterate thro=
ugh their
> > > drm_gpuva_ops to lock those objects.
> > >
> > > I had a look at you link [1] and it seems that you keep a list of ops=
 as well by
> > > calling vm_op_enqueue() with a new struct msm_vm_op from the callback=
s.
> > >
> > > Please note that for exactly this case there is the op_alloc callback=
 in
> > > struct drm_gpuvm_ops, such that you can allocate a custom op type (i.=
e. struct
> > > msm_vm_op) that embedds a struct drm_gpuva_op.
> >
> > I did use drm_gpuvm_sm_xyz_ops_create() in an earlier iteration of my
> > VM_BIND series, but it wasn't quite what I was after.  I wanted to
> > apply the VM updates immediately to avoid issues with a later
> > map/unmap overlapping an earlier map, which
> > drm_gpuvm_sm_xyz_ops_create() doesn't really handle.  I'm not even
> > sure why this isn't a problem for other drivers unless userspace is
> > providing some guarantees.
>
> The drm_gpuva_ops are usually used in a pattern like this.
>
>         vm_bind {
>                 for_each_vm_bind_operation {
>                         drm_gpuva_for_each_op {
>                                 // modify drm_gpuvm's interval tree
>                                 // pre-allocate memory
>                                 // lock and prepare objects
>                         }
>                 }
>
>                 drm_sched_entity_push_job();
>         }
>
>         run_job {
>                 for_each_vm_bind_operation {
>                         drm_gpuva_for_each_op {
>                                 // modify page tables
>                         }
>                 }
>         }
>
>         run_job {
>                 for_each_vm_bind_operation {
>                         drm_gpuva_for_each_op {
>                                 // free page table structures, if any
>                                 // free unused pre-allocated memory
>                         }
>                 }
>         }
>
> What did you do instead to get map/unmap overlapping? Even more interesti=
ng,
> what are you doing now?

From what I can tell, the drivers using drm_gpva_for_each_op()/etc are
doing drm_gpuva_remove() while iterating the ops list..
drm_gpuvm_sm_xyz_ops_create() itself does not modify the VM.  So this
can only really work if you perform one MAP or UNMAP at a time.  Or at
least if you process the VM modifying part of the ops list before
proceeding to the next op.

>
> > Once I realized I only wanted to defer the
> > application of the pgtable changes, but keep all the
> > locking/allocation/etc in the synchronous part of the ioctl,
> > vm_op_enqueue() was the natural solution.
>
> But vm_op_enqueue() creates exactly this list of operations you would get=
 from
> drm_gpuvm_sm_{map,unmap}_ops_create(), just manually, no?

Only if each job only has a single VM_BIND MAP or UNMAP or if you
process the ops immediately.

OTOH vm_op_enqueue() generates the list of pgtable updates to perform
for a list of MAP/UNMAP ioctl ops.  I guess it would be an equivalent
of combining drm_gpuvm_sm_xyz_ops_create() plus the actual driver
callbacks in a single pass.

BR,
-R

> <snip>
>
> > > > Note that these functions do not strictly require the VM changes to=
 be
> > > > applied before the next drm_gpuvm_sm_map_lock()/_unmap_lock() call.=
  In
> > > > the case that VM changes from an earlier drm_gpuvm_sm_map()/_unmap(=
)
> > > > call result in a differing sequence of steps when the VM changes ar=
e
> > > > actually applied, it will be the same set of GEM objects involved, =
so
> > > > the locking is still correct.
> > >
> > > I'm not sure about this part, how can we be sure that's the case?
> >
> > I could be not imaginative enough here, so it is certainly worth a
> > second opinion.  And why I explicitly called it out in the commit msg.
> > But my reasoning is that any new op in the second pass that actually
> > applies the VM updates which results from overlapping with a previous
> > update in the current VM_BIND will only involve GEM objects from that
> > earlier update, which are already locked.
>
> Yeah, it's probably fine, since, as you say, the only additional object c=
an be
> the req_obj from the previous iteration.
>

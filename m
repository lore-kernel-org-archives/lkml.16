Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C37AA27F01B
	for <linux-kernel@vger.kernel.org>; Wed, 18 Jun 2025 21:56:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750283814; cv=none; b=IcIvBGCjNnO6gjmn2J6PU0WsWPSWno59OOZnW63cnY9eQRapHLWJYdSQHQDYRd8HH1Mrib0lVQ97/3RvmZ5b4wg7JSa7q/Dk+/OurjThos9EfhduIq0FowhfBsh0auqHkVOn1phuCQTXYJvJ+c2p2hO2Y9UDEILDVvmCOzcjvzQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750283814; c=relaxed/simple;
	bh=PKDhBnVRIk9eKwlkV9nCTmNg4BcpCOdgDa2yyBD3kto=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=KlTx5AuZ9UbqnwC+PVPEuacwoO4BK2br5cdn1S1gtqw/hTtUC1qD+u5Pb5WBkAHbmmC2QjhgDokEz6ZG92qRisQIV0Xm79rWmCDXwl0J7kZ2m95ez1Z0JMRcHGEg5V0G8Qp4suAE27kxZ4Kx+aEzinXUaUxZ1Fha9xYSjEFRFCM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=RWimqCUK; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="RWimqCUK"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55IIsDYX008236
	for <linux-kernel@vger.kernel.org>; Wed, 18 Jun 2025 21:56:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:reply-to:subject:to; s=
	qcppdkim1; bh=yhi2gUMJI0GE6nkozrV+9GIwcZZGzNlNIqUIg0Ii+H0=; b=RW
	imqCUKuFGFflkZYP4qCHeriH/9TLGe/K4aDUHOQNRu8GjS0eib6V26+M4zsBoop0
	S385uPczv6cabfmOlL1rZnajQ2sjxvPou9g6AvwJZlo8ir0O/huOGVozrUtOD6iw
	d9QWfP06oN1nt7ZijwDrueEC3oeDKM1QFDqE9WOuMRO+U8iLLyU6RogCjSsKDYWH
	WS4ovx4USd8sZchLL3Fhy2n1QLHqUpUchiwlsIBuT9dqtOUviKOSrbZRCPynuWxB
	Iw01CyrlqtxYa8ow9KVGv5FEGv2W2EX4CPjCSNZQXZEFE1yI4uL2ULwxdJ8dCMwi
	0wiUaUmzC0kylWUhcrNQ==
Received: from mail-oo1-f70.google.com (mail-oo1-f70.google.com [209.85.161.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47928mnnrw-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 18 Jun 2025 21:56:50 +0000 (GMT)
Received: by mail-oo1-f70.google.com with SMTP id 006d021491bc7-6114cffd99cso188486eaf.3
        for <linux-kernel@vger.kernel.org>; Wed, 18 Jun 2025 14:56:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750283810; x=1750888610;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :reply-to:in-reply-to:references:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=yhi2gUMJI0GE6nkozrV+9GIwcZZGzNlNIqUIg0Ii+H0=;
        b=aG2SK4/5N9B3msY8k7m65AtsW3hWEb2L03s3teb5Rbts6mUyljfcgOGAlMXBmmYGe0
         XwC1+aJJ3E+9Jr+VAsFdIszva7NqYaqTngbYsaJ5ye/B5vi7s1EIQ/RLmm1vspXTwCtc
         yzd6lerjeGpwZcCzt8T4L/rBsPNoF0COhDpMFgxErWXiNoQltIKjD6IZcZnZMDMBpqLQ
         ZPEbE3C2K8GYB/kH1d49Mr+onGmhcTjOmEZIajv/OfeXnHWyZ7eA6Jp6f2041Np3rX9u
         SjBg8j5Qn5sXPS5vnUAeX64+gfWkfiB4xd0tY7DRaQGlWOm4Zm9duLZ6xoWoOhqa1zpK
         QFEQ==
X-Forwarded-Encrypted: i=1; AJvYcCV1JJL8O0OmZxnypN8jQlKIpH5WLD7HvyKI1cPY6k5a7VmYXnVEppWchxChcVhCuhKWrBCjRkzDlRKPLmY=@vger.kernel.org
X-Gm-Message-State: AOJu0YwudBbWwkLk6twSQq1MTQJOFhWz/7dPlG2XJ9DGfwDqESjN5hxt
	QRn8EFxDa7AdFaE9wTgco2vEXqzTyRyvgv6S5KcBjnRAYP0RpdGKlcFpJ5d8TIApKdMKa8uXH4k
	G0p251RwJ8weAh5Hv4qFK8tzrKN6wQoO+wOiYaXzeEGt2qjMLKUkuJw+Ppzra/HuDXU1l+Sc6Dv
	dD07qno97aBZbmU1Y2GAXuMiJW+3dqS16UrMbao+KIyQ==
X-Gm-Gg: ASbGnctTh3j0OtzMxNy2UCrCzZhMn+Ln5CuqTnlDEXj5EDFDerfC+eG0NPLvlFNNLES
	oseMD6lXK7+Ke/i4NweplIhmBQXWoFoqOikn/QwICKwJ69N8IW9UKQ9rqjFafF3xDWri73uKmYY
	a3rUcjj9f+QDPPsrlnPzO9qnmW+BETCO7Y4Os=
X-Received: by 2002:a05:6870:b413:b0:2d6:7266:a8d8 with SMTP id 586e51a60fabf-2eaf07f45edmr11310580fac.3.1750283809643;
        Wed, 18 Jun 2025 14:56:49 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHUI4eoCFyxm0AQjdCzb9oYhfBUJv5zftI1me8lyA42OhvAvHVS0Y5LoZkIu8ti01QiSTWjmhk5JnrDmlBbqq4=
X-Received: by 2002:a05:6870:b413:b0:2d6:7266:a8d8 with SMTP id
 586e51a60fabf-2eaf07f45edmr11310569fac.3.1750283809238; Wed, 18 Jun 2025
 14:56:49 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250613235705.28006-1-robin.clark@oss.qualcomm.com>
 <20250613235705.28006-3-robin.clark@oss.qualcomm.com> <aE1RPZ_-oFyM4COy@pollux>
 <CACSVV00uwmuAC4eMi-4QiF4sOu4r9u8eXxyAgt83YS8Yfgoemg@mail.gmail.com>
 <aFCO7_RHuAaGyq1Q@pollux> <CACSVV03WboQp_A1bzQ+xpX5DDkfaoXmbTuo9RfZ9bMaVTqdU+A@mail.gmail.com>
 <aFE6pq8l33NXfFdT@pollux> <CACSVV00VzOfTDh2sKst+POzkZ-5MH+0BDY-GVB2WKTyONRrHjw@mail.gmail.com>
 <CACSVV00cng4PzHzqydGw_L34_f+6KiZTyCRdggNfHaDePGzFOA@mail.gmail.com> <aFMuV7PNfSZVWb-b@pollux>
In-Reply-To: <aFMuV7PNfSZVWb-b@pollux>
Reply-To: rob.clark@oss.qualcomm.com
From: Rob Clark <rob.clark@oss.qualcomm.com>
Date: Wed, 18 Jun 2025 14:56:37 -0700
X-Gm-Features: Ac12FXz1hvs2DatuE2Jl92AC0Ic67ojrFvzA6PneWV9sFClqIYfa-8ye6_PjtCE
Message-ID: <CACSVV00MJDTXk-qVB3FZV36CPuJ4LLtCDPFpF07EQXBfyqncuQ@mail.gmail.com>
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
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjE4MDE4OCBTYWx0ZWRfX8YvYh2igdApY
 8TJ26T1WdOmzqvSsZ2gKTMdgqEy0b75Zci5N57xT9pO04xeNMZOUTd4D0THfrdjN+8+40b7yQik
 0OcXK7SO+DEJceC8p19K0q6IrkbVnlgKaX1vVTuTNxtEkvF0pMMY7968VhJZb1FB+3h7WJruKZk
 5fQY7z42XyV1j0oxufzGX4oNYIkII0lIfX7EqRbAbKExFyCPfTUvpi3WHHxR63Fjzd9VplgrTUS
 E+np/2U4LovRl/VyRtTufPMXNeKir2ev/qHHN1RU/wZLx+PBis08/YgOZsX4Dr9Ih0cUMK9YV8K
 zcY/N7ItcXTFPpX/G1VxFKTzkYTOkW8RIoutLEzdCb1mJnw7MilZvatWL1HtZ+ZGqyVrWeXmwKt
 hVzwgRypAUojU11W2N160xnTr426JeV4MNuW08vDV/lstzL/DAzAQR1CDrhmcBaWyJGH+bde
X-Authority-Analysis: v=2.4 cv=fvbcZE4f c=1 sm=1 tr=0 ts=68533622 cx=c_pps
 a=lkkFf9KBb43tY3aOjL++dA==:117 a=IkcTkHD0fZMA:10 a=6IFa9wvqVegA:10
 a=20KFwNOVAAAA:8 a=EUspDBNiAAAA:8 a=OZCDo3Bp5fOm185c5pAA:9 a=QEXdDO2ut3YA:10
 a=k4UEASGLJojhI9HsvVT1:22
X-Proofpoint-GUID: Dt_gFM2D8MLpSAmBAXwg3wpGI5q39ilA
X-Proofpoint-ORIG-GUID: Dt_gFM2D8MLpSAmBAXwg3wpGI5q39ilA
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-18_06,2025-06-18_03,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 lowpriorityscore=0 bulkscore=0 priorityscore=1501
 mlxlogscore=999 phishscore=0 clxscore=1015 mlxscore=0 impostorscore=0
 adultscore=0 spamscore=0 suspectscore=0 classifier=spam authscore=0
 authtc=n/a authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2506180188

On Wed, Jun 18, 2025 at 2:23=E2=80=AFPM Danilo Krummrich <dakr@redhat.com> =
wrote:
>
> On Tue, Jun 17, 2025 at 06:43:21AM -0700, Rob Clark wrote:
> > On Tue, Jun 17, 2025 at 5:48=E2=80=AFAM Rob Clark <rob.clark@oss.qualco=
mm.com> wrote:
> > >
> > > On Tue, Jun 17, 2025 at 2:51=E2=80=AFAM Danilo Krummrich <dakr@redhat=
.com> wrote:
> > > >
> > > > On Mon, Jun 16, 2025 at 03:25:08PM -0700, Rob Clark wrote:
> > > > > On Mon, Jun 16, 2025 at 2:39=E2=80=AFPM Danilo Krummrich <dakr@re=
dhat.com> wrote:
> > > > > >
> > > > > > On Sat, Jun 14, 2025 at 08:03:20AM -0700, Rob Clark wrote:
> > > > > > > On Sat, Jun 14, 2025 at 3:39=E2=80=AFAM Danilo Krummrich <dak=
r@redhat.com> wrote:
> > > > > > > >
> > > > > > > > On Fri, Jun 13, 2025 at 04:57:03PM -0700, Rob Clark wrote:
> > > > > > > > > For UNMAP/REMAP steps we could be needing to lock objects=
 that are not
> > > > > > > > > explicitly listed in the VM_BIND ioctl in order to tear-d=
own unmapped
> > > > > > > > > VAs.  These helpers handle locking/preparing the needed o=
bjects.
> > > > > > > >
> > > > > > > > Yes, that's a common use-case. I think drivers typically it=
erate through their
> > > > > > > > drm_gpuva_ops to lock those objects.
> > > > > > > >
> > > > > > > > I had a look at you link [1] and it seems that you keep a l=
ist of ops as well by
> > > > > > > > calling vm_op_enqueue() with a new struct msm_vm_op from th=
e callbacks.
> > > > > > > >
> > > > > > > > Please note that for exactly this case there is the op_allo=
c callback in
> > > > > > > > struct drm_gpuvm_ops, such that you can allocate a custom o=
p type (i.e. struct
> > > > > > > > msm_vm_op) that embedds a struct drm_gpuva_op.
> > > > > > >
> > > > > > > I did use drm_gpuvm_sm_xyz_ops_create() in an earlier iterati=
on of my
> > > > > > > VM_BIND series, but it wasn't quite what I was after.  I want=
ed to
> > > > > > > apply the VM updates immediately to avoid issues with a later
> > > > > > > map/unmap overlapping an earlier map, which
> > > > > > > drm_gpuvm_sm_xyz_ops_create() doesn't really handle.  I'm not=
 even
> > > > > > > sure why this isn't a problem for other drivers unless usersp=
ace is
> > > > > > > providing some guarantees.
> > > > > >
> > > > > > The drm_gpuva_ops are usually used in a pattern like this.
> > > > > >
> > > > > >         vm_bind {
> > > > > >                 for_each_vm_bind_operation {
> > > >                             drm_gpuvm_sm_xyz_ops_create();
> > > > > >                         drm_gpuva_for_each_op {
> > > > > >                                 // modify drm_gpuvm's interval =
tree
> > > > > >                                 // pre-allocate memory
> > > > > >                                 // lock and prepare objects
> > > > > >                         }
> > > > > >                 }
> > > > > >
> > > > > >                 drm_sched_entity_push_job();
> > > > > >         }
> > > > > >
> > > > > >         run_job {
> > > > > >                 for_each_vm_bind_operation {
> > > > > >                         drm_gpuva_for_each_op {
> > > > > >                                 // modify page tables
> > > > > >                         }
> > > > > >                 }
> > > > > >         }
> > > > > >
> > > > > >         run_job {
> > > > > >                 for_each_vm_bind_operation {
> > > > > >                         drm_gpuva_for_each_op {
> > > > > >                                 // free page table structures, =
if any
> > > > > >                                 // free unused pre-allocated me=
mory
> > > > > >                         }
> > > > > >                 }
> > > > > >         }
> > > > > >
> > > > > > What did you do instead to get map/unmap overlapping? Even more=
 interesting,
> > > > > > what are you doing now?
> > > > >
> > > > > From what I can tell, the drivers using drm_gpva_for_each_op()/et=
c are
> > > > > doing drm_gpuva_remove() while iterating the ops list..
> > > > > drm_gpuvm_sm_xyz_ops_create() itself does not modify the VM.  So =
this
> > > > > can only really work if you perform one MAP or UNMAP at a time.  =
Or at
> > > > > least if you process the VM modifying part of the ops list before
> > > > > proceeding to the next op.
> > > >
> > > > (Added the drm_gpuvm_sm_xyz_ops_create() step above.)
> > > >
> > > > I went through the code you posted [1] and conceptually you're impl=
ementing
> > > > exactly the pattern I described above, i.e. you do:
> > > >
> > > >         vm_bind {
> > > >                 for_each_vm_bind_operation {
> > > >                         drm_gpuvm_sm_xyz_exec_lock();
> > > >                 }
> > > >
> > > >                 for_each_vm_bind_operation {
> > > >                         drm_gpuvm_sm_xyz() {
> > > >                                 // modify drm_gpuvm's interval tree
> > > >                                 // create custom ops
> > > >                         }
> > > >                 }
> > > >
> > > >                 drm_sched_entity_push_job();
> > > >         }
> > > >
> > > >         run_job {
> > > >                 for_each_vm_bind_operation {
> > > >                         for_each_custom_op() {
> > > >                                 // do stuff
> > > >                         }
> > > >                 }
> > > >         }
> > >
> > > Close, but by the time we get to run_job there is just a single list
> > > of ops covering all the vm_bind operations:
> > >
> > >         run_job {
> > >                 for_each_custom_op() {
> > >                         // do stuff
> > >                 }
> > >         }
> > >
> > > rather than a list of va ops per vm_bind op.
> > >
> > > > However, GPUVM intends to solve your use-case with the following, s=
emantically
> > > > identical, approach.
> > > >
> > > >         vm_bind {
> > > >                 for_each_vm_bind_operation {
> > > >                         drm_gpuvm_sm_xyz_ops_create();
> > > >
> > > >                         drm_gpuva_for_each_op {
> > > >                                 // modify drm_gpuvm's interval tree
> > > >                                 // lock and prepare objects (1)
> > >
> > > I currently decouple lock+pin from VM modification to avoid an error
> > > path that leaves the VM partially modified.  Once you add this back
> > > in, the va-ops approach isn't simpler, IMHO.
> >
> > Oh, actually scratch that.. using va-ops, it is not even possible to
> > decouple locking/prepare from VM modifications.  So using
> > DRM_EXEC_INTERRUPTIBLE_WAIT, for ex, with va-ops list would be an
> > actively bad idea.
>
> Well, you would need to unwind the VM modifications. I think so far this =
hasn't
> been an issue for drivers, since they have to unwind VM modifications for=
 other
> reasons anyways.

Only thing that can fail at this point are the drm_gpuvm_sm_xyz()
calls[1].  Which should only be for small kmalloc's which should not
fail.  But all the "usual" errors (bad params from userspace,
interrupted locking, etc) are dealt with before we begin to modify the
VM.  If anything does fail after we start modifying the VM we mark the
vm as unusable, similar to a gpu fault.

[1] ok, I should put some drm_gpuvm_range_valid() checks earlier in
the ioctl, while parsing out and validating args/flags/etc.  I
overlooked this.

> Do you never need to unwind for other reasons than locking dma_resv and
> preparing GEM objects? Are you really sure there's nothing else in the cr=
itical
> path?
>
> If there really isn't anything, I agree that those helpers have value and=
 we
> should add them. So, if we do so, please document in detail the condition=
s under
> which drm_gpuvm_sm_{map,unmap}_exec_lock() can be called for multiple VM_=
BIND
> ops *without* updating GPUVM's interval tree intermediately, including an
> example.

Ok.. in the function headerdoc comment block?  Or did you have
somewhere else in mind?

BR,
-R

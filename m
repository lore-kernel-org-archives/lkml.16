Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 489302701BD
	for <linux-kernel@vger.kernel.org>; Wed, 18 Jun 2025 21:23:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750281825; cv=none; b=dhIaxrB5jreTxKQJ8G2inH2B+1CTsO/S+b0OnkeFgZRpdBK0dTU/wpe5wdVjZADvN9SgdquSQCNtnaTTllzIoOHTEgdvxDkHOGqqigS0xebiQ10Nk0/ooXU3MMlMlQX5G1QLHKaBNtostGcR+0bK7tyEc0BGxZxfBOzQUpXIoa4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750281825; c=relaxed/simple;
	bh=aHYEXv9FQ4+lXnPUOk4K21uuvfRIkU3kbTOPJEGl6Zc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=c/HCVxseQV2H5di0iAsC/V9DXCnjTtECCrO8rQmChwr3WZoi+gGLv0zAzmdVB6ZhGd88Msnqnfrg+Tos55O73IGJLqnyIW3OytDlB9TFmYCRvNH9Bk1CAjCknHVCX83NfE7s7yx7UpYpNqPg/gV4Ho1WYJ0unbF/IzFm95diLAY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=YRxOy+mM; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="YRxOy+mM"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1750281822;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=lD3zh9LSKFVLiBeGdrP5eT4T6VTWKD7Got03vgBF8Pk=;
	b=YRxOy+mMfceZjizZsiKq7NpUejzv+46YClrm74gLSq7FvNDMEBNKmBMV2n/FeF7SE7pGvT
	80cgjX4xq+ZlDLIZBPwPE3vhePP5lVAbXYkEPNJX5b5lxv4vDTYGRnfxXJ1K3AXLJGrx+I
	37Ug/mN6C4RRIEPLTHNWh0WG+V1dYwA=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-648-hjHi_FOkP9usjXdRna-8zw-1; Wed, 18 Jun 2025 17:23:39 -0400
X-MC-Unique: hjHi_FOkP9usjXdRna-8zw-1
X-Mimecast-MFC-AGG-ID: hjHi_FOkP9usjXdRna-8zw_1750281818
Received: by mail-wr1-f69.google.com with SMTP id ffacd0b85a97d-3a503f28b09so30826f8f.0
        for <linux-kernel@vger.kernel.org>; Wed, 18 Jun 2025 14:23:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750281818; x=1750886618;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=lD3zh9LSKFVLiBeGdrP5eT4T6VTWKD7Got03vgBF8Pk=;
        b=FEjZRiA3jlV0hPD6bpHsc2ZN9S3XYG7nEIUfg8J7zaRukpjPG/8A89GFHfF7N4CryC
         CZmAQUoNyIyMs+8XeHotQt6mH8QXE277rRtLpxEKKRBy9F8naaVbQ5tsEWTlX/DtfLVq
         MSPSV+jeJ5qdxlVEvKb1uE1p89WvcbW/VHaPNOvdXw3y7Y6aDgV8RvlchUzjQM4wZfaN
         KtnbZUZSFANpR6RG4BizhczaDL8vd8kz30HLnv3qXri3bbaB7G3FaQO4HRfHhnqGrOR+
         EnkDoZ20x+6whW1v4M/Ojx2hUkMXTg3VNJU3vxnWykB+m0Wxbcd6Dzy5cD1ESDelkaZn
         WPfA==
X-Forwarded-Encrypted: i=1; AJvYcCW2oOGOuCkvv3y3rJslbv2sJ4qAXoCt8E1ugsgyFrlbY/XhZ0mywt5tJRvTQ2gB3X5eEX7pR6rK+CNXi4A=@vger.kernel.org
X-Gm-Message-State: AOJu0YxSwkLpOKCk8juyo/9EyffmXcSvW/NL3uSzEXYevY2juXsr+2rv
	E3C+7zuJDYDdUruy38V3ddK/YN49hG0SzOhmnntqW67YbRVdzhCS+LAHyZBxtTasMt8OpqGJusv
	w+uXcjaYAHhM30Wz5ClrGcmnG5WpAU/NMAqjKHxLWwfB1CgIsKmzssjW/YFVaQCNKMQ==
X-Gm-Gg: ASbGnctQe0m3/+mUaC3j45A0pHjyvuAPxL/Kkv8xz4TYKaRWVHBzKyMJK0a+AwTK+EN
	UPYMYWMQpYPylfi5+PzOd61j43GZZ4CjdaC/SfVWC/kOe2mhwxCOEX6RlUyXFZhDyMpSEK+uu4W
	a75bGnjpGNyWXh8yMMUvaelQ/FqB+vupo/YPkGFTjhos5Az2qSUUKK6h+NrAZoewAgm64b3qSik
	fi8iDzlqGVozqGoeSa3QMCjwgroHMCfZpMx1me+AGmV30Wac0X9kBD9MBWpPhyGICMj7dO6Prw8
	Pp2rZLUb8Ro=
X-Received: by 2002:a05:6000:2a04:b0:3a5:5130:1c71 with SMTP id ffacd0b85a97d-3a6c962b2d8mr700665f8f.0.1750281818006;
        Wed, 18 Jun 2025 14:23:38 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHu4QU3bk7dkTV8y21m8O4yJStIuE5s16gVEUTckk6g/n5f2Lm6JEA/tzq7cPIYOVYMNwo42A==
X-Received: by 2002:a05:6000:2a04:b0:3a5:5130:1c71 with SMTP id ffacd0b85a97d-3a6c962b2d8mr700648f8f.0.1750281817462;
        Wed, 18 Jun 2025 14:23:37 -0700 (PDT)
Received: from pollux ([2a00:79c0:6b9:ae00:abf:b8ff:feee:998b])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a5780c5004sm14370775f8f.56.2025.06.18.14.23.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Jun 2025 14:23:36 -0700 (PDT)
Date: Wed, 18 Jun 2025 23:23:35 +0200
From: Danilo Krummrich <dakr@redhat.com>
To: Rob Clark <rob.clark@oss.qualcomm.com>
Cc: dri-devel@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
	freedreno@lists.freedesktop.org,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
	open list <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH 2/2] drm/gpuvm: Add locking helpers
Message-ID: <aFMuV7PNfSZVWb-b@pollux>
References: <20250613235705.28006-1-robin.clark@oss.qualcomm.com>
 <20250613235705.28006-3-robin.clark@oss.qualcomm.com>
 <aE1RPZ_-oFyM4COy@pollux>
 <CACSVV00uwmuAC4eMi-4QiF4sOu4r9u8eXxyAgt83YS8Yfgoemg@mail.gmail.com>
 <aFCO7_RHuAaGyq1Q@pollux>
 <CACSVV03WboQp_A1bzQ+xpX5DDkfaoXmbTuo9RfZ9bMaVTqdU+A@mail.gmail.com>
 <aFE6pq8l33NXfFdT@pollux>
 <CACSVV00VzOfTDh2sKst+POzkZ-5MH+0BDY-GVB2WKTyONRrHjw@mail.gmail.com>
 <CACSVV00cng4PzHzqydGw_L34_f+6KiZTyCRdggNfHaDePGzFOA@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CACSVV00cng4PzHzqydGw_L34_f+6KiZTyCRdggNfHaDePGzFOA@mail.gmail.com>

On Tue, Jun 17, 2025 at 06:43:21AM -0700, Rob Clark wrote:
> On Tue, Jun 17, 2025 at 5:48 AM Rob Clark <rob.clark@oss.qualcomm.com> wrote:
> >
> > On Tue, Jun 17, 2025 at 2:51 AM Danilo Krummrich <dakr@redhat.com> wrote:
> > >
> > > On Mon, Jun 16, 2025 at 03:25:08PM -0700, Rob Clark wrote:
> > > > On Mon, Jun 16, 2025 at 2:39 PM Danilo Krummrich <dakr@redhat.com> wrote:
> > > > >
> > > > > On Sat, Jun 14, 2025 at 08:03:20AM -0700, Rob Clark wrote:
> > > > > > On Sat, Jun 14, 2025 at 3:39 AM Danilo Krummrich <dakr@redhat.com> wrote:
> > > > > > >
> > > > > > > On Fri, Jun 13, 2025 at 04:57:03PM -0700, Rob Clark wrote:
> > > > > > > > For UNMAP/REMAP steps we could be needing to lock objects that are not
> > > > > > > > explicitly listed in the VM_BIND ioctl in order to tear-down unmapped
> > > > > > > > VAs.  These helpers handle locking/preparing the needed objects.
> > > > > > >
> > > > > > > Yes, that's a common use-case. I think drivers typically iterate through their
> > > > > > > drm_gpuva_ops to lock those objects.
> > > > > > >
> > > > > > > I had a look at you link [1] and it seems that you keep a list of ops as well by
> > > > > > > calling vm_op_enqueue() with a new struct msm_vm_op from the callbacks.
> > > > > > >
> > > > > > > Please note that for exactly this case there is the op_alloc callback in
> > > > > > > struct drm_gpuvm_ops, such that you can allocate a custom op type (i.e. struct
> > > > > > > msm_vm_op) that embedds a struct drm_gpuva_op.
> > > > > >
> > > > > > I did use drm_gpuvm_sm_xyz_ops_create() in an earlier iteration of my
> > > > > > VM_BIND series, but it wasn't quite what I was after.  I wanted to
> > > > > > apply the VM updates immediately to avoid issues with a later
> > > > > > map/unmap overlapping an earlier map, which
> > > > > > drm_gpuvm_sm_xyz_ops_create() doesn't really handle.  I'm not even
> > > > > > sure why this isn't a problem for other drivers unless userspace is
> > > > > > providing some guarantees.
> > > > >
> > > > > The drm_gpuva_ops are usually used in a pattern like this.
> > > > >
> > > > >         vm_bind {
> > > > >                 for_each_vm_bind_operation {
> > >                             drm_gpuvm_sm_xyz_ops_create();
> > > > >                         drm_gpuva_for_each_op {
> > > > >                                 // modify drm_gpuvm's interval tree
> > > > >                                 // pre-allocate memory
> > > > >                                 // lock and prepare objects
> > > > >                         }
> > > > >                 }
> > > > >
> > > > >                 drm_sched_entity_push_job();
> > > > >         }
> > > > >
> > > > >         run_job {
> > > > >                 for_each_vm_bind_operation {
> > > > >                         drm_gpuva_for_each_op {
> > > > >                                 // modify page tables
> > > > >                         }
> > > > >                 }
> > > > >         }
> > > > >
> > > > >         run_job {
> > > > >                 for_each_vm_bind_operation {
> > > > >                         drm_gpuva_for_each_op {
> > > > >                                 // free page table structures, if any
> > > > >                                 // free unused pre-allocated memory
> > > > >                         }
> > > > >                 }
> > > > >         }
> > > > >
> > > > > What did you do instead to get map/unmap overlapping? Even more interesting,
> > > > > what are you doing now?
> > > >
> > > > From what I can tell, the drivers using drm_gpva_for_each_op()/etc are
> > > > doing drm_gpuva_remove() while iterating the ops list..
> > > > drm_gpuvm_sm_xyz_ops_create() itself does not modify the VM.  So this
> > > > can only really work if you perform one MAP or UNMAP at a time.  Or at
> > > > least if you process the VM modifying part of the ops list before
> > > > proceeding to the next op.
> > >
> > > (Added the drm_gpuvm_sm_xyz_ops_create() step above.)
> > >
> > > I went through the code you posted [1] and conceptually you're implementing
> > > exactly the pattern I described above, i.e. you do:
> > >
> > >         vm_bind {
> > >                 for_each_vm_bind_operation {
> > >                         drm_gpuvm_sm_xyz_exec_lock();
> > >                 }
> > >
> > >                 for_each_vm_bind_operation {
> > >                         drm_gpuvm_sm_xyz() {
> > >                                 // modify drm_gpuvm's interval tree
> > >                                 // create custom ops
> > >                         }
> > >                 }
> > >
> > >                 drm_sched_entity_push_job();
> > >         }
> > >
> > >         run_job {
> > >                 for_each_vm_bind_operation {
> > >                         for_each_custom_op() {
> > >                                 // do stuff
> > >                         }
> > >                 }
> > >         }
> >
> > Close, but by the time we get to run_job there is just a single list
> > of ops covering all the vm_bind operations:
> >
> >         run_job {
> >                 for_each_custom_op() {
> >                         // do stuff
> >                 }
> >         }
> >
> > rather than a list of va ops per vm_bind op.
> >
> > > However, GPUVM intends to solve your use-case with the following, semantically
> > > identical, approach.
> > >
> > >         vm_bind {
> > >                 for_each_vm_bind_operation {
> > >                         drm_gpuvm_sm_xyz_ops_create();
> > >
> > >                         drm_gpuva_for_each_op {
> > >                                 // modify drm_gpuvm's interval tree
> > >                                 // lock and prepare objects (1)
> >
> > I currently decouple lock+pin from VM modification to avoid an error
> > path that leaves the VM partially modified.  Once you add this back
> > in, the va-ops approach isn't simpler, IMHO.
> 
> Oh, actually scratch that.. using va-ops, it is not even possible to
> decouple locking/prepare from VM modifications.  So using
> DRM_EXEC_INTERRUPTIBLE_WAIT, for ex, with va-ops list would be an
> actively bad idea.

Well, you would need to unwind the VM modifications. I think so far this hasn't
been an issue for drivers, since they have to unwind VM modifications for other
reasons anyways.

Do you never need to unwind for other reasons than locking dma_resv and
preparing GEM objects? Are you really sure there's nothing else in the critical
path?

If there really isn't anything, I agree that those helpers have value and we
should add them. So, if we do so, please document in detail the conditions under
which drm_gpuvm_sm_{map,unmap}_exec_lock() can be called for multiple VM_BIND
ops *without* updating GPUVM's interval tree intermediately, including an
example.


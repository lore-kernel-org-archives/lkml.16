Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DDEFD21CFF7
	for <linux-kernel@vger.kernel.org>; Wed, 18 Jun 2025 22:19:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750285197; cv=none; b=qgVhETJokARU+aDNKxHOkHWgVx4MGoEH0vJW2brA55MnJilVCKuQaXlPh2+Nv4NOfPmcOny1fswrHDjgQZQOsZw8hMe2asokgpUh9MHmDMye8HTwn6g62Ie3EEhQxL1MRiv0VJS4asx+lNuF8fDfMP7NVEBvL2vtLcbS6uzXZMI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750285197; c=relaxed/simple;
	bh=/lGoBuumBrWA1j206+Fpoym19fIuf/1/AwMzppu2YY8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=kZ3u+WqaHvu2yuk2YSMcqCeZR6rZDp4ebxkxgh99vaXqpj8vPRoangGKh7WBCAENewRIgacJXeq0Tf21q7H0fvIiUK+G/Z+uMwmfD4Qs3/bsSjvmY0evhUa6vT8GWpPN36Z/EqMmDhpqjnrKXNNveBSX6Ddwi3dKoEoiDaGnahQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=GJDD75fk; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="GJDD75fk"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1750285193;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=pFuNa+gUNreWnlNmpSWHUm92+vfdGGa0hGa5LsPknNE=;
	b=GJDD75fkjgWXosvkiavNiXePEtmniJGibHTJ1zfTQxqtnsmvIdH7vAGcHKHZTsHStMaetA
	k7XKCbTHZSiNeXdT+SRHj/rsVIjmtlv1Qu/ZXb1q2SDb6vDw4vqFWU+B4y47N48Brn7XBH
	dHRXJBflTTPedXS8W1Btlwy/F41PpWE=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-83-LKrVeo3INQWuyg7Jz-C5Qg-1; Wed, 18 Jun 2025 18:19:52 -0400
X-MC-Unique: LKrVeo3INQWuyg7Jz-C5Qg-1
X-Mimecast-MFC-AGG-ID: LKrVeo3INQWuyg7Jz-C5Qg_1750285191
Received: by mail-wm1-f70.google.com with SMTP id 5b1f17b1804b1-43eea5a5d80so751635e9.1
        for <linux-kernel@vger.kernel.org>; Wed, 18 Jun 2025 15:19:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750285191; x=1750889991;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=pFuNa+gUNreWnlNmpSWHUm92+vfdGGa0hGa5LsPknNE=;
        b=oerzYSC1f1rSvX4uchNE5VCBgdHTors7u0+c5Od5QM+3KiajCYp20VWMblwS01f3w8
         RdQVmC/1mCokrvIBJcdNFkS4aTkTm8mRrDgSY7uqhSbGWaJIi/Ud9E5OQlMi5DaM4LC1
         3q1hfRP26n+EYFbC4kLy2RLrKQskoovhCv5AaOebSZTDllHuTol1couYwd1WWYXA2dK6
         Yq5iUMSpoOwG8n4lPQZQa/TuJZVPfpZF1xIzjuv0kB5cUcCzZJ1+eRB559+ynn7XURrx
         Tjpipz0Fk23Nt3RexUl42lFl/rmByQjrkJrWk+6GwqjJjBDfe95ppckwcAc80CXwASuU
         UdEg==
X-Forwarded-Encrypted: i=1; AJvYcCV9AiqJlo/Lhk1RpVX9hytdv9H2Ls/TEZPRVWsC1gtxM/hBLKiwxCeo7mhCY33PHg7D2dqhISzGFA6v0BI=@vger.kernel.org
X-Gm-Message-State: AOJu0YwizujodPd7W554XzvhvfrqP4oal1Gs5RRYghixIwZ+Ovyj/OGu
	rkB/8qaYWX+ARxBI++Gd2oDItvlZdsIeo48G8U3w5BTRNufGFH3k2Jt7lZBKI1kl2y7pjmcf/WR
	AUXBgaPvhjdDkOMzmsJo/bwVvwmOV9Sax+lrVtHSx39ygmfmzTvXrHSOpD4u+gMK/Kw==
X-Gm-Gg: ASbGncsdauszfEHJLOig7VHCKib75RI2GGbPhUR4AQsXg68oAgvkYK0JCU+R3xs0P5G
	4xwu+MmaRQN7syLSmhG+z3M5a94sa5icOSM6WCRegdg+v9Zewzz6OVmgvwwA8J4zXOCIA6mlV53
	uyN6eDTilZBTpDgE279tQxdbsWYtQbs0YarAjXk/99AJptUe8CT+wXeohnEwS+NtIrd+jsoN4D6
	0t7TS/6cLMSslfa5wQ8/8wniPxULlQiStPjpXoRBkXYns+/SbFYaSEjz4dh6YHWeKHiMtLAdB7T
	2Hti3psb5Cw=
X-Received: by 2002:a05:600c:1d06:b0:453:c39:d0a7 with SMTP id 5b1f17b1804b1-4533ca7a286mr162136025e9.5.1750285191180;
        Wed, 18 Jun 2025 15:19:51 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IE4VQdU3i4tTHqK1j6tdabdPmKkWW/Ow8y41UnXWvPN4xxmf9XyxkRHISIyMXY4Y6B/g33waQ==
X-Received: by 2002:a05:600c:1d06:b0:453:c39:d0a7 with SMTP id 5b1f17b1804b1-4533ca7a286mr162135925e9.5.1750285190693;
        Wed, 18 Jun 2025 15:19:50 -0700 (PDT)
Received: from pollux ([2a00:79c0:6b9:ae00:abf:b8ff:feee:998b])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4535e99ee8dsm9098185e9.37.2025.06.18.15.19.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Jun 2025 15:19:49 -0700 (PDT)
Date: Thu, 19 Jun 2025 00:19:47 +0200
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
Message-ID: <aFM7gyGEJSVpQe1y@pollux>
References: <20250613235705.28006-3-robin.clark@oss.qualcomm.com>
 <aE1RPZ_-oFyM4COy@pollux>
 <CACSVV00uwmuAC4eMi-4QiF4sOu4r9u8eXxyAgt83YS8Yfgoemg@mail.gmail.com>
 <aFCO7_RHuAaGyq1Q@pollux>
 <CACSVV03WboQp_A1bzQ+xpX5DDkfaoXmbTuo9RfZ9bMaVTqdU+A@mail.gmail.com>
 <aFE6pq8l33NXfFdT@pollux>
 <CACSVV00VzOfTDh2sKst+POzkZ-5MH+0BDY-GVB2WKTyONRrHjw@mail.gmail.com>
 <CACSVV00cng4PzHzqydGw_L34_f+6KiZTyCRdggNfHaDePGzFOA@mail.gmail.com>
 <aFMuV7PNfSZVWb-b@pollux>
 <CACSVV00MJDTXk-qVB3FZV36CPuJ4LLtCDPFpF07EQXBfyqncuQ@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CACSVV00MJDTXk-qVB3FZV36CPuJ4LLtCDPFpF07EQXBfyqncuQ@mail.gmail.com>

On Wed, Jun 18, 2025 at 02:56:37PM -0700, Rob Clark wrote:
> On Wed, Jun 18, 2025 at 2:23 PM Danilo Krummrich <dakr@redhat.com> wrote:
> >
> > On Tue, Jun 17, 2025 at 06:43:21AM -0700, Rob Clark wrote:
> > > On Tue, Jun 17, 2025 at 5:48 AM Rob Clark <rob.clark@oss.qualcomm.com> wrote:
> > > >
> > > > On Tue, Jun 17, 2025 at 2:51 AM Danilo Krummrich <dakr@redhat.com> wrote:
> > > > >
> > > > > On Mon, Jun 16, 2025 at 03:25:08PM -0700, Rob Clark wrote:
> > > > > > On Mon, Jun 16, 2025 at 2:39 PM Danilo Krummrich <dakr@redhat.com> wrote:
> > > > > > >
> > > > > > > On Sat, Jun 14, 2025 at 08:03:20AM -0700, Rob Clark wrote:
> > > > > > > > On Sat, Jun 14, 2025 at 3:39 AM Danilo Krummrich <dakr@redhat.com> wrote:
> > > > > > > > >
> > > > > > > > > On Fri, Jun 13, 2025 at 04:57:03PM -0700, Rob Clark wrote:
> > > > > > > > > > For UNMAP/REMAP steps we could be needing to lock objects that are not
> > > > > > > > > > explicitly listed in the VM_BIND ioctl in order to tear-down unmapped
> > > > > > > > > > VAs.  These helpers handle locking/preparing the needed objects.
> > > > > > > > >
> > > > > > > > > Yes, that's a common use-case. I think drivers typically iterate through their
> > > > > > > > > drm_gpuva_ops to lock those objects.
> > > > > > > > >
> > > > > > > > > I had a look at you link [1] and it seems that you keep a list of ops as well by
> > > > > > > > > calling vm_op_enqueue() with a new struct msm_vm_op from the callbacks.
> > > > > > > > >
> > > > > > > > > Please note that for exactly this case there is the op_alloc callback in
> > > > > > > > > struct drm_gpuvm_ops, such that you can allocate a custom op type (i.e. struct
> > > > > > > > > msm_vm_op) that embedds a struct drm_gpuva_op.
> > > > > > > >
> > > > > > > > I did use drm_gpuvm_sm_xyz_ops_create() in an earlier iteration of my
> > > > > > > > VM_BIND series, but it wasn't quite what I was after.  I wanted to
> > > > > > > > apply the VM updates immediately to avoid issues with a later
> > > > > > > > map/unmap overlapping an earlier map, which
> > > > > > > > drm_gpuvm_sm_xyz_ops_create() doesn't really handle.  I'm not even
> > > > > > > > sure why this isn't a problem for other drivers unless userspace is
> > > > > > > > providing some guarantees.
> > > > > > >
> > > > > > > The drm_gpuva_ops are usually used in a pattern like this.
> > > > > > >
> > > > > > >         vm_bind {
> > > > > > >                 for_each_vm_bind_operation {
> > > > >                             drm_gpuvm_sm_xyz_ops_create();
> > > > > > >                         drm_gpuva_for_each_op {
> > > > > > >                                 // modify drm_gpuvm's interval tree
> > > > > > >                                 // pre-allocate memory
> > > > > > >                                 // lock and prepare objects
> > > > > > >                         }
> > > > > > >                 }
> > > > > > >
> > > > > > >                 drm_sched_entity_push_job();
> > > > > > >         }
> > > > > > >
> > > > > > >         run_job {
> > > > > > >                 for_each_vm_bind_operation {
> > > > > > >                         drm_gpuva_for_each_op {
> > > > > > >                                 // modify page tables
> > > > > > >                         }
> > > > > > >                 }
> > > > > > >         }
> > > > > > >
> > > > > > >         run_job {
> > > > > > >                 for_each_vm_bind_operation {
> > > > > > >                         drm_gpuva_for_each_op {
> > > > > > >                                 // free page table structures, if any
> > > > > > >                                 // free unused pre-allocated memory
> > > > > > >                         }
> > > > > > >                 }
> > > > > > >         }
> > > > > > >
> > > > > > > What did you do instead to get map/unmap overlapping? Even more interesting,
> > > > > > > what are you doing now?
> > > > > >
> > > > > > From what I can tell, the drivers using drm_gpva_for_each_op()/etc are
> > > > > > doing drm_gpuva_remove() while iterating the ops list..
> > > > > > drm_gpuvm_sm_xyz_ops_create() itself does not modify the VM.  So this
> > > > > > can only really work if you perform one MAP or UNMAP at a time.  Or at
> > > > > > least if you process the VM modifying part of the ops list before
> > > > > > proceeding to the next op.
> > > > >
> > > > > (Added the drm_gpuvm_sm_xyz_ops_create() step above.)
> > > > >
> > > > > I went through the code you posted [1] and conceptually you're implementing
> > > > > exactly the pattern I described above, i.e. you do:
> > > > >
> > > > >         vm_bind {
> > > > >                 for_each_vm_bind_operation {
> > > > >                         drm_gpuvm_sm_xyz_exec_lock();
> > > > >                 }
> > > > >
> > > > >                 for_each_vm_bind_operation {
> > > > >                         drm_gpuvm_sm_xyz() {
> > > > >                                 // modify drm_gpuvm's interval tree
> > > > >                                 // create custom ops
> > > > >                         }
> > > > >                 }
> > > > >
> > > > >                 drm_sched_entity_push_job();
> > > > >         }
> > > > >
> > > > >         run_job {
> > > > >                 for_each_vm_bind_operation {
> > > > >                         for_each_custom_op() {
> > > > >                                 // do stuff
> > > > >                         }
> > > > >                 }
> > > > >         }
> > > >
> > > > Close, but by the time we get to run_job there is just a single list
> > > > of ops covering all the vm_bind operations:
> > > >
> > > >         run_job {
> > > >                 for_each_custom_op() {
> > > >                         // do stuff
> > > >                 }
> > > >         }
> > > >
> > > > rather than a list of va ops per vm_bind op.
> > > >
> > > > > However, GPUVM intends to solve your use-case with the following, semantically
> > > > > identical, approach.
> > > > >
> > > > >         vm_bind {
> > > > >                 for_each_vm_bind_operation {
> > > > >                         drm_gpuvm_sm_xyz_ops_create();
> > > > >
> > > > >                         drm_gpuva_for_each_op {
> > > > >                                 // modify drm_gpuvm's interval tree
> > > > >                                 // lock and prepare objects (1)
> > > >
> > > > I currently decouple lock+pin from VM modification to avoid an error
> > > > path that leaves the VM partially modified.  Once you add this back
> > > > in, the va-ops approach isn't simpler, IMHO.
> > >
> > > Oh, actually scratch that.. using va-ops, it is not even possible to
> > > decouple locking/prepare from VM modifications.  So using
> > > DRM_EXEC_INTERRUPTIBLE_WAIT, for ex, with va-ops list would be an
> > > actively bad idea.
> >
> > Well, you would need to unwind the VM modifications. I think so far this hasn't
> > been an issue for drivers, since they have to unwind VM modifications for other
> > reasons anyways.
> 
> Only thing that can fail at this point are the drm_gpuvm_sm_xyz()
> calls[1].  Which should only be for small kmalloc's which should not
> fail.

But what happens *if* they fail? How do you handle this? If you don't unwind all
preceeding changes to the GPUVM's interval tree at this point your VM is broken.

Glancing at the code, it seems that you're allocating the GPUVA ops. And if that
fails you just return the error, leaving the VM in a broken state.

What we could do is to implement a helper that calculates the worst case number
of ops and pre-allocate them, but that's not exactly trivial.

drm_gpuvm_sm_{map,unmap}_exec_lock() only really makes sense if we can prevent
the need to ever unwind, so that's a precondition.

Alternatively, you can also decide to accept that your VM is dead if you can't
allocate the GPUVA ops, I guess. In this case you'd really have to shut it down
though, otherwise you likely risk faults in your PT management code.

> But all the "usual" errors (bad params from userspace,
> interrupted locking, etc) are dealt with before we begin to modify the
> VM.  If anything does fail after we start modifying the VM we mark the
> vm as unusable, similar to a gpu fault.
> 
> [1] ok, I should put some drm_gpuvm_range_valid() checks earlier in
> the ioctl, while parsing out and validating args/flags/etc.  I
> overlooked this.
> 
> > Do you never need to unwind for other reasons than locking dma_resv and
> > preparing GEM objects? Are you really sure there's nothing else in the critical
> > path?
> >
> > If there really isn't anything, I agree that those helpers have value and we
> > should add them. So, if we do so, please document in detail the conditions under
> > which drm_gpuvm_sm_{map,unmap}_exec_lock() can be called for multiple VM_BIND
> > ops *without* updating GPUVM's interval tree intermediately, including an
> > example.
> 
> Ok.. in the function headerdoc comment block?  Or did you have
> somewhere else in mind?

Yeah, in the function doc-comment.


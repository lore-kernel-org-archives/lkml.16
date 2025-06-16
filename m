Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC82E7262B
	for <linux-kernel@vger.kernel.org>; Mon, 16 Jun 2025 21:39:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750109944; cv=none; b=ltQHRIlJuUUi3UF+NkUR652dIQIE4cWLLVOhD1rVvzt/m663UObJzXfLmsDBT1X4LxzTNs4JhWX3RTOaq2okQXywegLEjUINxILEfEH8q2qhlQdLw+ANKlDYwpUIzdrXODKU1YcwPhRZn6JnW2e2gPPG/Zhcq1LrEce4A/7S6oM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750109944; c=relaxed/simple;
	bh=QN2i0eqFGWNXPooFbASnWQglHggpPgBSU7wRAUtSHX0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=qJRWdi8GsvWRmMi5vq6VgSnAiZkGaR0LdobU+h9OrIGqQeIEkrMb24NQV2JfNSNPPnVZznsIdwCw7XuuP6DO6xoqmR/lTt7V08ju38A9IWMvSt5rejZq/d+IYnthmSSTJ74SENRTQFF7BI37nb98s4Y9Y7re2santh7riAkAuPY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=N9s0yTSi; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="N9s0yTSi"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1750109941;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=7emt/zNGr/CBhfVNgDPKicHgy2P2Bp4GbdXMzFzaVxk=;
	b=N9s0yTSi2DUgcDMwl2XLDF+1jzncb9KWx1Xk9/E9u6Owqe69wQeJNQozswUu7atK7qQpzt
	ykdGCClt9H5rHwROBU7eKBkbMSI0I2dB8xDaL0/CQUxnKDc74OwIdDkcg4jTMQF9/I3cbQ
	rAE6R/MY2JxfGixoRhgwPtUZz0qJEG0=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-594-Sxp6PRFDMBOFuge5X2UL-A-1; Mon, 16 Jun 2025 17:39:00 -0400
X-MC-Unique: Sxp6PRFDMBOFuge5X2UL-A-1
X-Mimecast-MFC-AGG-ID: Sxp6PRFDMBOFuge5X2UL-A_1750109939
Received: by mail-wr1-f72.google.com with SMTP id ffacd0b85a97d-3a4f858bc5eso3139835f8f.0
        for <linux-kernel@vger.kernel.org>; Mon, 16 Jun 2025 14:39:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750109938; x=1750714738;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=7emt/zNGr/CBhfVNgDPKicHgy2P2Bp4GbdXMzFzaVxk=;
        b=EIUmB5pLKMr2kEQnpG275NZfmZVhL/OVROXaQTRiwGZFdzeozqGN6MmHqTc3U7y1gZ
         ZJSNXHO09YLbZGq9dAB4RDDeq+fNSi2Qe9Whk9liEAkYxQu3btlD8N7OBywpd81GeQxP
         sPecULo4Tj3NujvWmiTT7gycvFKcVZbfWnTFqtJTBSaxxkt343T3SW2d4tYr59Zg/Xhu
         rsBOU4bfaYeZmEY4dT+Yw8atqkI+O2Xrmua3AwCPBedENuegNMHKTRBx4KWY/LtrbVZd
         DhvBvTaqtawp6zc3uxHvMURrFYikOhKPvdfHvhDZuQsae9ZaEnYrA7q6XAi4I4nhSynl
         IBiQ==
X-Forwarded-Encrypted: i=1; AJvYcCW6GSSg3Up8v3evNO8Ul2DI1ah7Zc5UMC552NYcw5RoqtL4xJD3LlwV29chSbL7sFHUnWK88sjl3TMhLmc=@vger.kernel.org
X-Gm-Message-State: AOJu0YxWBzAkobrmdepG/ZCD45TstrKSZJwb0PFnLkg7uzb5VdvmRpzB
	b850lmyCi0Nbg7rh/RBAusdqbaOnochOFxXPbFiX/NescCjVGKu6r+qvDfC4ZDn5s2KT0IITPv7
	5WDElTnSM2AZGxtnGTVzemoptRU0myuhoFhSyGC9dDA6w72vGvkVYzM7Lh9Hn6lYxwSZ+1u62Cf
	9B
X-Gm-Gg: ASbGncuN98nZ15mmLGFpyEyKzULLFZFECYuruYFh9sVnuIvUjzOpxtBol00/RGon5L2
	Ld5HL5+Vbz2T9bHL5XMxDM9l5cyPAoBQs/q+3yQpMsAoH7KOFrMqBgduGUtq2iksm2x7wBwIOb6
	7VEzmMN9NNg7D+eajxVVeVYEdW2D33VVFJAwDDc+HhwYTqdENHieu09L0zWebVGnZcS1/EJCLvH
	XkrN+5rED81umW+oZhKtqcPxY5H2Isv5zPf/HrHaHATO7NvvoxZUJijXHz8p+naqUFIKFf/sD2h
	o2VjvrneSlQ=
X-Received: by 2002:a05:6000:400a:b0:3a5:2cb5:63fd with SMTP id ffacd0b85a97d-3a57238b522mr9595360f8f.10.1750109938539;
        Mon, 16 Jun 2025 14:38:58 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEzpDB07Ow6Aq7oaibwATYH2bwGc1v46BbhwhcmxYHu7okQGHS3ELJ0eFf8b83N36p9EgRDvg==
X-Received: by 2002:a05:6000:400a:b0:3a5:2cb5:63fd with SMTP id ffacd0b85a97d-3a57238b522mr9595351f8f.10.1750109938128;
        Mon, 16 Jun 2025 14:38:58 -0700 (PDT)
Received: from pollux ([2a00:79c0:662:b300:abf:b8ff:feee:998b])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a568b089a7sm11887641f8f.49.2025.06.16.14.38.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Jun 2025 14:38:57 -0700 (PDT)
Date: Mon, 16 Jun 2025 23:38:55 +0200
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
Message-ID: <aFCO7_RHuAaGyq1Q@pollux>
References: <20250613235705.28006-1-robin.clark@oss.qualcomm.com>
 <20250613235705.28006-3-robin.clark@oss.qualcomm.com>
 <aE1RPZ_-oFyM4COy@pollux>
 <CACSVV00uwmuAC4eMi-4QiF4sOu4r9u8eXxyAgt83YS8Yfgoemg@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CACSVV00uwmuAC4eMi-4QiF4sOu4r9u8eXxyAgt83YS8Yfgoemg@mail.gmail.com>

On Sat, Jun 14, 2025 at 08:03:20AM -0700, Rob Clark wrote:
> On Sat, Jun 14, 2025 at 3:39 AM Danilo Krummrich <dakr@redhat.com> wrote:
> >
> > On Fri, Jun 13, 2025 at 04:57:03PM -0700, Rob Clark wrote:
> > > For UNMAP/REMAP steps we could be needing to lock objects that are not
> > > explicitly listed in the VM_BIND ioctl in order to tear-down unmapped
> > > VAs.  These helpers handle locking/preparing the needed objects.
> >
> > Yes, that's a common use-case. I think drivers typically iterate through their
> > drm_gpuva_ops to lock those objects.
> >
> > I had a look at you link [1] and it seems that you keep a list of ops as well by
> > calling vm_op_enqueue() with a new struct msm_vm_op from the callbacks.
> >
> > Please note that for exactly this case there is the op_alloc callback in
> > struct drm_gpuvm_ops, such that you can allocate a custom op type (i.e. struct
> > msm_vm_op) that embedds a struct drm_gpuva_op.
> 
> I did use drm_gpuvm_sm_xyz_ops_create() in an earlier iteration of my
> VM_BIND series, but it wasn't quite what I was after.  I wanted to
> apply the VM updates immediately to avoid issues with a later
> map/unmap overlapping an earlier map, which
> drm_gpuvm_sm_xyz_ops_create() doesn't really handle.  I'm not even
> sure why this isn't a problem for other drivers unless userspace is
> providing some guarantees.

The drm_gpuva_ops are usually used in a pattern like this.

	vm_bind {
		for_each_vm_bind_operation {
			drm_gpuva_for_each_op {
				// modify drm_gpuvm's interval tree
				// pre-allocate memory
				// lock and prepare objects
			}
		}
		
		drm_sched_entity_push_job();
	}

	run_job {
		for_each_vm_bind_operation {
			drm_gpuva_for_each_op {
				// modify page tables
			}
		}
	}

	run_job {
		for_each_vm_bind_operation {
			drm_gpuva_for_each_op {
				// free page table structures, if any
				// free unused pre-allocated memory
			}
		}
	}

What did you do instead to get map/unmap overlapping? Even more interesting,
what are you doing now?

> Once I realized I only wanted to defer the
> application of the pgtable changes, but keep all the
> locking/allocation/etc in the synchronous part of the ioctl,
> vm_op_enqueue() was the natural solution.

But vm_op_enqueue() creates exactly this list of operations you would get from
drm_gpuvm_sm_{map,unmap}_ops_create(), just manually, no?

<snip>

> > > Note that these functions do not strictly require the VM changes to be
> > > applied before the next drm_gpuvm_sm_map_lock()/_unmap_lock() call.  In
> > > the case that VM changes from an earlier drm_gpuvm_sm_map()/_unmap()
> > > call result in a differing sequence of steps when the VM changes are
> > > actually applied, it will be the same set of GEM objects involved, so
> > > the locking is still correct.
> >
> > I'm not sure about this part, how can we be sure that's the case?
> 
> I could be not imaginative enough here, so it is certainly worth a
> second opinion.  And why I explicitly called it out in the commit msg.
> But my reasoning is that any new op in the second pass that actually
> applies the VM updates which results from overlapping with a previous
> update in the current VM_BIND will only involve GEM objects from that
> earlier update, which are already locked.

Yeah, it's probably fine, since, as you say, the only additional object can be
the req_obj from the previous iteration.


Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 839762DF3C0
	for <linux-kernel@vger.kernel.org>; Tue, 17 Jun 2025 09:51:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750153903; cv=none; b=ZZ/Dg7BmzB1upOtAD+h9M9qSeHBaNq8a47QNcygyC/rbK+tlaQTEpknb3nMm0UEYiBuAHwCf/dLjwwBNyr4vJQLRumiQRGigj807u3rCtpn2GlJMYaT+J0ru9MZ5ESUWkccshjC2BywOqxrQ1qyUmvdUWYUZu5KsCeiicFp2irw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750153903; c=relaxed/simple;
	bh=8vtl0Cdt6DXG6me1m4jejmsCOnOuNWgjjHF8FIGQbP4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=PaYFm81B1KRi9xukO4EIXtnEnCigvMV27W4q4oJYW/4sSyX6Yu7RjkwO0Nw+kd+8Yzllokh/k5uJbwOJ7R88zckKj9EmUotgPWyQ1zZuYrgJ7OuVfGIdLEJsjTUasCCqts1nSk4WjEbGd76wUIyq8YVnwrF+YG64DZ0uO8pDHPU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=Fi+E+HZy; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="Fi+E+HZy"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1750153900;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Z1J9EKk4I7H6WmvI/18gnTD4j7ClTvJrTACRAA21oo8=;
	b=Fi+E+HZyG2DSpJyknBLdGzyRwsTrsD1u4Oajq+GpYyCK1j3Kf/PUhuphPdRhGtq4RUkIEP
	tmWLZjSzC+9gnxRFVhOEZmKM1+nI6zVOGQzQHHpVTcjIl2vbdWu5aaR+8I0ghEcQDagT8o
	KBQowGyF5LNtPfGVqivVX5nnMW2ftJc=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-283-CCJxdZUcP0aMSJx-PPmHjQ-1; Tue, 17 Jun 2025 05:51:38 -0400
X-MC-Unique: CCJxdZUcP0aMSJx-PPmHjQ-1
X-Mimecast-MFC-AGG-ID: CCJxdZUcP0aMSJx-PPmHjQ_1750153897
Received: by mail-wm1-f69.google.com with SMTP id 5b1f17b1804b1-4535011d48eso9275945e9.3
        for <linux-kernel@vger.kernel.org>; Tue, 17 Jun 2025 02:51:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750153897; x=1750758697;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Z1J9EKk4I7H6WmvI/18gnTD4j7ClTvJrTACRAA21oo8=;
        b=aMRGG0oOEdtqMyi2aJ2CpgvX0R+GxzIUUM+MfhdbNGFy6kGkh+kj7DzvYBnTR2XCa5
         mHBDfqnFp1c9wYzIOYenL5RS8FcU/k/aUmclDPFE/rI/sCtn4pd7RdthS5hWhBOBMtcu
         WfHJyOYG8Cs2VXaCWiddSAC+ulIV4fydZt+OS7ULeQYudXIXUOBJPbgzU6Cg9lf038Q9
         U0G3i/W3n6XzDCv8SuYz5DkcZi0guFwUqZmGqXf9k0J0Ff0I2yShRoumrQRe7aj8CIoz
         GZ9U6myPzMvgjBINvJ6CfQGTOOg9JJqvNoyYzCgRcoCj+zi8wIkrFcPTQBR257TyoHTr
         PA8w==
X-Forwarded-Encrypted: i=1; AJvYcCXViX3wWkv+d/UkbpeQ//goHBELX89UA5WSNH0zNjgdqZc4INhz+4D5Zm9Bb1gpl8epBLOUuBaL6+8sbps=@vger.kernel.org
X-Gm-Message-State: AOJu0YxgVJXKl04FwELtOdoIQfp/QWiMOP0g2edXAif9XsANDqX9511q
	xXZWTxZ2HWP1MO5jt/z7KAd9w7gOhWbCmbel0/JT3scakNQEZVSBtTnah5o5ixdBKxgrGJi+hMw
	Gif2msTBMV3hVc/KxmUjY0F9s4/m/c+XcggliEerjD5WwaTb8nZBjxTvrwQddgkBtPw==
X-Gm-Gg: ASbGnctUWW5dCOS9yUPzJ6w5DGt+mKRW4xy7azLTcbyqcFC/HFnwn1LZ0zbzKQK3BRu
	yDJDMi6jNKHgONQEhL01EGKV/bfgmtcHjBWby0vVVuhPLOEEAhDg7yh1xDM+tln5PbwfWSLL4HJ
	G8AZhTBtpqvz7KzxQhB1JrVZQJlyYTckGSdjj7x8ETFkQvOW9q1lAU/muLeHniIzZRxG6OhCK6o
	K4yV9e5ANRCaE8yE1oY/LYpckJur42W4gPXkm3yn5rdGFTXoujN0/4Lq1BtLJ4fcZ3Y6/lUB+y9
	yRLxb2Df9k4=
X-Received: by 2002:a05:600c:8b01:b0:441:d437:e3b8 with SMTP id 5b1f17b1804b1-4533cac9179mr105803415e9.23.1750153897091;
        Tue, 17 Jun 2025 02:51:37 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFldMEnuo9yC084iP1KvhWhShNC4LmtmIc7iidP4b8onqmO+ZGv8akFrhh6Cvt1pfxb1j8zTw==
X-Received: by 2002:a05:600c:8b01:b0:441:d437:e3b8 with SMTP id 5b1f17b1804b1-4533cac9179mr105803085e9.23.1750153896629;
        Tue, 17 Jun 2025 02:51:36 -0700 (PDT)
Received: from pollux ([2a00:79c0:62e:9200:abf:b8ff:feee:998b])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4532e224600sm171952695e9.8.2025.06.17.02.51.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Jun 2025 02:51:36 -0700 (PDT)
Date: Tue, 17 Jun 2025 11:51:34 +0200
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
Message-ID: <aFE6pq8l33NXfFdT@pollux>
References: <20250613235705.28006-1-robin.clark@oss.qualcomm.com>
 <20250613235705.28006-3-robin.clark@oss.qualcomm.com>
 <aE1RPZ_-oFyM4COy@pollux>
 <CACSVV00uwmuAC4eMi-4QiF4sOu4r9u8eXxyAgt83YS8Yfgoemg@mail.gmail.com>
 <aFCO7_RHuAaGyq1Q@pollux>
 <CACSVV03WboQp_A1bzQ+xpX5DDkfaoXmbTuo9RfZ9bMaVTqdU+A@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CACSVV03WboQp_A1bzQ+xpX5DDkfaoXmbTuo9RfZ9bMaVTqdU+A@mail.gmail.com>

On Mon, Jun 16, 2025 at 03:25:08PM -0700, Rob Clark wrote:
> On Mon, Jun 16, 2025 at 2:39 PM Danilo Krummrich <dakr@redhat.com> wrote:
> >
> > On Sat, Jun 14, 2025 at 08:03:20AM -0700, Rob Clark wrote:
> > > On Sat, Jun 14, 2025 at 3:39 AM Danilo Krummrich <dakr@redhat.com> wrote:
> > > >
> > > > On Fri, Jun 13, 2025 at 04:57:03PM -0700, Rob Clark wrote:
> > > > > For UNMAP/REMAP steps we could be needing to lock objects that are not
> > > > > explicitly listed in the VM_BIND ioctl in order to tear-down unmapped
> > > > > VAs.  These helpers handle locking/preparing the needed objects.
> > > >
> > > > Yes, that's a common use-case. I think drivers typically iterate through their
> > > > drm_gpuva_ops to lock those objects.
> > > >
> > > > I had a look at you link [1] and it seems that you keep a list of ops as well by
> > > > calling vm_op_enqueue() with a new struct msm_vm_op from the callbacks.
> > > >
> > > > Please note that for exactly this case there is the op_alloc callback in
> > > > struct drm_gpuvm_ops, such that you can allocate a custom op type (i.e. struct
> > > > msm_vm_op) that embedds a struct drm_gpuva_op.
> > >
> > > I did use drm_gpuvm_sm_xyz_ops_create() in an earlier iteration of my
> > > VM_BIND series, but it wasn't quite what I was after.  I wanted to
> > > apply the VM updates immediately to avoid issues with a later
> > > map/unmap overlapping an earlier map, which
> > > drm_gpuvm_sm_xyz_ops_create() doesn't really handle.  I'm not even
> > > sure why this isn't a problem for other drivers unless userspace is
> > > providing some guarantees.
> >
> > The drm_gpuva_ops are usually used in a pattern like this.
> >
> >         vm_bind {
> >                 for_each_vm_bind_operation {
			    drm_gpuvm_sm_xyz_ops_create();
> >                         drm_gpuva_for_each_op {
> >                                 // modify drm_gpuvm's interval tree
> >                                 // pre-allocate memory
> >                                 // lock and prepare objects
> >                         }
> >                 }
> >
> >                 drm_sched_entity_push_job();
> >         }
> >
> >         run_job {
> >                 for_each_vm_bind_operation {
> >                         drm_gpuva_for_each_op {
> >                                 // modify page tables
> >                         }
> >                 }
> >         }
> >
> >         run_job {
> >                 for_each_vm_bind_operation {
> >                         drm_gpuva_for_each_op {
> >                                 // free page table structures, if any
> >                                 // free unused pre-allocated memory
> >                         }
> >                 }
> >         }
> >
> > What did you do instead to get map/unmap overlapping? Even more interesting,
> > what are you doing now?
> 
> From what I can tell, the drivers using drm_gpva_for_each_op()/etc are
> doing drm_gpuva_remove() while iterating the ops list..
> drm_gpuvm_sm_xyz_ops_create() itself does not modify the VM.  So this
> can only really work if you perform one MAP or UNMAP at a time.  Or at
> least if you process the VM modifying part of the ops list before
> proceeding to the next op.

(Added the drm_gpuvm_sm_xyz_ops_create() step above.)

I went through the code you posted [1] and conceptually you're implementing
exactly the pattern I described above, i.e. you do:

	vm_bind {
		for_each_vm_bind_operation {
			drm_gpuvm_sm_xyz_exec_lock();
		}

		for_each_vm_bind_operation {
			drm_gpuvm_sm_xyz() {
				// modify drm_gpuvm's interval tree
				// create custom ops
			}
		}

		drm_sched_entity_push_job();
	}

	run_job {
		for_each_vm_bind_operation {
			for_each_custom_op() {
				// do stuff
			}
		}
	}

However, GPUVM intends to solve your use-case with the following, semantically
identical, approach.

	vm_bind {
		for_each_vm_bind_operation {
			drm_gpuvm_sm_xyz_ops_create();

			drm_gpuva_for_each_op {
				// modify drm_gpuvm's interval tree
				// lock and prepare objects (1)
			}
		}

		drm_sched_entity_push_job();
	}

	run_job {
		for_each_vm_bind_operation {
			drm_gpuva_for_each_op() {
				// do stuff
			}
		}
	}

(Note that GPUVM already supports to extend the existing OP structures; you
should take advantage of that.)

Hence, the helper we really want is to lock and prepare the objects at (1). I.e.
a helper that takes a pointer to a struct drm_gpuva_op and locks / validates the
corresponding objects.

[1] https://gitlab.freedesktop.org/robclark/msm/-/blob/sparse-newer/drivers/gpu/drm/msm/msm_gem_vma.c


Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com [209.85.214.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 438F21A8F60
	for <linux-kernel@vger.kernel.org>; Thu, 27 Mar 2025 09:37:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743068262; cv=none; b=hmkQuI3KHkOYiXE64yvkrzCj+rd0gyYVPvqBopDJvIWNgcQ+sNTascd2kBVgd41Z++V6CL/9CPnRoeVHljsHMD/1OYAS66L6WF8meGOumA58iF8UfZna48AQoqPPaXNO0qkT8WbY52QF7YkEaNWjYRTpTnAowy1OQ5HfhYq33mk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743068262; c=relaxed/simple;
	bh=nO2bts7JVplwiKWYXkIfxfGGR1gvkSX82zQJe0Q40fg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=M3NGQ578dAGcGiQksaCR+EOqDKwUcF3brMgviXFqW1dGn4hsmtPCKVLheT6S+frGK9X8GvPWZL1ppFOQauSFjeN91S633X8BdfTLNhs9KhQE45fL9cUX+DHoj42En2Re/Oy1uWH+CKjOKbFCgY3/F9shPPIHG7VEi7ZGfl3PPag=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=juVr3uyb; arc=none smtp.client-ip=209.85.214.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="juVr3uyb"
Received: by mail-pl1-f175.google.com with SMTP id d9443c01a7336-2242ac37caeso116825ad.1
        for <linux-kernel@vger.kernel.org>; Thu, 27 Mar 2025 02:37:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1743068260; x=1743673060; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=UIotJVVBD3/NnOnKPh1r2ow/aFL293MuBe0NVckPSv8=;
        b=juVr3uybdCGxMetPZelwjhAW+28e8Uo6burLBom5KxwVINUArfSw0IvoUFWueCsiXv
         2wQTx3wwq8cm3u9LVJz2hl1+gyLX9aN4ZQSzBpvprt2ssNDC/6HsfevJF2DT6RY56GIE
         MfA/27uhA4qq1Cq0QirJb5BJzmo0r6FmrT1tpj4eLmnIxorSmsLCQK4uuCOPks48gYSK
         I4dzE5h3wsAAQLJthqeopQUh+5zpqZ6KT0tr0IELlteTbCZv+v9KbJs1jOQkIau5VMyS
         VhPm+TAkEG6paNT4FiZmm+5rImb/YA+pJnF71MT9j8PyZgYLHaQKaefMtgfXe+NCkJ8O
         sarQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743068260; x=1743673060;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=UIotJVVBD3/NnOnKPh1r2ow/aFL293MuBe0NVckPSv8=;
        b=sz+8/Iu7IZ1MECoiriqGK2gOmQoBh8xNrLQNArEvCJYv4zti0MqLYN7JAGVrwaPxaL
         gr18Na+qEo7CH18ZT8bpo4lxXCTNg0ECAPvkCVXzfaDkNb4RkOoTf1odUHApqtW4Es1W
         z9/Z6epHNfAV60g5Ih2kPinKCfQ8zd3oTT4D2Iia723kAplKDTh8YkKDW0WhCsnsgOWQ
         Ajs3bFMHKLs7qcsdI+tKxSnmIzdUathkjOeoTX3WJ7vqarEplO9faNAjaQsQNe+IRGDc
         ugFyXZ93HnbQwvol8Miw9gjeTL0XEUw3ajUemtIVHiGovvL/nht3WDOz4+ttZYZncpyv
         gTxg==
X-Forwarded-Encrypted: i=1; AJvYcCXQiG+pQlIzxn6s8nzqF0iBrwahIzKKZM/+mK0OJCmGu57vNNX7xNfCLdph5pmTvVZ0FKVzsDk+AxvyDXQ=@vger.kernel.org
X-Gm-Message-State: AOJu0YyQV2GKesh1kOTwppQsMP+clVKaS+cCzZOj4yjcnEPcea84InJZ
	jTJYBdlxjp7k1l3ZtxB2sKMZa39I1zaScfFT3z/NETMOacXULFgAnmpBmW6kTw==
X-Gm-Gg: ASbGncvaKsr7bYKP/pQBVx5w/kRV2o1tKEdPacoKI8eQHeN2okOzg2J6nU6cBq6/oV/
	QpxBQ14CU2ZmqHvRNOzWchSqA5lbdxnIXEy7jZUs+duPuGboPXBPBtV58FELqgbc1uVKqSBXgc6
	a8U1pxJYt5G3oEaDmdPbrST3vef132F+dyLydHcIGiX4uVea3P/N8stzi0k/avDeXU7F+I0n/dj
	No5hCk7fpM3X11QRrdNlIjWQRVBqAItLvn3C+Nc2uNVFIWkeFiPC0i6CaV/Ckb0j8df6L/Blzku
	Vnh7qoHtp4tOzDwz9J4xNebWS8hZF6x7q09Je/1OOB9bjAYHk7oTZ9wYVcG0Vc7hUFRaaV4VwQD
	x0nyECrFFm11d8e6cTV2a
X-Google-Smtp-Source: AGHT+IGB0Vi5pWlDgQqZ4uKyMwBPu6nja3HHv+BqBDGefnFIarUTyd7UM+7yrEZbE7LmEsV4/0FJxQ==
X-Received: by 2002:a17:902:f645:b0:223:f479:3860 with SMTP id d9443c01a7336-22806dd46f8mr2324225ad.18.1743068260152;
        Thu, 27 Mar 2025 02:37:40 -0700 (PDT)
Received: from google.com (28.140.38.34.bc.googleusercontent.com. [34.38.140.28])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-73907b36bfasm13626302b3a.2.2025.03.27.02.37.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Mar 2025 02:37:39 -0700 (PDT)
Date: Thu, 27 Mar 2025 09:37:31 +0000
From: Sebastian Ene <sebastianene@google.com>
To: Quentin Perret <qperret@google.com>
Cc: catalin.marinas@arm.com, joey.gouly@arm.com, maz@kernel.org,
	oliver.upton@linux.dev, snehalreddy@google.com,
	sudeep.holla@arm.com, suzuki.poulose@arm.com, vdonnefort@google.com,
	will@kernel.org, yuzenghui@huawei.com, kvmarm@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	kernel-team@android.com, Andrei Homescu <ahomescu@google.com>
Subject: Re: [PATCH v4 3/3] KVM: arm64: Release the ownership of the hyp rx
 buffer to Trustzone
Message-ID: <Z-UcW32Hk6f_cuxc@google.com>
References: <20250326113901.3308804-1-sebastianene@google.com>
 <20250326113901.3308804-4-sebastianene@google.com>
 <Z-Qv4b0vgVql2yOb@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Z-Qv4b0vgVql2yOb@google.com>

On Wed, Mar 26, 2025 at 04:48:33PM +0000, Quentin Perret wrote:
> On Wednesday 26 Mar 2025 at 11:39:01 (+0000), Sebastian Ene wrote:
> > Introduce the release FF-A call to notify Trustzone that the hypervisor
> > has finished copying the data from the buffer shared with Trustzone to
> > the non-secure partition.
> >
> > Reported-by: Andrei Homescu <ahomescu@google.com>
> > Signed-off-by: Sebastian Ene <sebastianene@google.com>
> > ---
> >  arch/arm64/kvm/hyp/nvhe/ffa.c | 9 ++++++---
> >  1 file changed, 6 insertions(+), 3 deletions(-)
> > 
> > diff --git a/arch/arm64/kvm/hyp/nvhe/ffa.c b/arch/arm64/kvm/hyp/nvhe/ffa.c
> > index 6df6131f1107..ac898ea6274a 100644
> > --- a/arch/arm64/kvm/hyp/nvhe/ffa.c
> > +++ b/arch/arm64/kvm/hyp/nvhe/ffa.c
> > @@ -749,6 +749,7 @@ static void do_ffa_part_get(struct arm_smccc_res *res,
> >  	DECLARE_REG(u32, uuid3, ctxt, 4);
> >  	DECLARE_REG(u32, flags, ctxt, 5);
> >  	u32 count, partition_sz, copy_sz;
> > +	struct arm_smccc_res _res;
> >  
> >  	hyp_spin_lock(&host_buffers.lock);
> >  	if (!host_buffers.rx) {
> > @@ -765,11 +766,11 @@ static void do_ffa_part_get(struct arm_smccc_res *res,
> >  
> >  	count = res->a2;
> >  	if (!count)
> > -		goto out_unlock;
> > +		goto release_rx;
> >  
> >  	if (hyp_ffa_version > FFA_VERSION_1_0) {
> >  		/* Get the number of partitions deployed in the system */
> > -		if (flags & 0x1)
> > +		if (flags & PARTITION_INFO_GET_RETURN_COUNT_ONLY)
> >  			goto out_unlock;
> >  
> >  		partition_sz  = res->a3;
> > @@ -781,10 +782,12 @@ static void do_ffa_part_get(struct arm_smccc_res *res,
> >  	copy_sz = partition_sz * count;
> >  	if (copy_sz > KVM_FFA_MBOX_NR_PAGES * PAGE_SIZE) {
> >  		ffa_to_smccc_res(res, FFA_RET_ABORTED);
> > -		goto out_unlock;
> > +		goto release_rx;
> >  	}
> >  
> >  	memcpy(host_buffers.rx, hyp_buffers.rx, copy_sz);
> > +release_rx:
> > +	ffa_rx_release(&_res);

Hi,

> 
> I'm a bit confused about this release call here. In the pKVM FF-A proxy
> model, the hypervisor is essentially 'transparent', so do we not expect
> EL1 to issue that instead?

I think the EL1 should also issue this call irrespective of what the
hypervisor is doing. Sudeep can correct me here if I am wrong, but this
is my take on this.

I am looking at this as a way of signaling the availability of the rx
buffer across partitions. There are some calls that when invoked, they
place the buffer in a 'locked state'.


> How is EL1 supposed to know that the
> hypervisor has already sent the release call?

It doesn't need to know, it issues the call as there is no hypervisor
in-between, why would it need to know ?

> And isn't EL1 going to be
> confused if the content of the buffer is overridden before is has issued
> the release call itself?

The hypervisor should prevent changes to the buffer mapped between the
host and itself until the release_rx call is issued from the host.
If another call that wants to make use of the rx buffer sneaks in, we
would have to revoke it with BUSY until rx_release is sent.

>What would otherwise prevent that from
> happening?

> 
> Thanks,
> Quentin
>

Thanks,
Sebastian

> >  out_unlock:
> >  	hyp_spin_unlock(&host_buffers.lock);
> >  }
> > -- 
> > 2.49.0.395.g12beb8f557-goog
> > 

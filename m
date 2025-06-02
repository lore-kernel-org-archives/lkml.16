Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 877FA1758B
	for <linux-kernel@vger.kernel.org>; Mon,  2 Jun 2025 10:22:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748859771; cv=none; b=SC9M56MZvPqBws8oW53YLlUp3x0KxxB7N5IyJQx9d9OY0jA+xNR39N0ZVifEayR7Jv2EVqBTpntPbgtnmzSNla/GaAXRi2FR0zyMrz8uhYjUmSvZqXZZN1VoTfsZkM3rYB+ntgtaGTfsiXyMIWv8MqSYdYOgNx0mHJ8y91UWGtM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748859771; c=relaxed/simple;
	bh=C9pmjVW0KhwAcy61epjvYTBa4pXDQwO2yV+k8s/fuC4=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=s0kSPWv3h/ac51WB4h++nAzcxmtlLrh90gMyPclLSebK79DzmBXS4AXpZKNcyFNyTJ1Wd0qS/H5wU82noomHXrk5BxiSCt/fNF7wf/gsuwkssAPnCYfkmbROkwE66vuKVcTHv9w8Y5jIRSYyRv8Nkm+IiENbR42XfadqsqD547U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=Q0QXgeEH; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="Q0QXgeEH"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1748859768;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=CKMj/dmcZFnIoX+/jXJwdMyeYm/ORc0hdxg4CxCECwk=;
	b=Q0QXgeEHE8JrwbFxBCIH2P+xB/V/6ht8I78e6IoB03ZVh9k99z+qasneDXwSkG8HsKDQHP
	jFTDZeS2UIJvQ1F0QyW/SupSHCzEcvl9GJlBBrCOf+t70vzoFnGItp9mmpVCdGpV053WDH
	cCbO5J4RxW6s85uyML6N+ULhg1uTOyc=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-195-2hfh_mI2PPmC-y9yYQxzNA-1; Mon, 02 Jun 2025 06:22:47 -0400
X-MC-Unique: 2hfh_mI2PPmC-y9yYQxzNA-1
X-Mimecast-MFC-AGG-ID: 2hfh_mI2PPmC-y9yYQxzNA_1748859766
Received: by mail-wm1-f72.google.com with SMTP id 5b1f17b1804b1-442e0e6eb84so26122365e9.0
        for <linux-kernel@vger.kernel.org>; Mon, 02 Jun 2025 03:22:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748859766; x=1749464566;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=CKMj/dmcZFnIoX+/jXJwdMyeYm/ORc0hdxg4CxCECwk=;
        b=IiX29bVe7amGhRvlHZ4C+GTsZC3mTExg0cVxToRxwtCOhOpZ1x4FLSwJqyIsQypWKt
         l+NBN89kHqQ5FKmH9juB0s2spNpwkD2gKPmfSChnehpxoVOK03NL+bVmDGMqz+HUzmHz
         CbRZyN4XVMG7i0j9VPQabF2SqFs8kjhyoaJhJRVAmJdf+4H+/GIUqTSrpd5BsLIEOO/y
         Oyl/CjSrv7V4rQ+h/pIFtU8rk0BFi/xY4+QAX5ABxHrdR/qrg1s+tUbioogVqXG3SncT
         knbx/S7TkNJYSWUOm2F/ZryXGe9qw8o8EsbH+E83xGP+emI6cwrVJTn0Qbxv7rVgerlm
         HoYA==
X-Forwarded-Encrypted: i=1; AJvYcCUtKbseB4K6OCtnZah6+/vaK6khG+lGjb2wZy5ZSCMXcpnXhzi3BJbHA2pF7qRd0+b5AjPpCCuVevHCrRs=@vger.kernel.org
X-Gm-Message-State: AOJu0YxYRTIi8vFSa1ZzF1unadJPq6GGC0dSrSLD+phwTcRol00huH9g
	8cXROxz59T0JVaXCJbvKOCvp6TpiBtfOhea+UTurRw2zEt2SuJiBCdaWs41IQKhFitK7MX7a653
	Cg5ksFpzqyYbBOkLGpDenQOFS8npElmKW6Du2Atoqaic9vKbyAXmFz0WUf2QPWZ9kGA==
X-Gm-Gg: ASbGncvwm4BX1dUgpTmZFMgarztHSU7EPFTTMzPPoilDygDn6x82kANnrtYawmXY9pD
	XhfGduggLwKMc0lN1pvxVaU4HLTPvhyL3KDab9Xjr+ALCSOb7ZUPkZhTH4N6qlC3C+J4Xrdxk6H
	kw3l5jS8L1SG6m3TUgH9Dy2bqbIy4zAfwmTTGXb2Q4SaF+kb/RVUN7EBS8Q1lcFB0XoZWZhEpYp
	f38wyH8efjon3Z8WRVvfgpehmy3cWX2PbVoilZQvnP/jTrfOMuLOo3GqvlBsKQVwzaoxw7WNcDD
	fPb5dxM/ptrBE5OpN8fouOTo+hx1Hd6k
X-Received: by 2002:a05:600c:1c08:b0:43c:ec0a:ddfd with SMTP id 5b1f17b1804b1-450d64e2cedmr95031995e9.6.1748859765976;
        Mon, 02 Jun 2025 03:22:45 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEeawgvYHwXYBD7Ncx6S/vt4KgrtY/j8BkA9OdXSa/4ZY4UEAQYaLMSnHOrNdPF14e7MUUAoA==
X-Received: by 2002:a05:600c:1c08:b0:43c:ec0a:ddfd with SMTP id 5b1f17b1804b1-450d64e2cedmr95031585e9.6.1748859765515;
        Mon, 02 Jun 2025 03:22:45 -0700 (PDT)
Received: from imammedo.users.ipa.redhat.com ([85.93.96.130])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-450d7fb80f6sm115820455e9.28.2025.06.02.03.22.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Jun 2025 03:22:45 -0700 (PDT)
Date: Mon, 2 Jun 2025 12:22:44 +0200
From: Igor Mammedov <imammedo@redhat.com>
To: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Cc: "Michael S. Tsirkin" <mst@redhat.com>, Jonathan Cameron
 <Jonathan.Cameron@huawei.com>, Shiju Jose <shiju.jose@huawei.com>,
 qemu-arm@nongnu.org, qemu-devel@nongnu.org, Philippe =?UTF-8?B?TWF0aGll?=
 =?UTF-8?B?dS1EYXVkw6k=?= <philmd@linaro.org>, Ani Sinha
 <anisinha@redhat.com>, Eduardo Habkost <eduardo@habkost.net>, Marcel
 Apfelbaum <marcel.apfelbaum@gmail.com>, Peter Maydell
 <peter.maydell@linaro.org>, Shannon Zhao <shannon.zhaosl@gmail.com>, Yanan
 Wang <wangyanan55@huawei.com>, Zhao Liu <zhao1.liu@intel.com>,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH v9 12/20] acpi/generic_event_device: add logic to detect
 if HEST addr is available
Message-ID: <20250602122244.081a1960@imammedo.users.ipa.redhat.com>
In-Reply-To: <20250530221810.694ce02e@foz.lan>
References: <cover.1747722973.git.mchehab+huawei@kernel.org>
	<aa74b756f633dbee5442cf4baa2c1d81a669d2f9.1747722973.git.mchehab+huawei@kernel.org>
	<20250528174212.2823d3de@imammedo.users.ipa.redhat.com>
	<20250530080120-mutt-send-email-mst@kernel.org>
	<20250530164903.0f9f8444@imammedo.users.ipa.redhat.com>
	<20250530221810.694ce02e@foz.lan>
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.49; x86_64-redhat-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Fri, 30 May 2025 22:18:10 +0200
Mauro Carvalho Chehab <mchehab+huawei@kernel.org> wrote:

> Em Fri, 30 May 2025 16:49:03 +0200
> Igor Mammedov <imammedo@redhat.com> escreveu:
> 
> > On Fri, 30 May 2025 08:01:28 -0400
> > "Michael S. Tsirkin" <mst@redhat.com> wrote:
> >   
> > > On Wed, May 28, 2025 at 05:42:12PM +0200, Igor Mammedov wrote:    
> > > > On Tue, 20 May 2025 08:41:31 +0200
> > > > Mauro Carvalho Chehab <mchehab+huawei@kernel.org> wrote:
> > > >       
> > > > > Create a new property (x-has-hest-addr) and use it to detect if
> > > > > the GHES table offsets can be calculated from the HEST address
> > > > > (qemu 10.0 and upper) or via the legacy way via an offset obtained
> > > > > from the hardware_errors firmware file.      
> > > > 
> > > > 
> > > > it doesn't apply to current master anymore      
> > > 
> > > indeed. Mauro?    
> > 
> > Michael,
> > it's trivial conflict in machine compat,
> > could you fix it up while applying?  
> 
> IMHO, that's the best. The thing is, as code gets merged upstream with
> backports, conflicts happen.
> 
> I can re-send the series, if you prefer, as I'm keeping it rebasing it
> from time to time at:
> 	https://gitlab.com/mchehab_kernel/qemu/-/tree/qemu_submitted?ref_type=heads
> 
> (it is on the top of upstream/master)
> 
> But even that might have conflicts on your test tree if you pick
> other patches touching this backport table:
> 
> > -GlobalProperty hw_compat_10_0[] = {};
> > +GlobalProperty hw_compat_10_0[] = {
> > +    { TYPE_ACPI_GED, "x-has-hest-addr", "false" },
> > +};  
> 
> (this was the code when I sent the PR. When applying upstream,
> such hunk is now(*):
> 
>  GlobalProperty hw_compat_10_0[] = {
>      { "scsi-hd", "dpofua", "off" },
> +    { TYPE_ACPI_GED, "x-has-hest-addr", "false" },
>  };
> 
> 
> (*) https://gitlab.com/mchehab_kernel/qemu/-/commit/08c4859f8c6f36d7dccf2b773be88847e5d1fe0c
> 
> If you still prefer that I resubmit the entire PR, let me know.

If it's the only patch that needs rebase and doesn't affect the rest,
I'd say there is no need to spam the list with whole series respin, 
just post rebased v10 12/20 as reply here

If it's more than that, respin series.

> 
> Regards,
> Mauro
> 


Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com [209.85.214.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC9182820DB
	for <linux-kernel@vger.kernel.org>; Thu, 24 Apr 2025 16:42:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745512933; cv=none; b=kk4WiNFxFljoiuy808k69ET24Hq5gS/W2xks0RJOfYBptpyYOmPH/YvV/FonhqMkhlLDWqfMWMrJ2Wk+pGCrgiHd2YGLv76zBZqjbxAw29WiCrq8HkpthSPVNmzPUtKc0ZhFy5owC0stjXjlaayFf8NojrKMIMQaS/RL/mWjidY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745512933; c=relaxed/simple;
	bh=JeRt1GjyfAtswwCrV7oqxoxM6m1xqly/Nd6SBN4t56Y=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=rIyl1UHYS2L4oohJEngbfPLVuc8NTWclcGY47nU90z2+mtlhBDMJ0znHbIZu1RteQ9XCE6J1ihSLHtra+Jq/DsTs6pt1MBDwUyUVHGreA2W7xYe7juqSf8KRaFEtp6E6V1Gpqd0MAA5XYKLMbMdy0yHGhWuXUUqeG9WVeFM5tQo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=fastly.com; spf=pass smtp.mailfrom=fastly.com; dkim=pass (1024-bit key) header.d=fastly.com header.i=@fastly.com header.b=WHj6CB8b; arc=none smtp.client-ip=209.85.214.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=fastly.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fastly.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=fastly.com header.i=@fastly.com header.b="WHj6CB8b"
Received: by mail-pl1-f175.google.com with SMTP id d9443c01a7336-22401f4d35aso16052645ad.2
        for <linux-kernel@vger.kernel.org>; Thu, 24 Apr 2025 09:42:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fastly.com; s=google; t=1745512931; x=1746117731; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references
         :mail-followup-to:message-id:subject:cc:to:from:date:from:to:cc
         :subject:date:message-id:reply-to;
        bh=DdeGo1ClxSoX72okoFEyRfcK08keDtWUfesWE0Wuy7E=;
        b=WHj6CB8b9o3TcipQkg5zNKjnK63fmwIi5v6tYQzgdLpquoLFKWuYch1/s2CJWAwC7e
         FNa10rGdpVBkrPew8ZLNt2REwMU1w3WixFw80RCpF8+xN0TwpXdNZiDyFqiS2SffOLBv
         FtQqO/EwX3r1McFB35zKaaem0t8SvKQaysrKM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745512931; x=1746117731;
        h=in-reply-to:content-disposition:mime-version:references
         :mail-followup-to:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=DdeGo1ClxSoX72okoFEyRfcK08keDtWUfesWE0Wuy7E=;
        b=sOeCzMoUqMAfv7JbdKlJxccNga7b2UqSXAs0khC5Wo9gxbX0edEpIaS0FGzLWz5RMP
         KlT215sDEAoAulJ9ikahENfp5NwGazYAawS/JMcA74VedmETmwhUuGTa7V9xI4bsaS7+
         azvNnahNqhHiP1G//HqGpsVlZr5FkPxO9nzl/ACdwBUVLyu1mhKUc3SIZ2SrKCGxjOKQ
         6Ajfy9coAHGoGG4Rqs9oK91iwb72o4OWSRZM3tCVgu0BFl1Yv8VpeKN9fXr/igHd6esX
         NVfWFNwOEIOxE8V7w4AmzxCfdyAUFjFaMKPDRpnDZbJdwVMGpEHV1FoRpkdH6I2SbA2R
         fLQQ==
X-Forwarded-Encrypted: i=1; AJvYcCVNeZ0ndxQYOmBL1KsPstjGdnRZstZIaCNWAqlU/OdU8GvQJ79LZneIvt7MfOy2pE3TFKeLuEMKtyx0O+o=@vger.kernel.org
X-Gm-Message-State: AOJu0YxSYSGUOt7RY3foRl7T1o/mhBTXvpHC3LeMwCHyK/h784IegYh6
	teNYIvERSCKiDg0q6cWUwW85QwQEcdKx0xtKnHDjIFg6SWJuxI85nMF5RTYpwuY=
X-Gm-Gg: ASbGncubuG+LiYA+KDtzFZq4RIPn7HysgE3O4wBwFLTGcqgwcp/8rGEldT3ycUVrtI0
	33+ta9WwdPt2irb/cjxgY76VdNBlcY7Wi8xd1sv8pRljIdj3JIE0+wabTvIRnOm8pB3/R2HQ1/4
	ZfmK+H2VAfM7a3Y8DTOrE5tpIy2ugKsUqmhiRmB+MNHtclfR+Hp9LsIc0DGbiyAGKqx4XFOSa4E
	Lr9P75wBmSAqz6OeoEkdUUT0yb579HvnZZMXTYm1AtI652g2t46l/E88I4opTLPs1sPkmTdyoYJ
	T/DKado94Cley64PCWq24FOc8oJO2AgP0ZpeTvFRU9PwoQ6LltftUZp2TmDHFMVB+zCgVyLrdSr
	WyLDi1iTh89Pr
X-Google-Smtp-Source: AGHT+IEa/leTTXpHP/P8tSsO/GzMgau+ZpxBmyYg6Pl64hRilNRa+l3k2UxWj9/OLHG4D1p4FcHJlQ==
X-Received: by 2002:a17:902:cf03:b0:223:62f5:fd44 with SMTP id d9443c01a7336-22db3d77712mr48516315ad.40.1745512930792;
        Thu, 24 Apr 2025 09:42:10 -0700 (PDT)
Received: from LQ3V64L9R2 (c-24-6-151-244.hsd1.ca.comcast.net. [24.6.151.244])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22db50e79f7sm15673385ad.155.2025.04.24.09.42.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Apr 2025 09:42:10 -0700 (PDT)
Date: Thu, 24 Apr 2025 09:42:07 -0700
From: Joe Damato <jdamato@fastly.com>
To: Donald Hunter <donald.hunter@gmail.com>
Cc: netdev@vger.kernel.org, kuba@kernel.org,
	Jianfeng Liu <liujianfeng1994@gmail.com>,
	Krzysztof =?iso-8859-1?Q?Wilczy=B4nski?= <kwilczynski@kernel.org>,
	Hao Luo <haoluo@google.com>, Tejun Heo <tj@kernel.org>,
	Bjorn Helgaas <bhelgaas@google.com>,
	open list <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] tools/Makefile: Add ynl target
Message-ID: <aApp31D9sCcLQG50@LQ3V64L9R2>
Mail-Followup-To: Joe Damato <jdamato@fastly.com>,
	Donald Hunter <donald.hunter@gmail.com>, netdev@vger.kernel.org,
	kuba@kernel.org, Jianfeng Liu <liujianfeng1994@gmail.com>,
	Krzysztof =?iso-8859-1?Q?Wilczy=B4nski?= <kwilczynski@kernel.org>,
	Hao Luo <haoluo@google.com>, Tejun Heo <tj@kernel.org>,
	Bjorn Helgaas <bhelgaas@google.com>,
	open list <linux-kernel@vger.kernel.org>
References: <20250423204647.190784-1-jdamato@fastly.com>
 <m2selxsw1t.fsf@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <m2selxsw1t.fsf@gmail.com>

On Thu, Apr 24, 2025 at 11:17:34AM +0100, Donald Hunter wrote:
> Joe Damato <jdamato@fastly.com> writes:
> 
> > Add targets to build, clean, and install ynl headers, libynl.a, and
> > python tooling.
> >
> > Signed-off-by: Joe Damato <jdamato@fastly.com>
> > ---
> >  tools/Makefile | 16 +++++++++++++---
> >  1 file changed, 13 insertions(+), 3 deletions(-)
> >
> > diff --git a/tools/Makefile b/tools/Makefile
> > index 5e1254eb66de..c31cbbd12c45 100644
> > --- a/tools/Makefile
> > +++ b/tools/Makefile
> > @@ -41,6 +41,7 @@ help:
> >  	@echo '  mm                     - misc mm tools'
> >  	@echo '  wmi			- WMI interface examples'
> >  	@echo '  x86_energy_perf_policy - Intel energy policy tool'
> > +	@echo '  ynl			- ynl headers, library, and python tool'
> >  	@echo ''
> >  	@echo 'You can do:'
> >  	@echo ' $$ make -C tools/ <tool>_install'
> > @@ -118,11 +119,14 @@ freefall: FORCE
> >  kvm_stat: FORCE
> >  	$(call descend,kvm/$@)
> >  
> > +ynl: FORCE
> > +	$(call descend,net/ynl)
> > +
> >  all: acpi counter cpupower gpio hv firewire \
> >  		perf selftests bootconfig spi turbostat usb \
> >  		virtio mm bpf x86_energy_perf_policy \
> >  		tmon freefall iio objtool kvm_stat wmi \
> > -		debugging tracing thermal thermometer thermal-engine
> > +		debugging tracing thermal thermometer thermal-engine ynl
> >  
> >  acpi_install:
> >  	$(call descend,power/$(@:_install=),install)
> > @@ -157,13 +161,16 @@ freefall_install:
> >  kvm_stat_install:
> >  	$(call descend,kvm/$(@:_install=),install)
> >  
> > +ynl_install:
> > +	$(call descend,net/$(@:_install=),install)
> 
> nit: I'm not sure there's any merit in the $(@:_install=) construct,
> when it's only really needed when there are multiple targets in the same
> rule. For ynl_install, $(call descend,net/ynl,install) would be just
> fine. It's funny that the existing convention in this Makefile is to
> mostly use substitution for the _install rules, but literals for the
> _clean rules.

That's right, I was trying to follow convention. I agree with what
you said. If the maintainer of whichever tree this goes into would
prefer that I re-spin this, I am happy to do so. I was mostly trying
to keep it consistent with the existing targets.

> Either way:
> 
> Reviewed-by: Donald Hunter <donald.hunter@gmail.com>

Thanks!

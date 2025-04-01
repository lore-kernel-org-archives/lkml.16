Received: from mail-qt1-f175.google.com (mail-qt1-f175.google.com [209.85.160.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C4230204F61
	for <linux-kernel@vger.kernel.org>; Tue,  1 Apr 2025 14:43:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743518621; cv=none; b=V68KVaVXHMVfrv/klqx9Yb/zZHzvHGMB44eXvJXVrTypqARx5iQFZ7nHoFzmz4XdUZ6hEIcitVCmbZKf+l94BlzD+LSiYbnXGGiaUyQq5sVyML9LoRya3hlMx5PmYFEtbfD3kEU6weJfi+oE21gm8bsjl5u+aWM4BMRCRTrZ6vU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743518621; c=relaxed/simple;
	bh=SAerp0QX7HEQCu5qAwjKy/c73J7h5TTZmQ/PG1g5oNo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Hjaq2UHqiUrcmLBoJih0o6xVZTO4Yvp+IcZrhxABo7//egyz0xpP1oyCK/LserrkcXTlhHqfaUYCYZatK69uoTn/SkZ+JjWY+XAUFxetqws6FeBtRY2pKXQNIz7U0COaydN25GKuzzql6Gk/2XrAyKsDqwXeuBarK6Us97IVYLI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gourry.net; spf=pass smtp.mailfrom=gourry.net; dkim=pass (2048-bit key) header.d=gourry.net header.i=@gourry.net header.b=VgJQboA2; arc=none smtp.client-ip=209.85.160.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gourry.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gourry.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gourry.net header.i=@gourry.net header.b="VgJQboA2"
Received: by mail-qt1-f175.google.com with SMTP id d75a77b69052e-47698757053so64914261cf.0
        for <linux-kernel@vger.kernel.org>; Tue, 01 Apr 2025 07:43:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gourry.net; s=google; t=1743518618; x=1744123418; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=HN94Rbb3C+JRhW7V34+pZoioef1Q69r5rGBIntjnuf8=;
        b=VgJQboA2K2fOPxUr3Wfszq9gOxAHpda3GmaRkDdtm2XUo82H2ysCaZLvlqy71LoMci
         Gtj0z5z7smmYL6k67QHtFsRVojKe4RjH4Wre+w/lw/bwflDL86/eUkn1XvxVTiZztHBy
         1JYjzd3ksLRh2BwYVDL6Xwb6+OfqgJsu+nt2QyzjIMS/m0T06ryLkc7HKgCqFCBZk1/S
         2PV5aGD3v7eSxi/qesCrz/+H/ims+/ZHszZu5/jT8fxs00HbqbVOcy0J2aqlfAixuF37
         N7TrPFgKbaGlzjh5X5/C8Or0870qpIklzGrM66XngGplzx5Hk0BS4bV4PPLSM1w1Q0mQ
         ibjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743518618; x=1744123418;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HN94Rbb3C+JRhW7V34+pZoioef1Q69r5rGBIntjnuf8=;
        b=cH0ulbOnQzKz+SqpVg/fOKEZ9LjXJW9xBpmHrYB+ELeKa2B15D/OkqsQOzM9+WCMPA
         GJi+bHqER0s3he7gfOhf9BOM5h1qOmLoH+LZHibF02Owgz4OsAlJlLo21UPctBUDeQZy
         C6L9LWGXCZ5q8Jf7c+Eqh5VJviG5MvZg7eacC0s/01pXsNi3ywPGF3df09pfdGDfen93
         UF9Z1yjJgdoOdzU98pr3c9MTHkLIiAwEApXycOEJtZT+z33E5S5l/aJH+5gydkpTzFy8
         f87/ivps9/agDjsBGEbehBF8a3RLOS1y29hxNN2dV8WUSIlMJRKeR4CLJ9sip4PeLtcZ
         OJkA==
X-Forwarded-Encrypted: i=1; AJvYcCVWaSn+OcpElZ4yse41x1J/xyldq4vltkeze2H3jsZAnHsp5jMq017cDTZeIpI8RAE8ImaqpZIza5+B9XI=@vger.kernel.org
X-Gm-Message-State: AOJu0YzBK+E3bb41/5q/ywQbYWsNyITUD3xBk6iqUHRMdxij3O0qJ9Sl
	vAE3+ovBK6GvWOd7dGwAItaUWFgqB3I3wmBldm4dOzwtTpM5Xeg0GxhxBbHXYQg=
X-Gm-Gg: ASbGncsL6erNs9C4DBBxfM4bxF+A06EkG1L5UQtOat0+X+1GbVx1mGYTSq7ehAGnV4p
	wVOd2HCO578oOx2r5d7zLv+BHwSI1LPDfi9Q+CQjF4uHjEqJfc7L98hD8mXP383fWIcukn5DnAG
	RA9FMtf1v5uejtzGNdH4j0MOwh/mOVknjZ7xkiuqXdFIW5FQG1zbOrtYwejTJ89vi+dIeyjYfdD
	1HLk2Vi/gAn9kQLV0Uxg1YXHb8Rg/nsNepP6+l0lLtpCJGVMfCfaX9SVArVcoLs+cEn4DXEgdkC
	bZmoUSK82Jh2eW712Y6SBp+llGGQbPC5qeow/ZwENy+/gaVm2zsF8AMWWJktxC8QzJouB3Nvqbv
	R3oRdjoVzcFCHn101SDmCxpgjXo0=
X-Google-Smtp-Source: AGHT+IESWMLbS4rdl9AVCYJaEJTqsnnFG5ywMnL9FotwkE0oq8eGuaFBq1K5pnITmIFvf/Sd3O6CnQ==
X-Received: by 2002:ac8:7441:0:b0:478:dcdd:a257 with SMTP id d75a77b69052e-478dcdda41amr84695291cf.25.1743518618588;
        Tue, 01 Apr 2025 07:43:38 -0700 (PDT)
Received: from gourry-fedora-PF4VCD3F (pool-173-79-56-208.washdc.fios.verizon.net. [173.79.56.208])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-47782a4a709sm66857571cf.20.2025.04.01.07.43.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Apr 2025 07:43:38 -0700 (PDT)
Date: Tue, 1 Apr 2025 10:43:36 -0400
From: Gregory Price <gourry@gourry.net>
To: David Hildenbrand <david@redhat.com>
Cc: dan.j.williams@intel.com, nvdimm@lists.linux.dev,
	linux-kernel@vger.kernel.org, kernel-team@meta.com,
	vishal.l.verma@intel.com, dave.jiang@intel.com,
	linux-cxl@vger.kernel.org
Subject: Re: [PATCH] DAX: warn when kmem regions are truncated for memory
 block alignment.
Message-ID: <Z-v7mMZcP1JPIuj4@gourry-fedora-PF4VCD3F>
References: <20250321180731.568460-1-gourry@gourry.net>
 <Z-remBNWEej6KX3-@gourry-fedora-PF4VCD3F>
 <3e3115c0-c3a2-4ec2-8aea-ee1b40057dd6@redhat.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <3e3115c0-c3a2-4ec2-8aea-ee1b40057dd6@redhat.com>

On Tue, Apr 01, 2025 at 11:33:59AM +0200, David Hildenbrand wrote:
> On 31.03.25 20:27, Gregory Price wrote:
> > We discussed [1] how this auto-sizing can cause 1GB huge page
> > allocation failures (assuming you online as ZONE_NORMAL). That means
> > ACPI-informed sizing by default would potentially be harmful to existing
> > systems and adding yet-another-boot-option just seems nasty.
> > 
> > I've since dropped acpi-informed block size patch[2].  If there are opinions
> > otherwise, I can continue pushing it.
> 
> Oh, I thought we would be going forward with that. What's the reason we
> would not want to do that?
> 

It seemed like having it reduce block size by default would make 1GB huge
pages less reliable to allocate. If you think this isn't a large concern,
I can update and push again.  I suppose I could make it a build option.

Any opinions here are welcome.

~Gregory

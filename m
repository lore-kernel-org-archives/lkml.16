Received: from mail-qt1-f180.google.com (mail-qt1-f180.google.com [209.85.160.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 09F37187872
	for <linux-kernel@vger.kernel.org>; Fri,  7 Feb 2025 19:39:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738957197; cv=none; b=d5q03+q5SUBxHC7UUFgbOqstPINOZjJaOeYUwtPG3LbAT3nRFrKmNl40Mzu2CeSMSW8Vc/i5pVhsrdFKcYB3qfueHkjkHHt09rTgsZedFNYozRASolT0cyp327LwyFaOvFEiU2wnZuQaq22Jy1k/FI8w84evxuM40T7kRQbdi9Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738957197; c=relaxed/simple;
	bh=s68IMjEbM4K+2/scksXJORrf7isnIwyyzdntKTO/ea0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=F8yV/uR8tcx0cj4NCeN45WaH13MHOS+w4WgzlVsirCT46EYX9b5FA2/U8mZoojf+2T7VuYMfXyMJoJqBcOgZV4gpQ5Hrf5Q5lRyaHazUidsPB+HbrISpsdt/FmTbPHlfFxwmSGxC5Xq4Su0qUU//FuiM91S7goOfzOe+bl9WkO8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gourry.net; spf=pass smtp.mailfrom=gourry.net; dkim=pass (2048-bit key) header.d=gourry.net header.i=@gourry.net header.b=gx+BIpAH; arc=none smtp.client-ip=209.85.160.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gourry.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gourry.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gourry.net header.i=@gourry.net header.b="gx+BIpAH"
Received: by mail-qt1-f180.google.com with SMTP id d75a77b69052e-46c8474d8daso19051261cf.3
        for <linux-kernel@vger.kernel.org>; Fri, 07 Feb 2025 11:39:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gourry.net; s=google; t=1738957194; x=1739561994; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=HoCXaz7FZACGfE1FRe1gWStT7EUpURyoBtQiate1bg4=;
        b=gx+BIpAHAJvejz7jTsL32KD8GaArD9zgssrqvClGHnTpcGmwzeIEvI/SK5tYVIgPSO
         FHLV9/iGzu8w8SBqERyoHqaOycd5GzB+BXLxg1ZR2T82GtzsZdm5kJe/e4rerriMr+BW
         RD3o/T79ExaUPEYLzmj+t73FgYG15gg4+d8uETCdxvZUzsOmsvh32LzQDekNfsuHLem3
         6f92nu9gIy2AYBLF97k40PjxU8vkrL2pfOC4J8kgeRKRz9Foi4M1nCN5XkOM65p5SxMs
         x59ihCuep+bSoUYHZxaI/Z32G2BNFHFyIlV5qdDDz13LDomI4FYIq5wNcijCcZkTjsok
         JhtQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738957194; x=1739561994;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HoCXaz7FZACGfE1FRe1gWStT7EUpURyoBtQiate1bg4=;
        b=NEKC0eAYk27ZQU1/T8cGMpLKUOIUs+0DB2oQA/mQ3SIhSMbssIcl41tWcMvcaUQYc8
         QJZN92QdEYpkmlsPWpkXOBWTjRkHqaMdkeEyrKoVyTN3272pHOK/ol1e1cMdADCPDpPl
         /HQAGZmgy+5+G1i1qh6TjAOxFHhbtqeXU+YN9wyd1nP21KcpG52P9+fnBSTtgfrWx8JZ
         rM4uXjaygRsx2B5fx2MrYHZxn2fR1zWGdUk+UXnWQKORPweQAbrdEgtI03VdBa/25U1f
         4UmT4lVV4hGvuwedzOO9Sek5nlzUUjkanD8wcx/cxH+27FwMwa7C1Z9/kgrgRuR6Pewo
         PSUQ==
X-Forwarded-Encrypted: i=1; AJvYcCWG1cfcV2WbSZOrQu7aV+ut2XNsifiCQwK4DTxWMVwLM82EIFQsd/PmYMidKdwDwV4YqZZjxOfRzyPa76s=@vger.kernel.org
X-Gm-Message-State: AOJu0YzUaWccIYvf9N+ZuARJ7vgkr3WC4gljv56NyM7zc5MQug1di2lD
	xsGrZmwG2JRoDq56TNe2MM8cDeNa9x3q0NWFrvPi9cWIBYul3t1o+r0nNrTqfrY=
X-Gm-Gg: ASbGncvNq13toc573PzYimgALyUhoOZA1qlDvthA/HdBk6PhZwLPA5fAP+Af1BGjaxk
	+Cyz8u7ie7DuNRL95ycHEKrpEHVsKFk6BycsKve0vdz4ism1/cZWsxsCRpu8TBgoEitg98d0cWV
	kl9u4GWH1DrazRb35ggdrg6UmpxeRi+chPMhvsO+KGrYkzT0CKj7X/6aSglAm3inCXKE7ie6Nkh
	CLcadrIQEGGVwXxf+dM3nqUkJ4okBxaqpnTJQiJoa4gOQYREAdellldLuy8/h5c+0PuTIijwSIi
	RV7iQfJuI2WhyjyKowjgluAnoqcMWIZUQvkNwyXhtUHhDmMEJnPWLm0iM9jbk1t7J7OAfzbgeA=
	=
X-Google-Smtp-Source: AGHT+IFM4XYo7Sj0iZNNa5Y9RLAXbsSkxk7abPcbr2zA4DPL877A+xt+JaTMpBqXgKQnFgS8Cf3yJQ==
X-Received: by 2002:ac8:7f55:0:b0:46e:541b:c80e with SMTP id d75a77b69052e-471679ee853mr72470601cf.20.1738957193702;
        Fri, 07 Feb 2025 11:39:53 -0800 (PST)
Received: from gourry-fedora-PF4VCD3F (pool-173-79-56-208.washdc.fios.verizon.net. [173.79.56.208])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-471492a856fsm20177991cf.28.2025.02.07.11.39.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 07 Feb 2025 11:39:53 -0800 (PST)
Date: Fri, 7 Feb 2025 14:39:51 -0500
From: Gregory Price <gourry@gourry.net>
To: "Bowman, Terry" <terry.bowman@amd.com>
Cc: linux-cxl@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-pci@vger.kernel.org, nifan.cxl@gmail.com, dave@stgolabs.net,
	jonathan.cameron@huawei.com, dave.jiang@intel.com,
	alison.schofield@intel.com, vishal.l.verma@intel.com,
	dan.j.williams@intel.com, bhelgaas@google.com, mahesh@linux.ibm.com,
	ira.weiny@intel.com, oohall@gmail.com, Benjamin.Cheatham@amd.com,
	rrichter@amd.com, nathan.fontenot@amd.com,
	Smita.KoralahalliChannabasappa@amd.com, lukas@wunner.de,
	ming.li@zohomail.com, PradeepVineshReddy.Kodamati@amd.com,
	alucerop@amd.com
Subject: Re: [PATCH v5 08/16] cxl/pci: Map CXL PCIe Root Port and Downstream
 Switch Port RAS registers
Message-ID: <Z6Zhh9MVjee4dGr5@gourry-fedora-PF4VCD3F>
References: <20250107143852.3692571-1-terry.bowman@amd.com>
 <20250107143852.3692571-9-terry.bowman@amd.com>
 <Z6W2hFI7UsEslB3U@gourry-fedora-PF4VCD3F>
 <6749f386-4bd0-4395-9ad4-a9663fac9bc1@amd.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <6749f386-4bd0-4395-9ad4-a9663fac9bc1@amd.com>

On Fri, Feb 07, 2025 at 01:08:35PM -0600, Bowman, Terry wrote:
> 
> >> +
> >> +		if (dev_is_cxl_pci(dport_dev, PCI_EXP_TYPE_DOWNSTREAM) ||
> >> +		    dev_is_cxl_pci(dport_dev, PCI_EXP_TYPE_ROOT_PORT))
> > Mostly an observation - this kind of comparison seems to be coming up
> > more.  Wonder if an explicit set of APIs for these checks would be worth
> > it to clean up the 3 or 4 different comparison variants i've seen.
> >
> > Either way
> >
> > Reviewed-by: Gregory Price <gourry@gourry.net>
> >
> > ~Gregory
> Do you recommend moving dev_is_cxl_pci() to pci library as is? Thanks for 'Reviewed-by:`. Terry

I'd have to go look around and see how much the PCI_EXP_TYPE items are
being used for comparison and how - I was just commenting internally on
this patch set.  If this set is the only place it's being used (so far)
then it's probably not worth extra work yet.

~Gregory

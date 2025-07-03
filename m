Received: from mail-qv1-f46.google.com (mail-qv1-f46.google.com [209.85.219.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8F4172DE6EE
	for <linux-kernel@vger.kernel.org>; Thu,  3 Jul 2025 19:40:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751571628; cv=none; b=QDwCzN2AF3L1ph8jXBfeP7qshQo9S+fX4O5FT077HbGXZXMAdZjuXBBO9iOkGVeMq4RNmwlPPHhQv0tazejHcRBrI7wkbIjM8otchaxW+RD3OcaGR5bd7V0wzDfNTU0gzfc9tG6hKXGMCt+vEHmodu3QzSuykVlaJ/xXf8rpDWk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751571628; c=relaxed/simple;
	bh=wjAihhlgIFoKBph/30BdSuaRV45zLLu2FTAyTGC63U0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=iubTAWY3+jY3KG5lbrtcKbrRArNQEHlNhRrDBmEadY7vqG2e9HJO+DaoYm/0wpPsh88n1AxNEB5rQ0q0t2Rww63shYbqK60hidwAHi2SV2LLjl4q3yOU8XMS5/a+KNDB6NnmmodsBpDqzXOD+iu18LPwO3Tm1J/g4lhXaCE09Go=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gourry.net; spf=pass smtp.mailfrom=gourry.net; dkim=pass (2048-bit key) header.d=gourry.net header.i=@gourry.net header.b=tIwK+dhj; arc=none smtp.client-ip=209.85.219.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gourry.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gourry.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gourry.net header.i=@gourry.net header.b="tIwK+dhj"
Received: by mail-qv1-f46.google.com with SMTP id 6a1803df08f44-70109af5f70so2830176d6.0
        for <linux-kernel@vger.kernel.org>; Thu, 03 Jul 2025 12:40:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gourry.net; s=google; t=1751571624; x=1752176424; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=Z5JiRVjpCDIQ2FImaZDAlexoOFjZvW0CINutA6RTJCI=;
        b=tIwK+dhjNysjyhsEaEO+QTBWm9yc/pmUIcdB5wWstIq0vtM6QzFiINXLWi5BD2ZsjY
         PuYwFGL/Rg7b38rDWLx1dTyX4fiPz4OLv7lZ5pnTcKG+aLjnjhcwvtCnyi/51ES7/7KK
         KT6ol/9XNPXtm1Ue6nk1zb82RiQxknwW9eSYFEk0vHxTKTaMD1AEBYTtir+5kEyrieCm
         SRdo+gPGK5hNQzI5PPrsncNDUNoH9uIc3s/9vUhOYk1wku/dQ3i9yobIeiCwab8kvPIp
         TeGeHYt3uiG9MhSHFpl+QYEhP4Wb1TbvC8NahY5AAvwvos/oQPzam1kTrsvEzbQMPwLn
         oUpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751571624; x=1752176424;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Z5JiRVjpCDIQ2FImaZDAlexoOFjZvW0CINutA6RTJCI=;
        b=AepBnUnY8oOjz1fiN+b0lu24Cpjg/saHIwaC7eSJ2Sizwk9bFANFIAUZKtO94oC/00
         tW0rFYMAlXfX6eCGpf2O7AyBP1rDW/AtMisqBc15Vk/VsYOeXbwnremwAcsJr6LolX3J
         T+AhZAFqnjkniCVvBXzRhZhGdcLjEFenulwmzREDSAl0+crFaxvds4yGVUYGuMgEsspN
         ihQCATLuCBl7KZNFIXj1VJaQODnV1FJ0/+tUht9QAgJ0bxrNKaPtA1xrAvhF/LXFye2x
         yOFDtVZItVvZdCchQZGNEtcqlznvyXQCujo8Eq/LIGMMw7lxi1n1pz3E8bLcdVpTjArp
         iN5A==
X-Forwarded-Encrypted: i=1; AJvYcCXCEcgziwUL1JmzGV6MGWDiBcOVqds+c0is2NIYnvhTF2tgiox1BJ2OMe654P5lHDfysEzLJ6pYUowan0Y=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz4ckC8cVe3Tx59huUscDPX8Ge3k5YjrvGoHUxtPFrgVF7S/lr4
	UR/ToOXoQ9GCTnem1H4BRmCdnsQSAVoNMg0vtHTnnuCwo6ELwIbfIjG8C8oD5U165LQ=
X-Gm-Gg: ASbGncsqHBQdxCKAP3bwOzOx2Eg7crqgAIiQRszMriv5qAz/NcPSHzhHMBVms7oLpSl
	Du4dljGiBCrdmjyJV0bMFXEVfHAdw6BNynHtE7RcFmoZvGDsHVhXEaclASE2tNecxlDMFs39MEK
	7v4u1EhTD9bWQA5ze+mHLqO3Y3H8x2sak9a5DmYzH8tNL2Km1DL3MFkGsFXjVKiwHe12hSDm4wj
	RYrMVfVzwprrHJAJVZjOIo31SzyyVebhvEi6QH4s9lHCxdNnPfmM6DRIJdZgUyEp2yyMsjJ+EDm
	cR1J7BkoFAAOejyfL39MRYvQNA6ZL9H1/5+fXPoDylwf8h4PUSiQ0x3Mpadr0vy/n7o0Jzd5Nh/
	9ed7ROc5FQnHw0rZf7KWF7KptijIAgbdVny1wFU4klQ==
X-Google-Smtp-Source: AGHT+IHtokJzW6Y7SnAkO7fHIQj00qi7TbnLaOfijw/VLKAWWQHbBebWsqlSHWpM0Ffk/Tm8g67+Iw==
X-Received: by 2002:a05:6214:dcd:b0:6f5:3cae:920f with SMTP id 6a1803df08f44-702b1b376ffmr133762066d6.27.1751571624342;
        Thu, 03 Jul 2025 12:40:24 -0700 (PDT)
Received: from gourry-fedora-PF4VCD3F (pool-96-255-20-42.washdc.ftas.verizon.net. [96.255.20.42])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-702c4d5ad73sm2155396d6.92.2025.07.03.12.40.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Jul 2025 12:40:23 -0700 (PDT)
Date: Thu, 3 Jul 2025 15:40:21 -0400
From: Gregory Price <gourry@gourry.net>
To: Dave Jiang <dave.jiang@intel.com>
Cc: "Fabio M. De Francesco" <fabio.m.de.francesco@linux.intel.com>,
	linux-cxl@vger.kernel.org, Davidlohr Bueso <dave@stgolabs.net>,
	Jonathan Cameron <jonathan.cameron@huawei.com>,
	Alison Schofield <alison.schofield@intel.com>,
	Vishal Verma <vishal.l.verma@intel.com>,
	Ira Weiny <ira.weiny@intel.com>,
	Dan Williams <dan.j.williams@intel.com>,
	Jonathan Corbet <corbet@lwn.net>, linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3] cxl: docs/driver-api/conventions resolve conflicts
 btw CFMWS, LMH, ED
Message-ID: <aGbcpac1pma1od40@gourry-fedora-PF4VCD3F>
References: <20250623152923.1048525-1-fabio.m.de.francesco@linux.intel.com>
 <aFmo18OEZGMA2HU8@gourry-fedora-PF4VCD3F>
 <c32cede0-643c-47bb-bfde-93adbcf16155@intel.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <c32cede0-643c-47bb-bfde-93adbcf16155@intel.com>

On Tue, Jul 01, 2025 at 08:23:57AM -0700, Dave Jiang wrote:
> 
> 
> On 6/23/25 12:19 PM, Gregory Price wrote:
> > On Mon, Jun 23, 2025 at 05:29:02PM +0200, Fabio M. De Francesco wrote:
> >> Add documentation on how to resolve conflicts between CXL Fixed Memory
> >> Windows, Platform Memory Holes, and Endpoint Decoders.
> >>
> >> Signed-off-by: Fabio M. De Francesco <fabio.m.de.francesco@linux.intel.com>
> > 
> > I won't block a doc update on a suggestion so
> > 
> > Reviewed-by: Gregory Price <gourry@gourry.net>
> > 
> >> +Platform Firmware (BIOS) might reserve part of physical addresses below
> >> +4 GB (e.g., the Low Memory Hole that describes PCIe memory space for MMIO
> >> +or a requirement for the greater than 8 way interleave CXL regions starting
> >> +at address 0). In that case the Window Size value cannot be anymore
> >> +constrained to the NIW * 256 MB above-mentioned rule.
> > 
> > It might be nice to have a diagram that explains this visually, as it's
> > difficult for me to understand the implications through words alone...
> 
> +1 on request for diagram to explain. We should try to document this issue as clearly as possible. Thank you.
>

At the very least, it would be nice to have an explicitly example that
explains the expected cfmws/decoder configurations that are valid but
"technically" violate the spec

I *think* this basically boils down to "CFMWS size is not aligned, but
all the decoders it targets are"?  If I understand this correctly?

> > 
> > which is likely why the conflict exists in the first place :]
> > 
> > ~Gregory
> 

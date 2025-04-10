Received: from mail-ej1-f45.google.com (mail-ej1-f45.google.com [209.85.218.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB717284B55
	for <linux-kernel@vger.kernel.org>; Thu, 10 Apr 2025 12:38:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744288685; cv=none; b=egX+CalvNx/GQkVUP7wG6va+TgqU4qEIwD0Sz0Q25eXEV62M84EU/y0FvFwwjOcTnn0fxtpn+FAUVDTSH89b6EpIS/ebXCH8NybFaetlSkq5bl/m9+mkY8Xnb/lmTTUe4Su+aswQYABrijr01oD2G9Mt/HFZoVhJSetTl8sBIA0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744288685; c=relaxed/simple;
	bh=ViPqmjO4Qm2hXESZ1kqwnSFRolt09hZSIwCkaV+gQ4E=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=eP5pldiJwfLPphn0OnQprMct0LpVS3DVl/+UpOdbJUbu9fj9RPp6+99h30k3K8a6Ujc4o4RQw2W24P6o8cAsNDfogUzFFXI5vGWZ22AUPI3DhfHDyt7gNAdVounr2zCkBXq0OwY/5QqtGubnhidMmTXH2MDcwykOkslVjyTKxfM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=debian.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.218.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=debian.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f45.google.com with SMTP id a640c23a62f3a-ac34257295dso155174166b.2
        for <linux-kernel@vger.kernel.org>; Thu, 10 Apr 2025 05:38:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744288682; x=1744893482;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hVM/edPnJVLu0XxYodmGITQFDP/dxea4ObAi6/s5KJc=;
        b=R8B39mqtSP3G4LGRZaSTeWyRYCYwgewfJfP0T6tFJ0Bd+6OSFrltA5WyrWaQi15b2Q
         xYqg9LVPaJzqvdsNJxSRuY7iOouSbnqx0Vp/eRCNQgclHt2H0akbIdn7YxtIAcFXRats
         ZwSRs+LnFwTfhG+e56mSVURLCcog6bf9Cj8+M+56ZMF7h1GpdUo2TCee5iyW3ImkLElJ
         fsoZiC/QmLClMCcX1NNG00znJDtFE+RtZEamMGsf2QS4rIXaY7ydmEBZ1BNpXoX3l95G
         xmURF/qz785Dm9/OedMIO33QCclViMetggmZPBnkMCymdMC/0kdramGkxZoNMQtzzDbJ
         uMIw==
X-Forwarded-Encrypted: i=1; AJvYcCWICS2Y9xETsgzTbwd44Bw02srFc74azUi5I3rcmkG95Hb7B0U2YWOEt+Ay4F157M69nv3jS+TZgAp74gw=@vger.kernel.org
X-Gm-Message-State: AOJu0YyY/BDDjmajeoAdEHPfjSgHupe0xOieWNTDwUwU/qs9cAySDC53
	PctjxyRgXHGJjbo/POOttX29e4XirvpzdZOqcp3/j1LRwCIMtObo
X-Gm-Gg: ASbGnctZ5nQIeRlcvJgAEWyDReQXj5Xl4ZvlTV7VtXRgfJu6u3xPT2vzvPC4RaymtUQ
	xFSALA0smzsuqlpzuH9reGARrw+7CTDQ3PXiH9CaOdLl2TgBgckF2zgzDj2uivFB+0GUoRVbvEP
	3jKJCU1S1utaXsboLpFjkGHTttlEoAt2WUsi5wgUR7G2egW7MnClD1k5grkT5r+6iR7467z5vwc
	TGWCF6CkQw1mejibcYagfQHskoR1x6VSicJKC2R4vEfDVxIY7PTDhEvxSh36B15zzJHkN66/uqO
	WX0JYkNL8wN3Hoa2beSB9+dglHMny00=
X-Google-Smtp-Source: AGHT+IE25N5p2nQ1Rl7HEzVfGGlhO8/GpV7n3cX5pNLSZH+AISulMlFcsZ61MUdjg6ELS33tFDKg2A==
X-Received: by 2002:a17:907:1b0a:b0:ac7:150e:8013 with SMTP id a640c23a62f3a-acac008e442mr222901266b.15.1744288681789;
        Thu, 10 Apr 2025 05:38:01 -0700 (PDT)
Received: from gmail.com ([2a03:2880:30ff:1::])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-acaa1ce7301sm262811966b.167.2025.04.10.05.38.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Apr 2025 05:38:01 -0700 (PDT)
Date: Thu, 10 Apr 2025 05:37:59 -0700
From: Breno Leitao <leitao@debian.org>
To: Vladimir Oltean <vladimir.oltean@nxp.com>
Cc: kernel test robot <lkp@intel.com>, sean.anderson@seco.com,
	bigeasy@linutronix.de, horia.geanta@nxp.com,
	madalin.bucur@oss.nxp.com, hristophe.leroy@csgroup.eu,
	oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
	Jakub Kicinski <kuba@kernel.org>
Subject: Re: include/soc/fsl/qman.h:383:4: warning: field context_a within
 'struct qm_fqd' is less aligned than 'union (unnamed union at
 include/soc/fsl/qman.h:365:2)' and is usually due to 'struct qm_fqd' being
 packed, which can lead to unaligned accesses
Message-ID: <Z/e7p53g/e0wNYF+@gmail.com>
References: <202504091657.OgPuMa8C-lkp@intel.com>
 <Z/ZXbElRLBsJcc1X@gmail.com>
 <20250409120138.f5oingawrurwq7ep@skbuf>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250409120138.f5oingawrurwq7ep@skbuf>

On Wed, Apr 09, 2025 at 03:01:38PM +0300, Vladimir Oltean wrote:
> Hi Breno,
> 
> On Wed, Apr 09, 2025 at 04:18:04AM -0700, Breno Leitao wrote:
> > On Wed, Apr 09, 2025 at 04:55:16PM +0800, kernel test robot wrote:
> > > >> include/soc/fsl/qman.h:383:4: warning: field context_a within 'struct qm_fqd' is less aligned than 'union (unnamed union at include/soc/fsl/qman.h:365:2)' and is usually due to 'struct qm_fqd' being packed, which can lead to unaligned accesses [-Wunaligned-access]
> > >            } context_a;
> > 
> > <snip>
> > 
> > > c535e923bb97a4 Claudiu Manoil 2016-09-22  346  
> > > c535e923bb97a4 Claudiu Manoil 2016-09-22  347  struct qm_fqd {
> > > c535e923bb97a4 Claudiu Manoil 2016-09-22  348  	/* _res[6-7], orprws[3-5], oa[2], olws[0-1] */
> > > c535e923bb97a4 Claudiu Manoil 2016-09-22  349  	u8 orpc;
> > > c535e923bb97a4 Claudiu Manoil 2016-09-22  350  	u8 cgid;
> > > c535e923bb97a4 Claudiu Manoil 2016-09-22  351  	__be16 fq_ctrl;	/* See QM_FQCTRL_<...> */
> > > c535e923bb97a4 Claudiu Manoil 2016-09-22  352  	__be16 dest_wq;	/* channel[3-15], wq[0-2] */
> > > c535e923bb97a4 Claudiu Manoil 2016-09-22  353  	__be16 ics_cred; /* 15-bit */
> > > c535e923bb97a4 Claudiu Manoil 2016-09-22  354  	/*
> > > c535e923bb97a4 Claudiu Manoil 2016-09-22  355  	 * For "Initialize Frame Queue" commands, the write-enable mask
> > > c535e923bb97a4 Claudiu Manoil 2016-09-22  356  	 * determines whether 'td' or 'oac_init' is observed. For query
> > > c535e923bb97a4 Claudiu Manoil 2016-09-22  357  	 * commands, this field is always 'td', and 'oac_query' (below) reflects
> > > c535e923bb97a4 Claudiu Manoil 2016-09-22  358  	 * the Overhead ACcounting values.
> > > c535e923bb97a4 Claudiu Manoil 2016-09-22  359  	 */
> > > c535e923bb97a4 Claudiu Manoil 2016-09-22  360  	union {
> > > c535e923bb97a4 Claudiu Manoil 2016-09-22  361  		__be16 td; /* "Taildrop": _res[13-15], mant[5-12], exp[0-4] */
> > > c535e923bb97a4 Claudiu Manoil 2016-09-22  362  		struct qm_fqd_oac oac_init;
> > > c535e923bb97a4 Claudiu Manoil 2016-09-22  363  	};
> > > c535e923bb97a4 Claudiu Manoil 2016-09-22  364  	__be32 context_b;
> > > c535e923bb97a4 Claudiu Manoil 2016-09-22  365  	union {
> > > c535e923bb97a4 Claudiu Manoil 2016-09-22  366  		/* Treat it as 64-bit opaque */
> > > c535e923bb97a4 Claudiu Manoil 2016-09-22  367  		__be64 opaque;
> > > c535e923bb97a4 Claudiu Manoil 2016-09-22  368  		struct {
> > > c535e923bb97a4 Claudiu Manoil 2016-09-22  369  			__be32 hi;
> > > c535e923bb97a4 Claudiu Manoil 2016-09-22  370  			__be32 lo;
> > > c535e923bb97a4 Claudiu Manoil 2016-09-22  371  		};
> > > c535e923bb97a4 Claudiu Manoil 2016-09-22  372  		/* Treat it as s/w portal stashing config */
> > > c535e923bb97a4 Claudiu Manoil 2016-09-22  373  		/* see "FQD Context_A field used for [...]" */
> > > c535e923bb97a4 Claudiu Manoil 2016-09-22  374  		struct {
> > > c535e923bb97a4 Claudiu Manoil 2016-09-22  375  			struct qm_fqd_stashing stashing;
> > > c535e923bb97a4 Claudiu Manoil 2016-09-22  376  			/*
> > > c535e923bb97a4 Claudiu Manoil 2016-09-22  377  			 * 48-bit address of FQ context to
> > > c535e923bb97a4 Claudiu Manoil 2016-09-22  378  			 * stash, must be cacheline-aligned
> > > c535e923bb97a4 Claudiu Manoil 2016-09-22  379  			 */
> > 
> > Looking at pahole, I am not sure this is caacheline-aligned, as
> > suggested above.
> > 
> > 	# pahole -C qm_fqd
> > 	struct qm_fqd {
> > 		u8                         orpc;                 /*     0     1 */
> > 		u8                         cgid;                 /*     1     1 */
> > 		__be16                     fq_ctrl;              /*     2     2 */
> > 		__be16                     dest_wq;              /*     4     2 */
> > 		__be16                     ics_cred;             /*     6     2 */
> > 		union {
> > 			__be16             td;                   /*     8     2 */
> > 			struct qm_fqd_oac  oac_init;             /*     8     2 */
> > 		};                                               /*     8     2 */
> > 		__be32                     context_b;            /*    10     4 */
> > 		union {
> > 			__be64             opaque;               /*    14     8 */
> > 			struct {
> > 				__be32     hi;                   /*    14     4 */
> > 				__be32     lo;                   /*    18     4 */
> > 			};                                       /*    14     8 */
> > 			struct {
> > 				struct qm_fqd_stashing stashing; /*    14     2 */
> > 				__be16     context_hi;           /*    16     2 */
> > 				__be32     context_lo;           /*    18     4 */
> > 			};                                       /*    14     8 */
> > 		} context_a;                                     /*    14     8 */
> > 		struct qm_fqd_oac          oac_query;            /*    22     2 */
> > 
> > 		/* size: 24, cachelines: 1, members: 9 */
> > 		/* last cacheline: 24 bytes */
> > 	} __attribute__((__packed__));
> > 
> > 
> > > c535e923bb97a4 Claudiu Manoil 2016-09-22  380  			__be16 context_hi;
> > > c535e923bb97a4 Claudiu Manoil 2016-09-22  381  			__be32 context_lo;
> > > c535e923bb97a4 Claudiu Manoil 2016-09-22  382  		} __packed;
> > 
> > I am wondering if we should use __attribute__((aligned(8))) instead of
> > __packed, according to the document above.
> 
> Since you've replied, could you please help me also understand the issue?
> It says "field context_a within 'struct qm_fqd' is less aligned than
> 'union (unnamed union at include/soc/fsl/qman.h:365:2)'", but at line 365,
> the unnamed union _is_ field context_a, no? What is it saying?
> 
> I _suspect_, but I'm not sure, that it's complaining about context_a.opaque
> being a 64-bit field which is not aligned to a 64-bit boundary. Though
> I'm not getting that from reading the description.

In fact, the whole union is not aligned, and because "struct qm_fqd" is
also packed, it cannot add a padding before the union (which would be
the compiler decision,  since the union contains a packed field).

> But struct qm_fqd is embedded in other structures, and the alignment
> of the fields changes in that case. I think that context_a.opaque is
> 64-bit aligned in all cases.

I don't think it is ever aligned. Check the pahole above, and the union
starts at byte 14th, which is not aligned if my math is correct.

--breno

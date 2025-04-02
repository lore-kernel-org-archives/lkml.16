Received: from mail-qv1-f53.google.com (mail-qv1-f53.google.com [209.85.219.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4A7EE2376E1
	for <linux-kernel@vger.kernel.org>; Wed,  2 Apr 2025 14:18:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743603522; cv=none; b=DjH03cQslbHO6f06uYObtsQCgs3Kn2usF63a5EAwV0LUR/ZPCc47WWc+ps+XgTw3RF3gHKNuhNjahuB6l2hmG8hlsejW+0YuKX68sH+WqK/4KX1L8eF8TwRduDnP5NnpzFPxSzuPRnHR4PfBR3VV4LiM4CiZP+eKPTyFM0vdBiI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743603522; c=relaxed/simple;
	bh=SVse8nLg1k64iqJlreSoM8jE2NNKWRf+8WCh6pZMTAU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=nFTAbcNjpY8QIQ3giIMnJgXW4nrBLG+82OynTRxs6gK5yFEOBF9BPmqrDc6zpDR9K3zvHcVnE3ByR2h1+/r2/HxNzbOdIh27msWsWjlKwkeIaUGPUuBpIWq4yfB6FqfL9wWp8dBPc1bq57xhjoEnT5eY48oIteJb/MLIsOyzOHE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gourry.net; spf=pass smtp.mailfrom=gourry.net; dkim=pass (2048-bit key) header.d=gourry.net header.i=@gourry.net header.b=Guy1lzh7; arc=none smtp.client-ip=209.85.219.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gourry.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gourry.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gourry.net header.i=@gourry.net header.b="Guy1lzh7"
Received: by mail-qv1-f53.google.com with SMTP id 6a1803df08f44-6ecfc7ed0c1so57813196d6.3
        for <linux-kernel@vger.kernel.org>; Wed, 02 Apr 2025 07:18:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gourry.net; s=google; t=1743603520; x=1744208320; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=Ccje2Q6QXF1byar7KCxtZebQOr9wampoK+PfuNMS7dI=;
        b=Guy1lzh7sz6janTj62G6bz2CQA6FjhQToGLoqHfpKujawGhyOwhRGDTbjr/aiusbIg
         mQLuHXp/TadZ6LP0f4I+gg8c3t45MQNHfEm6IkNWJ/KgFRuZuxaZm6FEacQfSs7ok9SL
         i8KtAeSz0mwbsucgcN4KqBaBYcc4zlgvMxLJjMS80+xqBejHa6x4ppEV8G1jYg7sUNPU
         9CK6I4+vV52FwLnYDtqy8rIYO/wg/g84UVZwO/JMRbtstZJn6MVuZuEUfcI2xT2UffxT
         BlLtEyMF6srKZEi2ZFIAUpiV0eZXdc/jq/9K1Pf+nwo4AflSENZlqBPCu6gfTeXoCdvb
         KUZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743603520; x=1744208320;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Ccje2Q6QXF1byar7KCxtZebQOr9wampoK+PfuNMS7dI=;
        b=QhxAzZrhuDb3t5OygVH50GDzuWN67uFC526DEFjaU6jflgntf51R9A8+EISxELrmiv
         QH5i1CCCrt5pcnTf5s0Lx0/2XYW0iCzYQUgE3Yjo2Rz/30ZohLYlqvECzn5sXEKfeVZ7
         MEb5nbzRIvIfxWI5QGpVEdHaHRZXMk1sTCnaicsngd6svbIZm6/qTkLbpVawX/1AUqqJ
         GosBAuGz+arHV/AXrv+Zc8kZWYkTYiT8QG5/Fk8BvpTpfl13sqt7yHkLgJm5gPV9jpsA
         +4otEU3zKnyG50kElXhQxe5HLWP/AUM5KxAyIIe4be9QXvdTSt5adX1QtItHQ3CRoo+J
         c1zQ==
X-Forwarded-Encrypted: i=1; AJvYcCVtluLAzXpzbfiJxdFs+2/nWjbZCWvTD6+T2Itfw9YEEPm7YW0j1L+z3z2VRdFXcGfECNStwfn/zqRdWAk=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx2YaF6d5MkudtfLgK3XJu4twhx8nOKXbNQFt1CbD5p5f7aREtb
	mkVqxiKmjWn7HK40zH+GKw9TCtXhro7XMsrq8fK99PU+aGyTPMfBvSs0fAkC3vQ=
X-Gm-Gg: ASbGncs18Emnu3q8KIYtzeTdUsOXVxjHCCdsLxeWF164cvjbAdf+ezQV23i40O9smRK
	UmFmPaAnI6ebGyc7bTP0b7Q7JU/sXvW7NsS9UXrknworQ0x53ABtuTkb7LiBJta3S+FbHym0xWP
	ousBanNDMpEQdlfZKcil4YQ7pYM8UxT33aon/GYaTeyCMLCvyDqD9/M5nS/ohsZdknsDLBgLRxk
	3pKWInZPctQEA1d08mBzMnp7jjvV3NjYbwhcb5WW+ZkBCbjhrvkxnPZOVVQOE6pAe7CIuHN9tL3
	NrFgx1HKO7+cf5O9mJAm/1NcIqVvAc9+XDAGDNVLhPljeHQx6Hv9poxAZewLEVRyoT2lf7YcItF
	tORlUwhiHIb0Wn101fGNa2JyWKik=
X-Google-Smtp-Source: AGHT+IEc72cMstQuXqnedf70W46ont8VDgoRyCW+a/CSp5jMBokRXM6GrglR5RZE02gJalJhlKcaJg==
X-Received: by 2002:ad4:5f07:0:b0:6d8:a8e1:b57b with SMTP id 6a1803df08f44-6ef02d3a6c7mr53648286d6.36.1743603520198;
        Wed, 02 Apr 2025 07:18:40 -0700 (PDT)
Received: from gourry-fedora-PF4VCD3F (pool-173-79-56-208.washdc.fios.verizon.net. [173.79.56.208])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6eec9797b3asm74517846d6.100.2025.04.02.07.18.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Apr 2025 07:18:39 -0700 (PDT)
Date: Wed, 2 Apr 2025 10:18:38 -0400
From: Gregory Price <gourry@gourry.net>
To: "Zhijian Li (Fujitsu)" <lizhijian@fujitsu.com>
Cc: "lsf-pc@lists.linux-foundation.org" <lsf-pc@lists.linux-foundation.org>,
	"linux-mm@kvack.org" <linux-mm@kvack.org>,
	"linux-cxl@vger.kernel.org" <linux-cxl@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: Re: CXL Boot to Bash - Section 2a (Drivers): CXL Decoder Programming
Message-ID: <Z-1HPqufU7MnQ6ii@gourry-fedora-PF4VCD3F>
References: <Z226PG9t-Ih7fJDL@gourry-fedora-PF4VCD3F>
 <Z6OMcLt3SrsZjgvw@gourry-fedora-PF4VCD3F>
 <Z8o2HfVd0P_tMhV2@gourry-fedora-PF4VCD3F>
 <cf7b97d8-4393-424c-89fc-aa810d907a67@fujitsu.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cf7b97d8-4393-424c-89fc-aa810d907a67@fujitsu.com>

On Wed, Apr 02, 2025 at 06:45:33AM +0000, Zhijian Li (Fujitsu) wrote:
> Hi Gregory,
> 
> 
> On 07/03/2025 07:56, Gregory Price wrote:
> > What if instead, we had two 256MB endpoints on the same host bridge?
> > 
> > ```
> > CEDT
> >             Subtable Type : 01 [CXL Fixed Memory Window Structure]
> >                  Reserved : 00
> >                    Length : 002C
> >                  Reserved : 00000000
> >       Window base address : 0000000100000000   <- Memory Region
> >               Window size : 0000000020000000   <- 512MB
> > Interleave Members (2^n) : 00                 <- Not interleaved
> > 
> > Memory Map:
> >    [mem 0x0000000100000000-0x0000000120000000] usable  <- SPA
> > 
> > Decoders
> >                              decoder0.0
> >                    range=[0x100000000, 0x120000000]
> >                                  |
> >                              decoder1.0
> >                    range=[0x100000000, 0x120000000]
> >                    /                              \
> >              decoded2.0                        decoder3.0
> >    range=[0x100000000, 0x110000000]   range=[0x110000000, 0x120000000]
> > ```
> 
> It reminds me that during construct_region(), it requires decoder range in the
> switch/host-bridge is exact same with the endpoint decoder. see
> match_switch_decoder_by_range()
> 
> If so, does following decoders make sense?
> 
> 
>   Decoders
>                                decoder0.0
>                      range=[0x100000000, 0x120000000]
>                                    |
>                       +------------+-----------+
>                      /                          \
>                     |      Host-bridge contains  |
>               decoder1.0     2 decoders       decoder1.1
>       range=[0x100000000, 0x110000000]     range=[0x110000000, 0x120000000]
>                      /                              \
>                decoded2.0                        decoder3.0
>      range=[0x100000000, 0x110000000]   range=[0x110000000, 0x120000000]
>

You are correct, i'll update this.

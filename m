Received: from mail-qv1-f46.google.com (mail-qv1-f46.google.com [209.85.219.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 58283226CF1
	for <linux-kernel@vger.kernel.org>; Tue, 24 Jun 2025 18:32:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750789923; cv=none; b=Wy8mS/4p1RBDSKAwX6ow1mFNm5wlRH99GhVYRTHUw7TxKA2OfDelT8XHgXnl8sxKqGdqVOte2xleRoS2TFOdfoIjbmUAABtqBofEeTsW1MinRknhOh4L53fL80WACI90sEyTtyUK5ereH6i7HiKKgt8uwyxUaPS7ft0iFEoaDnA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750789923; c=relaxed/simple;
	bh=twg7uShwjKAF0d/1Baw6xRpptUpYWnudk9Sex3ub+Tk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=WnPImiWpWutyelnIyuGVb3jSMgr8hyQNgom9UI4EeChoM8r7nYDltrm4kyobpR+iVdBTskSLxeoozX7k9bHItRqsQax+yCLZ++UL7CKQ8nLRMw+3eiZgdtwaOPn7bwNTVghGxvd2o3bN57JFrvYApI2PGAIzTF+lUmoTVUdjiGI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ziepe.ca; spf=pass smtp.mailfrom=ziepe.ca; dkim=pass (2048-bit key) header.d=ziepe.ca header.i=@ziepe.ca header.b=W9iskX5n; arc=none smtp.client-ip=209.85.219.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ziepe.ca
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ziepe.ca
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ziepe.ca header.i=@ziepe.ca header.b="W9iskX5n"
Received: by mail-qv1-f46.google.com with SMTP id 6a1803df08f44-6fadd3ad18eso7885006d6.2
        for <linux-kernel@vger.kernel.org>; Tue, 24 Jun 2025 11:32:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google; t=1750789920; x=1751394720; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=97KaKUWHgkryLWUXFqPgiNV17vft1ADESM26qVDqmoE=;
        b=W9iskX5nWsFP9iKiJA/Om31WenSekkHe034ZgVbhl0JaS4kyJDkT0Uyx4m8nUMHebC
         SPflzKzZIijbd86GJVQ5EmEJSRUo2ydJLWJ/pxALxiwm4Q/lg7gvnm3Dg7kAdZBYXRFu
         8+N1ui03mtwpRKfO3CL2bDpO8P3rPgP7siQlMQbjAF1jM4s3KI8fMT5g3AyP+hzl2JH/
         putFrkkMCTjQswSVfl3ALZucjQSdGjTeCHfh4VHY8xxMoa2y3bTEF/nfT7GENI0CXNb5
         A8kmtWtVOI9SHE4oXBtycNTSUj6NA0Z4T6ZlOTWTmNMYIOFRKbGBu2dLxdUCz5DE8YMZ
         KxtQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750789920; x=1751394720;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=97KaKUWHgkryLWUXFqPgiNV17vft1ADESM26qVDqmoE=;
        b=GT4qNGhNY8tBkk05aZM2sgQBIUiSD/Tp6N1yhkDsuTtoRDqCkdPtEdmc9LrSHmLYwZ
         0KzSa+NxsOH/G2ynwzZWpyy5rDDb7K+gwJNY89yT2O7K7CrQHuzSaBLEb90yDFd/R0IE
         POJbq+mTg2T5vGzTa10MryZmpYz+lkl/RagUKqjFQyv65ossXtq4+HHvyU/HPjVmUMDD
         rOCCcg3LMnnmqRoz9qzfBNJZdx6PcQY2/g18QwWxUF4de7ztMcrFSKyxwuS+sQUpBrAw
         4K44WKVjXqdyXL5Q7z2cV0in7chqQ2FHTANuVvKy1jNoWIWlaWMsp3U+La/WDckYczl7
         bBPw==
X-Forwarded-Encrypted: i=1; AJvYcCWT7LlMc7r07Tc2mQgRcZozvcp04jIQubmWKGxGq7b+eE7I4SSab1FjNSu+AwphykNtKjT84vXD7Rfmz9I=@vger.kernel.org
X-Gm-Message-State: AOJu0YzQnlhxEVAPRHj9G7neaSQh3aQ+Vr3bwjDpRk5FT4Zt7rb+lqOe
	brqeEdA5dH+dnut8aLr40I2nkg4IjW2A7SmYlnAyBS7Sps397Ws1aIeSYuVsxigPwA4=
X-Gm-Gg: ASbGncsPWfSV0CGO+x1Hh50GkZ8piPpK3TaK0B7OeKiJQx47dh51PGDu8mhEL7FMuk6
	MowGQuNNWWK01xU1Q91eROGdrF522djZbsFCmXwMlTT4mmwV1nkcoAjwkBKUtljtEaBW7tVwz2H
	mjK125KLzVGOXzRzSf4OmCMweWR+P26htKAHTXL2B9oN0bK726nINHkU8ZDLOaEdFhUiQL5wz3l
	LmpVbeyOupgAQH8n0O7FPhe+AvE84FqgXXbCLmawDj1TrgrXITBMZywBnaZFMnQKt15VnfPyO9k
	3vAxKD/pBa2f5HV7u/Bup5/8cDzR/NFC+Tas2nWlxptBj0e71KLeIo+2W5oReC5vy+p2gzxERgV
	nxQiIBvUWKzFWORDJ16KK4LY9wHB+CealeRd13A==
X-Google-Smtp-Source: AGHT+IG+85yGm34BWTRlYBBLW0w/BlKssPbCsgVI4ZKC/N2owtfICs7gpUhfLe5Godb1E2tNf0/CAQ==
X-Received: by 2002:a05:6214:1bcd:b0:6fa:bb44:fddf with SMTP id 6a1803df08f44-6fd0a473d36mr275064036d6.16.1750789919997;
        Tue, 24 Jun 2025 11:31:59 -0700 (PDT)
Received: from ziepe.ca (hlfxns017vw-142-167-56-70.dhcp-dynamic.fibreop.ns.bellaliant.net. [142.167.56.70])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6fd09577929sm59926056d6.86.2025.06.24.11.31.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Jun 2025 11:31:59 -0700 (PDT)
Received: from jgg by wakko with local (Exim 4.97)
	(envelope-from <jgg@ziepe.ca>)
	id 1uU8R4-00000000hJ0-3C5H;
	Tue, 24 Jun 2025 15:31:58 -0300
Date: Tue, 24 Jun 2025 15:31:58 -0300
From: Jason Gunthorpe <jgg@ziepe.ca>
To: Pratyush Yadav <pratyush@kernel.org>
Cc: Pasha Tatashin <pasha.tatashin@soleen.com>,
	Mike Rapoport <rppt@kernel.org>, jasonmiu@google.com,
	graf@amazon.com, changyuanl@google.com, dmatlack@google.com,
	rientjes@google.com, corbet@lwn.net, rdunlap@infradead.org,
	ilpo.jarvinen@linux.intel.com, kanie@linux.alibaba.com,
	ojeda@kernel.org, aliceryhl@google.com, masahiroy@kernel.org,
	akpm@linux-foundation.org, tj@kernel.org, yoann.congal@smile.fr,
	mmaurer@google.com, roman.gushchin@linux.dev, chenridong@huawei.com,
	axboe@kernel.dk, mark.rutland@arm.com, jannh@google.com,
	vincent.guittot@linaro.org, hannes@cmpxchg.org,
	dan.j.williams@intel.com, david@redhat.com,
	joel.granados@kernel.org, rostedt@goodmis.org,
	anna.schumaker@oracle.com, song@kernel.org, zhangguopeng@kylinos.cn,
	linux@weissschuh.net, linux-kernel@vger.kernel.org,
	linux-doc@vger.kernel.org, linux-mm@kvack.org,
	gregkh@linuxfoundation.org, tglx@linutronix.de, mingo@redhat.com,
	bp@alien8.de, dave.hansen@linux.intel.com, x86@kernel.org,
	hpa@zytor.com, rafael@kernel.org, dakr@kernel.org,
	bartosz.golaszewski@linaro.org, cw00.choi@samsung.com,
	myungjoo.ham@samsung.com, yesanishhere@gmail.com,
	Jonathan.Cameron@huawei.com, quic_zijuhu@quicinc.com,
	aleksander.lobakin@intel.com, ira.weiny@intel.com,
	andriy.shevchenko@linux.intel.com, leon@kernel.org, lukas@wunner.de,
	bhelgaas@google.com, wagi@kernel.org, djeffery@redhat.com,
	stuart.w.hayes@gmail.com
Subject: Re: [RFC v2 05/16] luo: luo_core: integrate with KHO
Message-ID: <20250624183158.GF72557@ziepe.ca>
References: <mafs05xgtw5wn.fsf@kernel.org>
 <CA+CK2bDWAPSmTdnD7vw4G00nPsM8R_Zefs_G+9zvSqTJqPb9Lg@mail.gmail.com>
 <aFLr7RDKraQk8Gvt@kernel.org>
 <CA+CK2bAnCRu+k=Q78eA4kcAebxA9NgOorhwRqu-WxC913YBsBw@mail.gmail.com>
 <CA+CK2bB3P1vX658ErkP4_-L6WZSOCcenEwUdX1qS=poDjs=i+A@mail.gmail.com>
 <aFP7wwCviqxujKDg@kernel.org>
 <CA+CK2bDqO4SkUpiFahfUx2MUiE8oae9HmuaghPAnCwaJZpoTwQ@mail.gmail.com>
 <mafs0ikkqv3ds.fsf@kernel.org>
 <CA+CK2bCA_ggpvbY+MQPaAHsN7MOzV7D3=MYvfAP4cFwhThJpPw@mail.gmail.com>
 <mafs0frfpt8yp.fsf@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <mafs0frfpt8yp.fsf@kernel.org>

On Tue, Jun 24, 2025 at 06:12:14PM +0200, Pratyush Yadav wrote:
> On Fri, Jun 20 2025, Pasha Tatashin wrote:
> 
> > On Fri, Jun 20, 2025 at 11:28 AM Pratyush Yadav <pratyush@kernel.org> wrote:
> >> On Thu, Jun 19 2025, Pasha Tatashin wrote:
> [...]
> >> Outside of hypervisor live update, I have a very clear use case in mind:
> >> userspace memory handover (on guest side). Say a guest running an
> >> in-memory cache like memcached with many gigabytes of cache wants to
> >> reboot. It can just shove the cache into a memfd, give it to LUO, and
> >> restore it after reboot. Some services that suffer from long reboots are
> >> looking into using this to reduce downtime. Since it pretty much
> >> overlaps with the hypervisor work for now, I haven't been talking about
> >> it as much.
> >>
> >> Would you also call this use case "live update"? Does it also fit with
> >> your vision of where LUO should go?
> >
> > Yes, absolutely. The use case you described (preserving a memcached
> > instance via memfd) is a perfect fit for LUO's vision.
> >
> > While the primary use case driving this work is supporting the
> > preservation of virtual machines on a hypervisor, the framework itself
> > is not restricted to that scenario. We define "live update" as the
> > process of updating the kernel from one version to another while
> > preserving FD-based resources and keeping selected devices
> > operational. The machine itself can be running storage, database,
> > networking, containers, or anything else.
> >
> > A good parallel is Kernel Live Patching: we don't distinguish what
> > workload is running on a machine when applying a security patch; we
> > simply patch the running kernel. In the same way, Live Update is
> > designed to be workload-agnostic. Whether the system is running an
> > in-memory database, containers, or VMs, its primary goal is to enable
> > a full kernel update while preserving the userspace-requested state.
> 
> Okay, then we are on the same page and I can live with whatever name we
> go with :-)
> 
> BTW, I think it would be useful to make this clarification on the LUO
> docs as well so the intended use case/audience of the API is clear.
> Currently the doc string in luo_core.c only talks about hypervisors and
> VMs.

Just to be clear though - you used the word "reboot" and here we are
really only talking about kexec. kexec is not really a reboot, but it
is sort of close.

LUO is a way to pass lots of different things across a kexec, and if
you are happy to use kexec then you should be able to use it.

Jason

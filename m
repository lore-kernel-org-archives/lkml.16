Received: from mail-qv1-f50.google.com (mail-qv1-f50.google.com [209.85.219.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9DD42207A28
	for <linux-kernel@vger.kernel.org>; Tue,  1 Apr 2025 21:40:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743543655; cv=none; b=UUeagMV2sshw+ua64agKjc04M4RoDDPasVjSee3W5UqQPknYmYz2xZh105vwLywJX928aEP47qggaNqScnb9AoyqYxljeJhmBaBkeWRJjl9gCV87VjXAzQWsiteTBMwUUZ7UwxvBGr0EMqY8NvvXdK+YClGA2XwJRhY/0Q9a7eg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743543655; c=relaxed/simple;
	bh=xYzMwhcYtnhtvN8SaaCyiSa6IxxohqMDLB2iDnJ6fMg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=HRkZgsGzwRDfOMZhjy86gojJS0ZM0ZyXLCsLFvZp2R5fPQ3HJIB93U3ToET++iHdYqCWw4nLQ5EeMAZiUbiPD87xFKy/OJCumsSH5bM2vsIUfLfFB8zbNvs5yj8ipNZXLFBm1/WnbmikWj5VNr1r7onO7U9QtAXXGVTvjwd69Nw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gourry.net; spf=pass smtp.mailfrom=gourry.net; dkim=pass (2048-bit key) header.d=gourry.net header.i=@gourry.net header.b=SFyvnZsC; arc=none smtp.client-ip=209.85.219.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gourry.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gourry.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gourry.net header.i=@gourry.net header.b="SFyvnZsC"
Received: by mail-qv1-f50.google.com with SMTP id 6a1803df08f44-6ed16ce246bso30172796d6.3
        for <linux-kernel@vger.kernel.org>; Tue, 01 Apr 2025 14:40:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gourry.net; s=google; t=1743543652; x=1744148452; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=PuxPlzCWg1XtqjtZcXuLr8jO4Fm1vsCDnGFdTpMNAlQ=;
        b=SFyvnZsCcc02bMdH7z3FGET23PKj8H1Wykb+AjmcMf99sjBp2fmyDfhkd1MlL+xHnW
         QB5KcJlDS5X+ty9R3vLiNop7uyemod4xxl5suy6pDv3PcWp6qnt+QZXa2/5k4QlD+BHF
         vHh5S4G99/SipsIBB8W57tBbbMWa0wQ3SgxGaKYsEurBUJTJtxy3fGIs4R75xI+ofWmN
         IaeCPwimC0yFOGsz5xypvqDihVLFcoNInU7owIHwZfjf0KU7xRlE/Dky8nwyAJQpuqKK
         nmRXO6QkxqV8AyM/1kDmhmyc1659xJoy4+lHVwXEOiCsm2Co5hkSof1/ZQ3+UfvSqk4G
         73rQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743543652; x=1744148452;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PuxPlzCWg1XtqjtZcXuLr8jO4Fm1vsCDnGFdTpMNAlQ=;
        b=wGbNfjC21PSquHRll6lmbgNe5kKaGp2VcUPcVAyJSjIHoml6AjwaZp+5ZXRNVYBCzF
         zaS2bfX/C8HQ4R3oQJY5y69WrI8fSLgPzmVDlNmoUchEjqSo1iijSA+AC8BEapwhhHUc
         AZl+jjOm4p6qmLpCg+4E6uqG9Wc45s8+lGdUSACjF9OvGRm710SDMr2dPYj+r+JVLKeO
         6jlFM7do28b5C+sDPdoL45jtXcwqWLBt0I1iOO2R5m90ZgLK8Rq4mKrPek4u3JdH6FHN
         Z3TdseOwzxoVmxU/JYbEeXHDyCJJCEcoZGRnj56L9LO3J0Rn6Z1OEx+UYghoAuosNVLb
         xixQ==
X-Forwarded-Encrypted: i=1; AJvYcCVKhoL+4jpenbxnPL4Oewqjy6FfotxD+OUB+Bf8LdYkeClSN5F/3XhTz0O1g3mXUIwjP8JiN5GIt7vSsHU=@vger.kernel.org
X-Gm-Message-State: AOJu0YxDK3mTo09e8KbVGhJzIrV7mFQFMbGLxPZ4dQnBQRRAuBj7It/Q
	K+mxq4dfLlvM4lZb3OGgX2boiIe8xXSdEmssgGwHZceE6UR37YmiDlOtaKBcBMo=
X-Gm-Gg: ASbGncuNLUPIcGcTTb4TDnTXLoWisbsu3bYTbyws1gipKGSQp8V4w//dkgQNnkXQtbm
	Zfh8WtAQqxeckYdhlzZ7hh1gC3/Ni7E+7RSBfRRhTCI7J3k17pmSnwkswRwvb5m33TKqEbZbczS
	C4F8L05E9N1R1aMbPaiRvMtkoTBIqU5KistOlnrlkAOwWWoTYMEQ/E9AI5ZsUSbgatRp4jewmQ+
	me/WJlIGbh2FQ6NJREg3IFpuUrZ1CCk0vru4dIQaonQd65fZ6pTIBh/w8H51aV7jGfulhFTRpFe
	6jBtDHVLCFhdIEdnRyjpl31LUjz/Iq774fxF2mz50EB3Pxl9IkP6LcGh5Cu7GcvwUdfYpew3TI/
	y4cUPAZSuzTOLznIHKVHnCkN90E0=
X-Google-Smtp-Source: AGHT+IFpzLyTO0moMy+JQ9RKfNFuL6DHIrGkQnqp1sZ6FtwI4zZggYUxfCbJ8I0wE71OxVWymUzeLA==
X-Received: by 2002:a05:6214:2022:b0:6e8:9e9c:d212 with SMTP id 6a1803df08f44-6eed5e02670mr224490066d6.0.1743543652417;
        Tue, 01 Apr 2025 14:40:52 -0700 (PDT)
Received: from gourry-fedora-PF4VCD3F (pool-173-79-56-208.washdc.fios.verizon.net. [173.79.56.208])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6eec97bde6asm66492896d6.125.2025.04.01.14.40.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Apr 2025 14:40:52 -0700 (PDT)
Date: Tue, 1 Apr 2025 17:40:50 -0400
From: Gregory Price <gourry@gourry.net>
To: Dan Williams <dan.j.williams@intel.com>
Cc: "Fabio M. De Francesco" <fabio.m.de.francesco@linux.intel.com>,
	Davidlohr Bueso <dave@stgolabs.net>,
	Jonathan Cameron <jonathan.cameron@huawei.com>,
	Dave Jiang <dave.jiang@intel.com>,
	Alison Schofield <alison.schofield@intel.com>,
	Vishal Verma <vishal.l.verma@intel.com>,
	Ira Weiny <ira.weiny@intel.com>, Robert Richter <rrichter@amd.com>,
	ming.li@zohomail.com, linux-kernel@vger.kernel.org,
	linux-cxl@vger.kernel.org
Subject: Re: [PATCH 2/4 v2] cxl/core: Add helpers to detect Low memory Holes
 on x86
Message-ID: <Z-xdYvxD6yz3fMiE@gourry-fedora-PF4VCD3F>
References: <20250114203432.31861-1-fabio.m.de.francesco@linux.intel.com>
 <20250114203432.31861-3-fabio.m.de.francesco@linux.intel.com>
 <Z4ccKD9Fc-Egc6EL@gourry-fedora-PF4VCD3F>
 <67ec4d61c3fd6_288d2947b@dwillia2-xfh.jf.intel.com.notmuch>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <67ec4d61c3fd6_288d2947b@dwillia2-xfh.jf.intel.com.notmuch>

On Tue, Apr 01, 2025 at 01:32:33PM -0700, Dan Williams wrote:
> Gregory Price wrote:
> > Is there a reason not to handle more than just LMH's in this set?
> 
> This discussion was referenced recently on an IM and I wanted to share
> my response to it:
> 
> The rules for when to apply this memory hole quirk are explicit and
> suitable to add to the CXL specification. I want the same standard for
> any other quirk and ideally some proof-of-work to get that quirk
> recognized by the specification. Otherwise, I worry that generalizing
> for all the possible ways that platform BIOS tries to be clever means we
> end up with something that has no rules.
>
> The spec is there to allow software to delineate valid configurations vs
> mistakes, and this slow drip of "Linux does not understand this platform
> configuration" is a spec gap.

Note: I've since come around to understand the whole ecosystem a bit
      better since i wrote this response. I don't know that it's needed.


Some of the explanation of this patch series is a bit confusing. It
justifies itself by saying CFMWS don't intersect memory holes and that
endpoint decoders have to be 256MB aligned.

/*
 * Match CXL Root and Endpoint Decoders by comparing SPA and HPA ranges.
 *
 * On x86, CFMWS ranges never intersect memory holes while endpoint decoders
 * HPA range sizes are always guaranteed aligned to NIW * 256MB; therefore,
 * the given endpoint decoder HPA range size is always expected aligned and
 * also larger than that of the matching root decoder. If there are LMH's,
 * the root decoder range end is always less than SZ_4G.
 */

But per the spec, CFMWS is also aligned to be aligned to 256MB.

Shouldn't the platform work around memory holes to generate multiple
CFMWS for the entire capacity, and then use multiple endpoint decoders
(1 per CFMWS) to map the capacity accordingly?

(Also, I still don't understand the oracle value of <4GB address range.
 It seems like if this is some quirk of SPA vs HPA alignment, then it
 can hold for *all* ocurrances, not just stuff below 4GB)

~Gregory

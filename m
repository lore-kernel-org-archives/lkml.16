Received: from mail-qv1-f51.google.com (mail-qv1-f51.google.com [209.85.219.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B124B22A7F0
	for <linux-kernel@vger.kernel.org>; Tue,  8 Apr 2025 15:50:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744127435; cv=none; b=aqqAHIhNPyrIQkg7Iz2xYxfXsvg3qdxytqNQwQ7wIa2QagYNn9lg8rIwWQWxkN660eIw2e6NLxypqrqCz23Nwc/yV6eK1u9pgTUzx5EWwY2KcKYGx3ycy4ukFc660VINrr6aDq9HY8chziR+780TjpewPGn+Pp6YV5f8O1DFEVY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744127435; c=relaxed/simple;
	bh=2Km7NO1z0i+UzfqrusksoUfmO41Y6EOMznVE4fLGK4Q=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=pgEXttclN9x87XEPqLA1DU5zgvNfaBd9Iv4Q/f/k6qkgmhH4ArBCXRwghRG0SKwuNwS/bF34Af9cEDSIcVW0+0nUSgHq+p5ngBSv1HaAWEPi1EnMl49WSfAU/ZQF6TBP528mhif5Ibi27vtvjo8dF219HDKkZt8RKnLyp5YDCNI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gourry.net; spf=pass smtp.mailfrom=gourry.net; dkim=pass (2048-bit key) header.d=gourry.net header.i=@gourry.net header.b=oZZbk6qN; arc=none smtp.client-ip=209.85.219.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gourry.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gourry.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gourry.net header.i=@gourry.net header.b="oZZbk6qN"
Received: by mail-qv1-f51.google.com with SMTP id 6a1803df08f44-6ecfbf8fa76so67403286d6.0
        for <linux-kernel@vger.kernel.org>; Tue, 08 Apr 2025 08:50:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gourry.net; s=google; t=1744127432; x=1744732232; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=qU1SHlplVkElW3I3mNfWTE7OMoO1FbxBpAaPPp1gBwM=;
        b=oZZbk6qNPfUP7Pg2ZrrdUqawcKn+uysEiIGLKO6gl+AdNZ7OhQjwrklWYkzts/niL8
         OJaG+ngHnLcM1oCwqipAFjT9XKBNoj7H8idyiH5U8M2lSUMtQttWb+OIfyKuuC9DhUJZ
         8AJ8OEarx5kDhax5TsuLpt7VKlo8po0piwLZq9KIOHruVd40R5//JSuoyQmkTb4BpMKB
         Grne9g1OjoTNozQv1CWB7af43qKIDZNIfSz5Qb99ghC1gb6NUETLSAn5IG8f94m5mqFD
         wI+eukyynaT3HDyUOetMGo6KNPA2oNtiHkr8EebmOzVaQs1dzB733Na86IFnGuCj3wB6
         VUJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744127432; x=1744732232;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qU1SHlplVkElW3I3mNfWTE7OMoO1FbxBpAaPPp1gBwM=;
        b=KC34Yq0aOUOZRdaWiw77mSK3E+K9s/nECw/2glBWkgrC+QWScyF7UYADRGdxKgOsWN
         lO89hH1owrD/B4pMxJfmk3m6JfqaBt8NIqS5eH0c6EFL9gHY9N/kpS2Nlb8WC+sqgztR
         7wv23f54LDKafk7j9Sb9hBHE44Uxp7n+ACICkbP5qT1GbRnee6dal+J4NObdAkTNXD0G
         wU86DK/EsU+crVOYqNM8PUINdDv/7oXgSl8CuUlmalFVjiQ4UXzK2Af5SuDEIMjsnNeO
         lKC58ykWUPYYfrDw79rL7rsDkk32CqF9UlnjjIIFYaj3opwssxE1lwJvRhQhA4u+TPYY
         sV9Q==
X-Forwarded-Encrypted: i=1; AJvYcCV7/4CVz1RZVyFmuEWJR9d+KFiIjL300feN25DU5+Di1sKu0aZislIpnfiGVqyok/1L4n5xVRIWVPpFNxg=@vger.kernel.org
X-Gm-Message-State: AOJu0YyH61dX86wP/P8Gn7laYB3EtVjqT+bb9BDVJ48gayxJaIm8x6xa
	NbhlA/6qJznwaGKw+y2iCtfv05aeFgBVtY3/opjeT8LKWvS1fT66ZLtHSRZRoVk=
X-Gm-Gg: ASbGncsWbInTvmmT6WTV2Q4Cp9I1vK3DU6A3Gl4SgK7MNlLSnTZDbiItOJyVUFnRsr3
	F1fF6GV8Lb7M75ekvzyEhqr2oP83jKpbSgyYqVfn7zSaPM1hZxKjuZHEjOnzakxM1+1f+l/jx4e
	GA576UeVLrir5HmV+m6nbUoq8eoTbLUPmP1kkNnr0HKHhzP9Xaw3EQMySpPVUp46NNcYOMJhL4s
	ZQVMsui6pizoRubKHjuXPZcxV7BL7UFzRQlRXsamA/lZ/2HKRVHIpo0biqDwnhJPbwnMte7gzBj
	kerzuL8sLa06OiXIdnNQn3d9aYmoApDC9b6UqiBfaNcrJSjyDWUq7/9ZBQj55fRvTTjePtBiXMi
	anddt5U0P4NjgRDob7eIQVfLME3xOi3AUckn8EQ==
X-Google-Smtp-Source: AGHT+IGskZXHYCovfrGHJeIACu7+JHRYe3pFg0wj44SOWFQkPILgKan7VkELyjK4NpSv9AnZi6Ydhg==
X-Received: by 2002:a05:6214:5189:b0:6e8:fb92:dffa with SMTP id 6a1803df08f44-6f012e1adf0mr288494966d6.25.1744127432472;
        Tue, 08 Apr 2025 08:50:32 -0700 (PDT)
Received: from gourry-fedora-PF4VCD3F (pool-173-79-56-208.washdc.fios.verizon.net. [173.79.56.208])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6ef0f010c7esm75759036d6.44.2025.04.08.08.50.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Apr 2025 08:50:32 -0700 (PDT)
Date: Tue, 8 Apr 2025 11:50:30 -0400
From: Gregory Price <gourry@gourry.net>
To: Robert Richter <rrichter@amd.com>
Cc: Alison Schofield <alison.schofield@intel.com>,
	Vishal Verma <vishal.l.verma@intel.com>,
	Ira Weiny <ira.weiny@intel.com>,
	Dan Williams <dan.j.williams@intel.com>,
	Jonathan Cameron <Jonathan.Cameron@huawei.com>,
	Dave Jiang <dave.jiang@intel.com>,
	Davidlohr Bueso <dave@stgolabs.net>, linux-cxl@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	"Fabio M. De Francesco" <fabio.m.de.francesco@linux.intel.com>,
	Terry Bowman <terry.bowman@amd.com>
Subject: Re: [PATCH v2 09/15] cxl/region: Use the endpoint's SPA range to
 create a region
Message-ID: <Z_VFxllNp4pxnOuu@gourry-fedora-PF4VCD3F>
References: <20250218132356.1809075-1-rrichter@amd.com>
 <20250218132356.1809075-10-rrichter@amd.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250218132356.1809075-10-rrichter@amd.com>

On Tue, Feb 18, 2025 at 02:23:50PM +0100, Robert Richter wrote:
> To create a region, SPA ranges must be used. With address translation
> the endpoint's HPA range is not the same as the SPA range. Use the
> previously calculated SPA range instead.
>

Same with patch 8, I think this probably should just be rolled in with
patch 5.  You can simplify the notes in patch 5 by saying:

"""
 since cxled->spa_range is set to cxled->cxld.hpa_range at endpoint
 initialization, this patch is effectively a no-op for all systems
 that do not provide a translation callback.

 Change all refs to cxled->cxld.hpa_range to cxled->spa_range.
"""

This should also help simplify the patch series overall.

I haven't gone through to check if there are any other missed hpa_range
references yet (e.g. [1])

[1] https://lore.kernel.org/linux-cxl/20250218132356.1809075-1-rrichter@amd.com/T/#m26a8e4d8b1783dfb837553f184f7f174b61b7825

~Gregory

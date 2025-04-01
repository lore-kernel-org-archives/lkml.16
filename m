Received: from mail-qv1-f43.google.com (mail-qv1-f43.google.com [209.85.219.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ADC771A7253
	for <linux-kernel@vger.kernel.org>; Tue,  1 Apr 2025 05:26:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743485188; cv=none; b=sviPpdl8HsbW+vEcYavq2cNScO0/4Ryj2W8eqF5dOlsSXxaGKF4bnyRvCFpluXZAPm7XDVZV2i/B8Tn5wu9fh3fXyYJb8ZIpxxbxmAnn7lYxUcsLlSOeId6ofQvfBna/hleMyWdPtWresZJw5TBNxAYJBmFn9qfGAqPMfXF1SpQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743485188; c=relaxed/simple;
	bh=v1zl01o+pg0nV6AdRbp0f/EWVnmh/e0rB3H0HnZ24sM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=MXiYgKitYI4eBaq2k1yzx0RYYHSRFyTmyXEduKxtUSOFLhxbKPkBdoS01OXu2C2XRSJgOptaLdw5AvylvPjLkipbWwtfQCZ7BwegZUVOSyj0rxfSSIQIRCKFm/zPha6pWdst1qxEuo6LUyHbgkENpP3U84Hf5QKfFmS3mOv3tEM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gourry.net; spf=pass smtp.mailfrom=gourry.net; dkim=pass (2048-bit key) header.d=gourry.net header.i=@gourry.net header.b=lgKC+G1z; arc=none smtp.client-ip=209.85.219.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gourry.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gourry.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gourry.net header.i=@gourry.net header.b="lgKC+G1z"
Received: by mail-qv1-f43.google.com with SMTP id 6a1803df08f44-6e900a7ce55so75534786d6.3
        for <linux-kernel@vger.kernel.org>; Mon, 31 Mar 2025 22:26:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gourry.net; s=google; t=1743485185; x=1744089985; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=d+Mgpj4yrfHwR2sSJO4BhWOtOStGYWK2zknVZa5Zibs=;
        b=lgKC+G1znttIDfISuXaUZN7NeNQKF1LfP1so73vkXQmyULnjamhE4+4iTJLzQn+poK
         7K4UPO7UYbCDa/a9N5RcPelDnsZ3bZQC7tAlYev+z0H1EU3q4n2IHdddkNLnli9pnGbE
         j/Z+X96BQf88me4tIcHnVud+swe/tyHhBtlYS67Z+927Bychb7CytJ69D6w8OX/xoHp7
         QpbU6TOtf5Lbuy8WZtaSdMLJZP/8+4a2gq1a5JOLb29/TT7v86CWo63aV5vUrK/tkfSM
         jHu3N1ee9ZzH8s710WL3IjaG86ZE+2P7oiX+cGu8SlR/8QveBzjdhqP5UQOGvdVv0PJU
         h8yQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743485185; x=1744089985;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=d+Mgpj4yrfHwR2sSJO4BhWOtOStGYWK2zknVZa5Zibs=;
        b=ckgk/qYEEeGJBs1M/GTwKYnp/6drQTndKtqjzkx3U1pI2tKBxcDrsXTxG9HQMGCwWR
         C04c1YnWT6v4/T8RtH4vWrWMbYHc165pZL6aohQvyePW4/M75iUIcKUdicgu0W9PBAM8
         8EOdPfZAkIF6RilZCGCLL93PwOZ4vAQmJHw3oNFIi1tVkmnN98tyV1ZK5zfebH8O529D
         G6k9PjEUf/+hknZudS+0Yc+23t1Lx5wZoWgFfKwCQr38GyD0sNCHuALVRdPfeIssce5Y
         sXq6oOwhGhjx7LuXJRYRtAKhXx0ZixLqSXL0NY1Woq1sImZY/w72gDk9uTs0ygbv8UvB
         PpAw==
X-Forwarded-Encrypted: i=1; AJvYcCUxeDH0qFvrbSh2ie08ILm24/dcCDLqQs2k6AVrjcqGM+LKKNA1nJ1HsFgLcjGjqhrJfuAzuV6UG78W5Jg=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw6+BRbjJXRETrPOWZMq4DGStUS52j57LweFnOAPEjLSwV3QqoN
	gnlGNo6zvdGvbd9zu0fdnbRavHaK7EGnxf2SmDPLQBtz4iVnAN5HjxOCIC/4uZU=
X-Gm-Gg: ASbGncs5AAkDwWmnXGCd/xsOeq1ivcSCPQ19GMP6zVqb1wTvP4Z/68+mFdLWyUo2uED
	bt/OrRWmv2o9LKbt+QxXrsVxrWfu+AwfH+cVs94VvMZRr+H53ENOtKl4oQQHuZyB7VJRKxvpA3g
	EvhECt2JkjMP+aUF1kxkpuN6bybyTbquBQKv27wWB7bMlsgvhRUQMLhPgQNo9P1r6VX/hsP6RxR
	2yufdVQq3eAmDKl42W0GuNW9/M2FWrTANXGZ62vVsPPTORBKcBk7WlIs64O4JmYgEsd6/ndOUmU
	Bq8YO33UXqijs4rlK1nwK6nziEpm2vxSuRf8YH7EPc0daRWcOPCawXnYQswhNZQ6oTA+TfWZd7n
	dbv8VlOvLuLCEeXINEjf+/oKHrY8=
X-Google-Smtp-Source: AGHT+IEu51bw47CDQBc1JI6NS5MPm9GXudL8MfmB+EAmAFi6Bv1GscrPtwU828XNPIKeVkrAGQIHpA==
X-Received: by 2002:a05:6214:d85:b0:6e8:fa72:be4c with SMTP id 6a1803df08f44-6eed5f4d3b1mr152699686d6.1.1743485185576;
        Mon, 31 Mar 2025 22:26:25 -0700 (PDT)
Received: from gourry-fedora-PF4VCD3F (pool-173-79-56-208.washdc.fios.verizon.net. [173.79.56.208])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6eec9659722sm56976496d6.51.2025.03.31.22.26.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 31 Mar 2025 22:26:25 -0700 (PDT)
Date: Tue, 1 Apr 2025 01:26:23 -0400
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
Subject: Re: [PATCH v2 10/15] cxl/region: Use root decoders interleaving
 parameters to create a region
Message-ID: <Z-t4_ymJsKEIz_r6@gourry-fedora-PF4VCD3F>
References: <20250218132356.1809075-1-rrichter@amd.com>
 <20250218132356.1809075-11-rrichter@amd.com>
 <Z-tIkR_bEkDPUyp4@gourry-fedora-PF4VCD3F>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Z-tIkR_bEkDPUyp4@gourry-fedora-PF4VCD3F>

On Mon, Mar 31, 2025 at 09:59:45PM -0400, Gregory Price wrote:
> I have discovered on my Zen5 that either this code is incorrect, or my
> decoders are programmed incorrectly.
> 
> decoderN.M  |  ig  iw
> ----------------------
> decoder0.0  |  2   256
> decoder3.0  |  1   256
> decoder6.0  |  1   256
> region0     |  2   512 <--- Wrong
> 
> *Arch quirk aside*, everything except region is as expected.
>
... snip ...
> 
> Looking at a normal system, we'd expect this configuration:
> 
> decoderN.M  |  ig  iw
> ----------------------
> decoder0.0  |  2   256
> decoder3.0  |  1   512
> decoder6.0  |  2   256
> 
> The above code produces the following:
> 	[1,512]
> 	[2,1024] <--- still wrong
> 
... snip ...
> 
> Can we not just always report the parent ways/granularity, and skip all
> the math?  We'll always iterate to the root, and that's what we want the
> region to match, right?
> 
> Better yet, can we not just do this in the region creation code, rather
> than having the endpoint carry it through to the region for some reason?
> Avoid adding the duplicate ways/granularity field all together.
> 

Having tested just using the root decoder data, i now get the expected
1:512, but i realized the issue is also that the regionref uses the
endpoint->decoder interleave ways/granularity

Before:
[]cxl region0: pci0000:d2:port1 cxl_port_setup_targets expected
               iw: 1 ig: 1024   [... snip ...]
[]cxl region0: pci0000:d2:port1 cxl_port_setup_targets got
               iw: 1 ig: 256    [... snip ...]

After:
[]cxl region0: pci0000:d2:port1 cxl_port_setup_targets expected
               iw: 1 ig: 512 
[]cxl region0: pci0000:d2:port1 cxl_port_setup_targets got 
               iw: 1 ig: 256

This makes sense, as the Zen5 quirk here is that the endpoints are
programmed with a 0-base for just their capacity, and they have no
interleave set on them - while the host bridges have 1:256 to match
the endpoint and 2:256 in the root is the only "correct" (in-spec)
programming of the topology.

I think the only choice here is to have another arch_check_interleave()
check here in `cxl_port_setup_targets()` that checks for this.  I
haven't run the numbers on what the results would be if the HB had 1:512
instead of 1:256, but I imagine there lies another round of madness.

~Gregory


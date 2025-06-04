Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2A7B91F873E
	for <linux-kernel@vger.kernel.org>; Wed,  4 Jun 2025 10:02:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749031341; cv=none; b=nBDDKtuW7/8IIHd+MYc52yU3YStNpYDu91Ni2W33MwwJky23iZH7iSLq5bZQFG4AfFJZAQURlK7m7AqoYM8Q2IuDpqTTkHN4ItoljZjwnUfg+EGd2IAhxQ4h0VLlZ8WXyB6zy3t9Mj7sCWR94KSA2tSssWRF45Ei6vOozuKovKI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749031341; c=relaxed/simple;
	bh=sLPoz34XcgLXIRhfhqNHWOIvPeZoKDI1bDStOXNazJg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=F62yCXvRopvyXIMsBHCH2UQaCQai1+icXAJwIpDFuu5TRPppMqLM51lFMexTNMWPRHfRGpAgpN0v3vRpNLC/rNa3v2PdmNyhQYcVBrlKh6xOjF7n5yCjlkRAwisbicwQRvRCNfq/LtP297dLflOXfCWH+n11ZmFQ0VxQiVxZfNY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=GZpFy6cG; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="GZpFy6cG"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1749031337;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=tDCGxTzwpKIeg+WG1qzk+ag5Tw2hTP//K4tpxVqw090=;
	b=GZpFy6cG6npAE4OIQECGbVdy/pfwiWahwj0DH5+WImCFFFZIqMh8lbB67/R00Cwxk84YQY
	gGpI0p/dZJYch35XA/BYYJ9ZMOuhuu1MlbnuPOceuIKkcivt7Y/GLi1Ijc9txnG6n+a/ej
	/b9C4lQwjf9Cw2pGhZChRIaPlj8jUjM=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-511-hb5wSsczNL6VCHwuhOX8vg-1; Wed, 04 Jun 2025 06:02:16 -0400
X-MC-Unique: hb5wSsczNL6VCHwuhOX8vg-1
X-Mimecast-MFC-AGG-ID: hb5wSsczNL6VCHwuhOX8vg_1749031335
Received: by mail-wr1-f72.google.com with SMTP id ffacd0b85a97d-3a1f6c5f4f2so2424921f8f.2
        for <linux-kernel@vger.kernel.org>; Wed, 04 Jun 2025 03:02:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749031335; x=1749636135;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tDCGxTzwpKIeg+WG1qzk+ag5Tw2hTP//K4tpxVqw090=;
        b=pb7wmY1zgTCbmDcCLp8GpBvTOcgku97g4BnVwxdRqZqVhSqkU7eAEYPpMImrzt/hDV
         HHvIFpyhOBWNO+FEqGC2UA+gb2FgQ8DrgwfpKBk6MMMN32PmdWQszI6aVcCrEXEYTATk
         fJmpqdmaPA7kTKXl/ue6DfS4R0qC73/Ho1xJRrT80e3UnVxzkV10P2HKABas4RSBlq4P
         W1pkUoMksnoA26ifwaMEBTcs4HCE7O9FPel0MvBMlCIK7ONPAiZ2Xethtn+iTwSjPFUD
         lvcQOVELfUsjfFIM5P9D0W3ZivjtclCnskofxRgO6PCe3gC/r+dG98l+SO+jhyPHEtwV
         Fj+A==
X-Gm-Message-State: AOJu0Ywt4uo6F91uJD+Y0Y7RYbWGgPaaCN8sXXVdVDQVK54F2EnoEAfe
	2ZLLxV7B2bno37iPlBXK95DRVnfyZ6QZCz/WlcNcaa6hwP16XjFN75Xgj6zEEleZBcAp6AaAKgx
	8b1yXWNHgryX6AlqocvMAxkkce71IKOdRbubqzHTomQGgdMUbBPQml8Y0WudOW2spvg==
X-Gm-Gg: ASbGncvTR4iSApaS44RAvONIU0fz+sjjurZDMdzG1IQE+vv/FsjlwVFLzgpCmxHoitD
	1rXso/PvAOg/QfH5eSshK1MIOcNGSwX1gEyVoi+h6AvgepYtaQdoMhbEYJ6qifHFtlA53pH+T8D
	bzzQefTvWGVihmv5y7BILoLieR0N9PCMgqKm4FBA4fh+alcQixTfnENIdONAnp0dbRRgTtZKMsB
	3/1tZ8rzgXgkMGgVHoAz/qzSJLvhpNbHZOmC5OwZabEvHP/46JOoY5DyZ1MPIdbrRbL1STWlwM2
	4qwbOSBpzBqZJZEouIPheLHsQ4oeIQO3Pjwcp8Dn+03JwIj/49zr
X-Received: by 2002:a05:6000:2dc6:b0:3a4:d939:62fc with SMTP id ffacd0b85a97d-3a51d920b3cmr1490994f8f.22.1749031335367;
        Wed, 04 Jun 2025 03:02:15 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IESd9xrE10B8oV6pKkf1J4F6ZlcEe1Vr3hNQtiSD2N7bfqicy4vZTUhvvKpmT2z676IOGjS9g==
X-Received: by 2002:a05:6000:2dc6:b0:3a4:d939:62fc with SMTP id ffacd0b85a97d-3a51d920b3cmr1490954f8f.22.1749031334938;
        Wed, 04 Jun 2025 03:02:14 -0700 (PDT)
Received: from jlelli-thinkpadt14gen4.remote.csb ([151.29.57.104])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a4efe740bbsm21264184f8f.54.2025.06.04.03.02.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Jun 2025 03:02:13 -0700 (PDT)
Date: Wed, 4 Jun 2025 12:02:11 +0200
From: Juri Lelli <juri.lelli@redhat.com>
To: Joel Fernandes <joelagnelf@nvidia.com>
Cc: linux-kernel@vger.kernel.org, Ingo Molnar <mingo@redhat.com>,
	Peter Zijlstra <peterz@infradead.org>,
	Vincent Guittot <vincent.guittot@linaro.org>,
	Dietmar Eggemann <dietmar.eggemann@arm.com>,
	Steven Rostedt <rostedt@goodmis.org>,
	Ben Segall <bsegall@google.com>, Mel Gorman <mgorman@suse.de>,
	Valentin Schneider <vschneid@redhat.com>, Tejun Heo <tj@kernel.org>,
	David Vernet <void@manifault.com>, Andrea Righi <arighi@nvidia.com>,
	Changwoo Min <changwoo@igalia.com>
Subject: Re: [PATCH v2 06/10] sched/debug: Add support to change sched_ext
 server params
Message-ID: <aEAZo3_g-OMVEgc-@jlelli-thinkpadt14gen4.remote.csb>
References: <20250602180110.816225-1-joelagnelf@nvidia.com>
 <20250602180110.816225-7-joelagnelf@nvidia.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250602180110.816225-7-joelagnelf@nvidia.com>

Hi Joel,

On 02/06/25 14:01, Joel Fernandes wrote:
> When a sched_ext server is loaded, tasks in CFS are converted to run in
> sched_ext class. Modify the ext server parameters as well along with the
> fair ones.
> 
> Re-use the existing interface to modify both ext and fair servers to
> keep number of interfaces less (as it is, we have a per-cpu interface).

We have a bit of code duplication, don't we? I wonder if we can do
anything early on to prevent mis-alignment between servers in the
future.

Also, is a single shared interface enough? Is the assumption that either
all tasks are FAIR or SCX always guaranteed?

Thanks,
Juri


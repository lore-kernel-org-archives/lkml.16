Received: from mail-qv1-f45.google.com (mail-qv1-f45.google.com [209.85.219.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B86152980DE
	for <linux-kernel@vger.kernel.org>; Thu, 22 May 2025 15:38:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747928300; cv=none; b=qJPIZsiIEgjTTv8uOXI/5FiHI0MuW8kjH6ydDlc5/YOnEWwTruMib5cfRmh5CSugU/2xqCs3zBLCK64M4qSuO46rJujqQZyiYRN1Vn50N8Al14RbJIBFVKun0YAVc9t0wxovW+40ZSxPOcyMKw/yuipscWycKOVmL3kk5GjHEN4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747928300; c=relaxed/simple;
	bh=QlVPprrtS20AgGEw1hO608iAXKWGpFV/cZp4SuSAhks=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=I3iI5eovRfnLHXqDCjRZKc/aSj9WQflak4zoPNahI1DMnBwZQDOfBT99elCX9PSidyqm/86RTRLwZpsA/i81ZdJAnxTOMPFzjPlJeYfnOW042ijHjamSoDz/Ze5+u4H8VoL+Ua90cerfhk8bZBROMD2ks3WUBZZS/TRkGerGff0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gourry.net; spf=pass smtp.mailfrom=gourry.net; dkim=pass (2048-bit key) header.d=gourry.net header.i=@gourry.net header.b=sM3iHS6B; arc=none smtp.client-ip=209.85.219.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gourry.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gourry.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gourry.net header.i=@gourry.net header.b="sM3iHS6B"
Received: by mail-qv1-f45.google.com with SMTP id 6a1803df08f44-6f5373067b3so103064516d6.2
        for <linux-kernel@vger.kernel.org>; Thu, 22 May 2025 08:38:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gourry.net; s=google; t=1747928297; x=1748533097; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=vf4u9GHOU695icofw0nCN1mD7rhaEWr6wLsjiu2s4Ys=;
        b=sM3iHS6BqNGCD+J03/S9JXBr9e3MRDBoPRDvCUwmamtQrBJUJf39ANUnZGQcLxTEGC
         0fORB5+w28vw7EKIZthhpgWFvE5H8ICq+PFeu73sjdOdbDU8bcugeVig02M6boPq3Ad0
         8vBcj9ys3E14GPD3mkJd5W0WDxl1pNVDR5x+KaZUUMrjozV0T2EIEoiLuGb53mPn3KmU
         A2h40FtWcm6A94atXHjSyaLKdNAXcE8g4Im/na8uObwsqC/sb7bW4jVKxx66NoDmraIv
         LJld0G6avyGKM3gv/uwUvPiWlC5gJTHI9WDnsOg/IDSULXeJmW9T+U8SLMQUiuzmyyrn
         NsVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747928297; x=1748533097;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vf4u9GHOU695icofw0nCN1mD7rhaEWr6wLsjiu2s4Ys=;
        b=IYD404wbqZxr4P5U/TZu3npszfeLm5OTrWVaifnmM46S06TRSEBmGj54zmHHgDeXYc
         dTFnFUuibjOo+C69NzQUxVLFteEtyVuIpsizgvt6LVgA0a3UbBfTyCiQS4waGOGIkjB/
         DuOMuXtIWBHLC17VYY4uQGFf5Vl9d8GyfJKoDv0Poj3klKNaO4FgCMEhNvzYp+sTpAND
         Km7IAN6BNpWjQ3hRPVy+X7d774PXeBm7zNUvx72BZNrYzOm5zhlVuQ/Lerhmp9kUaGPx
         9d0uijFGxFROGONNBI86hchf6mYSURYVZIyGS2nAQ9hy4FAe33dyYKHCTolTyTSct22+
         7Skw==
X-Gm-Message-State: AOJu0YyfKy/qjQ6gfCBSrFCNpbqGRXedq8ZVg2smkKBg53v+KjVy4qSN
	2z29jihyvBfn6p6BHXsfrL3m2s+0ielyu1oP2y3p0NxwOaWlViqizaY4AQDf6jLlNe0=
X-Gm-Gg: ASbGncsPIrKn76q/VWcatUAx4httEwwon4WDVUrYoBrie9SfAtAJqb5V0K8nBDvOPkf
	bBdyiuVE80+eKC9bkCdJP8WIYIX9/MnlNPDVHmkvBrwBErJmW2feHCIrE43AaoXnADaNJno+tCB
	KtA+ddZD3STDwy1AQnj2MqJc7FQDHUH0MgnhtZ+r7fLUG3O2PNDhH5mpKLqqs5loyBqOt+P7Xz1
	DhoV2hHJvZ90WTG8qylhzTZ4hcAO+8kRM13IW9ulPxvpHz+Jyiun5Vaf/8kQN8gBAqU9VW6YPva
	Hq8tNaOr4whXPL2NHWoBhnU+3A0Wi8xHqdKi+HRpWrfvxtblhYx/DyLa2Q4ryi3Gyy/oE6FPmp9
	xwRNrNwYw4XtUs/dz1IEDuyl/dXPjX4w=
X-Google-Smtp-Source: AGHT+IHgTy5wIi4p5xqLShtVbp3TEEC5U39xpmJidezDTtapAbojcCLBXRwyRF8gIl9qzCGM+7De1A==
X-Received: by 2002:ad4:5ec8:0:b0:6f5:35f0:c89a with SMTP id 6a1803df08f44-6f8b2c69772mr419279366d6.18.1747928294388;
        Thu, 22 May 2025 08:38:14 -0700 (PDT)
Received: from gourry-fedora-PF4VCD3F (pool-96-255-20-42.washdc.ftas.verizon.net. [96.255.20.42])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6f8b098757csm101004296d6.118.2025.05.22.08.38.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 May 2025 08:38:13 -0700 (PDT)
Date: Thu, 22 May 2025 11:38:11 -0400
From: Gregory Price <gourry@gourry.net>
To: Bharata B Rao <bharata@amd.com>
Cc: linux-kernel@vger.kernel.org, linux-mm@kvack.org,
	Jonathan.Cameron@huawei.com, dave.hansen@intel.com,
	hannes@cmpxchg.org, mgorman@techsingularity.net, mingo@redhat.com,
	peterz@infradead.org, raghavendra.kt@amd.com, riel@surriel.com,
	rientjes@google.com, sj@kernel.org, weixugc@google.com,
	willy@infradead.org, ying.huang@linux.alibaba.com, ziy@nvidia.com,
	dave@stgolabs.net, nifan.cxl@gmail.com, joshua.hahnjy@gmail.com,
	xuezhengchu@huawei.com, yiannis@zptcorp.com,
	akpm@linux-foundation.org, david@redhat.com
Subject: Re: [RFC PATCH v0 2/2] mm: sched: Batch-migrate misplaced pages
Message-ID: <aC9E4-0-RD-hWchr@gourry-fedora-PF4VCD3F>
References: <20250521080238.209678-1-bharata@amd.com>
 <20250521080238.209678-3-bharata@amd.com>
 <aC6gOFBrO0mduHrl@gourry-fedora-PF4VCD3F>
 <df71c9e6-52e2-4afa-b0bd-42f5aadbad71@amd.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <df71c9e6-52e2-4afa-b0bd-42f5aadbad71@amd.com>

On Thu, May 22, 2025 at 01:03:35PM +0530, Bharata B Rao wrote:
> On 22-May-25 9:25 AM, Gregory Price wrote:
> > 
> > So i think this, as presented, is a half-measure - and I don't think
> > it's a good half-measure.  I think we might need to go all the way to a
> > set of per-cpu migration lists that a kernel work can pluck the head of
> > on some interval.  That would bound the number of isolated folios to the
> > number of CPUs rather than the number of tasks.
> 
> Why per-cpu and not per-node? All folios that are targeted for a node can be
> in that node's list.
> 

On systems with significant number of threads (512-1024), these lists
may be highly contended.  I suppose we can start with per-node, but I
would not be surprised if this went straight to per-cpu.

> I think if we are leaving the migration to be done by the migrator thread
> later, then isolating them beforehand may not be ideal. In such cases
> tracking the hot pages via PFNs like I did in kpromoted may be better.
>

This seems like not a bad idea, you could do hot-swapped buffers to
prevent infinite growth / contention.  One of the problems with PFNs is
that the state of that page can change between candidacy and promotion.
I suppose the devil is the details there.

~Gregory

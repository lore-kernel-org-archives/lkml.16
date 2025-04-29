Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com [209.85.214.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AED87253327
	for <linux-kernel@vger.kernel.org>; Tue, 29 Apr 2025 18:03:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745949808; cv=none; b=haIjcb0/xISeH1tEaCszZqT4cjNI7x6zYRgYPKMjq3HcUmM/K8dJz4HqYhwzkddus74uWAwnryGYEvyY//lchoal+ASnvbs2/CDTb7X6kCZjHLna4/ee9rVIbzLDAvTF1vM8FkDCUrx59r8BQXrTiFm9BqYWI2a5Y/qLo5JHKDw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745949808; c=relaxed/simple;
	bh=/jKxrEccc/rxDV9flEdrkcq0R1bjej/EwSVckgQxFcs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=nA57FiEII7ziW+VrNL56KmyFfsW/80zfuG2Q6v7ke7WzfI9eB/BFcLGzjzM0LA3X9pHC8GdkP323QHYFErXhA3F1NEjGd2bDOKfsBEUkslC2+HUMW7Dfn3uQGUa5KJQq52JLUIGT5SByKKx4wCSZpnUfVRoRmrvZmc50PtjpXsU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=XJyFIw0W; arc=none smtp.client-ip=209.85.214.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="XJyFIw0W"
Received: by mail-pl1-f173.google.com with SMTP id d9443c01a7336-2264c9d0295so199285ad.0
        for <linux-kernel@vger.kernel.org>; Tue, 29 Apr 2025 11:03:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1745949805; x=1746554605; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=5gO38QVftzp7foJd8AqWRzdImXv3oAewp8XDWFfWfG4=;
        b=XJyFIw0WqXVVAB5105nnJ5HTLB/7M1krQYJt2wmsl61Cd9y0y7gQJ+hc266kTjRd98
         GA0dZUH8IPjFpB3xeQrXG8DlIKm2Bw9OCVzJKXC3xUC2sF9mKKgmHjkvGtoTaNHjcg+o
         gSN7JV2qfCr2sxAiJwbWozNlOYk41EazpNghNO+h1mbf55TfrJ8RNWzqPoGaMQV1LQpA
         FcEvAAErdi7el76+xtKu1MHu0Qa9UY/flgM19bDvr2zHJQc+FD7FqwUraTOX71XrE4NJ
         mOZF0ISLWI7ZXbywlj1Aq76hGnErag9DgkrRj//koa3ZvJvW50bCF6WxbfK+6kFnaeNq
         Yb9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745949805; x=1746554605;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5gO38QVftzp7foJd8AqWRzdImXv3oAewp8XDWFfWfG4=;
        b=MwBxCFrUQiN+Jl5duHDQUQgTFgJXmURnUikQYuB0dQOCFilzOhIHiY3E+jFtlk2zeq
         2/CJVJAm3/B7Xcoga/wrm/910z6rbCmC8t3yVUi4f7MLg4I7fqMbzCZ2tq2robo4caic
         +NiG00UNY6T+B7HUWGdS0r6YZAdG2jkkCHdakpELQe1huxl98U5dN6+u+a5h1eqPVjif
         PDOQYjwnfyiFOy//YbBbGERkYAztfPWbpA1EY4jbDiMSXDueBhptq5Jb2c9haK7CpxLG
         oXRZpKIU/r2xaYiv1509lpN4LBrgtf7bzCCSaKN4OwUJXBQLtOBUNScnuavr+PZkdXp8
         Siog==
X-Forwarded-Encrypted: i=1; AJvYcCXy9knAU6YWZExtxTSHEKff+JzWHLXgOkSUxD/RsdXiHsd7H175b3vODc4O3HrwcINZKl9ruwFQAmE83As=@vger.kernel.org
X-Gm-Message-State: AOJu0YyuesoYxRPxrbEGSmhHjtZgark0NTZigixkQXtmUpvKgrvw3qKS
	Q/iQlNJKkM5hVtS6qb7wBh7cXB5mscyGXakGS+QN+u6l2vk9cbguRMNFhbUrYw==
X-Gm-Gg: ASbGncuGiKmFj4ZL9R05lLpvumulD75xooJVW82TsgIcusbVXsJ4+zFyDDt/STYLFDT
	ypoyKfwQsVjwZmpX/es1W0W++0E+7pEXy3o3ZfTFyglKwKxuUM6WQboPMs1so4TFJQgWo7ndBlJ
	nYLeVsEkiMflY7yCLYQC+NBUk95U3yAaA0Yi5Rmq9StO0d1BRSrPJKQlkoBTLBe2P+OZ/sVrtEK
	gJRAV18sQW+zHXJgmB1Pkvmjl6zKKRPUESx1BGVNZp/j3Y6p0obVtSgavR6aP6nLmUNG2yHit+g
	VRKflkW4IfV5kqD++lRif5l/omhrNghgdLWRAdRvxn/g6zzVrtUriAyYtx9EYP3vEmOARt3b
X-Google-Smtp-Source: AGHT+IHcbHv78LbKHTcjYARgVuVMIU3PlvzwcFa5Mynrm4iDVnN6pnPgBf3EmKTpPOmaL66ic8Z84Q==
X-Received: by 2002:a17:902:f60a:b0:215:9ab0:402 with SMTP id d9443c01a7336-22df40757bemr145535ad.18.1745949804669;
        Tue, 29 Apr 2025 11:03:24 -0700 (PDT)
Received: from google.com (2.210.143.34.bc.googleusercontent.com. [34.143.210.2])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b15faded711sm9272213a12.66.2025.04.29.11.03.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Apr 2025 11:03:24 -0700 (PDT)
Date: Tue, 29 Apr 2025 18:03:13 +0000
From: Pranjal Shrivastava <praan@google.com>
To: Nicolin Chen <nicolinc@nvidia.com>
Cc: jgg@nvidia.com, kevin.tian@intel.com, corbet@lwn.net, will@kernel.org,
	bagasdotme@gmail.com, robin.murphy@arm.com, joro@8bytes.org,
	thierry.reding@gmail.com, vdumpa@nvidia.com, jonathanh@nvidia.com,
	shuah@kernel.org, jsnitsel@redhat.com, nathan@kernel.org,
	peterz@infradead.org, yi.l.liu@intel.com, mshavit@google.com,
	zhangzekun11@huawei.com, iommu@lists.linux.dev,
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-tegra@vger.kernel.org,
	linux-kselftest@vger.kernel.org, patches@lists.linux.dev,
	mochs@nvidia.com, alok.a.tiwari@oracle.com, vasant.hegde@amd.com
Subject: Re: [PATCH v2 08/22] iommufd: Abstract iopt_pin_pages and
 iopt_unpin_pages helpers
Message-ID: <aBEUYdlCLcH70UlT@google.com>
References: <cover.1745646960.git.nicolinc@nvidia.com>
 <d44272c153e7596c3cef716044de3dc6c2a8254a.1745646960.git.nicolinc@nvidia.com>
 <aA_hm_AD4Xzm3qJZ@google.com>
 <aA/9TZq99TF+MRYv@Asurada-Nvidia>
 <aBAQdq0jeoCdKdsC@Asurada-Nvidia>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aBAQdq0jeoCdKdsC@Asurada-Nvidia>

On Mon, Apr 28, 2025 at 04:34:14PM -0700, Nicolin Chen wrote:
> On Mon, Apr 28, 2025 at 03:12:33PM -0700, Nicolin Chen wrote:
> > On Mon, Apr 28, 2025 at 08:14:19PM +0000, Pranjal Shrivastava wrote:
> > > On Fri, Apr 25, 2025 at 10:58:03PM -0700, Nicolin Chen wrote:
> > > > +	iopt_for_each_contig_area(&iter, area, iopt, iova, last_iova) {
> > > > +		unsigned long last = min(last_iova, iopt_area_last_iova(area));
> > > > +		unsigned long last_index = iopt_area_iova_to_index(area, last);
> > > > +		unsigned long index =
> > > > +			iopt_area_iova_to_index(area, iter.cur_iova);
> > > > +
> > > > +		if (area->prevent_access ||
> > > 
> > > Nit:
> > > Shouldn't we return -EBUSY or something if (area->prevent_access == 1) ?
> > > IIUC, this just means that an unmap attempt is in progress, hence avoid
> > > accessing the area.
> > 
> > Maybe. But this is what it was. So we need a different patch to
> > change that.
> 
> Rereading the code. The prevent_access is set by an unmap(), which
> means there shouldn't be any pin() and rw() as the caller should
> finish unmap() first.
> 
> In the newer use case of vCMDQ, it's similar. If VMM is unmapping
> the stage-2 mapping, it shouldn't try to allocate a vCMDQ.
> 
> -EBUSY makes some sense, but -EINVAL could still stand.
> 
> So, I am leaving it as is, since this patch is just about moving
> the functions for sharing.

Ack. I don't have a strong preference too. This should be fine, we can
re-visit this if needed in the future.

Reviewed-by: Pranjal Shrivastava <praan@google.com>

> 
> Nicolin

Thanks!

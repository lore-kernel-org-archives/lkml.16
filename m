Received: from mail-qv1-f48.google.com (mail-qv1-f48.google.com [209.85.219.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0F3FE1172A
	for <linux-kernel@vger.kernel.org>; Thu, 22 May 2025 03:08:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747883304; cv=none; b=nEcJVpEWKAkj8FDITVicZo172epa3Oaeeejriq/LvXt5/Ij49BwcN6tK5EgM1M7rxQtiVDYrjJEZ6oR0sRzETz+TjXD6tTYaL6QoCSRB5Ub8z8MV7JFIiGT16M34ejNU5QDC8c1s7xSHRgL//4ez5hAHdVd3upPWgeR6uFhuhQg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747883304; c=relaxed/simple;
	bh=q2KZ86WaIx1gEeDCZnA2QS5Jz55c/igaAybUfOzqVeU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ZIlZU1PwTx4Ezv9/F4ZukJvOSuE3s37QqYHEZiX+YlnKaz4WIVWCuPRhAxp6ib/5+vaSNtl0OKyimdJqvz1QYtI8GRnk8KalBuBm8jNm1iJBGgvTnFpLAT008HxLxdq1rEmAMcrtG/l/fB9bRcBC2joCdSxfWYEiapSkyt64TW8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gourry.net; spf=pass smtp.mailfrom=gourry.net; dkim=pass (2048-bit key) header.d=gourry.net header.i=@gourry.net header.b=mVbWfFYi; arc=none smtp.client-ip=209.85.219.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gourry.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gourry.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gourry.net header.i=@gourry.net header.b="mVbWfFYi"
Received: by mail-qv1-f48.google.com with SMTP id 6a1803df08f44-6f8b9c6b453so67578306d6.2
        for <linux-kernel@vger.kernel.org>; Wed, 21 May 2025 20:08:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gourry.net; s=google; t=1747883299; x=1748488099; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=AGVNczz6qr4dQlYUXeVEe2dNVe5Hjh6BmJ07Zb+P3ZI=;
        b=mVbWfFYiJvJ1vGIBvB+JyR6zuvME0t1ge9qfJGgyqYREfat3LTNTG/LqjMHslIBl5V
         AKhJDFif1RwZQS/hrZFK7/NEWWZvaWw8t4dzhzOulXIgWJFkgK/ZVsp9X5rbV32OVZwR
         ojWQqgux8ay222z6DZLVQHtAk0CbhHS8oMxuosvQbUZWrV9VFV2l+VuNERHwwXaY6QMW
         GQgRgO2BQjIlWKlG42AA4+hrC4UVKnytGzqmfQp0XCphLVBCJm2kbIGKTCiT7CUAW1tT
         1V0sKUCo5BXEr9UHgVW/zFS/5Nov5mCCR984mByzEB6DfAH2Iz7rGKq6iGMUBJJBSZJ8
         FJ5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747883299; x=1748488099;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=AGVNczz6qr4dQlYUXeVEe2dNVe5Hjh6BmJ07Zb+P3ZI=;
        b=J1swrWervWdotvf4fi5J9lvK3mKhnCTSF/UU1JIsa9hOKQ3AfeBdkPEJC1y0cI3KKx
         E7OSq0oAT3XI58Do/na1IGDkBNGFhkacVLl4yH9aRXKK82+h5fWWXLtcKxEc15c5yM6w
         aHN+x4xo/ZvZZd3IcEpU6FTf1fbtlDZh9f4wgfCXsS13L311fs3KyZo7xpqpFhgNMxTA
         7Ndy3Xes1XdxCIpvgWcvJw1EnJdv7ofP2MTwv7wkmyyANEyXLiSD3/Th0KMAS3uCDLTy
         NuAXtNayqlgtyqlVPCgIwU7vJ21rdnkHGBxtP5fZM0evfyU94NUB9zCdH6lF+IBJM/Gu
         0n0Q==
X-Forwarded-Encrypted: i=1; AJvYcCW00s3SiakVQlx2P6iRGth2dBbwUKOdbyEq9C2LWCJ/FcH8xYKXLt9nq/ZGEvDmBYOTserzzYQ5BaxNeGQ=@vger.kernel.org
X-Gm-Message-State: AOJu0YyPtLQpUx14wCIsuQDkW2uEUwJJDhJKTu/As78eVIOs2kLS8iL/
	IZ9852mLkeHKhSZCa9umjkbNXdrvst3ze7FoOvDR7bdnwtkggvVfBamPsKq8sI3hihw=
X-Gm-Gg: ASbGncvdPs0jhJ3P5LJ6AXm4DrSWe15b/442wy48iQRdgP46HGE3SC9TLedZcngC0w2
	KtTBF7cpiIonTMHC6ZW1OaMnvsjcDhSjSEJde6CRQ4BwSZocz7KnWIP3v63Tef0lJqVPVHs2Uce
	MkFAwgnFyLlm7gZzlJHw70X3PfUKBxSN658S3EyHnX/Dn+jCEP36NMZXmTED6r675OrBVzpGmWq
	/Vdq5pS9t6SGQ6h43clrg5HbJSgNkxIALvHRTDS4aWJ5g5hY3xQBq7/poWy+JHiVBlQz/U9RJmP
	WUtu7FmygT0v4gms8oxGWqYE9JgKnl5/7G1rouiJocAWyzmsBn2ekuItU9wSclxPnbSzFp4q1OC
	TD1vcN1CoUu+L+rJh7IRDWSjx0gtD3Sc=
X-Google-Smtp-Source: AGHT+IFSrnLEH05GG4SlQC5J9N13ka7pCoc3hDoinN3MroPbkQgIIeIPHyBXTSm1kxX304ReSIUJhg==
X-Received: by 2002:a05:6214:da2:b0:6e8:89bd:2b50 with SMTP id 6a1803df08f44-6f8b2cb9a48mr380561136d6.7.1747883298782;
        Wed, 21 May 2025 20:08:18 -0700 (PDT)
Received: from gourry-fedora-PF4VCD3F (pool-96-255-20-42.washdc.ftas.verizon.net. [96.255.20.42])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6f8b584bb4bsm86728866d6.68.2025.05.21.20.08.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 May 2025 20:08:18 -0700 (PDT)
Date: Wed, 21 May 2025 23:08:16 -0400
From: Gregory Price <gourry@gourry.net>
To: SeongJae Park <sj@kernel.org>
Cc: Bharata B Rao <bharata@amd.com>, linux-kernel@vger.kernel.org,
	linux-mm@kvack.org, Jonathan.Cameron@huawei.com,
	dave.hansen@intel.com, hannes@cmpxchg.org,
	mgorman@techsingularity.net, mingo@redhat.com, peterz@infradead.org,
	raghavendra.kt@amd.com, riel@surriel.com, rientjes@google.com,
	weixugc@google.com, willy@infradead.org,
	ying.huang@linux.alibaba.com, ziy@nvidia.com, dave@stgolabs.net,
	nifan.cxl@gmail.com, joshua.hahnjy@gmail.com,
	xuezhengchu@huawei.com, yiannis@zptcorp.com,
	akpm@linux-foundation.org, david@redhat.com
Subject: Re: [RFC PATCH v0 0/2] Batch migration for NUMA balancing
Message-ID: <aC6VIG7GPnqr3ug-@gourry-fedora-PF4VCD3F>
References: <20250521080238.209678-1-bharata@amd.com>
 <20250521184552.46414-1-sj@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250521184552.46414-1-sj@kernel.org>

On Wed, May 21, 2025 at 11:45:52AM -0700, SeongJae Park wrote:
> Hi Bharata,
> 
> On Wed, 21 May 2025 13:32:36 +0530 Bharata B Rao <bharata@amd.com> wrote:
> 
> > Hi,
> > 
> > This is an attempt to convert the NUMA balancing to do batched
> > migration instead of migrating one folio at a time. The basic
> > idea is to collect (from hint fault handler) the folios to be
> > migrated in a list and batch-migrate them from task_work context.
> > More details about the specifics are present in patch 2/2.
> > 
> > During LSFMM[1] and subsequent discussions in MM alignment calls[2],
> > it was suggested that separate migration threads to handle migration
> > or promotion request may be desirable. Existing NUMA balancing, hot
> > page promotion and other future promotion techniques could off-load
> > migration part to these threads. Or if we manage to have a single
> > source of hotness truth like kpromoted[3], then that too can hand
> > over migration requests to the migration threads. I am envisaging
> > that different hotness sources like kmmscand[4], MGLRU[5], IBS[6]
> > and CXL HMU would push hot page info to kpromoted, which would
> > then isolate and push the folios to be promoted to the migrator
> > thread.
> 
> I think (or, hope) it would also be not very worthless or rude to mention other
> existing and ongoing works that have potentials to serve for similar purpose or
> collaborate in future, here.
> 
> DAMON is designed for a sort of multi-source access information handling.  In
> LSFMM, I proposed[1] damon_report_access() interface for making it easier to be
> extended for more types of access information.  Currenlty damon_report_access()
> is under early development.  I think this has a potential to serve something
> similar to your single source goal.
> 

It seems to me that DAMON might make use of the batch migration
interface, so if you need any changes or extensions, it might be good
for you (SJ) to take a look at that for us.

~Gregory

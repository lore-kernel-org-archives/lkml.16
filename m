Received: from mail-wr1-f74.google.com (mail-wr1-f74.google.com [209.85.221.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8F8991FECC3
	for <linux-kernel@vger.kernel.org>; Wed, 18 Jun 2025 09:56:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750240603; cv=none; b=fIi8nq63LueZHC0tbFpyIBgCVGCbAFwDngFSGPWYZT2K1QC66JZ7uYSsfuAURY5hDg2AADD/mjFNIMnYGmMz4UhaQIkfQ6kJT00+X7TFgw5qVK2r8qqBV283uGNdH5ZUFc3i9QZURGFnYA/aegCb9EeOXYg5fTBVy2o6LedVGsI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750240603; c=relaxed/simple;
	bh=JDaIeNy11rXDTXWTh0AwcbmB2ukpxw0T2k1QCXZZeA8=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=iR0zr0N43OZ4flj/nsG4M+uKQEvyRibrY4uofhpOi8+mW8zCESxR/3546PCn2aUjhdKMvu1aSpVUB3LNL8pmq9BZ9Uf4n+jbF3K6nEMOq27sIa3IxzfNLfwanSoiUjN0pXHD+MQDGPNvjmBbT0J4EUGtUIhZ+jypqUg9paQXCCw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--jackmanb.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=CBds8Xfr; arc=none smtp.client-ip=209.85.221.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--jackmanb.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="CBds8Xfr"
Received: by mail-wr1-f74.google.com with SMTP id ffacd0b85a97d-3a4f55ea44dso2713850f8f.1
        for <linux-kernel@vger.kernel.org>; Wed, 18 Jun 2025 02:56:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1750240600; x=1750845400; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=JDaIeNy11rXDTXWTh0AwcbmB2ukpxw0T2k1QCXZZeA8=;
        b=CBds8Xfr/RM9MJcCgE0PkTzVU5EXFjby4a8va7u+YTxIEIpFyxxB/cL3pUGiEiSkvy
         H1CvYoYbHGg8rsb4n5yPaGOPuZLDz3tCyECCQ5avbOU0GBpccNINwVzLg5cDjlNoSocI
         CemEQ/BS3UYQBmMUIMDfZPr1b4Fp4i19QS5FjeH2WW2onmbKGFDKOFnILdaysuUWsob8
         b8Zbj6zBEWZRQLb2Bn5PK6UQPunRSbGmbUNnqypca6rzLbMJL6KLK3EGPGLhKFXdnjSN
         9MJyk7SCm2HuNnK+h/lVLDm+W873/e4qSTGe6qhuR5CFyZdJm25frwu8KyLSZC4fi+4C
         jvyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750240600; x=1750845400;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=JDaIeNy11rXDTXWTh0AwcbmB2ukpxw0T2k1QCXZZeA8=;
        b=ZJvSy35P6qmnRa0+5HijupfGURARq04ZcD+F/RKPJHNFNKsqELPBzjM7UVupIot0iV
         mo7uKcj4zhIH+FEzk/O/lCsaHRjetDRpOlXQmNzGuKBHAVKShO504tCdeXztloNsHGjB
         cwVfmPC0eaRqAESTXPlakMoMcOlLAYnFKbFLmG/Xanc4yOS80erR2avrb97ShO3lm1G/
         pqj+2SGg649ypRx1DXruKUWLCWSQGS8W3wVwIuFtuuxZzHnMOhxsOEMmlSkdeiDYgyDm
         lxbBUeZcHzFckwwSChWss23LzsHgPTx/ZzzHmgfsuycyPgx392uRL28iB58liL6IAIce
         a1Ug==
X-Forwarded-Encrypted: i=1; AJvYcCWGlzjaN/tRrun+2kHHG7lRKBca2aZ2kZkRLVShz4yYb9JK+YI1xJ7zgfFWow6PJut5vUoXR2wVCv4JBWE=@vger.kernel.org
X-Gm-Message-State: AOJu0YxhgycUIB4dOp6YNMsFuOTyYfn6zITRNVAMn3BvT2ca5IF4mNmZ
	QHepf2ERQqG7E/9jU2K0cNHexDzZs+P3+7PdFEstjwvgKM++c+xlDu+tN1aafFic8gg7iqlytdQ
	xykbhxpoOVxq1Mw==
X-Google-Smtp-Source: AGHT+IELgpOaQblaTjoqfSuXE+j8L5V2VGSUGA6xcczobmu3sMDVKPrWwRhuq3ub5VpdiCa5/L+hGcof27pPlA==
X-Received: from wmqe7.prod.google.com ([2002:a05:600c:4e47:b0:43d:9035:df36])
 (user=jackmanb job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6000:2310:b0:3a4:eed9:755d with SMTP id ffacd0b85a97d-3a5723679c2mr14269030f8f.3.1750240599981;
 Wed, 18 Jun 2025 02:56:39 -0700 (PDT)
Date: Wed, 18 Jun 2025 09:56:38 +0000
In-Reply-To: <20250616202425.563581-1-lorenzo.stoakes@oracle.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20250616202425.563581-1-lorenzo.stoakes@oracle.com>
X-Mailer: aerc 0.20.1
Message-ID: <DAPKIESK746G.1B3FVDW9UWXCZ@google.com>
Subject: Re: [RFC PATCH] MAINTAINERS: add missing files to mm page alloc section
From: Brendan Jackman <jackmanb@google.com>
To: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>, Andrew Morton <akpm@linux-foundation.org>
Cc: Johannes Weiner <hannes@cmpxchg.org>, Michal Hocko <mhocko@kernel.org>, Zi Yan <ziy@nvidia.com>, 
	Vlastimil Babka <vbabka@suse.cz>, Suren Baghdasaryan <surenb@google.com>, <linux-mm@kvack.org>, 
	<linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"

On Mon Jun 16, 2025 at 8:24 PM UTC, Lorenzo Stoakes wrote:
> REVIEWERS - let me know if these seem appropriate, I'm eyeballing
> this. even if they are not quite best placed a 'best effort' is still
> worthwhile so we establish a place to put all mm files, we can always
> incrementally update these later.

I don't value my own opinion very much here but FWIW this is
fine with me, thanks for taking care of it!

Acked-by: Brendan Jackman <jackmanb@google.com>

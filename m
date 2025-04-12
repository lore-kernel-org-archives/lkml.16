Received: from mail-qk1-f170.google.com (mail-qk1-f170.google.com [209.85.222.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 98CE880B
	for <linux-kernel@vger.kernel.org>; Sat, 12 Apr 2025 00:09:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744416601; cv=none; b=DMDEDUIc6be85y+xUQ/l79iMeY2kKnC3FFc5ua0k37sKcl67+jUkUljXNC+hc+s9szJ8oVnqCWdMitnb/vj6MTaK2B+4aNYoIZYSVQ5XeZ5ykRSGqGAx22xxwb6rIE17cC9Cvv+VUvf9dfLteabm4q0GgYz1caC4BPIR8yb7ln4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744416601; c=relaxed/simple;
	bh=4udWdYCIO3StV4kFbFRa++0FQ68vJBjSV6UL63Sa9AI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=UY8UchNs7IDkOQ4pmZptjCOr5W3vyS3gJvmW14lv4NCBfMoH4vo+jlslezqm+fV8G103y042AHv0DvDLIZN2pTiue67/dvOvJAyLZNY366NaQjoO2wLNeqrgJw8B7UtDUurOIqVUh/9dmm6ePF5wy3Rd3mf5cj5qAR5Z/xZxfCk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gourry.net; spf=pass smtp.mailfrom=gourry.net; dkim=pass (2048-bit key) header.d=gourry.net header.i=@gourry.net header.b=q8dn+w3r; arc=none smtp.client-ip=209.85.222.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gourry.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gourry.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gourry.net header.i=@gourry.net header.b="q8dn+w3r"
Received: by mail-qk1-f170.google.com with SMTP id af79cd13be357-7c560c55bc1so262284285a.1
        for <linux-kernel@vger.kernel.org>; Fri, 11 Apr 2025 17:09:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gourry.net; s=google; t=1744416598; x=1745021398; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=sRXqNVmIqyS+Jz6z2updy3JXW7i0nvOqZaWjs39Mac4=;
        b=q8dn+w3r2aC4EjheikU6hx+QO7voPorqo0YWgubvdfdq2n4foJVUQqdTvNak7HMuq8
         wxx5q2rBn4bGbB6yb3LJ+wpUIO6FA6uvnUiDbgP2SJwzBvB63SJnBIpglfJH9wkZJvAN
         qgx0/u/p0LUC7P/entv2ZGNNH9pi0Ly6vTXVNbH6aeqBbJP7dgyTgON26Nfprb+rMQaa
         h3eg/zrYFEjmt88hwkot2hXJp+R+gGs6/40fMXjth1V/PHYQ9S2su4ha+AdeB9rYea2F
         HfhYDNdFzsHxGd+qEluKcLautgEZGE6a9ksw88iepGkIHxc4ZHjhX9Ppp300YnOKpwbV
         nxuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744416598; x=1745021398;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=sRXqNVmIqyS+Jz6z2updy3JXW7i0nvOqZaWjs39Mac4=;
        b=ZizWKvAEENHNLpgkGkRjUL2RYlIOqLgkO023bgIzfODE0w5szvBhdt6t47saKkUSjH
         T7weFrBsZRJ816SLGK8rFsiMeMDfmjdHOIlUCq3fozYxotzqGVTrkI3Kmy1JOebcBbds
         2dvFeoGiqlmm43UErr6giEF0NWjiBaSaexChizu7dZyd0PNqPYiPBGzZjIEbMdIKN+vP
         C63gxlWOhYGuBFhiz9TA84VjkoMxPbnif8izktbZQGZEQtK190xQ+tYiuXL/1Fj5Ura4
         k2Box9xuWchDDRq43qFl5OojUxMilGVbRxDxqp1URwL8ePiXhhjPRsXYF+Mv8/T5NJO0
         fUlQ==
X-Forwarded-Encrypted: i=1; AJvYcCUP+OqpIvzYtguC9iIyfh0QrFfcoVJ37bUJw/303WrtzVnXRLz5d9s1OnD4BSEy+C11AGxSZ31xFBHhLdI=@vger.kernel.org
X-Gm-Message-State: AOJu0YxftUk+LYpNPnVKFGZplZnmj1kuj54La6PibIikim3oheacWM7u
	QNq7Ch39Es2XiHm/GrBYlEvuzLzzcAM1u8/rBp41w/Pw+iJpeK5byiiYNIaCBwo=
X-Gm-Gg: ASbGncvCvyD9zpF7tY1iq34zxeUifn/PYCjFk9LWYqpnktCv6gtEamf0gVX+rJGTBsr
	DmPr7laJ/yPTjJt29jrOIcCwzBtn371mhkHWfuxpioaLR+zPj8VCvj5YlD08V7UgsHCnzni/sZD
	YCMhBZBNZHxESxS9Grqswtj62AheGLNEyv/RRGwvLjpitViaVhI1z0fRIUF5RyWATgTuuRbJGa4
	pcT2N3zcR/siGMLw/T2GijKm0W3kb1cjMdINNn2VF5ogLG2N0BMOw/s11xIeTtxxyrBzZLHCKtv
	FtzciNrU9vC1x7SwVo4rRUoenwYC3uE19dyN4zH+I2+JO41SZDtMVuQdRjB4AEAAgqVvUAaxCeh
	PeBvl1TNbP9/Gzb8I5Kty2L+8b7R/yQAWqQ==
X-Google-Smtp-Source: AGHT+IE5Xlwy4jufzqg2VNoz64xedL1xgIf+lmQN007iCJsS30QUHvJ5IGhsqxtG1KRey8ZizqlU6w==
X-Received: by 2002:a05:620a:468a:b0:7c0:be39:1a34 with SMTP id af79cd13be357-7c7af12dde8mr794060785a.43.1744416598362;
        Fri, 11 Apr 2025 17:09:58 -0700 (PDT)
Received: from gourry-fedora-PF4VCD3F (pool-173-79-56-208.washdc.fios.verizon.net. [173.79.56.208])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7c7a8a0e6ddsm329175385a.107.2025.04.11.17.09.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 11 Apr 2025 17:09:57 -0700 (PDT)
Date: Fri, 11 Apr 2025 20:09:55 -0400
From: Gregory Price <gourry@gourry.net>
To: Matthew Wilcox <willy@infradead.org>
Cc: linux-mm@kvack.org, cgroups@vger.kernel.org,
	linux-kernel@vger.kernel.org, kernel-team@meta.com,
	akpm@linux-foundation.org, mingo@redhat.com, peterz@infradead.org,
	juri.lelli@redhat.com, vincent.guittot@linaro.org,
	hannes@cmpxchg.org, mhocko@kernel.org, roman.gushchin@linux.dev,
	shakeel.butt@linux.dev, donettom@linux.ibm.com,
	Huang Ying <ying.huang@linux.alibaba.com>,
	Keith Busch <kbusch@meta.com>, Feng Tang <feng.tang@intel.com>,
	Neha Gholkar <nehagholkar@meta.com>
Subject: Re: [RFC PATCH v4 0/6] Promotion of Unmapped Page Cache Folios.
Message-ID: <Z_mvUzIWvCOLoTmX@gourry-fedora-PF4VCD3F>
References: <20250411221111.493193-1-gourry@gourry.net>
 <Z_mqfpfs--Ak8giA@casper.infradead.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Z_mqfpfs--Ak8giA@casper.infradead.org>

On Sat, Apr 12, 2025 at 12:49:18AM +0100, Matthew Wilcox wrote:
> On Fri, Apr 11, 2025 at 06:11:05PM -0400, Gregory Price wrote:
> > Unmapped page cache pages can be demoted to low-tier memory, but
> 
> No.  Page cache should never be demoted to low-tier memory.
> NACK this patchset.

This wasn't a statement of approval page cache being on lower tiers,
it's a statement of fact.  Enabling demotion causes this issue.

~Gregory

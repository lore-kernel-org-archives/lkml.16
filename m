Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 73DC825D213;
	Wed,  9 Apr 2025 08:36:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744187772; cv=none; b=baGj/E5C/3V2bKGdfQjbvB4GWFQJTVVjq38J5bnNXd0OKbzHqLkfd45pCwZ/VOstmC0Ed6zFFNvIbtYOrTIqohszMK4BPMaYEBRMcVR97RVyn3aMGmQmLRuIvgkk6NZZCIB4I4giUHPB5XvCeCSd5lemp/dQX8UROfmzqOePTiE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744187772; c=relaxed/simple;
	bh=AjITk3Md+AG+a9nq5/1M/7k+M+xWBDNKTQp+Pam8Qec=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=AdEQUrCBYr07X2ps3qIqT9iEm7Mq265zSSLsZWC/nr88scapstpbepGjTm5vDD9wALiv2mgUjkstoN/AdlVvIRQLjuzxqoEik4VHA13XqKCYCEgJ2kCqqe0MADmQscLLjbpQWrR6DJvvnO54VTtnSxe+8w2vZOapVyEVxfpfR80=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=jxl4EkcT; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="jxl4EkcT"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A2D8EC4CEE3;
	Wed,  9 Apr 2025 08:35:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744187771;
	bh=AjITk3Md+AG+a9nq5/1M/7k+M+xWBDNKTQp+Pam8Qec=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=jxl4EkcTYBvpu02SHiv4NYKjhRHuI1QV1VXtqxPQ6xmZhA9y0GaGbXlIT3hyEO7S7
	 5viRVWZH4JiIx/RIg+ayZEQEhaWtFgahx62A+n8kZ4DU/nRT9mIhBjmCPfoY4hZ+Yf
	 +4RAFEBv3UpOO5m4cOfJTXaDBDL8ygyC6Du55rytLyi2dvoGXmwMRTZEir/CqwlA62
	 IbcINznr+djTduj1Sy8XSTZEaHL6tM9ze/2nO6qrmacw1KrIyPMyWeKZ1S/vhd1ywP
	 et0eFpvt+49XTr2LuywdEfwAr8kc3vv2m5q6Mxv+lnvokkoxZkglhy0D/BNkW0rWmR
	 ZOpPouY0e55uQ==
Date: Wed, 9 Apr 2025 11:35:55 +0300
From: Mike Rapoport <rppt@kernel.org>
To: Jason Gunthorpe <jgg@nvidia.com>
Cc: Pratyush Yadav <ptyadav@amazon.de>,
	Changyuan Lyu <changyuanl@google.com>, linux-kernel@vger.kernel.org,
	graf@amazon.com, akpm@linux-foundation.org, luto@kernel.org,
	anthony.yznaga@oracle.com, arnd@arndb.de, ashish.kalra@amd.com,
	benh@kernel.crashing.org, bp@alien8.de, catalin.marinas@arm.com,
	dave.hansen@linux.intel.com, dwmw2@infradead.org,
	ebiederm@xmission.com, mingo@redhat.com, jgowans@amazon.com,
	corbet@lwn.net, krzk@kernel.org, mark.rutland@arm.com,
	pbonzini@redhat.com, pasha.tatashin@soleen.com, hpa@zytor.com,
	peterz@infradead.org, robh+dt@kernel.org, robh@kernel.org,
	saravanak@google.com, skinsburskii@linux.microsoft.com,
	rostedt@goodmis.org, tglx@linutronix.de, thomas.lendacky@amd.com,
	usama.arif@bytedance.com, will@kernel.org,
	devicetree@vger.kernel.org, kexec@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org, linux-doc@vger.kernel.org,
	linux-mm@kvack.org, x86@kernel.org
Subject: Re: [PATCH v5 09/16] kexec: enable KHO support for memory
 preservation
Message-ID: <Z_Yxa7fTA70YEe84@kernel.org>
References: <20250320015551.2157511-1-changyuanl@google.com>
 <20250320015551.2157511-10-changyuanl@google.com>
 <mafs01pu9qm6r.fsf@amazon.de>
 <20250403161001.GG342109@nvidia.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250403161001.GG342109@nvidia.com>

On Thu, Apr 03, 2025 at 01:10:01PM -0300, Jason Gunthorpe wrote:
> On Thu, Apr 03, 2025 at 03:50:04PM +0000, Pratyush Yadav wrote:
> 
> > +struct kho_mem_track {
> > +	/* Points to L4 KHOMEM descriptor, each order gets its own table. */
> > +	struct xarray orders;
> > +};
> 
> I think it would be easy to add a 5th level and just use bits 63:57 as
> a 6 bit order. Then you don't need all this stuff either.

Even 4 levels won't work with 16K and 64K pages.
To use tables we'd need to scale the number of levels based on PAGE_SIZE.
 
> Jason

-- 
Sincerely yours,
Mike.

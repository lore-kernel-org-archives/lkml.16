Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C51E1A5BA9
	for <linux-kernel@vger.kernel.org>; Sat, 19 Apr 2025 09:15:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745054112; cv=none; b=CI1DAoRUypLdpwDyi4qQ8NPzu4htQ0qKdr79y1p9H1u5I++J0jADKiL/0CLfadezou+iUasZRMPCrFQEmK79U+zPY6wJgilnOH7qHCfhhqsGVQMUAXhAB+2tjQgpHLeWCiLOz6CZ6xD/Se7+8kRtucgGKUCwYH8zsvSD7NKZq2s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745054112; c=relaxed/simple;
	bh=tRPZjFU4i89dNPQtX+7lxJcCu5OnCKIJKKb/mtN67KE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=RlfcSF3JPHBY2wDww/PtdxRMWmZkAVeM7uXlPCb4RtkBdnTR8G5vEJU1U+esUbADFSKyHfjxtRL+tqHkdyCxQe8uxuWdUCumgq5zoEset9bs3WWeQ6vKOjaircR8oGJql7qlwlnGU2bn2afVu06/YEAfH7tIqo1xB8sI01ybkdM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=BJQOagZR; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="BJQOagZR"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7F3B6C4CEE7;
	Sat, 19 Apr 2025 09:15:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1745054112;
	bh=tRPZjFU4i89dNPQtX+7lxJcCu5OnCKIJKKb/mtN67KE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=BJQOagZRGt76+/qLAtXLSzbw9I/LhUEbod9LIDeQWW2YZypHqh4zK3Bw7HqfO8QTB
	 8ss2caGP8XnuXK1N8SohjIo9dbXgq/HniLoOpIQnBpDEEcxw8lwfsoLmBnYYufkouC
	 9Y03EkiVsU8VVAbYKmx2FeVS7uUm9HabwMKB8AVumUzn/e4ImGElYYKhn/OoPS8ff7
	 mH0b7+uUzmREuc1Kn/vXr2Ip6GUZW0wvlCreMipmUHA0RO7l8+yO9fLJ3PAqafJ6/o
	 rV1t33e3BF5ULZfMWB1NsV5qoglJUo/v8o6VhpmkFXKmm/wtsT82Wgel5KMda3JIm6
	 KrdevWILQqwCQ==
Date: Sat, 19 Apr 2025 14:39:14 +0530
From: Naveen N Rao <naveen@kernel.org>
To: Dan Williams <dan.j.williams@intel.com>
Cc: dave.hansen@linux.intel.com, Ingo Molnar <mingo@kernel.org>, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 1/3] x86/devmem: Remove duplicate range_is_allowed()
 definition
Message-ID: <cj2wnrnu56eyyfwqm2avv6njcwugfoczgoexz3cos6246h2gn5@fywejzmsuvpa>
References: <174433453526.924142.15494575917593543330.stgit@dwillia2-xfh.jf.intel.com>
 <174433454327.924142.13014632539194148381.stgit@dwillia2-xfh.jf.intel.com>
 <s6fek3k3zsgf74yuppzckhcnud67pgfitz66n6uwkky7gvjcpc@rp4pxvie2dpb>
 <6800205d86e73_71fe294e4@dwillia2-xfh.jf.intel.com.notmuch>
 <ucdjz2mytjsndtkoroadd7r7grsi4hwpqd47v752zwo6rn5bg7@a7pq6ah4tdai>
 <680147f6b6411_130fd294c2@dwillia2-mobl3.amr.corp.intel.com.notmuch>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <680147f6b6411_130fd294c2@dwillia2-mobl3.amr.corp.intel.com.notmuch>

On Thu, Apr 17, 2025 at 11:27:02AM -0700, Dan Williams wrote:
> Naveen N Rao wrote:
> [..]
> > > The pat_enabled check was originally added as a *bypass* of additional
> > > logic in phys_mem_access_prot_allowed() [1] to validate that /dev/mem was
> > > establishing compatible mappings of "System-RAM" via /dev/mem. This
> > > patch maintains that expectation that phys_mem_access_prot_allowed()
> > > returns immediately when there is no potential cache conflict.
> > 
> > Thanks for the background, that makes sense.
> > 
> > Do we also no longer need the devmem_is_allowed() checks in pat.c if PAT 
> > is enabled and !CONFIG_STRICT_DEVMEM?
> 
> The only one that is left is the one in phys_mem_access_prot_allowed()
> and that one properly compiles away to nothing in the
> !CONFIG_STRICT_DEVMEM case.

I am probably missing something here, but that's the case I don't fully 
understand. Before this patch, it was not compiling away to nothing, and 
range_is_allowed() in phys_mem_access_prot_allowed() was calling out to 
devmem_is_allowed() when CONFIG_STRICT_DEVMEM was _not_ set.

I'll note that range_is_allowed() implementation in pat/memtype.c is 
exactly the inverse of that in drivers/char/mem.c, with respect to what 
checks were done with and without CONFIG_STRICT_DEVMEM.


Thanks,
Naveen


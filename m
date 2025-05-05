Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3BA4C25CC63
	for <linux-kernel@vger.kernel.org>; Mon,  5 May 2025 14:45:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746456319; cv=none; b=Isq8FVl2HcLhyxUYEZ+LyAtCa0RDA5Xq2GONmfK9rpnv14btzulY+sbI8ElmpRF9tQS1LGfVESrId/NSrD9XVHPT+y4bRsocEYjfct/M2xbbN3zsT4EZI0ahYeWblY6BLU0rnqEZ5bhhn/HnKYglHIgZpioKcqt9ufd0am3YUMs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746456319; c=relaxed/simple;
	bh=pkFlC20PigliMzuRUFGA0SESzgaUvOXprrClUlEshVE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=FNYRY+QJELi1ovpDJjzRKaizsNAxQ0BbENhXXpRrCwBtYiYSaxY9N4GKoZbjWtjAKxo2T8yXStCGL2vRPTNlrofF8QV7wsD6E0KHSYSTmmeFDOngMXdoI/8MPF8Y4VrzcGTjm2rTXS99zBqY3Aj6H7RNUxQyI/gi7lpi6Aej5cM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=aIJeh+9t; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="aIJeh+9t"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 67662C4CEE4;
	Mon,  5 May 2025 14:45:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1746456318;
	bh=pkFlC20PigliMzuRUFGA0SESzgaUvOXprrClUlEshVE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=aIJeh+9tJ+BTHFY0+yfqr0gnOxwJoiaS9k8YaE4hLkD2tPAdkBTuGnQs0fMBCQZBS
	 UJ4+otWWb4zxLl2UxAIL/xnD+M+0Ui+a4HpdxDDb5xSkj4RfJBpNbx1J2+HznHhjsn
	 GNQyf0phVU/1GEXC9ZDb++469S9XDmm4UyShyAcDW3IosxgCQ9HlPnDKXcb4oAVufQ
	 IxNpNQAXU6RYg/hXCIpqcjGyp8jlmZ7pJDYiv1zcJWRlMi1l742a3I9cM06tkYW4Kv
	 r2Rjy1+aH7yfrVb816bJ8KnC4Q+duN4r+sZpc+4BPz6a/NjPgv5eHA8x3G7db3bQi5
	 za2uius648C/A==
Date: Mon, 5 May 2025 16:45:14 +0200
From: Greg Kroah-Hartman <gregkh@kernel.org>
To: Shung-Hsi Yu <shung-hsi.yu@suse.com>
Cc: cve@kernel.org, linux-kernel@vger.kernel.org
Subject: Re: CVE-2023-53076: bpf: Adjust insufficient default bpf_jit_limit
Message-ID: <2025050506-clover-schematic-b174@gregkh>
References: <2025050215-CVE-2023-53076-d1a7@gregkh>
 <txekiviwb3to6dmpx24v7layiwspnsq4v3ycqce6t2huni2goe@25r4mcnexibm>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <txekiviwb3to6dmpx24v7layiwspnsq4v3ycqce6t2huni2goe@25r4mcnexibm>

On Mon, May 05, 2025 at 03:56:51PM +0800, Shung-Hsi Yu wrote:
> On Fri, May 02, 2025 at 05:55:41PM +0200, Greg Kroah-Hartman wrote:
> > From: Greg Kroah-Hartman <gregkh@kernel.org>
> > 
> > Description
> > ===========
> > 
> > In the Linux kernel, the following vulnerability has been resolved:
> > 
> > bpf: Adjust insufficient default bpf_jit_limit
> > 
> > We've seen recent AWS EKS (Kubernetes) user reports like the following:
> > 
> >   After upgrading EKS nodes from v20230203 to v20230217 on our 1.24 EKS
> >   clusters after a few days a number of the nodes have containers stuck
> >   in ContainerCreating state or liveness/readiness probes reporting the
> >   following error:
> > 
> >     Readiness probe errored: rpc error: code = Unknown desc = failed to
> >     exec in container: failed to start exec "4a11039f730203ffc003b7[...]":
> >     OCI runtime exec failed: exec failed: unable to start container process:
> >     unable to init seccomp: error loading seccomp filter into kernel:
> >     error loading seccomp filter: errno 524: unknown
> > 
> >   However, we had not been seeing this issue on previous AMIs and it only
> >   started to occur on v20230217 (following the upgrade from kernel 5.4 to
> >   5.10) with no other changes to the underlying cluster or workloads.
> > 
> >   We tried the suggestions from that issue (sysctl net.core.bpf_jit_limit=452534528)
> >   which helped to immediately allow containers to be created and probes to
> >   execute but after approximately a day the issue returned and the value
> >   returned by cat /proc/vmallocinfo | grep bpf_jit | awk '{s+=$2} END {print s}'
> >   was steadily increasing.
> > 
> > I tested bpf tree to observe bpf_jit_charge_modmem, bpf_jit_uncharge_modmem
> > their sizes passed in as well as bpf_jit_current under tcpdump BPF filter,
> > seccomp BPF and native (e)BPF programs, and the behavior all looks sane
> > and expected, that is nothing "leaking" from an upstream perspective.
> > 
> > The bpf_jit_limit knob was originally added in order to avoid a situation
> > where unprivileged applications loading BPF programs (e.g. seccomp BPF
> > policies) consuming all the module memory space via BPF JIT such that loading
> > of kernel modules would be prevented. The default limit was defined back in
> > 2018 and while good enough back then, we are generally seeing far more BPF
> > consumers today.
> > 
> > Adjust the limit for the BPF JIT pool from originally 1/4 to now 1/2 of the
> > module memory space to better reflect today's needs and avoid more users
> > running into potentially hard to debug issues.
> > 
> > The Linux kernel CVE team has assigned CVE-2023-53076 to this issue.
> 
> I'd like to dispute this CVE.
> 
> The fix here is raising the (sysadmin adjustable) default of
> net.core.bpf_jit_limit to 50% of the module memory space from 25%
> before. It does not seem to have security implications on the Linux
> kernel side.

Thanks for the review, now rejected.

greg k-h

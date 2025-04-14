Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D50DDDDC
	for <linux-kernel@vger.kernel.org>; Mon, 14 Apr 2025 17:01:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744650084; cv=none; b=JLNfz5i2IsB+pFQNxQv94HxpG/rld/kmRmKQMq07FY7gFSq/YyKfn6cDc7ywJSiXtsNYeEf9+ujmPaVZ2eyJVFSzdqzQTt3KaM6kipvnmOWa5SAbHDu2PpxTG7JaUTCQIcRZtAmQyFfIO3HPgDcFBbGEs38F8r9+l6i0uGKD+rg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744650084; c=relaxed/simple;
	bh=y+wfoJzEyVaSAo4G2pKEEmEPsRWprK53Dfe1vl5oZPc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=WmvGQMOopnQMn1/iXIE9QmxboQuMAE5VeGygrt9MKIXcUB8M4a5Itdkqc/H/xSy4CXmrN+krI0LNqV46/2WHJ28LCa0pnP/12onFQR48ZSdnRCmPXx1V89VUWHJLTeSX5OTnSfwhD/rHAMGMEgKQwLXPGXOFMdwo1r2hekKjmc4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=JgYJDb8y; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="JgYJDb8y"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A74C7C4CEE2;
	Mon, 14 Apr 2025 17:01:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744650083;
	bh=y+wfoJzEyVaSAo4G2pKEEmEPsRWprK53Dfe1vl5oZPc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=JgYJDb8yqThenSGTz9My9T1qcprCCkKQbux9yLisueQl9aB7ESNkG9/gjaK0OaLJc
	 h0Wv8ghvz5+F9Bm+ARKb+Uy5SjCQl6d4ydJ0XtjbeMMWDZcsdBAsu2m0yxfycR08lf
	 oBLKlUdUkhtJ6ZULWDfUGBxQ47X7ysNVmuOtu6WMl4+6JQCGwBpgujwddn/emKXzNz
	 tnyzrW7c1oJlcnBb6NRR1oMr8Oruaw7PFK1h1wqjb0gorXiEe3ZWBic/EKHzAqUvvk
	 774+fmsup7/bGnw2jnPV5jbM5wDSADOcspwFHLLkMOTHBn/2z4DELdHG1Gnou6GkAW
	 P1uantNrJRbDw==
Date: Mon, 14 Apr 2025 07:01:22 -1000
From: Tejun Heo <tj@kernel.org>
To: yangsonghua <jluyangsonghua@gmail.com>
Cc: void@manifault.com, arighi@nvidia.com, changwoo@igalia.com,
	linux-kernel@vger.kernel.org, sched-ext@meta.com,
	yangsonghua <yangsonghua@lixiang.com>
Subject: Re: [PATCH v1] sched_ext: Improve cross-compilation support in
 Makefile
Message-ID: <Z_0_YsO2P4nM7LXM@slm.duckdns.org>
References: <20250414081436.2574882-1-yangsonghua@lixiang.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250414081436.2574882-1-yangsonghua@lixiang.com>

On Mon, Apr 14, 2025 at 04:14:36PM +0800, yangsonghua wrote:
> Modify the tools/sched_ext/Makefile to better handle cross-compilation
> environments by:
> 
> 1. Fix host tools build directory structure by separating obj/ from output
>    (HOST_BUILD_DIR now points to $(OBJ_DIR)/host/obj)
> 2. Properly propagate CROSS_COMPILE to libbpf sub-make invocation
> 3. Add missing $(HOST_BPFOBJ) build rule with proper host toolchain flags
>    (ARCH=, CROSS_COMPILE=, explicit HOSTCC/HOSTLD)
> 4. Consistently quote $(HOSTCC) in bpftool build rule
> 5. Change LDFLAGS assignment to += to allow external extensions
> 
> The changes ensure proper cross-compilation behavior while maintaining
> backward compatibility with native builds. Host tools are now correctly
> built with the host toolchain while target binaries use the cross-toolchain.
> 
> Signed-off-by: yangsonghua <yangsonghua@lixiang.com>

Doesn't break native builds at least. I take your words that this improves
cross-builds. Applied to sched_ext/for-6.16.

Thanks.

-- 
tejun

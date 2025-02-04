Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A38A722611
	for <linux-kernel@vger.kernel.org>; Tue,  4 Feb 2025 00:45:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738629918; cv=none; b=ruy/sviCSeU3+ZjK/tq6NdoFtOJV6aSbQo5EH3urHHvyLHLmcgtg5S2YISt8uvMNXgk/Dt1o0HtvGjLl7+2adGEkWLU6Lde0Yv3BNYsO806qTDbDkAUjFXyvHuRnzrAczcGWiYfh8BHXSKrtB+Iec1jmHFAzuYndUVSqX4ITVlE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738629918; c=relaxed/simple;
	bh=A0rjhvSOiZUmnfOLb7upCNUVXijGJrOY4TISM58dlck=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=QmFT2fzPtT9Ihvlpx2qt8A2YYpVcATwSNaliiuMIyr6hQpGOJdSV3a2Qny2am3+cePL6aXDUQfyHthvoo1WkufhKbNkroSz+/ecaj1ETPMgF037Z9PeOxLNS4hiU6ra6BzpYDl+OPtOydCUO5ihOI3f5DsftoLKCLBYFl8SDMqI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=DP5jN4EE; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="DP5jN4EE"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B8E88C4CEE0;
	Tue,  4 Feb 2025 00:45:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1738629916;
	bh=A0rjhvSOiZUmnfOLb7upCNUVXijGJrOY4TISM58dlck=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=DP5jN4EElTHLOJDlkekMRlGP9tBXVvLQFPsNxdq798lTDoM4Zk5r6V69NIBJnwpA2
	 oOBLV6m6bXntXtCGPVxlLfAfTOzn6j5ayeL+gPp3f0Js9l+RgmFn+8WLG5mET2SgB5
	 faZKJDb6pJUdslQTJmBRG6r8E4DqdSTg3ezv4cU35Co8LQs8aMxyd1/yH2rfVHgBUi
	 osoMqsVpKEkpKJTLSr0ER8v3dk3TPUBmHHqM/PARw78LDDZ3+BX6afWckHPKtaOYex
	 a/dh5+zOBuzuyC7PthJyn6s0aslaUYYCmfCXm/qCkPfBxCLdvbytSDXHROCOfHgY2k
	 JK4QTi4KEgDgQ==
Date: Tue, 4 Feb 2025 01:45:13 +0100
From: Frederic Weisbecker <frederic@kernel.org>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: linux-kernel@vger.kernel.org
Subject: Re: [PATCH v1 1/1] kthread: Return the assigned value rather than 0
Message-ID: <Z6FjGV1-CxE12f8L@pavilion.home>
References: <20250203164855.3699026-1-andriy.shevchenko@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250203164855.3699026-1-andriy.shevchenko@linux.intel.com>

Le Mon, Feb 03, 2025 at 06:48:55PM +0200, Andy Shevchenko a écrit :
> Recently introduced kthread_affine_preferred() has a bug that the value
> of ret variable set but not used. This breaks the compilation with error
> (assume default CONFIG_WERROR=y and `make W=1` to run the build):
> 
> kernel/kthread.c:862:6: error: variable 'ret' set but not used [-Werror,-Wunused-but-set-variable]
> 
> Fixes: 4d13f4304fa4 ("kthread: Implement preferred affinity")
> Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>

Thanks but I already have it queued there:

https://git.kernel.org/pub/scm/linux/kernel/git/frederic/linux-dynticks.git/commit/?h=kthread/fixes&id=1b0332a42656b798bea867631d739de023633ec6

I'll do a pull request shortly.

Thanks!

Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 495412BEFE1
	for <linux-kernel@vger.kernel.org>; Mon, 16 Jun 2025 18:02:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750096934; cv=none; b=XrnyUOkz6qojr+wLsUDR5JnR2kM+lAxax4G7gmifcPihoLXTrXujoyCDIouTeGxBDWPRyQPQ4LMH3NnfS3Svv81mXrLfCZqby32ZTG8G4GStpXkFBC8/n74lt03dk657Jy7BtbGTGtWUSKBC/skR4SMAXVzCf4RopJtNP8gdVnw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750096934; c=relaxed/simple;
	bh=55p3yaDH4zetEcMgEAa9WJ2xkPsr5vXShzo2OgD5dtk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Qryjdhx/tV1+bbhKGFD31QTIgUXXwgnu62uW/kPUCmu7euf9xHP9NoLMpnbM6Usm8iM4zUa8gobXbVVmQ/UVJx8Sr/WEt7B0et1OqhrEPh0g+awiZEOIHDIoOTGcBwH69CutHrhysJiztrp0hZBAtUSMER43/6FkoL/+9PfrqPA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Sfc/U1SD; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Sfc/U1SD"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A227AC4CEEA;
	Mon, 16 Jun 2025 18:02:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1750096933;
	bh=55p3yaDH4zetEcMgEAa9WJ2xkPsr5vXShzo2OgD5dtk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Sfc/U1SDTN/oLi0nSDdKQGfb4g1rBSxAePcAraMlKB56C6I8eWAagvxtVhB4cjXAO
	 Sd7IH9gOwwPCQmyksREtOh/6vSkFcu+TM/HeC+30ossrXjGSGCFFjRDYq4PxZOM+e8
	 Z4jZkjeQe6plZtRhpR7tXsZpKcZ4XArsVzDej63DNVwOnOHPx3BgYPp8s2cO0T1cRy
	 VYYjwgBE20xZzSOKF2s4LvrZNuwNuhdyVDeIQ4n0MhIb0LXX2wAD0Vc1l39CaDpLE8
	 h/yE8xyenPWkFM5jmR/kce7rbDB1ic7kBR1KJOX1e4L+fUVaS37X/kzvK1PNPAuy/W
	 1UoGV8X9txvVA==
Date: Mon, 16 Jun 2025 08:02:07 -1000
From: Tejun Heo <tj@kernel.org>
To: Kent Overstreet <kent.overstreet@linux.dev>
Cc: linux-kernel@vger.kernel.org, Lai Jiangshan <jiangshanlai@gmail.com>
Subject: Re: [PATCH] workqueue: Basic memory allocation profiling support
Message-ID: <aFBcH3vUmkaZwjyj@slm.duckdns.org>
References: <20250616175920.34858-1-kent.overstreet@linux.dev>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250616175920.34858-1-kent.overstreet@linux.dev>

On Mon, Jun 16, 2025 at 01:59:20PM -0400, Kent Overstreet wrote:
> Hook alloc_workqueue and alloc_workqueue_attrs() so that they're
> accounted to the callsite. Since we're doing allocations on behalf of
> another subsystem, this helps when using memory allocation profiling to
> check for leaks.
> 
> Cc: Tejun Heo <tj@kernel.org>
> Cc: Lai Jiangshan <jiangshanlai@gmail.com>
> Signed-off-by: Kent Overstreet <kent.overstreet@linux.dev>

Applied to wq/for-6.17.

Thanks.

-- 
tejun

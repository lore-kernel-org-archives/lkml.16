Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D017721019E;
	Tue,  1 Jul 2025 07:20:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751354433; cv=none; b=gNqGCWig0Nu6+FzaH7xdSquMSnXxCj4qrMspjrnmxjAVTFj/zkIk3njiZ2vshrBZsFHXXL3ifqffOLu6U2t4AGPmLkfEtiitGjbkmyAgOu6RAJUnde1EXm874pD2SPXy8JSZhDJkzQJJDNApmtTv0y6gcTOLg3hNlEXTytLaTBQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751354433; c=relaxed/simple;
	bh=xoJlJq3UmIDAD9e5v19NSnRBXYkBfCcxuYbY1MCCtnc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Qo1X1KKS99TTNo+v9L/vtm0zeZlWSbrd5vTwki345qMrrNQzXe91vyTySbQmv6vF8rLBflrtId/lJlCMtljS1cP3S/Z5mRxB+p1oI+zkD+j1xneLLRBTpCsQurxG80NPiB41vbtqRUK6fnUt6JRAnq94Q3hjDZHuOjRHbDzpT44=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=H9aem4Pe; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="H9aem4Pe"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8BDB7C4CEEB;
	Tue,  1 Jul 2025 07:20:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1751354433;
	bh=xoJlJq3UmIDAD9e5v19NSnRBXYkBfCcxuYbY1MCCtnc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=H9aem4Pe4788lwlBBBHYy3C9Rh+ct75f8wOp28C3zxFwhkOu3EErE7z8FadefYRds
	 S7iZKRy2xppryDUiyseB0xKhcO0l7tptXJ9yaGjB/rx3EJqJkPLJMupgOAGfBr9TFY
	 4fSW3Sa1is/SSmf/N4qQdNOLAeRef8R5sMvGQsHLU6HGMhyk7Bo8oqgFqhGYCwx/X8
	 yzZ6QIM2SbHgGKb+rH80gAraoyNgZZz3Ldek/yJZrswIwEIo1WJKfArjk+zRyz/e1K
	 uICOhCYGEJWHf4DoKDikDmtAsrOfZBk4JZ554BsMIrmVY/CLvIPHTp7c65usWsy68S
	 0l2+yliMpWAgA==
Date: Tue, 1 Jul 2025 07:20:30 +0000
From: Tzung-Bi Shih <tzungbi@kernel.org>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: chrome-platform@lists.linux.dev, linux-kernel@vger.kernel.org,
	Benson Leung <bleung@chromium.org>
Subject: Re: [PATCH v1 1/1] platform/chrome: chromeos_laptop - replace open
 coded variant of DEFINE_RES_IRQ()
Message-ID: <aGOMPmy1UloEyOC5@google.com>
References: <20250630101745.1855918-1-andriy.shevchenko@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250630101745.1855918-1-andriy.shevchenko@linux.intel.com>

On Mon, Jun 30, 2025 at 01:17:45PM +0300, Andy Shevchenko wrote:
> DEFINE_RES_*() are compound literals, and hence no need to do that explicitly.
> Besides that, we have no IRQ name provided, no need to use _NAMED() variant.
> Replace open coded variant of DEFINE_RES_IRQ().
> No functional changes intended.
> 
> [...]

Applied to

    https://git.kernel.org/pub/scm/linux/kernel/git/chrome-platform/linux.git for-next

[1/1] platform/chrome: chromeos_laptop - replace open coded variant of DEFINE_RES_IRQ()
      commit: 5af89b6309417bdc2ff6835509d33a172c4a3218

Thanks!

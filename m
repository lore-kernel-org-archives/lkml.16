Received: from verein.lst.de (verein.lst.de [213.95.11.211])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1903A2E49AF
	for <linux-kernel@vger.kernel.org>; Thu,  3 Jul 2025 11:47:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.95.11.211
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751543223; cv=none; b=IWNxhQFbURrI+JAN3VVr3AHcF651uzmd4hVLMoWAvAQtZXL9DIwoPjiBBa/J3WCoze3GW1GHbtXlbRBujed9d6DHgpDQH1XmpzxlSfNYvdf8MNGre8NHaGpcu+53TX8azTzQIa8pano2A0iwscqH6lSf/yY2vJqUEqQg4/a+/v0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751543223; c=relaxed/simple;
	bh=1xHI6At6cLO4wS8iXtLRHSGcPHBDbmxfqiti6EDE5Us=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=m+TCb9mS5EwuwC7uwEV5vPMDHHWd44YxB6yx7GkE01och9o1V8QcjjKsT/gOlSplv1JVAzB/CfdMmK+ts4cs5jTRfqUaLEak2/1Kqc+QzR90vMDtDqubguplPVbWcBRGIzFE4sdCaLS39+FQtU9sc+DfQLA0uUjVeZf2j6OUsKg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lst.de; spf=pass smtp.mailfrom=lst.de; arc=none smtp.client-ip=213.95.11.211
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lst.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lst.de
Received: by verein.lst.de (Postfix, from userid 2407)
	id E6C9F67373; Thu,  3 Jul 2025 13:46:56 +0200 (CEST)
Date: Thu, 3 Jul 2025 13:46:56 +0200
From: Christoph Hellwig <hch@lst.de>
To: Stuart Hayes <stuart.w.hayes@gmail.com>
Cc: linux-kernel@vger.kernel.org,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	"Rafael J . Wysocki" <rafael@kernel.org>,
	Martin Belanger <Martin.Belanger@dell.com>,
	Oliver O'Halloran <oohall@gmail.com>,
	Daniel Wagner <dwagner@suse.de>, Keith Busch <kbusch@kernel.org>,
	Lukas Wunner <lukas@wunner.de>, David Jeffery <djeffery@redhat.com>,
	Jeremy Allison <jallison@ciq.com>, Jens Axboe <axboe@fb.com>,
	Christoph Hellwig <hch@lst.de>, Sagi Grimberg <sagi@grimberg.me>,
	linux-nvme@lists.infradead.org,
	Nathan Chancellor <nathan@kernel.org>,
	Jan Kiszka <jan.kiszka@seimens.com>,
	Bert Karwatzki <spasswolf@web.de>
Subject: Re: [PATCH v10 0/5] shut down devices asynchronously
Message-ID: <20250703114656.GE17686@lst.de>
References: <20250625201853.84062-1-stuart.w.hayes@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250625201853.84062-1-stuart.w.hayes@gmail.com>
User-Agent: Mutt/1.5.17 (2007-11-01)

On Wed, Jun 25, 2025 at 03:18:48PM -0500, Stuart Hayes wrote:
> Address resource and timing issues when spawning a unique async thread
> for every device during shutdown:
>   * Make the asynchronous threads able to shut down multiple devices,
>     instead of spawning a unique thread for every device.
>   * Modify core kernel async code with a custom wake function so it
>     doesn't wake up threads waiting to synchronize every time the cookie
>     changes

Given all these thread spawning issues, why can't we just go back
to the approach that kicks off shutdown asynchronously and then waits
for it without spawning all these threads?


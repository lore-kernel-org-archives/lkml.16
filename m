Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 776A11BD035
	for <linux-kernel@vger.kernel.org>; Wed,  2 Jul 2025 18:16:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751480179; cv=none; b=KN49O79edBsgDT02hxTjQvrY+VLVpdePzxUN6wldUwwSYLridfop35RXGqvJZUbiKLTNpRNMnctEeZdZ0nLgtbQcF/QwU9OrAq9pl3IhO4fVYiMIH2Az48hVl5rr76TnvlDMrt64Kjkq3KXcb6SdVo89qksmqN6nSSp5Zj4ll3A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751480179; c=relaxed/simple;
	bh=oxFk8nBtUpnr9ArALYj2G+HiGhqQz+KjsgoenrQgazk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=mV+uhjJQCSsTDmt3o3v/pa5FLAXiCmIiXDd1noSmbxGWTCnHGBkvNBWpYSxd0KPxlEUmKTMiU5gcx/x45+nlg+/jyIc1QOupDSJKmjl9V9XD4jbEOmnCYa7T73ceJyg1fV9b1G2Q47oomZoBOJLa17A2RvrI4imcpHeBr1/5EJA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=cUfp+p6P; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="cUfp+p6P"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5A13FC4CEE7;
	Wed,  2 Jul 2025 18:16:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1751480179;
	bh=oxFk8nBtUpnr9ArALYj2G+HiGhqQz+KjsgoenrQgazk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=cUfp+p6P8NkfOomLDeaOO1AYQfc7YgF5501e/lvU0J7pig7nGbHZS9CvA+gskzaKS
	 nlsSw9g+STdIRBpwhVlFiwK/GSEAa8sT878lTIWuTlLaIG2P4TrzT/JgJ9W4KVctLc
	 ux7l+sovWqx0qglJyVKhBG6q04DR2h83ccHtFTyB4Unzc4r+YszEyZlrY7SMCKxZrr
	 b/xk7Q9exyIzLLZknrip/QxXaEOZOwJIXb1WTO3s1MRlrQsC0qjT70EVL3nv4NLFRI
	 UKaCmljRiWHmQXnuPoy9POHvKOgO6CMp/Mi++G3UU4N+kYL5gVjYx5tGMsnGSBBDfU
	 nsXCAZICxxUeA==
Date: Wed, 2 Jul 2025 20:16:14 +0200
From: Andi Shyti <andi.shyti@kernel.org>
To: Jani Nikula <jani.nikula@intel.com>
Cc: linux-kernel@vger.kernel.org, intel-gfx@lists.freedesktop.org, 
	Thomas Gleixner <tglx@linutronix.de>, Geert Uytterhoeven <geert+renesas@glider.be>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Subject: Re: [PATCH] iopoll: use fsleep() instead of usleep_range()
Message-ID: <2axg64hx4qjg3hvk27du4yifoojpemkzht2kuxzecuggomrbyv@difktc36et6m>
References: <20250626145119.2048423-1-jani.nikula@intel.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250626145119.2048423-1-jani.nikula@intel.com>

Hi Jani,

On Thu, Jun 26, 2025 at 05:51:19PM +0300, Jani Nikula wrote:
> Sometimes it's necessary to poll with long sleeps, and the accuracy of
> usleep_range() is overkill. Use the flexible sleep helper fsleep() for
> sleeping in the read_poll_timeout() family of macros to automatically
> choose the appropriate method of waiting.
> 
> Functionally there are a few consequences for existing users:
> 
> - 10 us and shorter sleeps will use usleep() instead of
>   usleep_range(). Presumably this will not be an issue.
> 
> - When it leads to a slack of less than 25%, msleep() will be used
>   instead of usleep_range(). Presumably this will not be an issue, given
>   the sleeps will be longer in this case.
> 
> - Otherwise, the usleep_range() slack gets switched from the begin of
>   the range to the end of the range, i.e. [sleep/2+1..sleep] ->
>   [sleep..sleep+sleep/2]. In theory, this could be an issue in some
>   cases, but difficult to determine before this hits the real world.
> 
> Signed-off-by: Jani Nikula <jani.nikula@intel.com>

this patch makes sense to me even with the fixes in the commit
message suggested byt Geert.

Reviewed-by: Andi Shyti <andi.shyti@kernel.org>

Andi

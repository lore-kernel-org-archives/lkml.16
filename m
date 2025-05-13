Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 382F51CD0C;
	Tue, 13 May 2025 19:20:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747164014; cv=none; b=U3cJUjFNYXAxFiTe5A9FlDp0k+PyMTOycU4eTYj8rLUGWE4DJr/HsP6EZnxkdvIW9sj3s3td1VHSk2qJUMhyPBmO8FjKJUWZmj2Q7DAIe386XrfQHxn0jqy5WgB1C4xDdS6cL2FDxjsI55+reKX/GgWpzd7cSE+9BkfBwWGl7vA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747164014; c=relaxed/simple;
	bh=ZnLOoS27sdK+Mlwph7QExZ4ehQ/aHVimOBKPY5zoIuU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=X/8RGY4Sm97KWnPTMtSkTPOx8pTRunQfOoXsFw1GUlrQSEVjn7jY5Iu0xNxCQIFjH5XeTid0UFXJMdX9BObPbAhAFYGdhNvJ0wOoR1lV3KC97U2tpLMbuMX4eDY+jb+F7BKG+SZ78nwuLr4kueY/DwzuLzk0W1bv1feg13abGg8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=MPetmWik; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="MPetmWik"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 72EEEC4CEE4;
	Tue, 13 May 2025 19:20:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747164013;
	bh=ZnLOoS27sdK+Mlwph7QExZ4ehQ/aHVimOBKPY5zoIuU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=MPetmWikHAN2b+/fFAvHXmUT2aSKNj9g9sNpPwmzXVOmnFkVkTL/kknp8BlRLHwNu
	 BsSoXJTz21ToHBKssH/KhTAXuXmgC35e7VekJHYRRi8H1dp+Cv9Gnt2qwgZM0uvvVx
	 f+FcFeiRpAClgu6GCtj+AYbcJBVNPFWxwdPeLxiH9VorLzXBtAbmsmydy6N0BZll7h
	 gaCySDo/NfpCHCzXhCQJwWLS+VYBdc/elKB5weQ9yLo+7fhQME7W+1NeqlhrtQcsJz
	 rakBP9bg8/NdkFyPmn6zYM6CJ5rHM02TTqVHiPt50xGGHCNoN4Rj+DTQ3EO2kzoufZ
	 N53up4I+rfTKA==
Date: Tue, 13 May 2025 15:20:11 -0400
From: Tejun Heo <tj@kernel.org>
To: Jake Rice <jake@jakerice.dev>
Cc: corbet@lwn.net, linux-doc@vger.kernel.org, arighi@nvidia.com,
	changwoo@igalia.com, ggherdovich@suse.com, me@mostlynerdless.de,
	ake@jakerice.dev, abovard@linux.ibm.com, devaanshk840@gmail.com,
	cengiz@kernel.wtf, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] Documentation: scheduler: Changed lowercase acronyms to
 uppercase
Message-ID: <aCOba-bx3GPemhI7@mtj.duckdns.org>
References: <20250513170344.3621-1-jake@jakerice.dev>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250513170344.3621-1-jake@jakerice.dev>

On Tue, May 13, 2025 at 01:03:44PM -0400, Jake Rice wrote:
> Everywhere else in this doc, the dispatch queue acronym (DSQ) is
> uppercase. There were a couple places where the acronym was written in
> lowercase. I changed them to uppercase to make it homogeneous.
> 
> Signed-off-by: Jake Rice <jake@jakerice.dev>

Applied to sched_ext/for-6.16.

Thanks.

-- 
tejun

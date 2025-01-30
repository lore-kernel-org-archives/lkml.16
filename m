Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 126698831
	for <linux-kernel@vger.kernel.org>; Thu, 30 Jan 2025 20:31:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738269061; cv=none; b=WnexUQA2zYSIYOsBawhCJLmlrUyJiDuG+sGfZAuZrvJ9lnM/Zy7bvizuVvViwLpomDQHTb/WYu2/8zrvpc6EdcQPT0dgpEaLncjZudzVzYTjF4av8Wl0+avkbUJvViWFyV9q1I7U3ZMb3ChbTi5KpQjO5WNWo/S2kyT2EyTkdgU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738269061; c=relaxed/simple;
	bh=joz7gwdslTvgmRS2oZYGRROuB3LlOQuhD5H6itBlqHY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=DmgbCnNpO7e5fCn2MmCkjKTwJUOtFTH420p+OGCx7EGP5z37CXXEwXQyQWp7Yu3wIPJm5wcwQE4vjsGjqv/tUKVK4ptyT4IpdYUYrb1sMh3YlsEzuiktEWpWZa986y9dHXITGJXb2jx1Hw6S69z4xuyuzcXlodW686mez5XwW8w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=EZYAbOj5; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="EZYAbOj5"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6205BC4CED2;
	Thu, 30 Jan 2025 20:31:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1738269060;
	bh=joz7gwdslTvgmRS2oZYGRROuB3LlOQuhD5H6itBlqHY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=EZYAbOj5qowAI4EUsMeyKMjh20Jjg+P1UaaeqE6dwgJtDFAqYyXRyqwa4B08GvVct
	 YZWEEik8cbCUwXMPFSejjT1Xeclim0NoezSFngYVPRBfbYnqSYuRJt84p/c0XAL8uQ
	 fF7pE/H/roU2PUB537kst8SpAE7oUQidRcVIKyjY=
Date: Thu, 30 Jan 2025 15:30:59 -0500
From: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
To: Yazen Ghannam <yazen.ghannam@amd.com>
Cc: tools@kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] b4: Include git notes when generating patches
Message-ID: <20250130-rich-orangutan-from-eldorado-04f621@lemur>
References: <20250130201331.73584-1-yazen.ghannam@amd.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250130201331.73584-1-yazen.ghannam@amd.com>

On Thu, Jan 30, 2025 at 08:13:31PM +0000, Yazen Ghannam wrote:
> By default, 'git show' will include git notes in its output. However,
> this is not the case if '--format', or related flags, are given.
> 
> Include the '--notes' flag to include git notes in the generated patch.

I'd love to do that, but git-filter-repo currently doesn't do the right thing
with notes, so anyone who starts to rely on notes will find that they are
easily lost with most common b4 operations. There's a long-standing RFE to
support notes with git-filter-repo:

https://github.com/newren/git-filter-repo/issues/22

Until that happens, I really don't want to pretend that we support notes,
because this will result in bad experiences for most who try it.

-K

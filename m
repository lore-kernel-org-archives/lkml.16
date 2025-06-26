Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 120DE2609DD
	for <linux-kernel@vger.kernel.org>; Thu, 26 Jun 2025 22:09:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750975768; cv=none; b=N5hamJKCSYc68uOcJ1dkn9vswi8OW0RzRay94Bymt/ibIiQGPPyLiMLfRlLyGs4gZlgnjcrTihaBvXu7l2JD6RM+Me6uJ1fhSh3bAE1fMVZpmj9p/cD0wo71LmA9S+Mjh0j8/BXgSaFEaBBJ6qLgTXbPlcQHpcpbiLINTZfGHG4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750975768; c=relaxed/simple;
	bh=wA0FhQHQiWi3ivGzLrWwDMmWH0OnP8zZKrUoKb1FcSY=;
	h=Date:From:To:Cc:Subject:Message-Id:In-Reply-To:References:
	 Mime-Version:Content-Type; b=JUJlv7GJD0P0tyzfzYq2VZsEF/6lG2Zv7/uSwiREx1v+NELUuBA2DaK5tXuaLxgEVQCJoE603YR4/s2VbduaHKIumMLlet8Xozg1/DMsPPvWGlLvcrCUHgfkFqci3PPbv+HdlXmFadLPsUqC5aeMiQZcKjkQSutpf3YmrY47VIM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b=DZNfclQ9; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="DZNfclQ9"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 492B5C4CEEB;
	Thu, 26 Jun 2025 22:09:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linux-foundation.org;
	s=korg; t=1750975767;
	bh=wA0FhQHQiWi3ivGzLrWwDMmWH0OnP8zZKrUoKb1FcSY=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=DZNfclQ992Fd6ILMundy98sv14cmiEZpFNic+ZVzdbsrDC3sFl6ncVEaX8nnFW9HI
	 sTKuVEOHd2BGCx2p5HGtLFGwYdO8/t6XsVXOU/wRwTgOEA0YjrSrKHOKPigeyh/wz7
	 l00p+dSqX+Sw5K7Ga+KH+FJ9ilRkiLAOl340g9tw=
Date: Thu, 26 Jun 2025 15:09:26 -0700
From: Andrew Morton <akpm@linux-foundation.org>
To: Florian Fainelli <florian.fainelli@broadcom.com>
Cc: Illia Ostapyshyn <illia@yshyn.com>, jack@suse.cz,
 jan.kiszka@siemens.com, jlayton@kernel.org, kbingham@kernel.org,
 linux-kernel@vger.kernel.org, viro@zeniv.linux.org.uk
Subject: Re: [PATCH] scripts/gdb: Fix dentry_name() lookup
Message-Id: <20250626150926.2653ed11d267b366c26e1651@linux-foundation.org>
In-Reply-To: <afda0ce3-d824-4a4e-9b91-58e57e649aa0@broadcom.com>
References: <87pleq4ete.fsf@yshyn.com>
	<afda0ce3-d824-4a4e-9b91-58e57e649aa0@broadcom.com>
X-Mailer: Sylpheed 3.7.0 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Thu, 26 Jun 2025 10:19:25 -0700 Florian Fainelli <florian.fainelli@broadcom.com> wrote:

> Hi Illia,
> 
> On 6/26/25 10:01, Illia Ostapyshyn wrote:
> > Hi Florian,
> > 
> > I have previously submitted (and resent due to inactivity) an equivalent
> > patch here:
> > 
> > https://lore.kernel.org/all/20250428142117.3455683-1-illia@yshyn.com/
> > https://lore.kernel.org/all/20250525213709.878287-2-illia@yshyn.com/
> 
> Ah my bad, I had not seen your submission, then it should be taken 
> instead of mine, but with the Fixes: tag added so that your patch can 
> get back ported to stable trees.
> 
> > 
> > However, looks like d_shortname is not suitable for entries with name
> > longer than D_NAME_INLINE_LEN characters.  Although this matches the
> > previous behavior of the GDB script (before 58cf9c383c5c68666808), I was
> > planning to resubmit a v2 that addresses this issue as well.
> 
> Sure, please do! Andrew can you drop my patch in favor of Illia's when 
> it shows up?

I've moved your "scripts/gdb: Fix dentry_name() lookup" into mm.git's
non-rebasing mm-hotfixes-stable branch in preparation for upstreaming
today or tomorrow.  So I'd prefer not to mess with it now.

Illia, can you please propose your fix against a tree which contains
Florian's patch?

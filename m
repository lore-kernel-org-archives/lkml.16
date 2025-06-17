Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6DC572E9ED9
	for <linux-kernel@vger.kernel.org>; Tue, 17 Jun 2025 18:09:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750183779; cv=none; b=XUUyrAMz4jLR2QWXV5jFjYfdv5XWJA5neAWKOs+0+dkPskmdXppfxKriwafbsjq7DCTUA/XaAc8XtMotosfTOv2MlszuHRBnCzcOetNR2kBb6Mf2VUFuRtxOjkuTdPk0puHqgUFY1tHDxbR2JV0g4KBIgnGBTkuez5Im/W+2Fls=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750183779; c=relaxed/simple;
	bh=nZYqAWDytvS+0LQwGh1wwaatc6b3/h7nEo7rW1y5/iU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Bx8B1QD0ZdRHRCKOayypML6KtHoCGk+ZQEx2RS5tocV6mtCxnWE+0KWi4QI1PaE9SLbC1i3eBrpB7aFLZdewC/7A3eOU9KWNBNIrKfhJNAQ6qETysGG1NXl6zLgC7cAKUFFYhg6ahfXKGRSr7ioT4TNEoTgiGeAKVpg5MI5DqKk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=OvvRYre+; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="OvvRYre+"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9D3D2C4CEE7;
	Tue, 17 Jun 2025 18:09:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1750183778;
	bh=nZYqAWDytvS+0LQwGh1wwaatc6b3/h7nEo7rW1y5/iU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=OvvRYre+qAMBvIB3I/O8ihgQB5ioRWRKIZVJSZVwo65GjQNK3HqY8Pb85KjyeYFgr
	 Uu9D7DvekBxJyuDDg5tZiPf6JwoLZWjaWezBomvzLaEnlKUYxjjyOVFYlj3MFon/u5
	 g5J1QYxYulI269Y+E0J8h/rR0De81luyiyxDAfYVj8uRgC/dFJZF3HrSFBPd925Bd4
	 FIZqf+be2HsYlN0gOq8P7YQ3sT0QUM8jpqLYMgX1XROfmcTp6CVTlKiv5yj5tQ3A/7
	 c3sOGkOyWvuBi8uxUyEhglriK93/3R46C7SiUdMwE7czmAgLzMD2QMFuCfptWeNHqJ
	 tndxwNWOUi7fw==
Date: Tue, 17 Jun 2025 11:09:37 -0700
From: Luis Chamberlain <mcgrof@kernel.org>
To: Swarna Prabhu <sw.prabhu6@gmail.com>
Cc: jaegeuk@kernel.org, chao@kernel.org,
	linux-f2fs-devel@lists.sourceforge.net,
	linux-kernel@vger.kernel.org, Swarna Prabhu <s.prabhu@samsung.com>,
	gost.dev@samsung.com
Subject: Re: [PATCH] f2fs: Fix the typos in comments
Message-ID: <aFGvYWE19kztdhQy@bombadil.infradead.org>
References: <20250617174047.1511951-1-s.prabhu@samsung.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250617174047.1511951-1-s.prabhu@samsung.com>

On Tue, Jun 17, 2025 at 05:40:47PM +0000, Swarna Prabhu wrote:
> This patch fixes minor typos in comments in f2fs.
> 
> Signed-off-by: Swarna Prabhu <s.prabhu@samsung.com>

Reviewed-by: Luis Chamberlain <mcgrof@kernel.org>

  Luis

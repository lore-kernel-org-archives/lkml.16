Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B7931E2843;
	Tue,  8 Apr 2025 21:56:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744149376; cv=none; b=eMDvfWAVhpeqXc45ZyvOunyCziqWjrNPOUEMs2QDhXtDFf9VLZT2U1OQiewBFmN93CivHY651TcN3vZPAar1bjgLbyeKtTsjlZQ9eVEu/uyqJ31muO+FXxwr5nYIiaCTDce9XXSc9Bsw+Jr5As8nIRPUa8QSWk2mzxvGlhkNH8Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744149376; c=relaxed/simple;
	bh=OTZrr+zk1sHLCa1IYfnHV4rS71qGoOP4KYZHUFdAbco=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=s8ewyY9Vs5G+ZW/VyBo/qxBRB3ke2DdDC94xSMM5V+OuISYTCYie6Q62XilAg7V+PEfY39C1eD2RlcQmpIsUYG/AeBgDLOQziUZhZdJf9QyhLF3o72ijctPvmL+z5H9PMKu6AAVE5vjpaaDJgFJsGmuONpthvi1c46yd6RhZ4n8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=IlQyI0FK; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="IlQyI0FK"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C7DE3C4CEE5;
	Tue,  8 Apr 2025 21:56:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744149374;
	bh=OTZrr+zk1sHLCa1IYfnHV4rS71qGoOP4KYZHUFdAbco=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=IlQyI0FKNPRPp7/aXA4fkERdNYSc+09TXkoLf1rg0P7MISrmluByVwaJi9wy04ErW
	 A1iIeu3i6l5BKEodhDvt60zc0j1/YG/BZvCo597dGXM8bjnDDryM/ekjsmp5kI3/Ze
	 TqOPEUJ3b1yB++So+1hlqDvprb6c8ceNjrvJfjqFHMg95RGyxBMOcAFtNC53TgoASD
	 K/Tgd+bBBngSmX6CKgSI1HHl1Fzi6Zz1a4gwHfRoODKuvInAsjYLOXzYTp7W2/FZDq
	 HntaMDvptwwmtSn3clnodsbBGG30a+5M/dqCS2322RlyY1yx/b3HHrKNyueVLM1n5P
	 VPg7tQ1QQ6t1Q==
Date: Tue, 8 Apr 2025 14:56:11 -0700
From: Kees Cook <kees@kernel.org>
To: Aditya Garg <gargaditya08@live.com>
Cc: alyssa@rosenzweig.io, Petr Mladek <pmladek@suse.com>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Sven Peter <sven@svenpeter.dev>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	Aun-Ali Zaidi <admin@kodeit.net>,
	Maxime Ripard <mripard@kernel.org>, airlied@redhat.com,
	Simona Vetter <simona@ffwll.ch>,
	Steven Rostedt <rostedt@goodmis.org>,
	Rasmus Villemoes <linux@rasmusvillemoes.dk>,
	Sergey Senozhatsky <senozhatsky@chromium.org>,
	Jonathan Corbet <corbet@lwn.net>,
	Andrew Morton <akpm@linux-foundation.org>, apw@canonical.com,
	joe@perches.com, dwaipayanray1@gmail.com, lukas.bulwahn@gmail.com,
	tamird@gmail.com,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	dri-devel@lists.freedesktop.org, linux-doc@vger.kernel.org,
	Hector Martin <marcan@marcan.st>,
	Asahi Linux Mailing List <asahi@lists.linux.dev>
Subject: Re: [PATCH v4 2/3] printf: add tests for generic FourCCs
Message-ID: <202504081456.745ECB546@keescook>
References: <PN3PR01MB9597382EFDE3452410A866AEB8B52@PN3PR01MB9597.INDPRD01.PROD.OUTLOOK.COM>
 <PN3PR01MB95973AF4F6262B2D1996FB25B8B52@PN3PR01MB9597.INDPRD01.PROD.OUTLOOK.COM>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <PN3PR01MB95973AF4F6262B2D1996FB25B8B52@PN3PR01MB9597.INDPRD01.PROD.OUTLOOK.COM>

On Tue, Apr 08, 2025 at 12:18:32PM +0530, Aditya Garg wrote:
> From: Aditya Garg <gargaditya08@live.com>
> 
> This patch adds support for kunit tests of generic 32-bit FourCCs added to
> vsprintf.
> 
> Acked-by: Tamir Duberstein <tamird@gmail.com>
> Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> Reviewed-by: Petr Mladek <pmladek@suse.com>
> Tested-by: Petr Mladek <pmladek@suse.com>
> Signed-off-by: Aditya Garg <gargaditya08@live.com>

Reviewed-by: Kees Cook <kees@kernel.org>

-- 
Kees Cook

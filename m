Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D4605276046;
	Tue, 29 Apr 2025 06:16:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745907367; cv=none; b=pcu8g8/hkgmxA7q1D/hBy8c1UtPSk9Vx3SCO7HO3qUd42lv56lnmUyaLtsol/kCmlgaH8LFAcWTNm7Ro1/XM5AJqtURPgEY++++aETA4iVPfhxa4JMIzMLMtJ1Un2bwjSTw5zmTjid7nXUe9h7HKxilHFAcZKqWbZ9+KUE4AzlM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745907367; c=relaxed/simple;
	bh=oyeXyN7fnpjRZjowKm5X0d/XENf9UP5i7hKi/3hn5bQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=PuN59QRBXdgURsiVkl0YU3SZzgxLUftYkvkFYKSFtFIYwoivzl8765trR2EKtbJ9JTGppg+jLzRJ9Hfir7MnDXMTMdBiwp2MLj8AwOOhKWDeXxJURfhgFEm9L9+Cj6EcjrESF8Htj63uVylrlondwylxXxMYNYZcYs9rWgFoUCg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=WqYlT4kR; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="WqYlT4kR"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B982FC4CEE9;
	Tue, 29 Apr 2025 06:16:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1745907367;
	bh=oyeXyN7fnpjRZjowKm5X0d/XENf9UP5i7hKi/3hn5bQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=WqYlT4kRH9qmHpwzLGbxsr7NANEuuxo8ITxvw/K6IU7gkIVg3nNgiUCmHoRmWOSov
	 qJz0EQYq+e9fjczGjcBg7kfOUM66HxFx9nkWcDR3C/UzifUgGakr2yrGl6fWQhOtj1
	 uxUMzDt4Np/CjXCycbqnithkwajYtt52GC9daMqiUmXPnrJDlZklotZBTAWbB3S0Q/
	 NZD33Tb/BBTwKh1kr7KooEEridwO6S2sKVwfzs7I3M2kWfKeJfPF7qV8FkFsUdjHQk
	 XmHikRR0/KazWE6WYrJEaFBEdiUPdap1wGiNYvs4Xcds14N7LbqRzv9msxp6L4auAe
	 LmK6bkyGPH+TA==
Date: Tue, 29 Apr 2025 08:16:02 +0200
From: Andi Shyti <andi.shyti@kernel.org>
To: Dan Carpenter <dan.carpenter@linaro.org>
Cc: Romain Gantois <romain.gantois@bootlin.com>, 
	Arnd Bergmann <arnd@arndb.de>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Linus Walleij <linus.walleij@linaro.org>, Wolfram Sang <wsa+renesas@sang-engineering.com>, 
	linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org
Subject: Re: [PATCH next] misc: ti_fpc202: Fix off by one in probe()
Message-ID: <krkppjdlgtcc7h7pg4e7vvwe46hu44jv2cngp3g63dx55rrbdb@frztorpfnfdf>
References: <aAijRtGLzKLdwP0-@stanley.mountain>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aAijRtGLzKLdwP0-@stanley.mountain>

Hi Dan,

On Wed, Apr 23, 2025 at 11:22:30AM +0300, Dan Carpenter wrote:
> The "port_id" is used as an array index into the struct fpc202_priv
> priv->addr_caches[] array in fpc202_write_dev_addr().  It's a 2 by 2
> array so if "port_id" is FPC202_NUM_PORTS (2) then it's one element
> out of bounds.  Change the > to >= to fix this bug.
> 
> Fixes: 1e5c9b1efa1c ("misc: add FPC202 dual port controller driver")
> Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>

Reviewed-by: Andi Shyti <andi.shyti@kernel.org>

Thanks,
Andi

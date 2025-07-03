Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 920652E7BBE;
	Thu,  3 Jul 2025 14:55:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751554521; cv=none; b=R0sJjHRpz5NRkQWDXfdnTLB1eYkXl3NYBjbdOmVCp2NOVCgERv0/0k1xo1XJ4/o/aZIzh0DoHPIUu/O28EKg54QCHm2vUeGyDurpDNPVnFofX2ePyTrzXupC5PDv7RNFBOuwbdPPqHK9moWonQKK75ASNHkCuE4qYAuUSAC4/n4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751554521; c=relaxed/simple;
	bh=yVxzr3PNGth5JEoi2Plh9yJruRMND7JhqUpImBzkY24=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=HMoL4/aIXEpafucnMOp6V3htL3XePNCKVFY7BCt0lXwEsjDu6YIJmtsG9mRIWit6y5WLSy80chh40oSQz+cWVhYOse73CZZRzTDOMz++YgmzCguzwfJUNLa0hQNP89L5V88wWKu8gdUbDJly4yCLUVF9gTSwMjCkO//zrNqeyIg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=RB2NXqSb; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="RB2NXqSb"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C8645C4CEEE;
	Thu,  3 Jul 2025 14:55:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1751554521;
	bh=yVxzr3PNGth5JEoi2Plh9yJruRMND7JhqUpImBzkY24=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=RB2NXqSbQ1EK/5tn9seLOZVKmjb5s5dYcNKHNmGLCXifJRsjnUvRMr9vx4v4gtW7B
	 l4g1g0W3KCg4b4HWk7/SIGcSvl8genmL8Fqc3SIQ/I1xmeyJMlMixJ3fv5biQ0OZ+h
	 kpAatRdw66ZV/2PxD9JT9PZXytbAroima0w66HZ1aYSt2OT1O1RvdSdFuc7T7cXiWa
	 0wJnC80kOZNVUkice6QX+R+woBLdeeHeLNXoQmgRzX5SVcilzhp2HnSnOxXPi0m35f
	 SQLZ0A21dQ5m4lgowwGcTYG54rIWbYpEhKTuEeAJO4CY3ogvM5H81AlE6wDcZrfMaJ
	 Xp0FI1BgVBz+Q==
From: Pratyush Yadav <pratyush@kernel.org>
To: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Cc: Tudor Ambarus <tudor.ambarus@linaro.org>,  Pratyush Yadav
 <pratyush@kernel.org>,  Michael Walle <mwalle@kernel.org>,  Miquel Raynal
 <miquel.raynal@bootlin.com>,  Richard Weinberger <richard@nod.at>,
  Vignesh Raghavendra <vigneshr@ti.com>,  linux-kernel@vger.kernel.org,
  kernel-janitors@vger.kernel.org,  linux-mtd@lists.infradead.org
Subject: Re: [PATCH] mtd: spi-nor: Constify struct spi_nor_fixups
In-Reply-To: <aa641732ba707ce3690217825c3ca7373ffde4f9.1748191985.git.christophe.jaillet@wanadoo.fr>
References: <aa641732ba707ce3690217825c3ca7373ffde4f9.1748191985.git.christophe.jaillet@wanadoo.fr>
Date: Thu, 03 Jul 2025 16:55:18 +0200
Message-ID: <mafs0o6u11fzd.fsf@kernel.org>
User-Agent: Gnus/5.13 (Gnus v5.13)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

On Sun, May 25 2025, Christophe JAILLET wrote:

> 'struct spi_nor_fixups' are not modified in this driver.
>
> Constifying these structures moves some data to a read-only section, so
> increases overall security, especially when the structure holds some
> function pointers.
>
> On a x86_64, with allmodconfig, as an example:
> Before:
> ======
>    text	   data	    bss	    dec	    hex	filename
>   23304	  13168	      0	  36472	   8e78	drivers/mtd/spi-nor/micron-st.o
>
> After:
> =====
>    text	   data	    bss	    dec	    hex	filename
>   23560	  12912	      0	  36472	   8e78	drivers/mtd/spi-nor/micron-st.o
>
> Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>

Applied to spi-nor/next. Thanks!
[...]

-- 
Regards,
Pratyush Yadav

Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA60B21766A;
	Thu, 19 Jun 2025 12:00:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750334438; cv=none; b=EvREYaqn4g6qtLSr7xdat3CAC5i7yHEHgJ4DZSd9rjoSy0YZ1zTBhc4N3xV0IXn8CkrZsPPHF35Nmer+aav7xRggUqy4JCTliQLqneQal0YTmgrnDllTyVvHMLep9CYlXBnwF2sn9fO/BsaoWpD1NwuH6Ku3WBYULJKZ+R3V8MI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750334438; c=relaxed/simple;
	bh=kmCqW5koqCl29E0W/fJKehqsVTLiCvKw5nrbHBBT3MA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=pxii+IjoMXSn4paoW+Kfbzl510ZOHISUpZlaIbXyauNsd+AoScj1GIfEpweMh5zXnDMpR/bBGp37zN77CKuucoW9f9OFeBU4Bio4ycwQzg/Hx7nhqAWigyt8U4vtWUQ2JevfF7tbr8jRYByn8XatuIkWGRjwHgvLf+ieULXrXCc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=H+T/SKZ4; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="H+T/SKZ4"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 51E4BC4CEEA;
	Thu, 19 Jun 2025 12:00:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1750334437;
	bh=kmCqW5koqCl29E0W/fJKehqsVTLiCvKw5nrbHBBT3MA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=H+T/SKZ48wC6gWxtyPrr5Z6zfkaAhPl8e5IFiAMJ9Ihxiq1Os2TF4bi1KPZ+CUs/F
	 k/5Bb73FcWYP+cB6xlFbr8bT2TZatwTiSka3Ih1TjHeVh2E6PY6wUWVN6lLzQ2pBUF
	 0IpdfFyNZbpypMYEX9GTvHK/Y//8i5ai89cm7TXNHByRMQtN2c4rPotjWZe0N66j0y
	 d8ignNCpJJWuoopaU52z8F5vJuDoNzml8AiN2tLGYSfOU0mD9PRf9p+c219afidALM
	 7f6u9aB6B0meip24Jzn4BrKepDfxadYvRBGV8LQ2DSQ5nbtumark/8rBh6C79C+p4T
	 vO2l7RHhhGu0g==
Date: Thu, 19 Jun 2025 13:00:33 +0100
From: Lee Jones <lee@kernel.org>
To: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Cc: Matti Vaittinen <mazziesaccount@gmail.com>,
	linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org
Subject: Re: [PATCH] mfd: rohm-bd71828: Constify some structures
Message-ID: <20250619120033.GM587864@google.com>
References: <d56bac346e94ac91df16a775c59092d1b60efabd.1750005148.git.christophe.jaillet@wanadoo.fr>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <d56bac346e94ac91df16a775c59092d1b60efabd.1750005148.git.christophe.jaillet@wanadoo.fr>

On Sun, 15 Jun 2025, Christophe JAILLET wrote:

> Several structures are not modified in this driver. Constifying them moves
> some data to a read-only section, so increases overall security, especially
> when the structure holds some function pointers. This is the case for
> 'gpio_keys_platform_data' and 'mfd_cell'.
> 
> On a x86_64, with allmodconfig:
> Before:
> ======
>    text	   data	    bss	    dec	    hex	filename
>   18161	  14112	    192	  32465	   7ed1	drivers/mfd/rohm-bd71828.o
> 
> After:
> =====
>    text	   data	    bss	    dec	    hex	filename
>   22897	   9376	    192	  32465	   7ed1	drivers/mfd/rohm-bd71828.o
> 
> Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
> ---
> Compile tested only
> ---
>  drivers/mfd/rohm-bd71828.c | 12 ++++++------
>  1 file changed, 6 insertions(+), 6 deletions(-)

Doesn't apply.  Please rebase and resubmit.

-- 
Lee Jones [李琼斯]

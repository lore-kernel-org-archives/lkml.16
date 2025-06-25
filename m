Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 941781DE8A3;
	Wed, 25 Jun 2025 10:12:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750846374; cv=none; b=YfgX96AsDD6QdBKx/BCFYOKWAw4SNhjWE1Nj6WPLIBF3iyEPo26GGz8dFp30lOvgTFoZF9zKXUc8al9ocbzr6glfJylXwOyiWQfEdwWZW1fAn/8TwI8Y9W3hG4vw1zPSCy58nW2kGGzblDsvNw0BJyycEdPY6mCztCjvGPH1ijE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750846374; c=relaxed/simple;
	bh=eR0q+RNjFITK9YCpEg9fBMwnAYg3EaVMIJOV9Zmw3uA=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=eFZbTFZf6onfvpTXA2K4Q1tH5WUUDQu57sPLuk0NMKBba2HLV0e+eoEjteG108ThIQRx8Hu4cZ+Gj9deFfDaUCybhk0tHmNLoTcPqeXUdfoyawz0OqBj/UATYQZpyP6h9Y8OrEup+LHyDq76BCWlHOBjrVgMyz6FqqPq6C12kx4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Wt6bqGxg; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Wt6bqGxg"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 395E1C4CEEA;
	Wed, 25 Jun 2025 10:12:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1750846374;
	bh=eR0q+RNjFITK9YCpEg9fBMwnAYg3EaVMIJOV9Zmw3uA=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=Wt6bqGxgEM9AK914Ib+/cqaATn6qRbr0DhFZlohg/V6DezycPprn/XFVR3daLJ1fS
	 FXO9owsM6qALErI+XjdfoKxANx6RHiEUGyJ894Jd2Z4XOM9uVwuEtw9Glx1V2A7Pm+
	 AT7pwa0oCGpjTC9Fs4nD/XhK+jiclQYgr0IiYGr4tI+ikukrWVyUOcNNbxWFd2Y5iO
	 FTI4CgaNISLjyqFS6MmxNESvAcFUdaw1+1hV6F9kXscFIezbpAjfjr6uXzB/keoh/j
	 haxOl5q6vwnHTHw/jxnMuVT/kemtSBhEyWGzQGWeEmfRCUYRUureaOB9Ir/OiA9/E3
	 DEeyZ5dDJ2a/w==
From: Lee Jones <lee@kernel.org>
To: Matti Vaittinen <mazziesaccount@gmail.com>, Lee Jones <lee@kernel.org>, 
 Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Cc: linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org
In-Reply-To: <d56bac346e94ac91df16a775c59092d1b60efabd.1750005148.git.christophe.jaillet@wanadoo.fr>
References: <d56bac346e94ac91df16a775c59092d1b60efabd.1750005148.git.christophe.jaillet@wanadoo.fr>
Subject: Re: (subset) [PATCH] mfd: rohm-bd71828: Constify some structures
Message-Id: <175084637296.4142064.14602531767494530713.b4-ty@kernel.org>
Date: Wed, 25 Jun 2025 11:12:52 +0100
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailer: b4 0.15-dev-c81fc

On Sun, 15 Jun 2025 18:32:48 +0200, Christophe JAILLET wrote:
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
> [...]

Applied, thanks!

[1/1] mfd: rohm-bd71828: Constify some structures
      commit: e905ffecc34f66c35c9d3209fe5b111686adc28a

--
Lee Jones [李琼斯]


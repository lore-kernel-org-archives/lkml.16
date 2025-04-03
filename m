Received: from codeconstruct.com.au (pi.codeconstruct.com.au [203.29.241.158])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3338E161320
	for <linux-kernel@vger.kernel.org>; Thu,  3 Apr 2025 10:15:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=203.29.241.158
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743675312; cv=none; b=kjcrS24dw9BuhbN4bAffC7AFPnrxBh/QkiRTisk8/kglWl9w7xjjx8owBXN5Ph1GbapRGYgvBs+zSYyC9jUkqSQVIPxrUjc2DnHRj/DUyy0V5CV2Y1YgaZFryRf+Iy7U+WSHfd3UKprtKXS1CstkH7WAeXtSX0WGo6kABGatQps=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743675312; c=relaxed/simple;
	bh=CgmRsmfV33I34HRiNVAxfQq1MT+kLTnChjl3TE5IwAw=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=lPynSKFh4GD4ZvqhWicKWfianP6UOCY78/3MB122lj++DmZMEA9moRyt3UTOVaaA3RZYoXDqLKPtjB1w+dsPXRPjMaRjYkh31DgeBYGsSVECw34jLnI/IVN7U4UuSYLKQ4mquPECI+IG57lso4sGPFc1YTmc+eBI1YIkveB5InY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=codeconstruct.com.au; spf=pass smtp.mailfrom=codeconstruct.com.au; dkim=pass (2048-bit key) header.d=codeconstruct.com.au header.i=@codeconstruct.com.au header.b=YjHebHiX; arc=none smtp.client-ip=203.29.241.158
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=codeconstruct.com.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=codeconstruct.com.au
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=codeconstruct.com.au header.i=@codeconstruct.com.au header.b="YjHebHiX"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=codeconstruct.com.au; s=2022a; t=1743675301;
	bh=6YiZPdINyfjJtYAnZKaHv2MfxtG1OcVQesKXKvaLIoc=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=YjHebHiXBKcucM1B5xCxyF7McIWBWvSfR7Oy71lKvde+bw0b5DyjcJdXoFNMkJpM7
	 wguVnfH/FpNTX4NRS5O57Kbq+qf0TiNvMDMPioOwjHzmtoidj5Iv74hr0rK7f1I8HR
	 mfbilxoenBUuSg7fD+YGMLG1g2aTCjGoOMCDu0NpHAuhVyYrrG6qc8JEqEzZxgQts6
	 /aUil5JOL9KdckyutnY5QCssgu29OKMSu9+Aj+2vbU/WtAV76DCPb7Flw+y5vg7Xdz
	 OQubU3vZ3QkC349Yojaye8/QLM8F3LRkXt1iYoeqJ2b8gx7XIkX9aowLewqg4VOurN
	 hTmFaKjc9s+dA==
Received: from [127.0.1.1] (unknown [180.150.112.225])
	by mail.codeconstruct.com.au (Postfix) with ESMTPSA id B6C8A7C3B3;
	Thu,  3 Apr 2025 18:14:56 +0800 (AWST)
From: Andrew Jeffery <andrew@codeconstruct.com.au>
To: joel@jms.id.au, gsomlo@gmail.com, heiko@sntech.de, arnd@arndb.de, 
 herve.codina@bootlin.com, andersson@kernel.org, 
 u.kleine-koenig@baylibre.com, Henry Martin <bsdhenrymartin@gmail.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-aspeed@lists.ozlabs.org, 
 linux-kernel@vger.kernel.org
In-Reply-To: <20250401074647.21300-1-bsdhenrymartin@gmail.com>
References: <20250401074647.21300-1-bsdhenrymartin@gmail.com>
Subject: Re: [PATCH v4] soc: aspeed: Add NULL check in
 aspeed_lpc_enable_snoop()
Message-Id: <174367530124.3067819.2690843491529168690.b4-ty@codeconstruct.com.au>
Date: Thu, 03 Apr 2025 20:45:01 +1030
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.2

On Tue, 01 Apr 2025 15:46:47 +0800, Henry Martin wrote:
> devm_kasprintf() returns NULL when memory allocation fails. Currently,
> aspeed_lpc_enable_snoop() does not check for this case, which results in a
> NULL pointer dereference.
> 
> Add NULL check after devm_kasprintf() to prevent this issue.
> 
> 
> [...]

Thanks, I've applied this to be picked up through the BMC tree.

--
Andrew Jeffery <andrew@codeconstruct.com.au>


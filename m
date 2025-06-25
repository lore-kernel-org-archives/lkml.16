Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9381620FAA4
	for <linux-kernel@vger.kernel.org>; Wed, 25 Jun 2025 07:24:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750836284; cv=none; b=U3iVNWnTF93VDioKAr1OJv9xCXLljbqvqoUPcdnDqS1neuGYpkddjj6RN7jaEwOO0fRvZULM9vqnv5DsG9gC6aiA9O+s0YTUIh+UbQqB+LvyuF1OaxkDQn/c4+8JhT6uesHU4izZ67OTH8rWVMdrjbjFv2ymED9rgZq+zS/3knM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750836284; c=relaxed/simple;
	bh=qhN1UUSl63XETtxz+7AGzOvR07vI9zg47yrrINIT7jc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=P1K31aNQctptOHFpPHSoGTzuDiLfxScrW1mfq4pdfoVJlJbOAZTeXDECYeuY7tzvT3MyvDMRQ5NJATjRt+crpMH8U8tpyCOpz77kx6I1guQcAD/gs01HhoEJhJY0Ph6gPlEv+rQK7UKLi8bzwtTb9TQTYm7RRW0bYyorh9UZ89c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=VbmHt3id; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="VbmHt3id"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=date:from:to:cc:subject:message-id
	:references:mime-version:content-type:in-reply-to; s=k1; bh=MLJl
	vS1NYlAualqI0oHpBIgHQbEqKXUY7ozSMzJTQbk=; b=VbmHt3idv9W79G89I1GB
	pf8XYyhneEZ1NZOQuidiP1CrV4mEZfwIsWeIEhidf6tO103Lny0+nqvPTt87Mf/e
	Bm5n9/94HCWMpLbtyAMM+ZNUGhomITrKXHJYYxtshJusEFsDJVP+gSGq/SrZ4DeU
	6tjptG3XUdtSrZPrsQcF0aihf86k2irlC1b2IoIgjhcDGZ0r37ApNWOn4zIR2W37
	h2RQDL+PTDgkh2vA0+laIaw2T3awp4rZSgQ+lYtNuButoqkHtJ23UG3C866Vw+Ig
	pVYFXXxEV79m4urlhyg/xEISrBxMTw/fW06nhtHBgobzC7HkE7UDQcR8+0avUyXq
	nw==
Received: (qmail 547131 invoked from network); 25 Jun 2025 09:24:37 +0200
Received: by mail.zeus03.de with UTF8SMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 25 Jun 2025 09:24:37 +0200
X-UD-Smtp-Session: l3s3148p1@NZddVmA4gOFtKLNf
Date: Wed, 25 Jun 2025 09:24:37 +0200
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: Jorge Marques <jorge.marques@analog.com>
Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Frank Li <Frank.Li@nxp.com>,
	=?utf-8?Q?Przemys=C5=82aw?= Gaj <pgaj@cadence.com>,
	linux-i3c@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 1/3] i3c: master: Add inline i3c_readl_fifo() and
 i3c_writel_fifo()
Message-ID: <aFukNGMgZyKGlCvN@shikoro>
References: <20250624-i3c-writesl-readsl-v3-0-63ccf0870f01@analog.com>
 <20250624-i3c-writesl-readsl-v3-1-63ccf0870f01@analog.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250624-i3c-writesl-readsl-v3-1-63ccf0870f01@analog.com>

On Tue, Jun 24, 2025 at 11:06:04AM +0200, Jorge Marques wrote:
> The I3C abstraction expects u8 buffers, but some controllers operate with
> a 32-bit bus width FIFO and cannot flag valid bytes individually. To avoid
> reading or writing outside the buffer bounds, use 32-bit accesses where
> possible and apply memcpy for any remaining bytes
> 
> Signed-off-by: Jorge Marques <jorge.marques@analog.com>

As per [1]:
Suggested-by: Wolfram Sang <wsa+renesas@sang-engineering.com>

My concern is rejected, and the rest looks good to me, so:
Reviewed-by: Wolfram Sang <wsa+renesas@sang-engineering.com>

It still works nicely with the Renesas driver:
Tested-by: Wolfram Sang <wsa+renesas@sang-engineering.com>

[1] https://lore.kernel.org/r/20250611093934.4208-5-wsa+renesas@sang-engineering.com

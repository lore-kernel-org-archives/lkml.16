Received: from bayard.4d2.org (bayard.4d2.org [155.254.16.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 238C41BB6BA;
	Sat, 19 Apr 2025 09:43:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=155.254.16.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745055794; cv=none; b=BOIF2effXCbjLMGxYcMYXV8a/StgGq4whfZCVfQmn19ywUmPEZQnq3QgAZu/PE/3KVcfdRkIaaKW2PxWHpqpXq44puM8AybNPIpATLrOKCrYivD1ugBxQ7t/6f7RiNaZZxk9zwRCKt3fFL2tuBnrcW8X7L28Yd6X28YRPtofQj8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745055794; c=relaxed/simple;
	bh=TOBj/1ChDvQnz19HxGfDD7N1HbsUAezNiKIuArHitj0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=LHft8G3V38+uEnRBTkktkDyB7iMr4NS4S6FwhmHzELkMQfE+4jq9/JXG1lOGKOTgwRmGJezmQqELarZVd7VqfBX1Ij4dCb9tx+19EobkihO9hSTEDIwcItszTpdyNzuDQud63xBGg7Noj7Xeo9vPM6a8QfXSYIB2mmDcX1ZemvY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=4d2.org; spf=pass smtp.mailfrom=4d2.org; dkim=pass (2048-bit key) header.d=4d2.org header.i=@4d2.org header.b=bNiPjR1W; dkim=pass (2048-bit key) header.d=4d2.org header.i=@4d2.org header.b=wr5TvnpU; arc=none smtp.client-ip=155.254.16.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=4d2.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=4d2.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=4d2.org header.i=@4d2.org header.b="bNiPjR1W";
	dkim=pass (2048-bit key) header.d=4d2.org header.i=@4d2.org header.b="wr5TvnpU"
Received: from bayard.4d2.org (bayard.4d2.org [127.0.0.1])
	by bayard.4d2.org (Postfix) with ESMTP id 509B812FB42D;
	Sat, 19 Apr 2025 02:43:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=4d2.org; s=mail;
	t=1745055784; bh=TOBj/1ChDvQnz19HxGfDD7N1HbsUAezNiKIuArHitj0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=bNiPjR1WKT0/qO+GEwYV3ti6DJ49pPMOi+jbfO3N4GODOi6p9j7inA8FOc4vLpH0j
	 dASyRqNb9Ps//zuysI/icCS/35r1suh21OW8Dyvi8U21b3KGu1skl21hqr4nujNhPS
	 fK9kkNKbisx1GGZYD8p4g7ufqTrBNPrBtKILL4eq7aALULnaYuBWd+BO0x+S2h2jez
	 rtx7zRUEblW9Qo3MFEJWNC343Bx4N7zSpd+K5ngRlq4ZRV2f8iuKnD6hmFl25XlTwZ
	 PpufaHD2LZCRWQ+IeSezOZCOTVJxXre1ccd4tqIENSw4w+pgSMXBeWSOltGEziruhb
	 b5TXUlIq0VYXQ==
X-Virus-Scanned: amavisd-new at 4d2.org
Received: from bayard.4d2.org ([127.0.0.1])
 by bayard.4d2.org (bayard.4d2.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 0FlYzok8K45B; Sat, 19 Apr 2025 02:42:58 -0700 (PDT)
Received: from ketchup (unknown [183.217.80.191])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: heylenay@4d2.org)
	by bayard.4d2.org (Postfix) with ESMTPSA id 45D7A12FB42F;
	Sat, 19 Apr 2025 02:42:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=4d2.org; s=mail;
	t=1745055778; bh=TOBj/1ChDvQnz19HxGfDD7N1HbsUAezNiKIuArHitj0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=wr5TvnpUG18QOtD4HGV0Oi94la5waO52Jiofd6Nl/C7t150TDDWF6P9nogJSy4wwj
	 QO0Vc3/weoQtsh5XMDhY4DECXbfbUA+1utkqvvQDj/xIjvytH7eVGMIA5ULw8bHZ9D
	 5O36SRf6xhB+L2cBZmyEscMyH4QVLxuQyD/fmiUYr+x5l8Hy26AE9rq7c93CKU902Q
	 5MjNu38Nw76QU2Wffp/kIgzp6yDLwAbpEE0RVOrkOiq3D1AViAx2VqFwkPKhZJtY7y
	 KxSnacvzI3AEoySjQZZYh/o50y+d5G/kQ1Wksix/r4ixg2HdLakYBjozgfRqCVuCGv
	 R9ImEj7ciEC8A==
Date: Sat, 19 Apr 2025 09:42:49 +0000
From: Haylen Chu <heylenay@4d2.org>
To: Yixun Lan <dlan@gentoo.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>
Cc: Alex Elder <elder@riscstar.com>, devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org, spacemit@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 0/2] riscv: dts: spacemit: Add clocks to pinctrl and UART
Message-ID: <aANwGZCIpMcd47IB@ketchup>
References: <20250419-05-dts-clock-v1-0-1cce5d59aba2@gentoo.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250419-05-dts-clock-v1-0-1cce5d59aba2@gentoo.org>

On Sat, Apr 19, 2025 at 11:32:29AM +0800, Yixun Lan wrote:
> Populate clock property for pinctrl and UART controller.
> 
> The pinctrl's clock dt-binding patch is still waiting to be merged[1].
> 
> The UART's dt-binding and driver code has already been accepted[2],
> so we now are only sending the DT part patch.
> 
> These two patches are abased on SpacemiT SoC tree's for-next branch[3]
> 
> Link: https://lore.kernel.org/r/20250416-02-k1-pinctrl-clk-v2-0-2b5fcbd4183c@gentoo.org [1]
> Link: https://git.kernel.org/pub/scm/linux/kernel/git/gregkh/tty.git/log/?h=tty-next [2]
> Link: https://github.com/spacemit-com/linux/tree/for-next [3]
> Signed-off-by: Yixun Lan <dlan@gentoo.org>

Generally this looks good to me, but I realized that splitting the
commit that introduces clock controllers and the one that correctly
fills clock properties for various peripherals may cause bisectable
issues, i.e. the UART won't function with only the clock controller
introduced and no clk_ignore_unused specified on commandline.

If this isn't really a problem, for the whole series,

Reviewed-by: Haylen Chu <heylenay@4d2.org>

> ---
> Yixun Lan (2):
>       riscv: dts: spacemit: Acquire clocks for pinctrl
>       riscv: dts: spacemit: Acquire clocks for UART
> 
>  arch/riscv/boot/dts/spacemit/k1.dtsi | 39 +++++++++++++++++++++++++++---------
>  1 file changed, 30 insertions(+), 9 deletions(-)
> ---
> base-commit: 279d51ad9f6dc0c667f6f141a669b2c921277d1a
> change-id: 20250419-05-dts-clock-026bfca75e5b
> 
> Best regards,
> -- 
> Yixun Lan
> 

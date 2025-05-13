Received: from bayard.4d2.org (bayard.4d2.org [155.254.16.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E80DC1F92A;
	Tue, 13 May 2025 05:01:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=155.254.16.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747112522; cv=none; b=KyLNTKqBKuH8lXoUf1Dq+pxxu4NuQiAoxKAcuZl1zW9HCydIKqgx7hldS0DlfBYM3Rwl7pQtYDVt38W4UOG7pF3Fr/som8gKO+4ghJKdGw61V0M2mcyFv4ZCxFeIYsWrGqAIZtvoe6yEEBtO3BuHQSLKz5DoM5gY5wTGHreWkP0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747112522; c=relaxed/simple;
	bh=+bxIO1TVXDAaN1B8C3jo1UC1Eipqnd36X95ZaU0RUig=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Z6RKiz3dbpbCMhbn0qrMxOqrhvd38+Y+xrZs7HmR1EWtnYPqIcBMRQe4nPxH6v9apJqkgY/xTnB5/ZgLJ5zs/IliUF/ZTz7Ix4MN++el30RZiil0rwVftMCvwWcOy3/6cy4RsaUzNlvRP0IRNq055/ze0r5eh8GRzDTKeDW3rZs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=4d2.org; spf=pass smtp.mailfrom=4d2.org; dkim=pass (2048-bit key) header.d=4d2.org header.i=@4d2.org header.b=h/kWoT6+; dkim=pass (2048-bit key) header.d=4d2.org header.i=@4d2.org header.b=m3auRpyZ; arc=none smtp.client-ip=155.254.16.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=4d2.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=4d2.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=4d2.org header.i=@4d2.org header.b="h/kWoT6+";
	dkim=pass (2048-bit key) header.d=4d2.org header.i=@4d2.org header.b="m3auRpyZ"
Received: from bayard.4d2.org (bayard.4d2.org [127.0.0.1])
	by bayard.4d2.org (Postfix) with ESMTP id DD6E312FB43C;
	Mon, 12 May 2025 22:01:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=4d2.org; s=mail;
	t=1747112512; bh=+bxIO1TVXDAaN1B8C3jo1UC1Eipqnd36X95ZaU0RUig=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=h/kWoT6+6lxuUSEFhgRknbBr309/qqIzCW2azuz5gLZ2rw3J5YV7WPTb/uJeF67WJ
	 KEgjj5GEUo3ih1OSVWQEFvIHGrKIUvkedwjR2NorNmTImLdGNM+wAQ2xQOSPp2z3/m
	 M/FmXVY1MwcxYQXrpFQ6eLLCr0kQWYULojparMGqbK5e1fCDxJcGQxTVM8ZG88OHPd
	 /gVsfd9W/JWtDzzD+Bd5hMZiSY8sa91QRhzbywWPld0Rud6giXXr9NiHVZ7Z1KEDYR
	 DXL7MLQCx8rZqd3nF8GKqnjpeLSfNIprL3sRyqs2wXrCisfGWABmoLkxFhH36sGe/l
	 zMHb+6Ps+hkcw==
X-Virus-Scanned: amavisd-new at 4d2.org
Received: from bayard.4d2.org ([127.0.0.1])
 by bayard.4d2.org (bayard.4d2.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id W4uJWQCw1BHG; Mon, 12 May 2025 22:01:18 -0700 (PDT)
Received: from ketchup (unknown [183.217.81.95])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: heylenay@4d2.org)
	by bayard.4d2.org (Postfix) with ESMTPSA id 5F6D012FB430;
	Mon, 12 May 2025 22:01:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=4d2.org; s=mail;
	t=1747112478; bh=+bxIO1TVXDAaN1B8C3jo1UC1Eipqnd36X95ZaU0RUig=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=m3auRpyZe2GfkrXIlMAnG9PEMU91B6GPaoPtLsih5ElnJJzQraBE9b5u9pK0gL9MA
	 o4n/Ud1egen/FW/DTrf6AFdFmny9DnLc2U9eLmmgiW/lngex6DvmRfwzODDHXeU2Vu
	 ax9Ma3rCsKCQkM136CndUq+IXkvLv3XABbRjJoFhkJ0bMJ5JzUMTDtDbrqEPde/kla
	 34IVzg4IgUiyELv45EYbhYUtzqb4rF2UIwnYaKN7ALz3U8A0sftG9OmnE9ny6bxEIt
	 nXzVnk1fyuzdc7R3MqLZKHFO+ylhfT48dVAYs3cLeZyFyodA3WGnzWtmFFUWmULFsI
	 D9pHtf1BNEJbw==
Date: Tue, 13 May 2025 05:01:10 +0000
From: Haylen Chu <heylenay@4d2.org>
To: Alex Elder <elder@riscstar.com>, robh@kernel.org, krzk+dt@kernel.org,
	conor+dt@kernel.org, mturquette@baylibre.com, sboyd@kernel.org,
	p.zabel@pengutronix.de, paul.walmsley@sifive.com,
	palmer@dabbelt.com, aou@eecs.berkeley.edu, alex@ghiti.fr,
	dlan@gentoo.org
Cc: inochiama@outlook.com, guodong@riscstar.com, devicetree@vger.kernel.org,
	linux-clk@vger.kernel.org, spacemit@lists.linux.dev,
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v9 3/6] clk: spacemit: set up reset auxiliary devices
Message-ID: <aCLSFmSXLUQYi6on@ketchup>
References: <20250512183212.3465963-1-elder@riscstar.com>
 <20250512183212.3465963-4-elder@riscstar.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250512183212.3465963-4-elder@riscstar.com>

On Mon, May 12, 2025 at 01:32:08PM -0500, Alex Elder wrote:
> Add a new reset_name field to the spacemit_ccu_data structure.  If it is
> non-null, the CCU implements a reset controller, and the name will be
> used in the name for the auxiliary device that implements it.
> 
> Define a new type to hold an auxiliary device as well as the regmap
> pointer that will be needed by CCU reset controllers.  Set up code to
> initialize and add an auxiliary device for any CCU that implements reset
> functionality.
> 
> Make it optional for a CCU to implement a clock controller.  This
> doesn't apply to any of the existing CCUs but will for some new ones
> that will be added soon.
> 
> Signed-off-by: Alex Elder <elder@riscstar.com>
> ---
> v9: Use ida_alloc() to assign the unique auxiliary device ID
> 
>  drivers/clk/spacemit/Kconfig     |   1 +
>  drivers/clk/spacemit/ccu-k1.c    | 104 ++++++++++++++++++++++++++++---
>  include/soc/spacemit/k1-syscon.h |  12 ++++
>  3 files changed, 107 insertions(+), 10 deletions(-)

Reviewed-by: Haylen Chu <heylenay@4d2.org>

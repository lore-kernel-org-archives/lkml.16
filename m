Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5CEF6256C6B;
	Mon, 10 Feb 2025 17:05:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739207136; cv=none; b=KD7PPQJ4XvByf7ui2EbscCvoHH4n7To6kWm8LMHKB8Sg2rz83VsgR+EA3sQW2AEdtpG4lno78BKlFGK53ssV1nsIssUxSwiKyVM9OgAsWWEW/M/fMoQgyjcVhXdxqw/0rdaSnY4o1L1kekJn5syq/n0SrxYbdY8omILhdNVUdqo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739207136; c=relaxed/simple;
	bh=NEbx/CDxR9KoD5+myzoQp6lO8YzT0ofxfAwpwvh9OsU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=R6ikhibjjOkURsj6d2whoKVri0kbZvmDpVZKZDOHYRCVUEUHuFkfOFfVdt4bv+TJ5uKVNIewDNx/7b9VvAjegf1jwutytE0VFvmtOfMmiuN/a8rVj5FntooLdYIbY5MCP/H5HPtB13v6+xBkvYfW8gGEE5aKYcNCOPESG7K8d5I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=pd0zC++F; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="pd0zC++F"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 034E7C4CED1;
	Mon, 10 Feb 2025 17:05:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1739207135;
	bh=NEbx/CDxR9KoD5+myzoQp6lO8YzT0ofxfAwpwvh9OsU=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=pd0zC++FaKl1x8EGccbixjkR0n3kt2RzYLWmQZJPOQg4n/JH+xOyD48u2sz5R4Gtd
	 GHRhFFDp6zcdyzK0RrvLowrBM0aJVGjgbDstilqQLrc5O3cxDyzdKaPH4l2OjH8QW0
	 PBbYPNJgqK4hOueWTXbr+wylrTQF5OcC5tB58QcXPMEfmD3yU0sGnbyqyJ9uxMKH1C
	 +JmIJHobHJXb1Rqm5HFRbiEbbhanFmJU0ODqAalYsvPkIPqM8otPrRDFSs1KRODuRO
	 vMM59/ya+1xLZ8AaZiJiCwAJcNzohmGhWX0svegDIIe0FYDW8jsDFvXRWAX3KQHcV7
	 IQCybfanUWSig==
Message-ID: <a199849a-ca36-439d-8246-7addd9a78833@kernel.org>
Date: Mon, 10 Feb 2025 18:05:31 +0100
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 01/16] dt-bindings: clock: at91: Split up per SoC
 partially
To: Alexander Dahl <ada@thorsis.com>,
 Claudiu Beznea <claudiu.beznea@tuxon.dev>
Cc: Nicolas Ferre <nicolas.ferre@microchip.com>,
 Ryan Wanner <ryan.wanner@microchip.com>,
 linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
 linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>
References: <20250210164506.495747-1-ada@thorsis.com>
 <20250210164506.495747-2-ada@thorsis.com>
From: Krzysztof Kozlowski <krzk@kernel.org>
Content-Language: en-US
Autocrypt: addr=krzk@kernel.org; keydata=
 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 fv0=
In-Reply-To: <20250210164506.495747-2-ada@thorsis.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 10/02/2025 17:44, Alexander Dahl wrote:
> Before adding even more new indexes creating more holes in the
> clk at91 drivers pmc_data->chws arrays, split this up.
> 
> This is a partial split up only for SoCs affected by upcoming changes
> and by that PMC_MAIN + x hack, others could follow by the same scheme.
> 
> Binding splitup was proposed for several reasons:
> 
> 1) keep the driver code simple, readable, and efficient
> 2) avoid accidental array index duplication
> 3) avoid memory waste by creating more and more unused array members.
> 
> Old values are kept to not break dts, and to maintain dt ABI.
> 
> Link: https://lore.kernel.org/linux-devicetree/20250207-jailbird-circus-bcc04ee90e05@thorsis.com/T/#u
> Signed-off-by: Alexander Dahl <ada@thorsis.com>
> ---
> 
> Notes:
>     v2:
>     - new patch, not present in v1
> 
>  .../dt-bindings/clock/microchip,sam9x60-pmc.h | 19 +++++++++++
>  .../dt-bindings/clock/microchip,sam9x7-pmc.h  | 25 +++++++++++++++
>  .../clock/microchip,sama7d65-pmc.h            | 32 +++++++++++++++++++
>  .../dt-bindings/clock/microchip,sama7g5-pmc.h | 24 ++++++++++++++
>  4 files changed, 100 insertions(+)
>  create mode 100644 include/dt-bindings/clock/microchip,sam9x60-pmc.h
>  create mode 100644 include/dt-bindings/clock/microchip,sam9x7-pmc.h
>  create mode 100644 include/dt-bindings/clock/microchip,sama7d65-pmc.h
>  create mode 100644 include/dt-bindings/clock/microchip,sama7g5-pmc.h
> 
> diff --git a/include/dt-bindings/clock/microchip,sam9x60-pmc.h b/include/dt-bindings/clock/microchip,sam9x60-pmc.h
> new file mode 100644
> index 0000000000000..e01e867e8c4da
> --- /dev/null
> +++ b/include/dt-bindings/clock/microchip,sam9x60-pmc.h
> @@ -0,0 +1,19 @@
> +/* SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause */
> +/*
> + * The constants defined in this header are being used in dts and in
> + * at91 sam9x60 clock driver.
> + */
> +
> +#ifndef _DT_BINDINGS_CLOCK_MICROCHIP_SAM9X60_PMC_H
> +#define _DT_BINDINGS_CLOCK_MICROCHIP_SAM9X60_PMC_H
> +
> +#include <dt-bindings/clock/at91.h>
> +
> +/* old from before bindings splitup */
> +#define SAM9X60_PMC_MCK		PMC_MCK		/* 1 */
> +#define SAM9X60_PMC_UTMI	PMC_UTMI	/* 2 */
> +#define SAM9X60_PMC_MAIN	PMC_MAIN	/* 3 */
> +
> +#define SAM9X60_PMC_PLLACK	PMC_PLLACK	/* 7 */

IIUC, you want to have bindings per SoC, so why not adding proper
constants here instead of including entire old binding header? The
binding header should be entirely abandoned later.


Best regards,
Krzysztof

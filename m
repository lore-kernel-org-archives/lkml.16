Received: from mail.andi.de1.cc (mail.andi.de1.cc [178.238.236.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 92ED32556E;
	Sat,  5 Apr 2025 19:49:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=178.238.236.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743882558; cv=none; b=dYhJJKb69FZ2ln0nwIaidkokhJsB3skLpKsqyXU0fn0MAhhs0BWHjMBDIzZ68h6785enZ4oAfoBQKkz0xDRoQdVyeaZhh50ANLnH4wmVTbXFk4JABDZpPmE9Do0sMAsHWsxNVKlfH85S1KCYZC0178rjEF0sSMsBRYIhPZt13bk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743882558; c=relaxed/simple;
	bh=RhGwmaIlf4cQcamJj9eBRN68N78PwPXPgg/TzHaXYb4=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=KfwqmDRJ5bHNKbYqHCfM3DE8VC1/PWCQnRu74pwRLqfhO0DBtdwWtMUmSkD8Ya58b3eVxssnuGDY5DuaMyEGTp8ScPFIzrExpBUAlYHGF5LLC5QaPB12OODFlf+bS8Kthe0S4PPqFg65FZPxmj7KCl+OhL5dR4hs3RP8cJYEXrU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=kemnade.info; spf=pass smtp.mailfrom=kemnade.info; dkim=pass (2048-bit key) header.d=kemnade.info header.i=@kemnade.info header.b=Wqv3Fu4e; arc=none smtp.client-ip=178.238.236.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=kemnade.info
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kemnade.info
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kemnade.info header.i=@kemnade.info header.b="Wqv3Fu4e"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=kemnade.info; s=20220719; h=References:In-Reply-To:Cc:From:Sender:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID;
	bh=ikLwVlTRba3+LN49BpvyjGaUmSoJftuu577LiJ63LfA=; b=Wqv3Fu4egKakj7QWHFyzaSXle/
	HdkG1PXrgz3cYrzY4my3fI/pQxLt9WRsqx0pzXNfcQtmSeqs5GiXBlWTV1IjCDlNoy4UWZh1ALfKk
	oAXETPkWPTYVh0ShetgRHrCfh6SiWT+2BjHLn75bqRDZYjqsuYDiOhkXdIugg9iO16uPX0VRp1hpQ
	01PXXnBJef8DQMDmPMdDpt1AjNsnv+GugXJujTRQDsYyXbntSSqoDIQckP3tF3OfBEeeuZgAw/R75
	cZqZL1XEmchfFH4r2gZObnNry1Pck2NLcKW4GSIrKcNxN8XTtvQcI+dzBybN03Z1f1So0ppW83rAE
	qJKsNMYg==;
Date: Sat, 5 Apr 2025 21:49:04 +0200
From: Andreas Kemnade <andreas@kemnade.info>
To: Sukrut Bellary <sbellary@baylibre.com>
Cc: Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, Krzysztof Kozlowski
 <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Tero Kristo
 <kristo@kernel.org>, Kevin Hilman <khilman@baylibre.com>,
 linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH 4/4] dt-bindings: clock: ti: add ti,autoidle.yaml
 reference
Message-ID: <20250405214904.0b07b26f@akair>
In-Reply-To: <20250404014500.2789830-5-sbellary@baylibre.com>
References: <20250404014500.2789830-1-sbellary@baylibre.com>
	<20250404014500.2789830-5-sbellary@baylibre.com>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

Am Thu,  3 Apr 2025 18:45:00 -0700
schrieb Sukrut Bellary <sbellary@baylibre.com>:

> ti,divider-clock uses properties from ti,autoidle.
> 
> As we are converting autoidle binding to ti,autoidle.yaml,
> fix the reference here.
> 
> Add dual license.
> 
> Signed-off-by: Sukrut Bellary <sbellary@baylibre.com>
> ---
>  .../bindings/clock/ti/ti,divider-clock.yaml   | 24 ++++---------------
>  1 file changed, 5 insertions(+), 19 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/clock/ti/ti,divider-clock.yaml b/Documentation/devicetree/bindings/clock/ti/ti,divider-clock.yaml
> index 3fbe236eb565..aba879ae302d 100644
> --- a/Documentation/devicetree/bindings/clock/ti/ti,divider-clock.yaml
> +++ b/Documentation/devicetree/bindings/clock/ti/ti,divider-clock.yaml
> @@ -1,4 +1,4 @@
> -# SPDX-License-Identifier: GPL-2.0-only
> +# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
>  %YAML 1.2
>  ---
>  $id: http://devicetree.org/schemas/clock/ti/ti,divider-clock.yaml#
> @@ -55,9 +55,10 @@ description: |
>    is missing it is the same as supplying a zero shift.
>  
>    This binding can also optionally provide support to the hardware autoidle
> -  feature, see [1].
> +  feature.
>  
> -  [1] Documentation/devicetree/bindings/clock/ti/autoidle.txt
> +allOf:
> +  - $ref: /schemas/clock/ti/ti,autoidle.yaml#
>  
>  properties:
>    compatible:
> @@ -97,7 +98,6 @@ properties:
>      minimum: 1
>      default: 1
>  
> -
>    ti,max-div:
>      $ref: /schemas/types.yaml#/definitions/uint32
>      description:
> @@ -116,20 +116,6 @@ properties:
>        valid divisor programming must be a power of two,
>        only valid if ti,dividers is not defined.
>  
> -  ti,autoidle-shift:
> -    $ref: /schemas/types.yaml#/definitions/uint32
> -    description:
> -      bit shift of the autoidle enable bit for the clock,
> -      see [1].
> -    maximum: 31
> -    default: 0
> -
now you make ti,autoidle-shift required. That makes so sense. A clock
does not necessarily support autoidle.

Regards,
Andreas

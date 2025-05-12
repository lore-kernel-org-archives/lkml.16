Received: from out-178.mta1.migadu.com (out-178.mta1.migadu.com [95.215.58.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 296B0189912
	for <linux-kernel@vger.kernel.org>; Mon, 12 May 2025 12:17:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747052234; cv=none; b=EAcNi7rIVWpig7FhZuMygdGmwRZpTfv5C92Te790m9spFVk74uaFfZnzveB9ffaOnlkm2gd2oA0LPIy7+F7pKvb2OA10pCKkhKSVOahH6K0oShuW6qza3vdP7SCos81cUpuk+7iN8FDGeFrCWdfZZnp7kGNJ4aOQPFsPfIVMh+U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747052234; c=relaxed/simple;
	bh=+iJskSZ/UVwR0knwRrLsurPJolS4qvi+pzf6q+rb5R4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=YBP1pC3YZFlDOqrpSbYBEDgAdSMsOTTCzfvNWX6dfz9tibJQaKfr+55YaxjG71bkRegguyT1AJzqjGpc9YWTkS798sqeQbXqwgFmzfWMLX2ts1bSlchYjqVmTATIB3Cl6awR90V5dW8csM8cT0OR+syhZ4BRfLkm5ipaZ5pKeVg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=ujCTLo5A; arc=none smtp.client-ip=95.215.58.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="ujCTLo5A"
Date: Mon, 12 May 2025 14:17:09 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1747052231;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=nnqo/Z/Z3MgFc3zS1tdId2zpzeE1cU7CnLLBwElzNms=;
	b=ujCTLo5AYyLgCXz/72HBpp425EQNg4G1Ois+2ytiEUTHSBuSJQDskgK6W0fhZGkGCIfbOW
	8fwOZp8ZET+oo9YxNx1pwSoKYaNAwz+NEwOp1DQ2cquhX1DDMarCTkR1iiN37E8aGeqtJ7
	tEkR0CRzeCCSTWumXEecQAujNej7hOY=
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Nicolas Schier <nicolas.schier@linux.dev>
To: Henrik =?utf-8?Q?Lindstr=C3=B6m?= <henrik@lxm.se>
Cc: masahiroy@kernel.org, nathan@kernel.org, linux-kbuild@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] Makefile: remove dependency on archscripts for header
 installation
Message-ID: <20250512-uptight-logical-panther-cbdcda@l-nschier-aarch64>
References: <20250510153204.11052-1-henrik@lxm.se>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250510153204.11052-1-henrik@lxm.se>
Organization: AVM GmbH
X-Migadu-Flow: FLOW_OUT

On Sat, 10 May 2025, Henrik Lindström wrote:

> There doesn't seem to be any purpose behind this dependency, and it prevents
> installing x86 and mips headers on non Linux systems. Doing so is useful when
> building a cross compiler targetting Linux, which requires the header files.
> 
> Signed-off-by: Henrik Lindström <henrik@lxm.se>
> ---
>  Makefile | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/Makefile b/Makefile
> index b29cc321ffd9..0234faafe8f0 100644
> --- a/Makefile
> +++ b/Makefile
> @@ -1366,7 +1366,7 @@ PHONY += archheaders archscripts
>  hdr-inst := -f $(srctree)/scripts/Makefile.headersinst obj
>  
>  PHONY += headers
> -headers: $(version_h) scripts_unifdef uapi-asm-generic archheaders archscripts
> +headers: $(version_h) scripts_unifdef uapi-asm-generic archheaders
>  ifdef HEADER_ARCH
>  	$(Q)$(MAKE) -f $(srctree)/Makefile HEADER_ARCH= SRCARCH=$(HEADER_ARCH) headers
>  else
> -- 
> 2.39.5
> 

Looks reasonable to me, thanks.

Reviewed-by: Nicolas Schier <n.schier@avm.de>

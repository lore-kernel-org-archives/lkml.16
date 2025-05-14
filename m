Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3570F125B2;
	Wed, 14 May 2025 15:01:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747234865; cv=none; b=JVtVQ+9nGNibcJzOD2rGmj7knc1CzOV7iw90wygedlw8RV6Kltj8DUmw8ZKEftJL3hpikUSdY77fR6vH4IvvNG7bz+rfXqHLu2jQoWpcN7MhDUvIIzad/iFU05IRmRkORFAVgcMkWp46SeDvqcqJLejvzaboZgHofvHD/VzBe8I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747234865; c=relaxed/simple;
	bh=hMW/9Y28Z+06nftGC1bUDaDU9DIvJvhegAW2nq4TGEk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ARXLIAWlVfVD0gSb2cceMqsQ+PgwSKy06R1qqMFnJsXa/8cK2qE/pPjmzgmbux7DJjmaA1KtWnzn0XNsXKWj4u/xyM/kxcfZ2FNOxwWEwtuyXPuk21tO2BWjsZfh6lm+CoVlM7j5wGo5pUU08OJh5vjLJr4+eq5dH/D5npQYPJY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=nns+7qTe; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="nns+7qTe"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6D3DAC4CEE3;
	Wed, 14 May 2025 15:01:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747234864;
	bh=hMW/9Y28Z+06nftGC1bUDaDU9DIvJvhegAW2nq4TGEk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=nns+7qTeY5x1nrD1T9+9IMc2mtan3fVsg82mGiiYg0BgDoRIncUTy1JgzhNR5xrTv
	 S5vBoK3/O2gwZiX4/gf1ak8uGTO6Wkc5CUM/8rs1v1psUWuCm+P7iUX5T13oXToozx
	 nMyPwPo/f8E0OUp33jPceNulQo5PkeN429WLMdTLFLMnjTt5hdHMYh0b6HhV23j0sa
	 Sf6HwQngpk1ljrutHG5zCEa0+Ln4JEt4Ry97CxtoOUwEfQzOVa+6pKNErco+7G8hDr
	 5D09WQhhyeLSLdrrbU8eyhiFZHr9yphKbsNFAx22Nqr1xuuysHrM27Qv2UhATHAKPX
	 6jMNLua9mcMxQ==
Date: Wed, 14 May 2025 10:01:02 -0500
From: Rob Herring <robh@kernel.org>
To: Ben Zong-You Xie <ben717@andestech.com>
Cc: paul.walmsley@sifive.com, palmer@dabbelt.com, aou@eecs.berkeley.edu,
	alex@ghiti.fr, krzk+dt@kernel.org, conor+dt@kernel.org,
	tglx@linutronix.de, daniel.lezcano@linaro.org,
	prabhakar.mahadev-lad.rj@bp.renesas.com, geert+renesas@glider.be,
	magnus.damm@gmail.com, devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
	tim609@andestech.com, Conor Dooley <conor.dooley@microchip.com>
Subject: Re: [PATCH v4 4/9] dt-bindings: interrupt-controller: add Andes
 machine-level software interrupt controller
Message-ID: <20250514150102.GA2180131-robh@kernel.org>
References: <20250514095350.3765716-1-ben717@andestech.com>
 <20250514095350.3765716-5-ben717@andestech.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250514095350.3765716-5-ben717@andestech.com>

On Wed, May 14, 2025 at 05:53:45PM +0800, Ben Zong-You Xie wrote:
> Add the DT binding documentation for Andes machine-level software
> interrupt controller.
> 
> In the Andes platform such as QiLai SoC, the PLIC module is instantiated a
> second time with all interrupt sources tied to zero as the software
> interrupt controller (PLICSW). PLICSW can generate machine-level software
> interrupts through programming its registers.
> 
> Acked-by: Conor Dooley <conor.dooley@microchip.com>
> Signed-off-by: Ben Zong-You Xie <ben717@andestech.com>
> ---
>  .../andestech,plicsw.yaml                     | 54 +++++++++++++++++++
>  MAINTAINERS                                   |  1 +

This won't apply for me due to MAINTAINERS conflict with this series. So 
apply the bindings patches with the dts files.

Rob

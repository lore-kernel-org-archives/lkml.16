Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0784A1D7E41;
	Mon, 30 Jun 2025 21:36:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751319390; cv=none; b=nfuJpDQKeMSF1yc6l2uXouauQKG+0/owCGRBZw3EtLvrVzon+CRyRReZFHMxd20v6L7lbmVrFWHYtL+w950RTrITBlVis0/Z9CJpGRiES+9PxVACXXUaUtFLC9GIlpPeU85/W6EXeCucMkjT+WUyDxgjdyHONM4PWuqaYmGwp0s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751319390; c=relaxed/simple;
	bh=mZ5FIEorJVzzShKFZlqCCCfYQI+bkZcqGcvsqQdrGBs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Gx6yb/UO0hV/RSUMTxPmjfLqkmsU+dAAoRaeluuLP6ZEk6Fel91z2+XA7sak8o6UDuFajVJO4QtRe6RUoQwblWTM1+4J7f7n/rzwTGBz8XmmIh9h9NBxQc5nXhdJ5eTSvKR+k03ueqLdVnveLw6Ve2rovr/A8BAiPcp3iSWHinc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=QHgGDUtx; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="QHgGDUtx"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6F937C4CEE3;
	Mon, 30 Jun 2025 21:36:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1751319389;
	bh=mZ5FIEorJVzzShKFZlqCCCfYQI+bkZcqGcvsqQdrGBs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=QHgGDUtxTDuTIVFyC97+axikseCSVj8INevAe7xYq/UXxZPS9A/9ueB06xNKjpqF7
	 CUUllHEgVSD+SHBdIQmm5uEAc2FS70xoKsrm787KN12c986QHD8n8QeRimL2X1VCpW
	 bs7CpvQkPKoufzhz7Zqh7ZyxN9tEYCT57XU30cauy5F7nDN/+9gyBX8M3S9vj5McCq
	 pCTkL7/e3OFwDPpjywWk1Oib+E4pCuY9h9H0IclDnzHdJinZIdMRfDCgWNRh3jmdp2
	 wCaW9JuUdWbArfxZRYiTAr7sKv5f+ocN7ikyVCwh4nbxyiL6hvAifU5d2l8OJJOMle
	 4CYnMJ72nsEFA==
Date: Mon, 30 Jun 2025 16:36:28 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: =?iso-8859-1?Q?J=2E_Neusch=E4fer?= <j.ne@posteo.net>
Cc: Conor Dooley <conor+dt@kernel.org>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Madhavan Srinivasan <maddy@linux.ibm.com>,
	linuxppc-dev@lists.ozlabs.org, Crystal Wood <oss@buserror.net>,
	linux-kernel@vger.kernel.org, Naveen N Rao <naveen@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Thomas Gleixner <tglx@linutronix.de>,
	Nicholas Piggin <npiggin@gmail.com>,
	Christophe Leroy <christophe.leroy@csgroup.eu>,
	devicetree@vger.kernel.org
Subject: Re: [PATCH v2] dt-bindings: interrupt-controller: Convert
 fsl,mpic-msi to YAML
Message-ID: <175131938693.3399448.343722096560779428.robh@kernel.org>
References: <20250611-msipic-yaml-v2-1-f2e174c48802@posteo.net>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250611-msipic-yaml-v2-1-f2e174c48802@posteo.net>


On Wed, 11 Jun 2025 11:42:09 +0200, J. Neuschäfer wrote:
> As part of a larger effort to bring various PowerPC-related bindings
> into the YAML world, this patch converts msi-pic.txt to YAML and moves
> it into the bindings/interrupt-controller/ directory. The conversion may
> necessarily be a bit hard to read because the binding is quite verbose.
> 
> Signed-off-by: J. Neuschäfer <j.ne@posteo.net>
> ---
> Changes in v2:
> - Rebase on v6.16-rc1
> - Address Conor Dooley's review comments:
>   - Add multiline marker (|) to preserve formatting
>   - Split 'reg' list in second example
>   - Rewrite version dependent information as an if/else schema
> 
> Link to v1: https://lore.kernel.org/r/20250403-msipic-yaml-v1-1-f4248475714f@posteo.net
> ---
> ---
>  .../interrupt-controller/fsl,mpic-msi.yaml         | 161 +++++++++++++++++++++
>  .../devicetree/bindings/powerpc/fsl/msi-pic.txt    | 111 --------------
>  2 files changed, 161 insertions(+), 111 deletions(-)
> 

Applied, thanks!


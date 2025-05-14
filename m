Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F05081F5425;
	Wed, 14 May 2025 19:45:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747251912; cv=none; b=HR7TUaloCMfY32EfDfP9n/yndQcNWJcDYbtM+x+AR2d9XwDToSJNls/SjyzaZkfSiASSVoc9Q+U97idSoery5iUcMM9U0xfU6G26e3bgNp0kEoer+zgmlg3DIHD066+Y9+h2Tmug4azVMNrsB3xdcd20bT2v6DRyxXs39Gphod0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747251912; c=relaxed/simple;
	bh=cM+xkPm2fLwu3UYG2UyFeINhLllAB7tvIAsPWODLbOc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=YSQZtIRjCRMTtkr+Fu9fBEhVTzDIR4plvLucd7KlYr6u94B/rzWlZyI25yBRzJ9JbdGlATH3hxcrxDk3VvvxCH+6ygUhMa/kizvFNKfKseJ80SdqmSNDux13DJt6ivGZHlbk0AN7PCK61uFBOSZhIuDfx+1yOmnIxFI0rQE/wYg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=kqI4Vv3z; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="kqI4Vv3z"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3F163C4CEE3;
	Wed, 14 May 2025 19:45:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747251910;
	bh=cM+xkPm2fLwu3UYG2UyFeINhLllAB7tvIAsPWODLbOc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=kqI4Vv3zvUHzi3ABgMRtkR6GrBotKiagYtNJ3wCy36X+rZ+FLG8qbsz9zQV/jqOBP
	 arEKxtvFCarZnhflRBy+4RTUMBLvwvurK1VRdBqYWwH2V2whkPnMK8zdmt6TlqsMDD
	 LnzgHShcsQSVa7wry8UcwhVXJYWusQxNv85ejoUaW5Xn/eBqh2r8+uzTPU2rtmMOy4
	 Z6O8qRvVMn10M9URYFgPj+vE84rZyqrgCGUDN1IQYoekj7h5vDt/IyswssbnVKAVuf
	 OZLfUg7ckUrZrhCTbdRJjaMY9tj1ncLYY18zNOOEf43UZ2UM/dkauTLdRjSv0v90Yx
	 eEYuYckK+RCTQ==
Date: Wed, 14 May 2025 14:45:08 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Richard Hu <richard.hu@technexion.com>
Cc: Max.Merchel@ew.tq-group.com, marex@denx.de, ray.chang@technexion.com,
	linux-kernel@vger.kernel.org, tharvey@gateworks.com,
	festevam@denx.de, frieder.schrempf@kontron.de,
	alexander.stein@ew.tq-group.com, mwalle@kernel.org, hs@denx.de,
	francesco.dolcini@toradex.com, devicetree@vger.kernel.org,
	peng.fan@nxp.com, andreas@kemnade.info, joao.goncalves@toradex.com,
	conor+dt@kernel.org, krzk+dt@kernel.org, shawnguo@kernel.org
Subject: Re: [PATCH 1/2] dt-bindings: arm: fsl: Add EDM-G-IMX8M-PLUS SOM and
 WB-EDM-G carrier board
Message-ID: <174725190828.2890904.8886508886589029894.robh@kernel.org>
References: <20250509071222.12083-1-richard.hu@technexion.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250509071222.12083-1-richard.hu@technexion.com>


On Fri, 09 May 2025 15:12:22 +0800, Richard Hu wrote:
> From: Ray Chang <ray.chang@technexion.com>
> 
> Add support for the TechNexion EDM-G-IMX8M-PLUS SOM and the WB-EDM-G carrier board.
> 
> Signed-off-by: Ray Chang <ray.chang@technexion.com>
> Signed-off-by: Richard Hu <richard.hu@technexion.com>
> ---
>  Documentation/devicetree/bindings/arm/fsl.yaml | 7 +++++++
>  1 file changed, 7 insertions(+)
> 

Acked-by: Rob Herring (Arm) <robh@kernel.org>


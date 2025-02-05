Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 06CE015199C
	for <linux-kernel@vger.kernel.org>; Wed,  5 Feb 2025 11:10:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738753847; cv=none; b=m7KEseguj/NL8OSWdOZ7R/jf+4mDOS35ySw0mFHWYH+xXWXEcnRmqR4odWjosx7dBq4voAGc+LfRVmRY/Kjak/IiLjPCBgX1HbaExxRvYQ+nds8bNtYyRKcsnlh38I9q+8RHQw8Ei1Rnc2dABaC9WL4md0DvGpv1vQNqsosMOco=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738753847; c=relaxed/simple;
	bh=kiqjJI5Dlb0VBATIqTD3fk/ZCJL2G+hYjgNO/d/+Ros=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=nFFCB70iXbxemD/zw0qFHKN59tItGlZv5FEuZF9n4MteXpd4W7Ikm4TOtO7Dsf+UHdh5bi5oS1YQL9qb4WAsB86CMQP8Ev+3NHYg+t7vDz3Q+CBC8CDS8icOMFoNta/jlwrW4NpspCPJH5XcBKNqqO3HbAapnaJVN2QT/fNdKtk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=SKbp4xkd; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="SKbp4xkd"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 31D5BC4CED1;
	Wed,  5 Feb 2025 11:10:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1738753846;
	bh=kiqjJI5Dlb0VBATIqTD3fk/ZCJL2G+hYjgNO/d/+Ros=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=SKbp4xkd5aqotUKkwvPw1ID7LgHlTRIfbSMgB9ULHDkzlGlkm1DIeH8tYy7Yx57un
	 KjHCnpXZ9njLfe/WIxNxigoz3UIUi22H5Xk1q6/fq6+mb3QRR0h8D2GqpxZTqjo9CB
	 H4OFOArDEfp1ausWf1apx/JRjFArK8YrcKXzscRpYGi0ORuAxa05/RdUfOq9Z2hfo4
	 hhM/JXjdtoz7gSFCSLtzwTtWgpFGeggVINkPTj7zDGYXbGQmlA2OxDo/Opni41dPMx
	 oKj5FvMW/UyCietfpf8WcqI6Yjw13QdVnJxeV13oZds7NRw0jCs/aMW0FiXoH0mFj7
	 KdZeJusiWxCCQ==
Date: Wed, 5 Feb 2025 12:10:43 +0100
From: Marek =?utf-8?B?QmVow7pu?= <kabel@kernel.org>
To: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>, 
	Andy Shevchenko <andy@kernel.org>, Arnd Bergmann <arnd@arndb.de>, linux-kernel@vger.kernel.org
Subject: Re: [PATCH resend] platform: cznic: CZNIC_PLATFORMS should depend on
 MACH_ARMADA_38X || ARCH_MVEBU || PPC_P2020
Message-ID: <zqpuww4lpgxui6slhx7c4dh6v25djhd4lxjtw7posregrfulwi@z2s5eyxa25qt>
References: <021800db3f75e31bff96842c7d7e9ee840fe3e7a.1738752438.git.geert+renesas@glider.be>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <021800db3f75e31bff96842c7d7e9ee840fe3e7a.1738752438.git.geert+renesas@glider.be>

On Wed, Feb 05, 2025 at 11:48:14AM +0100, Geert Uytterhoeven wrote:
> CZ.NIC's Turris devices are based on Marvell Armada 385 or 3720, or on
> Freescale P2020 SoCs.  Hence add dependencies on MACH_ARMADA_38X,
> ARCH_MVEBU, and PPC_P2020, to prevent asking the user about these
> drivers when configuring a kernel that cannot run on any CZ.NIC Turris
> system.
> 
> Fixes: 992f1a3d4e88498d ("platform: cznic: Add preliminary support for Turris Omnia MCU")
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> ---
> Perhaps the dependency on PPC_P2020 should be dropped?
> ---
>  drivers/platform/cznic/Kconfig | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/platform/cznic/Kconfig b/drivers/platform/cznic/Kconfig
> index 49c383eb67854173..bf4bd7f00e32de09 100644
> --- a/drivers/platform/cznic/Kconfig
> +++ b/drivers/platform/cznic/Kconfig
> @@ -6,6 +6,7 @@
>  
>  menuconfig CZNIC_PLATFORMS
>  	bool "Platform support for CZ.NIC's Turris hardware"
> +	depends on MACH_ARMADA_38X || ARCH_MVEBU || PPC_P2020 || COMPILE_TEST

Not PPC_P2020. No driver yet in this directory for Turris 1.x.

>  	help
>  	  Say Y here to be able to choose driver support for CZ.NIC's Turris
>  	  devices. This option alone does not add any kernel code.
> -- 
> 2.43.0
> 

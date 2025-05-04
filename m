Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E50EC219FC;
	Sun,  4 May 2025 17:48:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746380896; cv=none; b=sGwcPbOEiokQF3029R6A53EWX9zUYvHNmt5/0OIdKvvSrDJN4JBg2puACV0FoRT+vEJ72yAH23x3i0wpYZMtQQQAHRCmUjboCa7LCGHqNicY/jt8Jl/M7BNoRotHoAOeIopZ1H/pWwe304WDYzkjLb8xpaklhZrbVnkw3y9FqEo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746380896; c=relaxed/simple;
	bh=u7zg4TKgR84wCCaIild5C6PeqFwsEVoPz8+I0+3drZc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=TizPrL7Hsh6sNf/QzQ42bbmtBcRuTlhyi0b1TIEeUQdAGSeC1Ai0X+rsrwrbHKs1AdkHg+7zsIfhl8XefhsjVBoJ3l/qH4v8WNMkHgGnRWZ74H/vLuBikDj17iz12+SDzhBtYdCmHVBylKRSdM7cpjLtgzaCPXE3cWhmTSk8o5Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=B7a6YV4o; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="B7a6YV4o"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BC989C4CEE7;
	Sun,  4 May 2025 17:48:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1746380894;
	bh=u7zg4TKgR84wCCaIild5C6PeqFwsEVoPz8+I0+3drZc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=B7a6YV4o/RqJesWo4nxNV+s51I3AilTGtz+ZiubAwVysOuEGD5kPqC3hNlpKYiodf
	 hT42En9eCV5qEH7k8/dQhxbwJyQScNppULB9LkY4aTerP1O7WXMOFecerZibwCnL99
	 Dm2u6v+NRlzqAIK9OqZIJ+flyC2Q4gT+axSQQ2g8Ls5f///caO9Trmh50RUTnTsVsu
	 O0TPtf+yQtlEuU7qeB+lWfph2Q30Ug9PFkcRVSphTq8dkP7n9Gu42L+lStRVCgLKot
	 1X16dq+bptZ9wdNsboGNXJhoJd/pxdmeaL4R1UhX34kV5ybbn0ZDocbZyqQtKRW5yt
	 qAeccxRfuGqyA==
Date: Sun, 4 May 2025 19:48:11 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Alireza Sanaee <alireza.sanaee@huawei.com>
Cc: devicetree@vger.kernel.org, robh@kernel.org, 
	jonathan.cameron@huawei.com, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, linuxarm@huawei.com, mark.rutland@arm.com, 
	shameerali.kolothum.thodi@huawei.com
Subject: Re: [PATCH v2 1/6] of: add infra for finding CPU id from phandle
Message-ID: <20250504-eminent-sepia-cuscus-fc7f7e@kuoka>
References: <20250502161300.1411-1-alireza.sanaee@huawei.com>
 <20250502161300.1411-2-alireza.sanaee@huawei.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250502161300.1411-2-alireza.sanaee@huawei.com>

On Fri, May 02, 2025 at 05:12:55PM GMT, Alireza Sanaee wrote:
> Get CPU id from phandle. Many drivers get do this by getting hold of CPU
> node first through a phandle and then find the CPU ID using the relevant
> function. This commit encapsulates cpu node finding and improves
> readability.
> 
> The API interface requires two parameters, 1) node, 2) pointer to CPU
> node. API sets the pointer to the CPU node and allows the driver to play
> with the CPU itself, for logging purposes for instance.

Run checkpatch - missing SoB.

> ---
>  drivers/of/cpu.c   | 24 ++++++++++++++++++++++++
>  include/linux/of.h |  8 ++++++++
>  2 files changed, 32 insertions(+)
> 
> diff --git a/drivers/of/cpu.c b/drivers/of/cpu.c
> index 5214dc3d05ae..1e8d1fa04d3c 100644
> --- a/drivers/of/cpu.c
> +++ b/drivers/of/cpu.c
> @@ -173,6 +173,30 @@ int of_cpu_node_to_id(struct device_node *cpu_node)
>  }
>  EXPORT_SYMBOL(of_cpu_node_to_id);
>  
> +/**
> + * of_cpu_phandle_to_id: Get the logical CPU number for a given device_node
> + *
> + * @node: Pointer to the device_node containing CPU phandle.
> + * @cpu_np: Pointer to the device_node for CPU.
> + *
> + * Return: The logical CPU number of the given CPU device_node or -ENODEV if
> + * the CPU is not found. If the property is not found, it returns -1. On
> + * success, cpu_np will always point to the retrieved CPU device_node.
> + */
> +int of_cpu_phandle_to_id(const struct device_node *node,
> +			 struct device_node **cpu_np)
> +{
> +	if (!node)
> +		return -1;
> +
> +	*cpu_np = of_parse_phandle(node, "cpu", 0);
> +	if (!cpu_np)
> +		return -ENODEV;
> +
> +	return of_cpu_node_to_id(*cpu_np);

You leak the node... or intention was to return it to the caller, but
then you need to document that caller must drop the ref.

Best regards,
Krzysztof


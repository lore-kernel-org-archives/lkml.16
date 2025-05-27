Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA9C01DF254;
	Tue, 27 May 2025 12:15:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748348131; cv=none; b=TE2aODfXTHIVF+g6yRJvWk22fkv5pVQAs4fhPqd8CNG2rgQbVOYHa99DGohmQbIEvUG4+/vUkg+Ww2VIspy62AscJWpehUrCNRNmF60mxdCNajdicz75YpooxsJxmnVd9XvkX7kcKbuHFCCMCx0o0lQ38NhvjhbyiD03Ck/LE04=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748348131; c=relaxed/simple;
	bh=Uyg/JPpzodrTtnK0p+gK6gukgXtp5qciPTkzfWFyzh4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=RHoluzsQtUYaYrTKEBsrdGSCYLbxshJkQrHChMyZ3cL7z9mqnmrDrznqhz2InJXXLvX31/aWZhba6pAwdS7cuRVP3JsP+ikQ9WEx/62Opa2EUNsL3QuVC9R67sL46PF0ZjMPc5K0JWOwGVaFhwpgiYNsdU7uKx+4uB6L7uewLZM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=BhtFY4o5; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="BhtFY4o5"
Received: from pendragon.ideasonboard.com (unknown [145.15.244.208])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id A507D2B3;
	Tue, 27 May 2025 14:15:01 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1748348101;
	bh=Uyg/JPpzodrTtnK0p+gK6gukgXtp5qciPTkzfWFyzh4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=BhtFY4o5xKFll9hHm5rvN2HNJvHpk9PzNaslqGQ0jvJWehiGQMi44dPybUqo6t7kJ
	 1wAiP04iIxOc8vsto4/kk/ekdcgrAMgIQdKIwYkyVUj3SaWaPOFSHLdz2M4NR9OkXr
	 UOKPsbXR2X+IwC2f7NGVLBBYOX1UaZBpkYU80PbI=
Date: Tue, 27 May 2025 14:15:22 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Dan Carpenter <dan.carpenter@linaro.org>
Cc: Cosmin Tanislav <demonsingur@gmail.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>, linux-kernel@vger.kernel.org,
	kernel-janitors@vger.kernel.org
Subject: Re: [PATCH] regulator: max20086: Fix refcount leak in
 max20086_parse_regulators_dt()
Message-ID: <20250527121522.GN12492@pendragon.ideasonboard.com>
References: <aDVRLqgJWMxYU03G@stanley.mountain>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <aDVRLqgJWMxYU03G@stanley.mountain>

Hi Dan,

Thank you for the patch.

On Tue, May 27, 2025 at 08:44:14AM +0300, Dan Carpenter wrote:
> There is a missing call to of_node_put() if devm_kcalloc() fails.
> Fix this by changing the code to use cleanup.h magic to drop the
> refcount.
> 
> Fixes: 6b0cd72757c6 ("regulator: max20086: fix invalid memory access")
> Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

> ---
>  drivers/regulator/max20086-regulator.c | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/regulator/max20086-regulator.c b/drivers/regulator/max20086-regulator.c
> index b4fe76e33ff2..fcdd2d0317a5 100644
> --- a/drivers/regulator/max20086-regulator.c
> +++ b/drivers/regulator/max20086-regulator.c
> @@ -5,6 +5,7 @@
>  // Copyright (C) 2022 Laurent Pinchart <laurent.pinchart@idesonboard.com>
>  // Copyright (C) 2018 Avnet, Inc.
>  
> +#include <linux/cleanup.h>
>  #include <linux/err.h>
>  #include <linux/gpio/consumer.h>
>  #include <linux/i2c.h>
> @@ -133,11 +134,11 @@ static int max20086_regulators_register(struct max20086 *chip)
>  static int max20086_parse_regulators_dt(struct max20086 *chip, bool *boot_on)
>  {
>  	struct of_regulator_match *matches;
> -	struct device_node *node;
>  	unsigned int i;
>  	int ret;
>  
> -	node = of_get_child_by_name(chip->dev->of_node, "regulators");
> +	struct device_node *node __free(device_node) =
> +		of_get_child_by_name(chip->dev->of_node, "regulators");
>  	if (!node) {
>  		dev_err(chip->dev, "regulators node not found\n");
>  		return -ENODEV;
> @@ -153,7 +154,6 @@ static int max20086_parse_regulators_dt(struct max20086 *chip, bool *boot_on)
>  
>  	ret = of_regulator_match(chip->dev, node, matches,
>  				 chip->info->num_outputs);
> -	of_node_put(node);
>  	if (ret < 0) {
>  		dev_err(chip->dev, "Failed to match regulators\n");
>  		return -EINVAL;
-- 
Regards,

Laurent Pinchart

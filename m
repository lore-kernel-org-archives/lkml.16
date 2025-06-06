Received: from sender4-op-o12.zoho.com (sender4-op-o12.zoho.com [136.143.188.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B1D4F286881;
	Fri,  6 Jun 2025 09:51:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.188.12
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749203504; cv=pass; b=ujphRqbidhx91P2Dal6tj6vr88taYy7HSHqXJRXyiYQStlbpkgtVbgfKW/LbOfA+gmbPsqBKJUbVWBzD6L/ZmbpEe3SlchIddtmYZFwNQAClQV6nRWI6CKETguhLhvb96Ulnwx7HhuOKqkdvVbwFOKdYc6AuK95G4sVmlUwX7Q8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749203504; c=relaxed/simple;
	bh=kTrpTqTzCsXY5bYJidp9/0da5RBF2G/y1wGZ1MRfJbY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=WxpUgM29buVA+xfvyOb0Hkud6bNbyEizOv4SC6HNgRkYvkEjcvWvgzueINUbEmN2UD77NLuQ7UWgCMd9sFqrb4VXXdxokv9abl+0LLpVphiiDR6pB2RhB/mNh+lvY19iYGK9/jq0dnQjSszns2QPHK4effQT5dQgzSWqkDFnWgQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (1024-bit key) header.d=collabora.com header.i=nicolas.frattaroli@collabora.com header.b=b4dEefdS; arc=pass smtp.client-ip=136.143.188.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=collabora.com header.i=nicolas.frattaroli@collabora.com header.b="b4dEefdS"
ARC-Seal: i=1; a=rsa-sha256; t=1749203482; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=OYTEc6yXPsIcRrHcRogHNuuYr2RSQbvW8h0bM+VDGsFW7I+pApg6ySm9RGKZc7RHwHUpCSQYHImtfJOimVIphDyxV0wOcV9FR5eQTKsAT/IB+AMXPUUjCoRZ7sQPIIgcnmgn41FI/ABk4zVLVetmv8eWb6ySp/cpoIjDzhO7Sik=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1749203482; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=tfnGcQSUHbLimk8z8aZ3QSd/T6JAuGeb919MpsyxEvo=; 
	b=QjTRmi6jQa2aQnzKRdkghqnj8WvmY3P25PwvVQs/Hzrl0rpgcWRJKqSmaDevvNS+1Avk3MR59AJlMTWZOG0edVwZtx1Hd8SSuI/5z97jdTZwEu/nA8ckAPSt1k4xFua5FNmdZUA+Y1Ww3+8/vRy/hFejNWUnEipPe9lAhlZmKPo=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=nicolas.frattaroli@collabora.com;
	dmarc=pass header.from=<nicolas.frattaroli@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1749203482;
	s=zohomail; d=collabora.com; i=nicolas.frattaroli@collabora.com;
	h=From:From:To:To:Cc:Cc:Subject:Subject:Date:Date:Message-ID:In-Reply-To:References:MIME-Version:Content-Transfer-Encoding:Content-Type:Message-Id:Reply-To;
	bh=tfnGcQSUHbLimk8z8aZ3QSd/T6JAuGeb919MpsyxEvo=;
	b=b4dEefdSzxzo0UixhUC9rGQqPy00a2fiwxiLzerpmJqIc1MixsZgnSaIWYd/8uOQ
	om56GC0tC26vEt3ywPCxM/ZjNDIE2GvM+3Ahs5j0S/WZGIkaakUTE85sq2bHar2R78a
	IYLrcqqZl0kUlJ5QnAl8q5f0LNbdLgqO8KGULl2g=
Received: by mx.zohomail.com with SMTPS id 1749203480891403.2196795067804;
	Fri, 6 Jun 2025 02:51:20 -0700 (PDT)
From: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
To: lgirdwood@gmail.com, broonie@kernel.org, perex@perex.cz, tiwai@suse.com,
 heiko@sntech.de, linux-rockchip@lists.infradead.org,
 linux-sound@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, Pei Xiao <xiaopei01@kylinos.cn>
Cc: Pei Xiao <xiaopei01@kylinos.cn>
Subject:
 Re: [PATCH v2 2/2] ASOC: rockchip: Use helper function devm_clk_get_enabled()
Date: Fri, 06 Jun 2025 11:51:17 +0200
Message-ID: <2818018.CQOukoFCf9@workhorse>
In-Reply-To:
 <84bc40641d05596f1edf4f01d1e6aea16bdbeeb5.1749201126.git.xiaopei01@kylinos.cn>
References:
 <cover.1749201126.git.xiaopei01@kylinos.cn>
 <84bc40641d05596f1edf4f01d1e6aea16bdbeeb5.1749201126.git.xiaopei01@kylinos.cn>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="utf-8"

On Friday, 6 June 2025 11:18:22 Central European Summer Time Pei Xiao wrote:
> Since commit 7ef9651e9792 ("clk: Provide new devm_clk helpers for prepared
> and enabled clocks"), devm_clk_get() and clk_prepare_enable() can now be
> replaced by devm_clk_get_enabled() when driver enables the clocks for the
> whole lifetime of the device. Moreover, it is no longer necessary to
> unprepare and disable the clocks explicitly.
> 
> Signed-off-by: Pei Xiao <xiaopei01@kylinos.cn>
> ---
>  sound/soc/rockchip/rockchip_sai.c | 35 +++++++++----------------------
>  1 file changed, 10 insertions(+), 25 deletions(-)
> 
> diff --git a/sound/soc/rockchip/rockchip_sai.c b/sound/soc/rockchip/rockchip_sai.c
> index 916af63f1c2c..0b9f54102d69 100644
> --- a/sound/soc/rockchip/rockchip_sai.c
> +++ b/sound/soc/rockchip/rockchip_sai.c
> @@ -1427,43 +1427,32 @@ static int rockchip_sai_probe(struct platform_device *pdev)
>  	if (irq > 0) {
>  		ret = devm_request_irq(&pdev->dev, irq, rockchip_sai_isr,
>  				       IRQF_SHARED, node->name, sai);
> -		if (ret) {
> +		if (ret)
>  			return dev_err_probe(&pdev->dev, ret,
>  					     "Failed to request irq %d\n", irq);
> -		}
>  	} else {
>  		dev_dbg(&pdev->dev, "Asked for an IRQ but got %d\n", irq);
>  	}
>  
>  	sai->mclk = devm_clk_get(&pdev->dev, "mclk");
> -	if (IS_ERR(sai->mclk)) {
> +	if (IS_ERR(sai->mclk))
>  		return dev_err_probe(&pdev->dev, PTR_ERR(sai->mclk),
>  				     "Failed to get mclk\n");
> -	}
>  
> -	sai->hclk = devm_clk_get(&pdev->dev, "hclk");
> -	if (IS_ERR(sai->hclk)) {
> +	sai->hclk = devm_clk_get_enabled(&pdev->dev, "hclk");
> +	if (IS_ERR(sai->hclk))
>  		return dev_err_probe(&pdev->dev, PTR_ERR(sai->hclk),
>  				     "Failed to get hclk\n");
> -	}
> -
> -	ret = clk_prepare_enable(sai->hclk);
> -	if (ret)
> -		return dev_err_probe(&pdev->dev, ret, "Failed to enable hclk\n");
>  
>  	regmap_read(sai->regmap, SAI_VERSION, &sai->version);
>  
>  	ret = rockchip_sai_init_dai(sai, res, &dai);
> -	if (ret) {
> -		dev_err(&pdev->dev, "Failed to initialize DAI: %d\n", ret);
> -		goto err_disable_hclk;
> -	}
> +	if (ret)
> +		return dev_err_probe(&pdev->dev, ret, "Failed to initialize DAI\n");
>  
>  	ret = rockchip_sai_parse_paths(sai, node);
> -	if (ret) {
> -		dev_err(&pdev->dev, "Failed to parse paths: %d\n", ret);
> -		goto err_disable_hclk;
> -	}
> +	if (ret)
> +		return dev_err_probe(&pdev->dev, ret, "Failed to parse paths\n");
>  
>  	/*
>  	 * From here on, all register accesses need to be wrapped in
> @@ -1474,10 +1463,8 @@ static int rockchip_sai_probe(struct platform_device *pdev)
>  	devm_pm_runtime_enable(&pdev->dev);
>  	pm_runtime_get_noresume(&pdev->dev);
>  	ret = rockchip_sai_runtime_resume(&pdev->dev);
> -	if (ret) {
> -		dev_err(&pdev->dev, "Failed to resume device: %pe\n", ERR_PTR(ret));
> -		goto err_disable_hclk;
> -	}
> +	if (ret)
> +		return dev_err_probe(&pdev->dev, ret, "Failed to resume device\n");
>  
>  	ret = devm_snd_dmaengine_pcm_register(&pdev->dev, NULL, 0);
>  	if (ret) {
> @@ -1504,8 +1491,6 @@ static int rockchip_sai_probe(struct platform_device *pdev)
>  	/* If we're !CONFIG_PM, we get -ENOSYS and disable manually */
>  	if (pm_runtime_put(&pdev->dev))
>  		rockchip_sai_runtime_suspend(&pdev->dev);
> -err_disable_hclk:
> -	clk_disable_unprepare(sai->hclk);
>  
>  	return ret;
>  }
> 

Acked-by: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
Tested-by: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>

Thank you!




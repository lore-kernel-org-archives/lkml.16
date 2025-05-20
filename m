Received: from mail-yb1-f169.google.com (mail-yb1-f169.google.com [209.85.219.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 28FEA19F461
	for <linux-kernel@vger.kernel.org>; Tue, 20 May 2025 12:42:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747744982; cv=none; b=GSpI12vGi6/TSUJ93FGw1wE6hv2ET1RDdbRw1oREy6DAPrcArxtIc60kDjoVblt3ZkhIaGi35GOLdCNKBxY89pNjUEKWvHwpTQHd+nzRSosgcY843YhjZuh/XxOcrirP1YomyPWkydWL14W5l1qPs2fgW8nBtiPltXVtQWMC0dA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747744982; c=relaxed/simple;
	bh=kAYBhgA7SbgPwIuhLi3KNN6TuETDW3sCCCLPjUs9KLY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=tbJZajCJ1aOr06mD94qztx60LqMc0V+8dB5vMsp+HKVsRIQPqGPHN3SoVdSx5MKAxt7824R2l9I8uAUqFqPzlY1PaopJsgm0tT5gpqjI6+brlb97FbKlZT2bbdqiWJNHViFM+94MVAp7ngG2q2TPxacl0eiOLP7ErsQVmadTUms=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=z68jTGdF; arc=none smtp.client-ip=209.85.219.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="z68jTGdF"
Received: by mail-yb1-f169.google.com with SMTP id 3f1490d57ef6-e7b3178473eso5192144276.2
        for <linux-kernel@vger.kernel.org>; Tue, 20 May 2025 05:42:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1747744978; x=1748349778; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=88lOLN3//BdORRDyk/6LjlOBy9fkXDogVmGs1sgPhyI=;
        b=z68jTGdFqiP6o81qhSPfWRQRBkTV68YKQY5rKGT9CAo0H+HjAXa4IDbhPYQLD/0m/A
         szy5ZbxzUoFCGFcXm+9cseyJm8i2GVo+Bl0W/SlByNxBlKXNu7uCRh4au012ZLSHVJpq
         hvyXUGGQT7tYWXQLFERvM8QFyzQAjwAA1aSqjeh9kWWYTRUltZE5Z6/VD8MQCWk7jL8C
         uF5/wjjpyZRDo+Aj7xAODjjf44F8fpNVXOOGDNUcxoxaVSfSLt3AtkN4aF5XGfmz6VNa
         GsevA4kQw122PHEaY4UBLaHW76GvyvyJUG7EX+/zCFtXswtE/T5t98OoKMgBWess8xRV
         3lyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747744978; x=1748349778;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=88lOLN3//BdORRDyk/6LjlOBy9fkXDogVmGs1sgPhyI=;
        b=lCb2XkvFQjxidUdJ1xaCJ/z8aoTYCW2q2MNfqqQTvVVl/IttjdGNInHnUSc38x9WMJ
         rTIWCEqx6t+NqyVxONUAI9+JCWtD2HI29ly3S5jolmNKTtO18d4QwoKMxFg4xLBiOHoK
         jOfqdE8GDHNrZxgxwfnBdGWgvMDFnw03s3U5CAJsHqjEom6FWD4xbp2zoA8Lyex4hAHV
         rMhg1p0S6W5kQDe9h0wFOQH5E2E8S+++MnXzQxKV7MaFCP+Au9fzxcK2XsYMVqTYnlnJ
         aMrV2dDSQv9yofv5bn7nV9bMxNO89KJEaFQx6iOa68htYX604dYMZXAu/l/GBM86rVoK
         18ag==
X-Forwarded-Encrypted: i=1; AJvYcCUlHhXdH6PC+73dlFn2TG3dB1KBJ4n4LCk9XbMZjcvRehXNgUZ5d60UnZseYDrMrVDCguJCFVpsG+rDHKA=@vger.kernel.org
X-Gm-Message-State: AOJu0YxHq5oeQijswef43jXA9RddJgDQ1QZj5PchmHslO0WrO1nFFhxl
	PrCbdBwXefAq2EXRjHBGvkw2d30XISbaE9mimu8qffMH80FejeGfwUimklMC1d3e/cD3l3BlRPP
	5oVI8hVOqw2VJIxqasJerikOeelAtKnBngBgZbr6t0A==
X-Gm-Gg: ASbGncvrOnG5xY1OXw5lrCbqBFq6XVma+Dkm5vB2uxX98PVTMf8bsYYMBqEcD/b5PsK
	TE26y3baqfzuKU/r7kf1SaNt0Up+UKDaJ/cDbapYSnIJ4nXJWRRX69CW4siJhF/73fOsH4agZfs
	eAmPHOxe5awYOKcoOQUsAEQ12HqiJ+JqeE8Q==
X-Google-Smtp-Source: AGHT+IGhT+v8r+0GZsiYhs7CHph95cb2P8MRGP6RGC8fZ7dFYUwqCE9+mfUsNw7SyUvETHMbFtvpOAcTqK/Ng1hl+qE=
X-Received: by 2002:a05:6902:1201:b0:e79:774:866f with SMTP id
 3f1490d57ef6-e7b69e80915mr20083103276.17.1747744978059; Tue, 20 May 2025
 05:42:58 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250518220707.669515-1-jonas@kwiboo.se> <20250518220707.669515-6-jonas@kwiboo.se>
In-Reply-To: <20250518220707.669515-6-jonas@kwiboo.se>
From: Ulf Hansson <ulf.hansson@linaro.org>
Date: Tue, 20 May 2025 14:42:20 +0200
X-Gm-Features: AX0GCFs3Un2EF18YwTSrDKI84LtGeBLBa79SYyXbjLKaJiwIZzX41KzumIQh4bM
Message-ID: <CAPDyKFqu-ox90dEnK8L0C8CqXJDsvgGwH00__nfQcOYu8hNM9Q@mail.gmail.com>
Subject: Re: [PATCH 5/9] dt-bindings: mmc: sdhci-of-dwcmhsc: Allow use of a power-domain
To: Jonas Karlman <jonas@kwiboo.se>
Cc: Heiko Stuebner <heiko@sntech.de>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Jisheng Zhang <jszhang@kernel.org>, Yao Zi <ziyao@disroot.org>, Chukun Pan <amadeus@jmu.edu.cn>, 
	linux-rockchip@lists.infradead.org, linux-pm@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-mmc@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Mon, 19 May 2025 at 00:07, Jonas Karlman <jonas@kwiboo.se> wrote:
>
> The commit 7e856617a1f3 ("dt-bindings: mmc: Add support for rk3576
> eMMC") limited use of power-domains to Rockchip RK3576.
>
> Remove the power-domains: false to allow use of power-domains with more
> controllers, e.g. with SDHCI on Rockchip RK3528.
>
> Signed-off-by: Jonas Karlman <jonas@kwiboo.se>

Applied for next, thanks!

Kind regards
Uffe


> ---
>  Documentation/devicetree/bindings/mmc/snps,dwcmshc-sdhci.yaml | 4 ----
>  1 file changed, 4 deletions(-)
>
> diff --git a/Documentation/devicetree/bindings/mmc/snps,dwcmshc-sdhci.yaml b/Documentation/devicetree/bindings/mmc/snps,dwcmshc-sdhci.yaml
> index 5fb347167004..f882219a0a26 100644
> --- a/Documentation/devicetree/bindings/mmc/snps,dwcmshc-sdhci.yaml
> +++ b/Documentation/devicetree/bindings/mmc/snps,dwcmshc-sdhci.yaml
> @@ -120,10 +120,6 @@ allOf:
>        required:
>          - power-domains
>
> -    else:
> -      properties:
> -        power-domains: false
> -
>  unevaluatedProperties: false
>
>  examples:
> --
> 2.49.0
>

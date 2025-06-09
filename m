Received: from mail-yb1-f172.google.com (mail-yb1-f172.google.com [209.85.219.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8924625C815
	for <linux-kernel@vger.kernel.org>; Mon,  9 Jun 2025 14:26:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749479164; cv=none; b=iHzci26/IaYv3alDbSUBpihpQmcSR2WbR+RrTu+zc9qIuf/oW2q6Rabmy0SyYb4b8R76PJo35xGyvqljFGuufKc+KwBVCx6bF0wx4Q86qfSn3zRSHQyljXc0tK56tFGPECun+uN4xgrvYG4nbwJRTSBELl/QlP5Mxo1yAGco2tE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749479164; c=relaxed/simple;
	bh=gdvZDOuvL6fapYTdmREqzJtRfeKF8oOA7wtfhf4NLzQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=nc03vw0FQBlt18H78qebZE9IkdQb4/XPxARPabbU2bILcRQy0P91D5kLktFp9FDD3OUjiqzRntzzeRasDvr8jh7HfboGaVZsUwcvUjWVb9GzZC3wLv2XArp+Jv5DVyTu0+GTo9eRQ40UofY6r3L2HkZBmzjnEHq5g0RK3val6Zc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=tn/VpdC2; arc=none smtp.client-ip=209.85.219.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="tn/VpdC2"
Received: by mail-yb1-f172.google.com with SMTP id 3f1490d57ef6-e81cf6103a6so1167541276.3
        for <linux-kernel@vger.kernel.org>; Mon, 09 Jun 2025 07:26:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1749479161; x=1750083961; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=kmc+XBP73DggJUv8T7xxNG1d8C/BNb5bhPDGJBM+T0c=;
        b=tn/VpdC24PWsIq1hGuP+HHprklAYiYaU+h7u6yC7ep1Wqtomes71dfnI7X38gUzXWT
         h4WdoHhxjNqY70Q7X4y/V4CjUiTfqhgsKzCrMcAltMlnKETK9lacl2vO2BuOKipO2Mde
         gNHTuiux48H865j3FUsr6g+uuUN4ME0DNhb87jbNO7qpJleNcFEroXvaOxcZMcL4X4qs
         ShnRSDoJn3I9MRBir/2u+/OapGuplqYbChS3vZiUm8qO1ELtX70imM4LlRnwSpmNxZoU
         L8mjc4ruZrKSHpjpi0O0kpf3pO5z+jjvFAl6fXyGvCpENk+iFALWDiEaPHUeFjrpoffg
         Cfaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749479161; x=1750083961;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=kmc+XBP73DggJUv8T7xxNG1d8C/BNb5bhPDGJBM+T0c=;
        b=Ibq+8PApNk2ebTVcVpqD+Lqx/YaNSuUt0jp9V0Q8NIeK4o2W+7PIJAl+/qwY+3EmN4
         oS6yNNcnDEGaRMZ61k/N1w1m9saYdm1MlaG/RG8bjg6rwo10+YBIuxhx+ygZAdL668Zk
         WTtpbkck9DyJqgt1tZZKJbOtdwMhWnriPTRJFvtj7d9T97AYbxXMbrEF1i27dv3fyHYR
         tk3rcGlDCI+hphb/FJZeK/n6LGnHfgCeXnskgbxbH3xMCZaPbjqOm2dmEW5+4Mxc/cwQ
         wgFfgMAg/QyPXqzRYXFqCqzb6cMtszXimptVM5rZaEa/eMmCZyJrysy7yuDBCEjuXNuz
         iepw==
X-Forwarded-Encrypted: i=1; AJvYcCXA4a3I26fnJQoNRin3t0ERX7/BoNigyKz1ry18uFFZQud8v+RIIJmbU8jSUqHCiAdoq/Odu/RSkoxIwKc=@vger.kernel.org
X-Gm-Message-State: AOJu0YyJTocb1NY0qzIElIghx7BtAiGY4drUJcX6/i3oPXTNGp/5tGbs
	SQAYAn+lrOLlG7T2qnuE2BhjjgWPiNYhMjj3Ir3LdKbz3u/EPgVsxxvfRO37eS1Y8pOH8Uag/AM
	9zr/oql5gdS11zgnXJ2pB1UNWRAbiyHpw35zwq3TIsg==
X-Gm-Gg: ASbGncse7kjFmmI2o4qunKFrWkN/2083QENdpHIYetI9ufx7rLI/+SRBx3iQKkhKbjq
	0sOB+iEYw9o4Hg3oshWDOGxLQ2xpei7c3oCMSbwmHOACyr+rKzBw2hw8jYmYPdyuZufXsjRrrn5
	ih00+naYVuxsQpPd3c+p/I8xzQfY3MSMms2HDif0gHotIG
X-Google-Smtp-Source: AGHT+IFKLep+oVnJLAdhYlsfnnGURCM0jm5x9XuhkDAOYH3BwxGyY+sHbb4Wkeme1jFAonQLcsi0Q2V0d9n0diMCHJo=
X-Received: by 2002:a05:6902:f84:b0:e81:9aa9:88cd with SMTP id
 3f1490d57ef6-e81a20d40demr18795796276.8.1749479161518; Mon, 09 Jun 2025
 07:26:01 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <174908565814.4056588.769599127120955383.stgit@mhiramat.tok.corp.google.com>
In-Reply-To: <174908565814.4056588.769599127120955383.stgit@mhiramat.tok.corp.google.com>
From: Ulf Hansson <ulf.hansson@linaro.org>
Date: Mon, 9 Jun 2025 16:25:24 +0200
X-Gm-Features: AX0GCFvF_id35MOPl_pL8yIz8wUA8Ns9lzvlVE2LmtTNl-drJlr2CqeBViKQxTQ
Message-ID: <CAPDyKFrejbW1d+jSSJE4K8Zb08CeMHiH9pC=Sr=Y51Lyy4Fhow@mail.gmail.com>
Subject: Re: [PATCH] mtk-sd: Fix a pagefault in dma_unmap_sg() for not
 prepared data
To: "Masami Hiramatsu (Google)" <mhiramat@kernel.org>
Cc: Chaotian Jing <chaotian.jing@mediatek.com>, Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	Sergey Senozhatsky <senozhatsky@chromium.org>, linux-mmc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-mediatek@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"

On Thu, 5 Jun 2025 at 03:07, Masami Hiramatsu (Google)
<mhiramat@kernel.org> wrote:
>
> From: Masami Hiramatsu (Google) <mhiramat@kernel.org>
>
> mtk-msdc driver causes a kernel crash after swiotlb buffer is full.
>
> ---
> mtk-msdc 11240000.mmc: swiotlb buffer is full (sz: 16384 bytes), total 32768 (slots), used 32732 (slots)
> mtk-msdc 11240000.mmc: msdc_track_cmd_data: cmd=18 arg=0397A6F8; host->error=0x00000004
> Unable to handle kernel paging request at virtual address ffffffffc0001fc0
> ---
>
> When swiotlb buffer is full, the dma_map_sg() returns 0 to
> msdc_prepare_data(), but it does not check it and sets the
> MSDC_PREPARE_FLAG.
>
> swiotlb_tbl_map_single() /* prints "swiotlb buffer is full" */
>   <-swiotlb_map()
>     <-dma_direct_map_page()
>       <-dma_direct_map_sg()
>         <-__dma_map_sg_attrs()
>           <-dma_map_sg_attrs()
>             <-dma_map_sg()  /* returns 0 (pages mapped) */
>               <-msdc_prepare_data()
>
> Then, the msdc_unprepare_data() checks MSDC_PREPARE_FLAG and calls
> dma_unmap_sg() with unmapped pages. It causes a page fault.
>
> To fix this problem, Do not set MSDC_PREPARE_FLAG if dma_map_sg()
> fails because this is not prepared.
>
> Fixes: 208489032bdd ("mmc: mediatek: Add Mediatek MMC driver")
> Signed-off-by: Masami Hiramatsu (Google) <mhiramat@kernel.org>

Applied for fixes and by adding a stable-tag, thanks!

Note that it looked like the patch was not entirely correctly
formatted, but I fixed it up when applying. Please have a look at the
fixes branch to make sure things look okay to you.

Kind regards
Uffe



> ---
>  drivers/mmc/host/mtk-sd.c |    3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/mmc/host/mtk-sd.c b/drivers/mmc/host/mtk-sd.c
> index 345ea91629e0..3594010bc229 100644
> --- a/drivers/mmc/host/mtk-sd.c
> +++ b/drivers/mmc/host/mtk-sd.c
> @@ -827,9 +827,10 @@ static inline void msdc_dma_setup(struct msdc_host *host, struct msdc_dma *dma,
>  static void msdc_prepare_data(struct msdc_host *host, struct mmc_data *data)
>  {
>         if (!(data->host_cookie & MSDC_PREPARE_FLAG)) {
> -               data->host_cookie |= MSDC_PREPARE_FLAG;
>                 data->sg_count = dma_map_sg(host->dev, data->sg, data->sg_len,
>                                             mmc_get_dma_dir(data));
> +               if (data->sg_count)
> +                       data->host_cookie |= MSDC_PREPARE_FLAG;
>         }
>  }
>
>

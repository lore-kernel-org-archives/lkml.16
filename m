Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com [209.85.214.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 824A033E4
	for <linux-kernel@vger.kernel.org>; Wed, 25 Jun 2025 03:56:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750823805; cv=none; b=A3uzPGHeIHSglvx/zNeGSUa0E+G7QgtSv51H8kWrai41xKi+X61LgJXaIveIE8JdWxBdHFgCQS1Uw71blbytdr824VpUlNmlQGfp+f453qVCeDSets3ASL02m/EkhzDE/st2Q5/wpFQBlvMx8W6D/HIrfD7ykS7/ujDrffeCrxg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750823805; c=relaxed/simple;
	bh=QZmcsAGxqbMFidkCXEJeYFqV/17pYrQAZ8O/qXqBvTw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Dcay0lwAdXwl2kLfsKd2nyZfAmBFpcIwEE7M0zH5rOWwAs2z2+73KCUu9tzfLG8Mbt38qkhlGZ9MbPjNHaCOLPZUZPhyD4g10iAhKQh5QyIqGdHbIdfktTV1N5Ef5GS0Y8240JxMDCB9gUSL+5kqiunnoWgbMwEXFAXbmTmtyZE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=k8p49A6J; arc=none smtp.client-ip=209.85.214.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="k8p49A6J"
Received: by mail-pl1-f178.google.com with SMTP id d9443c01a7336-23636167b30so60005375ad.1
        for <linux-kernel@vger.kernel.org>; Tue, 24 Jun 2025 20:56:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1750823803; x=1751428603; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=9o0KljyHVk+7sXYfHcEUOJPUxLqwYfEPoUFxmr/QpIE=;
        b=k8p49A6JiCLhiIxb9it6zphMucwtXXEIbBuuf//hyWZk8E9Qyrf9wQhyNUX3FwHJR5
         OlSZw209yiTvLQlBYhBeK8ay/Ep9+70tjQXjoBc8eVUYXWRaYh1dFjQLqnYlg96aaQ2m
         l+AzWNeArpRB/6pRlUJReFrr5kdPZ/ZMDpoJM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750823803; x=1751428603;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9o0KljyHVk+7sXYfHcEUOJPUxLqwYfEPoUFxmr/QpIE=;
        b=fSP/I+mINoISwfo+Q42BdA9VgCExVFGKHkMWXf3ojZnj/0EtKg0755fNUVLqciag9j
         eNRmFgSc/E9AHnURAYZ9cAQtBUcGgMtpAR7ma0incYLPSak/JnudHDr6l309h+DRi1GD
         Nhm3hYoFYerJiVC6H/RsvfzJPJSv2pcJTQTCVgRo6IzpVGmGly0qiBl9hXEoIQDrimUE
         dFmtJh1DECc4o5pEboYEaiul/mgfKNdKFF3ynV4Xf+WzSX3VCirfzTYgLJMx5BhafU0R
         YLyzw4W7MuDg7B4bCi9es5EQ7oVDhARwUPP2yE6HnoY47EsMwCpKfhtWTjMTWX3niBE8
         bXog==
X-Forwarded-Encrypted: i=1; AJvYcCVdOS7zdyg9kI0ENQxGLaywQl3MjYz1cxW/W6fPIm/dBGTl++rpu757ZnAju1f/VZNkuWSHTQwzDmGm4po=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz4kkVS36GMZ2Yemig69kJlBObbsatOdBvd0dSZXPiRizzFKB17
	M0zdrscaP3Si2BtfiVOb9hG8TEp1+1ZzvQ5rNT9bUG9QL4oJQbLRqQDZYQt49VwujDkrJUZ8uva
	b7Tw=
X-Gm-Gg: ASbGnctorG0cFtkh1LZVnPg+tMijHj8VjbZ7KVHQByi3XcvWcSVPvKjhhPsUgV17DE8
	y83XsqAN+u/UPXGOhmvvFJraFhFObo+Ks2VqmZxKlk59EiKHx2HnKDRQTu/x5x+NfLqCI0/4vFP
	qtHkXvzJUO8v2ND4tUyGjmxb+rVa0WSFg3HRcdEZHmp+EGaDDiVT5J5nkRMe0d4DtHTzXQduMxi
	43Fabxm3HCpbwG0+EycXwvXqgEeAZD2UzmSaqgL96o0uC0vzFZyntYWla5ZfnpfazhUEI17q4//
	WC3rPoVArUpjgLfxteaJ/blwTZF2eEHpb5bO6UiUcQ01rRzrPtjnAoj3S6e8/z1qBA==
X-Google-Smtp-Source: AGHT+IG+CeEoTYFYhlYaB+yW8OoKCv/2xwINqlcoXHtLLRpl6uhTmRRfAU8psN49GXJz73OFHB26Yw==
X-Received: by 2002:a17:903:1b2f:b0:234:c5c1:9b7a with SMTP id d9443c01a7336-23823f65e32mr21155175ad.8.1750823802811;
        Tue, 24 Jun 2025 20:56:42 -0700 (PDT)
Received: from google.com ([2401:fa00:8f:203:301e:ee9a:3fb5:c761])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-237d875bc8asm118910865ad.258.2025.06.24.20.56.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Jun 2025 20:56:42 -0700 (PDT)
Date: Wed, 25 Jun 2025 12:56:37 +0900
From: Sergey Senozhatsky <senozhatsky@chromium.org>
To: "Masami Hiramatsu (Google)" <mhiramat@kernel.org>
Cc: Chaotian Jing <chaotian.jing@mediatek.com>, 
	Ulf Hansson <ulf.hansson@linaro.org>, Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Tomasz Figa <tfiga@chromium.org>, 
	Sergey Senozhatsky <senozhatsky@chromium.org>, linux-mmc@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
Subject: Re: [PATCH] mtk-sd: Prevent memory corruption from DMA map failure
Message-ID: <kgxqtfdrlc5m5kgprjajt4xtngken2u2locauzhsxm7kcowusa@44ncy4vhy5vx>
References: <174972756982.3337526.6755001617701603082.stgit@mhiramat.tok.corp.google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <174972756982.3337526.6755001617701603082.stgit@mhiramat.tok.corp.google.com>

On (25/06/12 20:26), Masami Hiramatsu (Google) wrote:
[..]
> +static bool msdc_data_prepared(struct mmc_data *data)
> +{
> +	return data->host_cookie & MSDC_PREPARE_FLAG;
> +}
> +
>  static void msdc_unprepare_data(struct msdc_host *host, struct mmc_data *data)
>  {
>  	if (data->host_cookie & MSDC_ASYNC_FLAG)
> @@ -1466,8 +1471,18 @@ static void msdc_ops_request(struct mmc_host *mmc, struct mmc_request *mrq)
>  	WARN_ON(!host->hsq_en && host->mrq);
>  	host->mrq = mrq;
>  
> -	if (mrq->data)
> +	if (mrq->data) {
>  		msdc_prepare_data(host, mrq->data);
> +		if (!msdc_data_prepared(mrq->data)) {
> +			/*
> +			 * Failed to prepare DMA area, fail fast before
> +			 * starting any commands.
> +			 */
> +			mrq->cmd->error = -ENOSPC;
> +			mmc_request_done(mmc_from_priv(host), mrq);

Do we end up having a stale/dangling host->mrq pointer here?

> +			return;
> +		}
> +	}
>  
>  	/* if SBC is required, we have HW option and SW option.
>  	 * if HW option is enabled, and SBC does not have "special" flags,
> 

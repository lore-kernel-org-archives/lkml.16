Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com [209.85.214.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 08D4E2F2A
	for <linux-kernel@vger.kernel.org>; Thu,  5 Jun 2025 01:14:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749086063; cv=none; b=Gx7Y+28eu4z9FnCpCLL78tkwqO8of94y1Y9uv936gizt8jaK2KsF8hsy778c1slCaHn5oPJlhHSr2d35nJvlo0bwsC/Uiye2b+sU/PzDu2w6KTZL13BpJ87Z0vQrj7Xmvu4bs/FoTLXDoMeN57gzZxpA5b1dUzJ8/rqe0LkYZtE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749086063; c=relaxed/simple;
	bh=VpwSnO3TEovl9FwPBZch/PLoVkB6RcDLjgSlrPemoRI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=UzrrGcOazoaC4K1gijMwTUTYDzwgeYVqJTNMDlbw3VxjkwlRk4z+v5P5YLYJ6EJaFCwVIjcbc6oPmSdIX524T3nu89eEX43GEwsElCz9Lf3l/b4hYtM7WD3QkTsf3Zbj0n1/FQpEOZLp/bddfuIFAA9DnADDwBAocaN14EGuvdE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=Muli3IKF; arc=none smtp.client-ip=209.85.214.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="Muli3IKF"
Received: by mail-pl1-f181.google.com with SMTP id d9443c01a7336-22e09f57ed4so14734145ad.0
        for <linux-kernel@vger.kernel.org>; Wed, 04 Jun 2025 18:14:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1749086061; x=1749690861; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=xG0Wdkt+NUraD2HgOh+0AFsEQcpWyh1rmYJFEEo12N4=;
        b=Muli3IKFnhD8hkdrwrBYqX0ZeJfis73NNHv/PJz4AdA4aKVGrIcMvFOLOi7SkwpA2F
         upUgt5OOOTFJ9TlXddemnLZw7Qq73tI3JtqV3wuPEbOZ/B4doYR5ZdkHP/Tb0DImJO3S
         9wqMhjF/7qqJpl8++utcwHPTm1KwqHEs/Iu68=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749086061; x=1749690861;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xG0Wdkt+NUraD2HgOh+0AFsEQcpWyh1rmYJFEEo12N4=;
        b=fYgLs4/wdE16Xu+XjWh64ufAiCOn80ZeZYcDWfs5Ya0Lw/jmPSKsO3QMssz/w2gNp6
         iZYshfYXc2MNGzrws+5qhhy/t3zvZqqgPUVoeGpJ4bBpIhC+QBOVIRZ0DjaYVHsAV8ZZ
         9RkXeUCCYVeCj9nS0dJKGh0JxASrcGnGcFxxsdl0vruyIt8XhJtI28g+OYkR/od400oq
         gh3WJfCOYwhoh+IYK+HiiwmX9ayp5BZsGcEFqlBZSfIwwK+R/UdOVYIpo5oI/tm0A/7h
         0Y5io27JKohrCXIjOJNpXrkYPsEWH0jNXxd21ciAwFoULrSzrm6yzsN0CIUsMsR0ILrA
         cZ6w==
X-Forwarded-Encrypted: i=1; AJvYcCX4Cd9j2uQ1S68Ak7lam3ZgMYcfFNiaQW6kleaoGz0kh9ILuOlMrUMRWBKgDjJrIeaYY0fdc5SksWMvjes=@vger.kernel.org
X-Gm-Message-State: AOJu0Yzi1+UEjAm0gpRklaPsJdiwYtUtFVeYcPkNevHiiLgnEaEOdgmb
	SSlAZKgp30kEEe/eQ7bX1P2RfQkvIqU35z8mfOtXvYZ2I6nWXDOtokplxq1PmJN2Iw==
X-Gm-Gg: ASbGncsYFWODJx0Pa8Z7bWGiTEH3v4rbcOkVvephCEtZ45alEoH14lqLYKZIskPjq0h
	UL2CEppVUC9UhzSP8/CkbF2coDAoQnC6mwyw2Q85yXKj9+z6Zp8uTmkN+1yHDaXRlkooweN4rlt
	+k9LgTU/t/W2jNUteg4nMcmjkDS6Fxn4OMZPKCxFH4GEzBDyWinObE+S40L4dJjHHNTJUnebvLf
	zFgbXyRCMHWmHcwUemoAM+Pzu+KKTpjwnW1L8FKcHPb5tSRdS39VQDGGTWhz06xozvkHpWF7V19
	48aXmitAHAwS93T026UP9FmTgXgUTaZaaFJA/bRaYHYl7gaONPS0ZAf4WBr0oqOX9Q==
X-Google-Smtp-Source: AGHT+IGslAg+kZSR5r1KLQpvpTAyqVFFwVIFqW/069qKCAdAOWTjgfmHSrr73Y4oBWMXmc3qhryGWw==
X-Received: by 2002:a17:902:8f92:b0:221:89e6:ccb6 with SMTP id d9443c01a7336-235f16b216dmr15063785ad.25.1749086061279;
        Wed, 04 Jun 2025 18:14:21 -0700 (PDT)
Received: from google.com ([2401:fa00:8f:203:bc6e:7ca0:2017:eae9])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-23506bd908dsm110307055ad.59.2025.06.04.18.14.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Jun 2025 18:14:20 -0700 (PDT)
Date: Thu, 5 Jun 2025 10:14:15 +0900
From: Sergey Senozhatsky <senozhatsky@chromium.org>
To: "Masami Hiramatsu (Google)" <mhiramat@kernel.org>
Cc: Chaotian Jing <chaotian.jing@mediatek.com>, 
	Ulf Hansson <ulf.hansson@linaro.org>, Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Sergey Senozhatsky <senozhatsky@chromium.org>, 
	linux-mmc@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
Subject: Re: [PATCH] mtk-sd: Fix a pagefault in dma_unmap_sg() for not
 prepared data
Message-ID: <yf7ehbrvjj46xl7hkjukygnvy5z3ez43ewqch2mksx2lmkd5of@kthk42zpjabq>
References: <174908565814.4056588.769599127120955383.stgit@mhiramat.tok.corp.google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <174908565814.4056588.769599127120955383.stgit@mhiramat.tok.corp.google.com>

On (25/06/05 10:07), Masami Hiramatsu (Google) wrote:
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

Tested-by: Sergey Senozhatsky <senozhatsky@chromium.org>

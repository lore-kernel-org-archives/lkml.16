Received: from mail-yw1-f182.google.com (mail-yw1-f182.google.com [209.85.128.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA1532798FA
	for <linux-kernel@vger.kernel.org>; Mon, 28 Apr 2025 16:21:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745857321; cv=none; b=f+QCA8oayK+a7ZP6SMC3S7ai2J4R/xxxO1GfOShfHAbz8mJOl7cI/+v8xLCW9uEmlEvmbEQnxHLPq0pkwacVuMHwhkzsP3zBn0pD5L64VFFlkti2w5uHSc1VFLafT1xdE3ytsjmU7YJyVywiTuiDnQ2Of31U9tcy1b3u2DFrGug=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745857321; c=relaxed/simple;
	bh=KI3uLgLFW84fzWp03LD3SbB/OJ/xdc09KEqlRVDDi0I=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=dPNaZQYIGbUfSNqPUdpD5lkDwgUs40EmqB+NDHT3CWEJc1jdA4WFW4mUW78bI8vMFs16EfdYWNtt9CfpQk0XL9Bg56mBtjBovirUr/1QDBSO1GGd524rB6YTuU3zsqaQ9qLhOi6nMjvxMumLUDKFWX/6AVm1118ij9mdWK4qxAs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=zadHl9Qt; arc=none smtp.client-ip=209.85.128.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="zadHl9Qt"
Received: by mail-yw1-f182.google.com with SMTP id 00721157ae682-7086dcab64bso16336557b3.1
        for <linux-kernel@vger.kernel.org>; Mon, 28 Apr 2025 09:21:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1745857319; x=1746462119; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=hJGeBPRLcR0oAYZ212tMSFi3+j040Yo0nz0+Wv6VWzQ=;
        b=zadHl9QtUW1RHbj3DJsw+OLcDrTqEL/kxvQ/enSEXyZ2jj9Uc3ZPaRHfQV6xQY+jEy
         qTH89M2PmA0owTDk9VrKBlg3DPDECcbG5jcw7WaURqGr4NaiyAfedPn1RyUqus+EGqPa
         sNWSmwDq//0EsIO9sqT2QvzDbrxBhQ5I9ktcuIw9K56tYfDgW1QfIB3ZZLUQ+6rEjog0
         pcnQ36WPuKm2n+9tgGTEOW0dYGZE2kotlfkUihSfzRT0tnKs2uuvHlsZFa0qU9QAjChn
         GaRtQ/EyPIloRUA0h/LISp08Kk1UjZUYmEtPLXoLYzxnROuSXvyeCAyNjXppAQVl9aXd
         LUUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745857319; x=1746462119;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=hJGeBPRLcR0oAYZ212tMSFi3+j040Yo0nz0+Wv6VWzQ=;
        b=bBW0Fcy+gnsgoo0iNRCur5lsX7KxhPP7CuBL5zcMff9tpO7jKUE8r4ukPcjLQ1HgZB
         YXP9DtZjaVoNbjgcnnj+KS0odb3CUsnixUb7KeEshdKrmmpURJHI1T/8GwoWhShoNVsz
         4/IAwxi5jmrCzQ630dnO0dMI5PHFXGi/whlJu41yZ3lpsKjo3KvDwab6H/8Zvv6fV6jx
         xgZkcDBUqUO9+s5mGN3Xpw2yeX98bLUMNXqFPEPn/60kdQrc5QMuE0coM2K70yGzbonZ
         ddHe5w4NcPrTl2CSjiV9EEYbLM1UwAeOQ0C03nPijOJW0C2VIJwurPQxNF8NLNqiIX64
         P2Aw==
X-Forwarded-Encrypted: i=1; AJvYcCVPiL2wAKvBJzgxWhZU5rC6GVOxmE7PsjywxiC7btPGFsljgeFUUHk2KqXObVRjspoGTMzlXMbCqYwE9QQ=@vger.kernel.org
X-Gm-Message-State: AOJu0YwQSLdmCRvxp4KFx3JLPyoo1tQjhalj33HO2Rl/nUUSlgNx0d8H
	5ESURgErgyRi7lvFL37ne1hOstoEDmyiXnWX7w1wmJDmqWrjV3tbqO2+Jl3QmhyBSW+DRcdivyU
	R5VrD2f4TOeFx6rb6XQCcnjC7l2WSlunRjRc22g==
X-Gm-Gg: ASbGncuIr9217VgaL8/250SmLxQ/HWcjKk01ShcRJBULuQnO4cAnu5bOhrSrdc1iG00
	PyX7nVxlyTd9ZSRNlic9Cua2e1ydhu2Hf1XfmcHzB3KNAvcY9ocURYxJ2cqnkFKXv6UUefpob9q
	dQOxZvuK3nBImo/HXTwSsgkac=
X-Google-Smtp-Source: AGHT+IGrYKDES4LMpa+mIh07UTJ/v15OFEjt1tsB1hzJ8ctTDSYnqO23pd9t9YW+plDGT6Der9b8aB1xif3WroZEeyw=
X-Received: by 2002:a05:690c:7242:b0:703:b313:5399 with SMTP id
 00721157ae682-70899689193mr5627207b3.18.1745857318743; Mon, 28 Apr 2025
 09:21:58 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250417092742.27887-2-phasta@kernel.org>
In-Reply-To: <20250417092742.27887-2-phasta@kernel.org>
From: Ulf Hansson <ulf.hansson@linaro.org>
Date: Mon, 28 Apr 2025 18:21:22 +0200
X-Gm-Features: ATxdqUH6ctnF_T3pbMUAIl5-FXRkQ-V8HfKImBkR__1m7RCHSwSsQLKqxOF0BNM
Message-ID: <CAPDyKFqqV2VEqi17UHmFE0b9Y+h5q2YaNfHTux8U=7DgF+svEw@mail.gmail.com>
Subject: Re: [PATCH] mmc: cavium-thunderx: Use non-hybrid PCI devres API
To: Philipp Stanner <phasta@kernel.org>
Cc: Robert Richter <rric@kernel.org>, linux-mmc@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Thu, 17 Apr 2025 at 11:28, Philipp Stanner <phasta@kernel.org> wrote:
>
> cavium-thunderx enables its PCI device with pcim_enable_device(). This,
> implicitly, switches the function pci_request_regions() into managed
> mode, where it becomes a devres function.
>
> The PCI subsystem wants to remove this hybrid nature from its
> interfaces. To do so, users of the aforementioned combination of
> functions must be ported to non-hybrid functions.
>
> Moreover, since both functions are already managed in this driver, the
> calls to pci_release_regions() are unnecessary.
>
> Remove the calls to pci_release_regions().
>
> Replace the call to sometimes-managed pci_request_regions() with one to
> the always-managed pcim_request_all_regions().
>
> Signed-off-by: Philipp Stanner <phasta@kernel.org>

Applied for next, thanks!

Kind regards
Uffe


> ---
>  drivers/mmc/host/cavium-thunderx.c | 4 +---
>  1 file changed, 1 insertion(+), 3 deletions(-)
>
> diff --git a/drivers/mmc/host/cavium-thunderx.c b/drivers/mmc/host/cavium-thunderx.c
> index 2e2ff984f0b3..1373deb3f531 100644
> --- a/drivers/mmc/host/cavium-thunderx.c
> +++ b/drivers/mmc/host/cavium-thunderx.c
> @@ -72,7 +72,7 @@ static int thunder_mmc_probe(struct pci_dev *pdev,
>         if (ret)
>                 return ret;
>
> -       ret = pci_request_regions(pdev, KBUILD_MODNAME);
> +       ret = pcim_request_all_regions(pdev, KBUILD_MODNAME);
>         if (ret)
>                 return ret;
>
> @@ -164,7 +164,6 @@ static int thunder_mmc_probe(struct pci_dev *pdev,
>                 }
>         }
>         clk_disable_unprepare(host->clk);
> -       pci_release_regions(pdev);
>         return ret;
>  }
>
> @@ -183,7 +182,6 @@ static void thunder_mmc_remove(struct pci_dev *pdev)
>         writeq(dma_cfg, host->dma_base + MIO_EMM_DMA_CFG(host));
>
>         clk_disable_unprepare(host->clk);
> -       pci_release_regions(pdev);
>  }
>
>  static const struct pci_device_id thunder_mmc_id_table[] = {
> --
> 2.48.1
>

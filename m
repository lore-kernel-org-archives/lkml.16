Received: from mail-lf1-f47.google.com (mail-lf1-f47.google.com [209.85.167.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 125D8EAF1
	for <linux-kernel@vger.kernel.org>; Mon, 16 Jun 2025 09:29:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750066164; cv=none; b=dIAb9I0izNX8S1qhDqygo3gffc+BDPtIEp3MeLc80VFg5EDUX+VBJPD7zmtqZYemVsJk9bJPWETNeN6fB9a4u8e1ak4vyP0L9LZIOtVbAR+fSS3ohi3y8hfXtQ03cC2eHcR+x9A4cXEh9wUopckjYlI8bxgvf1Tlf2n9Pb6cS+k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750066164; c=relaxed/simple;
	bh=/lndhu9yGBe6TW5IJXLYk+C23E2rwVBACMXteTZseA4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=alzA74oqHzgWxnKdl5VnmWr5qxY2wwgHOnil539MvBIEaV676kwY232gHHBOVlcZpilULcm/Zl9ZXxN4ZDhcijchfN3KsfyrRk1wQo5q2yJ8TqPU90e46ENlIVOKC6+O6RfNN0cNMcx1CUhoYIGM10pxfGOyMkvsHgadyGdPzxU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=zfhLJJAS; arc=none smtp.client-ip=209.85.167.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="zfhLJJAS"
Received: by mail-lf1-f47.google.com with SMTP id 2adb3069b0e04-54b10594812so4245621e87.1
        for <linux-kernel@vger.kernel.org>; Mon, 16 Jun 2025 02:29:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1750066161; x=1750670961; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/lndhu9yGBe6TW5IJXLYk+C23E2rwVBACMXteTZseA4=;
        b=zfhLJJASk9uRG1em0/TbG22s4hKFheHRdOB/LmQ8+XBMAkYikRChtPhTyEpIt4/gp2
         aQz9y+vYAs/QTSh94jT5JNCecnVpEaEdOzioSAXTmbt0YsfKzRHrxOl2q6MRQ9MzXeih
         uiVAG2hlmSv1oKjgoapMoRMj/o0TpHImgaV616053GXkiWdc0lgDbV9U1Ile6LBf+ARt
         ZEV6QjjsBjKp6dSsoZeFu0hJAG0CGsPOBQIBQxs0ksmOBIShSjW7O6Mk5AoyQ33yRpnR
         uvRs+AjDGeayMEZ/IQUTInnlqmDSy7imOjxvFTz77wJTcAb8WFvdmrzxkyBQEFNsA6Va
         SlmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750066161; x=1750670961;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/lndhu9yGBe6TW5IJXLYk+C23E2rwVBACMXteTZseA4=;
        b=RZgLKwkJBybwX7BAumoA+Jez2YTconAO3U49+KojD1SHMn3O/9nRtemuxnpjtowhMT
         2gT0PiAw6st3LnWFES2r6g2ncc+HXLoVMEpXJm2QUc+iKR/vnnQLfxnFv0FuNLH6effL
         fnHEIw6P7WrZSPk3idvrFsMX9LfPUZdsSuyqMcGcU5+Y68cUu73JhyJIFPiNUsQdl2A2
         7vwznta9KpjeDpqUEFqkDThwWOFxK+zwCXp2rZcH5PGPRelwUvHFQA/bRwXg2GgDFvPX
         tFgrGdwWiAbZLZ+7cfCGEB+n9R0fxCKgrZSTYM7MdwMT3wLFhadY6JO2kUmicI+DCmxW
         oNLA==
X-Forwarded-Encrypted: i=1; AJvYcCXueU6Nai1FTHmCiTrgn5GfMPxOsQ+drHAtxjxlUBJ2Ve2u6z4Z1/O1t54FGevRgNEUNcJh9ztS2saiukA=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx5rRg/qO88Tv6ssKOYC9wsrYQgsBxFK/PtYgOefBbI73fWNXaW
	MWR/k8w0zTZfdgVocFLY79LPbPgoN+NsYqvKB8GHMslYAvnEmAlx3jcW1mLCJx83lGgMyGgW/Hg
	34ycAhSxefhSH/PGOcpvi+H5fJqG7tHWdzrWAonb5Gg==
X-Gm-Gg: ASbGnctd5QYr0fqOdBpbcVNPjZpjEk54nqNeqZbZwNPzV9h1G3XG3sPt33e2TevTtcE
	/hPp94/BfNsb8znIPsmxApWmi4ys7KXpR+2g7wk69vZJtUAbDpVWuYoXEl0QIXp2w/zNNMSJFgd
	tFeuCRTF+DIZ75XmeDUMBfFNC+x70sjIB9UJ+1tZEMOgQ84+4ilDN/8MKu045JQyW6XqsoFGe/9
	aE=
X-Google-Smtp-Source: AGHT+IGMxjIEHlU79k9xl0MB3VY8QpIujRZlki13HAtbUrVMtpOaF6xL9wF9B9gST0OonaZabCgNc4iKjM7QCrtDCcw=
X-Received: by 2002:a05:6512:1246:b0:553:2ff8:5e0b with SMTP id
 2adb3069b0e04-553b6f1a1f5mr2047128e87.42.1750066161069; Mon, 16 Jun 2025
 02:29:21 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250616053209.13045-1-mani@kernel.org>
In-Reply-To: <20250616053209.13045-1-mani@kernel.org>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Mon, 16 Jun 2025 11:29:09 +0200
X-Gm-Features: AX0GCFvBWNqrCYLkvyDb91OTPM5YHcglS8DHVJx53aZIUV0kN6F-iSKI34_nORM
Message-ID: <CAMRc=McN9mZXZfj65XAj_UFnCcMe46XMQzmHcUs+X6DKgxtpyQ@mail.gmail.com>
Subject: Re: [PATCH v3] PCI/pwrctrl: Move pci_pwrctrl_create_device()
 definition to drivers/pci/pwrctrl/
To: Manivannan Sadhasivam <mani@kernel.org>
Cc: bhelgaas@google.com, linux-pci@vger.kernel.org, 
	linux-kernel@vger.kernel.org, lukas@wunner.de, 
	Jim Quinlan <james.quinlan@broadcom.com>, Bjorn Helgaas <helgaas@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Jun 16, 2025 at 7:32=E2=80=AFAM Manivannan Sadhasivam <mani@kernel.=
org> wrote:
>
> pci_pwrctrl_create_device() is a PWRCTRL framework API. So it should be
> built only when CONFIG_PWRCTRL is enabled. Currently, it is built
> independently of CONFIG_PWRCTRL. This creates enumeration failure on
> platforms like brcmstb using out-of-tree devicetree that describes the
> power supplies for endpoints in the PCIe child node, but doesn't use
> PWRCTRL framework to manage the supplies. The controller driver itself
> manages the supplies.
>
> But in any case, the API should be built only when CONFIG_PWRCTRL is
> enabled. So move its definition to drivers/pci/pwrctrl/core.c and provide
> a stub in drivers/pci/pci.h when CONFIG_PWRCTRL is not enabled. This also
> fixes the enumeration issues on the affected platforms.
>
> Fixes: 957f40d039a9 ("PCI/pwrctrl: Move creation of pwrctrl devices to pc=
i_scan_device()")
> Reported-by: Jim Quinlan <james.quinlan@broadcom.com>
> Closes: https://lore.kernel.org/r/CA+-6iNwgaByXEYD3j=3D-+H_PKAxXRU78svPMR=
HDKKci8AGXAUPg@mail.gmail.com
> Suggested-by: Bjorn Helgaas <helgaas@kernel.org>
> Signed-off-by: Manivannan Sadhasivam <mani@kernel.org>
> ---

Acked-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

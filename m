Received: from mail-pj1-f49.google.com (mail-pj1-f49.google.com [209.85.216.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F96924339A
	for <linux-kernel@vger.kernel.org>; Mon, 10 Feb 2025 06:36:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739169372; cv=none; b=bICMPxpbVvuHJyTWRU+Mljs0sUPjOY5DOg+fhHqHFaMFB7yhY5SsgAqf7jsEJqCVFpPz5u7HxNBSyVRl3XJHv5hUCge9s8FfGizpG00wmjUZdsSN5f318vJdSJfIg7RNvNjsm1i+vxON0gmF/7hhSg9G5+8BMWjsKTjywZUvLcc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739169372; c=relaxed/simple;
	bh=1bOoaPtsgRH0cJTmlUkB0maTDhPmTkEvVZXX+KpseUs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=M43dg94JuzfHKs0UBbmoJuIdd2Ym3z/e3yZluMoARWfDgZfEnQfriP5bRYdWAkV2x82E35tnFSn20Z2v9AHR+5VRQclCM+lCzXsIn2cxR9Mi5WZ/0ucgW//0S8e91aOwF6vi6wmxygk/FYMLm+DefGqkcjEEvLhRA/GaCKSIymI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=cClMFKMM; arc=none smtp.client-ip=209.85.216.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="cClMFKMM"
Received: by mail-pj1-f49.google.com with SMTP id 98e67ed59e1d1-2f9f5caa37cso6944176a91.0
        for <linux-kernel@vger.kernel.org>; Sun, 09 Feb 2025 22:36:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1739169370; x=1739774170; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=TDrreukPOYO7oq2sreS0k7npIsPrcaogPlyj/E66n8M=;
        b=cClMFKMMNBDSYRIaoeB3rnp7EWjTRH1AU261I0jHiFnWvXUZ9gR2OeCIK8THlNcZ1g
         HA7EnMQRpiLC5rABx94C2UbX7naWDs2W08OeUnTNFja5THEAGiPhE0Z3jvadWJi9j6+b
         1WBKqluUvum/B+wFRRscpN1ReJ4CPJVGqsXvRoU4iHi5eV+YRBIjHn0GmxfwIIkbM2di
         5U7tp18z1wKEBu6VCP8+rxFOAzjg2Upk2JPae6odfyKU6Hmgaac+J97cWkc/u7voJELC
         hm/lVYjqGEFH5oqkOPMo337h40F8m0u71Q4dd/cqBpWV4++Y9ixRqOtMRgTLKlogLgW/
         63PA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739169370; x=1739774170;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=TDrreukPOYO7oq2sreS0k7npIsPrcaogPlyj/E66n8M=;
        b=MQvxfnOHBjZaM8j4I/2cBL+NvqH7HxKkapeiZ0kQaW5MqqM0kH0xas13rWIPDI0BnB
         wuC+UCeZ9siVV8Ntd3DnG3XCCItGl9RPmi6nucYjp2kLlNzd0buz4DVnoHYT3GZMd2eb
         /49VLbt6TudREhhmEcbCTh7U14v17YQdStjhdmhg1LPbtLY5m0aAs6utMiZQ52abzeKE
         iK12aLOZEG33D6ZJuT/oagZZUJL5rQnhhhpYIe6cDxSBttUph1MbVeWCpeHTdAry8xqJ
         7DkZMrycIdr+MS5g44/TYOgGireilbCdjachkNh3NHBCd1SyGJtVsQt8ZjEY5kKWtlBk
         WURA==
X-Forwarded-Encrypted: i=1; AJvYcCWzIaETB9z7YO3abnLNEokIlWjRIEEaWxtQViiNbLToTBRC/+nO8fbRF7ZQzDDwoFAjri0QXn7M/cLmzcg=@vger.kernel.org
X-Gm-Message-State: AOJu0YzCJ0/OSFxEdC5lO2y1EJChO/sP/ed0MqLbCgNrzEsHqe+9LdiF
	lTPImARXu+LQioydvjE+qEgoub/QieAiQvh0Id8/Lw4AZjMNyG9nMiRYnG0N2w==
X-Gm-Gg: ASbGnctBk9RHveb4ZtAVfBSfppGc7S6tDYm+PIYAXC0ouVvBoI1ppKcXYV+3UaQyDIq
	orMALKxJgLx22bmcEJBHQh1mSIQOE7UsdeK8OjZCko2E1ZGvvqRJnyInm5zLOnghq5Jyn6O+mL4
	/pBSob7M2tx4jcxYsecIFLqp6fJBB1E//RN7UpovKbOldFjP0RJFHB6vyzKSmZub/Qq4Zwz1JhM
	ungYoF/pbMFfMhD8pCZUIFc4BzG64mzfJEC1frTr1YKtX1vtU3OcHNp2UEsvuZw9671Kc/E7/CH
	0fLzXYuOLpZL5RRoj37+mKsZ7mJW
X-Google-Smtp-Source: AGHT+IGXtB2aMLUfrCG09NakGmZSrATPGVKEEt1AiSNhJunaG6YGYbdOydOoySS4xsS3muPtGftcOA==
X-Received: by 2002:a17:90b:3e8a:b0:2fa:2268:1af4 with SMTP id 98e67ed59e1d1-2fa22681b43mr19550522a91.7.1739169370161;
        Sun, 09 Feb 2025 22:36:10 -0800 (PST)
Received: from thinkpad ([220.158.156.173])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2fa2a201b9dsm5759427a91.22.2025.02.09.22.36.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 09 Feb 2025 22:36:09 -0800 (PST)
Date: Mon, 10 Feb 2025 12:06:05 +0530
From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To: Christoph Hellwig <hch@lst.de>
Cc: Bjorn Helgaas <helgaas@kernel.org>, kbusch@kernel.org, axboe@kernel.dk,
	sagi@grimberg.me, linux-nvme@lists.infradead.org,
	linux-kernel@vger.kernel.org, andersson@kernel.org,
	konradybcio@kernel.org, rafael@kernel.org, ulf.hansson@linaro.org
Subject: Re: [PATCH] nvme-pci: Use NVME_QUIRK_SIMPLE_SUSPEND for Qualcomm
 Snapdragon 8cx Gen 3 platforms
Message-ID: <20250210063605.yp5rkraain5oqxka@thinkpad>
References: <20250126050309.7243-1-manivannan.sadhasivam@linaro.org>
 <20250208185124.GA1120888@bhelgaas>
 <20250210040446.GA2823@lst.de>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250210040446.GA2823@lst.de>

On Mon, Feb 10, 2025 at 05:04:46AM +0100, Christoph Hellwig wrote:
> On Sat, Feb 08, 2025 at 12:51:24PM -0600, Bjorn Helgaas wrote:
> > > +	/*
> > > +	 * Qualcomm Snapdragon 8cx Gen 3 (SC8280XP) platforms doesn't retain
> > > +	 * power to the PCIe bus after entering low power CX power collapse
> > > +	 * state during system suspend. So shutdown the NVMe devices to have a
> > > +	 * working system suspend on these platforms.
> > > +	 */
> > > +	if (dmi_match(DMI_PRODUCT_FAMILY, "SCP_MAKENA") ||
> > > +	    dmi_match(DMI_PRODUCT_FAMILY, "ThinkPad X13s Gen 1"))
> > > +		return NVME_QUIRK_SIMPLE_SUSPEND;
> > 
> > I certainly acknowledge that this is a big problem for users.  At the
> > same time, this seems like a maintenance nightmare of
> > platform-specific hacks scattered through endpoint drivers.
> 
> Yes.  And it's what we stated that we won't do multiple times.

Multiple times? As I stated in the commit message, this quirk is *not* going to
be extended for any Qcom platforms as the rest of them can retain the PCIe power
state during CX Power Collapse.

And we don't need this quirk in any other endpoint drivers as this chipset is
mostly used in Laptop form factors and only the NVMe driver is found to be
causing the issues. Rest of the endpoint drivers (WLAN, Modem) are all coping
with PCIe power going down during system suspend.

> This needs to be taken on in the firmware or at least core PCI/PM
> code.

That would be the end goal. Once that happens, we can revert this patch.
Unfortunately, we need an interim solution to satisfy users.

- Mani

-- 
மணிவண்ணன் சதாசிவம்

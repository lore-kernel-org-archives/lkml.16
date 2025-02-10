Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com [209.85.214.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 761291991A9
	for <linux-kernel@vger.kernel.org>; Mon, 10 Feb 2025 06:39:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739169596; cv=none; b=uDxZE6YSqbcv3zSvG0BHAa2kMc8MbQh5/jS94Mu5ORWDGT3mSIt3rtLPjB1JvkwiifcQhQjJbwRLBxYv0jf6dZivcHi424UPmCvqjdMFcJZLf0FXfow65IoeW9TnYut1UB0JC9TSrKLms2U6eXxyXY0NRRxjKQctRMfs0sV3Omw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739169596; c=relaxed/simple;
	bh=YQKAuN2pYFls/+Cexl+6lPw2NZVFy2b7zjZi/qIAzas=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=PzkUdJtpYoRnXAT5ifXwDQAK1iyBY9vsCobW0XIregFHUROAXwbAALJZD//gd5jqwS1Nzn0DZir+ntL7yD20cn/sUF6mfSXTTMLaNNapf+/PSB8zwAX5/GH2E8EBWeFBJOc/LqNE+QxRlL6kTTsPRL4GTHlfdZJGQsAEafCIjZE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=InCgbEwL; arc=none smtp.client-ip=209.85.214.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="InCgbEwL"
Received: by mail-pl1-f171.google.com with SMTP id d9443c01a7336-21f4500a5c3so74575385ad.3
        for <linux-kernel@vger.kernel.org>; Sun, 09 Feb 2025 22:39:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1739169593; x=1739774393; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=LxE6aeuZ6icUuNgn0+qtoSgt4QTImDEuV+J46d7tdCE=;
        b=InCgbEwLF5CsucdodBhknqEVZbS28aZrT2DQoLfml/gJnExLjOfKmO2Gb0texPri8f
         llxOK1d97ZUuEDOB8VYFFNFIEKKZ2zscfGuDrvEkjsGOb0xhZ2UlRtYeQJgKMSnd97RE
         f5VwD5lUZVWUZX4OC+Vdt8em1OeRZiNkqE9qUrPplf6+ere6Py0dUXvkrD9H1Fwpt3/L
         ++52yk/dThv8j28qZveVvXGkesunCvhzI/sdlFRVkf0hLIXG6NEbLHu4StvI6Wj9gz9w
         30vgb4xHIUnNgg/lJ9564Y+UZbiJZQ7mv5MDT7tFgbdMvX0xwJFL3c/pYmHDUzx/8UBM
         7vag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739169593; x=1739774393;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=LxE6aeuZ6icUuNgn0+qtoSgt4QTImDEuV+J46d7tdCE=;
        b=nLyy1CFxPGFURAK+aYZ3mUDSNdv1cgCDFOdK48+dzSVg7AfFKosyT3ghjSiaVaWUTE
         qpISumnRSuRFwNFiUM0AJ1auzmJ0/LccmJPEV2QnvDTIyfni0Sq39MxLAKWWlGC5KkdN
         4xN70/7A9dFdI4bbgQV5itwGcZcoFcLxjezJg9UyZ0BKU1MyJbtWPyaYrgxk6SIk66Mk
         lCO8B5Wps6mLAIHnDnByB7tcX+S7KZo0H7QWShNgeF6IO83IUV+4TjtJRlPwatqG/Z2n
         WhiEqf+pSnKV9A8lMNXIqWkyYYILthHmlkBYWiumqR14j8b/7iIz6aEk6SJXDgIBsYDv
         v9Gg==
X-Forwarded-Encrypted: i=1; AJvYcCXvaQWXmxsKwR0u9lBcUpzEWjqQhQFZm8agWu2zszd7TmpoOjufH8fk9DcP7oMSaFPumyN3wR6Gf6cRx5U=@vger.kernel.org
X-Gm-Message-State: AOJu0YyIznPVwbygvCjOeh6Ty1XbTMq8yow/udEQ9n4Y0xR5ZsnkHUwy
	9gVsUXm4VIs4N7DmhGvokbgFDvFJrqAAmN4v+QmRgvBv7ICdTtJ+GtHFq/i8DQ==
X-Gm-Gg: ASbGnct9vFZhwahv4nhYfKWx0Wlwl3RmVtj7zPs7vPv2xm53Ezr8F5XyZz5hKXMAyEe
	jwGI/BRde4j5jDUymJV5ZmUWR39PeN76z4dQC9E9BL1YLNuyiUfkcIFEvfDsPx3yN18fYRe+sIs
	3gkdztTn/ZB+MeTvigljGdyNmxfKtmqTValelmkcxrhWxaLul9aQLJ5wLCcrbeYTMYJ6XwBoBEy
	puowZWppwWL1uB+tIKvLFBfKp6Gy+5ZO7PdlOuG7OPr6LjFMY2N+Yw4d5aVai/0Y/qophtvDAKT
	vfYUolol0eZY7LkLyDz0lcfENvak
X-Google-Smtp-Source: AGHT+IEsvR90d7Y3wwFLt9xyFfk3qexrds3FNoWUB2eioUnWhv5DCGZoPflNo843Qb/ySzyODQ8qCA==
X-Received: by 2002:a17:902:e946:b0:216:7cde:51a with SMTP id d9443c01a7336-21f4e72631dmr229479615ad.28.1739169593619;
        Sun, 09 Feb 2025 22:39:53 -0800 (PST)
Received: from thinkpad ([220.158.156.173])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-21f368d51ebsm70739595ad.252.2025.02.09.22.39.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 09 Feb 2025 22:39:53 -0800 (PST)
Date: Mon, 10 Feb 2025 12:09:48 +0530
From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To: Bjorn Helgaas <helgaas@kernel.org>
Cc: kbusch@kernel.org, axboe@kernel.dk, hch@lst.de, sagi@grimberg.me,
	linux-nvme@lists.infradead.org, linux-kernel@vger.kernel.org,
	andersson@kernel.org, konradybcio@kernel.org, rafael@kernel.org,
	ulf.hansson@linaro.org
Subject: Re: [PATCH] nvme-pci: Use NVME_QUIRK_SIMPLE_SUSPEND for Qualcomm
 Snapdragon 8cx Gen 3 platforms
Message-ID: <20250210063948.xjf5rupebhljujgd@thinkpad>
References: <20250126050309.7243-1-manivannan.sadhasivam@linaro.org>
 <20250208185124.GA1120888@bhelgaas>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250208185124.GA1120888@bhelgaas>

On Sat, Feb 08, 2025 at 12:51:24PM -0600, Bjorn Helgaas wrote:
> On Sun, Jan 26, 2025 at 10:33:09AM +0530, Manivannan Sadhasivam wrote:
> > On these platforms, power to the PCIe bus is not retained if the SoC enters
> > its own deep low power state called, CX power collapse state during system
> > suspend. Once the SoC resumes after going through CX power collapse, all
> > the PCIe bus state will be lost. So the NVMe devices on these platforms
> > won't resume properly, rendering the machines useless until forcefully
> > restarted by the users.
> 
> I guess "forcefully restarted" means a power cycle?
> 

Yes!

> > +++ b/drivers/nvme/host/pci.c
> > @@ -3162,6 +3162,16 @@ static unsigned long check_vendor_combination_bug(struct pci_dev *pdev)
> >  	if (dmi_match(DMI_BOARD_NAME, "LXKT-ZXEG-N6"))
> >  		return NVME_QUIRK_NO_APST;
> >  
> > +	/*
> > +	 * Qualcomm Snapdragon 8cx Gen 3 (SC8280XP) platforms doesn't retain
> > +	 * power to the PCIe bus after entering low power CX power collapse
> > +	 * state during system suspend. So shutdown the NVMe devices to have a
> > +	 * working system suspend on these platforms.
> > +	 */
> > +	if (dmi_match(DMI_PRODUCT_FAMILY, "SCP_MAKENA") ||
> > +	    dmi_match(DMI_PRODUCT_FAMILY, "ThinkPad X13s Gen 1"))
> > +		return NVME_QUIRK_SIMPLE_SUSPEND;
> 
> I certainly acknowledge that this is a big problem for users.  At the
> same time, this seems like a maintenance nightmare of
> platform-specific hacks scattered through endpoint drivers.

This chipset is only used in Laptop form factors where there are no open PCIe
slots. And we have seen the issue with only the NVMe driver as the rest of the
endpoint drivers (WLAN, Modem) are all behaving fine.

But as I mentioned comments section, this is only an interim solution.
Obviously, we would like to have a generic solution available in PCI/PM core and
we'd certainly work towards that. Once that happens, this quirk can be reverted.

- Mani

-- 
மணிவண்ணன் சதாசிவம்

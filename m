Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BC7A2199FAB
	for <linux-kernel@vger.kernel.org>; Wed,  4 Jun 2025 06:05:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749017153; cv=none; b=JmpRGhIO8Avb4cUDOpgynMJwYGheC44asRNKvJswLnRRIeFGxcTKLCoZC6IkAzgBR3L0cLCV2OdExj16E+/vTizwP1VH6FNvALsFP9ntWrB4Zv5tvMvJ+WiPXhwDrviKjUn9Ri3Q4MJe+CeYZg9+DnJR6GvLIw2qWwIBX/OQy/0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749017153; c=relaxed/simple;
	bh=BqfaYQx97o+JOP+K1NGE6tuY6VxM7+aD/6TxPpXbrak=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=B1kTzOKqHNdgNi1Xv2S10Wn6bNGRYZdyMUDjSY6sSBddRz9/l0j7CmewyivvQAi8vPoRdrtl4b6Pqp6t8MA/tRZ/Q3imT1dtQNWd3UQlqXzq3xFekufxgAp1nhLKkvzxX1XmNAzk80fPRgIRLs0hr9dfxhv7k/medDdtvf/qNUY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=rr1sCKih; arc=none smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="rr1sCKih"
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-450ce3a2dd5so56413835e9.3
        for <linux-kernel@vger.kernel.org>; Tue, 03 Jun 2025 23:05:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1749017150; x=1749621950; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=ZH44UMshivXu/WwJMMc2cUDTZKuUc71AWCQOvue4lTc=;
        b=rr1sCKihUY4jHPDdrL1/xCij+xDy6yz+Z7D5UlcAzC4S0lP1vAtZh1RJCfsOnoJaDg
         ryp0oV8GwB3zhUGinz4By7KuRB4E20UXcxZz/OPDMoj9fhzoFugnCs4ZzW06pdAT+n9I
         f1/fTmRMTF+yGRRNEzQi5nVsUxt4YNzHvbMAyP4HkGTwZwANupUzQFTGV5DAkTDbaeUE
         DE0d2gP80ALQgZXdKbuc3D2/9AesNCfYaMV6uXXGOYw7f5xEIkwazopnH/56gMaIFta/
         RibV4xUvZzZD6drL2XZ5XjhI3e5uOneGW8UzAxNEvqOUPDivAAjQwfwdTH8m13kWIJAX
         SCxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749017150; x=1749621950;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZH44UMshivXu/WwJMMc2cUDTZKuUc71AWCQOvue4lTc=;
        b=D/n9LE6mCzVBvMuvX7RSyPFbKqPf9yOHTHoVXBW1uzwmKbEhBGu0x4zhuH5/u3cxiu
         o3vPTyqSDjoIinnBvpERjXV5BxfGTBqQ2XLFK0+FRU2IgwqgRS8QFoWQwtxonelNv2C7
         VX3wQDu3W55RZZs58g8dS0byR8Jx1qrKEwfM8eFthwnwP2kN6UjNij2fJE3dd/vIxCzs
         hsQiapwt3oAh2RxIv+4hACyIEUAJc8dCR84mb3CZPmHGJBAAnSPplB3ntiyKBwImK1SU
         pOJBhFYFev/ZIoRkTYz8pcAsqH3rSGOovRQiIh7eBXrDbNNX9a6sSISr8xf/RXJfdH5N
         MXVg==
X-Forwarded-Encrypted: i=1; AJvYcCWAj91lhASZkwPH/hTpwSFDWYMR8p54loM6n5EiuRLLYd/TN8W6nn9iMOsXr3QpoEjZecr2QEpUeMajVH4=@vger.kernel.org
X-Gm-Message-State: AOJu0YwAC9jRrZcEyuGq2zMTW21/VRZb3CuI+Bl1Rgh6zf9YZkrP9Z4H
	MAyTF8x1dvCq1yE/x9QceEmnRjEY2iZwB1POMK+PH0wvIs0Ja0msGgKnWfLG1P8qr8k=
X-Gm-Gg: ASbGnct2BMtB7F+EvOG+NVt3YwIqXtPydM0d/q/wp/kxFSXUC1bdHUW9ZxUsS2B9kND
	HeDtbfMlSQSx5ITZ/aFmNjjQuSKcN3byU4w7J2AGWDWwigdw8/zTK/m5rbOIvbNRrRDjlzzYrCW
	d1d17GRFR5vjtQvq49QjnlE6+yALb3agGK96iRHpPTjICNTiG/nk0AC3IsUl7DRUmcGPF8lANvA
	iHZUu6vBZqNL0zn8jH5OrKzJmPv9qtFzFfT/vfNTs2IUVkSRl3FVKy7zykSZ+3fq+7gH5PUzMw8
	lJ8oqcUOZi9hRKkDR+e1OFY0PZJg7GZo/Ek2FcwiJ8HtEVwrrYNxGvwI
X-Google-Smtp-Source: AGHT+IGm1afoxcy8lx6vgqoRP0d9Plaozw5hLF59bcfnlN4ynAXn5BG3bAPTyvKW+OZbq0W2nOxEZw==
X-Received: by 2002:a05:600c:530d:b0:450:d3b9:4ba2 with SMTP id 5b1f17b1804b1-451f0b3ce5bmr9739335e9.24.1749017150125;
        Tue, 03 Jun 2025 23:05:50 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-3a4f0097205sm20706878f8f.79.2025.06.03.23.05.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Jun 2025 23:05:49 -0700 (PDT)
Date: Wed, 4 Jun 2025 09:05:46 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Terry Bowman <terry.bowman@amd.com>
Cc: PradeepVineshReddy.Kodamati@amd.com, dave@stgolabs.net,
	jonathan.cameron@huawei.com, dave.jiang@intel.com,
	alison.schofield@intel.com, vishal.l.verma@intel.com,
	ira.weiny@intel.com, dan.j.williams@intel.com, bhelgaas@google.com,
	bp@alien8.de, ming.li@zohomail.com, shiju.jose@huawei.com,
	Smita.KoralahalliChannabasappa@amd.com, kobayashi.da-06@fujitsu.com,
	yanfei.xu@intel.com, rrichter@amd.com, peterz@infradead.org,
	colyli@suse.de, uaisheng.ye@intel.com,
	fabio.m.de.francesco@linux.intel.com, ilpo.jarvinen@linux.intel.com,
	yazen.ghannam@amd.com, linux-cxl@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-pci@vger.kernel.org
Subject: Re: [PATCH v9 04/16] PCI/AER: Dequeue forwarded CXL error
Message-ID: <aD_iOk0vxDp88z8U@stanley.mountain>
References: <20250603172239.159260-1-terry.bowman@amd.com>
 <20250603172239.159260-5-terry.bowman@amd.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250603172239.159260-5-terry.bowman@amd.com>

On Tue, Jun 03, 2025 at 12:22:27PM -0500, Terry Bowman wrote:
> +static struct pci_dev *sbdf_to_pci(struct cxl_prot_error_info *err_info)
> +{
> +	unsigned int devfn = PCI_DEVFN(err_info->device,
> +				       err_info->function);
> +	struct pci_dev *pdev __free(pci_dev_put) =

What?  Why is it freeing the returned pointer?  That should happen in
the caller, surely?

> +		pci_get_domain_bus_and_slot(err_info->segment,
> +					    err_info->bus,
> +					    devfn);
> +	return pdev;
> +}
> +
> +static void cxl_handle_prot_error(struct cxl_prot_error_info *err_info)
> +{
> +	struct pci_dev *pdev __free(pci_dev_put) = pci_dev_get(sbdf_to_pci(err_info));

Ok, it does happen in the caller, but dropping and then incrementing
the reference count  like this is racy.

regards,
dan carpenter

> +
> +	if (!pdev) {
> +		pr_err("Failed to find the CXL device\n");
> +		return;
> +	}
> +
> +	/*
> +	 * Internal errors of an RCEC indicate an AER error in an
> +	 * RCH's downstream port. Check and handle them in the CXL.mem
> +	 * device driver.
> +	 */
> +	if (pci_pcie_type(pdev) == PCI_EXP_TYPE_RC_EC)
> +		return pcie_walk_rcec(pdev, cxl_rch_handle_error_iter, err_info);
> +
> +	if (err_info->severity == AER_CORRECTABLE) {
> +		int aer = pdev->aer_cap;
> +		struct cxl_dev_state *cxlds = pci_get_drvdata(pdev);
> +		struct device *dev __free(put_device) = get_device(&cxlds->cxlmd->dev);
> +
> +		if (aer)
> +			pci_clear_and_set_config_dword(pdev,
> +						       aer + PCI_ERR_COR_STATUS,
> +						       0, PCI_ERR_COR_INTERNAL);
> +
> +		cxl_cor_error_detected(pdev);
> +
> +		pcie_clear_device_status(pdev);
> +	} else {
> +		cxl_do_recovery(pdev);
> +	}
> +}
> +


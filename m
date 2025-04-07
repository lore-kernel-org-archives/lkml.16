Received: from mail-pf1-f178.google.com (mail-pf1-f178.google.com [209.85.210.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9A1BA225405
	for <linux-kernel@vger.kernel.org>; Mon,  7 Apr 2025 07:45:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744011904; cv=none; b=QrXbcM5EKXBcwB3E+1NrKmAmBN7YXQAQSVpqcghi74kmg7iuB6/wI7tL5ZdWUf6Hd/bXfGdQNP/VsqNNnfkkXPkQb03Jew6Q792og2a119UJJ8sCVbbJS/fOvM2v3OyP0MmOCPyZC4WwF8dh0kSbBmDN8GnJZHOA+NuDSiFp9KY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744011904; c=relaxed/simple;
	bh=tYR5OsW0DxS03ZNpNqNCjjugrDqa6bpqk8h3hPCTJIY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=A9ey9wRO6lYoCPGZbEdU3jMljrQQu17KpRN6ifXWHnVV7XZfJt+G1WAisalcU5LjtQYY5Omane8gwHmHEI0kCNEWY+bSm8Zdi67/X6jHg5SLQXJWx1my0seOh80M9YPPJWcraGtln2srijPDELyFtEkPV/n/L5NxJdwePqS4VBw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=sTc4AU+h; arc=none smtp.client-ip=209.85.210.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="sTc4AU+h"
Received: by mail-pf1-f178.google.com with SMTP id d2e1a72fcca58-736b350a22cso3335515b3a.1
        for <linux-kernel@vger.kernel.org>; Mon, 07 Apr 2025 00:45:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1744011902; x=1744616702; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=o3NHeKTvtrNLVJ7Xwv0eZCsKPdpzCtXi2/NrHXy46hY=;
        b=sTc4AU+hZgcD+aAfUKUeLA7YouGKnKNn0xAik35BhSnhQEm2lNWH8hi4dfdsk/Kmj3
         NBMLjgP8+aNVHD2G5sirHPWvSZf2GpjGD03kTXlZ+kZ16ak5MO2z/YILGmQtjtzjdBTo
         kuMRragN8elKXy0q0+Y5B9hUi87VS1im4+WLTgd9DyAEFbD9jmxMFK2mskEE17UbVMvg
         EwBsfpYSzHQ18GxMGJl+4okie9jRNYB27t2EMFvcfo2ac60zKxUP2TNBEjg6uL3BKvVk
         rWonGEiUYWbPuUOXhAZQHQwVudCT4Y2D21b7A/MGWEPw675Jtk+YxmiW6r4Ne0LJ1LdZ
         twRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744011902; x=1744616702;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=o3NHeKTvtrNLVJ7Xwv0eZCsKPdpzCtXi2/NrHXy46hY=;
        b=h44ZZ/LgaK8ZTzWpiPuoRXtcP19zgo1vOLit2sOEYRVIlGPr3TMyUPR//FSOYrNzep
         AeKgnN+90NwiZHwE12rmjukamr/isQQC0wuTvGd1B+uPVk3v+nD6jtFsonh8AZ4ZcuEa
         XcT7qEAs3ryAYPFmNNj51M5IVb5nDsRNNAyNyU5ltrrT4njB4BXh+uM9vstKLVLptVXC
         CbJWgy7oGJ74pDm/L5LyVKVPhE4ccwjiwqHbViASInt6WZANU+t78+8/nMPYnIJSXOx8
         Pn+dlFMC4ORnAcAjC1zweH7AOkONIuAu+yANW68gZH1dzR4AjVQQwZZnKIZ1wibGxjOf
         3hPQ==
X-Forwarded-Encrypted: i=1; AJvYcCUJHtsmes3qxspe+f9mpxk7talW8iH4sTT02wpesGuGx4iGrNCcWCrRQ8lSsWxFyy0Xv1aVeVgfyRGsu5k=@vger.kernel.org
X-Gm-Message-State: AOJu0Yyf9Io74yfJxSPy801r4LyzYeXU26/55zhfRuK5RoJ3p3siQgWw
	tIMxE+RpbQaFpbQ3Oe8oaPqprMihlv7eIgCpQZkxjfIci0SN2FAGmeF63gbY8A==
X-Gm-Gg: ASbGncsXMT5HVJDFNvpVbX2Yrn16X5R5UPb+vQvvIFZeoeuBh2P+aySX/FBbCOk0YaJ
	mr3t0kRzPlsa8TOoBSCyCT2T+N+bADa4gvanzgoXlFsflN0qDSyPeAX2CU3ku7XvaqC7iD9QNOW
	9a4Vso4biVe5tFVx3USJTeqfXoZFvjujc6eWXH9I1cr23QZYcF7acmRkTBzP4Rl47nGrmxQ2WGg
	5DwfbajqiMkrXDKEl0R5k75GrKB2ASnJ3sofnfCucF5TTeLSC34Z7ntey5ihWZzRs4iS6TTAAfV
	vWJGWPWen2sz8BDqmu8e6zAPWpq8bel/nYP0kXLFN/a66AkNR5r2Zu8=
X-Google-Smtp-Source: AGHT+IENobJ4uhI9CmAsS3iKtExZlmVr/Dw2mLVdyX06yvJmgGIWTlO27UTxouzUZOs/bVIxrsfjdQ==
X-Received: by 2002:a05:6a21:999e:b0:1f5:77bd:ecbc with SMTP id adf61e73a8af0-201045a726dmr17705262637.16.1744011901653;
        Mon, 07 Apr 2025 00:45:01 -0700 (PDT)
Received: from thinkpad ([36.255.17.160])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-af9bc41ad0csm6707969a12.66.2025.04.07.00.44.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Apr 2025 00:45:01 -0700 (PDT)
Date: Mon, 7 Apr 2025 13:14:56 +0530
From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To: Bjorn Helgaas <helgaas@kernel.org>
Cc: Lorenzo Pieralisi <lpieralisi@kernel.org>, 
	Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kw@linux.com>, Rob Herring <robh@kernel.org>, 
	Bjorn Helgaas <bhelgaas@google.com>, Jingoo Han <jingoohan1@gmail.com>, linux-pci@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH v2 1/3] PCI: Add sysfs support for exposing PTM context
Message-ID: <lhtklncbcyphq2ljxn6w5p7wk4rdj5wxzskmlly4mrr664b2lj@w5clch5uzvd3>
References: <20250324-pcie-ptm-v2-1-c7d8c3644b4a@linaro.org>
 <20250324162854.GA1251469@bhelgaas>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250324162854.GA1251469@bhelgaas>

On Mon, Mar 24, 2025 at 11:28:54AM -0500, Bjorn Helgaas wrote:
> On Mon, Mar 24, 2025 at 03:34:35PM +0530, Manivannan Sadhasivam via B4 Relay wrote:
> > From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
> > 
> > Precision Time Management (PTM) mechanism defined in PCIe spec r6.0,
> > sec 6.22 allows precise coordination of timing information across multiple
> > components in a PCIe hierarchy with independent local time clocks.
> > 
> > PCI core already supports enabling PTM in the root port and endpoint
> > devices through PTM Extended Capability registers. But the PTM context
> > supported by the PTM capable components such as Root Complex (RC) and
> > Endpoint (EP) controllers were not exposed as of now.
> > 
> > Hence, add the sysfs support to expose the PTM context to userspace from
> > both PCIe RC and EP controllers. Controller drivers are expected to call
> > pcie_ptm_create_sysfs() to create the sysfs attributes for the PTM context
> > and call pcie_ptm_destroy_sysfs() to destroy them. The drivers should also
> > populate the relevant callbacks in the 'struct pcie_ptm_ops' structure
> > based on the controller implementation.
> 
> Can we include some motivation here, e.g., what is the value of
> exposing this information?  Is this for debugging or bringup purposes?
> Can users or administrators use this for something?  Obviously they
> can read and update some internal PTM state, but it would be nice to
> know what that's good for.
> 

This was a request from one of the Qualcomm customers, but they didn't share how
they are using these context. They just said that they want to collect the PTM
timestamps for comparing with PTP timestamps from a different PCIe switch. That
was not a worth of information to be mentioned in the cover letter, so I skipped
it intentionally.

Also, the spec itself didn't mention any specific usecases unfortunately.

> It looks like this requires device-specific support, i.e., the context
> itself, context update modes, access to the clock values, etc., is not
> specified by the generic PCIe spec.

Right.

>  Consequently this probably can't
> be done by generic drivers like ACPI, and maybe this is a candidate
> for debugfs instead of sysfs.
>

Well, we can still create syfs ABI for vendor specific features. Problem with
debugfs is that the customers cannot use debugfs in a production environment.
Moreover, I cannot strictly classify PTM context as a debugging information.
 
- Mani

-- 
மணிவண்ணன் சதாசிவம்

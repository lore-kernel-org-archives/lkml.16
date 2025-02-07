Received: from mail-qv1-f42.google.com (mail-qv1-f42.google.com [209.85.219.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 22CD218787A
	for <linux-kernel@vger.kernel.org>; Fri,  7 Feb 2025 08:01:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738915294; cv=none; b=IFKgsmbClIplKyyXWi2kfmgSneMRQPF04fRmRyihinBsza259RoKhrP6gRCko/l2B66uwrSAoMZYrp1HDqSAZ4ItE6VRSEvpmPlcrA1qkrUVMJewSwgUi0gF+9d+9Z7wX6CKNr+5DVKWKwrJBS07xflKSG8QWxi+KRjZwgTltr0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738915294; c=relaxed/simple;
	bh=+1Sc8DvEXSqZhxSPhaoZkti61/HFD7B/mhsc91OQR4Q=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=h0pxZB9v9UWs9NAcJsHCVm7yAuZdQLViliprqGmjxx3YQKtvXvX0m8A38VElPZFx7E4bYgFB9tMbB0bPjzqIx39oZEYu0BfeKEtMFERASayrHIYE6CRVPz3IlX6RujQSb+gqMe70ZjF0DhG64OdO8Mt86qymkZr8tVvH6dgoT+A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gourry.net; spf=pass smtp.mailfrom=gourry.net; dkim=pass (2048-bit key) header.d=gourry.net header.i=@gourry.net header.b=h00gLq/4; arc=none smtp.client-ip=209.85.219.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gourry.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gourry.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gourry.net header.i=@gourry.net header.b="h00gLq/4"
Received: by mail-qv1-f42.google.com with SMTP id 6a1803df08f44-6e44af3dacbso1687426d6.2
        for <linux-kernel@vger.kernel.org>; Fri, 07 Feb 2025 00:01:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gourry.net; s=google; t=1738915292; x=1739520092; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=53rCUEYLoP6SzGQ7dltS09SOj08LJRV41NYySfcgmkU=;
        b=h00gLq/4BHkrGLsQbD+eQFL+zXZcdYJg/nNfz3jfhyjbKJRsU38zlizAKV1dL0ypAX
         uEDtzv3OVKjH2YTXcToeWDv6CQuF+63K1KYatBacD0UpAEsfsfwdufuET4X6p8iKFDpH
         puUyfpxmfQ54a7TFNVU7MkaXlig1f4lWRpzMFjDJtS8+4NQG1rhzFnCMuptH5NVP9WXZ
         5UbMXAbsxbeSO5Yxgr/h/XmlPxoE1UGJUYmep+EfVK1HFUkaV1eOLN1Uy7yD8mz3prj1
         6h94jvBfSxzun92cm0+1a9i6pBEZMUkOQgiahYGzlHuDzqcCLoRaD13VJ8us/Tb3FOH2
         S1hQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738915292; x=1739520092;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=53rCUEYLoP6SzGQ7dltS09SOj08LJRV41NYySfcgmkU=;
        b=XYlniBTKY3CtSyd9fOMGWb5eguEzXWR3NPLUb5MfZYRVDmEwWq2AYJ3jyRNv6fdqxi
         znsPrclLlXr66PuIXVR4bkIUyUSDcXheD9uoX/q5V1Y+Q61w2CP5b+LHnljtqmlPzzYP
         s6kBqyq4Cqij14Ba+rYKhwWHAS6XJ3cviqnoltclm+FDF3muLH1ERf3yJXBR0MDHGzc3
         FXVQkG3FfoYG5ctAgQuoEEO6SPQP/hJnDvJI6gPZvgWjJb9nOwAc5qlAaE/ELncTP+TY
         q3zKm1Jzm62Mkc8zQccwkBwUwVAvu6XSIj0xsb0RijP2QZ33pKVUy4EXMKqYi0VyOtN+
         vi7w==
X-Forwarded-Encrypted: i=1; AJvYcCVcNUjif6kSEt8SK+0lnTC202Jk0y4k9Q9nD8nlTAZICmQrqQckZw2niAFD6nbRFqt494tJ8+SL4UdEdH4=@vger.kernel.org
X-Gm-Message-State: AOJu0YxYYyfVmFs9SW1c1qkX8V/f1l68VvakQdpeSzn7AZ2TEKyXALdx
	UCj5IDMfh9wm3wb546J8+/k4pMWnMBZixXuYQf7502Su3n+1d55YbzOn+zaU1+I=
X-Gm-Gg: ASbGncvkmTRLq+NhqeuuY6RleYm57hVlB2JPoDl738oc26WSI1lc6sOQrmBo+0tkWTi
	Za5TU0BdunJGhVghQDQIwtaXGDn+IGJ9XBpLMBk6TEuNSkYbgePfqT0cAl7dNGHYf793JjRYGHG
	lqeOzGMbKAmzGVVF4ViMMXwHshiBIJPDvbAiROM0MsKRuxrgcXVlTM3sLaoDN5vrU7rWm6iLnJb
	tgtJ9wpXJPKg+19tOlP6XUEqug/+ZW+nm+A5aRsBZW8we4tClhYhMX+el3BMufHUtOQproUXSWo
	KixHa0eug8r44B42TtOaxS6CKawaUYlnkoKTFMpe/Vb6mkk/5CxLvzoS9zYVgqWVGS5gnEgYjA=
	=
X-Google-Smtp-Source: AGHT+IHVh9GKjiTCyuhbzPrNi9cz7oIOwuNi4yAC6Z7SgEopNjBBBR7Jr4474gD2P2gHYgAE+nm67Q==
X-Received: by 2002:ad4:5ce8:0:b0:6d8:7ed4:336a with SMTP id 6a1803df08f44-6e4456fb76amr33866786d6.31.1738915292012;
        Fri, 07 Feb 2025 00:01:32 -0800 (PST)
Received: from gourry-fedora-PF4VCD3F (pool-173-79-56-208.washdc.fios.verizon.net. [173.79.56.208])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6e43babc865sm14190686d6.101.2025.02.07.00.01.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 07 Feb 2025 00:01:31 -0800 (PST)
Date: Fri, 7 Feb 2025 03:01:28 -0500
From: Gregory Price <gourry@gourry.net>
To: Terry Bowman <terry.bowman@amd.com>
Cc: linux-cxl@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-pci@vger.kernel.org, nifan.cxl@gmail.com, dave@stgolabs.net,
	jonathan.cameron@huawei.com, dave.jiang@intel.com,
	alison.schofield@intel.com, vishal.l.verma@intel.com,
	dan.j.williams@intel.com, bhelgaas@google.com, mahesh@linux.ibm.com,
	ira.weiny@intel.com, oohall@gmail.com, Benjamin.Cheatham@amd.com,
	rrichter@amd.com, nathan.fontenot@amd.com,
	Smita.KoralahalliChannabasappa@amd.com, lukas@wunner.de,
	ming.li@zohomail.com, PradeepVineshReddy.Kodamati@amd.com,
	alucerop@amd.com
Subject: Re: [PATCH v5 13/16] cxl/pci: Add error handler for CXL PCIe Port
 RAS errors
Message-ID: <Z6W92JUQQt4Lf6Ip@gourry-fedora-PF4VCD3F>
References: <20250107143852.3692571-1-terry.bowman@amd.com>
 <20250107143852.3692571-14-terry.bowman@amd.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250107143852.3692571-14-terry.bowman@amd.com>

On Tue, Jan 07, 2025 at 08:38:49AM -0600, Terry Bowman wrote:
> +static void __iomem *cxl_pci_port_ras(struct pci_dev *pdev)
> +{
> +	struct cxl_port *port;
> +
> +	if (!pdev)
> +		return NULL;
> +
> +	if ((pci_pcie_type(pdev) == PCI_EXP_TYPE_ROOT_PORT) ||
> +	    (pci_pcie_type(pdev) == PCI_EXP_TYPE_DOWNSTREAM)) {
> +		struct cxl_dport *dport;
> +		void __iomem *ras_base;
> +
> +		port = find_cxl_port(&pdev->dev, &dport);
> +		ras_base = dport ? dport->regs.ras : NULL;

I'm fairly certain dport can come back here uninitialized, you
probably want to put this inside the `if (port)` block and 
pre-initialize dport to NULL.

> +		if (port)
> +			put_device(&port->dev);
> +		return ras_base;

You can probably even simplify this down to something like

		struct_cxl_dport *dport = NULL;

		port = find_cxl_port(&pdev->dev, &dport);
		if (port)
			put_device(&port->dev);

		return dport ? dport->regs.ras : NULL;


~Gregory

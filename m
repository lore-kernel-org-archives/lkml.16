Received: from mail-qk1-f176.google.com (mail-qk1-f176.google.com [209.85.222.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D1E7B166F3D
	for <linux-kernel@vger.kernel.org>; Fri,  7 Feb 2025 07:30:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738913419; cv=none; b=cC1wD9FY82WtgiBw0w7HN9IhnqRfMJDuksc0UW7JycdF+4R4GvYmOFNjAFKXjVt6xOtefcr/8CBz0rcRXPuPMXA9gecPp8X0X6otYO22Q7frY05VNMnyUYkm/3MCjFTgjV9yt6EvG3TVGJ2vyUZGN9H8WdQ/dRKIigVPVPsGlhM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738913419; c=relaxed/simple;
	bh=UJ/X1bqhgQUvz5mZeiZ7mu1qy+hSSJPVO7P9gCXAgpM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=HqRJK4tGsqCTqPzlAwiiUICrc9sbd/3+pe+xrXKjHRVu61p7SmmgQZ5Z86xGoBa4Pgj7AKjuRxseMtyUvZ0GT5c33MQ/LPgSHr/PIJw5S/l199LVHsXw0m7pkB4jbuS+E1eenmN7+rgcQP1FxT4WoJXv0zZskB17nwD4MfYVpAI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gourry.net; spf=pass smtp.mailfrom=gourry.net; dkim=pass (2048-bit key) header.d=gourry.net header.i=@gourry.net header.b=QUmg4KVO; arc=none smtp.client-ip=209.85.222.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gourry.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gourry.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gourry.net header.i=@gourry.net header.b="QUmg4KVO"
Received: by mail-qk1-f176.google.com with SMTP id af79cd13be357-7b6f95d2eafso193751685a.3
        for <linux-kernel@vger.kernel.org>; Thu, 06 Feb 2025 23:30:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gourry.net; s=google; t=1738913415; x=1739518215; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=oPFVTqdvqhZPbZ75tXTbpYN0u9AO7uq3Z5LkOr9vDgk=;
        b=QUmg4KVO//ZOMjblIhmUd0wAkIb0y/DVT082yrB2YAiEoL5XBk4DrJ/O+kYMFCS0dr
         gu53Q3nNaauskTEGqfecPrVveTP+68vp8AJRSduWPyK0z5rWqB2kKUiA/G/8w1TF5efL
         Bwo/ke4dAQV+Ts/HuZKHYinRZ1hgH+aCXUE3UHUp0QMI4/z9Qvd6wutMkhn77UEw24Lk
         lncrA8vur+aUhjjpwe4J8MUWLQSZqNWWLTYOznyqn5ldgVFgWdVMms3RyiONd0analJD
         sd30GmggwX1/Pug2I2kYvQYvq6q4UWE/eh4z+OrhK+CHyIGvF/rpBw1qqUXLazNmBSVF
         krbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738913415; x=1739518215;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=oPFVTqdvqhZPbZ75tXTbpYN0u9AO7uq3Z5LkOr9vDgk=;
        b=dvjfLFzl8oVWaAIvsMYYgf5c2y0BLju9oYTKSoAVx7oVhPHBE9OxpMTgvnK3+8rt6o
         nicl5Qb4Q4WNhUVLuVI3vZ7VlePTWpPmWD50Z/X3llqohQr7gAUXCodWHGJQ6HsoemtH
         tBDTR1oTS8W6n2egao8PgD/V7bs18QeGsSv31P0ZDeEkVExOqlZ8mX6SMSE0U4gMyMUm
         GBUocWYvTqzdCb5R22xVUq0piKJOXcDwFARkExirGhz+3I3K3fiCoAA+KthoVNGt2TiL
         SZ2Dbv1luGM24Ck5WAszT6ENNeP2Fh45ITSv9zzlj8vXYrOAfxerYHsgFT9BlY+DJgws
         j/gQ==
X-Forwarded-Encrypted: i=1; AJvYcCUGhq826c6hL1VI+K2EfvJ9JOEsodaBfHev3aYHWqVlJyMAJGQDsKuKHhi8EtQ1mulcnV3rzOVxIVRVeSk=@vger.kernel.org
X-Gm-Message-State: AOJu0YwusRm/ZXEbpvS+bNePjCpqwpCrU9EElhj/z0R/ICJ2vJz3FGs+
	JPZQ++XxWMwMNTL5LnFAedX3YNLgJzuZPMzfoo4qnICweVLp8wWYkc6oUTZecrc=
X-Gm-Gg: ASbGncsrgAn59c1aXKC5E8rBb7IXHr0Mj0Q1nXcG813/rSeD7xfSNAfo6IE2UwyWE+r
	U7n+C2iwZ6t7Hvge4qj1VAOn9hRsYxyx0S9h83rinB1fRTu961y8NCtWMVynpwH4h4W1Aq80pyt
	1S/5MpKa8o9UrJVLgRshSW32ISzTxJ82p9o1vF2lolSUtRFFYuEGcnLSWm1ItyJP/kx9FzyOtGL
	lZ226VLml+fEbM/Go98E0ob2fLMlGKhGiiYNu17qYn0EVG2IdB61NN9DcAHWZKZs4EIPdziu2YM
	ng1UWvY1bMVwtataf9IMDvUu1QCloJ7xnqb+j40xpnbrLujQEG4pAR2jV4xQfnkGCYNI+b6E+A=
	=
X-Google-Smtp-Source: AGHT+IGTJPM+Z54YDmRhIyxJSdkL86rCqVxm6xIrfmJkTfPa05ZDK3edZmGObvoT1vj6Sn3CLYdpzQ==
X-Received: by 2002:a05:620a:4448:b0:7c0:b82:8f90 with SMTP id af79cd13be357-7c047c2139amr359435985a.35.1738913415678;
        Thu, 06 Feb 2025 23:30:15 -0800 (PST)
Received: from gourry-fedora-PF4VCD3F (pool-173-79-56-208.washdc.fios.verizon.net. [173.79.56.208])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7c041e9f917sm157836585a.79.2025.02.06.23.30.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Feb 2025 23:30:15 -0800 (PST)
Date: Fri, 7 Feb 2025 02:30:12 -0500
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
Subject: Re: [PATCH v5 08/16] cxl/pci: Map CXL PCIe Root Port and Downstream
 Switch Port RAS registers
Message-ID: <Z6W2hFI7UsEslB3U@gourry-fedora-PF4VCD3F>
References: <20250107143852.3692571-1-terry.bowman@amd.com>
 <20250107143852.3692571-9-terry.bowman@amd.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250107143852.3692571-9-terry.bowman@amd.com>

On Tue, Jan 07, 2025 at 08:38:44AM -0600, Terry Bowman wrote:
> +static bool dev_is_cxl_pci(struct device *dev, u32 pcie_type)
> +{
> +	struct pci_dev *pdev;
> +
> +	if (!dev || !dev_is_pci(dev))
> +		return false;
> +
> +	pdev = to_pci_dev(dev);
> +
> +	return (pci_pcie_type(pdev) == pcie_type);
> +}
> +
> +static void cxl_init_ep_ports_aer(struct cxl_ep *ep)
> +{
> +	struct cxl_dport *dport = ep->dport;
> +
> +	if (dport) {
> +		struct device *dport_dev = dport->dport_dev;
> +
> +		if (dev_is_cxl_pci(dport_dev, PCI_EXP_TYPE_DOWNSTREAM) ||
> +		    dev_is_cxl_pci(dport_dev, PCI_EXP_TYPE_ROOT_PORT))

Mostly an observation - this kind of comparison seems to be coming up
more.  Wonder if an explicit set of APIs for these checks would be worth
it to clean up the 3 or 4 different comparison variants i've seen.

Either way

Reviewed-by: Gregory Price <gourry@gourry.net>

~Gregory

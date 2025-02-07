Received: from mail-qk1-f173.google.com (mail-qk1-f173.google.com [209.85.222.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 968181A2C25
	for <linux-kernel@vger.kernel.org>; Fri,  7 Feb 2025 07:38:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738913904; cv=none; b=Nck/MqD6HN4XGYCwAF55d96oOBi/H3cmNtOA/5QUwgR9dLbfiUbVCHyZUmUeQpqLH0iXm17W4ApJcw02+RM7mEcb/NoSBTI6iL/fikHzLRe23WaXvddR9nsP2LUj9MiLkx+BPH/dzvTuqNSE0Rvx5bMkKlmWRY78/C7Yf+sv80g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738913904; c=relaxed/simple;
	bh=L1anfXoN05PCUGOY7AZWom7GQqaSaM/fDw2+QkF6Vo4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=s3XZu3KHlEiTCBZv0mYJ68D33As2NgZw+Zgmd/1V1jfUDl/RiyRfdB5hmSvmPDULJAwWaxpM9Kbh+h4LOSwnaRYPclYYpruMYdaK/LonXjgsm1/fzocsa1QtrbxxGUfOOepD03JDDOV+BwFB7xDuXP7XXwyykqf6TYDZNmpDMwg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gourry.net; spf=pass smtp.mailfrom=gourry.net; dkim=pass (2048-bit key) header.d=gourry.net header.i=@gourry.net header.b=BkQHeCDp; arc=none smtp.client-ip=209.85.222.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gourry.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gourry.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gourry.net header.i=@gourry.net header.b="BkQHeCDp"
Received: by mail-qk1-f173.google.com with SMTP id af79cd13be357-7b6edb82f85so260993285a.3
        for <linux-kernel@vger.kernel.org>; Thu, 06 Feb 2025 23:38:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gourry.net; s=google; t=1738913901; x=1739518701; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=Fe5nMUJySISTMDdWYsFBNWyKneA0oKNO50BAWaJvYHo=;
        b=BkQHeCDpfngmB5FlUpJOemtokwmbASCdz0/qvVgL4zCru4JXxTcVqE+dXZO1gltZg7
         wg66dROR7hbV17QG0Cw0Z3R8W2RSPgnUDsqZ5ulOWwJdrCX5Ss7w2W6FEqsBtapvN0np
         U/a6W9csWIj6GUKZlEdbUZVxi+k6oeHWJ7H0E0+AROZ+36iNzYpEkGer/qVk90Pp7uk6
         WUHp5GuvZkmN6GX12ve5Z+YWrUOr5zXKYV1Av/VRxH0gsAGrSFlNFxk6NrvafxSyx5ZY
         gYVdOQpePUOisUxF+Y+t53gcb4xXSGm2h8T6gQvWJ7bTn3vjQk3qkoCZ3ApCfRooe6L2
         ZUWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738913901; x=1739518701;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Fe5nMUJySISTMDdWYsFBNWyKneA0oKNO50BAWaJvYHo=;
        b=ix3Bl+6rIGNcaIYiWwhW8LZTeu95Kh4jtGAfHSe7vXa5TucDpn9B3IrYQQyciliiyx
         9nUfBfj71/h/UZWNRl23aEQgqTguyc8gLvf7PDsTyXS+tLN7ozMlfUmLVlEHQ9KscSAo
         RknW3S95Z7OGUfN3eaVj2rH7spfivGugm5hScZr7ze041TDkER/Rw8nnEn2EaMbSZyh1
         uNYUC0AYZC9fxW2cCZakVd0iwN8IR2ynAWWGzYxmpgO+4v9GJe3Rik9i1YlWXnJnHqto
         n5wSmI1zPgvfm0sSolm9SjIPPcyJhr2sQTP4ZyVbBN1yI2rpvFK5nR0y0KK7ZY52tjOk
         EfMA==
X-Forwarded-Encrypted: i=1; AJvYcCUBZobsorSFGM8R6UDVz+ZdUBITLDWigOd0V/02aDI82eWona1k+rKGu79/WEyuhLizFYppUXaNgmmmR/U=@vger.kernel.org
X-Gm-Message-State: AOJu0YyD4d3+rbZaIhWDmB2LHgBugGL81KsbCBiqvKGuYipoDYQp6STg
	xG+cX4svTgOEPPDgLVOUp4BcO5ww5fRTmIGkFHFv+2XYhA8mtKcYvzrVJZ9svek=
X-Gm-Gg: ASbGncsAaEPqCd7wy4LXgYIyN4VqH919ORnVFm/hzW8UcNkpyjbUwBLLJlEWdQV4joo
	CmGb/Tw5fXKb7av4twTSqDd8FEPZ36q66PBwhqzjsthYUf23OvQbjjTKfNWTgVM9yyr4qA2SfU+
	90eVP/qbNXdDJggk3ihPregDAd9s3vptoosbZMnKIz6fzFRrodoKbjm41JJhbAzUeaQKRU6+A7y
	z6Y+betLZxGF1DQhITIGy3qex1biF5C70qGsye1YIsmW9DyKbsjMybY6dN+2zQ+JI9zW1V4cgjO
	cWvsory2fJ/xY5hSjWAoDwXe47RCEvgfIXPo2Ng5fe9rJq4gIQ1KifLZ1+oSri5AAmLOSNXzzA=
	=
X-Google-Smtp-Source: AGHT+IEuw8h5SA3eQe8134UELvRpTmNLQAy9StgiwHLMzTdQECTNE9nf7NjgayFhWpOzjVy6V6jtFw==
X-Received: by 2002:a05:620a:2844:b0:7b6:e931:4608 with SMTP id af79cd13be357-7c047ba6ab5mr304347185a.6.1738913901363;
        Thu, 06 Feb 2025 23:38:21 -0800 (PST)
Received: from gourry-fedora-PF4VCD3F (pool-173-79-56-208.washdc.fios.verizon.net. [173.79.56.208])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7c041e9f957sm156492085a.88.2025.02.06.23.38.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Feb 2025 23:38:20 -0800 (PST)
Date: Fri, 7 Feb 2025 02:38:18 -0500
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
Subject: Re: [PATCH v5 10/16] cxl/pci: Update RAS handler interfaces to also
 support CXL PCIe Ports
Message-ID: <Z6W4am87XJm6OrBE@gourry-fedora-PF4VCD3F>
References: <20250107143852.3692571-1-terry.bowman@amd.com>
 <20250107143852.3692571-11-terry.bowman@amd.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250107143852.3692571-11-terry.bowman@amd.com>

On Tue, Jan 07, 2025 at 08:38:46AM -0600, Terry Bowman wrote:
> CXL PCIe Port Protocol Error handling support will be added to the
> CXL drivers in the future. In preparation, rename the existing
> interfaces to support handling all CXL PCIe Port Protocol Errors.
> 
> The driver's RAS support functions currently rely on a 'struct
> cxl_dev_state' type parameter, which is not available for CXL Port
> devices. However, since the same CXL RAS capability structure is
> needed across most CXL components and devices, a common handling
> approach should be adopted.
> 
> To accommodate this, update the __cxl_handle_cor_ras() and
> __cxl_handle_ras() functions to use a `struct device` instead of
> `struct cxl_dev_state`.
> 
> No functional changes are introduced.
> 
> [1] CXL 3.1 Spec, 8.2.4 CXL.cache and CXL.mem Registers
> 
> Signed-off-by: Terry Bowman <terry.bowman@amd.com>
> Reviewed-by: Alejandro Lucero <alucerop@amd.com>

Reviewed-by: Gregory Price <gourry@gourry.net>

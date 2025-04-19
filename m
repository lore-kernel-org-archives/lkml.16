Received: from mail-pg1-f181.google.com (mail-pg1-f181.google.com [209.85.215.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF48919938D
	for <linux-kernel@vger.kernel.org>; Sat, 19 Apr 2025 10:05:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745057113; cv=none; b=FD4u26CVvj7UEpQX2K2bE+Tqs1nYBPnhDbs2CZIdWUVDlZqwPI/m5QBBkh+Txd0+aTFjXFPlOkwfOSBDocFumJBVpoKmURHTkB0+mYj1KA6dUjM6/p4fa64UkcL8By4Xe4wTCArZYV5wv15DYiz2DvcycDVwZlISSENHBWr6V+k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745057113; c=relaxed/simple;
	bh=YxW3cqzhLUFz+R0XycGm28dvj+CDZnjbThb7r5vymfU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=hMKjWV1cUsGZ69V+RPS4oP1QnF6AyIWsOcziHkt65uD/h0J66LDGOYIz5o8/8NMT6Lstw4+hsoakuzH/aX7mBqiiciAalNzvE3GAYQteM9mLzVUHG+fhiv30WKKd6DHrDLVu/D5qRlzO0BSiWJ8KVHjUoLHWMbCDEWnEWKc5vyQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=lvNkFybM; arc=none smtp.client-ip=209.85.215.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="lvNkFybM"
Received: by mail-pg1-f181.google.com with SMTP id 41be03b00d2f7-ae727e87c26so1712645a12.0
        for <linux-kernel@vger.kernel.org>; Sat, 19 Apr 2025 03:05:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1745057111; x=1745661911; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=fZnspsQOL1AOM7bi9Gsam7VgHf9mR0UVvK0+Pib4Ri0=;
        b=lvNkFybMQUJLVj4JtHXU4RaRyAcvmd4oAyERAlEuqd1AudW7NG1FE8lFM5ZbRT72C+
         XqjV1E0XK3AdjchsmeGbR9zBYwUiicvvqLJx//eqffZ0uUffCXP2XA/VNOJoY0KkRmsw
         +dp/p4qr6SNjZ+PYsloctHxT3DCa302rcuca/aN8UdHjTx4YoRPXPvkFuVIih3ovlGY2
         pP+tnAYR5hayrod05FQl+bnY3sB4ZMSI/PiPm3dBB0Mb/36LWWVuGFLWpRsjT2iH3Cp1
         DB3We5Ta1kBb4Hb0rsGqi1poqfZ+kssCs29LTMw9uf1pdfM+jXtDXv/tR4+DS4aBIUT3
         vM/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745057111; x=1745661911;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=fZnspsQOL1AOM7bi9Gsam7VgHf9mR0UVvK0+Pib4Ri0=;
        b=LrGHZTIXp+UA/XUsRMOrPfuNp3pa5p6EI+F2rP15wjlOrJCmvi4D2dY+2GlFELTvFy
         bx53Gk5dbJ2LnlkrDmY2pY8cJJAqQd9dgSzDqoHQYf9fCeQh78Bi9HIC0yncGtOX54dn
         n68U/+wBU/eGU2hyB6D32blm5ZXq+MeT2HzQFcwEW95IpRCv/tNl3u31WpfvUhsmkk9w
         Ocx3cyOUm74vDuZdAmN4J4xML1RTVK+ADUvnJB+0BezGVswxz+vml1KjFeqCygKgDwZD
         TRoUcCiCEnYvXyxHedaum7Gvib97omkECR5EO37NJD7oWt6YgpzA5O+/aykF2vPkTcHS
         cUBg==
X-Forwarded-Encrypted: i=1; AJvYcCXUvBvyeTjhSVGGoq1TgYdP28lU2/iKnOvSlQSmZkh0UvOZ0AIsXUGjnhZ+pcXD7z92XDeJRZ/7D83iJQs=@vger.kernel.org
X-Gm-Message-State: AOJu0YxiZwJFTAP7eJjeOIZpXyPdO0WlLVbyUFNKX4WArFyalI3aULXI
	Zpy6uHMQ4EeFlqo1k+138HLme3/6iq4hJujzWLY2kXu60fHUdhVdMk9rhFOzlA==
X-Gm-Gg: ASbGncu9ZTKxI0bKG/iJCrMaJH3jHj1wEQtFartis7m2HFR5CJSSruatIHh3SdQSw6h
	9zc5WV6JVTdJLKBYPw28dfEFooPM6muIeGseJH0JPge2B16s7gkZ3uOaL8Lgag0r3j5FP3eHjh0
	M9cQBgh1rdSZx3U9tEwp34U8waO75WRsIAIx8VZAYHL9+UFi2Fak3pV6r8v9aEKwjoTv5F7wtUE
	duZKhEf6s2QPGfHJ9+31fzkTzU2/C1SsBxCwQW+RNz56CevEwzUiaAIX76ektDUCou9+cKwr/90
	IHK5zpvCUJ3DuxG2YyrTIRnhoH1zPuI2DbDlGW1/B4QhpAdZaFTauMS9mHWguw==
X-Google-Smtp-Source: AGHT+IG65vJcpfNX6xmMp18UpjmuQdRaXIXwcrTjjYFd+3ro4TsVx1269ri2TroDXZg+7G05wnIhgQ==
X-Received: by 2002:a17:903:1a30:b0:224:1074:63af with SMTP id d9443c01a7336-22c5360c9d8mr89282745ad.34.1745057110969;
        Sat, 19 Apr 2025 03:05:10 -0700 (PDT)
Received: from thinkpad ([36.255.17.167])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22c50bda70esm30696675ad.15.2025.04.19.03.05.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 19 Apr 2025 03:05:10 -0700 (PDT)
Date: Sat, 19 Apr 2025 15:35:06 +0530
From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To: Hans Zhang <18255117159@163.com>
Cc: lpieralisi@kernel.org, kw@linux.com, robh@kernel.org, 
	bhelgaas@google.com, s-vadapalli@ti.com, thomas.richard@bootlin.com, 
	linux-pci@vger.kernel.org, linux-kernel@vger.kernel.org, rockswang7@gmail.com
Subject: Re: [RESEND] PCI: cadence: Fix runtime atomic count underflow.
Message-ID: <shhqkx5vt5dwbw452yf5cq6gubgcrqpzw6xatyo2m7laogg7gv@xpnspwe5x7ds>
References: <20250301124418.291980-1-18255117159@163.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250301124418.291980-1-18255117159@163.com>

On Sat, Mar 01, 2025 at 08:44:18PM +0800, Hans Zhang wrote:
> From: "Hans Zhang" <18255117159@163.com>
> 
> If the pci_host_probe fails to be executed and run one time
> pm_runtime_put_sync. Run pm_runtime_put_sync or pm_runtime_put again in
> cdns_plat_pcie_probe or j721e_pcie_probe. Finally, it will print log
> "runtime PM usage count underflow!".
> 

Please reword the description as:

"If the call to pci_host_probe() in cdns_pcie_host_setup() fails, PM runtime
count is decremented in the error path using pm_runtime_put_sync(). But the
runtime count is not incremented by this driver, but only by the callers
(cdns_plat_pcie_probe/j721e_pcie_probe). And the callers also decrement the
runtime PM count in their error path. So this leads to the below warning from
the PM core:

runtime PM usage count underflow!

So fix it by getting rid of pm_runtime_put_sync() in the error path and directly
return the errno."

> Signed-off-by: Hans Zhang <18255117159@163.com>

Fixes tag?

> ---
>  drivers/pci/controller/cadence/pcie-cadence-host.c | 4 +---
>  1 file changed, 1 insertion(+), 3 deletions(-)
> 
> diff --git a/drivers/pci/controller/cadence/pcie-cadence-host.c b/drivers/pci/controller/cadence/pcie-cadence-host.c
> index 8af95e9da7ce..fe0b8d76005e 100644
> --- a/drivers/pci/controller/cadence/pcie-cadence-host.c
> +++ b/drivers/pci/controller/cadence/pcie-cadence-host.c
> @@ -576,8 +576,6 @@ int cdns_pcie_host_setup(struct cdns_pcie_rc *rc)
>  
>  	return 0;
>  
> - err_init:
> -	pm_runtime_put_sync(dev);
> -
> +err_init:
>  	return ret;

You can now directly do 'return ret' instead of using label.

- Mani

-- 
மணிவண்ணன் சதாசிவம்

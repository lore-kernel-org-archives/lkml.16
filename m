Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D01D26A1B8
	for <linux-kernel@vger.kernel.org>; Fri,  9 May 2025 06:51:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746773471; cv=none; b=kudSpzREcecpPYr2EGixX/lNM37xN29jyP1BIWCw/dpFkH/Vq+q6b/TrgonxWFVpIpO1SN0LqikEvQ5kMhTCy5MJ6e0LgvJmGjyxnISM64VcmcOulu0lRlq+xAS/zQHvg/sQO/kgUfOOnrT3IktGjO4971HCyn3vvvd1yiH+klw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746773471; c=relaxed/simple;
	bh=wiDZ4xkPtV9BOe7ADj1LbvuGPB4FiUezAyGN2IFKEzU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Fk+OwyFv7Qcd5lV34Vw4V4vyHvA61jVGPdenB17nVcvcQs2QBNCKxBmA4ehx+cCYIlrJ1BGMJ/uaL6mqIk9+KGPmaobBQjHDMdXgBJG+23T2TUUvrz77D6lGmO4Vduc90O91Fm5yDgiiyVZXbbTIVcRa46c6UgZaM76BY3BvRzs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=ZLhl8vlt; arc=none smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="ZLhl8vlt"
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-442ccf0e1b3so18513095e9.3
        for <linux-kernel@vger.kernel.org>; Thu, 08 May 2025 23:51:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1746773468; x=1747378268; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=ypnr2THvthLLCavYo7AZWLvgkehzz9yqDu3s2kWxJOs=;
        b=ZLhl8vltiQyAai1i+3Sn+H0oJQzhx2abSENViGQGEi/dQOBeBEIWkVmHyDe56CHdLt
         xDKK0g6GDHValO90OKLmhKsHxBC+IQkjHp1xhb8B67gRrfG//1E2UEPij8Lfzkl+ZSmd
         Ctx4cYNfzv3iaukeZn0YbhpJtLdreKmT2xXwozoLqNnEtS8QL108OPMuH7c+UGaXBK85
         qeEOFyq2mdQMZEZ4Mv6ZefuHOZtS9d0XdK9YsL9cpJjjxqloitR4iVeGiSavGywOx2TP
         DqwfefGijEOyPKlA/cjFEaNRW6SAkoeMHd5uup1+sfQ5BP6Av/+V7me1cfS0RnJ+i3nr
         2tnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746773468; x=1747378268;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ypnr2THvthLLCavYo7AZWLvgkehzz9yqDu3s2kWxJOs=;
        b=iEtGVHCWg7vOTYXOqtJ7FNeRZ+fh/Q0F5PkPVmQ5zDd72QqE9Mu1hw1jdYq+QLKpy3
         LR+ERESIWnzccRbc/6WdifnHgMuA4Xe7eZkFTN9kEPqiOXyPs5FPczFh8KkwclJpLrpu
         TNzslHKfAEkQvltPK9+iaRB8yLKpdsXVx6gwM4wDHC9lOamnGiuml2TYH5l8hlR0CiHH
         64ttmGEVvtf8/HRw5dwoxMEcLJRG8Nqh4b9Ttsj/5WbZwQy4gYe6vsZKTPTdJ92XnX0R
         7yvv8Dt7zFIyd01leUf61F1wzGC6DWZ18k+dE9rznKRlxgv4IJiKqGpaqd4j/ahVNNOY
         GzZA==
X-Forwarded-Encrypted: i=1; AJvYcCV4oja4sYrCXWUAuKyy3YTY0iB5pLOxkKpPzHcp1S1fk0ngRaPpKh84zi4/KyoyHPgH8EjsKde5hDsaNBg=@vger.kernel.org
X-Gm-Message-State: AOJu0YyihijXxDv4XjUmoF7kkOydWZzIQTA0itf2FCPcU629a5g7ieUH
	4dtX/ajopEbUzyI7UW6pz4qSdX7fv4L9yqRFTtv9VN8gFBOgF3ZM6vTvwyKb8g==
X-Gm-Gg: ASbGnctj72ZQWzP1SHpSBVmWNrmVAnUtbPrUqQy23tYnN/5KuCXARNY1NwDHzoPpp+Z
	dtf12xKKfpIK2XpD3xlPhQwBf3jIOy3UVMvablgi+c2WDXlwLaZ3lXWCERxDwvY3D7waGQ/qusO
	r6B9ik398wAoWS9ZDCzao/RkLku9mzKA8toiA4lq10YBk1MCZ8l/CjeHoDs3IAPnbdeETmkiL+/
	a5jXxqibf5CtMlxIF+unK6fl3LAezR14GZ5gyR9Kjvc5H9ncnvms2Tizkq+vaICZ16D3+f1AAbP
	OzuhfqT4YWqL8Vd4bk2JMjtUdTkco65leUPE4r+m+YutHR29XRlbpy3VHXTPPlrjlj6K8AC8n0R
	HGnqj7fKBwqz45usxV2PKKI8=
X-Google-Smtp-Source: AGHT+IEBZ+xyU+mtZq/TJ5fu+6WMLt3/ZEPH5kI6vP9q6SNWA2Tnohwr4qj0xsEIdaPCJ/e8n6vxRA==
X-Received: by 2002:a05:6000:178e:b0:391:4889:5045 with SMTP id ffacd0b85a97d-3a1f649be24mr1423812f8f.36.1746773468403;
        Thu, 08 May 2025 23:51:08 -0700 (PDT)
Received: from thinkpad (cust-east-par-46-193-69-61.cust.wifirst.net. [46.193.69.61])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a1f5a4c5e1sm2214791f8f.89.2025.05.08.23.51.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 May 2025 23:51:07 -0700 (PDT)
Date: Fri, 9 May 2025 12:21:07 +0530
From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To: Ethan Zhao <etzhao1900@gmail.com>
Cc: Mahesh J Salgaonkar <mahesh@linux.ibm.com>, 
	Oliver O'Halloran <oohall@gmail.com>, Bjorn Helgaas <bhelgaas@google.com>, 
	Lorenzo Pieralisi <lpieralisi@kernel.org>, Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kw@linux.com>, 
	Rob Herring <robh@kernel.org>, Zhou Wang <wangzhou1@hisilicon.com>, 
	Will Deacon <will@kernel.org>, Robert Richter <rric@kernel.org>, 
	Alyssa Rosenzweig <alyssa@rosenzweig.io>, Marc Zyngier <maz@kernel.org>, 
	Conor Dooley <conor.dooley@microchip.com>, Daire McNamara <daire.mcnamara@microchip.com>, 
	dingwei@marvell.com, cassel@kernel.org, Lukas Wunner <lukas@wunner.de>, 
	Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>, linuxppc-dev@lists.ozlabs.org, linux-pci@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-riscv@lists.infradead.org
Subject: Re: [PATCH v4 1/5] PCI/ERR: Remove misleading TODO regarding kernel
 panic
Message-ID: <34nnkgbfkccvxiksjb5qaojppcvnkq4l7rchllsppy7cl4fics@4mwtb3rhko5n>
References: <20250508-pcie-reset-slot-v4-0-7050093e2b50@linaro.org>
 <20250508-pcie-reset-slot-v4-1-7050093e2b50@linaro.org>
 <ec5bd8d1-c865-40ac-b03d-9e07875d931c@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <ec5bd8d1-c865-40ac-b03d-9e07875d931c@gmail.com>

On Fri, May 09, 2025 at 02:11:00PM +0800, Ethan Zhao wrote:
> 
> 
> On 5/8/2025 3:10 PM, Manivannan Sadhasivam wrote:
> > A PCI device is just another peripheral in a system. So failure to
> > recover it, must not result in a kernel panic. So remove the TODO which
> > is quite misleading.
> > 
> Could you explain what the result would be if A PCI device failed to
> recovery from FATAL/NON_FATAL aer error or DPC event ? what else
> better choice we have as next step ? or just saying "failed" then
> go ahead ?
> 

If the recovery is not possible (with device,bus,host reset), then there is
nothing could be done.

- Mani

-- 
மணிவண்ணன் சதாசிவம்

Received: from mail-qk1-f172.google.com (mail-qk1-f172.google.com [209.85.222.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 70BAC18DF86
	for <linux-kernel@vger.kernel.org>; Fri,  7 Feb 2025 07:35:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738913708; cv=none; b=QnaXaZO6FwAoUqWFRTDSbCZ6eEkW3U5oENipFCm8HI/S0W2wOtXuqEur1p1logM4SSMfVWxFZgd08puuA3yOg8EwhgDB5nd/V90xYLCpP1wXYs6dgvK/3oHlnV870gzJykSUnDXyPCP5BiLIhGT9ady9wxMrJRO6spedaBF/URw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738913708; c=relaxed/simple;
	bh=SoKfZsMWM++7qSwG9M+ObHWZT0yu/xHXf31AK8qwgbw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=f5jIiMIzZgmLLHCijSPFfPhEUZdhgkF71ElMDUkezd5jyUO0+ogx+vVDpqKilEkB7ENU2d7DWAv03Oi/V2EbHuvlqXA80YlT1yduW3nQVG/tLaAz/PYwqNmh15Cp8i5ESryo8gVhpivWZWZWhDeTBKVnSaHJTaY+cr884+ZjDcM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gourry.net; spf=pass smtp.mailfrom=gourry.net; dkim=pass (2048-bit key) header.d=gourry.net header.i=@gourry.net header.b=QCfHLlsN; arc=none smtp.client-ip=209.85.222.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gourry.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gourry.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gourry.net header.i=@gourry.net header.b="QCfHLlsN"
Received: by mail-qk1-f172.google.com with SMTP id af79cd13be357-7b7041273ddso159455585a.3
        for <linux-kernel@vger.kernel.org>; Thu, 06 Feb 2025 23:35:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gourry.net; s=google; t=1738913705; x=1739518505; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=S985nb84gx3fKGG3CziKlQ8YyE/d/ai620mo1qQAcd4=;
        b=QCfHLlsNS44BCvA/g6cLK2H5qdHS+yYeSdTeIZi/Y9TILkmnJWw2AMDSt5bZ+Ur38j
         l5D7UK4DLD7dAUK0tiDHckeGtHwtMA3bm/EYGqI5nN1Bmre7BcsdydApo8snh67D9A1u
         XVI/b0r869E0B5qzXdczopOsNMZ1a/yhhtwJUy1nOzpSuLJhulwtpW7kJ0y8ocFi30PX
         F/J92ZnOsjIIfuSKa5kHRaWen+bxPvwMH7oeacQc5i3M+lPCK7d2hjUkIg8dZsygAZZv
         8n3cOzcLSE3jZp6lrB5IXvC9KXlk3krgeS0aVmiqiZuziTr9GrzEN95J+ORZYWTh8Ay8
         lntQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738913705; x=1739518505;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=S985nb84gx3fKGG3CziKlQ8YyE/d/ai620mo1qQAcd4=;
        b=JHXOjSFSLnlbRNf40IulTbQDACbjohh5WFpU8FDQA6w7BOksNtM0k2ab19CkjhOA+k
         PIUE6EO641i528f+A+zC3luGL10sZ647+oq6JPZbZL9Nj0p4hX5lZlAqBLNUvFkxKkdf
         OH0TbXseVRVSwjbZAebLOvWcy4GjZ4jxQb1o1XY6vC6tLR+UqE7FIpffnWohc2lbFlIp
         29cFnEEA8/7kXutcReQO3vVYsaiJjoLbiUzPKRwU4jbwBhpiEaq9Ywr5296uVC8xo7RL
         cBnyY/u66R4eSpXVT4NJU+oppxBwSwyEOVRInQuhmJop/RurvREMghAuZIraNYatii8j
         6oSA==
X-Forwarded-Encrypted: i=1; AJvYcCU1U5l3LeSm4QWxbSOGQRAWI0GCtEG+nkTNHsZuDxwCXg1x3sWR6iZJOcim5AbeuQ2levGaimQ31H2IJ4s=@vger.kernel.org
X-Gm-Message-State: AOJu0YwHJmsqddUVKU94q0NMhvM6zieRFttWpliHxEiBJPkm3zBzeS69
	a/YHKtWl4IKhZgq3+shLuaOCIvrqQBX+gCDBjtshY+IKJylHAl/OP85YiCw4Kvg=
X-Gm-Gg: ASbGncvtDS6anbfDVX5k7yvZLt8Wfp9jDwiomFeccW+NhBhmuk+MjAMAj5XBoiW90RJ
	rfsyuifTGx5JGSqSpXumjRfwzuMuGQ2z7L0ydKR6f1U6jLusngeXOtEPbAw6O/oaxP8Ng9zpNrG
	wu5oIqEfvkNkwet68Ma0mmEGUk0sHsNiu+rvK9zu3hZmUeaNtkKfvaizHLjmTVcj7kKYcpDl8y0
	Hzvzaalxza/w+3fELN3zAzDqVRxugE3sTZU7C19uUrLhY5lQCsGRii+qVDIjP4Y5InZgaKcMH8p
	nalZV+OUK8w7plrgTn3kE3fUh0ACLJPSVNfS2NDhN/ztIwwg7d4jlI9wWkSR3LplhS/eUsERkA=
	=
X-Google-Smtp-Source: AGHT+IHR2VWtK5UoYrz7dJOeFMRcEgTDUb47l42Cs0Jrr9jUdPON+1TgDBAhn04WkWpQ6sv6zHS7uw==
X-Received: by 2002:a05:620a:4b45:b0:7b6:f03e:6c0e with SMTP id af79cd13be357-7c047bc6debmr252927585a.31.1738913705408;
        Thu, 06 Feb 2025 23:35:05 -0800 (PST)
Received: from gourry-fedora-PF4VCD3F (pool-173-79-56-208.washdc.fios.verizon.net. [173.79.56.208])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7c041dec129sm157964185a.18.2025.02.06.23.35.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Feb 2025 23:35:05 -0800 (PST)
Date: Fri, 7 Feb 2025 02:35:03 -0500
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
Subject: Re: [PATCH v5 09/16] cxl/pci: Map CXL PCIe Upstream Switch Port RAS
 registers
Message-ID: <Z6W3p1h9ghcBF_R6@gourry-fedora-PF4VCD3F>
References: <20250107143852.3692571-1-terry.bowman@amd.com>
 <20250107143852.3692571-10-terry.bowman@amd.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250107143852.3692571-10-terry.bowman@amd.com>

On Tue, Jan 07, 2025 at 08:38:45AM -0600, Terry Bowman wrote:
> Add logic to map CXL PCIe Upstream Switch Port (USP) RAS registers.
> 
> Introduce 'struct cxl_regs' member into 'struct cxl_port' to cache a
> pointer to the CXL Upstream Port's mapped RAS registers.
> 
> Also, introduce cxl_uport_init_ras_reporting() to perform the USP RAS
> register mapping. This is similar to the existing
> cxl_dport_init_ras_reporting() but for USP devices.
> 
> The USP may have multiple downstream endpoints. Before mapping AER
> registers check if the registers are already mapped.
> 
> Signed-off-by: Terry Bowman <terry.bowman@amd.com>

Reviewed-by: Gregory Price <gourry@gourry.net>


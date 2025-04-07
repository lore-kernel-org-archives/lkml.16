Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7528C1FF7D1
	for <linux-kernel@vger.kernel.org>; Mon,  7 Apr 2025 15:43:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744040586; cv=none; b=G3vU/23c0wb4LiQv6ubKklzZnO7RN6RNbEJdhb96wEAU7VozcTS+acoD9MNCZsbE6NrtTKcWWNp/7vxwNS/vUHap1b1HDMPNGqze+5x2Xo3Fl+VUUkAzYakqTXABYaAvJRAQ2CuD6L6++m1VW8QLXfAfps5IzzaNP7i9nEJAEWE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744040586; c=relaxed/simple;
	bh=icEhyVJTzHXg7jgkZ1zmlJ9l7uEXbXUXe7dmfY43wT0=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=Q6a6qhaHSg+304osx/6Nl1TJL4dSnTp9SJuzyRYi1mBiZNvBnogf0HzfOdb7DBsY9qfd9nJVm7p5J4DWbyU/KU0/KT4fUxxQDTbZzUCa3y78fDjrMxLbaTirA25oFTKhtipsvYrGv/f9AcotKH+wXSpd6yA80kjdYF3qK9HBZDg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=ZEvPhcAe; arc=none smtp.client-ip=209.85.221.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="ZEvPhcAe"
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-39ac8e7688aso3393860f8f.2
        for <linux-kernel@vger.kernel.org>; Mon, 07 Apr 2025 08:43:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1744040582; x=1744645382; darn=vger.kernel.org;
        h=mime-version:message-id:date:user-agent:references:in-reply-to
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=UwKS83gjL8otXan3IgVJgr6hS9y5Lec7kMgl8CrxX/s=;
        b=ZEvPhcAeF+3s9zScpS/aFZxoQOF5wYYe0MF4AYUscD+mwoWcoAt5f2w73VTB6fUrCC
         wGaOHxaGvIh8YTwoHv2AFBt0B2frQMje4cCh2BOj8YoB2SnWc9zeTwi38FGMJACeyr9L
         eFoCtJD7PYDd3RvlalyNLuQqeFwqGLTwK8K9ObV/UNVLTiI4D0WypretjJlwOQX1pG32
         4sgh40Z6sPeQ/EtQOuft/oZs8GW84LanBZhuul5Ncmq3LErgvZgK+mH67Unzo9iPluCW
         qiLwh/iRAJermdFO9UCg6SiYrDjAP62uUVv5kXnyDXQN6V/LMdmW6JzBcJdPBe3ElkRN
         o7bA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744040582; x=1744645382;
        h=mime-version:message-id:date:user-agent:references:in-reply-to
         :subject:cc:to:from:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=UwKS83gjL8otXan3IgVJgr6hS9y5Lec7kMgl8CrxX/s=;
        b=b8qo1qfyHs0kQitCir/yZgOVaAKMxzWY8s7Rh4bi4hIQHNg2RINJn3CSHG2kLtl7ag
         /X9XySkYz6HCmP+ucMbzO0MS9ApQ1BHSLx5FNRTVPs0QmJczMbizZzokPk9Ql4597fVV
         6pg0cWesMKEdOUVSHu0ZMzN5PK4/dfZgEeeOdU9EpRNsCzGX7bksnGC+ghGRmHQST74u
         2+551bO48X9bYHC6X36jSjJK2hXKqAPQNQi0bVUvkUleE3gTgw/Q9dKYuR1cxWM3AndF
         L04NH6MVjrKP5oiUPxHcRBEzsw0TpKH1LZmgUpm/HrAgDhyvEmOLBtFpX7sLkGYSPiea
         YjuQ==
X-Forwarded-Encrypted: i=1; AJvYcCVroEe9Bsb2XIoXDLrUjLiFPu4KciWeaycybXft2d2cO4d7P227D8cmQTQdBsUlrQKQn/0Rr7iUvS6zPw8=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx6VrOqmxyY1zIUP3WVj46J0oaoKSbMfY/801xdGCE0iSS6xezW
	CtoKk7cGSrosOnCWwaHPi8hT9t5t0Pn4Y5p4C0/iUKuQ84um7Ua/2jJENChPaYE=
X-Gm-Gg: ASbGncudieldoAJDAmBI/YLKhY/MyaB/T8qsX28TlGB/nclrQXT+NTxFk3+xQOxwblT
	MujEisGn4AjfD9tZuBk91FR0vPI8HKed2xzKi//YYS3J34h1UtNMkB1dxfiH97zgY0JLIkmrNL7
	YPU5yL0wOZLLthBt61wtP5Tl8Sywav9sB834sTr/qsYdmQ0Ats8FrjpOdG25elt9neSWgrEox7n
	xst3sIU8Smv5GWs3mVt2dfumx8pSwVZ59K6v/hPBQPhi7YTWml1v0nsz0O6SaT9134VGwTW8A05
	Oj9F+iSgqsMc+u6DGwtX6levN/X6EY3fbhbLzRAej9mEzdq+yXQ84j4=
X-Google-Smtp-Source: AGHT+IEvLb0NTyDHj4c780QWtXn9xkplpLX5dvvjj3YvSoxW0R3QPk0BF940mrnTtyAAxjx1VydCvA==
X-Received: by 2002:a05:6000:2a5:b0:39a:ca04:3e4d with SMTP id ffacd0b85a97d-39d6fc00aabmr7580240f8f.7.1744040581642;
        Mon, 07 Apr 2025 08:43:01 -0700 (PDT)
Received: from localhost ([2a01:e0a:3c5:5fb1:1122:cb29:d776:d906])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-39c301a0a90sm12335092f8f.21.2025.04.07.08.43.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Apr 2025 08:43:01 -0700 (PDT)
From: Jerome Brunet <jbrunet@baylibre.com>
To: Niklas Cassel <cassel@kernel.org>
Cc: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,  Krzysztof
 =?utf-8?Q?Wilczy=C5=84ski?= <kw@linux.com>,  Kishon Vijay Abraham I
 <kishon@kernel.org>,
  Bjorn Helgaas <bhelgaas@google.com>,  Lorenzo Pieralisi
 <lpieralisi@kernel.org>,  Jon Mason <jdmason@kudzu.us>,  Dave Jiang
 <dave.jiang@intel.com>,  Allen Hubbe <allenbh@gmail.com>,  Christoph
 Hellwig <hch@lst.de>,  Sagi Grimberg <sagi@grimberg.me>,  Chaitanya
 Kulkarni <kch@nvidia.com>,  Marek Vasut <marek.vasut+renesas@gmail.com>,
  Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,  Yuya Hamamachi
 <yuya.hamamachi.sx@renesas.com>,  linux-pci@vger.kernel.org,
  linux-kernel@vger.kernel.org,  ntb@lists.linux.dev,
  linux-nvme@lists.infradead.org
Subject: Re: [PATCH v3 2/3] PCI: endpoint: improve fixed_size bar handling
 when allocating space
In-Reply-To: <Z_Pw3I2xO7BMSGWW@ryzen> (Niklas Cassel's message of "Mon, 7 Apr
	2025 17:35:56 +0200")
References: <20250407-pci-ep-size-alignment-v3-0-865878e68cc8@baylibre.com>
	<20250407-pci-ep-size-alignment-v3-2-865878e68cc8@baylibre.com>
	<Z_Pw3I2xO7BMSGWW@ryzen>
User-Agent: mu4e 1.12.9; emacs 30.1
Date: Mon, 07 Apr 2025 17:43:00 +0200
Message-ID: <1jjz7wvuyj.fsf@starbuckisacylon.baylibre.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

On Mon 07 Apr 2025 at 17:35, Niklas Cassel <cassel@kernel.org> wrote:

> Hello Jerome,
>
> On Mon, Apr 07, 2025 at 04:39:08PM +0200, Jerome Brunet wrote:
>> When trying to allocate space for an endpoint function on a BAR with a
>> fixed size, the size saved in the 'struct pci_epf_bar' should be the fixed
>> size. This is expected by pci_epc_set_bar().
>> 
>> However, if the fixed_size is smaller that the alignment, the size saved
>> in the 'struct pci_epf_bar' matches the alignment and it is a problem for
>> pci_epc_set_bar().
>> 
>> To solve this, continue to allocate space that match the iATU alignment
>> requirement but save the size that matches what is present in the BAR.
>> 
>> Fixes: 2a9a801620ef ("PCI: endpoint: Add support to specify alignment for buffers allocated to BARs")
>> Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
>> ---
>>  drivers/pci/endpoint/pci-epf-core.c | 25 +++++++++++++++++--------
>>  1 file changed, 17 insertions(+), 8 deletions(-)
>> 
>> diff --git a/drivers/pci/endpoint/pci-epf-core.c b/drivers/pci/endpoint/pci-epf-core.c
>> index b7deb0ee1760b23a24f49abf3baf53ea2f273476..fb902b751e1c965c902c5199d57969ae0a757c2e 100644
>> --- a/drivers/pci/endpoint/pci-epf-core.c
>> +++ b/drivers/pci/endpoint/pci-epf-core.c
>> @@ -225,6 +225,7 @@ void pci_epf_free_space(struct pci_epf *epf, void *addr, enum pci_barno bar,
>>  	struct device *dev;
>>  	struct pci_epf_bar *epf_bar;
>>  	struct pci_epc *epc;
>> +	size_t size;
>>  
>>  	if (!addr)
>>  		return;
>> @@ -237,9 +238,12 @@ void pci_epf_free_space(struct pci_epf *epf, void *addr, enum pci_barno bar,
>>  		epf_bar = epf->sec_epc_bar;
>>  	}
>>  
>> +	size = epf_bar[bar].size;
>> +	if (epc_features->align)
>> +		size = ALIGN(size, epc_features->align);
>
> Personally, I think that you should just save the aligned_size / mem_size /
> backing_mem_size as a new struct member, as that avoids the risk that someone
> later modifies pci_epf_alloc_space() but forgets to update
> pci_epf_free_space() accordingly.

I tried but it looked a bit silly to store that when it was only a
matter of calling ALIGN() with parameters we already had, and it is
supposed to be only used in those two functions.

>
> But I will leave the decision to the PCI endpoint maintainers.
>

Ultimately, I do not have a strong opinion on this. Either way is fine
by me.

>
> Kind regards,
> Niklas
>
>
>> +
>>  	dev = epc->dev.parent;
>> -	dma_free_coherent(dev, epf_bar[bar].size, addr,
>> -			  epf_bar[bar].phys_addr);
>> +	dma_free_coherent(dev, size, addr, epf_bar[bar].phys_addr);
>>  
>>  	epf_bar[bar].phys_addr = 0;
>>  	epf_bar[bar].addr = NULL;
>> @@ -266,7 +270,7 @@ void *pci_epf_alloc_space(struct pci_epf *epf, size_t size, enum pci_barno bar,
>>  			  enum pci_epc_interface_type type)
>>  {
>>  	u64 bar_fixed_size = epc_features->bar[bar].fixed_size;
>> -	size_t align = epc_features->align;
>> +	size_t aligned_size, align = epc_features->align;
>>  	struct pci_epf_bar *epf_bar;
>>  	dma_addr_t phys_addr;
>>  	struct pci_epc *epc;
>> @@ -287,12 +291,17 @@ void *pci_epf_alloc_space(struct pci_epf *epf, size_t size, enum pci_barno bar,
>>  			return NULL;
>>  		}
>>  		size = bar_fixed_size;
>> +	} else {
>> +		/* BAR size must be power of two */
>> +		size = roundup_pow_of_two(size);
>>  	}
>>  
>> -	if (align)
>> -		size = ALIGN(size, align);
>> -	else
>> -		size = roundup_pow_of_two(size);
>> +	/*
>> +	 * Allocate enough memory to accommodate the iATU alignment requirement.
>> +	 * In most cases, this will be the same as .size but it might be different
>> +	 * if, for example, the fixed size of a BAR is smaller than align
>> +	 */
>> +	aligned_size = align ? ALIGN(size, align) : size;
>>  
>>  	if (type == PRIMARY_INTERFACE) {
>>  		epc = epf->epc;
>> @@ -303,7 +312,7 @@ void *pci_epf_alloc_space(struct pci_epf *epf, size_t size, enum pci_barno bar,
>>  	}
>>  
>>  	dev = epc->dev.parent;
>> -	space = dma_alloc_coherent(dev, size, &phys_addr, GFP_KERNEL);
>> +	space = dma_alloc_coherent(dev, aligned_size, &phys_addr, GFP_KERNEL);
>>  	if (!space) {
>>  		dev_err(dev, "failed to allocate mem space\n");
>>  		return NULL;
>> 
>> -- 
>> 2.47.2
>> 

-- 
Jerome

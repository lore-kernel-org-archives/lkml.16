Received: from casper.infradead.org (casper.infradead.org [90.155.50.34])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD4A628EA;
	Mon, 23 Jun 2025 20:44:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=90.155.50.34
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750711474; cv=none; b=Ytije2QBTGP9TedVywJaWOgC5VPowQl8nWdgF4phCqyDKkRCvfuXcop22b615igBbPcvcBdJhTBQLYiGBrQlcFack5XuTN7AHVnu3wodHB9HD1LwdD5hEKVUSIhv4+B/f6XxlPEEcCGDnK5pH1WnId4fIp6zVmRBQtq2AUz7ma8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750711474; c=relaxed/simple;
	bh=W3JfryFi7qAJNioxk+IDNfO++ftIIwWw8IFW9OP5Idw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=d2MuUUB7IPPwS0TNqTYw7lGc2ntxLrdLEduGi7j1nbibCNWvWVMmWB45Wd55oKIHEfs8y8MTkY4hAt75seD4FuA6fjDyqRbjDDfJyY9liurmRrCwLN6Ow6aX0aTC9Uxe5W/cw4ZsDavJNQkQE8QVnAXSgbpAlX/q+27Z7B88ak0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org; spf=none smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=L6MBjskY; arc=none smtp.client-ip=90.155.50.34
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="L6MBjskY"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:Content-Type:
	In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender
	:Reply-To:Content-ID:Content-Description;
	bh=Ga66k71n0w2vGA9z4DH8+0qqeWCf9Q2vDualzrEXD4g=; b=L6MBjskYOdhIWMykF6aQAWDR7J
	F5FA62THmEEazZNSZJlog9O8O7uhD1uSn2Me+3cmY+FHE8mXLNMfhjJSb+h6vwAeW/6OWtOinwNJD
	QIcDD/V73ACO1Z0Q/3W1UMDCtlM+DqoiXj4lTSzYPI2cgDPeFFV/f8CimU0s8uMw+VNGLIq0opQ+5
	ruCWjN1vXETWMdayFXXaozEyOQeAwOLRcom8uNONEjiI+/kW9cMH3ty4V9bMQRrbJHyMW7EDBUbMt
	dCDTHc9MZsVV89HzABQvpgPP9qkwk/akE2MoGkb0AMmHpvNqnIq7NVrU2IyYfyHrNFuIA0wjGXl6C
	gmHbWoOg==;
Received: from [50.53.25.54] (helo=[192.168.254.17])
	by casper.infradead.org with esmtpsa (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uTo1d-00000004Yi0-0XuT;
	Mon, 23 Jun 2025 20:44:21 +0000
Message-ID: <44434e4e-cd03-49d2-bd0c-94c29f54c88b@infradead.org>
Date: Mon, 23 Jun 2025 13:44:17 -0700
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/5] nvme: Fix multiple spelling and grammar issues in
 host drivers
To: Alok Tiwari <alok.a.tiwari@oracle.com>, linux-nvme@lists.infradead.org,
 kbusch@kernel.org, axboe@kernel.dk, hch@lst.de, sagi@grimberg.me,
 kch@nvidia.com, nilay@linux.ibm.com, corbet@lwn.net
Cc: linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20250623064036.4187788-2-alok.a.tiwari@oracle.com>
Content-Language: en-US
From: Randy Dunlap <rdunlap@infradead.org>
In-Reply-To: <20250623064036.4187788-2-alok.a.tiwari@oracle.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 6/22/25 11:40 PM, Alok Tiwari wrote:
> This commit fixes several typos and grammatical issues across
> various nvme host driver files:
> - Corrected "glace" to "glance" in a comment in apple.c
> - Fixed "Idependent" to "Independent" in core.c
> - Changed "unsucceesful" to "unsuccessful", "they blk-mq" to "the
> blk-mq", Fixed "terminaed" to "terminated" and other grammar in fc.c
> - Updated "O's" to "0's" to clarify meaning in nvme.h
> - function name comment *_transter_len() -> *_transfer_len() in zns.c
> 
> Fixed sysfs_emit() output format in pci.c (replaced x%08x with 0x%08x)
> 
> These changes improve the code readability and documentation
> consistency across the NVMe driver.
> 
> Signed-off-by: Alok Tiwari <alok.a.tiwari@oracle.com>

Reviewed-by: Randy Dunlap <rdunlap@infradead.org>

Thanks.

> ---
>  drivers/nvme/host/apple.c      |  4 ++--
>  drivers/nvme/host/core.c       |  2 +-
>  drivers/nvme/host/fc.c         | 10 +++++-----
>  drivers/nvme/host/nvme.h       |  2 +-
>  drivers/nvme/host/pci.c        |  2 +-
>  drivers/nvme/host/rdma.c       |  2 +-
>  drivers/nvme/target/passthru.c |  4 ++--
>  drivers/nvme/target/zns.c      |  2 +-
>  8 files changed, 14 insertions(+), 14 deletions(-)


-- 
~Randy

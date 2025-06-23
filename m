Received: from casper.infradead.org (casper.infradead.org [90.155.50.34])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A5A9C1F4722;
	Mon, 23 Jun 2025 20:39:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=90.155.50.34
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750711167; cv=none; b=uwmOfDVyBaBNGgDE98U9Oko0278w8Yma3wXg6dizEe1ME+VPhHn4W6wrf/O9/podgiBhydSaZfKlh3954I98wbSMx+GjoVBFrF7dFVxPYExB5MEHE2H/lXUm2Rq3Oh2w2Iycs9HJvG5guLk0ANhdtQHybLU8FADBD47qNHxiMzM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750711167; c=relaxed/simple;
	bh=jOBHMkhfK17KwiJCLSBMVKuPedcRRXNEGl8b4o/dC1U=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=BaNqMOZL67a50A4TL/pG/oEzG9NOzFg9Ix/itQ5HX/dRLbRrAruDju5YUnnJBiolkk6y7krrs+/KgQ7EDFHP6i5EgiWmSob761cc8cmxnSTLPoL+aPh36TD/Y+4jcQ593Ll0q2B2Thpul+TCK3X7WMV2GhenScxgyyCsg0bingM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org; spf=none smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=BGNYKeJA; arc=none smtp.client-ip=90.155.50.34
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="BGNYKeJA"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:Content-Type:
	In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender
	:Reply-To:Content-ID:Content-Description;
	bh=gu+6pmFreAAsWhh78QzgjCygCkuWla9oYWkSW6ad8RI=; b=BGNYKeJA9cA8ap+f6qIae/xbFg
	YBSFQwwCvjPd66KdSHhyr3LYnSCAHXk7Z/oyfrD1H8dddkCNgnGEvMANOUtiiQD96rxafOHkHn+Hq
	CBqkR+U8f9AB+Satn1EwagdcrLmOdk237bhXoD0ULQd30veMz+3jzz08PaY1Z/1PCg7wR8U8QY6w2
	86zpIZPfZy/jN1jMXjNbbtN9++3bXnQdc3xjDFmmjnVaC8qklrM2EV1k0rVqrISiqWVwn2jqRutce
	9MhLjMdeHsd+bltLRSWAGo7U4QDWjK/zFYxiORCu+IZpCnRlxq0pfnqlPiJ+GaIDqKvMAWctErQbH
	j4Ol9uYg==;
Received: from [50.53.25.54] (helo=[192.168.254.17])
	by casper.infradead.org with esmtpsa (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uTnwf-00000004Y38-1yap;
	Mon, 23 Jun 2025 20:39:13 +0000
Message-ID: <e2b0e9fc-c1dc-4f2e-9a6d-c92d25f28fed@infradead.org>
Date: Mon, 23 Jun 2025 13:39:03 -0700
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 5/5] docs: nvme: fix grammar in
 nvme-pci-endpoint-target.rst
To: Alok Tiwari <alok.a.tiwari@oracle.com>, linux-nvme@lists.infradead.org,
 kbusch@kernel.org, axboe@kernel.dk, hch@lst.de, sagi@grimberg.me,
 kch@nvidia.com, nilay@linux.ibm.com, corbet@lwn.net
Cc: linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20250623064036.4187788-2-alok.a.tiwari@oracle.com>
 <20250623064036.4187788-6-alok.a.tiwari@oracle.com>
Content-Language: en-US
From: Randy Dunlap <rdunlap@infradead.org>
In-Reply-To: <20250623064036.4187788-6-alok.a.tiwari@oracle.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi,

On 6/22/25 11:40 PM, Alok Tiwari wrote:
> Notable changes:
> Use "an NVMe" instead of "a NVMe" throughout the document
> Fix incorrect phrasing such as "will is discoverable" -> "is
> discoverable"
> Ensure consistent and proper article usage for clarity.
> 
> Signed-off-by: Alok Tiwari <alok.a.tiwari@oracle.com>
> ---
>  Documentation/nvme/nvme-pci-endpoint-target.rst | 16 ++++++++--------
>  1 file changed, 8 insertions(+), 8 deletions(-)
> 
> diff --git a/Documentation/nvme/nvme-pci-endpoint-target.rst b/Documentation/nvme/nvme-pci-endpoint-target.rst
> index b699595d1762b..48f3b7f685945 100644
> --- a/Documentation/nvme/nvme-pci-endpoint-target.rst
> +++ b/Documentation/nvme/nvme-pci-endpoint-target.rst

[snip]

> @@ -181,10 +181,10 @@ Creating an NVMe endpoint device is a two step process. First, an NVMe target
>  subsystem and port must be defined. Second, the NVMe PCI endpoint device must
>  be setup and bound to the subsystem and port created.
>  
> -Creating a NVMe Subsystem and Port
> +Creating an NVMe Subsystem and Port
>  ----------------------------------

The underline needs to be extended one more character.

>  
> -Details about how to configure a NVMe target subsystem and port are outside the
> +Details about how to configure an NVMe target subsystem and port are outside the
>  scope of this document. The following only provides a simple example of a port
>  and subsystem with a single namespace backed by a null_blk device.
>  
> @@ -234,7 +234,7 @@ Finally, create the target port and link it to the subsystem::
>          # ln -s /sys/kernel/config/nvmet/subsystems/nvmepf.0.nqn \
>                  /sys/kernel/config/nvmet/ports/1/subsystems/nvmepf.0.nqn
>  
> -Creating a NVMe PCI Endpoint Device
> +Creating an NVMe PCI Endpoint Device
>  -----------------------------------

Same here.

>  
>  With the NVMe target subsystem and port ready for use, the NVMe PCI endpoint

With those changes made, you can add:
Reviewed-by: Randy Dunlap <rdunlap@infradead.org>

Thanks.
-- 
~Randy

Received: from casper.infradead.org (casper.infradead.org [90.155.50.34])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2682312EBE7;
	Sat, 28 Jun 2025 18:57:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=90.155.50.34
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751137039; cv=none; b=FYS6RESWg8tDoB9Rt8pK2w5gqry+QQ+ZaZ/NYgebBF7I5vDM31eActw2aojWDtBI8sAwkMdnMuVghL5axrOKFr0l+M4VO+0vxkTtuvCaoH8VSKDCN3WRMfF8MN/06uvIzt8MlGP2Vz/4zhHgYfls2wBUSjhlegRGUSXQyjM6yXM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751137039; c=relaxed/simple;
	bh=orw7uYePXqNFzeqTqAHs8lqewbYqpFHGgIIJgS7y4o0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=h/N9INDrjPVWiZTnmob+o+RpUne07/jgqivbCyNAOsXGl9Fn4IqPiPa0CIS7Gw/d/maKmy+W0knQp6topkOHK2pqvop103NSNJc0KppUleU0aHr6Zm6JZpkZQ6lAuRE3QNupepu1VX6ufOoQurXfFfelE1iR7MGxvJ1+3X0duq0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org; spf=none smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=FaXUHel8; arc=none smtp.client-ip=90.155.50.34
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="FaXUHel8"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:Content-Type:
	In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender
	:Reply-To:Content-ID:Content-Description;
	bh=zZX0bC2DH2MvwuCPp2V/35NYunLcp9WEdDEtiUrQQ2Q=; b=FaXUHel8LbjMXRL7eKzc1etxNG
	+333bBg+DS2JjqWZfCbmhQIoqQjxjrxolxlFh8XBalD5h7voTbCBIhrWOYqtEsZjNpbwEFiNqntsA
	RjjEGgqUpYjYorMYEPXQI0O62PpTQWRnOBwOAMA7P1LJv0muFGqkqShFTAg5xL0hS7o/0nm/hgHoz
	Iv52D+gWNRhlSG9sT1FF0wdOfZLsWJA3sTTtvHo2b/KsRR8Zg8pa/2EzdPCBDDYjw/SuaNqXhF3sJ
	nk19C32irF3tqayHSZtpcqBs4L/+YD8V6nuYRCjY3GeYJ/KuKiZBen3ZU7lpkw5FJMLDIFmihMLuQ
	VBarSLPQ==;
Received: from [50.53.25.54] (helo=[192.168.254.17])
	by casper.infradead.org with esmtpsa (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uVajS-0000000H7cC-1dJJ;
	Sat, 28 Jun 2025 18:56:58 +0000
Message-ID: <bac0deae-ce00-4b19-9a34-69ac827f251d@infradead.org>
Date: Sat, 28 Jun 2025 11:56:54 -0700
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/8] docs: dma-api: use "DMA API" consistently
 throughout the document
To: Petr Tesarik <ptesarik@suse.com>, Jonathan Corbet <corbet@lwn.net>,
 Robin Murphy <robin.murphy@arm.com>,
 Marek Szyprowski <m.szyprowski@samsung.com>
Cc: Andrew Morton <akpm@linux-foundation.org>, Keith Busch
 <kbusch@kernel.org>, Jens Axboe <axboe@kernel.dk>,
 Bagas Sanjaya <bagasdotme@gmail.com>,
 "open list:DOCUMENTATION" <linux-doc@vger.kernel.org>,
 open list <linux-kernel@vger.kernel.org>,
 "open list:MEMORY MANAGEMENT" <linux-mm@kvack.org>
References: <20250627101015.1600042-1-ptesarik@suse.com>
 <20250627101015.1600042-2-ptesarik@suse.com>
Content-Language: en-US
From: Randy Dunlap <rdunlap@infradead.org>
In-Reply-To: <20250627101015.1600042-2-ptesarik@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 6/27/25 3:10 AM, Petr Tesarik wrote:
> Make sure that all occurrences are spelled "DMA API" (all uppercase, no
> hyphen, no underscore).
> 
> Signed-off-by: Petr Tesarik <ptesarik@suse.com>
> Reviewed-by: Randy Dunlap <rdunlap@infradead.org>

Tested-by: Randy Dunlap <rdunlap@infradead.org>

Thanks.

> ---
>  Documentation/core-api/dma-api.rst | 22 +++++++++++-----------
>  1 file changed, 11 insertions(+), 11 deletions(-)


-- 
~Randy

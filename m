Received: from casper.infradead.org (casper.infradead.org [90.155.50.34])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ED4E71FCD07;
	Wed,  5 Feb 2025 20:06:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=90.155.50.34
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738786022; cv=none; b=AXcrcx1t8PHmLvUUPFOSNxgd04Dfc2Zo0xC2NKCY/Z9etTlIcchVdptxOyUHOiqlWFS3HyBgnqFKZNyfpgH+mWoV4tYN+5zHd6h3GTqGVfhu0e9jLTIYdmuYKkfYmTDZAys+o+CquVKKh7oxedIXe1PBRVuP334loxHKtm9A2ro=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738786022; c=relaxed/simple;
	bh=hhNuJ1lkwRYOxoxZ5+9NJr1VBJePReds7Zq6S1Dj/Ng=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=IPW7TSMFornAYKSVt8ax7dJ6y5agpvETP0sSFBLgNPrztfhpnEseC9xVHo1cMIEPNYZ7UhdBXASm9Ng4Rp22fIAns8eZRV9TG6skx5otN67WmB1bvP//9ToB/d3bknLWcewfvs/uS6wdBEt++wfIY0xrX9Z0318ofbtQkVY0wP4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org; spf=none smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=gULfGSXQ; arc=none smtp.client-ip=90.155.50.34
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="gULfGSXQ"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:Content-Type:
	In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender
	:Reply-To:Content-ID:Content-Description;
	bh=fTUFYrWUOdqAxj4zuEvuU1bTUQ6LvvixMVGo4OVeyEg=; b=gULfGSXQt+Ns3R17/HYQzmjxNs
	YF+qdocyxMbjzBnf7yCsiw8lLeCKERsmI23TWAaXfckqzajywc1c2PsAIJIsOZlES8zXedg67Pk83
	Td1mq0RW2w/l7kEC9LJRGHkVkxeLYkmji944Cl6uWOcOttFCdmf5bP2tUT5XTNG8YFsH2a2jGjWdX
	PPdf/00JVFn4gCSNvhClqeNJ3ORoMkzI0GSb/1YmJNWTJA4Lu4bE4ry6IAmfLn7qK5ZXNc2QrosNF
	M9EQfuQ2ArpPnti8SqGK/85mUsevm9aNTh9mwIDEscakxVaHm4ddbDbrpWyxOynxfQvCGP7JBQQ22
	FNIXHmBg==;
Received: from [50.53.2.24] (helo=[192.168.254.17])
	by casper.infradead.org with esmtpsa (Exim 4.98 #2 (Red Hat Linux))
	id 1tflfb-00000004wuN-2EAQ;
	Wed, 05 Feb 2025 20:06:48 +0000
Message-ID: <2ff640b5-a8cb-48ae-a91e-1a379aae40a1@infradead.org>
Date: Wed, 5 Feb 2025 12:06:43 -0800
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] docs: hwmon: Fix spelling and grammatical issues
To: Purva Yeshi <purvayeshi550@gmail.com>, jdelvare@suse.com,
 linux@roeck-us.net, corbet@lwn.net
Cc: skhan@linuxfoundation.org, linux-hwmon@vger.kernel.org,
 linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20250205200134.12006-1-purvayeshi550@gmail.com>
Content-Language: en-US
From: Randy Dunlap <rdunlap@infradead.org>
In-Reply-To: <20250205200134.12006-1-purvayeshi550@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi,

On 2/5/25 12:01 PM, Purva Yeshi wrote:
> Fix spelling and grammatical errors across hwmon driver
> documentation files.
> 
> Signed-off-by: Purva Yeshi <purvayeshi550@gmail.com>
> ---
> V1 - https://lore.kernel.org/lkml/20250204134806.28218-1-purvayeshi550@gmail.com/
> V2 - Removed unwanted changes and split changes per driver, creating a separate patch for hwmon.
> 
>  Documentation/hwmon/abituguru-datasheet.rst | 8 ++++----
>  Documentation/hwmon/abituguru.rst           | 2 +-
>  2 files changed, 5 insertions(+), 5 deletions(-)
> 

LGTM. Thanks.

Reviewed-by: Randy Dunlap <rdunlap@infradead.org>


-- 
~Randy


Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 12F874C6C;
	Mon, 30 Jun 2025 04:10:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=90.155.92.199
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751256637; cv=none; b=m2Z1DAdT6qYyRI8EFi4Fijm1cWFOf8449Ua+oTD3XxZ9ezg6TqELm0D63zcDM4QneEjQqVDXIm9voMsJZjazsRgwEkjDB3Gu5U2XkckQqqFvtsXH8fRjyhWLbLZObi8T2A6/+GzGOAF8EdJmF4TRB11/LBuB7+HvsLdrGP3fwus=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751256637; c=relaxed/simple;
	bh=/sS9QaskdTwxIuKCjdwHREyw9P9SHkBCTMq6SggPEw4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=EHsQIDjNVNAj/oHcTDPKXXDsKv+/XtNFG9sH67zCEzXIf1qfr6yoxHXmASxfJLK5tiva9eBYKRmC+FMYx10eOUTNsPB5xg6UD0AB67Eztfoh60SGlur6MqjdJXUWKwpl8t+k7/pVnW5CaEcBo+Ek1Wqf3MZf5FnbBlNktg1D/ig=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org; spf=none smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=m8jnhjYT; arc=none smtp.client-ip=90.155.92.199
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="m8jnhjYT"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=lS3AXB9O6FHa8XHMS5zx7pNHEZJf42/+x1CeVfyzc54=; b=m8jnhjYTlbDJu5+5FoU/ZoCYiQ
	GAFmBv5l8VDFbQdX8EWEDQqSFVxVKZXC61PGxhmmlLZFq6Hnk9jQlRldPV0uTcpvbEpukCoM8k+jD
	nvvQVChyibyydgDbggcwdD+cnGQSSsCnJiNh3BaHw9DjclI9GsGI7kTrTlBZM52lln7n/oG3chKEV
	J89HdvZ/b3r4CP9aD2/EblzBaZzK5ZwX1b026SwVma7ndAV2J/o5+g0ckaajXABvxfGmkkCwKxyDv
	i3RbLUE5M8TRe/7mH309Crve0k7nKUtSqc8vF4fox9mxkmdotwfYhOWwrYmVxIEsOtYZzUg/H5lYe
	utgmXtTw==;
Received: from [50.53.25.54] (helo=[192.168.254.17])
	by desiato.infradead.org with esmtpsa (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uW5qj-00000006ir0-1Rbx;
	Mon, 30 Jun 2025 04:10:34 +0000
Message-ID: <67080724-fa16-4204-9ecb-7d7feddfb646@infradead.org>
Date: Sun, 29 Jun 2025 21:10:31 -0700
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 45/66] kconfig: gconf: remove global 'model1' and 'model2'
 variables
To: Masahiro Yamada <masahiroy@kernel.org>, linux-kbuild@vger.kernel.org
Cc: linux-kernel@vger.kernel.org
References: <20250624150645.1107002-1-masahiroy@kernel.org>
 <20250624150645.1107002-46-masahiroy@kernel.org>
Content-Language: en-US
From: Randy Dunlap <rdunlap@infradead.org>
In-Reply-To: <20250624150645.1107002-46-masahiroy@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 6/24/25 8:05 AM, Masahiro Yamada wrote:
> These variables are unnecessary because the current model can be
> retrieved using gtk_tree_view_get_model().
> 
> Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>

Acked-by: Randy Dunlap <rdunlap@infradead.org>

> ---
> 
>  scripts/kconfig/gconf.c | 7 ++-----
>  1 file changed, 2 insertions(+), 5 deletions(-)

-- 
~Randy

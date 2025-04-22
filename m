Received: from out-177.mta1.migadu.com (out-177.mta1.migadu.com [95.215.58.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D4312290BB3
	for <linux-kernel@vger.kernel.org>; Tue, 22 Apr 2025 08:28:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745310483; cv=none; b=nG2lfcEqnvu7s9ZswDv98w5bnxYprhyYOR9k3b0wfuuxKnVXbcu51G8vtHSCNR70Jro9atEg1wHjyBsmwz/CeBIxAxhId8TAMWwUG7yXb9K7ZqGNsGb2Y6iNoBbJ+4c8mQ/Rx/NvfLLQywUkZWuR5e0rYpxL+5Bm92DouzWtwik=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745310483; c=relaxed/simple;
	bh=g7KAwgL/rpqtApo9wTdj7rOSNNxCdAiqVKAXiRg3rEI=;
	h=Content-Type:Mime-Version:Subject:From:In-Reply-To:Date:Cc:
	 Message-Id:References:To; b=YB6lF/w9D43LyUUIoGJegEPoJAxulbLo/sCNZ4Ah47/eqj375RODKNztoLH+nJlecRnu62L7CYQDUT2Zz7nm4T/slDsniePE7H7hf2e8GBiniBGz/7UZS5mf7Ntb1Xg/JeBETQgt7HaYhCacfAYw5x+jbOIJxRboKS2QA8Ji2Yo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=haFfUafN; arc=none smtp.client-ip=95.215.58.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="haFfUafN"
Content-Type: text/plain;
	charset=us-ascii
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1745310468;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=g7KAwgL/rpqtApo9wTdj7rOSNNxCdAiqVKAXiRg3rEI=;
	b=haFfUafNn1BVvts0BQ/RQh+FwaYBNl7W+BWb+sA8S612uVHLCDiHJ8fsk4btLET4GWS6Og
	6qgdXpc+oQzp5COgyYjuS7ChnOCIZK0CrN/b4Z9uuK9Nue9pQfDX/OfM9xoD6MBxQyNZPT
	1MsLaLIBqclM8tfPCiz7rjuE0MqYjWg=
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3776.700.51.11.2\))
Subject: Re: [PATCH] MIPS: BCM63XX: Replace strcpy() with strscpy() in
 board_prom_init()
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Thorsten Blum <thorsten.blum@linux.dev>
In-Reply-To: <aAdNVAzu0rmIfGGC@smile.fi.intel.com>
Date: Tue, 22 Apr 2025 10:27:33 +0200
Cc: Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
 Alexander Sverdlin <alexander.sverdlin@gmail.com>,
 Linus Walleij <linus.walleij@linaro.org>,
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
 linux-hardening@vger.kernel.org,
 linux-mips@vger.kernel.org,
 linux-kernel@vger.kernel.org
Content-Transfer-Encoding: 7bit
Message-Id: <86E5AC5D-11BC-4B4E-B08E-845F59AACF6C@linux.dev>
References: <20250422074257.544016-2-thorsten.blum@linux.dev>
 <aAdNVAzu0rmIfGGC@smile.fi.intel.com>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
X-Migadu-Flow: FLOW_OUT

Hi Andy,

On 22. Apr 2025, at 10:03, Andy Shevchenko wrote:

> Can you use --cc OR put this line...

Yes, will do next time.

> Have you compiled this with `make W=1` with recent GCCs?

Yes, I compile-tested it with W=1 and mips64-linux-gnu-gcc 14.2.1.

Thanks,
Thorsten


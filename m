Received: from mail.alien8.de (mail.alien8.de [65.109.113.108])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B2AFF746E
	for <linux-kernel@vger.kernel.org>; Thu,  3 Apr 2025 11:26:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=65.109.113.108
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743679572; cv=none; b=mRC48Yc2VPjpHmQoFCiujoxibiFxDrXrfduy+wYFtKqH8C1ivdWT/AnNRI5ggk+0DqtQ8oyBxVT4AEHB+TjoCgDkc/RfrZMbWBttPZKvIu1ogzWU8Us4rxDuR06RgY7bKjGVmPyuGnx51ABxT4Drhm9A0Vu8qb2JSW9hDb/TyYw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743679572; c=relaxed/simple;
	bh=JSV35DhnKvLxdL79cciQOBuPD+T7aVlKbFdImsXeimM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Co9WUdmhEiXQgOsQdIqD7uB0nojWTfPetK6rWCsLtLVBW37g2vG7f5Om/FtVgoZCPMcD62uTai3zxED1DXnl7sHsFBwP10IGAjdffsTm4N36YIghqTPGnu7AXKJ8MyVJDjvxNwgaYxfw4TsXe2nocmC2DPchSt6t20/c0VOz+rE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=alien8.de; spf=pass smtp.mailfrom=alien8.de; dkim=pass (4096-bit key) header.d=alien8.de header.i=@alien8.de header.b=SpbDe2zX; arc=none smtp.client-ip=65.109.113.108
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=alien8.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=alien8.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (4096-bit key) header.d=alien8.de header.i=@alien8.de header.b="SpbDe2zX"
Received: from localhost (localhost.localdomain [127.0.0.1])
	by mail.alien8.de (SuperMail on ZX Spectrum 128k) with ESMTP id 0612040E023C;
	Thu,  3 Apr 2025 11:26:07 +0000 (UTC)
X-Virus-Scanned: Debian amavisd-new at mail.alien8.de
Authentication-Results: mail.alien8.de (amavisd-new); dkim=pass (4096-bit key)
	header.d=alien8.de
Received: from mail.alien8.de ([127.0.0.1])
	by localhost (mail.alien8.de [127.0.0.1]) (amavisd-new, port 10026)
	with ESMTP id NAd6G61DjRS5; Thu,  3 Apr 2025 11:26:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alien8.de; s=alien8;
	t=1743679563; bh=R+WgVRoLy9Q4xKXjVtRETzCCZWHR1Ai2bOY2VSzi1hI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=SpbDe2zXqZaicwZtO5flRCP0QUv2U8XzXlJ1egWVqrGFOf2w4/vuu8SSkoj/Io5bi
	 XxF0489jRAh1GiwhaZ4JhRwuecDQWhT0bNB75th9eV7B8k7XszVgF8MfWi7j3xRasH
	 pLVkMxl0MiObgnTbWIjluhxoIynFt4xFgJ4njt9eQaOXm0sQQA3nqSk8uJAeUlLIyt
	 aUvXWQRMTVJpvEQ46fY+2yRbaJJ6w/aOxrddk25XvPMPXutbVhZ9fOBliM/xcqoxgS
	 iV8T4edSrZMBQaQq80r53TBS9u2mzksXWxHHbcOMfhmR25bMYFRqlq700YMw/rjWWZ
	 gbHyi+1/Rm4Q5iYpMUAyGi5y3Np9uQDCeLzZUVg8xTRlBXl7YmcyUr5j7OB3vk5p0/
	 4cHyxtWZWLPn5AO8Qfs1xCA64sfWHwo+wca2BoDN2oZv8Sa1tYLf+KWT0iOxzec9/x
	 uNd7AX815a5X1KPhi49EVYfNhAJnGAvpbzfFa/fEv03NeN7e8HJjicY1MNRtgna8x8
	 I2PctvTEJFa1Af9YWlqOqSERqHSW+1hSbN0pWimwPVH6vENkpo3wz049Y8ZQ33bGV3
	 D1pZmIZpGs65y8XSyL4TQ2CCGEDaK70BnOB4iX6WP4aMs+vH8ek6mg9crdYhoncYnp
	 jN+hCISVJwo7Zsdzpdznedr4=
Received: from zn.tnic (pd95303ce.dip0.t-ipconnect.de [217.83.3.206])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature ECDSA (P-256) server-digest SHA256)
	(No client certificate requested)
	by mail.alien8.de (SuperMail on ZX Spectrum 128k) with ESMTPSA id B821B40E021F;
	Thu,  3 Apr 2025 11:25:55 +0000 (UTC)
Date: Thu, 3 Apr 2025 13:25:54 +0200
From: Borislav Petkov <bp@alien8.de>
To: Ingo Molnar <mingo@kernel.org>
Cc: Uros Bizjak <ubizjak@gmail.com>, x86@kernel.org,
	linux-kernel@vger.kernel.org, Thomas Gleixner <tglx@linutronix.de>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	"H. Peter Anvin" <hpa@zytor.com>, kernel test robot <lkp@intel.com>
Subject: Re: [PATCH -tip v2] x86/idle: Work around LLVM assembler bug with
 MONITOR and MWAIT insn
Message-ID: <20250403112554.GDZ-5wQsu0CzMMpBpZ@fat_crate.local>
References: <20250403091737.344149-1-ubizjak@gmail.com>
 <Z-5vAThgDL9gts35@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <Z-5vAThgDL9gts35@gmail.com>

On Thu, Apr 03, 2025 at 01:20:33PM +0200, Ingo Molnar wrote:
> So I've zapped cd3b85b27542 instead - let's re-try it again and
> see if there's any code generation tradeoffs vs. the byte encodings?

Please.

And give the test bots some time to chew on them before committing and/or
build-test with clang too.

Thx.

-- 
Regards/Gruss,
    Boris.

https://people.kernel.org/tglx/notes-about-netiquette

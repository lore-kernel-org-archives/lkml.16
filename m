Received: from ms.lwn.net (ms.lwn.net [45.79.88.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6BB821F8753;
	Sat, 21 Jun 2025 19:39:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.79.88.28
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750534752; cv=none; b=YubxYBUYw4Z9GxDIR2kvJYW0sRyKdj2SxhKgvgZg7SZa94Y4yVoR0yd47L2E9aQmSfBaLBhyCZ+ctL+upi9l8VXgj2KZnDdegZf+wAtIz0aLBT2oSC+yarY9UsblU/+zSE1FNiBPAQOR+++48Jwm5hkaxuxjKvSI2B3Pi0mNoII=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750534752; c=relaxed/simple;
	bh=3yiVFdTPNAuUz4xvy0quCMpPzcyTEdAaCd8L2MTQ+pw=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=Ek3INxiVfC5kxOZLY8hjLJiWyZwmD3gEW6d9VuWAWF8/S/3Cx+q4iQ+pp7bp/ccC9UgYGcD9NS0zIhz5DXDiXubb5Bho7rc3V9wNkWKB7xha+eAm0Pig79DKXZOwj/FiajqTzKZ3yE9Wy3xqDntRuWcLOn9NtzF6Aic/OwSIIs4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net; spf=pass smtp.mailfrom=lwn.net; dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b=rIYECFqc; arc=none smtp.client-ip=45.79.88.28
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lwn.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b="rIYECFqc"
DKIM-Filter: OpenDKIM Filter v2.11.0 ms.lwn.net 8B4AB41AD8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lwn.net; s=20201203;
	t=1750534750; bh=3yiVFdTPNAuUz4xvy0quCMpPzcyTEdAaCd8L2MTQ+pw=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=rIYECFqcI9E61znUsBSXySGfTlkNf4a90G2leZDRyJG6Tw0PnWxKob+guqA+NoLzo
	 AErGEMLmEF8OnYqkEmnaiemcTjEFs3nYYJnWVi61v729BPhGXzpObiCWXYDJguO4+A
	 wZ/AZXSyqhusPsbr10RQC9cUdnAZv86UN51kZvIEeGI0b9vcpmr7sPEN5uikVNMe4h
	 PF6aJHxCvkI0JvTl2OkjqCwFeR5/LJPoXFrc7M36grz6hQTvftfhpeM4iI7m97xFpz
	 hjPb8KaENddi/ImFXHKRp5BeaXJBoiXBLZCC9xvMQFQvqFfaYgvtrbhc0oQdx2h2LR
	 Dzcf3B3WQc/xw==
Received: from localhost (unknown [IPv6:2601:280:4600:2da9:67c:16ff:fe81:5f9b])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by ms.lwn.net (Postfix) with ESMTPSA id 8B4AB41AD8;
	Sat, 21 Jun 2025 19:39:10 +0000 (UTC)
From: Jonathan Corbet <corbet@lwn.net>
To: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>, Linux Doc Mailing
 List <linux-doc@vger.kernel.org>
Cc: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>, Mauro Carvalho Chehab
 <mchehab+huawei@kernel.org>, linux-kernel@vger.kernel.org, Akira Yokosawa
 <akiyks@gmail.com>
Subject: Re: [PATCH 0/6] Some improvements for the doc build system
In-Reply-To: <cover.1750406900.git.mchehab+huawei@kernel.org>
References: <cover.1750406900.git.mchehab+huawei@kernel.org>
Date: Sat, 21 Jun 2025 13:39:09 -0600
Message-ID: <87ldpkdgv6.fsf@trenco.lwn.net>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

Mauro Carvalho Chehab <mchehab+huawei@kernel.org> writes:

> Hi Jon,
>
> This series contain some patches from my parser-yaml one that
> aren't directly related to it. It basically addresses some issues
> at the build system. It also adds a script that I wrote with the
> purpose of checking backward problems when building against
> older toolchains.
>
> IMO, the best is to merge and apply it before the YAML series.

OK, I've applied it, but ... someday, I think the test_doc_build tool
should be properly documented and put somewhere under tools/testing.

jon

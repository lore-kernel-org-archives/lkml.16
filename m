Received: from ms.lwn.net (ms.lwn.net [45.79.88.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D6472E54D5;
	Fri, 27 Jun 2025 16:36:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.79.88.28
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751042182; cv=none; b=IBqREuI7HRtczXHeelOHntZ36fYJMHYbW0MYIWf9j8gYzXa4/QwfsNtmISN2nJ+aqN/5XFl4TSE8EbAfc/dA4D+lgZo/zBpAuy4MXG1+xFk9A/VwtgIqpKs+cRQac9uxWgU9tpuuPS1tb88FStmzCk+LEl8/xWrwmP6ywzZK1qY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751042182; c=relaxed/simple;
	bh=lHSOozi2XZFmcbKE/yvMC5A+P89S6+ByHXRgK//y00s=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=gUNHZLQ4+AS6bPs5gbpKXE7aElsjqUeY3r/j+oVA3gV6/8y5X/10tD69mixsSd9IbPID/D9jWEkJ1jnjPewbDc2D3f/Q6Hzhdoq/QbbGXeq1t+nS1U0fHSORQ5OVEJY2ZHwKNo1WaCDzC8PXkNKyqCwNFrqJgFTZdmThDC1ZjpM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net; spf=pass smtp.mailfrom=lwn.net; dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b=djAWL+Mm; arc=none smtp.client-ip=45.79.88.28
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lwn.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b="djAWL+Mm"
DKIM-Filter: OpenDKIM Filter v2.11.0 ms.lwn.net C8791406FC
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lwn.net; s=20201203;
	t=1751042174; bh=kInmtXquqmIK/r68eyZas1KLXdq7ekeHM4fZoyEUvUQ=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=djAWL+Mm2QsUh8+3s46zSV4dan/Bx0Qi8fLiCLzKURMBu0YkWNFsh82QQ+aZMIFGS
	 emDbgom+w86Hw9mWK60wUDYaqQ2JYCWEQtr85VNFSy9rG+NcaA179kacOMHjjlkKw7
	 U/9R2Aw7bPWrRmPK7i6QYLeRrQ/770t6wWLfEuk1FKXgRsfFfe0tC8cKe857ffGml5
	 LHeAi2XjqY6n7U4K0zW+iMfKLU+/uSp7T1NDFmgk+uZWjwHwW1keUmpmBqb3NXeskw
	 BcKKb5tRBGlDk3Qqj7R67r1RxGX0hQVePUO2tCm4OvHZEyT7j7MSp94oALrwdIW7F3
	 oDUva59p/NDJQ==
Received: from localhost (c-73-14-55-248.hsd1.co.comcast.net [73.14.55.248])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by ms.lwn.net (Postfix) with ESMTPSA id C8791406FC;
	Fri, 27 Jun 2025 16:36:13 +0000 (UTC)
From: Jonathan Corbet <corbet@lwn.net>
To: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>, Linux Doc Mailing
 List <linux-doc@vger.kernel.org>
Cc: linux-kernel@vger.kernel.org, Akira Yokosawa <akiyks@gmail.com>, Sai
 Vishnu M <saivishnu725@gmail.com>
Subject: Re: [PATCH 0/3] Translate sphinx-pre-install to Python
In-Reply-To: <20250627171233.66c825ca@sal.lan>
References: <cover.1750924501.git.mchehab+huawei@kernel.org>
 <20250627171233.66c825ca@sal.lan>
Date: Fri, 27 Jun 2025 10:36:13 -0600
Message-ID: <871pr5gn0i.fsf@trenco.lwn.net>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

Mauro Carvalho Chehab <mchehab+huawei@kernel.org> writes:

> Em Thu, 26 Jun 2025 10:06:28 +0200
> Mauro Carvalho Chehab <mchehab+huawei@kernel.org> escreveu:
>
>> As part of my efforts to make the doc build system more modern, it
>> follows a patch series converting sphinx-pre-install to python.
>> 
>> The first patch contains a small fix to the Perl version. It is
>> interesting to have, as otherwise regression tests fail.
>> 
>> The conversion itself was not hard. Most of the time I spent writing
>> scripts to test it.
>
> Hi Jon,
>
> Please see this as a RFC. There is a trivial bug here when sphinx-build
> is found (m1 and m2 variables were renamed to match). Easy to fix,
> but I'm doing other cleanups, and I'm planning to improve the regression
> test coverage.
>
> I'll be sending you a new version next week.

OK, great, thanks for the heads-up.

jon

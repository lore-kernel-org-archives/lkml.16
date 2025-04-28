Received: from ms.lwn.net (ms.lwn.net [45.79.88.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0C547193077;
	Mon, 28 Apr 2025 23:57:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.79.88.28
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745884647; cv=none; b=Se9zTUsvhkRIL2ShS673PdS4moEWwJMWBPcYs1BTy9T3pdDQurDK4JBaGh1L4+namcbguThK6eeagj9XylOzLvBTfcPJJLgcSUyao4XcVOAWisq/xJ4REcnBJZh1+zVKByQjAG+7V8PJ64pkBTx5wnIvtkiE0gxfstlSPWIc2O8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745884647; c=relaxed/simple;
	bh=wuQ96xWIHnlfvh/BlXNd5KQDLS5DsUL2xmbm2c0BqgQ=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=WcEihFFyoXA5Vbm9gfwLZ8LkA5fvMTyaGAhxAffzikzoCKu8psW0aN4POSFwJyU4baiNCVxLT/4TmWNglkCd60z/J+OqSpsum0a6f0X556VnLGzH6dOioiBhWbT4KScXN7tFGyZTcjnQYaSEtF5lJ7D7zJfl4kIeJgP5oURUixU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net; spf=pass smtp.mailfrom=lwn.net; dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b=YXkXZfUm; arc=none smtp.client-ip=45.79.88.28
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lwn.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b="YXkXZfUm"
DKIM-Filter: OpenDKIM Filter v2.11.0 ms.lwn.net 18AB441060
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lwn.net; s=20201203;
	t=1745884645; bh=wuQ96xWIHnlfvh/BlXNd5KQDLS5DsUL2xmbm2c0BqgQ=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=YXkXZfUmPf/IM/oeirBHdFBTzRkbqTRW7m3qQ5CU1sGoZVfWQ/uk5OKqSFMmpHpY4
	 uxHhQLr2k3WvzS+c80jyz8T1/hiyYZcWheEBeJVNbluGoCEOeFhFBTADqncBPZzFun
	 ut7LRIMLDMiEUY87bUrpaakhuEg27o1RL+igQ++Aazwd5q/lWvQr+Fzzjy9C/41d/1
	 jjomigfunmRon8gBKwYSzfm+9sGuz3m3wCgCNHrVsFpsmoVNXbS2r/dOtyDln/88pm
	 37qs03GINNEFhn9J0USak1k8paClFiFZhrwOrNfd0ao9ormPIg5CUZ+6jHfsI13bjv
	 cVFXTmEKD2WnA==
Received: from localhost (mdns.lwn.net [45.79.72.68])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by ms.lwn.net (Postfix) with ESMTPSA id 18AB441060;
	Mon, 28 Apr 2025 23:57:25 +0000 (UTC)
From: Jonathan Corbet <corbet@lwn.net>
To: Andy Shevchenko <andriy.shevchenko@intel.com>, Mauro Carvalho Chehab
 <mchehab+huawei@kernel.org>
Cc: Linux Doc Mailing List <linux-doc@vger.kernel.org>, Akira Yokosawa
 <akiyks@gmail.com>, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/1] docs: Makefile: store __pycache__ at the output
 directory
In-Reply-To: <aAvQFen6D5ukjj-x@smile.fi.intel.com>
References: <cover.1745539360.git.mchehab+huawei@kernel.org>
 <1b9e7f34c1d99a27a8abb308da3221b4663b5693.1745539360.git.mchehab+huawei@kernel.org>
 <aAvQFen6D5ukjj-x@smile.fi.intel.com>
Date: Mon, 28 Apr 2025 17:57:24 -0600
Message-ID: <87jz73rg9n.fsf@trenco.lwn.net>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

Andy Shevchenko <andriy.shevchenko@intel.com> writes:

> On Fri, Apr 25, 2025 at 08:08:53AM +0800, Mauro Carvalho Chehab wrote:
>> Instead of blocking creation of *.pyc cache, store python
>> cache under Documentation/output/__pycache__
>
> Do we need the below in the commit message?
> I think having statistics is enough and this can be moved to the cover letter.

I agree, that was a lot of stuff to get to a one-line fix; I took the
liberty of trimming the tree listing out.

Applied, thanks.

jon

Received: from ms.lwn.net (ms.lwn.net [45.79.88.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 91E6021147D;
	Sun, 22 Jun 2025 20:58:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.79.88.28
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750625887; cv=none; b=ZmkaJXsJhafdWM/wxStpLsf1BquBwfSJncbXWx22UHZpGn92YzoGEchHkECK37ugR4pt70OlrwGDQI7ZUZEppxzKx5kXcsPQjZCJ11hDA5rVkT1ZzxBucd4gBLel5tX2VW+NpCesdBU8DYrJT3L7XxvUlrcVWmg0iKEmKD/I2aU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750625887; c=relaxed/simple;
	bh=NU75hMofD8FVCni1SR9f0CmLU9oo9iWeETN8RL+x1N0=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=jBz3axfGSDuZ6LFhNDJ37oVdSTjEVBefpHNBe067PXA0olEmIQEU7BtKfpZdEyuYF6Cn/owjZh+6XrHP2MPUKeGLJucQu7z2ZLiiuHXbpJ1JVF82dEMoIEEezv0OSBiedHnserngJzfQsjFG21IKoES3a9ZDwKf8UMLqFIOmABA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net; spf=pass smtp.mailfrom=lwn.net; dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b=Jc2Gm9J8; arc=none smtp.client-ip=45.79.88.28
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lwn.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b="Jc2Gm9J8"
DKIM-Filter: OpenDKIM Filter v2.11.0 ms.lwn.net 8CE8F406FF
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lwn.net; s=20201203;
	t=1750625885; bh=tnGVEQpMWCAXvlt3pOy/zgEbPVa0/jDcviBqSOcEfCQ=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=Jc2Gm9J8Lc3GRp6CaDCExWfPt9eXnkh8yyrtn7woDBn7zlYVQPZsf1GLcR34D9slz
	 jqqfAEBAENlDn5Xw+4cIV+RVyM8uh+iCEl8c46YqamEUwJb2oO6n7/k3r5kE1f5jLO
	 3PPFUQsbZ+b3Z9bHarROzRV2+KJgz/Im+N+8l4e/5auoQ1AaJUS2T3ofiQ0D2Sxn0i
	 22cYletPjpIv3s+PZsnu1sYvHn1YkDieqvXaMaEiyEnfTBrwzeB+Lf2+DKdCV73xDx
	 U34y7fhsqp80UMFSykUL3yBzxzCJdJFQ7Xj6KDYLn9GuyO0qBr2+Hm7qSqdnwTNyZI
	 YNfTicim0lq7A==
Received: from localhost (unknown [IPv6:2601:280:4600:2da9:67c:16ff:fe81:5f9b])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by ms.lwn.net (Postfix) with ESMTPSA id 8CE8F406FF;
	Sun, 22 Jun 2025 20:58:05 +0000 (UTC)
From: Jonathan Corbet <corbet@lwn.net>
To: Akira Yokosawa <akiyks@gmail.com>, Mauro Carvalho Chehab
 <mchehab+huawei@kernel.org>
Cc: linux-kernel@vger.kernel.org, Linux Doc Mailing List
 <linux-doc@vger.kernel.org>, Akira Yokosawa <akiyks@gmail.com>
Subject: Re: [PATCH v3 15/15] docs: conf.py: Check Sphinx and docutils version
In-Reply-To: <c05dd5dc-1e30-4a2c-80dc-70e8b62cc681@gmail.com>
References: <cover.1750571906.git.mchehab+huawei@kernel.org>
 <972673b0a5bf5537d47780d6f8e70ae45456e751.1750571906.git.mchehab+huawei@kernel.org>
 <c05dd5dc-1e30-4a2c-80dc-70e8b62cc681@gmail.com>
Date: Sun, 22 Jun 2025 14:58:04 -0600
Message-ID: <87v7ona3z7.fsf@trenco.lwn.net>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

Akira Yokosawa <akiyks@gmail.com> writes:

> On Sun, 22 Jun 2025 08:02:44 +0200, Mauro Carvalho Chehab wrote:
>> As reported by Akira, there were incompatibility issues with
>> Sphinx and docutils with docutils 0.19. There's already
>> a fix for it, but, as there are incompatibility issues with
>> different versions, better to add a check to verify if the
>> combination is supported/tested.
>> 
>
> I've been skeptical of adding such checks in conf.py.

I have to kind of agree with this concern.  We have managed without this
complexity so far.  It looks like we could always be behind on
maintaining it going forward.  Do we *really* need this one?

Thanks,

jon

Received: from ms.lwn.net (ms.lwn.net [45.79.88.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A080A2528F6;
	Mon, 10 Feb 2025 14:40:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.79.88.28
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739198411; cv=none; b=M24+ghF0Spj8pmMelOx/jSL5Fgp+ApSQc4ZSMKfXtcPGOHw5iSshMHlzgy5qcJqgw0fL5eYiqCw48xLRC2oKUtlZ0Ix8Yd6uZp6Yv90oMYSlgtXugarBXBfZ9lIV1aqhG9UWUy5WtQAWadlXBo+Oe9lDY5DCcz7YJbb/yfJ8ZlE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739198411; c=relaxed/simple;
	bh=Sj5eW9kyqvbKG1tZic0BsHM7+quD6yMZl2YhX8AXDkE=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=etzu2v8qJPVZXklzCCaY4kbrzlhT1CEjQbs0fxSVfE8pB6kPm+SLe3CS0eJQQ2QAZw9m+clQ6wYYQHrqKgOYMNcYmUb3sXx+BbeJSfPv/91pJrbLmjkvdaO0ZHRx6gmU1sX7miDRnUr1gieNTZ0tDy494mpN08t5VoBPB3e0tlg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net; spf=pass smtp.mailfrom=lwn.net; dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b=sXJCTr0L; arc=none smtp.client-ip=45.79.88.28
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lwn.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b="sXJCTr0L"
DKIM-Filter: OpenDKIM Filter v2.11.0 ms.lwn.net 6DEC148EB4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lwn.net; s=20201203;
	t=1739198403; bh=J0LDPXJ6Fp7OnZfUagLzuEZvxrfo5+dhEZvqyspU/b0=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=sXJCTr0Lwe/fVwRGXlZgaAd+8X4YcPL3vLhzmSDeHxFUDpjm9yk6yTdfZ0m4YUw4r
	 Q7+QAqLkKiHVR4s0btbXp9/VxfRY/RjawZzgap8NgKYz2yHsp6yedXtYNkliIg10Le
	 nA/I06O5wpBnD67CYF5RlyzyKwwXTeQb2K4nx+25CsH2z9q+Zr9UGPe7mUq7EocQ9m
	 rtg2bhnNIR6IVy604sOxn8t1ZkGat3pqC9pYhn1QvHWd14+77CAX2BZKYxUpEFF+eU
	 5gy1PZzJDB7jVy18Egh9Z5Qb+FS3Q6YX6iV5UFHthrf9KfPQH9gIIVP1Z7SoX+zvbI
	 ErycYTzPi/aHQ==
Received: from localhost (unknown [IPv6:2601:280:5e00:625::1fe])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by ms.lwn.net (Postfix) with ESMTPSA id 6DEC148EB4;
	Mon, 10 Feb 2025 14:40:03 +0000 (UTC)
From: Jonathan Corbet <corbet@lwn.net>
To: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Cc: Linux Doc Mailing List <linux-doc@vger.kernel.org>, Greg Kroah-Hartman
 <gregkh@linuxfoundation.org>, linux-kernel@vger.kernel.org
Subject: Re: [RFC v2 18/38] docs: sphinx/kernel_abi: use AbiParser directly
In-Reply-To: <20250210082748.05ba85ae@foz.lan>
References: <cover.1738020236.git.mchehab+huawei@kernel.org>
 <fb800900352d90a0e501e5d6732e1bea277478f2.1738020236.git.mchehab+huawei@kernel.org>
 <87lduu7efu.fsf@trenco.lwn.net> <20250129014324.60a8dfce@foz.lan>
 <20250202155652.1652e420@foz.lan> <878qqlfxc9.fsf@trenco.lwn.net>
 <20250210082748.05ba85ae@foz.lan>
Date: Mon, 10 Feb 2025 07:40:02 -0700
Message-ID: <87cyfp3ltp.fsf@trenco.lwn.net>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

Mauro Carvalho Chehab <mchehab+huawei@kernel.org> writes:

> I took a look on Markus work: it was licensed under GPL 3.0 and it was
> written in 2016. There were several changes on kerneldoc since them,
> including the addition of a regex that it is not compatible with
> Python re[1]:
>
>         $members =~ s/\bSTRUCT_GROUP(\(((?:(?>[^)(]+)|(?1))*)\))[^;]*;/$2/gos;
>
> This one use:
>
> 	- recursive patterns: ?1
> 	- atomic grouping (?>...)
>
> Also, it is hard to map what he does with the existing script. I'm
> opting to write a new script from scratch.

That's fine, I just wanted to be sure you'd had a chance to look at
it... 

>     Another option would be to re-implement such regexes without using
>     such advanced patterns.

Seems like a preferred option if that can be done.  Banging one's head
against all those regexes is often the hardest part of dealing with that
script; anything that makes it simpler is welcome.

Thanks,

jon

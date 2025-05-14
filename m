Received: from ms.lwn.net (ms.lwn.net [45.79.88.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DCD7527A914;
	Wed, 14 May 2025 18:55:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.79.88.28
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747248925; cv=none; b=TMX3JUVxt9PiBC6vBIFhtz7cMdNMuOvRV4pB4UbnrgYVndQU1Dr0IpsqOch748rtBr3Y6VtpFNE0w8SZoRExzcuVINHDYHqLqhV8I/JcnB5QWumae9Tf22FDF9HVz89NukqdjKxI8GjQ+JUr+OTS1c5QgxZR2zQZS+qOnlaY6W8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747248925; c=relaxed/simple;
	bh=Dd1AbBJnN/eobVfbg16kvz/0BKo+XOYNcMxSAbROsnU=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=MeCR59k+5yzpV//yVobdomUKxVfiIhDRF9xt6xJ6rffMklKAicrnnWD1VH/ZyuEr0ggudi/XOPkWXsKm4il2Lx/+3hlv4yKH8JMQJZv+Uvvcp17jJiUJsC3zSuvTBtY6RhDe5mXh8y+xGUAx4R6RF43ehY05NXWz0mcj7JDU8pg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net; spf=pass smtp.mailfrom=lwn.net; dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b=CoxdR9vO; arc=none smtp.client-ip=45.79.88.28
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lwn.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b="CoxdR9vO"
DKIM-Filter: OpenDKIM Filter v2.11.0 ms.lwn.net 7688B4107B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lwn.net; s=20201203;
	t=1747248914; bh=qusa+C5EMMyC7j+Dkx9wlnXabaGtwDCwcq+bgHcJ2YE=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=CoxdR9vOfNppadw8zY6V1IiRBCzhQKTiEWiU5qwtYHqnJjIC+8olI8FSjQE/vpCmf
	 Qb6dtKVgd0XFTXU41YtWx6xfl4JLtCOX5j61t2VzJ2V39dcT90Sk2+oP8Cn0CSj/fb
	 PVQ/X9FXzARIh29dRawtxGKyR55d3UMVyaQh/Sa43JBG7tWklseGmmCajEs/aBBDbV
	 DK6WRTeknzumAI3qQe84XbeMIVZ084tM+FKgQdYqDsHn0jN/d4TA/PEzIlZw5oRvYG
	 kdWITstrgbo0vIEq0roAsMwF2+u6fk2gryuWPNETak8JSgVJGPlwqpE5OT+aHL8ndT
	 qkAtmekorzbSg==
Received: from localhost (mdns.lwn.net [45.79.72.68])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by ms.lwn.net (Postfix) with ESMTPSA id 7688B4107B;
	Wed, 14 May 2025 18:55:13 +0000 (UTC)
From: Jonathan Corbet <corbet@lwn.net>
To: Alexey Dobriyan <adobriyan@gmail.com>, Greg KH <gregkh@linuxfoundation.org>
Cc: workflows@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/9] CodingStyle: make Documentation/CodingStyle into
 symlink
In-Reply-To: <d5b360c6-1ef4-4344-9ad5-91ba5d962183@p183>
References: <20250509203430.3448-1-adobriyan@gmail.com>
 <87frhcsrva.fsf@trenco.lwn.net>
 <77f03295-df5d-4bc0-9a61-5be829969662@p183>
 <2025051203-secluded-emphases-1c76@gregkh>
 <d5b360c6-1ef4-4344-9ad5-91ba5d962183@p183>
Date: Wed, 14 May 2025 12:55:10 -0600
Message-ID: <87sel7nhtd.fsf@trenco.lwn.net>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

Alexey Dobriyan <adobriyan@gmail.com> writes:

> I never liked cover letters because they don't get captured in
> the commit messages so why bother.

FWIW, if a cover letter contains useful information, I capture it in a
merge commit that brings in the rest.  I think I'm far from the only one
who does that...

jon

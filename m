Received: from h5.fbrelay.privateemail.com (h5.fbrelay.privateemail.com [162.0.218.228])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 689D1B66E
	for <linux-kernel@vger.kernel.org>; Wed, 18 Jun 2025 19:21:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=162.0.218.228
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750274487; cv=none; b=StxRnd4Jhs0RH8uO/8AJVxEl2UXN/F/vBdzNG3bFiCLzFUw9yy6sHxlg0UoHxaY1S9m6uAQPAcOU+lM9gdKCev82yii7+Wh7jsskTHOGvdxFnTMYCADTf1UMnkbRYc9d5hhEO/f7NomfCSIpJLNp+k2oNVOJJMAtofwJF6b/Ezs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750274487; c=relaxed/simple;
	bh=DFlzBN6Hy8IQDtq7SwHhf/gSQS1u/Xwyz0tmdH1t/AQ=;
	h=Date:From:To:Cc:Message-ID:In-Reply-To:References:Subject:
	 MIME-Version:Content-Type; b=ZSWZ9LPLu8lCNEoIhAHPKFLx2zp10TdUXqIjz4b4Hts6MQVo5txhcSXD7Cz5V/hv/DGb3jOfSTz9XV+y0kUTr+FJzyW5o2DIqr6AX64yzzcGU5k0x2GaJ+WX3I5gqo6nZMtZhOzeNesk0qNVTPlwZhd1tB907MQO5Tl3usftuqA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=mebeim.net; spf=pass smtp.mailfrom=mebeim.net; dkim=pass (2048-bit key) header.d=mebeim.net header.i=@mebeim.net header.b=U9Rz56z+; arc=none smtp.client-ip=162.0.218.228
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=mebeim.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mebeim.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mebeim.net header.i=@mebeim.net header.b="U9Rz56z+"
Received: from MTA-15-3.privateemail.com (MTA-15.privateemail.com [198.54.118.207])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by h5.fbrelay.privateemail.com (Postfix) with ESMTPSA id 4bMtrd0mPYz2xl0
	for <linux-kernel@vger.kernel.org>; Wed, 18 Jun 2025 19:21:21 +0000 (UTC)
Received: from mta-15.privateemail.com (localhost [127.0.0.1])
	by mta-15.privateemail.com (Postfix) with ESMTP id 4bMtrT0hBWz3hhS5;
	Wed, 18 Jun 2025 15:21:13 -0400 (EDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=mebeim.net; s=default;
	t=1750274473; bh=DFlzBN6Hy8IQDtq7SwHhf/gSQS1u/Xwyz0tmdH1t/AQ=;
	h=Date:From:To:Cc:In-Reply-To:References:Subject:From;
	b=U9Rz56z+mvIXFc9m6cWqQNfz2KB5w0ZAjMkMU87FtA0g+O/z0pWEai24T3AhaAOiL
	 6Oew8A27ZD4cssGJanOZwgbb6u1/eSI6g9qhP0yTAnKhIe31QkV/7fHgfV+blhCOtw
	 pfaORQrOgeJhzqNZqskbbFJDpzGsequBPUAVhy1XRkEA3jIB+5NzOo0VFyqTAgdEf+
	 Sh+2Uy24TohQc1PVH9Zdf0DqSzNuw/18AsAJFpCxQ9wR2U7hrGZWrwXNF9EqeWHSmv
	 hiANQH7G59eupvqb6elzbYzDVuzhA6nBvutxNv9V49QqP7kH5+7fFrPanHKxtmYaX9
	 q/+Lm4zeVnoAg==
Received: from APP-14 (unknown [10.50.14.214])
	by mta-15.privateemail.com (Postfix) with ESMTPA;
	Wed, 18 Jun 2025 15:21:12 -0400 (EDT)
Date: Wed, 18 Jun 2025 21:21:11 +0200 (CEST)
From: Marco Bonelli <marco@mebeim.net>
To: Abhigyan ghosh <zscript.team.zs@gmail.com>
Cc: linux-kernel@vger.kernel.org
Message-ID: <619015812.381816.1750274471992@privateemail.com>
In-Reply-To: <5BB59D35-BFA0-43AC-939E-213925DD4869@gmail.com>
References: <1714337938.319508.1750244108368@privateemail.com>
 <5BB59D35-BFA0-43AC-939E-213925DD4869@gmail.com>
Subject: Re: RISC-V 32-bit debug builds reaching breaking point: too many
 symbols
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Priority: 3
Importance: Normal
X-Mailer: Open-Xchange Mailer v7.10.6-Rev78
X-Originating-Client: open-xchange-appsuite
X-Virus-Scanned: ClamAV using ClamSMTP

(sorry for the dupe mail, forgot to hit "reply all")

> Would using split debug info earlier in the build (e.g. extracting `.debu=
g_*` before `vmlinux.o` grows too large) help mitigate the symbol table ove=
rflow =E2=80=94 or is the linker still forced to carry them through regardl=
ess due to reloc dependencies?

Wish I knew honestly, not sure. That is essentially what I was asking in my=
 mail.
If I had to take a guess, I think it wouldn't matter and just move the prob=
lem
because you would still have a huge split .dwo file, but I am not 100% sure=
. More
smaller files could be generated (e.g. one per compilation unit) but those =
would
be painful to carry around.

> Also, does this behavior differ between GNU ld and LLD in your tests?

I have tested a LLVM build and while it does produce less of those annoying
symbols, the same problem persists.

--
Marco Bonelli

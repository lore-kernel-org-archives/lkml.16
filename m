Received: from lithops.sigma-star.at (mailout.nod.at [116.203.167.152])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0800A2185B8
	for <linux-kernel@vger.kernel.org>; Tue,  8 Apr 2025 08:32:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=116.203.167.152
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744101130; cv=none; b=t7dBjeywJRI0NzAQEJOoMZa33bfxkBoKKduVG0wCAI9kSJvvUPWucKwq15vS6SgZaPdNCUG+sfBK2PPw2xKFuqQarIjuODwXktJLP5zUdM1AFpQylEC22OMfvconz2Z/oO00ffg/XLLBvn6DTODeFyzZM/QFP7Ycg/dWi7UWxzw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744101130; c=relaxed/simple;
	bh=90SrCrs81hNJWtigTXEVNegwc743G6HzjvtKDCKtgPs=;
	h=Date:From:To:Cc:Message-ID:In-Reply-To:References:Subject:
	 MIME-Version:Content-Type; b=YYtY4kyqrqgHJiMa9QgEApt01zheCcpZNIgbS2MNdU48Jizxw6k9Hdb0hnxC89xjXvEldGxAK4G+HsQRBKztq1fVsFHMeH5soYOibjDSqsA/0sEwyrizeBDuITh/Z/voMk/CR5aw9TLYNNnA0lO2N1GcivsyysJ3g7cgE9tJxYM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=nod.at; spf=fail smtp.mailfrom=nod.at; arc=none smtp.client-ip=116.203.167.152
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=nod.at
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nod.at
Received: from localhost (localhost [127.0.0.1])
	by lithops.sigma-star.at (Postfix) with ESMTP id 4858429857F;
	Tue,  8 Apr 2025 10:32:00 +0200 (CEST)
Received: from lithops.sigma-star.at ([127.0.0.1])
	by localhost (lithops.sigma-star.at [127.0.0.1]) (amavisd-new, port 10032)
	with ESMTP id 1lnWBbfX9w58; Tue,  8 Apr 2025 10:31:59 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by lithops.sigma-star.at (Postfix) with ESMTP id 6CD5D29858C;
	Tue,  8 Apr 2025 10:31:59 +0200 (CEST)
Received: from lithops.sigma-star.at ([127.0.0.1])
	by localhost (lithops.sigma-star.at [127.0.0.1]) (amavisd-new, port 10026)
	with ESMTP id J3zOUV0J1bVT; Tue,  8 Apr 2025 10:31:59 +0200 (CEST)
Received: from lithops.sigma-star.at (lithops.sigma-star.at [195.201.40.130])
	by lithops.sigma-star.at (Postfix) with ESMTP id 4EF8B29857F;
	Tue,  8 Apr 2025 10:31:59 +0200 (CEST)
Date: Tue, 8 Apr 2025 10:31:59 +0200 (CEST)
From: Richard Weinberger <richard@nod.at>
To: Francesco Dolcini <francesco@dolcini.it>
Cc: linux-mtd <linux-mtd@lists.infradead.org>, 
	Matthew Wilcox <willy@infradead.org>, 
	chengzhihao1 <chengzhihao1@huawei.com>, 
	regressions <regressions@lists.linux.dev>, 
	linux-kernel <linux-kernel@vger.kernel.org>
Message-ID: <1082087744.255264119.1744101119060.JavaMail.zimbra@nod.at>
In-Reply-To: <20250408082018.GA23886@francesco-nb>
References: <20250408082018.GA23886@francesco-nb>
Subject: Re: Linux 6.15-rc1 regression, folio/ubifs Oops
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Mailer: Zimbra 8.8.12_GA_3807 (ZimbraWebClient - FF136 (Linux)/8.8.12_GA_3809)
Thread-Topic: Linux 6.15-rc1 regression, folio/ubifs Oops
Thread-Index: JAPy6KTdykUlw4jPDAxg3vJ2RwMacQ==

----- Urspr=C3=BCngliche Mail -----
> Von: "Francesco Dolcini" <francesco@dolcini.it>
> An: "richard" <richard@nod.at>, "linux-mtd" <linux-mtd@lists.infradead.or=
g>, "Matthew Wilcox" <willy@infradead.org>,
> "chengzhihao1" <chengzhihao1@huawei.com>
> CC: "regressions" <regressions@lists.linux.dev>, "linux-kernel" <linux-ke=
rnel@vger.kernel.org>
> Gesendet: Dienstag, 8. April 2025 10:20:18
> Betreff: Linux 6.15-rc1 regression, folio/ubifs Oops

> Hello all,
> I do have the following regression on single core system using UBIFS,
> dual core seems not affected, any idea?

I'm still massively behind my schedule, but I'd suspect it has something to=
 do with
https://patchwork.ozlabs.org/project/linux-mtd/list/?series=3D448466

Thanks,
//richard

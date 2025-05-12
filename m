Received: from lithops.sigma-star.at (mailout.nod.at [116.203.167.152])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 26ABF1E571A
	for <linux-kernel@vger.kernel.org>; Mon, 12 May 2025 15:57:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=116.203.167.152
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747065479; cv=none; b=cDI9sjXp6PCuCoHzYXNw2GgJ/GQLV+EFvNr9KRZc1DSI5QUWZMCb9ioL+p+WPd7qCV/NLXGdmzF31h1uFOMaAhJlMGPcpMbxuyXP5Sf4XByIbMYTL2gigVBBbApen7y5j8MHsm0XQBsSFj+k7PQ3DTa5zAZ8TBSypW8qxOOIo50=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747065479; c=relaxed/simple;
	bh=BM5JSJOKNhTfLPEfa9NZIcPTtKYu51Ogr3Y10YAFwbw=;
	h=Date:From:To:Cc:Message-ID:In-Reply-To:References:Subject:
	 MIME-Version:Content-Type; b=dFnLLGTsiWTdXrfnHrMueakT3AuQ9DT+2856pcneB+nxr3n+5/L5SqfPSKXBf9snu229sDTS1HDUfJIkUFnZbFORl6fXEYgFGvkFosCj2Wo61VxJ62REdONa6uxUAalPJTSGt45re0v5JeRED2Kyr/u9CRqUuJ2uPm0NsQFh9tg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=nod.at; spf=fail smtp.mailfrom=nod.at; arc=none smtp.client-ip=116.203.167.152
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=nod.at
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nod.at
Received: from localhost (localhost [127.0.0.1])
	by lithops.sigma-star.at (Postfix) with ESMTP id C633A294730;
	Mon, 12 May 2025 17:57:54 +0200 (CEST)
Received: from lithops.sigma-star.at ([127.0.0.1])
	by localhost (lithops.sigma-star.at [127.0.0.1]) (amavisd-new, port 10032)
	with ESMTP id WUghdvuq5KTy; Mon, 12 May 2025 17:57:54 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by lithops.sigma-star.at (Postfix) with ESMTP id 6FF76298562;
	Mon, 12 May 2025 17:57:54 +0200 (CEST)
Received: from lithops.sigma-star.at ([127.0.0.1])
	by localhost (lithops.sigma-star.at [127.0.0.1]) (amavisd-new, port 10026)
	with ESMTP id IzOUdMxh8QkF; Mon, 12 May 2025 17:57:54 +0200 (CEST)
Received: from lithops.sigma-star.at (lithops.sigma-star.at [195.201.40.130])
	by lithops.sigma-star.at (Postfix) with ESMTP id 4D1D2294730;
	Mon, 12 May 2025 17:57:54 +0200 (CEST)
Date: Mon, 12 May 2025 17:57:54 +0200 (CEST)
From: Richard Weinberger <richard@nod.at>
To: =?utf-8?B?Q3PDs2vDoXM=?= Bence <csokas.bence@prolan.hu>
Cc: Miquel Raynal <miquel.raynal@bootlin.com>, 
	linux-mtd <linux-mtd@lists.infradead.org>, 
	linux-kernel <linux-kernel@vger.kernel.org>, 
	Vignesh Raghavendra <vigneshr@ti.com>
Message-ID: <636744371.31012717.1747065474158.JavaMail.zimbra@nod.at>
In-Reply-To: <2c2ff01f-b6e2-4b9e-958a-c4c405518a54@prolan.hu>
References: <20250512084033.69718-1-csokas.bence@prolan.hu> <d70952c1-e4ca-4f09-ac23-2ad13e0facc0@prolan.hu> <1200504110.30346467.1747054025727.JavaMail.zimbra@nod.at> <4ebe2146-ee1c-4325-8259-be3803475f1f@prolan.hu> <87r00ugcat.fsf@bootlin.com> <1689545397.30901605.1747063396608.JavaMail.zimbra@nod.at> <87y0v1g7xz.fsf@bootlin.com> <2c2ff01f-b6e2-4b9e-958a-c4c405518a54@prolan.hu>
Subject: Re: [PATCH v3] mtd: Verify written data in paranoid mode
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Mailer: Zimbra 8.8.12_GA_3807 (ZimbraWebClient - FF138 (Linux)/8.8.12_GA_3809)
Thread-Topic: Verify written data in paranoid mode
Thread-Index: 75AKXALdUUz/uNm8Yjvipq4cEdAKSw==

----- Urspr=C3=BCngliche Mail -----
> Von: "Cs=C3=B3k=C3=A1s Bence" <csokas.bence@prolan.hu>
>>> UBI offers this already, there is a write self-check as part of the io
>>> checks that can be enabled
>>> via debugfs per UBI device.
>>> So for troubleshooting this should be good enough.
>>> There is room for improvement, though. Currently it uses vmalloc().
>>=20
>> UBI is full of uncovered resources :-)
>=20
> For sure. Plus, even though we use UBI + UBIFS, that may not necessarily
> be the case for others. Maybe someone uses mtdblock + some
> "conventional" FS (ext*, f2fs etc.). Or maybe they use JFFS. Or maybe no
> FS at all. We should still allow userspace or higher FS layers to be
> notified of the problem.

Nobody sane would every use a regular block based filesystem in rw mode
on-top of mtdblock. Especially if you care about your data.

JFFS2 has CONFIG_JFFS2_FS_WBUF_VERIFY.
AFAIK, this origins form the old and dark age of flashes where everything
was wonky and no good test tooling existed.

Long story short, I'm not convinced by this patch set.
No ack form my side.
At least it should be configurable per device and not being a global
config option. If Michael or Miquel like it, I'll not block this decision.

Thanks,
//richard

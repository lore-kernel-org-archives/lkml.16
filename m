Received: from lithops.sigma-star.at (mailout.nod.at [116.203.167.152])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 06A2C21517C
	for <linux-kernel@vger.kernel.org>; Mon, 12 May 2025 15:23:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=116.203.167.152
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747063404; cv=none; b=Tp+H+ujl5gsJcua9jKkQgbWdAUTWY9HuiyQTY1IyK1gXoUzzLPz/by0FWBoAtTk0Fr4BDlBcsGT4CiJaxugREf/NpeXuT0TeJcXo4car7VuQhrMCgNKK8qvQruQYnUYMSbh877aeGQATi5uSDZlT434NNZfh3r1Ovm/GRTdIpr4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747063404; c=relaxed/simple;
	bh=ZNatpBKMgJMasDTggw6oWww3VlbuD17EyjIJyveeAek=;
	h=Date:From:To:Cc:Message-ID:In-Reply-To:References:Subject:
	 MIME-Version:Content-Type; b=VfyNwk58DikTN6ZhzlPwUqk6IYaoLS7J0owlk270aZEV8ocnKTW3+zX9vTMo9gAyNg5Z2KyjYhZK5A+08bA5uJjTUy49wnnxJDApKS/C0Y/hR/zNvudQYo6JPi4RfRFTRGXLKTshSUWq/2EBN2cmjVGU1DDTWdgGZyhJqIl34TM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=nod.at; spf=fail smtp.mailfrom=nod.at; arc=none smtp.client-ip=116.203.167.152
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=nod.at
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nod.at
Received: from localhost (localhost [127.0.0.1])
	by lithops.sigma-star.at (Postfix) with ESMTP id 597E5294730;
	Mon, 12 May 2025 17:23:17 +0200 (CEST)
Received: from lithops.sigma-star.at ([127.0.0.1])
	by localhost (lithops.sigma-star.at [127.0.0.1]) (amavisd-new, port 10032)
	with ESMTP id Ahisx6RyHIWl; Mon, 12 May 2025 17:23:17 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by lithops.sigma-star.at (Postfix) with ESMTP id E64F3298562;
	Mon, 12 May 2025 17:23:16 +0200 (CEST)
Received: from lithops.sigma-star.at ([127.0.0.1])
	by localhost (lithops.sigma-star.at [127.0.0.1]) (amavisd-new, port 10026)
	with ESMTP id XhBcJvTwNc9D; Mon, 12 May 2025 17:23:16 +0200 (CEST)
Received: from lithops.sigma-star.at (lithops.sigma-star.at [195.201.40.130])
	by lithops.sigma-star.at (Postfix) with ESMTP id C669F294730;
	Mon, 12 May 2025 17:23:16 +0200 (CEST)
Date: Mon, 12 May 2025 17:23:16 +0200 (CEST)
From: Richard Weinberger <richard@nod.at>
To: Miquel Raynal <miquel.raynal@bootlin.com>
Cc: =?utf-8?B?Q3PDs2vDoXM=?= Bence <csokas.bence@prolan.hu>, 
	linux-mtd <linux-mtd@lists.infradead.org>, 
	linux-kernel <linux-kernel@vger.kernel.org>, 
	Vignesh Raghavendra <vigneshr@ti.com>
Message-ID: <1689545397.30901605.1747063396608.JavaMail.zimbra@nod.at>
In-Reply-To: <87r00ugcat.fsf@bootlin.com>
References: <20250512084033.69718-1-csokas.bence@prolan.hu> <87frhambri.fsf@bootlin.com> <d70952c1-e4ca-4f09-ac23-2ad13e0facc0@prolan.hu> <1200504110.30346467.1747054025727.JavaMail.zimbra@nod.at> <4ebe2146-ee1c-4325-8259-be3803475f1f@prolan.hu> <87r00ugcat.fsf@bootlin.com>
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
Thread-Index: 3qRrT5QGF7Kng0yuxs4zby6CU3+jIA==

----- Urspr=C3=BCngliche Mail -----
> Von: "Miquel Raynal" <miquel.raynal@bootlin.com>
>> The problem we _have_ though happens to be a bit different: here we are
>> blursed with a system that corrupts data at a noticeable
>> probability. But the model is the same: a stochastic process introducing
>> bit errors on write. But I sincerely hope no one else has this problem,
>> and this is *not* the primary aim of this patch; it just happens to
>> solve our issue as well. But I intend it to be useful for the larger
>> Linux community, thus the primary goal is to solve the first issue.
>=20
> I don't have a strong opinion there but I don't dislike this idea
> because it might also help troubleshooting errors sometimes. It is very
> hard to understand issues which happen to be discovered way after they
> have been generated (typically during a read, way later than a "faulty"
> write). Having this paranoid option would give a more synchronous
> approach which is easier to work with sometimes.

UBI offers this already, there is a write self-check as part of the io
checks that can be enabled
via debugfs per UBI device.
So for troubleshooting this should be good enough.
There is room for improvement, though. Currently it uses vmalloc().

Thanks,
//richard

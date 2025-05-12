Received: from lithops.sigma-star.at (mailout.nod.at [116.203.167.152])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3A20C25522B
	for <linux-kernel@vger.kernel.org>; Mon, 12 May 2025 12:47:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=116.203.167.152
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747054032; cv=none; b=UHPxNP1ZPu4JsI4yz4KWSLbNYyJKMwzM6X6fdo2ZSPbv/HxI0biOnda8jyTYkTGhr1K0Eq1RT5R4lCxZgPGbam+2wy2GPEeBE0QerFy0gqlQe7B7BE14amhCNIRNlKDxqvVGHkBJxt31CZB8u4/IdJrY6pdvtZjOor0DTPQ2E5g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747054032; c=relaxed/simple;
	bh=C7JmtKNbL4VlUTmVWKpTRF/arfLWMbhWSzhlo+JxnHg=;
	h=Date:From:To:Cc:Message-ID:In-Reply-To:References:Subject:
	 MIME-Version:Content-Type; b=QOTkS/xlF2BzIu9P49A2MZixpuM/sCEoAVEZoREuTxDfcqU+3ujNak8NvCH6PGJefv17q24oR9S/SVIJBEv7XETkxTh3iwUno2Qzny7Tn5rRXdEhue0EC5SDPkcwR2fJLXWvREn2rgz4Kt9408qFTMYEO63YTUMKCN02qeqZzOw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=nod.at; spf=fail smtp.mailfrom=nod.at; arc=none smtp.client-ip=116.203.167.152
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=nod.at
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nod.at
Received: from localhost (localhost [127.0.0.1])
	by lithops.sigma-star.at (Postfix) with ESMTP id A607C294730;
	Mon, 12 May 2025 14:47:06 +0200 (CEST)
Received: from lithops.sigma-star.at ([127.0.0.1])
	by localhost (lithops.sigma-star.at [127.0.0.1]) (amavisd-new, port 10032)
	with ESMTP id f6iLu6qRFOPt; Mon, 12 May 2025 14:47:06 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by lithops.sigma-star.at (Postfix) with ESMTP id 0542F298563;
	Mon, 12 May 2025 14:47:06 +0200 (CEST)
Received: from lithops.sigma-star.at ([127.0.0.1])
	by localhost (lithops.sigma-star.at [127.0.0.1]) (amavisd-new, port 10026)
	with ESMTP id RLjzZz2HeF-r; Mon, 12 May 2025 14:47:05 +0200 (CEST)
Received: from lithops.sigma-star.at (lithops.sigma-star.at [195.201.40.130])
	by lithops.sigma-star.at (Postfix) with ESMTP id DA437294730;
	Mon, 12 May 2025 14:47:05 +0200 (CEST)
Date: Mon, 12 May 2025 14:47:05 +0200 (CEST)
From: Richard Weinberger <richard@nod.at>
To: =?utf-8?B?Q3PDs2vDoXM=?= Bence <csokas.bence@prolan.hu>
Cc: Miquel Raynal <miquel.raynal@bootlin.com>, 
	linux-mtd <linux-mtd@lists.infradead.org>, 
	linux-kernel <linux-kernel@vger.kernel.org>, 
	Vignesh Raghavendra <vigneshr@ti.com>
Message-ID: <1200504110.30346467.1747054025727.JavaMail.zimbra@nod.at>
In-Reply-To: <d70952c1-e4ca-4f09-ac23-2ad13e0facc0@prolan.hu>
References: <20250512084033.69718-1-csokas.bence@prolan.hu> <87frhambri.fsf@bootlin.com> <d70952c1-e4ca-4f09-ac23-2ad13e0facc0@prolan.hu>
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
Thread-Index: vdlBgtKgU0/G1AOofAbE/k3HO+5Ouw==

----- Urspr=C3=BCngliche Mail -----
> Von: "Cs=C3=B3k=C3=A1s Bence" <csokas.bence@prolan.hu>
> Well, yes, in our case. But the point is, we have a strict requirement
> for data integrity, which is not unique to us I believe. I would think
> there are other industrial control applications like ours, which dictate
> a high data integrity.

In your last patch set you said your hardware has an issue that every
now and that data is not properly written.
Now you talk about data integrity requirements. I'm confused.

My point is that at some level we need to trust hardware,
if your flash memory is so broken that you can't rely on the write
path you're in deep trouble.
What is the next step, reading it back every five seconds to make
sure it is still there? (just kidding).

We do have plenty of tests to verify this for *testing*
to find broken drivers or hardware.
e.g. mtd/ubi tests, UBI verify at runtime.

Thanks,
//richard

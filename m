Received: from fw2.prolan.hu (fw2.prolan.hu [193.68.50.107])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA65029344A
	for <linux-kernel@vger.kernel.org>; Mon, 12 May 2025 12:29:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.68.50.107
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747052999; cv=none; b=BvFjCQcQQhSP73dldEHi1Sy4Y93dxLF78uy4SKRZF40T0tq1So8Xm6zwTh4nDPskf6fmEKTA/rVN5SJW7gm8XJmmt6cE1N9NYPxhxjXjFJW2gBKvoXX0MEoFcdv6/HCnSGSmgTouWgW2IdvAYZIPel9B55GEHX4Jo8QKTHPBJ+4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747052999; c=relaxed/simple;
	bh=O2VLRuWVqZtJkjxbvgtWypcdbLosxgWje92fHniHs3o=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:CC:References:
	 In-Reply-To:Content-Type; b=QcQRSfyb3Lgfre0g7bKzE1SnQ7OOrQkgOPHXJXMEC3Qf4R/SSDOq4N2m9XBgJ1gP5IwSYYpGL1rI6WEyUiBckdFTqegDDe+0UkPop66drkgxZkQN6c0INhEJ5ek1ddYOZYXeIZy4H8C10S7NDXTV6WRS/gDst3BCyGC8eFm6F7E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=prolan.hu; spf=pass smtp.mailfrom=prolan.hu; dkim=pass (4096-bit key) header.d=prolan.hu header.i=@prolan.hu header.b=MITNCbtw; arc=none smtp.client-ip=193.68.50.107
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=prolan.hu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=prolan.hu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (4096-bit key) header.d=prolan.hu header.i=@prolan.hu header.b="MITNCbtw"
Received: from proxmox-mailgw.intranet.prolan.hu (localhost.localdomain [127.0.0.1])
	by proxmox-mailgw.intranet.prolan.hu (Proxmox) with ESMTP id AF5EDA0461;
	Mon, 12 May 2025 14:29:51 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=prolan.hu; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:from:from:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to; s=mail; bh=uNCUOIkt3SghEdC3j3s1
	tpULsWO85oweq3HFmF1D1Zg=; b=MITNCbtw3uyyVu6Z94YhPZ2rb62XUCa8Ig4j
	/qD7qFJI+a5QE52CbauaFrndhBAtJPECAO4N9P0ICimezdxgrKxoXJEd2wxOFmfp
	8HWHpzRAyqa0ncWebMkHuq73oa9YLejSNmlqArsonqz5uRh56SUBFqTNZPyjwx3r
	qTpY2Y7ncHteD/reYkRo65X+VYAaXLeHo7cTtp15ur5GUALflfMGA6mRHTnFe/Ck
	jTyWE+K52Uq6fO9vzrC7ZGmWJLK+yxqbrjb1mjB/My7ZdrCMoVMFMC8sWLy08aWz
	rKUAUSXZQnyFajBTAm5yzRh2ueuxKS5PJB4fKDp0NoWIeAH8ZbTATjMA90IbPa0A
	9N90HIu+qhM+ZdqSGsVbnOsWkj27I3xJ5PoO2kmsNdxWUyWo9wiMX9p4aByAg8z1
	IaFfDKrjvt953Lh2B8JBiazq7Ef8+urk8Z3e/+XCaX707TYMl3UMGw3imOXBB5U8
	hWVP6oPKDd2YmGaCJdQwuJeCjSxC39+Q2szn/jGzYNemKb6HaSb/ZgZwgED7i6+D
	lwl46cjaRPiJC7oF00Esz39vHHEcSOFFCXjKf9jO/bCmPgZgn4BsFKi3Pg8WyJlE
	3GN2YsqD1GFYwz0sKAHJ5PLTi9w57RVpyBv6hJoY1bcRChe2FkUhOhXdexe72Xna
	KBqwlus=
Message-ID: <d70952c1-e4ca-4f09-ac23-2ad13e0facc0@prolan.hu>
Date: Mon, 12 May 2025 14:29:40 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: =?UTF-8?B?Q3PDs2vDoXMgQmVuY2U=?= <csokas.bence@prolan.hu>
Subject: Re: [PATCH v3] mtd: Verify written data in paranoid mode
To: Miquel Raynal <miquel.raynal@bootlin.com>, Richard Weinberger
	<richard@nod.at>
CC: <linux-mtd@lists.infradead.org>, <linux-kernel@vger.kernel.org>, "Vignesh
 Raghavendra" <vigneshr@ti.com>
References: <20250512084033.69718-1-csokas.bence@prolan.hu>
 <87frhambri.fsf@bootlin.com>
Content-Language: en-US
In-Reply-To: <87frhambri.fsf@bootlin.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: sinope.intranet.prolan.hu (10.254.0.237) To
 ATLAS.intranet.prolan.hu (10.254.0.229)
X-EsetResult: clean, is OK
X-EsetId: 37303A2980D94853617464

Hi,

On 2025. 05. 12. 11:14, Miquel Raynal wrote:
> Why _mtd_verify and not mtd_verify?

Hm, no particular reason, I was thinking that since it's an "internal" 
function, like `_mtd_write_oob()`, it would get the underscore. But now 
that I think about it, there are many static functions already without 
this underscore. Should I change it?

On 2025. 05. 12. 11:45, Richard Weinberger wrote:
> I still have a hard time seeing the benefit of this.
> To me it looks like you're working around broken hardware.
>
> Thanks,
> //richard

Well, yes, in our case. But the point is, we have a strict requirement 
for data integrity, which is not unique to us I believe. I would think 
there are other industrial control applications like ours, which dictate 
a high data integrity.

Bence


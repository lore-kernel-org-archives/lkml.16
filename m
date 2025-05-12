Received: from fw2.prolan.hu (fw2.prolan.hu [193.68.50.107])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 950CBB66E
	for <linux-kernel@vger.kernel.org>; Mon, 12 May 2025 15:51:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.68.50.107
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747065078; cv=none; b=DWFXqawR4tx0QYGN9JDu5iEBeOtXMo44BdCxuE0G0RWxsyoIhJsuxv9RhMAgkgRvVG+VQSSIVNVGBpaPMi5IbsZmOWctU4EgNgPg5wsaoGLyh/ykcoAID4hwAm896i9dVSxgffdlWOOuxchyRTgmZcfbgTcQhACjUZyJBDX6P3k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747065078; c=relaxed/simple;
	bh=OSUg+N6ZGVNCSy/fTQXiy5e7D4HhGMikT3AsJ5G52x4=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=M/nrlq/GHlgqvzlAfS9/BqM/53HaCAULSlFvT/KrHIJJMXql3pXn9TfNeOlSzmYd2yH92zPA5oDAM8e0voowADJTtdp748KX8RQMT9VDY6GLo/q5ScF21z0l9YVWRteLALOsGtRi5xohUkfUeWuMexBCfdqQE8bgpgYHT0/a6pc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=prolan.hu; spf=pass smtp.mailfrom=prolan.hu; dkim=pass (4096-bit key) header.d=prolan.hu header.i=@prolan.hu header.b=IfBjpsxo; arc=none smtp.client-ip=193.68.50.107
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=prolan.hu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=prolan.hu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (4096-bit key) header.d=prolan.hu header.i=@prolan.hu header.b="IfBjpsxo"
Received: from proxmox-mailgw.intranet.prolan.hu (localhost.localdomain [127.0.0.1])
	by proxmox-mailgw.intranet.prolan.hu (Proxmox) with ESMTP id EB095A0AC9;
	Mon, 12 May 2025 17:51:10 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=prolan.hu; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:from:from:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to; s=mail; bh=fCPzAe2GOYDHU/PDRCZB
	IwbMD0TgaIUDGr1FA9yLtAQ=; b=IfBjpsxoKu5DFgXZnszE5ZsHyO4ryROVNdiB
	cvaonLyeidIXYQeIoNjIbLyB4tFNz+7DJ9rYMUYi0J4eDJUz3zhodY0pfAcRvOPY
	VtgFyviRXW4ZjIoS0uNlVzDPuREDWkS5t9UNXOZOsxrFTY1H6yfksOFAgaU4CSf9
	sTmY9CYd34jq461Lb10QQ/nD1PyBQN/cFJppw7mENJ4gmkndcMWEwuYWRwVjziZB
	NLy3D4cTtEflC1VgxH64Opf7J+b/AfGckDEcNy3QLdQ6WOAzqIaqDZlAUDu2F6Sd
	BIg5EZ4oc/rbuvlTUMvUkFIWynLAh7VeJZq/3hFW8IWRPKjL1l3eXnejMN1J01c7
	8XZW0im6cNdBLkNsS/wK4yF4+C8X8BXZYuSWX1XlG/Pgg+JceFUiA4Py2s1PJ6Fk
	JcyDfznXxjG7yLexqvYF4hBG0iD91j2l6P8Zf2/vAONoEEE/A/jMTq7zDXmGIal9
	v2tVOJYXPh9FhqSOd108HEtenAQAvp2OZyIdKhY5/Yj/OsFOADrt8zBascFisVVh
	oRn0RpmPiiM8TnRkDVF0juM7AGuaF6AY3H/2lDrF83XjXxNgVw4XLrDtrg30W1xx
	FaoO25iX2R6wMIw6bwSEwj6MfHGdnBLQy8v5eSmEL7a+4QRoQBBs9e3/FUS0fztj
	vzLrRHI=
Message-ID: <2c2ff01f-b6e2-4b9e-958a-c4c405518a54@prolan.hu>
Date: Mon, 12 May 2025 17:51:10 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3] mtd: Verify written data in paranoid mode
To: Miquel Raynal <miquel.raynal@bootlin.com>, Richard Weinberger
	<richard@nod.at>
CC: linux-mtd <linux-mtd@lists.infradead.org>, linux-kernel
	<linux-kernel@vger.kernel.org>, Vignesh Raghavendra <vigneshr@ti.com>
References: <20250512084033.69718-1-csokas.bence@prolan.hu>
 <87frhambri.fsf@bootlin.com> <d70952c1-e4ca-4f09-ac23-2ad13e0facc0@prolan.hu>
 <1200504110.30346467.1747054025727.JavaMail.zimbra@nod.at>
 <4ebe2146-ee1c-4325-8259-be3803475f1f@prolan.hu> <87r00ugcat.fsf@bootlin.com>
 <1689545397.30901605.1747063396608.JavaMail.zimbra@nod.at>
 <87y0v1g7xz.fsf@bootlin.com>
Content-Language: en-US
From: =?UTF-8?B?Q3PDs2vDoXMgQmVuY2U=?= <csokas.bence@prolan.hu>
In-Reply-To: <87y0v1g7xz.fsf@bootlin.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: sinope.intranet.prolan.hu (10.254.0.237) To
 ATLAS.intranet.prolan.hu (10.254.0.229)
X-EsetResult: clean, is OK
X-EsetId: 37303A2980D94853617464

Hi,

On 2025. 05. 12. 17:33, Miquel Raynal wrote:
> On 12/05/2025 at 17:23:16 +02, Richard Weinberger <richard@nod.at> wrote:
> 
>> ----- Ursprüngliche Mail -----
>>> Von: "Miquel Raynal" <miquel.raynal@bootlin.com>
>>>> The problem we _have_ though happens to be a bit different: here we are
>>>> blursed with a system that corrupts data at a noticeable
>>>> probability. But the model is the same: a stochastic process introducing
>>>> bit errors on write. But I sincerely hope no one else has this problem,
>>>> and this is *not* the primary aim of this patch; it just happens to
>>>> solve our issue as well. But I intend it to be useful for the larger
>>>> Linux community, thus the primary goal is to solve the first issue.
>>>
>>> I don't have a strong opinion there but I don't dislike this idea
>>> because it might also help troubleshooting errors sometimes. It is very
>>> hard to understand issues which happen to be discovered way after they
>>> have been generated (typically during a read, way later than a "faulty"
>>> write). Having this paranoid option would give a more synchronous
>>> approach which is easier to work with sometimes.
>>
>> UBI offers this already, there is a write self-check as part of the io
>> checks that can be enabled
>> via debugfs per UBI device.
>> So for troubleshooting this should be good enough.
>> There is room for improvement, though. Currently it uses vmalloc().
> 
> UBI is full of uncovered resources :-)

For sure. Plus, even though we use UBI + UBIFS, that may not necessarily 
be the case for others. Maybe someone uses mtdblock + some 
"conventional" FS (ext*, f2fs etc.). Or maybe they use JFFS. Or maybe no 
FS at all. We should still allow userspace or higher FS layers to be 
notified of the problem.

Bence


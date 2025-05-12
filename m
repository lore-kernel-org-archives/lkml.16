Received: from fw2.prolan.hu (fw2.prolan.hu [193.68.50.107])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ED0882920A2
	for <linux-kernel@vger.kernel.org>; Mon, 12 May 2025 13:13:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.68.50.107
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747055614; cv=none; b=GUNC69mKSFBirY9ElDZvvZTEiJx1bINcrIduTPLnmwHEC4m2Z8riQvudY5hUmAYOr+aIgKXrvrv89MnrUSqfXU69bvzdchoab326fFOdwjrHLQOu7zsd6oiEPuC48shLWOqMTFGOtCgLbXUA7u8gtTvT7GS8/bRF2xp4xky8ieY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747055614; c=relaxed/simple;
	bh=PCH8jYLq1mvp2cmIhNoQShfb8IuT/oL/EP5J1d5SW3o=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:CC:References:
	 In-Reply-To:Content-Type; b=XI0HgJVS3Yqgr4na6sx8sZIILt6SuyCPDMLfLIRKh2UOtfZ60sEFC77K/TkcE0uYg+8AzHo+sLEZBPtaVoISIL7IrHgmoN5dfiq+SFAREGNxr6YuYE5WQOdgoO9q+/LBVE3gg7Wcg85AP6frhB+eX9+Hgv8L5jebTUFI9F5i6I0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=prolan.hu; spf=pass smtp.mailfrom=prolan.hu; dkim=pass (4096-bit key) header.d=prolan.hu header.i=@prolan.hu header.b=r3K5O2WR; arc=none smtp.client-ip=193.68.50.107
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=prolan.hu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=prolan.hu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (4096-bit key) header.d=prolan.hu header.i=@prolan.hu header.b="r3K5O2WR"
Received: from proxmox-mailgw.intranet.prolan.hu (localhost.localdomain [127.0.0.1])
	by proxmox-mailgw.intranet.prolan.hu (Proxmox) with ESMTP id A8BCAA0AC9;
	Mon, 12 May 2025 15:13:29 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=prolan.hu; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:from:from:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to; s=mail; bh=eV7fWU1o3gw8HSp86Nai
	7nFrbU7RbFJQ69HIGvP0aTo=; b=r3K5O2WRmoWPGuGTjLcwpelrrT2RzMKXyvkr
	pOshiTH/IcBtb3mKgfqLQ4IMHJgO1KUHu18jc6CXwGtTFRHplJUs1kWHgeCf/8y5
	KWzoLeqMFq6NG9pYZ/+4BkRVvcFWMjF4+oLrK+vQPOb+eutNnc32tB+SLZhZJKaK
	ohTJqfELrQWdvGHzgRgJZWfV0EVxxks439yk6SNCPbjNXMC5gXCctJ/XnQkxV5Rb
	imWAvZjbu8q56zKzJhES13O64qzeplKik7IPKqXkotd6SEDd6cctds+XItRsxHPa
	DOR9x4XylIq5PbR7qGyjD2+h8P/0MSiWMDuEGJGWMSJ4wQwYcIpefpqFNSryXyeP
	7afDC0QJeG5N01/jWhUHhbb5pCUMXuSGiJNFHWc/21q8VB9BU8hPVIOb3mVreTD4
	6GOC1IBN6i4et2NbhCSFF3c8GKX+JSvKtlhQhqJQQQ6Xaq2Bjwl3LEgy9/Wki/kp
	9MjLxI2CbrVqn9ePr6JyPMQO+LsO+vgXUkNznE2XD6Ix3cNuR+nn+9OnuUw26XOY
	bg1NZW+vpAbBMsG6jifU84dGzhp4R+Ab57i57YEml7w/yYUGi/E/V+E+gnGI8w2a
	Y0sHcduYOUZg+xx51KF4WGamGcCiiXe0odhO7SSjLWAxkKxg4UD1xUKNms1JhbB3
	Y/Mmz1g=
Message-ID: <4ebe2146-ee1c-4325-8259-be3803475f1f@prolan.hu>
Date: Mon, 12 May 2025 15:13:20 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: =?UTF-8?B?Q3PDs2vDoXMgQmVuY2U=?= <csokas.bence@prolan.hu>
Subject: Re: [PATCH v3] mtd: Verify written data in paranoid mode
To: Richard Weinberger <richard@nod.at>
CC: Miquel Raynal <miquel.raynal@bootlin.com>, linux-mtd
	<linux-mtd@lists.infradead.org>, linux-kernel <linux-kernel@vger.kernel.org>,
	Vignesh Raghavendra <vigneshr@ti.com>
References: <20250512084033.69718-1-csokas.bence@prolan.hu>
 <87frhambri.fsf@bootlin.com> <d70952c1-e4ca-4f09-ac23-2ad13e0facc0@prolan.hu>
 <1200504110.30346467.1747054025727.JavaMail.zimbra@nod.at>
Content-Language: en-US
In-Reply-To: <1200504110.30346467.1747054025727.JavaMail.zimbra@nod.at>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: sinope.intranet.prolan.hu (10.254.0.237) To
 ATLAS.intranet.prolan.hu (10.254.0.229)
X-EsetResult: clean, is OK
X-EsetId: 37303A2980D94853617464

Hi,

On 2025. 05. 12. 14:47, Richard Weinberger wrote:
> ----- Ursprüngliche Mail -----
>> Von: "Csókás Bence" <csokas.bence@prolan.hu>
>> Well, yes, in our case. But the point is, we have a strict requirement
>> for data integrity, which is not unique to us I believe. I would think
>> there are other industrial control applications like ours, which dictate
>> a high data integrity.
> 
> In your last patch set you said your hardware has an issue that every
> now and that data is not properly written.
> Now you talk about data integrity requirements. I'm confused.

The two problems are not too dissimilar: in one case you have a random, 
and _very_ low chance of data corruption, e.g. because of noise, aging 
hardware, power supply ripple etc. But you still need to make sure that 
the written data is absolutely correct; or if it is not, the system will 
immediately enter some fail-safe mode. This is the problem we want to 
solve, for everybody using Linux in high reliability environments.

The problem we _have_ though happens to be a bit different: here we are 
blursed with a system that corrupts data at a noticeable probability. 
But the model is the same: a stochastic process introducing bit errors 
on write. But I sincerely hope no one else has this problem, and this is 
*not* the primary aim of this patch; it just happens to solve our issue 
as well. But I intend it to be useful for the larger Linux community, 
thus the primary goal is to solve the first issue.

> My point is that at some level we need to trust hardware,
> if your flash memory is so broken that you can't rely on the write
> path you're in deep trouble.

Sure, but at the moment, we're not giving any return path for hardware. 
We just shovel megabytes at it, and don't even ask back. In critical 
systems, this will not fly.

> What is the next step, reading it back every five seconds to make
> sure it is still there? (just kidding).

(( Well, you're kidding now, but this is what we will have to do in 
another project, a rail interlocking system. Though obviously not in the 
kernel. But I digress... ))

Bence


Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A1F0D279332;
	Wed,  9 Apr 2025 18:52:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744224764; cv=none; b=hZICPHzIdAOAoeMrD3ek2+LWLUkOB5oPv7oNjKHbOoailF/BiZuc5UPHXyA6lx+Mc/iloY6JayMqArfHqk/1XeP1dKEv/RT0+3MW2U8nI6X1Kr5egg9NnOxk+kjQGaSHnwwSFVrYFTVzMMbMf9SfGO2LpiQSMlGClS8wbyHLnZs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744224764; c=relaxed/simple;
	bh=BSUmpdOQLiDXhEbmUHBtxJH6Dq1anrYbjkezVFE3k+c=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=NH3axQDowqgkGHUQCH/QrUP8z4B289ZCuZDBVJ1Om5rtsP+YzVQ6A53nazJ2qY907oPQ0ACrO0E67VHoKwlzER6FUCJlAFu+jnCx14ucTc6VBa/+OT2XxQcaxbwjdUvyDjMzsQCptebLb95Stc2f35589butf3MZzKlGX9YVATQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=lrKiPbJW; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=Xcsa7lo8; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="lrKiPbJW";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="Xcsa7lo8"
From: Thomas Gleixner <tglx@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1744224761;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=Xz45tyDLtvOyOUuJdgYcFYGxgqi+8xDlZvb7hCeMYoA=;
	b=lrKiPbJWfb49gcZW6Um62l+nwOQe2w8Anmmd8kxSjATSOXFYi1cQdppVooSOPgvQ3NpryO
	G284H/HY6cvd+rZZsFNjBpoTBD2tkCbve/9EurQ3+Xd6XM6nH91jbi1cgnVtmqlfKUJ89B
	QzTSkFrQOrKa5Of/z+Ae4XZk7pc+PWzAoGVD/vL4kGrxgN49xJgeNYhI3P4asfwjzVq17G
	BEKU5p/sAR6/8acLbZXCI+6JcEFaD0+c4hif/ExXNSq0NVQHyh+kAwBeM9xecb//Rv96Ez
	rZLHuRqumUsy+qOYCUumUmINXALoPPbQHHIqbztIkIEUIk6e1YLNKERSYYkKrg==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1744224761;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=Xz45tyDLtvOyOUuJdgYcFYGxgqi+8xDlZvb7hCeMYoA=;
	b=Xcsa7lo8AWIUXlp14grUnxpJvCfO5SlhON1U3dVIwQ+2t7/FtYhJj/bNURJgXZ399+iFHb
	qJMstcea9mXV5QDQ==
To: Chen Wang <unicorn_wang@outlook.com>, Inochi Amaoto
 <inochiama@gmail.com>, Rob Herring <robh@kernel.org>, Krzysztof Kozlowski
 <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>
Cc: linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
 sophgo@lists.linux.dev, Yixun Lan <dlan@gentoo.org>, Longbin Li
 <looong.bin@gmail.com>
Subject: Re: [PATCH v3 4/4] irqchip/sg2042-msi: Add the Sophgo SG2044 MSI
 interrupt controller
In-Reply-To: <MA0P287MB2262DBC84878347B78CA50ECFEB42@MA0P287MB2262.INDP287.PROD.OUTLOOK.COM>
References: <20250408050147.774987-1-inochiama@gmail.com>
 <20250408050147.774987-5-inochiama@gmail.com>
 <MA0P287MB2262DBC84878347B78CA50ECFEB42@MA0P287MB2262.INDP287.PROD.OUTLOOK.COM>
Date: Wed, 09 Apr 2025 20:52:40 +0200
Message-ID: <87o6x5tbev.ffs@tglx>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

On Wed, Apr 09 2025 at 15:53, Chen Wang wrote:

> On 2025/4/8 13:01, Inochi Amaoto wrote:
>> Add support for Sophgo SG2044 MSI interrupt controller.
>>
>> Signed-off-by: Inochi Amaoto <inochiama@gmail.com>
>> Reviewed-by: Chen Wang <unicorn_wang@outlook.com>
>> ---
>>   drivers/irqchip/irq-sg2042-msi.c | 61 ++++++++++++++++++++++++++++++--
>>   1 file changed, 58 insertions(+), 3 deletions(-)
>>
>> diff --git a/drivers/irqchip/irq-sg2042-msi.c b/drivers/irqchip/irq-sg2042-msi.c
>> index 30a1d2bfd474..2935ca213306 100644
>> --- a/drivers/irqchip/irq-sg2042-msi.c
>> +++ b/drivers/irqchip/irq-sg2042-msi.c
>> @@ -19,8 +19,6 @@
>>   
>>   #include "irq-msi-lib.h"
>>   
>> -#define SG2042_MAX_MSI_VECTOR	32
>> -
>>   struct sg204x_msi_chip_info {
>>   	const struct irq_chip		*irqchip;
>>   	const struct msi_parent_ops	*parent_ops;
>> @@ -44,7 +42,7 @@ struct sg204x_msi_chipdata {
>>   	u32					irq_first;
>>   	u32					num_irqs;
>>   
>> -	DECLARE_BITMAP(msi_map, SG2042_MAX_MSI_VECTOR);
>> +	unsigned long				*msi_map;
>
> Regarding the common parts of SG2042 and SG2044, I noticed that you 
> changed DECLARE_BITMAP back to dynamic application. If there is a next 
> version, I suggest you mention it in the commit information.

Actually that should be part of the previous patch which prepares for
configurable initialization. Then this one just adds the new variant.

Thanks,

        tglx



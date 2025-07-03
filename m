Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 40E372580E2
	for <linux-kernel@vger.kernel.org>; Thu,  3 Jul 2025 16:39:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751560793; cv=none; b=BmRuZL/62sIKiciidv1+W0DnRlL13Lm8m+avznalBK3rlsaujroMzhPesuxCIhMmw2iyf3ka4jo6VWZL1cPMlI8WdpDIYuP7I6y2+3c3Dge7fXDfz9flFod4uklNlZ0A12wKbBQKyMgC/3jnFvKlQ4dbe2jWvsYbjHD2eyXIm2c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751560793; c=relaxed/simple;
	bh=01jH8r428sLMr1d83sAv7rayhaGU9MJiVCYZ+lKY90Y=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=C7S/IdcEfcVhmLXoD8z/z88OStAKvvyYDpCDd/sHgSsmRVhQQTZ8uSNzk0/feKNPeysdnw/UMVD+x9FVEpyJycFjn2DBcksixt6xkZmHIJSZu3EDQkc1ZFiHrmNdW3OUKXiREhNB2AszoZu1P8PD8foL5fJpi+m1ALFscKrVsXM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=DJuR/T0G; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=VDi6FmiS; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="DJuR/T0G";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="VDi6FmiS"
From: Thomas Gleixner <tglx@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1751560789;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=jjOLwEZEZwj6P2cZondP2eaYEZTd2Boa5qjSBHDModI=;
	b=DJuR/T0GsNfopXDnSPcTyaZ77QMbyWDWudCydZqj1R20l4csZI3pzmc6P8WYaOjMUxKQs/
	2ZSqUQJ/lc/+z7OGomXF/F8zgIkgL55T6x3pOq5PXga8aIfajQC9Xb2q/LtGBALayPZ7gy
	+ZV6B7NjyWGdkQvcaO2nSF//VKsZ5sbnVJEWQJrSEMkcU0M2GqNLAj6bz/8hUVDkNPQMq6
	JR4tHEirmSORHx08aAjw/ia8ykAhe6VGAjvH00Br3HTIx5CoLrsnDr0ithECDHVkCqee1G
	jqlVo8ZdLWw0hWRTd4BbXcXx3jr1h9XUL9JgsAvV5ghOlx1Mc4zciIAO2frPqw==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1751560789;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=jjOLwEZEZwj6P2cZondP2eaYEZTd2Boa5qjSBHDModI=;
	b=VDi6FmiSJTl7dRJH5WanB3BzmI9QfNeyqElOW0KK/ZxJkACgTIdSDNc79HsNI+KjvOpSVZ
	ejAsrSbh+puqqvCg==
To: Nam Cao <namcao@linutronix.de>, Johannes Berg <johannes@sipsolutions.net>
Cc: Marc Zyngier <maz@kernel.org>, Richard Weinberger <richard@nod.at>,
 Anton Ivanov <anton.ivanov@cambridgegreys.com>,
 linux-um@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 1/1] um: virt-pci: Switch to
 msi_create_parent_irq_domain()
In-Reply-To: <20250630070249.oVVkmFZg@linutronix.de>
References: <cover.1751266049.git.namcao@linutronix.de>
 <5f0bd8e877e7bfdfb1a7e99d6b126caf6a7eea48.1751266049.git.namcao@linutronix.de>
 <e64a4c40b0234fc265a74cb60633117dc6911518.camel@sipsolutions.net>
 <20250630070249.oVVkmFZg@linutronix.de>
Date: Thu, 03 Jul 2025 18:39:48 +0200
Message-ID: <87plehtei3.ffs@tglx>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

Johannes,

On Mon, Jun 30 2025 at 09:02, Nam Cao wrote:
> On Mon, Jun 30, 2025 at 08:55:54AM +0200, Johannes Berg wrote:
>> On Mon, 2025-06-30 at 08:51 +0200, Nam Cao wrote:
>> > Move away from the legacy MSI domain setup, switch to use
>> > msi_create_parent_irq_domain().
>> > 
>> 
>> Do you want this to go through the UML tree, or is it a dependency
>> somewhere else? In the latter case, I suppose you can add
>
> Please take it into the UML tree.
>
>> Acked-by: Johannes Berg <johannes@sipsolutions.net>
>> Tested-by: Johannes Berg <johannes@sipsolutions.net>

are you picking this up or want me to queue it?

Thanks,

        tglx

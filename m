Received: from fanzine2.igalia.com (fanzine.igalia.com [178.60.130.6])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D65891CBEB9
	for <linux-kernel@vger.kernel.org>; Tue,  1 Apr 2025 06:58:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=178.60.130.6
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743490727; cv=none; b=hXwSGq2TPzZ/MtbsVcLqMHZpDVmX8tGJ0OEWiRxc2nDgi8S1mr2fq9PLORbr9AptHOrRYbg4EZC/lFH0lBQ/Yz1PfWie6VVVjnADGEuxW4kHPVNMbNEjyCYjp0//NQ3RzFVEEwF09CU8xT5dkikkGyvUIFQp8eeR3eVNbqk8TYE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743490727; c=relaxed/simple;
	bh=linBA49Xq+6OE5t6rLpAMQ2es3izbbcVz4iwGmmuDrY=;
	h=Mime-Version:Content-Type:Date:Message-Id:Cc:Subject:From:To:
	 References:In-Reply-To; b=D96GuF6E3ZHhydGdNA7ccah2DoMXofa2+zznLaz+cAnYWa00arJd+5EYD+u+AC2/xZH0HbPPVLsCeaj1uFV09iaAQnLta+R7TKyg1t9TP00oK7o6Elq506rAcq4XX0sGgjXKjlHliJDEyduME7sfvAV0ddePPtxXR3Hk1CUJafE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=igalia.com; spf=pass smtp.mailfrom=igalia.com; dkim=pass (2048-bit key) header.d=igalia.com header.i=@igalia.com header.b=JCqji5+M; arc=none smtp.client-ip=178.60.130.6
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=igalia.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=igalia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=igalia.com header.i=@igalia.com header.b="JCqji5+M"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com;
	s=20170329; h=In-Reply-To:References:To:From:Subject:Cc:Message-Id:Date:
	Content-Type:Content-Transfer-Encoding:Mime-Version:Sender:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=BfpXQZwCXbJzhjggqSYZGkJOxoJNUGWrPnGQqBunZoA=; b=JCqji5+Mrkx5vb6yVqSHhFKzta
	pvmane6DfwlzDs/pTEDz5Elqy32nPUy20jV/aQFUQMY56XHPQaQOH0JN9kfCAFJcoaUE0me6AnRcq
	QHKPUMB0kYEOZlgug42Fdn6zPhsY7FwjBU6kJklVo2A8qf0tNMDY1JocmGMS4TW8jKjhJ14k0msAM
	fzjI3HgLOtAATT8odEeZ2hN6PD62jNYzsqmA69fGuZJbx0jX6k1SdxSxrP64mDtFBO0RiFYVuMqQ8
	YYe4BFaIcSEl1UNfIJnKAdD+uZQ/gO+VuctwuzqLfbL7Zl/Nr5bUkYIkFkTmquIqyRKlGcR/wNkAF
	UCOvqKxg==;
Received: from i59f7adb8.versanet.de ([89.247.173.184] helo=localhost)
	by fanzine2.igalia.com with esmtpsa 
	(Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_128_GCM:128) (Exim)
	id 1tzVZz-009XOO-4i; Tue, 01 Apr 2025 08:58:35 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 01 Apr 2025 08:58:33 +0200
Message-Id: <D8V3VKNJJI1Z.27C32MUQ1OLYF@igalia.com>
Cc: <catalin.marinas@arm.com>, <will@kernel.org>,
 <linux-kernel@vger.kernel.org>, <kernel-dev@igalia.com>
Subject: Re: [PATCH] arm64: Don't call NULL in do_compat_alignment_fixup
From: "Angelos Oikonomopoulos" <angelos@igalia.com>
To: "Anshuman Khandual" <anshuman.khandual@arm.com>,
 <linux-arm-kernel@lists.infradead.org>
X-Mailer: aerc 0.20.1
References: <20250331085415.122409-1-angelos@igalia.com>
 <17de4426-8263-4ccb-8420-f6913d478ae9@arm.com>
In-Reply-To: <17de4426-8263-4ccb-8420-f6913d478ae9@arm.com>

On Tue Apr 1, 2025 at 8:05 AM CEST, Anshuman Khandual wrote:
> On 3/31/25 14:24, Angelos Oikonomopoulos wrote:
>> do_alignment_t32_to_handler only fixes up alignment faults for specific
>> instructions; it returns NULL otherwise. When that's the case, signal to
>> the caller that it needs to proceed with the regular alignment fault
>> handling (i.e. SIGBUS).
>>=20
>> Signed-off-by: Angelos Oikonomopoulos <angelos@igalia.com>
>> ---
>>  arch/arm64/kernel/compat_alignment.c | 2 ++
>>  1 file changed, 2 insertions(+)
>>=20
>> diff --git a/arch/arm64/kernel/compat_alignment.c b/arch/arm64/kernel/co=
mpat_alignment.c
>> index deff21bfa680..b68e1d328d4c 100644
>> --- a/arch/arm64/kernel/compat_alignment.c
>> +++ b/arch/arm64/kernel/compat_alignment.c
>> @@ -368,6 +368,8 @@ int do_compat_alignment_fixup(unsigned long addr, st=
ruct pt_regs *regs)
>>  		return 1;
>>  	}
>> =20
>> +	if (!handler)
>> +		return 1;
>
> do_alignment_t32_to_handler() could return NULL, returning 1 seems to be
> the right thing to do here and consistent. Otherwise does this cause a
> kernel crash during subsequent call into handler() ?

Yes. We call a NULL pointer so we Oops.

Angelos


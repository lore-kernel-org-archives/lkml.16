Received: from fanzine2.igalia.com (fanzine.igalia.com [178.60.130.6])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9233B1E5B88
	for <linux-kernel@vger.kernel.org>; Tue,  1 Apr 2025 08:10:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=178.60.130.6
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743495011; cv=none; b=Ryp15/tysWKT8hg9kFYMN/X25PSEqRFGMGXOhij42rw5RsqxIqW5Y45x41JAw7vJd3KxElIHUIOcMFUubYGsxGO3S61lb6abeNYsnu+qTwjDVDX6EJ3Co6uELufTERYfAdEalcwWCosfmgeo2hh5ziAQ9SYXPxGFKcmAh1JZ1jQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743495011; c=relaxed/simple;
	bh=+scs5DKsbrpKu/F86as8gJ8N7D884l0nPtDswClZ8dE=;
	h=Mime-Version:Content-Type:Date:Message-Id:Cc:Subject:From:To:
	 References:In-Reply-To; b=WljCp8xIKk6qRTt+Y/1vq4xfK4UV0SIUJ2Syv9CqOj8k82onCmf8T2e4TC0RynODW+pTgSuj36viWVTkaPccsmv85Y0ZW9KwSHtGVWXEpWiYf/7CbQeaKQG+D3AKsw0fmDF+2J/GPiOvB99Ca9GXhhNrb/Ri6bA+NRpBGBzAHvk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=igalia.com; spf=pass smtp.mailfrom=igalia.com; dkim=pass (2048-bit key) header.d=igalia.com header.i=@igalia.com header.b=G0e9nYvr; arc=none smtp.client-ip=178.60.130.6
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=igalia.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=igalia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=igalia.com header.i=@igalia.com header.b="G0e9nYvr"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com;
	s=20170329; h=In-Reply-To:References:To:From:Subject:Cc:Message-Id:Date:
	Content-Type:Content-Transfer-Encoding:Mime-Version:Sender:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=HMRcZ/ULlBeIw6/Nu88nHJ/H2X1N046PBmfM1JyXits=; b=G0e9nYvryYD/wJt29ZfplPB2Bs
	kVPadTWva/KmyhbGhDMNTzn8it+Hddo1dV+7+mQaKQ9/vMWq38qmUH8lh0yJtoMZbSVpYJfFrZTko
	U1W1DWj59hY8TDts7qck+W6lbouBuxgyZa4rqICB4uD+QDppYaYWTSpnrGHDFN8cSvI+0oaOytMPS
	DQJFzI++uaBR/KUz2ETFaSxHQzK2o5oWaQV+b68b/xjimfZ1m2d2nIj6EXYS84+R8RIf9Zur5sbYf
	G10zdjHba62tdASOd8OWljAOEVdugY2uTmWYDacmEqGBuh0NOkidxTHIWWUVvbRcClenNso9M9D16
	F5Ykir+A==;
Received: from i59f7adb8.versanet.de ([89.247.173.184] helo=localhost)
	by fanzine2.igalia.com with esmtpsa 
	(Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_128_GCM:128) (Exim)
	id 1tzWh1-009Z2d-OF; Tue, 01 Apr 2025 10:09:55 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 01 Apr 2025 10:09:54 +0200
Message-Id: <D8V5E7FT19GH.3EUO3I50GYF8J@igalia.com>
Cc: <catalin.marinas@arm.com>, <will@kernel.org>,
 <linux-kernel@vger.kernel.org>, <kernel-dev@igalia.com>
Subject: Re: [PATCH] arm64: Don't call NULL in do_compat_alignment_fixup
From: "Angelos Oikonomopoulos" <angelos@igalia.com>
To: "Anshuman Khandual" <anshuman.khandual@arm.com>,
 <linux-arm-kernel@lists.infradead.org>
X-Mailer: aerc 0.20.1
References: <20250331085415.122409-1-angelos@igalia.com>
 <17de4426-8263-4ccb-8420-f6913d478ae9@arm.com>
 <D8V3VKNJJI1Z.27C32MUQ1OLYF@igalia.com>
 <c1dc28a9-7a36-4303-a8eb-0e227d866c37@arm.com>
In-Reply-To: <c1dc28a9-7a36-4303-a8eb-0e227d866c37@arm.com>

On Tue Apr 1, 2025 at 9:47 AM CEST, Anshuman Khandual wrote:
>
>
> On 4/1/25 12:28, Angelos Oikonomopoulos wrote:
>> On Tue Apr 1, 2025 at 8:05 AM CEST, Anshuman Khandual wrote:
>>> On 3/31/25 14:24, Angelos Oikonomopoulos wrote:
[...]
>>>>  arch/arm64/kernel/compat_alignment.c | 2 ++
>>>>  1 file changed, 2 insertions(+)
>>>>
>>>> diff --git a/arch/arm64/kernel/compat_alignment.c b/arch/arm64/kernel/=
compat_alignment.c
>>>> index deff21bfa680..b68e1d328d4c 100644
>>>> --- a/arch/arm64/kernel/compat_alignment.c
>>>> +++ b/arch/arm64/kernel/compat_alignment.c
>>>> @@ -368,6 +368,8 @@ int do_compat_alignment_fixup(unsigned long addr, =
struct pt_regs *regs)
>>>>  		return 1;
>>>>  	}
>>>> =20
>>>> +	if (!handler)
>>>> +		return 1;
>>>
>>> do_alignment_t32_to_handler() could return NULL, returning 1 seems to b=
e
>>> the right thing to do here and consistent. Otherwise does this cause a
>>> kernel crash during subsequent call into handler() ?
>>=20
>> Yes. We call a NULL pointer so we Oops.
>
> Then the commit message should have the kernel Oops splash dump and also
> might need to have Fixes: and CC: stable tags etc ?

Sure, I can add those. Thanks for the suggestions!

> Also wondering if handler return value should be checked inside the switc=
h
> block just after do_alignment_t32_to_handler() assignment.
>
> 	handler =3D do_alignment_t32_to_handler()
> 	if (!handler)
> 		return 1

I can see the appeal of that, but I think placing the check right before
the single dereference is a more future-proof fix, in that it reduce the
chances that a later patch will re-introduce a potential NULL pointer
dereference.

Angelos


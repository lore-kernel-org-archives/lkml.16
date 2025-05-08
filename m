Received: from mail.zytor.com (terminus.zytor.com [198.137.202.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1028724B28
	for <linux-kernel@vger.kernel.org>; Thu,  8 May 2025 22:38:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.137.202.136
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746743917; cv=none; b=cCPKIwQGm2ESVy2LBVOYu5HJNAT9hTF88YX7bt40gcpDM020EjIeiGOnl+iCi2SE/D/9sA3+QMcowc+rBFe4FA9ZglE6ZU5aUQL39UMO3A++44CLDJ6hMNIY9Sex6NPl0g1yMxA+Y2HQJwpOLjFFFUcuRBGN1H1+GNIWoWvMl04=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746743917; c=relaxed/simple;
	bh=ubfU8ik9KR7qWEwFXC26OccxX7U5YYqWVoOrTFToFzI=;
	h=Date:From:To:CC:Subject:In-Reply-To:References:Message-ID:
	 MIME-Version:Content-Type; b=pd/fya/Lpv7VQNFIUFjEgXykQcER63w4OQYAx/SWmj8tj6vEY2IfkN8gtEHvo9qMhJBxCg66xf/lzZN4qRC2zNQzXQFqB0e8TEDtLvSCDq9hvltsqAjwVL21rEenzgnWRV6wTIH+JQuqg6uqm6Jwg90HSjJC0U78arqdQby5eDM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=zytor.com; spf=pass smtp.mailfrom=zytor.com; dkim=pass (2048-bit key) header.d=zytor.com header.i=@zytor.com header.b=VRk1d1sm; arc=none smtp.client-ip=198.137.202.136
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=zytor.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=zytor.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=zytor.com header.i=@zytor.com header.b="VRk1d1sm"
Received: from [IPv6:::1] ([172.56.43.203])
	(authenticated bits=0)
	by mail.zytor.com (8.18.1/8.17.1) with ESMTPSA id 548Mc1BH2145558
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NO);
	Thu, 8 May 2025 15:38:02 -0700
DKIM-Filter: OpenDKIM Filter v2.11.0 mail.zytor.com 548Mc1BH2145558
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zytor.com;
	s=2025042001; t=1746743883;
	bh=1K13FyXuIq6scjZBNwzpY+RHoAidshJMTiiqhc1K+io=;
	h=Date:From:To:CC:Subject:In-Reply-To:References:From;
	b=VRk1d1sm7qmXUVuWLMBEBpxM0cryrMGiHa7n/NtolziAUb6FUXsxOeneF45RttC4f
	 dz2mrR68eKX5E6/gPoypmaFJu5j7QSDCmap59pixRhBjbnAs3EWsRtqDxmphePHJP8
	 glGC2R4ly6SudbrGSamWHM/ihVREoiOXZasCf4ADmIbSokiEfAYwtFVv4RTC1wNW8z
	 ryJi7zIXqf8upHAQGoxZlov+iV49glmdP4cPJv5sGg1mQJ5MCvUATMOCjkqZfGHPNL
	 3YLtAHXRFYS9MNulpFXa3nxVj0zNwBIfozm4msT/oIItkMSE/74tZ0b260fmdn2IkT
	 EFZiphmk/rM+A==
Date: Thu, 08 May 2025 15:37:53 -0700
From: "H. Peter Anvin" <hpa@zytor.com>
To: Andrew Cooper <andrew.cooper3@citrix.com>,
        "Ahmed S. Darwish" <darwi@linutronix.de>,
        Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
        Dave Hansen <dave.hansen@linux.intel.com>
CC: Thomas Gleixner <tglx@linutronix.de>,
        John Ogness <john.ogness@linutronix.de>, x86@kernel.org,
        x86-cpuid@lists.linux.dev, LKML <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v1 02/26] x86/cpu: Sanitize CPUID(0x80000000) output
User-Agent: K-9 Mail for Android
In-Reply-To: <3af01720-6bd1-40cd-9292-2c35ae22296c@citrix.com>
References: <20250506050437.10264-1-darwi@linutronix.de> <20250506050437.10264-3-darwi@linutronix.de> <6b0c87e0-d98d-4394-85bd-8abf556ebf0f@citrix.com> <797B7A87-AAFB-4302-96E6-3FD956D614C2@zytor.com> <3af01720-6bd1-40cd-9292-2c35ae22296c@citrix.com>
Message-ID: <59C811AB-F4DD-44EE-9645-E18C7DBE4C39@zytor.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: quoted-printable

On May 8, 2025 1:58:11 PM PDT, Andrew Cooper <andrew=2Ecooper3@citrix=2Ecom=
> wrote:
>On 08/05/2025 9:40 pm, H=2E Peter Anvin wrote:
>> On May 7, 2025 1:50:48 AM PDT, Andrew Cooper <andrew=2Ecooper3@citrix=
=2Ecom> wrote:
>>> On 06/05/2025 6:04 am, Ahmed S=2E Darwish wrote:
>>>> CPUID(0x80000000)=2EEAX returns the max extended CPUID leaf available=
=2E  On
>>>> x86-32 machines
>>> How certain are you that it's all 32bit CPUs?=C2=A0 AIUI, it's an Inte=
l
>>> specific behaviour, not shared by other x86 vendors of the same era=2E
>>>
>>> ~Andrew
>> All 64-bit machines require CPUID leaf 0x80000000=2E
>
>Yes, but why's that relevant?
>
>What I'm querying is the claim that all 32-bit machines behaved as Intel
>did, and returned rubble for out-of-range leaves=2E
>
>~Andrew

They did not=2E Non-Intel CPUs did, and do, report 0 for undefined levels=
=2E=20

I believe even today Intel CPUs report the "last level" value for up to 0x=
7fffffff=2E=2E=2E

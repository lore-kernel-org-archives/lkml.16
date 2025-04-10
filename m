Received: from mail.zytor.com (terminus.zytor.com [198.137.202.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1221C1A2C3A
	for <linux-kernel@vger.kernel.org>; Thu, 10 Apr 2025 18:15:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.137.202.136
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744308961; cv=none; b=eD8zrhfS7N1HLsB/nFZaF3Vh9LXgohoVG+5ldr2ajszolq62MZvSzWQoT31FG/vcJTETf3I2m3dCX/eUY4UnEIDNnw7CpNsuZiLLMYPWLpN87uV+C8NAYUqHqta1KGQupunLkj/a7K/7t1xsCWVMXxkgrmKqwbbBv5k/mVPgJJk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744308961; c=relaxed/simple;
	bh=P+NsnfmzBAzufTG0wW3WdJQWorHgLSJlgvSzTOodi18=;
	h=Content-Type:From:Mime-Version:Subject:Date:Message-Id:References:
	 Cc:In-Reply-To:To; b=tQzXWRIZBlsDCrSQX/gMR3RmkFyGPwqtDaPVZc8dbOFprXHO6+lUXQVuVi3Fwcw8az3UDWLtP5iRYxMezomLusSFcBDumWdUdoHscNSkuh3HL8VOZ3Z7gItVzKhWxVGYV9MCiAq4sZ4Gtx2fz3kH91S1rty3P89u0T4NLd0ypd0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=zytor.com; spf=pass smtp.mailfrom=zytor.com; dkim=pass (2048-bit key) header.d=zytor.com header.i=@zytor.com header.b=fSF/bphC; arc=none smtp.client-ip=198.137.202.136
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=zytor.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=zytor.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=zytor.com header.i=@zytor.com header.b="fSF/bphC"
Received: from smtpclient.apple ([IPv6:2600:1010:b058:a1e9:b4d4:76c1:a502:6662])
	(authenticated bits=0)
	by mail.zytor.com (8.18.1/8.17.1) with ESMTPSA id 53AIFYph039316
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NO);
	Thu, 10 Apr 2025 11:15:38 -0700
DKIM-Filter: OpenDKIM Filter v2.11.0 mail.zytor.com 53AIFYph039316
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zytor.com;
	s=2025032001; t=1744308939;
	bh=JGkHoNgRSzcTjuLBgKhwZf1s4HtCb1TW+38/xtj9+KU=;
	h=From:Subject:Date:References:Cc:In-Reply-To:To:From;
	b=fSF/bphCMu/t67wjUR4n665Hv3dgm4f+f+Fh0capi3BtcF7XCyqZQpRH22RpvP/NP
	 G4VldBe/sZSEh5yxXZMglpchlrhtUwMJdl7MKNinWpssBc5GxKgIi8mK9t3knNRvdS
	 0SMVMP6QOGgO0DZkVYkZSqHq6VdBNq8PLxkOssji7YcKBeOX6SkaWEjpdxdmxyWVZq
	 mir+ZJS7XGAnbUh8fdSL+AMfBPbGbepftemSBjCypxjzqv8xYtHunG0C9hHYEXexfz
	 1bWVK8+aHQpuCqHp8nYHI0btlblM2VANWZSMrvVfal2tVcoIa0Fxrsx9Ce0Iic4SZR
	 jSwe1tYpNbkDQ==
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
From: Xin Li <xin@zytor.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0 (1.0)
Subject: Re: [PATCH] x86/cpufeatures: Clean up formatting
Date: Thu, 10 Apr 2025 11:15:18 -0700
Message-Id: <DA17F1E4-C17A-43D0-88A7-746EAD28B4E8@zytor.com>
References: <20250410180556.GHZ_gIhKb431qGH5Ja@fat_crate.local>
Cc: Petkov Borislav <bp@kernel.org>, X86 ML <x86@kernel.org>,
        LKML <linux-kernel@vger.kernel.org>
In-Reply-To: <20250410180556.GHZ_gIhKb431qGH5Ja@fat_crate.local>
To: Petkov Borislav <bp@alien8.de>
X-Mailer: iPhone Mail (22E240)

On Apr 10, 2025, at 11:07=E2=80=AFAM, Borislav Petkov <bp@alien8.de> wrote:
>=20
> =EF=BB=BFOn Thu, Apr 10, 2025 at 10:52:56AM -0700, Xin Li wrote:
>> I ever had a patch in which the last column of the same type macros are
>> not aligned and tglx asked me to make them aligned.  But that didn't
>> need any name shortened.
>=20
> If you wanna, You can take mine, and then do two more patches ontop,
> shortening one name in each one.
>=20
> :-)

Sure :)=20


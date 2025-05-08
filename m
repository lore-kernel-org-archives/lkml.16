Received: from mail.zytor.com (terminus.zytor.com [198.137.202.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AEF0928C5D9
	for <linux-kernel@vger.kernel.org>; Thu,  8 May 2025 20:41:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.137.202.136
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746736879; cv=none; b=jZxXyb1zLb8+csgAjfF902ytNnfViJZ56T3Q0f92PBko4Cvn5IbRCD3HOQJgVOQ2zIjiKQjIMfzWY+9RlHz1ygli3EcS+xLYMXbVedhEDGCSrtfvNyKicqDH8PIPCZ/JteMubRcfG8NYb+SEf37FNIkaViIP+b3bWbZ6TNWdSF0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746736879; c=relaxed/simple;
	bh=aEq/Xh9an+2qi6oqklX7yydPmekwlr32/s2BWscXWmw=;
	h=Date:From:To:CC:Subject:In-Reply-To:References:Message-ID:
	 MIME-Version:Content-Type; b=E7MgKUU9aYT7XjikixLdUzUcv2xX9/PRK8BROoUnrFUsF+hC/8qo1DGtzCDz3qW6UhZ/Uz1l/xuS02Z7+4JAOkhBC5n9L3gpVn5j/WYFgGDu7D1xCW44NZsFYJAYY7zNRbGbFOtbQLdBkVwSc9zCJiDJB2Uku7+3Dmp5jpRcL44=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=zytor.com; spf=pass smtp.mailfrom=zytor.com; dkim=pass (2048-bit key) header.d=zytor.com header.i=@zytor.com header.b=eIvlhLqn; arc=none smtp.client-ip=198.137.202.136
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=zytor.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=zytor.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=zytor.com header.i=@zytor.com header.b="eIvlhLqn"
Received: from [127.0.0.1] ([76.133.66.138])
	(authenticated bits=0)
	by mail.zytor.com (8.18.1/8.17.1) with ESMTPSA id 548Kekqh2110471
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NO);
	Thu, 8 May 2025 13:40:46 -0700
DKIM-Filter: OpenDKIM Filter v2.11.0 mail.zytor.com 548Kekqh2110471
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zytor.com;
	s=2025042001; t=1746736847;
	bh=ijN0FKRxccZXqmoXwNNheIJANcAgwNxNmIDo5KCOPcg=;
	h=Date:From:To:CC:Subject:In-Reply-To:References:From;
	b=eIvlhLqnfE0e4IEl0+hUsCFOo82g5+Z6jbB1BssADy86zpPVrp/L0p5fUgYXcUuFu
	 W6aeUl8+O5w8HBJQAGfMASIP5Zyk0owWCFHCkVuaQZdKSm8lVmq+5n18j7Lj1U99PC
	 fiGlK/B//YofoLpZlaU+KRrODR8pSbnl9UPp5qQi3fSjmkmzYD03v4syOXw0Cn+RSR
	 OMIP5ZxpMkMc73TXo/F4GEJONnpIG6ZKSjApgdXeemORM4/DpGOfcST40EXoZecZMb
	 Ddr1quvP44WuIWqGIVwjS91zWq3JCFwD8StJF/Kd5i+phUPURxJB19jLsNC8xxrq4k
	 3mBe4ZbBxmSJw==
Date: Thu, 08 May 2025 13:40:45 -0700
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
In-Reply-To: <6b0c87e0-d98d-4394-85bd-8abf556ebf0f@citrix.com>
References: <20250506050437.10264-1-darwi@linutronix.de> <20250506050437.10264-3-darwi@linutronix.de> <6b0c87e0-d98d-4394-85bd-8abf556ebf0f@citrix.com>
Message-ID: <797B7A87-AAFB-4302-96E6-3FD956D614C2@zytor.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: quoted-printable

On May 7, 2025 1:50:48 AM PDT, Andrew Cooper <andrew=2Ecooper3@citrix=2Ecom=
> wrote:
>On 06/05/2025 6:04 am, Ahmed S=2E Darwish wrote:
>> CPUID(0x80000000)=2EEAX returns the max extended CPUID leaf available=
=2E  On
>> x86-32 machines
>
>How certain are you that it's all 32bit CPUs?=C2=A0 AIUI, it's an Intel
>specific behaviour, not shared by other x86 vendors of the same era=2E
>
>~Andrew

All 64-bit machines require CPUID leaf 0x80000000=2E

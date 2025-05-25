Received: from mail.zytor.com (terminus.zytor.com [198.137.202.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E0E3E13DDAA
	for <linux-kernel@vger.kernel.org>; Sun, 25 May 2025 08:34:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.137.202.136
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748162089; cv=none; b=mfEn8I08OkWLhdELmKccvBI3/TVTCZjxeGTRWfPTI2ybWTlr4b/rFbdWIK0coRnmTVs0maakdbJqjW3kSSVOYu/id5N0zbAFE+phRGQBFRruFDKfPg287azs8/NwFTBNF9c13Ioojw0cEN9xxoat/mO3RTEC547dODgguDYhhMk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748162089; c=relaxed/simple;
	bh=6fSAuLhuvw6/i//afr75tNvyrp1/Ike8/T5r4LfztL4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=KLaxLNfsKX2hrkN/iWZdE6rZQai0Y0+5MaoKFsAa5Xb/ReIOkQA539PGl84TI86ipZCXPZA+TW9Zy8+Kh00FFGjALOhLZlUxcFQQMys8BS5TnkZz0N4gUM10tAMY7RtRpcAATIgOgVfAPzWbXe9V71tYHQ+CG4W6Rvi4ZbCw7cg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=zytor.com; spf=pass smtp.mailfrom=zytor.com; dkim=pass (2048-bit key) header.d=zytor.com header.i=@zytor.com header.b=ZtmtTGcb; arc=none smtp.client-ip=198.137.202.136
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=zytor.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=zytor.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=zytor.com header.i=@zytor.com header.b="ZtmtTGcb"
Received: from [192.168.7.202] ([71.202.166.45])
	(authenticated bits=0)
	by mail.zytor.com (8.18.1/8.17.1) with ESMTPSA id 54P8YTEX152214
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NO);
	Sun, 25 May 2025 01:34:30 -0700
DKIM-Filter: OpenDKIM Filter v2.11.0 mail.zytor.com 54P8YTEX152214
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zytor.com;
	s=2025052101; t=1748162071;
	bh=Kbqx036vJssEi1y2lTj8jGmsxVOeJfeKpo4ZiAsXRpw=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=ZtmtTGcbQXf2OxH9l0ABovAXH9TEnBTcTAmDhd1omvbfhmPaTxnc5KESxxq38b89i
	 Fz36kYSFBIM3Z+fIfDEw77waYuIxzGwbslG6o6XLar378UgSlxG3PHUyGLcYVAnmjI
	 OtZVMJuWKxxBfGmpp/g3J4oSKjlj52ri+EhlrcTVSoM/od/+G8/8yZUTxr1MVErXP0
	 pX0AFMna3x/ImJthORvOMLEbrOiQlDekg6P/YjKDjDA4WuCSoRSnf+E0VZmXJQYDYX
	 Pj1zKEskJs2rmhCmblQMzdc4IhovTytOdkkaPCUYRTS1EPmvbBBDYN6alQrTBV+ecO
	 AZwE2FKunMDeQ==
Message-ID: <d031bb95-0204-43d8-8561-91d4d6b8bfd2@zytor.com>
Date: Sun, 25 May 2025 01:34:29 -0700
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [Bug Report] Linux v6.15-rc7 boot failure on Xen-4.17
To: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "x86@kernel.org" <x86@kernel.org>
Cc: Peter Zijlstra <peterz@infradead.org>,
        Pawan Gupta <pawan.kumar.gupta@linux.intel.com>,
        Dave Hansen <dave.hansen@linux.intel.com>,
        alexandre.chartre@oracle.com
References: <3cd3b448-e0c7-4408-8a8b-e08bb3b350c3@zytor.com>
 <21456608-aa50-4d70-b201-b51764347804@suse.com>
Content-Language: en-US
From: Xin Li <xin@zytor.com>
Autocrypt: addr=xin@zytor.com; keydata=
 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
 l75w1xInsg==
In-Reply-To: <21456608-aa50-4d70-b201-b51764347804@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 5/24/2025 11:58 PM, Jürgen Groß wrote:
>> Just noticed vanilla v6.15-rc7 fails to boot on Xen 4.17 (Ubuntu Xen
>> package) in a KVM guest.  So I did a bisect, and it says:
>>
>> 872df34d7c51a79523820ea6a14860398c639b87 is the first bad commit
>> commit 872df34d7c51a79523820ea6a14860398c639b87
>> Author: Peter Zijlstra <peterz@infradead.org>
>> Date:   Mon Oct 14 10:05:48 2024 -0700
>>
>>      x86/its: Use dynamic thunks for indirect branches
>>
>>
>> Attached is the serial console log and my kernel config.
> 
> So you are saying that the host kernel is to blame, given that above
> commit isn't in the dom0 kernel.

No, it's the KVM guest.  I didn't change host kernel during the
bisecting.

I didn't dig further, but it looks related to changes in:
     arch/x86/kernel/alternative.c
> Can you start e.g. a normal Linux guest on that host?
The same kernel binary boots fine as native.

> Any host messages to be seen when that happens?

[469584.422141] virbr0: port 1(vnet12) entered blocking state
[469584.422149] virbr0: port 1(vnet12) entered disabled state
[469584.422164] vnet12: entered allmulticast mode
[469584.422297] vnet12: entered promiscuous mode
[469584.422716] virbr0: port 1(vnet12) entered blocking state
[469584.422721] virbr0: port 1(vnet12) entered listening state
[469586.477553] virbr0: port 1(vnet12) entered learning state
[469588.526074] virbr0: port 1(vnet12) entered forwarding state
[469588.526082] virbr0: topology change detected, propagating
[469624.321914] virbr0: port 1(vnet12) entered disabled state
[469624.332737] vnet12 (unregistering): left allmulticast mode
[469624.332743] vnet12 (unregistering): left promiscuous mode
[469624.332765] virbr0: port 1(vnet12) entered disabled state

Thanks!
     Xin


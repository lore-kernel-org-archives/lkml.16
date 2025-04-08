Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA79E223714;
	Tue,  8 Apr 2025 18:34:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744137272; cv=none; b=rSVwHXPYQ0FR5cb4cILbYDOvgTHK/H3mjWKORuf5lWL4NxuuOZvt3TjS79lQRMyi19odAf+nQuDVprfiKghHX0++frPeMnB+pMZAt1r1JzLUHs6PbTcoI1YcaC2QumqQ7qPCcpo7O4dk9NiTJ2anHhewSqQYbZOqEqoEn4mBXnc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744137272; c=relaxed/simple;
	bh=wZHfmO+4ijZiRV61lTcI2ea64PpOjZEPTdYCKaYTEyY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=RBor2pq9YUuDWAQShFd1WDQU4glsk3RKfs+3cIVpvUhmh7L3rzVu7K7RXuxKKxvcxGPDEEzd9B6mvqNyVUOXF4WSKKUsPwxgJHly45v5eucoA7DBhORUuvJ+pCNl/UpJCy5kENLr1vOrDZq1HCQc48aqbvefeX8Qc+OANtjDSjg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=lAjP511F; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="lAjP511F"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1B92CC4CEE5;
	Tue,  8 Apr 2025 18:34:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744137272;
	bh=wZHfmO+4ijZiRV61lTcI2ea64PpOjZEPTdYCKaYTEyY=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=lAjP511FGl3+5xNEOTJyCdh7GTA04W+rLvvZgdYNWTBLz6jLM+Vw2uIu+J6y68xAN
	 hIwg92dMbjwuoTQ01rahC40TufDu1C0u1LjwamjWjNUyHelXbQf3WHIl5IfctmrOVQ
	 e/ZNNAI0niTbGEqH+2hHknrna4scuUE4c6lHwYqoyWwxoXV6VuYgKmf/KBT8X9wPrz
	 d3JZMRDhDnRTKT28OTCq5sUOsk2UIC2+6NtWbzBTitt0YjLU7mOUUFrBCCpCCWcR4/
	 TLiB7nBZ7Z2tX4A49yt5eBuAlOpjbBgdOrqFeFRivNrtK1LxLruW+QlmJDl+IB4tnD
	 KwMYuIu3dWN9A==
Message-ID: <5788aca2-2565-4c7d-9760-6a08509eb014@kernel.org>
Date: Tue, 8 Apr 2025 13:34:30 -0500
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/2] x86/CPU/AMD: Print the reason for the last reset
To: Dave Hansen <dave.hansen@intel.com>, Borislav Petkov <bp@alien8.de>
Cc: Jonathan Corbet <corbet@lwn.net>, Thomas Gleixner <tglx@linutronix.de>,
 Ingo Molnar <mingo@redhat.com>, Dave Hansen <dave.hansen@linux.intel.com>,
 "maintainer:X86 ARCHITECTURE (32-BIT AND 64-BIT)" <x86@kernel.org>,
 "H . Peter Anvin" <hpa@zytor.com>,
 "open list:DOCUMENTATION" <linux-doc@vger.kernel.org>,
 open list <linux-kernel@vger.kernel.org>,
 Yazen Ghannam <yazen.ghannam@amd.com>,
 Mario Limonciello <mario.limonciello@amd.com>
References: <20250408174726.3999817-1-superm1@kernel.org>
 <20250408174726.3999817-2-superm1@kernel.org>
 <20250408181451.GFZ_Vnm6JXaItfwVpK@fat_crate.local>
 <a8bed98e-0393-4b0a-8b5b-3007015a9af6@kernel.org>
 <9be828dc-94d0-4760-a78f-e8f92d92bcbd@intel.com>
Content-Language: en-US
From: Mario Limonciello <superm1@kernel.org>
In-Reply-To: <9be828dc-94d0-4760-a78f-e8f92d92bcbd@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 4/8/2025 1:28 PM, Dave Hansen wrote:
> On 4/8/25 11:19, Mario Limonciello wrote:
>> I think it's still valuable to have it in documentation for anyone who
>> wants to read more about this.  As we get issues that come out of the
>> woodwork I could see people punching the string into a search engine and
>> then being spit at debugging.rst and we can adjust documentation to tell
>> them what to do with it when it's not clear.
> 
> How would that work when the documentation:
> 
>> +31, Internal, SW sync flood event
> 
> and the string don't match:
> 
>> +	if (value & BIT(31))
>> +		return "software sync flood event";
> 
> ?

Good catch.

If we're in agreement in the value of having the strings in the kernel 
and then also in this table I'll make sure both sets of strings are the 
same.


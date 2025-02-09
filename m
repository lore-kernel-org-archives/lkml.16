Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A950C220693;
	Sun,  9 Feb 2025 20:50:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739134252; cv=none; b=oC8vZ0yHuV9n7g0mbbQDidAtvnRQ0wxiSGoSNXU3qQrEzXc4QnjYAPR6kroA7SinHk1U7cxEOdlWpDLEMhS9np7cDjwOyINKFArNntgTMKaoiP7vcHZyi+fGco2GJwupYgIF4YP2f/JlyhgkFdrkZLJDKJVjbDAkqHCfaxKPbmQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739134252; c=relaxed/simple;
	bh=nYh6HS/8YhYPUbpFj0lcvwBp+jEeNeVWldCm/vWJV6w=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:Cc:References:
	 In-Reply-To:Content-Type; b=gHkZdeaUwjvHJIjz5Iu19WqlXOTPzushgc2C+qlXyNQIGeqSRHdLsJkV7CxKwG32GJWwEBqlQloVmR1YrSM11zn3wcZEOF2yMKZwvrHOVUvYagHB/NYYVxB2C36t4uHHlHLGbxEOPBzDLwmhXdlf4EI8LbvnqnIX0zNQFTIWhaw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=FRoXnfew; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="FRoXnfew"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5816CC4CEDD;
	Sun,  9 Feb 2025 20:50:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1739134252;
	bh=nYh6HS/8YhYPUbpFj0lcvwBp+jEeNeVWldCm/vWJV6w=;
	h=Date:Subject:From:To:Cc:References:In-Reply-To:From;
	b=FRoXnfewBrxuCbbhALBsvsNs+tIGI2i7J1Yhkl23PaokLqsGphsoDBqlba8Dc21C9
	 8z+X9lYQr8N10vRumpkokgJaKIyyD4Y6dgG9PDoauwTe9EvTNynnTuhQZDOc/DdD0Q
	 Xnisd7BQ2zmWehNaO+m7sLwGT60EQR/Rfej6w3NAmvDTd5TNKs7iryubycPlRLpKd8
	 PzfZZSIwftUllTLMsa0Z217TjJ5RgbkujfegcHLXKzAKKpNLdPniFnl8OHk98t+ezY
	 OBE9iLm7eewcAJeVMC6RI+S1HCeqlmqBm7ztBZ4VecgFLEK8QmUI5Z/tau+pzi+7eT
	 7NpranzMzhUVg==
Message-ID: <aa4ec16a-b35f-41b0-92f7-40b3eb64124a@kernel.org>
Date: Sun, 9 Feb 2025 21:50:37 +0100
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 14/14] Documentation: KHO: Add memblock bindings
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Mike Rapoport <rppt@kernel.org>
Cc: linux-kernel@vger.kernel.org, Alexander Graf <graf@amazon.com>,
 Andrew Morton <akpm@linux-foundation.org>, Andy Lutomirski
 <luto@kernel.org>, Anthony Yznaga <anthony.yznaga@oracle.com>,
 Arnd Bergmann <arnd@arndb.de>, Ashish Kalra <ashish.kalra@amd.com>,
 Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Borislav Petkov <bp@alien8.de>, Catalin Marinas <catalin.marinas@arm.com>,
 Dave Hansen <dave.hansen@linux.intel.com>,
 David Woodhouse <dwmw2@infradead.org>, Eric Biederman
 <ebiederm@xmission.com>, Ingo Molnar <mingo@redhat.com>,
 James Gowans <jgowans@amazon.com>, Jonathan Corbet <corbet@lwn.net>,
 Mark Rutland <mark.rutland@arm.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Pasha Tatashin <pasha.tatashin@soleen.com>, "H. Peter Anvin"
 <hpa@zytor.com>, Peter Zijlstra <peterz@infradead.org>,
 Pratyush Yadav <ptyadav@amazon.de>, Rob Herring <robh+dt@kernel.org>,
 Rob Herring <robh@kernel.org>, Saravana Kannan <saravanak@google.com>,
 Stanislav Kinsburskii <skinsburskii@linux.microsoft.com>,
 Steven Rostedt <rostedt@goodmis.org>, Thomas Gleixner <tglx@linutronix.de>,
 Tom Lendacky <thomas.lendacky@amd.com>, Usama Arif
 <usama.arif@bytedance.com>, Will Deacon <will@kernel.org>,
 devicetree@vger.kernel.org, kexec@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, linux-doc@vger.kernel.org,
 linux-mm@kvack.org, x86@kernel.org
References: <20250206132754.2596694-1-rppt@kernel.org>
 <20250206132754.2596694-15-rppt@kernel.org>
 <45df0d7a-622a-4268-9683-c5c6067483c3@kernel.org>
 <Z6jFZII5b-j7hzkj@kernel.org>
 <a3cca0ed-64ca-4921-bb4c-27c0e06b78c6@kernel.org>
 <Z6kTCvex3DGhB-3C@kernel.org>
 <18529b1f-dc79-4c85-a485-a0a2cdd48670@kernel.org>
Content-Language: en-US
Autocrypt: addr=krzk@kernel.org; keydata=
 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 fv0=
In-Reply-To: <18529b1f-dc79-4c85-a485-a0a2cdd48670@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 09/02/2025 21:49, Krzysztof Kozlowski wrote:
>>>>  
>>>> These are not devicetree binding for communicating data from firmware to
>>>> the kernel. These bindings are specific to KHO which is perfectly
>>>> reflected by the subject.
>>>
>>> No, it is not. None of the bindings use above subject prefix.
>>>
>>>>
>>>> Just a brief reminder from v2 discussion:
>>>> (https://lore.kernel.org/linux-mm/20231222193607.15474-1-graf@amazon.com/)
>>>>
>>>> "For quick reference: KHO is a new mechanism this patch set introduces 
>>>> which allows Linux to pass arbitrary memory and metadata between kernels 
>>>> on kexec. I'm reusing FDTs to implement the hand over protocol, as 
>>>> Linux-to-Linux boot communication holds very similar properties to 
>>>> firmware-to-Linux boot communication. So this binding is not about 
>>>> hardware; it's about preserving Linux subsystem state across kexec.
>>>
>>> does not matter. You added file to ABI documentation so you must follow
>>> that ABI documentation rules. One rule is proper subject prefix.
>>  
>> No, it does not. It's a different ABI.
>>
>> FDT is a _data structure_ that provides cross platform unified, versioned,
>> introspectable data format.
>>
>> Documentation/devicetree/bindings standardizes it's use for describing
>> hardware, but KHO uses FDT _data structure_ to describe state of the kernel
>> components that will be reused by the kexec'ed kernel.
>>
>> KHO is a different namespace from Open Firmware Device Tree, with different
>> requirements and different stakeholders. Putting descriptions of KHO data
>> formats in Documentation/kho rather than in
>> Documentation/devicetree/bindings was not done to evade review of Open
>> Firmware Device Tree maintainers, but rather to emphasize that KHO FDT _is
>> not_ Open Firmware Device Tree.
> 
> 
> Ah, neat, that would almost solve the problem but you wrote:
> 
> +$id: http://devicetree.org/schemas/memblock/reserve_mem.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> 
> so no, this does not work like that. You use devicetree here namespace
> and ignore its rules.


... and that obviously is barely parseable, so maybe one more try:
"You use here devicetree namespace but ignore its rules."

> 
> You cannot pretend this is not devicetree if you put it into devicetree
> schemas.

Best regards,
Krzysztof

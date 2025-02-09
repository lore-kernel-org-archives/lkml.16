Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE68F1DF72E;
	Sun,  9 Feb 2025 15:23:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739114603; cv=none; b=LsVB5FtHMXKhANFN8dFTGPAce+BakiOgiRmzx7aKc3s0PsDcpYqIgNGPDca0sddq+eUlntDqMOcb4PsCPRdKAxCvzxffY52eyjgJqaHcNWXy8RrXvcDk/T/X1bX/P85Gen5S63LxL/2GJPLkOS1AOSsSP7EcCniMrgRC/fD/Hq4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739114603; c=relaxed/simple;
	bh=kacGDs7MBPtZmFatZ3M62dLvd6DWL9z0LSNCKjsijIg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=UYWRHzSRP5obfof/JXk8zRLt7JdBEqx7ud33AIrM3EDvPLK4C2xJeC2MkyA5ZVoKsryo9yMewkCoGYHo4x1xJe/uLZKzx789jUk3462puou8IAf6Ku+d4rm/mT9ILkBhEpoteplWt7IfQ/7ySfML21B73+39i044Vs1qF7kL/v4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=MdXD/P/C; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="MdXD/P/C"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4C3E8C4CEDD;
	Sun,  9 Feb 2025 15:23:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1739114603;
	bh=kacGDs7MBPtZmFatZ3M62dLvd6DWL9z0LSNCKjsijIg=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=MdXD/P/CnlmfXsxWeOqF++pCLy9wQpTyzPkCYMiw1SPSD8LTGVF/iMMpa9PdegKxf
	 rZYLz6jpsACahDzkZOOxH823dKypv9YmqxGqsUCzWztjy96HZFYAFF8ew1zSSYo9EW
	 K0lLOU3DY+30+5JZntsmxSRrFp068hofgO3ypNLzrSEIYlkvFYr7QdaA+kDxw1g72P
	 He6oHFAxejPohB0bR2UsjAmPv7SLPUJ18lf4C7FBZowrMinl821s+aKw/9m3oonLHq
	 JvxwfSvl8SOM5xh+ToHK79SAqKOqW1dTEOB1oYWjzIqdxaMxK6dqlcUKsrlVymvitU
	 dvTSw+mIxp75A==
Message-ID: <a3cca0ed-64ca-4921-bb4c-27c0e06b78c6@kernel.org>
Date: Sun, 9 Feb 2025 16:23:09 +0100
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 14/14] Documentation: KHO: Add memblock bindings
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
From: Krzysztof Kozlowski <krzk@kernel.org>
Content-Language: en-US
Autocrypt: addr=krzk@kernel.org; keydata=
 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 fv0=
In-Reply-To: <Z6jFZII5b-j7hzkj@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 09/02/2025 16:10, Mike Rapoport wrote:
> On Sun, Feb 09, 2025 at 11:29:41AM +0100, Krzysztof Kozlowski wrote:
>> On 06/02/2025 14:27, Mike Rapoport wrote:
>>> From: "Mike Rapoport (Microsoft)" <rppt@kernel.org>
>>>
>>> We introduced KHO into Linux: A framework that allows Linux to pass
>>> metadata and memory across kexec from Linux to Linux. KHO reuses fdt
>>> as file format and shares a lot of the same properties of firmware-to-
>>> Linux boot formats: It needs a stable, documented ABI that allows for
>>> forward and backward compatibility as well as versioning.
>>
>> Please use subject prefixes matching the subsystem. You can get them for
>> example with `git log --oneline -- DIRECTORY_OR_FILE` on the directory
>> your patch is touching. For bindings, the preferred subjects are
>> explained here:
>> https://www.kernel.org/doc/html/latest/devicetree/bindings/submitting-patches.html#i-for-patch-submitters
>  
> These are not devicetree binding for communicating data from firmware to
> the kernel. These bindings are specific to KHO which is perfectly
> reflected by the subject.

No, it is not. None of the bindings use above subject prefix.

> 
> Just a brief reminder from v2 discussion:
> (https://lore.kernel.org/linux-mm/20231222193607.15474-1-graf@amazon.com/)
> 
> "For quick reference: KHO is a new mechanism this patch set introduces 
> which allows Linux to pass arbitrary memory and metadata between kernels 
> on kexec. I'm reusing FDTs to implement the hand over protocol, as 
> Linux-to-Linux boot communication holds very similar properties to 
> firmware-to-Linux boot communication. So this binding is not about 
> hardware; it's about preserving Linux subsystem state across kexec.

does not matter. You added file to ABI documentation so you must follow
that ABI documentation rules. One rule is proper subject prefix.

> 
> For more details, please refer to the KHO documentation which is part of 
> patch 7 of this patch set: 
> https://lore.kernel.org/lkml/20231222195144.24532-2-graf@amazon.com/"

I fail to see how this is related to the incorrect subject prefix as I
pointed.

> 
> and
> 
> "This is our own data structure for KHO that just happens to again 
> contain a DT structure. The reason is simple: I want a unified, 
> versioned, introspectable data format that is cross platform so you 
> don't need to touch every architecture specific boot passing logic every 
> time you want to add a tiny piece of data."
>  
>>> As first user of KHO, we introduced memblock which can now preserve
>>> memory ranges reserved with reserve_mem command line options contents
>>> across kexec, so you can use the post-kexec kernel to read traces from
>>> the pre-kexec kernel.
>>>
>>> This patch adds memblock schemas similar to "device" device tree ones to
>>> a new kho bindings directory. This allows us to force contributors to
>>> document the data that moves across KHO kexecs and catch breaking change
>>> during review.
>>>
>>> Co-developed-by: Alexander Graf <graf@amazon.com>
>>> Signed-off-by: Alexander Graf <graf@amazon.com>
>>> Signed-off-by: Mike Rapoport (Microsoft) <rppt@kernel.org>
>>> ---
>>>  .../kho/bindings/memblock/reserve_mem.yaml    | 41 ++++++++++++++++++
>>>  .../bindings/memblock/reserve_mem_map.yaml    | 42 +++++++++++++++++++
>>>  2 files changed, 83 insertions(+)
>>>  create mode 100644 Documentation/kho/bindings/memblock/reserve_mem.yaml
>>>  create mode 100644 Documentation/kho/bindings/memblock/reserve_mem_map.yaml
>>>
>>> diff --git a/Documentation/kho/bindings/memblock/reserve_mem.yaml b/Documentation/kho/bindings/memblock/reserve_mem.yaml
>>> new file mode 100644
>>> index 000000000000..7b01791b10b3
>>> --- /dev/null
>>> +++ b/Documentation/kho/bindings/memblock/reserve_mem.yaml
>>> @@ -0,0 +1,41 @@
>>> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
>>> +%YAML 1.2
>>> +---
>>> +$id: http://devicetree.org/schemas/memblock/reserve_mem.yaml#
>>> +$schema: http://devicetree.org/meta-schemas/core.yaml#
>>> +
>>> +title: Memblock reserved memory
>>> +
>>> +maintainers:
>>> +  - Mike Rapoport <rppt@kernel.org>
>>> +
>>> +description: |
>>> +  Memblock can serialize its current memory reservations created with
>>> +  reserve_mem command line option across kexec through KHO.
>>> +  The post-KHO kernel can then consume these reservations and they are
>>> +  guaranteed to have the same physical address.
>>> +
>>> +examples:
>>> +  - |
>>> +    reserve_mem {
>>
>> Again, do not introduce own coding style.
>>
>> I don't understand why do you need this in the first place. There is
>> already reserved-memory block.
> 
> Because these regions are not "... designed for the special usage by
> various device drivers"

So you use now very similar name, but different with few letters just to
note that you do not fit into existing formats. If this does not fit
existing usage, then use different name.

>  and should not be exclude by the operating system
> from normal usage. 

Then it does not look like a reserved memory
>  
>> Best regards,
>> Krzysztof
> 


Best regards,
Krzysztof

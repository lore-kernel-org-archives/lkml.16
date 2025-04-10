Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7BC591F0E4E
	for <linux-kernel@vger.kernel.org>; Thu, 10 Apr 2025 06:39:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744267187; cv=none; b=NHLUbVs9wswyEs/mUzA7N11eOG41CTYFmWPOE0DKUddDIs8guiH/pL+QnolbpRlpb+VjfP9c7cNbawpVxwcDp/g1Ka7OB4tgM5WqENnrfvF4k17TEhUL6u5rwCATx8JTrnfSDHQMQZoaRBEOSbqjE/S/Py4AKT63zYCzrYq7bK8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744267187; c=relaxed/simple;
	bh=MsfltxneL+5yruKscAZpEJiC7VEYXqwxIKgoWm8CCoc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=HwpGUv58rz8uu7IJQj51tupA+uyna0fnF5vW0LITjkTLEqffsBpf5KsoBir2t+zS1FNpCjuKw0dgjycXBE+dweDcqEI9suoWxItKFVIweZTGAM+qObKEGYai8TlRcb8M0Mq8G5Rn8fDbypS/uaAvFRgkQQSLkiPwTM+rj8pebiE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=EnYidDhw; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="EnYidDhw"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C9C2FC4CEDD;
	Thu, 10 Apr 2025 06:39:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744267185;
	bh=MsfltxneL+5yruKscAZpEJiC7VEYXqwxIKgoWm8CCoc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=EnYidDhwUsu3yXMYTynmB0hNEHW8uxB6U69Qs0x6qlN1w9rj0h9Xm/h+dTyIIe1i+
	 FBND0HUOUu7XKU3qzhP1t2tKAErLFfZ6/Ldmf5l6LpmLCC9minGSUTMWCYuppqKgpy
	 d7PoYWZPqtJQIIgfOaW1nSHNjOou5oIiTzyQJTLMsGC33tLMxzOwIg6FIB8ehcNfJu
	 K+9wBVWuoDRI5e+m1yNjBIuKZXtXKjnaNySdgIBwOsTvVfpj50BLCTppsAQ5tPv5IL
	 J+CiFBSFgs89/Lp2lpWfR4namqthSxmHpmsq6SqSRs5UfCRIN4xU0xMjZqHLZhokhc
	 1UKpvIH1vsVqA==
Date: Thu, 10 Apr 2025 08:39:41 +0200
From: Ingo Molnar <mingo@kernel.org>
To: Xin Li <xin@zytor.com>
Cc: "H. Peter Anvin" <hpa@zytor.com>, linux-kernel@vger.kernel.org,
	Juergen Gross <jgross@suse.com>,
	Dave Hansen <dave.hansen@intel.com>,
	Linus Torvalds <torvalds@linux-foundation.org>,
	Peter Zijlstra <peterz@infradead.org>,
	Borislav Petkov <bp@alien8.de>,
	Thomas Gleixner <tglx@linutronix.de>
Subject: Re: [PATCH 06/20] x86/msr: Standardize on 'u32' MSR indices in
 <asm/msr.h>
Message-ID: <Z_dnraUGp0Vbzk6k@gmail.com>
References: <20250409202907.3419480-1-mingo@kernel.org>
 <20250409202907.3419480-7-mingo@kernel.org>
 <aed43a6a-aca9-4c81-af1a-775f5858ebe3@zytor.com>
 <9c014962-d4cb-4e68-be15-efbe2ea26531@zytor.com>
 <63ab3ea9-c55d-48d2-8344-fb4314baf240@zytor.com>
 <3B57B3E5-47C9-4196-AD2B-44916E18B6D0@zytor.com>
 <3e2a52c5-791a-4e96-a768-8579ec841dd1@zytor.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <3e2a52c5-791a-4e96-a768-8579ec841dd1@zytor.com>


* Xin Li <xin@zytor.com> wrote:

> On 4/9/2025 8:29 PM, H. Peter Anvin wrote:
> > On April 9, 2025 8:18:12 PM PDT, Xin Li <xin@zytor.com> wrote:
> > > A question NOT related to this patch set, the MSR write API prototype
> > > defined in struct pv_cpu_ops as:
> > >     void (*write_msr)(unsigned int msr, unsigned low, unsigned high);
> > > 
> > > Will it be better to add "const" to its arguments?  I.e.,
> > >     void (*write_msr)(const u32 msr, const u32 low, const u32 high);
> > > 
> > 
> > No, that makes no sense (it would have absolutely no effect.)
> > 
> 
> For the API definition, yes, it has no effect.
> 
> While it makes the API definition more explicit, and its implementations
> for native and Xen would be:
> 
> void {native,xen}_write_msr(const u32 msr, const u32 low, const u32 high)
> {
>     ....
> }
> 
> not worth it at all?

No:

 - Using 'const' for input parameter pointers makes sense because it's 
   easy to have a bug like this in a utility function:

	obj_ptr->val = foo;

   this has a side effect on the calling context, spreading the local 
   rot, so to speak, corrupting the object not owned by this function.

 - Using 'const' for non-pointer input parameters makes little sense, 
   because the worst a function can do is to corrupt it locally:

	val_high = foo;

   ... but this bug won't be able to spread via corrupting objects 
   through a pointer, any bug will be limited to that function.

So neither the kernel, nor any of the major libraries such as glibc 
will typically use const for non-pointer function parameters, outside 
of very specific exceptions that strengthen the rule.

Thanks,

	Ingo

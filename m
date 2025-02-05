Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 824EE2139C9;
	Wed,  5 Feb 2025 07:15:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738739707; cv=none; b=HhWWIs/POAhm1yejXuDZjUB7vzMyfw41eNX33OeCFONcf4kNVfM6rteb1w/EEUgJQ1KGY9IKgJ1feTvyCw2b9ecVhiubjaSL8uEoZjCrV45m8V9L62qS7hKkYkbZAzPnAMQB7s1bsW/p+ZzzoHIcHqlHNN+a83Zgjmuq6R1lzZo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738739707; c=relaxed/simple;
	bh=bxhbtPurnP1W5hy7q1eg97G9bf1DZSWlhNNHDGknTpc=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=X9EZ4RKt720fzJl/lqn8PBBW9sGHtf/K5LdSCm7hSHSJPiERLjrVcTk039Nv+DWzniq6JwobC4odXqOGjAJXnPhQEKkYqmFlBt/74a92/FvGPN4RhE/DB4bTI1MRTE+XEabcnCEWeLxKXysJ0+YpoFZQ7HJ75tEfbyUUeC+dhaA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=DKSMRqa1; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="DKSMRqa1"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D427EC4CED1;
	Wed,  5 Feb 2025 07:15:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1738739706;
	bh=bxhbtPurnP1W5hy7q1eg97G9bf1DZSWlhNNHDGknTpc=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=DKSMRqa1fjaWAlwZui6Qa+2HlLFqk1v5XkS4cm3zK7BrmANbeT2y+oRhSMdqVZvAW
	 UGTg9UJQw3ypY/r7pqcwEMsojwOGb/QjW63twSMB+Ou8eh6uxMhOCRcDlovbZRO1Y6
	 IX5zwUrCsFU569V2aBNBO9kPT0sMFXUXL4dXd72ZRAhGBRfFnb0ey+Z1ksQi95v37A
	 HWQQkFNI7BMEN3bHDN0qbRLbPTTflngqwYgVRmIrMFNNM3jE9FCNjhBOCnj2ru7CBi
	 Bwa+N2DCC37nKc2wnLRQoYPIGlV8sZxG7PJdqieGIOTclMgtZDCf11QLCZj2mRJ/9U
	 35JVT17rIxBSw==
Date: Wed, 5 Feb 2025 08:15:01 +0100
From: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To: Akira Yokosawa <akiyks@gmail.com>
Cc: Jonathan Corbet <corbet@lwn.net>, linux-kernel@vger.kernel.org, Linux
 Doc Mailing List <linux-doc@vger.kernel.org>
Subject: Re: [RFC 1/6] scripts/get_abi.py: make it backward-compatible with
 Python 3.6
Message-ID: <20250205081501.160180bc@foz.lan>
In-Reply-To: <4274a2f8-5ba5-45f3-80c5-2de54c44c06f@gmail.com>
References: <cover.1738166451.git.mchehab+huawei@kernel.org>
	<6d74360f8cdabeb0bf628a6e870d10e134f396f0.1738166451.git.mchehab+huawei@kernel.org>
	<87r04dei1j.fsf@trenco.lwn.net>
	<4274a2f8-5ba5-45f3-80c5-2de54c44c06f@gmail.com>
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-redhat-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

Em Wed, 5 Feb 2025 11:37:52 +0900
Akira Yokosawa <akiyks@gmail.com> escreveu:

> Hi,
> 
> Jonathan Corbet wrote:
> > Mauro Carvalho Chehab <mchehab+huawei@kernel.org> writes:
> >   
> >> Despite being introduced on Python 3.6, the original implementation
> >> was too limited: it doesn't accept anything but the argument.  
> > 
> > The original implementation *of f-strings* ?

Yes. IMO, even the original version of f-strings is better than the legacy
way of using '"string" % (tuple)' or "str.format".

Besides that, there aren't many places where it uses expressions inside
f-strings.

> >   
> >> Even on python 3.10.12, support was still limited, as more complex
> >> operations cause SyntaxError:
> >>
> >> 	Exception occurred:
> >> 	  File ".../linux/Documentation/sphinx/kernel_abi.py", line 48, in <module>
> >> 	    from get_abi import AbiParser
> >> 	  File ".../linux/scripts/get_abi.py", line 525
> >> 	    msg += f"{part}\n{"-" * len(part)}\n\n"
> >>                        ^
> >> 	SyntaxError: f-string: expecting '}'
> >>
> >> Replace f-strings by normal string concatenation when it doesn't
> >> work on Python 3.6.
> >>
> >> Reported-by: Akira Yokosawa <akiyks@gmail.com>  
> 
> You might want to add
> 
> Closes: https://lore.kernel.org/2d4d3fd1-5fe2-4d18-9085-73f9ff930c2d@gmail.com/
> 
> >> Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>  
> > 
> > So I'm curious ... later in the series, you make 3.9 the minimal version
> > for the kernel.  Given that, is there value in adding compatibility for
> > older versions here?  

No because 3.9 is still not enough to accept a valid Python expression on f-strings.
This arrived only on Python 3.12[1]:
	"Expression components inside f-strings can now be any valid Python expression"

So, with this patch, doc build can be using Python 3.6. Still, it makes
sense to move minimal version to 3.9 due to the current status of other
Python scripts. 

[1] https://docs.python.org/3/whatsnew/3.12.html#pep-701-syntactic-formalization-of-f-strings

> I think rewording the summary to
> 
>   "scripts/get_abi.py: make it backward-compatible with Python <3.11"
> 
> would resolve Jon's confusion.

Sure, but IMO it is still valuable to say somewhere that the script
was tested and it is known to work since Python 3.6.

> 
> I haven't looked into python3'changelog, but it might be
> "... backward-compatible with Python <3.12".
> Mauro, which python3 release extended the f-string implementation?

See above. I only did a quick check, but it sounds that 3.12 is the
one that finally implemented f-strings properly in a similar way to
what Perl 5 does with $'expression' inside strings.

Thanks,
Mauro

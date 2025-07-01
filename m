Received: from localhost.localdomain (gate.crashing.org [63.228.1.57])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 060A8274B55
	for <linux-kernel@vger.kernel.org>; Tue,  1 Jul 2025 13:33:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=63.228.1.57
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751376821; cv=none; b=URsrUZdRN4xZ0lHuAc0UQW2enMgHsD0iiqRE4NEOS3PT+Iq6LeBOH3K+LXdSO63KEb00wvo7YR7A4Na75W1lTEKwq8MsAIRUX8HdUJI6Ptkn0S2XRJ7C88kw76SgFI93PctNVSRIvDhN9/YKvlyaZCsWNFp9ttl8YD9SxPdqFJg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751376821; c=relaxed/simple;
	bh=3O9Bocf04cDOQjZf+ATa67M6TGafSS/3zYMlGKvCCPw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=eJlKPSEf8hkvLYxD5JXkvnqMKdS90qV/x6qvs2wXnvJBXn4N+0rvpPWVnMBGUo/y9eNCENlDiAvQY1Vs2ejboXR1pTECqY2NidGODNPRKIf2Lzq/lWPCbHvlCV18VIE5lbpuXGEY+GqjeVRDAjL8sKH1zh+7+W10VNTCVJnJ6Iw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernel.crashing.org; spf=pass smtp.mailfrom=kernel.crashing.org; arc=none smtp.client-ip=63.228.1.57
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernel.crashing.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kernel.crashing.org
Received: from gate.crashing.org (localhost [127.0.0.1])
	by localhost.localdomain (8.18.1/8.18.1/Debian-2) with ESMTP id 561DWwgs128265;
	Tue, 1 Jul 2025 08:32:58 -0500
Received: (from segher@localhost)
	by gate.crashing.org (8.18.1/8.18.1/Submit) id 561DWv95128261;
	Tue, 1 Jul 2025 08:32:57 -0500
X-Authentication-Warning: gate.crashing.org: segher set sender to segher@kernel.crashing.org using -f
Date: Tue, 1 Jul 2025 08:32:57 -0500
From: Segher Boessenkool <segher@kernel.crashing.org>
To: Christophe Leroy <christophe.leroy@csgroup.eu>
Cc: Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>,
        Naveen N Rao <naveen@kernel.org>,
        Madhavan Srinivasan <maddy@linux.ibm.com>,
        linux-kernel@vger.kernel.org, linuxppc-dev@lists.ozlabs.org
Subject: Re: [PATCH] arch/powerpc: Remove .interp section in vmlinux
Message-ID: <aGPjibUcPDubyFY1@gate>
References: <eeaf8fd6628a75d19872ab31cf7e7179e2baef5e.1751366959.git.christophe.leroy@csgroup.eu>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <eeaf8fd6628a75d19872ab31cf7e7179e2baef5e.1751366959.git.christophe.leroy@csgroup.eu>

Hi!

On Tue, Jul 01, 2025 at 12:49:29PM +0200, Christophe Leroy wrote:
> When building with CONFIG_RELOCATABLE, there is a .interp section
> which contains the name of the expected ELF interpreter:
> 
> Contents of section .interp:
>  c0000000021c1bac 2f757372 2f6c6962 2f6c642e 736f2e31  /usr/lib/ld.so.1
>  c0000000021c1bbc 00                                   .
> 
> That information is useless and even likely wrong. Remove it.

s/ likely//

You cannot run the kernel as some dynamic object (under control of some
interpreter that will load DSOs for you), hehe.

The various bfd/elf*.c (in binutils/ld) have code like

  if (htab->elf.dynamic_sections_created)
    {
      /* Set the contents of the .interp section to the interpreter.  */
      if (bfd_link_executable (info) && !info->nointerp)
        {
          s = bfd_get_linker_section (dynobj, ".interp");
          if (s == NULL)
            abort ();
          s->size = sizeof ELF_DYNAMIC_INTERPRETER;
          s->contents = (unsigned char *) ELF_DYNAMIC_INTERPRETER;
        }
    }

(yes there are about a hundred copies of this code, that could be
improved :-) )

whenever producing dynamic objects, so this code just sets that text and
that's all, no side effect to be worried of.

Acked-by: Segher Boessenkool <segher@kernel.crashing.org>

(Maybe this could or should be in generic code though, not architecture
code?)


Segher

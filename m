Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 937D6EEB5
	for <linux-kernel@vger.kernel.org>; Fri,  6 Jun 2025 15:58:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749225537; cv=none; b=EIqBoEhn7EkDkaab4JCinjq74eIu73J69PVR2hYUCv5Z+fwXM4WLlK4zw73TprbtHKS7O0QAd9w56WtCxWYE/PPVzE4cZ0Rv1rtc145QgXUcq977YROzlJT+fPStZHWsR1ePZ+Bppo2p0US1Chng5lLutDBu/kCJ9EnppWhLDcY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749225537; c=relaxed/simple;
	bh=j5TPzlQxuBV7D2im7ELoEsLQzI/C4gvKm5ZmyQfItgg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=hvrTZWOMwbIneveZ+sOucAOS0vSGzDNkhV6+Ucc6umg1s+6YKzNHkgzuA2pQWokYnNErBKxh4POSITgMEwRFO6Ja3hsDqv3knDkXaFZgaSbqqcyUTvFo86g5+jQ307G2VczgFKErxgoxOs4QrwI0ow22HfB507M77+WW3A/0qg4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=kF5cE0eV; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="kF5cE0eV"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 25827C4CEEB;
	Fri,  6 Jun 2025 15:58:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1749225537;
	bh=j5TPzlQxuBV7D2im7ELoEsLQzI/C4gvKm5ZmyQfItgg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=kF5cE0eVIrQ137Xbv0R/q4SW2Otl5PALvUgLPM63wnD2r0zDoChMBeP98jlyRDuIo
	 0pVMMQkriDcltThKwSY5j9PnTgj44QIQg8niB/1gOATubkaEBJDegM3/TBkdTZ7dIi
	 UmaF0QiU4s4x89TkmB6taoN3MCK/KLYvpuIbniQTX+ffpTytkpt3KcSDER0pN8caqp
	 aDt8Tl3f6evYEGkxO34SmbmPA20e0WjmbwadELUt/WJ8MPiHu3gWqdn/wHrh7gd1J+
	 2ld6XvYIBtOEE619E+YvnCFDjwvJT8ZmYSB/KKGSmnVxn9RwKMyhbzhGE3FRAVbhqd
	 lufoEAUnof2FA==
Date: Fri, 6 Jun 2025 08:58:54 -0700
From: Josh Poimboeuf <jpoimboe@kernel.org>
To: Alexandre Chartre <alexandre.chartre@oracle.com>
Cc: linux-kernel@vger.kernel.org, mingo@kernel.org, peterz@infradead.org
Subject: Re: [RFC 00/13] objtool: Function validation tracing
Message-ID: <cqfgywnwfjnyujvgcz63drka47glxj2n7fq5xvhrt74st6xa5w@2bf4vp6duotr>
References: <20250606153440.865808-1-alexandre.chartre@oracle.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250606153440.865808-1-alexandre.chartre@oracle.com>

On Fri, Jun 06, 2025 at 05:34:27PM +0200, Alexandre Chartre wrote:
> Hi,
> 
> This RFC provides two changes to objtool.
> 
> - Disassemble code with libopcodes instead of running objdump
> 
>   objtool executes the objdump command to disassemble code. In particular,
>   if objtool fails to validate a function then it will use objdump to
>   disassemble the entire file which is not very helpful when processing
>   a large file (like vmlinux.o).
> 
>   Using libopcodes provides more control about the disassembly scope and
>   output, and it is possible to disassemble a single instruction or
>   a single function. Now when objtool fails to validate a function it
>   will disassemble that single function instead of disassembling the
>   entire file.

Ah, nice to get rid of that awful objdump hack.

> - Add the --trace <function> option to trace function validation
> 
>   Figuring out why a function validation has failed can be difficult because
>   objtool checks all code flows (including alternatives) and maintains
>   instructions states (in particular call frame information).
> 
>   The trace option allows to follow the function validation done by objtool
>   instruction per instruction, see what objtool is doing and get function
>   validation information. An output example is shown below.

This is pretty freaking awesome!

I assume we could eventually build on this work to have an "objtool
disas" subcommand, which would basically be an improved "objdump -d"
which annotates alternatives and other runtime patching.

-- 
Josh

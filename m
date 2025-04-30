Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CFC122DC760;
	Wed, 30 Apr 2025 15:42:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746027777; cv=none; b=WwD855ddNyPksHBr2O3rPXc4mMLxBdZWULdQ8tgSyTcD2QWZzj/9VQdBo7a1FqOA9Bkm3r0cx9KbqFkRRpW2kbBADQegysnCOun9Vl+JC+6cgBDBIWeSS2j/oPbqKLMk8ZkvQG+ubI1s4T/cfJuFeVaSjpbjCJJRjuIFCCncqlI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746027777; c=relaxed/simple;
	bh=cJQDxqBbZMGtPjZQq2+K0iYdq6ngOwnw5OlxsKKMBvE=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Kd4TxtLjxI7gQnXLgd7iMDSwOChBNF9rVOdCgzmW0Wx3M9TPJQQEbbVFqxNwYHFi/r6Y8yAOpoL3dJZOJwRHuOcwzTOYZi4zmMcgWw2o2FJWXoEam4Nr2R63as9lmeeNiuCy9oX9j7MdLmk6IMDycj7VxZ/YSguH0DQRjNsd2dI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=AXqeDL+P; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="AXqeDL+P"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D30F9C4CEE7;
	Wed, 30 Apr 2025 15:42:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1746027777;
	bh=cJQDxqBbZMGtPjZQq2+K0iYdq6ngOwnw5OlxsKKMBvE=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=AXqeDL+PSRG3Tc0f5RPIDwibMfgJnHJ97BlHFUG+jIJh1ZkIL7TcFZ2MMjMticjnB
	 dtWlc6HYRG8E+qsdL/7tVLhpVgI03ae7hGQq95+fzTWB40/03WSOf/GE8SJnOWDEv6
	 bSNC/XU32M1v7j7xrEO3kjmWMTJ6JLXak8LvCzej5FqgUGtTBPU6dv72c8akfR/tPT
	 TTnPtJEGNoxbQE8YDfXStSFaMBIc4Ls0wHfcXS+2wCXqvdlRMwZncd/CiNLP9sQnSP
	 rJ2FXyxPGFycantwUzUaSZr1+fi3qYpVzTlFSByav3lcNjieWWVI14t0yW7TFI+/YD
	 NFdRILUHytf9Q==
Date: Wed, 30 Apr 2025 17:42:52 +0200
From: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To: Jonathan Corbet <corbet@lwn.net>
Cc: Andy Shevchenko <andriy.shevchenko@intel.com>, Linux Doc Mailing List
 <linux-doc@vger.kernel.org>, Akira Yokosawa <akiyks@gmail.com>,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/1] docs: Makefile: store __pycache__ at the output
 directory
Message-ID: <20250430174252.1c3b3e09@foz.lan>
In-Reply-To: <87jz73rg9n.fsf@trenco.lwn.net>
References: <cover.1745539360.git.mchehab+huawei@kernel.org>
	<1b9e7f34c1d99a27a8abb308da3221b4663b5693.1745539360.git.mchehab+huawei@kernel.org>
	<aAvQFen6D5ukjj-x@smile.fi.intel.com>
	<87jz73rg9n.fsf@trenco.lwn.net>
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.49; x86_64-redhat-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

Em Mon, 28 Apr 2025 17:57:24 -0600
Jonathan Corbet <corbet@lwn.net> escreveu:

> Andy Shevchenko <andriy.shevchenko@intel.com> writes:
> 
> > On Fri, Apr 25, 2025 at 08:08:53AM +0800, Mauro Carvalho Chehab wrote:  
> >> Instead of blocking creation of *.pyc cache, store python
> >> cache under Documentation/output/__pycache__  
> >
> > Do we need the below in the commit message?
> > I think having statistics is enough and this can be moved to the cover letter.  

Yeah, agreed.

> I agree, that was a lot of stuff to get to a one-line fix; I took the
> liberty of trimming the tree listing out.

Fine for me. 

> 
> Applied, thanks.

Thanks!

Mauro

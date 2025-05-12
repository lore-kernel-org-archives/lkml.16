Received: from angie.orcam.me.uk (angie.orcam.me.uk [78.133.224.34])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8B81629374F
	for <linux-kernel@vger.kernel.org>; Mon, 12 May 2025 12:55:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=78.133.224.34
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747054540; cv=none; b=fYJxmvFAdFCJ6RSGUQKUrx8tcYW1R6iIPOnsXR84IoIrQE1Yw2SbAZ6oofYWQQ3tAwqS+dscHG/91qdVIHqvVlSPAP6IarzgKcdf8kIEPpdVLppH72iK/hCGRGShoSO/SBVyVRJcD59iIhxtQeIL4EGLHuta2etOZMeph1c2C4E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747054540; c=relaxed/simple;
	bh=EhSs3UohoknGDq4l1x0IVmvgSUiwbU/UB6OmLsIQocM=;
	h=Date:From:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=iS/Ff/WfZJkC+aQx30g8hVYnAdmI/5gpIWGpWcPlGmRm63AGcP1guC7GriSsoQY38P/boQOuMU4xLuqcCBc5gxvZKBa9QQtR/a3d+2C28nxxf0h4Pw/yPi+BC/qJf45QMeg9pCpqI4qtelviWb2mS6t1KDy2F4C/IG5C+pExO0w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=orcam.me.uk; spf=none smtp.mailfrom=orcam.me.uk; arc=none smtp.client-ip=78.133.224.34
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=orcam.me.uk
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=orcam.me.uk
Received: by angie.orcam.me.uk (Postfix, from userid 500)
	id 6E9DF92009B; Mon, 12 May 2025 14:55:35 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by angie.orcam.me.uk (Postfix) with ESMTP id 6C71692009C;
	Mon, 12 May 2025 13:55:35 +0100 (BST)
Date: Mon, 12 May 2025 13:55:35 +0100 (BST)
From: "Maciej W. Rozycki" <macro@orcam.me.uk>
To: Borislav Petkov <bp@alien8.de>
cc: "H. Peter Anvin" <hpa@zytor.com>, Ingo Molnar <mingo@kernel.org>, 
    linux-kernel@vger.kernel.org, "Ahmed S . Darwish" <darwi@linutronix.de>, 
    Andrew Cooper <andrew.cooper3@citrix.com>, 
    Ard Biesheuvel <ardb@kernel.org>, Arnd Bergmann <arnd@kernel.org>, 
    Dave Hansen <dave.hansen@linux.intel.com>, 
    John Ogness <john.ogness@linutronix.de>, 
    Linus Torvalds <torvalds@linux-foundation.org>, 
    Peter Zijlstra <peterz@infradead.org>, 
    Thomas Gleixner <tglx@linutronix.de>, 
    John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>
Subject: Re: [RFC PATCH 0/15] x86: Remove support for TSC-less and CX8-less
 CPUs
In-Reply-To: <8C172B63-38E1-427B-8511-25ECE5B9E780@alien8.de>
Message-ID: <alpine.DEB.2.21.2505121225000.46553@angie.orcam.me.uk>
References: <20250425084216.3913608-1-mingo@kernel.org> <alpine.DEB.2.21.2505050944230.31828@angie.orcam.me.uk> <98C88CE8-C3D5-4B75-8545-71DD47C67614@zytor.com> <alpine.DEB.2.21.2505051356340.31828@angie.orcam.me.uk> <1E50C160-EB89-4C5C-B9F0-6441026EE380@zytor.com>
 <20250505205405.GNaBklbdKLbadRATbr@fat_crate.local> <alpine.DEB.2.21.2505060059010.31828@angie.orcam.me.uk> <20250506141631.GEaBoZvzPCWh88xDzu@fat_crate.local> <alpine.DEB.2.21.2505062228200.21337@angie.orcam.me.uk>
 <8C172B63-38E1-427B-8511-25ECE5B9E780@alien8.de>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Thu, 8 May 2025, Borislav Petkov wrote:

> > NB people also fancy old cars, or boats, or trains even, not because 
> >they're faster, more comfortable, or have any real advantage over modern 
> >alternatives.
> 
> 
> This fits very well, IMO, with Linus' suggestion to support this stuff 
> out of tree. I think this solution is the optimal one for all parties 
> involved...

 Would kernel.org git infrastructure be available for such a project?

  Maciej

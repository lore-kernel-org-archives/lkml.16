Received: from angie.orcam.me.uk (angie.orcam.me.uk [78.133.224.34])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1DE521F130B
	for <linux-kernel@vger.kernel.org>; Sun,  1 Jun 2025 17:43:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=78.133.224.34
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748799813; cv=none; b=mN1KCkdHITtCVbkx0Y8WA2l7fqAEjtbIbmysDl/NPvHz5fYrRM9yM8zwTOcKeYK6YmdM+YE+c8QcjiN/x+KQ76qhnQquaNpTPVN6FcH8GQKyFooSLkdIs2wCxpNPIKCamK0axduvhpDMKOD3DWMcpouzc3Ahemvi0Cy8Sv8uWfc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748799813; c=relaxed/simple;
	bh=Zz8e06YVeWDcGKPw8DWhq8/H0GPysOm4s9w93yWdqjw=;
	h=Date:From:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=HjAXlwkzE034tXFfs0eiXlEG8gRn4ONPKVy1oA4nPVtXOvkiIYy5UqqA6iUVRCngyKKR4ki0HycZ1Iu8dSypXg3JA4AvQ+PkKrhYucRkguMehbZFrM33DTSrsmfTf83av7S5IJMJwMwMAknxJtYop9Z4Yxd3aTK4xXc5eYEHu5k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=orcam.me.uk; spf=none smtp.mailfrom=orcam.me.uk; arc=none smtp.client-ip=78.133.224.34
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=orcam.me.uk
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=orcam.me.uk
Received: by angie.orcam.me.uk (Postfix, from userid 500)
	id 3404292009D; Sun,  1 Jun 2025 19:35:13 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by angie.orcam.me.uk (Postfix) with ESMTP id 2631792009B;
	Sun,  1 Jun 2025 18:35:13 +0100 (BST)
Date: Sun, 1 Jun 2025 18:35:13 +0100 (BST)
From: "Maciej W. Rozycki" <macro@orcam.me.uk>
To: David Laight <david.laight.linux@gmail.com>
cc: =?UTF-8?Q?Cl=C3=A9ment_L=C3=A9ger?= <cleger@rivosinc.com>, 
    linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
    Paul Walmsley <paul.walmsley@sifive.com>, 
    Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
    Alexandre Ghiti <alex@ghiti.fr>
Subject: Re: [PATCH 2/2] riscv: uaccess: do not do misaligned accesses in
 get/put_user()
In-Reply-To: <20250531192801.5d6329c3@pumpkin>
Message-ID: <alpine.DEB.2.21.2506011830130.28395@angie.orcam.me.uk>
References: <20250530205658.624195-1-cleger@rivosinc.com> <20250530205658.624195-3-cleger@rivosinc.com> <20250531192801.5d6329c3@pumpkin>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Sat, 31 May 2025, David Laight wrote:

> > Such behavior was detected with GET_UNALIGN_CTL() that was doing
> > a put_user() with an unsigned long* address that should have been an
> > unsigned int*. Reenabling kernel misaligned access emulation is a bit
> > risky and it would also degrade performances. Rather than doing that,
> > we will try to avoid any misaligned accessed by using copy_from/to_user()
> > which does not do any misaligned accesses. This can be done only for
> > !CONFIG_HAVE_EFFICIENT_UNALIGNED_ACCESS and thus allows to only generate
> > a bit more code for this config.
> 
> For get_user() you are much better off reading the two words that contain
> the value and then doing 'shift' and 'or' to get the correct value.
> 
> Even for put_user() doing the explicit byte accesses will be faster than
> going though the generic copy_to/from_user() function.

 FWIW I think optimising copy_to/from_user for such cases would be a more 
robust approach moving forward than sprinkling open-coded implementations 
across code.

  Maciej

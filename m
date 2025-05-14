Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 61C9483A14;
	Wed, 14 May 2025 07:41:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747208482; cv=none; b=fYOzKlHECPTac+JEjlw+HWvJdItj1llfc2daDZz74F010x2OGpVpk7kI9cv6b6KBzo/NiZ9TTFrp9rhM4ebsLBSmPgDmHcZae9dW3T/bBGXg7lzJtDr/ufFJ6cC3eK4W6aj23hcjiGRkejNw3VE/2PwYaA/YtxHfvFejdpTBs+s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747208482; c=relaxed/simple;
	bh=JsiVAsFG1XKaIWx9sq38p2xafzRumZE3uqYzsBqzHes=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ejzVmXW2rRrndUytHBms1TGV34Ov+vBkZq117BzS8NVuRjGF3M2jP8PJTahpwE2P1awllI9x5CXL9DppXENMs8IvNJUllLqeUDHtUHd8pLJW7H1N6+7TVCojvguZFmXbGxT1jHeySMRiU+MyCOYuiI+2Ygj1ReGrIh/M9/g+vwg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4043EC4CEF3;
	Wed, 14 May 2025 07:41:20 +0000 (UTC)
Date: Wed, 14 May 2025 09:39:33 +0200
From: Greg KH <greg@kroah.com>
To: Eric Biggers <ebiggers@kernel.org>
Cc: Thomas Gleixner <tglx@linutronix.de>, linux-kernel@vger.kernel.org,
	Ard Biesheuvel <ardb@kernel.org>, linux-spdx@vger.kernel.org
Subject: Re: [PATCH] lib/crc32: add SPDX license identifier
Message-ID: <2025051423-gallstone-carpentry-1c5a@gregkh>
References: <20250514052409.194822-1-ebiggers@kernel.org>
 <87bjrvk9gj.ffs@tglx>
 <20250514061425.GA237199@sol>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250514061425.GA237199@sol>

On Tue, May 13, 2025 at 11:14:25PM -0700, Eric Biggers wrote:
> On Wed, May 14, 2025 at 08:11:40AM +0200, Thomas Gleixner wrote:
> > On Tue, May 13 2025 at 22:24, Eric Biggers wrote:
> > 
> > > From: Eric Biggers <ebiggers@google.com>
> > >
> > > lib/crc32.c and include/linux/crc32.h got missed by the bulk SPDX
> > > conversion because of the nonstandard explanation of the license.
> > > However, crc32.c clearly states that it's licensed under the GNU General
> > > Public License, Version 2.  And the comment in crc32.h clearly indicates
> > > that it's meant to have the same license as crc32.c.  Therefore, apply
> > > SPDX-License-Identifier: GPL-2.0-only to both files.
> > >
> > > Signed-off-by: Eric Biggers <ebiggers@google.com>
> > 
> > Reviewed-by: Thomas Gleixner <tglx@linutronix.de>
> 
> Thanks.
> 
> I forgot to mention: I'm planning to take this patch through the crc tree.

Great!

Reviewed-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>

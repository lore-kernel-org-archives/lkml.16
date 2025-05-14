Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B1BC1E5734;
	Wed, 14 May 2025 06:14:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747203273; cv=none; b=m3T2g+jwWR+jL7xKn/T76dV5CKM3qfgVnhJtTu3ZpENuvK7STh7N/ju1ALlfHaS0OV0vpZi+uK469SdKX7atCBCYRR7rAZQQujFox/ypfZxiei4mNBu5zkCnr6swMCN9fjz0OKO7UBjo6h8hIvxsI9pSlyLjyaT9s2kNFZPo+yY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747203273; c=relaxed/simple;
	bh=NuwWWHYzNw6teorTXRaKxlO2wDN676m7pABvKMLgQKQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=mUAJ5eFDvSuc4JKM4dtlJGhlqAnMKkpfUnhdlb6DISjdFAcsSxtDja/Zqr9b2m4z3khM8N32JVNT8nCwvAc2PmvcqSmwVHsq7ijoi4fouZeqYUovjPo9URyWvqEA0dP1PTimcjqgPXhGyK/3ztOYDZGVqFx8ptGMJHB13uOPuFI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=g7Nkxql7; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="g7Nkxql7"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BE72FC4CEE9;
	Wed, 14 May 2025 06:14:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747203272;
	bh=NuwWWHYzNw6teorTXRaKxlO2wDN676m7pABvKMLgQKQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=g7Nkxql7UkIOb2dyWNyMZCDiATfWRsh6tRuA89bW9LSZwL1pCuZsYWRbWrplzzvoS
	 /7GqPARlUQwp8Rmrvap1SGSMC/xNV2Nc6xBSa9EePjPTLDmzdxVzrpuEbeTknIOO1A
	 /YC88wIbr+f6FddI+XpYcN76OnfmQ1re19WT/FcPgJn/NoU+S3PYExZmbwDsE4pqp5
	 a/5dZJY3l8ehrYw9ciqgoWnKoT0xz33rGVzCgrsh0EKb18iZTEgoe7KhJt5ZBMBCqz
	 qyZ46npP+Mjfye7zUm0SxDDWZb7lSJ3bS9Xt/ll5kNiJWq9OdKjrahz9sqR2QwpCFb
	 SpYmkLp3i4Yrw==
Date: Tue, 13 May 2025 23:14:25 -0700
From: Eric Biggers <ebiggers@kernel.org>
To: Thomas Gleixner <tglx@linutronix.de>
Cc: linux-kernel@vger.kernel.org, Ard Biesheuvel <ardb@kernel.org>,
	linux-spdx@vger.kernel.org
Subject: Re: [PATCH] lib/crc32: add SPDX license identifier
Message-ID: <20250514061425.GA237199@sol>
References: <20250514052409.194822-1-ebiggers@kernel.org>
 <87bjrvk9gj.ffs@tglx>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <87bjrvk9gj.ffs@tglx>

On Wed, May 14, 2025 at 08:11:40AM +0200, Thomas Gleixner wrote:
> On Tue, May 13 2025 at 22:24, Eric Biggers wrote:
> 
> > From: Eric Biggers <ebiggers@google.com>
> >
> > lib/crc32.c and include/linux/crc32.h got missed by the bulk SPDX
> > conversion because of the nonstandard explanation of the license.
> > However, crc32.c clearly states that it's licensed under the GNU General
> > Public License, Version 2.  And the comment in crc32.h clearly indicates
> > that it's meant to have the same license as crc32.c.  Therefore, apply
> > SPDX-License-Identifier: GPL-2.0-only to both files.
> >
> > Signed-off-by: Eric Biggers <ebiggers@google.com>
> 
> Reviewed-by: Thomas Gleixner <tglx@linutronix.de>

Thanks.

I forgot to mention: I'm planning to take this patch through the crc tree.

- Eric

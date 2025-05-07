Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6DB2128FFE1
	for <linux-kernel@vger.kernel.org>; Wed,  7 May 2025 21:50:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746654620; cv=none; b=j8YyltSHKxEghvvSgDaHf3HtxpUn9VUhOZe/02adNwhqWZVSLkA/0QwUglY6LjHbMZpD8ABr6NqwEeAnXuXUlacyqqmgTvxG2og4vwP1otmzUDtQauMg3auaH4hOD/Qr0KZB+3SpOagVkXIv4NudPqpcWaV6YOqlFlveZdV3w5g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746654620; c=relaxed/simple;
	bh=qIrlVTpbd0u7NHSHvM5pXOAdveX19bb6j18J5nkn3dM=;
	h=Date:From:To:Cc:Subject:Message-Id:In-Reply-To:References:
	 Mime-Version:Content-Type; b=BLktBP8AUMNZ1zY7pmDb19lC4v9hr3sW01dmsvxFrVlf+ZFOAB6JvJEYtg4Cqk8zRNM97UJPFyyYHQuIra/eTjTJDD6dB0E7kGTyV8eOuSCq+2N8sQEGBvIIEhTN1p7vM4ZkuX2a2nx1ORPkpe1sjOXU9WOoJTZRWW8HfoUEOhQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b=Q5Oe93SU; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="Q5Oe93SU"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9B507C4CEE2;
	Wed,  7 May 2025 21:50:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linux-foundation.org;
	s=korg; t=1746654619;
	bh=qIrlVTpbd0u7NHSHvM5pXOAdveX19bb6j18J5nkn3dM=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=Q5Oe93SUJoRxpOC/5SMkA33Wwq0xOL/XOsCpvnmBXesXXS3ZsXUc/ZDLw2UvQCwIT
	 nrddzYjjJvMC8sNrSiV3vBI9gCFje6HKLcgOlPapUO0hQqVrsfvs4wcTXJ/v5TPvEu
	 DBh8IR8uZAqNL/5ZCk5ydMBsoePOEhzyzXYt+Mu8=
Date: Wed, 7 May 2025 14:50:18 -0700
From: Andrew Morton <akpm@linux-foundation.org>
To: Pantelis Antoniou <p.antoniou@partner.samsung.com>
Cc: <linux-mm@kvack.org>, <linux-kernel@vger.kernel.org>, Artem Krupotkin
 <artem.k@samsung.com>, Charles Briere <c.briere@samsung.com>, Wade
 Farnsworth <wade.farnsworth@siemens.com>
Subject: Re: [PATCH 0/1] Fix zero copy I/O on __get_user_pages allocated
 pages
Message-Id: <20250507145018.385c0a090a0d61c06e985ad9@linux-foundation.org>
In-Reply-To: <20250507154105.763088-1-p.antoniou@partner.samsung.com>
References: <CGME20250507154119uscas1p2a4055d14ab111fdb94a6378789c38d9d@uscas1p2.samsung.com>
	<20250507154105.763088-1-p.antoniou@partner.samsung.com>
X-Mailer: Sylpheed 3.7.0 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Wed, 7 May 2025 10:41:04 -0500 Pantelis Antoniou <p.antoniou@partner.samsung.com> wrote:

> Updates to network filesystems enabled zero copy I/O by using the
> netfslib common accessors.

Updates by whom?  Are all the people who need to know about this being
cc'ed here?

> One example of that is the 9p filesystem which is commonly used in qemu
> based setups for sharing files with the host.
> 
> In our emulation environment we have noticed failing writes when performing
> I/O from a userspace mapped DRM GEM buffer object.
> The platform does not use VRAM, all graphics memory is regular DRAM memory,
> allocated via __get_free_pages

We should identify which kernel version(s) should be patched, please. 
6.16-rc1?  6.15?  -stable?

I often make these decisions but in this case I have far too little
information to be able to do that.

Thanks.

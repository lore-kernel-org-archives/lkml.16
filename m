Received: from smtp.gentoo.org (woodpecker.gentoo.org [140.211.166.183])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A886E1FAC48
	for <linux-kernel@vger.kernel.org>; Thu, 12 Jun 2025 09:32:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.183
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749720754; cv=none; b=ranFVQ1wMLT3a7pg4M1HyDpCYAX+S/LmwkTBtAq7VP+xHhpIGL97h8xrqOULGSgCr+7eeaVsC1QQdTC+Zqk4Ns5r73lzqooCHL6a/+7rWBi3WQY7XuNQfRVI3PejyfdlNI0fesCBWYl9455BOZR/BOe1dFJbFcHqsnz8FaGjOJs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749720754; c=relaxed/simple;
	bh=wH5Fy+qrMWe3paSE72JRpYwIt7sTYIFHs+3+NRuFb/g=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=o+YqUq6fEd7BAsGWwo6vePOrDe/plQwt5Zl36fvjDBAfIrw2QgKflrie9URJ2llanXLCmaRYWWzeNYb9mqTk4Bqvld5hzsPscss3gnvdFq3Vw76e6BdgpZT7+ymRYw3EJ4+wqE+pMah9pofZ8OOz8X2PW5xjkJEKsMY55vWER4Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gentoo.org; spf=pass smtp.mailfrom=gentoo.org; arc=none smtp.client-ip=140.211.166.183
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gentoo.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gentoo.org
Received: from localhost (unknown [116.232.147.71])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange secp256r1 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: dlan)
	by smtp.gentoo.org (Postfix) with ESMTPSA id 9C6FF341E6A;
	Thu, 12 Jun 2025 09:32:31 +0000 (UTC)
Date: Thu, 12 Jun 2025 09:32:27 +0000
From: Yixun Lan <dlan@gentoo.org>
To: Alexandre Ghiti <alex@ghiti.fr>
Cc: Conor Dooley <conor@kernel.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Guodong Xu <guodong@riscstar.com>, linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org, spacemit@lists.linux.dev
Subject: Re: [PATCH] riscv: defconfig: run savedefconfig to reorder it
Message-ID: <20250612093227-GYA130879@gentoo>
References: <20250611-01-riscv-defconfig-v1-1-b48fc3517498@gentoo.org>
 <92faa45d-0f3a-4bb6-afae-180c2b28fb65@ghiti.fr>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <92faa45d-0f3a-4bb6-afae-180c2b28fb65@ghiti.fr>

Hi Alexandre,

On 10:37 Thu 12 Jun     , Alexandre Ghiti wrote:
> Hi Yixun,
> 
> On 6/11/25 16:56, Yixun Lan wrote:
> > Changes to defconfig should be always updated via 'make
> > savedefconfig', run this command to make it aligned again.
> >
> > This will ease the effort of reviewing changes of defconfig
> > in the future.
> >
> > Signed-off-by: Yixun Lan <dlan@gentoo.org>
> > ---
> > Update PDMA config bring in unnecessary changes[1], let's fix
> > it by run savedefconfig first.
> 
> 
> It would be easier if this patch was part of the PDMA series since the 
> last patch will depend on it: @Guodong can you integrate this patch to 
> your next revision of your patchset?
> 
I'd rather make this patch independent, as nothing strongly ralated with PDMA,
and it probably would take several rounds for PDMA patch to be settled down..

Besides, there is no problem for PDMA patch to depend on this patch if
needed (easy to use b4 to handle this..)

The idea here is to get this patch merged as early as possible, as it's
quite straightforward, and other people may have similar problem instead
of PDMA here

> Thanks,
> 
> Alex
> 

-- 
Yixun Lan (dlan)

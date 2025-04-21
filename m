Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B454614883F
	for <linux-kernel@vger.kernel.org>; Mon, 21 Apr 2025 18:26:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745260011; cv=none; b=JOrcYaT3+jE+Qgff8Dmf6l4awcSJfKwr2n+jEIJBhoGXH9uM1XgUvV+t6t2BAoBTKFqm7gTkBnRxYPy86OsxGHLdyFkM0gQrEjQXujjQP6blSePECxCHSIWAse8muJTxDbL7hMKOxmiREkxTEz87hfodNm0EitQNIflqpZmiIkg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745260011; c=relaxed/simple;
	bh=abb8lHtjBmp/3FXlq9AafpfoQuPpkv881qkgqjb9Rsk=;
	h=Date:From:To:Cc:Subject:Message-Id:In-Reply-To:References:
	 Mime-Version:Content-Type; b=CIQaeIWL1M9XmKTlWKFKxkUJ4ssKDYAdC8cu3SSvmTvjdFlqqt5QglY+VfRTWSWJKyk4HWHVIl0F0y1zzhk0GyT09ml0Wxn2T5Y6oxE2pNZzCTiW1VmgfIqkZO0RBWknfH3tjZJZthyEiRbQZbwxU8ZvX6Pi4lFpw2noTkHWuEs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b=PPguWuDx; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="PPguWuDx"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EF368C4CEE4;
	Mon, 21 Apr 2025 18:26:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linux-foundation.org;
	s=korg; t=1745260011;
	bh=abb8lHtjBmp/3FXlq9AafpfoQuPpkv881qkgqjb9Rsk=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=PPguWuDxV90WFW4FyKTJraT08uHhvn0/gt+Plk+13SLUmCX7/Oc9r6Zj7Z2tT4IK1
	 hraku9eA24FpFJw9I6qP+3wMZIcWV21rux5ALfze4LNKVTQisK725WzSnPy2rzCr0b
	 55ifH/89+CEiDxP+pjauFr8TcBnlUKGKuha7TaQA=
Date: Mon, 21 Apr 2025 11:26:50 -0700
From: Andrew Morton <akpm@linux-foundation.org>
To: Mike Rapoport <rppt@kernel.org>
Cc: Ruihan Li <lrh2000@pku.edu.cn>, linux-mm@kvack.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] mm/mm_init: Don't iterate pages below
 ARCH_PFN_OFFSET
Message-Id: <20250421112650.4fe689205944ccdaf078ca28@linux-foundation.org>
In-Reply-To: <aAZzzVDsmtqP3uAg@kernel.org>
References: <20250419122801.1752234-1-lrh2000@pku.edu.cn>
	<20250420135709.732883ee775ad8b41fb668ca@linux-foundation.org>
	<aAZzzVDsmtqP3uAg@kernel.org>
X-Mailer: Sylpheed 3.8.0beta1 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Mon, 21 Apr 2025 19:35:25 +0300 Mike Rapoport <rppt@kernel.org> wrote:

> On Sun, Apr 20, 2025 at 01:57:09PM -0700, Andrew Morton wrote:
> > On Sat, 19 Apr 2025 20:28:01 +0800 Ruihan Li <lrh2000@pku.edu.cn> wrote:
> > 
> > > If ARCH_PFN_OFFSET is very large (e.g., something like 2^64-2GiB if the
> > > kernel is used as a library and loaded at a very high address), the
> > > pointless iteration for pages below ARCH_PFN_OFFSET will take a very
> > > long time, and the kernel will look stuck at boot time.
> > > 
> > > This commit sets the initial value of pfn_hole to ARCH_PFN_OFFSET, which
> > > avoids the problematic and useless iteration mentioned above.
> > > 
> > > This problem has existed since commit 907ec5fca3dc ("mm: zero remaining
> > > unavailable struct pages").
> > > 
> > > Signed-off-by: Ruihan Li <lrh2000@pku.edu.cn>
> > > ---
> > > Link to v1:
> > >  - https://lore.kernel.org/linux-mm/20250418162727.1535335-1-lrh2000@pku.edu.cn/
> > > Changes since v1:
> > >  - Removed the unnecessary Fixes tag.
> > 
> > Why was the Fixes: considered unnecessary?  It seems to be useful
> > information?
> 
> I didn't think it was important enough for AUTOSEL to pick it. 

They've been asked not to backport MM patches unless they have an
explicit cc:stable.


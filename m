Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C8EF22D4E2
	for <linux-kernel@vger.kernel.org>; Thu, 29 May 2025 15:24:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748532241; cv=none; b=U6POD4rnTRvtSxM4t3ErkSFkqDFS5Uy8UuWCh+5RsdBTmkeLIKUHA1G8mlE43sMDsJfa/R3VRlDjsNLTuKUsk85SdUqIRvgKUCfKPegT8XNXk+foQAxT9ZDg6oMzq2HJuAdlGh1xCyDnV+EgU+/bPl2yBY4y4obuTXG777DwMs8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748532241; c=relaxed/simple;
	bh=iFaG109SaZZyJtIhhQLoZNfUjcmAYP1IouqgHceBhBc=;
	h=Date:From:To:Cc:Subject:Message-Id:In-Reply-To:References:
	 Mime-Version:Content-Type; b=VDCg/QE1MwpXUN+2Vvwrp4QSx723n9aYym59HbOY+AmZYbgqEbrril05PtX0bRjU+67RriE4psgxnNMnxi+UbPwMA1+czTAcf0YQJ9bp8TPBSF/bbNlUEPfRPOATaJkByofrTCkERWmd9lTUdrdKUURl4+BxOtaQ33O2Zr7k+Hs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b=mDbWrNSY; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="mDbWrNSY"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7635EC4CEE7;
	Thu, 29 May 2025 15:24:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linux-foundation.org;
	s=korg; t=1748532240;
	bh=iFaG109SaZZyJtIhhQLoZNfUjcmAYP1IouqgHceBhBc=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=mDbWrNSY+Kl/BF4uQ5J/7cZHP003W8AXHtamXiSXlH/wbqx5GJCQJIUCKRCvHTD0i
	 6/MRf6dosD+gJwJLo/kU3IZeQOo8KrYE4Fkcb4sYQZHDmdPaZiCKtGuFBzdb6aPRHV
	 X2zrEAmagBg0W1P3OJXJa45cODAqTL63uRMcy79c=
Date: Thu, 29 May 2025 08:23:59 -0700
From: Andrew Morton <akpm@linux-foundation.org>
To: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
Cc: Lorenzo Stoakes via B4 Relay
 <devnull+lorenzo.stoakes.oracle.com@kernel.org>, "Liam R. Howlett"
 <Liam.Howlett@oracle.com>, Vlastimil Babka <vbabka@suse.cz>, Jann Horn
 <jannh@google.com>, Pedro Falcato <pfalcato@suse.de>, linux-mm@kvack.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH] tools/testing/vma: add missing function stub
Message-Id: <20250529082359.ebf2a908e068ed3ffc8027f9@linux-foundation.org>
In-Reply-To: <8bcf5f5a-a4e6-41cb-84a8-e2919b0785cb@lucifer.local>
References: <20250528-fix-vma-test-v1-1-c8a5f533b38f@oracle.com>
	<20250528155218.a8b755912d1eed25148c59b4@linux-foundation.org>
	<8bcf5f5a-a4e6-41cb-84a8-e2919b0785cb@lucifer.local>
X-Mailer: Sylpheed 3.8.0beta1 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Thu, 29 May 2025 06:39:09 +0100 Lorenzo Stoakes <lorenzo.stoakes@oracle.com> wrote:

> On Wed, May 28, 2025 at 03:52:18PM -0700, Andrew Morton wrote:
> > On Wed, 28 May 2025 15:15:39 +0100 Lorenzo Stoakes via B4 Relay <devnull+lorenzo.stoakes.oracle.com@kernel.org> wrote:
> >
> > > From: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
> > >
> > > The hugetlb fix introduced in commit ee40c9920ac2 ("mm: fix copy_vma()
> > > error handling for hugetlb mappings") mistakenly did not provide a stub for
> > > the VMA userland testing, which results in a compile error when trying to
> > > build this.
> >
> > Thanks, I'll add the Fixes: and the cc:stable (because ee40c9920ac2 had
> > cc:stable).
> 
> Yeah I intentionally excluded those, as it'll lead to some backport pain
> for something that isn't shipped.
> 
> I'm not sure if we generally backport test fixes as a rule? Though I
> suppose it might be useful if somebody is investigating an issue in a
> stable kernel.

I do like to backport selftests fixes if doing so avoids bogus failures
and especially if they fix build breakage.

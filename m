Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B691C7FD;
	Wed, 28 May 2025 00:03:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748390631; cv=none; b=s3cA9uVZCU89iFn3ods54NU8GLg1zbEQheY4QuagWUexVObEMkuZjkDaa9xOB5YqwiYmxjla5n6XotM7wLAVsr5LWuj9ZWv0MyDyiCtmu5z7HIxEgFnNoG32CdzDqLX3xpklWhQO34FZk2HLeTV6SAo1+n6GM4RFbAqCaYqz1ME=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748390631; c=relaxed/simple;
	bh=i2AzRVeEErFRHIgUttaiRifouTs9OP7lzL2wPaLrh74=;
	h=Date:From:To:Cc:Subject:Message-Id:In-Reply-To:References:
	 Mime-Version:Content-Type; b=FkBh3QJJe88OLd2UZ12ed1LddBLtiL5oPlGSOOTfpktJexZin6nbIY8CpaQHxiiNblpeGgwBifaMCQ7xHr+12yp7c0Zcht4kYw7fS0SdtB/Zj2uTYb7/o5ghSRPlO3lPnKQY2CVkhS4jEgCxr2RBstjryKwN/wcjMRNwwaHgfKU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b=W2Yrt4de; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="W2Yrt4de"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D8862C4CEE9;
	Wed, 28 May 2025 00:03:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linux-foundation.org;
	s=korg; t=1748390630;
	bh=i2AzRVeEErFRHIgUttaiRifouTs9OP7lzL2wPaLrh74=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=W2Yrt4debgjw2oNt4JvY5A/dSbTzcsRIOwcx6rC/dm1nPbImHaGiWjC7l2RkBGFJ+
	 b8YT3sSe1xk3xlACXZBH3OryZhaQl93Qd6mMb6vG4hFFncYbJLBrdnu4UeM1ZdiJY6
	 oHFuY4anvbcmNywH8sQNK0CCBbCLUJ5IaYmhbukA=
Date: Tue, 27 May 2025 17:03:49 -0700
From: Andrew Morton <akpm@linux-foundation.org>
To: Dan Carpenter <dan.carpenter@linaro.org>
Cc: oe-kbuild@lists.linux.dev, Yu Zhao <yuzhao@google.com>, lkp@intel.com,
 oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org, Linux Memory
 Management List <linux-mm@kvack.org>
Subject: Re: mm/vmscan.c:3504 walk_pte_range() error: uninitialized symbol
 'dirty'.
Message-Id: <20250527170349.4eb72b40e4c6e2a6c1c6bce6@linux-foundation.org>
In-Reply-To: <aDRfak8sX1Pf53Pg@stanley.mountain>
References: <202505152339.fBOfDPsi-lkp@intel.com>
	<20250523152705.2ecae09e834c66e1327d6748@linux-foundation.org>
	<aDRfak8sX1Pf53Pg@stanley.mountain>
X-Mailer: Sylpheed 3.8.0beta1 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Mon, 26 May 2025 15:32:42 +0300 Dan Carpenter <dan.carpenter@linaro.org> wrote:

> > Seems to be notabug because last==NULL on the first loop and in this
> > case walk_update_folio() will immediately return without touching
> > `dirty'.   But gee, I can't blame smatch from getting fooled by this.
> 
> That's true, but if walk_update_folio() we not inlined then we would
> still consider this a bug.  It's undefined behavior in the C standard
> to pass uninitialized variables to a function call and also the UBSan
> checker will detected it as a read at runtime.
> 
> In production systems the compiler is going to set
> "bool dirty = false;" at the start of the function because everyone
> runs with CONFIG_CC_HAS_AUTO_VAR_INIT_ZERO=y.  Should I send a patch
> which does that explicitly?

Yes please.  And please include some sort of comment to prevent people
from optimizing away the fix ;)


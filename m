Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0DE33151991
	for <linux-kernel@vger.kernel.org>; Tue, 13 May 2025 01:08:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747098539; cv=none; b=HrT0Gsja2sEr+0nZdO25JtQIqh/YG/3aOagNIJZjsn5lrrpNgmEZrcOqWO5Y58Qdb2SU4L6h119UcB9wyU5K1qzZ4sY+kc+288bHLH/tZro9yLP7xze3x8VXMZDQjNHg2PlmXoHFZ4fBuzGRAplakUltnGZsk0nP64XoB0NKWxk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747098539; c=relaxed/simple;
	bh=+WSu8zsEIV5f/3NjVgHOi62tswu6nL2Il99qHBko1Bc=;
	h=Date:From:To:Cc:Subject:Message-Id:In-Reply-To:References:
	 Mime-Version:Content-Type; b=IlElS+UPEHwO4EbcytRnE7qGZOgicdtNWCT3o5GJXCuuykW1dl0fvIJIUAbjAQG+EnfZSjNelzLIPRul4qZ3CZXhI+KlowomGWa82wbfJev4rEP4cg47EKmeq1MxoE6mxHT2RsuZuuMZlbpQzGaCf6TamSvY92umeqEdz/CUjrQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b=yC2vG1xK; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="yC2vG1xK"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 33F17C4CEE7;
	Tue, 13 May 2025 01:08:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linux-foundation.org;
	s=korg; t=1747098538;
	bh=+WSu8zsEIV5f/3NjVgHOi62tswu6nL2Il99qHBko1Bc=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=yC2vG1xKra/v7YQBjQAuK84gRrB0wqIPdqGIoZDrKLS/IjMJguDcf2hoXBLqlgSfy
	 DY/R4d5SGwrReUUzbXReWugWQx+J6y4/W/rlXCiYZ0/yBIQWN86Z5Mh/Pt9lUJVNUJ
	 MrTV2mtk6/8E5TS0Qqh/Q4p0xeW9t2zFM2QFyEC0=
Date: Mon, 12 May 2025 18:08:57 -0700
From: Andrew Morton <akpm@linux-foundation.org>
To: <jiang.kun2@zte.com.cn>
Cc: <bbonev@devuan.org>, <linux-kernel@vger.kernel.org>,
 <bsingharora@gmail.com>, <yang.yang29@zte.com.cn>, <wang.yaxin@zte.com.cn>,
 <xu.xin16@zte.com.cn>
Subject: Re: [PATCH linux next] taskstats: fix struct taskstats breaks
 backward  compatibility since version 15
Message-Id: <20250512180857.59e7836290cb72dad9f3b5d3@linux-foundation.org>
In-Reply-To: <20250510155413259V4JNRXxukdDgzsaL0Fo6a@zte.com.cn>
References: <20250510155413259V4JNRXxukdDgzsaL0Fo6a@zte.com.cn>
X-Mailer: Sylpheed 3.8.0beta1 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Sat, 10 May 2025 15:54:13 +0800 (CST) <jiang.kun2@zte.com.cn> wrote:

> Problem
> ========
> commit 658eb5ab916d ("delayacct: add delay max to record
>  delay peak") - adding more fields
> commit f65c64f311ee ("delayacct: add delay min to record
>  delay peak") - adding more fields
> commit b016d0873777 ("taskstats: modify taskstats version")
>  - version bump to 15
> 
> Since version 15 (TASKSTATS_VERSION=15) the new layout of the
> structure adds fields in the middle of the structure, rendering
> all old software incompatible with newer kernels and software
> compiled against the new kernel headers incompatible with older
> kernels.
> 
> Solution
> =========
> move delay max and delay min to the end of taskstat, and bump
> the version to 16 after the change

Ah, there it it, thanks.

I'll add cc:stable to request a backport.  I'll also add

Fixes: 658eb5ab916d ("delayacct: add delay max to record delay peak")
Fixes: f65c64f311ee ("delayacct: add delay min to record delay peak")

which is odd, but gets the point across.  

The patch won't exactly apply to those kernels because the version
increment came later.  But I think that will be OK - the patch is
applicable to the v6.14 kernel.

Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 963D8179A3
	for <linux-kernel@vger.kernel.org>; Wed,  4 Jun 2025 22:37:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749076667; cv=none; b=bXUi3DDZg1AzoNymNH+3iEIcag2liNhXiIdo9xSOF4ruzuNGTW9R6K/ZcMbIqmQU/v2SlNCpE38B8ndFO9f46ZbuzebnzRERlk8G+44n+jTWah/RA7rwlR+nIlmsRNJ73mWpY42JIe/4RLWbGLgXo7wp90dND4Z3e3KLu5WrQa0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749076667; c=relaxed/simple;
	bh=T9f7oN0L/0cScbDxsspzKLP8mQjxuXJr/BKMKI8GsUc=;
	h=Date:From:To:Cc:Subject:Message-Id:In-Reply-To:References:
	 Mime-Version:Content-Type; b=XCcLL+TolcPGt+zRiDui8biYmuV0K0FXYY1pS8rbBt6P8nMFME5xCemm4hc0pY2Ntg2TebIDEbdFoYNxcvxA54poh6ggZ1jFEWFxSeYS0J13hp4cbL/wEO68OTmuaE5MG1lvAQ7uSrm8Hae8nGfNqwft09wRjTA/lvXzXd9TUNI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b=lVVcSULP; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="lVVcSULP"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 90D74C4CEE4;
	Wed,  4 Jun 2025 22:37:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linux-foundation.org;
	s=korg; t=1749076666;
	bh=T9f7oN0L/0cScbDxsspzKLP8mQjxuXJr/BKMKI8GsUc=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=lVVcSULPH4sQCbdJaLwkSVd1Wd6jCJUk4o86PEecvHvu9kJZjlYxYKMeiMPzlbStO
	 yN+++j7CEMxBQa7JmRSguzMB0ioPYwyukiWyVE+D1UtYa7cGbNtI9ImDbksO/Y82A+
	 FAIwQC6KyuMt5TmcCGf8OznE1Bw3Z6bHm3i7Gcp8=
Date: Wed, 4 Jun 2025 15:37:46 -0700
From: Andrew Morton <akpm@linux-foundation.org>
To: Yury Norov <yury.norov@gmail.com>
Cc: linux-kernel@vger.kernel.org, Rasmus Villemoes
 <linux@rasmusvillemoes.dk>, John Stultz <jstultz@google.com>, Thomas
 Gleixner <tglx@linutronix.de>, Stephen Boyd <sboyd@kernel.org>
Subject: Re: [PATCH 1/3] bitmap: generalize node_random()
Message-Id: <20250604153746.998e9e64e9aebc987d28d9fd@linux-foundation.org>
In-Reply-To: <aEC-04zhtWh04b_F@yury>
References: <20250604212125.25656-1-yury.norov@gmail.com>
	<20250604212125.25656-2-yury.norov@gmail.com>
	<20250604143442.37635ce63e50a7425a390c2e@linux-foundation.org>
	<aEC-04zhtWh04b_F@yury>
X-Mailer: Sylpheed 3.7.0 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Wed, 4 Jun 2025 17:46:59 -0400 Yury Norov <yury.norov@gmail.com> wrote:

> > Of course, the hard-coding of get_random_u32_below() might be
> > unsuitable for some future potential callers but we can deal with that
> > if it ever occurs.
> 
> Can you please elaborate?

Some callers might want to use a different random number generator. 
Seems unlikely, I know.

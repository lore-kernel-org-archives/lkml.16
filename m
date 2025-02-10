Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 300A5256C8E
	for <linux-kernel@vger.kernel.org>; Mon, 10 Feb 2025 17:02:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739206952; cv=none; b=ebWeWvGPZ1ch7kCtJWaBUd+pqk9CPpZ25UhjIXXMj3kQX17CZNPgBqPIFVssEI5z58C4W+PVdzd5d/RdU1t9g7ticM6dU6oHvfoWSTbAbERrEPE4Wlv/3j8AsutEEAkpJARP+IakMGY+9jv5MgM/PH/MNX5+pv8UtW7vTyJhc1A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739206952; c=relaxed/simple;
	bh=RJsu+NzGjgza63pPkNq07k5cj7iV4iMEha5DW1EYrd8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Lhya+0uE1QHSYysQDu6KwKyvzEBnhuHmTTBB0nZJLrtm9uYKJvavMEbwRgAh53ZV01eb00dXMyHPuG9fB1zmd3eB+y+IFRNPR5opYyeeTVsPKfi2EjXr8ZiS7XlDh5nqB06nLJHVFw82ZiZtUIR1lqv0Qdh9/oE+pyYR7Wo9sd4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=jem1+QmO; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="jem1+QmO"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 29DD3C4CED1;
	Mon, 10 Feb 2025 17:02:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1739206951;
	bh=RJsu+NzGjgza63pPkNq07k5cj7iV4iMEha5DW1EYrd8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=jem1+QmOrCBuHUGzj5Vq/DIi1PNfI7Ei3b/HRJbwzUj+eXnOKCKxX0JedNDDgazW3
	 uCdbTSFulhRoPPaIgRrnCg5jDp70Irgja9jDdHrBrNAGTBPAvaD8j9xEAyHU3vcICM
	 kAqI4Kgp+nC3JMTVKdNYknpSpFBQysbkqHx7Cpb3SWh7mh+UP4NntbXVH2oKtm3V96
	 svLMm1sF4oUGTXGM8s9DTm/yzyKqeLbULQlRQLQ5tX5lINTn0qyJX6E+t9qM+gUnRS
	 yWkAhxfhLK1q3YBvdvK6TQd/cL+9yKeaoSK3WNz6/2eyHr8Px5KU/x9sfuCSvs8RvV
	 WgkuisRYHAkzg==
Date: Mon, 10 Feb 2025 22:32:28 +0530
From: Vinod Koul <vkoul@kernel.org>
To: Pei Xiao <xiaopei01@kylinos.cn>
Cc: xiaopeitux@foxmail.com, linux-kernel@vger.kernel.org
Subject: Re: [PATCH V5] phy: freescale: fsl-samsung-hdmi: fix build error in
 fsl_samsung_hdmi_phy_configure_pll_lock_det
Message-ID: <Z6oxJEvABw780+DZ@vaman>
References: <tencent_195F1119DC8F547C905D5ED127D173EFAE08@qq.com>
 <CAHCN7xL7eMV2f04nURp3jCCmNZ0GSTY=uaOwoiht38AC4Oz0EQ@mail.gmail.com>
 <476dace4-92fb-4d92-a342-cffd6f77b8f1@kylinos.cn>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <476dace4-92fb-4d92-a342-cffd6f77b8f1@kylinos.cn>

On 17-01-25, 10:15, Pei Xiao wrote:
> 
> 在 2025/1/17 09:59, Adam Ford 写道:
> > On Mon, Jan 13, 2025 at 2:41 AM <xiaopeitux@foxmail.com> wrote:
> >> From: Pei Xiao <xiaopei01@kylinos.cn>
> >>
> >> FIELD_PREP() checks that a value fits into the available bitfield,
> >> but the index div equals to 4,is out of range.
> >>
> >> which gcc complains about:
> >> In function ‘fsl_samsung_hdmi_phy_configure_pll_lock_det’,
> >> inlined from ‘fsl_samsung_hdmi_phy_configure’ at
> >> drivers/phy/freescale/phy-fsl-samsung-hdmi.c :470:2:
> >> ././include/linux/compiler_types.h:542:38: error: call to ‘__compiletime_assert_538’
> >> declared with attribute error: FIELD_PREP: value too large for the field
> >>   542 |  _compiletime_assert(condition, msg, __compiletime_assert_,
> >> __COUNTER__)
> >>       |                                      ^
> >> ././include/linux/compiler_types.h:523:4: note: in definition of
> >> macro ‘__compiletime_assert’ 523 |    prefix ## suffix();
> >>       |    ^~~~~~
> >> ././include/linux/compiler_types.h:542:2: note: in expansion of macro
> >> ‘_compiletime_assert’
> >>   542 |  _compiletime_assert(condition, msg, __compiletime_assert_,
> >>  __COUNTER__)
> >>
> >> REG12_CK_DIV_MASK only two bit, limit div to range 0~3,
> >> so build error will fix.
> >>
> > LGTM.
> >
> > Reviewed-by:  Adam Ford <aford173@gmail.com>
> loop Vkoul for email address was written incorrectly.

Thanks for looping in!

Change looks good to me. Can you please revise the patch title. A patch
title should describe the change we are making. Fix build error is not
an apt title

-- 
~Vinod

Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8A79F1EDA2B;
	Wed, 25 Jun 2025 05:58:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750831123; cv=none; b=UVP6XAV/LAQsQsXe7mmX0DvO1chEqjNVy6VRZ57jGr9M6B6DrD8TVAob8OS39Re3QwgGmobjoJK+jsxeNtmvHsy/T9TeWJR2Kz7ossc2zMt9kenMvJkEdgccgGs/i8Hp8AoDAEcpXu2mIeTXK6pvB8NxaQVk2yglY6XoMgxNYUU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750831123; c=relaxed/simple;
	bh=JytezEbt8peoC6/Do+7C6T3+AmH5EZo05VjVfqBrMSY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=iSqQ6NXOiNPqUXo0fTvsI9p6o2HnOF653ihz55O3Qk+ZiJVuduBDSiWjVQkhfGTQupEQNCJqxZ+0SaZLzweGvpAsIsE36xpzomw9KLbMnH05otja0UrUabusDchVlIhdX3eIavB32mrrfVr3bt2NSoJoT31kLWUG1t3NqS4JbQc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=iLcn/M64; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="iLcn/M64"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 03295C4CEEA;
	Wed, 25 Jun 2025 05:58:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1750831123;
	bh=JytezEbt8peoC6/Do+7C6T3+AmH5EZo05VjVfqBrMSY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=iLcn/M64c9rXdulqUNxugGiylnH+CzBrYw7fCiJCrQYZnu5U8PgSvOXqLUT+Ib3iQ
	 av9XsBaz0/CfMPylWwHOCtUb4EdbEB8V88VwregAFq1Cc0hzQTKOm6cV04udK+EA/H
	 21oUj18WOa54NHthkVOkU9GIV1KRfo3uw/rd/c3F/Y9dCEYEgs5Zkump1D7uxoXElv
	 kwsh3bjo0gl8jX/jTFgk7nxLLvB81TCqhtLkK+ggXjo+toxMrr1Q0LRSh5RJ0zbW5b
	 lISSfxpHfi8vT/jJOJHHirk84lmk3GlCegOwW7Hmxwm0IZSNS17v7+DLsLzNy0YwHP
	 h4rpREgLU3BYQ==
Date: Wed, 25 Jun 2025 05:58:40 +0000
From: Tzung-Bi Shih <tzungbi@kernel.org>
To: Michal Gorlas <michal.gorlas@9elements.com>
Cc: Brian Norris <briannorris@chromium.org>,
	Julius Werner <jwerner@chromium.org>, linux-kernel@vger.kernel.org,
	chrome-platform@lists.linux.dev,
	Marcello Sylvester Bauer <marcello.bauer@9elements.com>
Subject: Re: [PATCH v2 1/3] firmware: coreboot: support for parsing SMM
 related informations from coreboot tables
Message-ID: <aFuQEMS6shL8ahlA@google.com>
References: <20250616-coreboot-payload-mm-v2-0-5d679b682e13@9elements.com>
 <20250616-coreboot-payload-mm-v2-1-5d679b682e13@9elements.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250616-coreboot-payload-mm-v2-1-5d679b682e13@9elements.com>

On Mon, Jun 16, 2025 at 04:01:12PM +0200, Michal Gorlas wrote:
> coreboot exposes (S)MM related data in the coreboot table. Extends existing interface
> with structure corresponding to (S)MM data, and adds COREBOOT_PAYLOAD_MM config used by
> follow-up patches.

s/Extends/Extend/;s/adds/add/ not a hard requirement but [1]("imperative mood").

It'd be better to annotate what MM and SMM stand for as well.

Symbols introduced in the patch are used in the following patch of the series.
How about just merge them into one patch?

[1]: https://www.kernel.org/doc/html/latest/process/submitting-patches.html

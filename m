Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A3334221274
	for <linux-kernel@vger.kernel.org>; Fri,  2 May 2025 07:27:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746170856; cv=none; b=ohQWCFZX2cpJo+d+y0Obr2mnpbUTA2ZPhPTfik2u53CLlY7iOfacGv5mOBZud6Drb9GcU0d7MEcVjvgoEDvChnve8abhyNTjgCoUzo9y+MH3d5uQX9sS1q7WnvTV7QPmqgi3hy9YHxoDbFZWEhAI5DAu5bgkCVZTjEFomvH1cAk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746170856; c=relaxed/simple;
	bh=gM1aGGABK3nuyDEgaKhuodr+3aSEgKfsVsCduSfRKCM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=OfM6OZkpJdMKtjgAaXIKDfAmWgqWFACeVuLqMvlL+IXls5Acb4zsmcM9PnsW1WMuDvQX6YW1m82uALhJS8uRF4j/ERo0xAgcsRCXD0ilGh66MY2/kzabMDGbrEXAn92mAItNdNmRlYI1x7xhnarOVmbPaq1tPMJx0XPkqzN7liQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Vf0ve1rz; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Vf0ve1rz"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E5E37C4CEE4;
	Fri,  2 May 2025 07:27:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1746170856;
	bh=gM1aGGABK3nuyDEgaKhuodr+3aSEgKfsVsCduSfRKCM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Vf0ve1rzrDd7L6hYMaExXxe9MGbOir2cf5jsjV0VXCLsSggcrBziDs5CuBPOV4PSY
	 IvFctV+LvkQBGNzsgyGOMTziKoKBuRPAQlqQrJp7pWA66nzKzsxDvTr8k6oDyfclod
	 XFYSKQLmCFepzb7/Oifi62CN4ykqAPdxcR4PNfduf+h1bkbo4slJ3g1RQDBZ1G1YEC
	 olL7gnth5w/wcZnWPfDHRgGFhJcdPaRtWt7qb+ScO2VqWm/Tz8z/CMHvJiGUeogu7L
	 DTHzz/jW0xkkQcmTVcjxK6+MpBT7D9lzSUpiRAjy7MR3hkdroFZHeNhu8lmn+8LTFC
	 0BGPMFAGhOK5Q==
Date: Fri, 2 May 2025 08:27:32 +0100
From: Lee Jones <lee@kernel.org>
To: Andy Shevchenko <andy.shevchenko@gmail.com>
Cc: Andy Shevchenko <andriy.shevchenko@intel.com>,
	Peter Tyser <ptyser@xes-inc.com>,
	Purva Yeshi <purvayeshi550@gmail.com>, linux-kernel@vger.kernel.org
Subject: Re: (subset) [PATCH] mfd: lpc_ich: Fix ARRAY_SIZE usage for
 apl_gpio_resources
Message-ID: <20250502072732.GB3865826@google.com>
References: <20250322131841.31711-1-purvayeshi550@gmail.com>
 <174377238828.330559.7652024137546009839.b4-ty@kernel.org>
 <aAqKcn25bkrjIiLF@black.fi.intel.com>
 <20250501120725.GJ1567507@google.com>
 <aBRLqGDpV8Y63JaJ@surfacebook.localdomain>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <aBRLqGDpV8Y63JaJ@surfacebook.localdomain>

On Fri, 02 May 2025, Andy Shevchenko wrote:

> Thu, May 01, 2025 at 01:07:25PM +0100, Lee Jones kirjoitti:
> > On Thu, 24 Apr 2025, Andy Shevchenko wrote:
> > > On Fri, Apr 04, 2025 at 02:13:08PM +0100, Lee Jones wrote:
> > > > On Sat, 22 Mar 2025 18:48:41 +0530, Purva Yeshi wrote:
> > > > > Fix warning detected by smatch tool:
> > > > > drivers/mfd/lpc_ich.c:194:34: error: strange non-value function or array
> > > > > drivers/mfd/lpc_ich.c:194:34: error: missing type information
> > > > > drivers/mfd/lpc_ich.c:201:34: error: strange non-value function or array
> > > > > drivers/mfd/lpc_ich.c:201:34: error: missing type information
> > > > > drivers/mfd/lpc_ich.c:208:34: error: strange non-value function or array
> > > > > drivers/mfd/lpc_ich.c:208:34: error: missing type information
> > > > > drivers/mfd/lpc_ich.c:215:34: error: strange non-value function or array
> > > > > drivers/mfd/lpc_ich.c:215:34: error: missing type information
> 
> [...]
> 
> > > > Applied, thanks!
> > > > 
> > > > [1/1] mfd: lpc_ich: Fix ARRAY_SIZE usage for apl_gpio_resources
> > > >       commit: 87e172b0fdd3aa4e3d099884e608dbc70ee3e663
> > > 
> > > Can this be reverted ASAP, please? See below why.
> > > 
> > > There is no problem with the code. The original author of the change
> > > haven't proved otherwise.
> > > 
> > > The change made it much worse to read and maintain. By the way, it actually
> > > _added_ the problem as far as I can see with my small test program.
> > > 
> > > Let's just calculate based on the sizeof(struct foo) taken as 10 for
> > > simplicity and array size as 4x2. The full size of the array is
> > > 4 * 2 * 10 bytes. The size of the entry in outer array will be 2 * 10 bytes.
> > > Now, what ARRAY2D_SIZE do is (4 * 2 * 10 / 10 / (2 * 10 / 10) == 4, and
> > > that's WRONG! This will make a out-of-boundary accesses possible.
> > > 
> > > If smatch can't parse something, it's problem of smatch. No need to "fix"
> > > the working and robust code. The original code even allows (in theory) to have
> > > different amount of resources per entry, however it's quite unlikely to happen.
> > > But at bare minimum it shows the entry taken along with _its_ ARRAY_SIZE()
> > > and not something common over the outer array.
> > 
> > Done.
> 
> I still see it as commit
> https://web.git.kernel.org/pub/scm/linux/kernel/git/lee/mfd.git/commit/?h=for-mfd-next&id=c6c07f8ea2cbb0dca0e529f9ed16df71276515a4

-ENOPUSH

Try again.

-- 
Lee Jones [李琼斯]

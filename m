Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8F63F30AAAC
	for <linux-kernel@vger.kernel.org>; Wed,  2 Jul 2025 14:55:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751468107; cv=none; b=ms5cNq9oNTBnOLfbPiyuYqeZPOI6IRaeXrLYsZUTCP/rgx4DSnuNqk7wzhPU250g3NOR64ltVDvXfx9NJBqz73MvGIZhosRI1jQhUqgoL0RYBHamV5osDXI8exBaoLkPsiFtVdY5FWapXVqWvUCJOxfsW81Jfq6Qvbmol+TT61o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751468107; c=relaxed/simple;
	bh=QNHzVW56c5rTcVuAlCo3xaNfY7ZATMG/ihK7rdgAfbQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=TFapEfackp9bgNh8jgVLNvIU8nlkWQGIRGQTOHEnKxYNr3cmBYSsY4w7w492wpoNhV95RKgrr1HYJp8FUqhDHE+ZYCZiAiNw22OPF6WVh6t4XRz6HRAy/QUiIVirSv/IdjgOuRro0eLBwUCFxK9zTAYwyEqKS3ZCg+wwVkPLBwQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=gmyoh1Kl; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="gmyoh1Kl"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 447F4C4CEE7;
	Wed,  2 Jul 2025 14:55:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1751468107;
	bh=QNHzVW56c5rTcVuAlCo3xaNfY7ZATMG/ihK7rdgAfbQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=gmyoh1KlDP2KvKCht7OY/FTI8ziIZySNk7tkNkslz4IF/Munz9usuNUyxzbRFwQT3
	 uAaEalIwPMA6rdIjIvTuwfW26YPMk3XB7YoWFMG251PkLDdr0rYM+zk8UAE+Iw99Bz
	 3A7ggh40E3pd3kvzl3ZQJPSOk2sndGIQRnbQ7TS2p8lO4o4T3h17uQzUl68GYw1nWg
	 4kNyvE2uB9fHHHaVsoEwPZ5IjQ+9b4HgeKwXHtYikezFbVfvo58kgts6/vc31zdSaN
	 XAJSeQ6250Z9LJ5mSqeKAHy5FR2XmbJSlfakkcKWrmitXgWQ7ZCecmTI9HIhNGw575
	 peEEXhAIYKXeA==
Date: Wed, 2 Jul 2025 15:55:03 +0100
From: Lee Jones <lee@kernel.org>
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: "Dr. David Alan Gilbert" <linux@treblig.org>, kernel.org@treblig.org,
	arnd@arndb.de, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] Input: pcf50633-input - Remove
Message-ID: <20250702145503.GR10134@google.com>
References: <20250629212820.319584-1-linux@treblig.org>
 <j3pkekg2mmbdbmguewoc5rks7263rxhveggkimbhmvkgxb5ikh@nwz553og3qtz>
 <aGP3fvnDpYqzQlYU@gallifrey>
 <6utlzamf6luhexdvtpjbqnlkrdh5bj6gcoj2h7ql7kjxyjo2zt@csylxspamkch>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <6utlzamf6luhexdvtpjbqnlkrdh5bj6gcoj2h7ql7kjxyjo2zt@csylxspamkch>

On Tue, 01 Jul 2025, Dmitry Torokhov wrote:

> On Tue, Jul 01, 2025 at 02:58:06PM +0000, Dr. David Alan Gilbert wrote:
> > Lee:
> > 
> > * Dmitry Torokhov (dmitry.torokhov@gmail.com) wrote:
> > > On Sun, Jun 29, 2025 at 10:28:20PM +0100, linux@treblig.org wrote:
> > > > From: "Dr. David Alan Gilbert" <linux@treblig.org>
> > > > 
> > > > The pcf50633 was used as part of the OpenMoko devices but
> > > > the support for its main chip was recently removed in:
> > > > commit 61b7f8920b17 ("ARM: s3c: remove all s3c24xx support")
> > > > 
> > > > Remove the input code.
> > > > 
> > > > This was originally posted as a set of pcf50633 removals in March,
> > > > and is the only major component that hasn't been picked up.
> > > > https://lore.kernel.org/all/20250311014959.743322-1-linux@treblig.org/
> > > > 
> > > > Signed-off-by: Dr. David Alan Gilbert <linux@treblig.org>
> > > 
> > > Applied, thank you.
> > 
> > I see Dmitry has got that into -next, so I've posted a patch to take
> > out the pcf50633 header which is the last bit left.
> 
> Lee, do you want me to take it through my tree as well to avoid juggling
> inter-tree dependencies?

If the driver is unused, it shouldn't cause too many issues.  Let's
ensure that all of these get applied for this cycle and all should be
well.

-- 
Lee Jones [李琼斯]

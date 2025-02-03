Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D342D20F09D
	for <linux-kernel@vger.kernel.org>; Mon,  3 Feb 2025 21:40:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738618835; cv=none; b=kiMZoFmcErzf6wpgxmldOIdM7iEvwefLWaFu+oWY3G1E1DRl2Q3KIwhgPB37AERS1RJ6qlz2aAwtayGFTguOAfy5WvQanfgrCxIPnOEZ4SVQIB95REH6G9QBkh8iDVfWcY/qtPiEl98FyQcPk49+2tbRUaR/Q3tuR71EWrg9rwQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738618835; c=relaxed/simple;
	bh=VYCbSdXLJAo0G5h51wpv/9glXHCBiN/zrDRBjbCoWgM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=aOnIKamvOEMJW37u+j0uAL1vYGuXwnKRC/0DSZ1dnPU/1VM5+fKm5rWAKerpDpLsnAZ2r+slylj9tUw+dB3gP93FUjWz671iL1eKb8z7A274bJUyLZNZM4COwNBQ82NklxeOLuAALJxq5d1s36P0Kbk8pUSZtmHO6lB1KP1Pfyc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=OpNXxv7w; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="OpNXxv7w"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id ECF4FC4CED2;
	Mon,  3 Feb 2025 21:40:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1738618835;
	bh=VYCbSdXLJAo0G5h51wpv/9glXHCBiN/zrDRBjbCoWgM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=OpNXxv7wPskYIU5W1eX6NnJLBl9y4p/m1YIgi6u+hJqquXLM4DHQz+4ySgmhL14y3
	 FX1KbBbFGhTgUO9fr1dBr+jN90QSjDZbBvkz6hycOreX69tirmXklt+sZKgJGYY6ji
	 BcnBwGLIWIJeJTKlAoiidN21nS2Zjt+osBSpzKiYW+goEX+YzVSYaWadb/cezrfwY6
	 ahbgk1UhBIAtxcr8eBb8CDZmsDX81t2ikcJvoLw/yvvcpBswVQdqPdMINQZKDq+F8v
	 65TlIA5wt98F22A8CuOgAAlljmsCDJbzfV8VX92WSMQMST9bNMHCPaqDMLmM/IMLJh
	 byH70SFvb9EIw==
Date: Mon, 3 Feb 2025 13:40:33 -0800
From: Luis Chamberlain <mcgrof@kernel.org>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Mark Salyzyn <salyzyn@android.com>,
	Tim Murray <timmurray@google.com>,
	Venkata Narendra Kumar Gutta <vnkgutta@codeaurora.org>,
	kernel-team@android.com
Cc: Linus Torvalds <torvalds@linux-foundation.org>,
	Mark Salyzyn <salyzyn@android.com>, Dave Airlie <airlied@gmail.com>,
	LKML <linux-kernel@vger.kernel.org>,
	dri-devel <dri-devel@lists.freedesktop.org>, russ.weight@linux.dev
Subject: Re: question about firmware caching and relying on it
 (CONFIG_FW_CACHE)
Message-ID: <Z6E30W9aEh2tQOkw@bombadil.infradead.org>
References: <CAPM=9twyvq3EWkwUeoTdMMj76u_sRPmUDHWrzbzEZFQ8eL++BQ@mail.gmail.com>
 <CAHk-=whRBX0aQq1J5S5nHXE2GvXnQ5z+cqu=iTY9xU34kvYMzw@mail.gmail.com>
 <2025020347-chewy-paradox-ce71@gregkh>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <2025020347-chewy-paradox-ce71@gregkh>

On Mon, Feb 03, 2025 at 09:19:59AM +0100, Greg Kroah-Hartman wrote:
> On Sun, Feb 02, 2025 at 12:54:07PM -0800, Linus Torvalds wrote:
> > Greg, Luis, can you explain that odd uevent message / netlink issue?
> 
> There was reports from Android devices that the uevent was causing the
> system to wake up from the netlink messages that were sent when going to
> sleep and so it would get caught in a loop and never actually go to
> sleep.  I can't remember any more than that, maybe Mark can recall the
> specifics and dig up the Android bug reports for it?

Nope, the only thing that my spidy senses tells me is that it would be
great to know if the uevent flood was caused by the uevent flood which
caused the same udev duplicate messages to load modules per-cpu. Linus
had a nice fix to make these idempotent via commit 9b9879fc03275ffe
("modules: catch concurrent module loads, treat them as idempotent")
on the module load path, so I'm wondering if uvents could likely could
trigger floods to delays suspend.

Provided Mark Salyzyn hasn't moved on (from commit 030cc787c30e
("firmware_class: make firmware caching configurable") it would
be great if he could enable the FW_CACHE and re-test. At the very least
hopefully kernel-team-android can redirect this to the appropriate folks
to verify.

One of the reasons to *not* want the fw cache is for firmware images
which are *huge*, like those which may be used on remote procs. But we
we already have an internal FW_OPT_NOCACHE and remote-proc stuff likely
already uses request_firmware_into_buf() which uses FW_OPT_NOCACHE.

  Luis

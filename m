Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DBD88246794;
	Mon, 12 May 2025 16:57:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747069073; cv=none; b=JUJ5hAbZ5q4VgYpz6Y6mifoG7s+shYxSdlOfw2vQ8Y7XRBAI0W8S2V+SwjPwr4gTHKccOh1Ahc+UDZHRHb2nd8gjKYEzsVN5YZmJYrb3hM7ywJvwyiXo29EsGVeOtrRvw7mNjs7oF5lcvH8ZZJ3GDW92ICfHzUidcapxDyD2wPE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747069073; c=relaxed/simple;
	bh=jtmhvy+igoWarO8PIdZ3LGqvMhYkNDTKVtMcVaaeYnM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=RNYnEW6W8mTj8vv0FZKc+Ed/bTZP7dFYtdQjGwHc1mh/F/Cze4cJAv//Ad1w9KcJDKNJ9tTVobRyus7Vk6DYgoo3zmhRYcXc0WE3WoxZtSmsmturOQmRWZfc8Hum/NLmCNkv57usFQbVt0iyqBjspxLJkOAfimWXv2PXtj87Yns=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=USwPZBGa; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="USwPZBGa"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3F318C4CEE7;
	Mon, 12 May 2025 16:57:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1747069072;
	bh=jtmhvy+igoWarO8PIdZ3LGqvMhYkNDTKVtMcVaaeYnM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=USwPZBGaCrF4OOrhmuZAcAHI13eVshZ3/K0bwJ6RiKOQGGFWJfhh5EF/FT895MSwQ
	 niVRzkI8AudeQY5kJfVVvHZgYtIwLWNvA8SCFkMY26EKM6n+b7akU5WeJ89rD63Mr+
	 0j/gkbhG4jaPkEpglku421lkT2l/AWzkBt+3/bO4=
Date: Mon, 12 May 2025 18:57:49 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Alexey Dobriyan <adobriyan@gmail.com>
Cc: Jonathan Corbet <corbet@lwn.net>, workflows@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/9] CodingStyle: make Documentation/CodingStyle into
 symlink
Message-ID: <2025051203-secluded-emphases-1c76@gregkh>
References: <20250509203430.3448-1-adobriyan@gmail.com>
 <87frhcsrva.fsf@trenco.lwn.net>
 <77f03295-df5d-4bc0-9a61-5be829969662@p183>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <77f03295-df5d-4bc0-9a61-5be829969662@p183>

On Mon, May 12, 2025 at 07:08:53PM +0300, Alexey Dobriyan wrote:
> On Sat, May 10, 2025 at 04:05:29AM -0600, Jonathan Corbet wrote:
> > Alexey Dobriyan <adobriyan@gmail.com> writes:
> > 
> > > Every time I open Documentation/CodingStyle it says the party moved
> > > somewhere else. :-(
> > >
> > > Of course, I forget where it moved to by the next time.
> > >
> > > Signed-off-by: Alexey Dobriyan <adobriyan@gmail.com>
> > > ---
> > 
> > No 0/9 cover letter?
> 
> Not really. Cover letter would be very short:
> 
> 	Tweak coding style to add things I've learned over the years of
> 	Linux/C programming.
> 
> 	And stop making kernel devs look like aliens from another Universe
> 	(see static_assert() rule and especially(!) "declare ALAP" rule)

Both of those are not valid reasons to change coding style, sorry.
Again, learn about _why_ we have one, don't get bogged down in the
details of _what_ it is.

sorry,

greg k-h

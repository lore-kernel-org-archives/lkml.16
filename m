Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4CCF323C4EA;
	Mon, 12 May 2025 16:59:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747069169; cv=none; b=HZomGIoP9NH8BWfoOY8g8jq0YOxqNrQp1T82puw5YqUUxvjwWRGq7AfKKKl79zft2VzjqALkvdwKgq55QKCarsm9lEcxrJG+6rS6poTF9NUGoNhFCvUmwGHs+sH6S+Lp8BQXB/rm4V1cF524Zr7TSWybKAolZuz/nCJ6kYBxMRQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747069169; c=relaxed/simple;
	bh=Wq80m5q5Px4bcqigue9JimLJdgSCi2I32BoHv1eBu5k=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ERf/RZ11XtJHBfG++nbrLzWfaFuzAvQyeDEh/oNiwtRvB+QCTtGneTR1WsuymDWcK9dh/Eoe2NARPdYxImwrBIRKpCivy2fr/cTLzDs/RhcpGIsvcCEzZJTGpLq0/UNSLfDFmJDphG2Z2cQ2K7AnwnYI3/azvcIk9CxjSo0KJkE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=dnU9WAb3; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="dnU9WAb3"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4CA0AC4CEE7;
	Mon, 12 May 2025 16:59:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1747069168;
	bh=Wq80m5q5Px4bcqigue9JimLJdgSCi2I32BoHv1eBu5k=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=dnU9WAb3AkQPLhYGXlySAlIQRFbACvqpQffV1dz+aUnw2dQ1FQUMvXNBKKYQNBPbI
	 u0Aoa1AapfZYerPUl/7IeOG+5QVyfcvak7x7XPiBNSLMPTfzlnykcvv0NNlOFjVc6K
	 OgILiZ5Z/dxfNGVxeN9yy5D9LOncXbtG3fJAim9o=
Date: Mon, 12 May 2025 18:59:25 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Alexey Dobriyan <adobriyan@gmail.com>
Cc: David Laight <david.laight.linux@gmail.com>, corbet@lwn.net,
	workflows@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 8/9] CodingStyle: tell people how to split long "for"
 loops
Message-ID: <2025051216-flammable-lubricant-59a2@gregkh>
References: <20250509203430.3448-1-adobriyan@gmail.com>
 <20250509203430.3448-8-adobriyan@gmail.com>
 <20250510195603.37279af3@pumpkin>
 <cefe24b6-c1a1-4fe4-826d-e08a856aa8e0@p183>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cefe24b6-c1a1-4fe4-826d-e08a856aa8e0@p183>

On Mon, May 12, 2025 at 07:20:23PM +0300, Alexey Dobriyan wrote:
> On Sat, May 10, 2025 at 07:56:03PM +0100, David Laight wrote:
> > On Fri,  9 May 2025 23:34:29 +0300
> > Alexey Dobriyan <adobriyan@gmail.com> wrote:
> > 
> > > Signed-off-by: Alexey Dobriyan <adobriyan@gmail.com>
> > > ---
> > >  Documentation/process/coding-style.rst | 16 +++++++++++++++-
> > >  1 file changed, 15 insertions(+), 1 deletion(-)
> > > 
> > > diff --git a/Documentation/process/coding-style.rst b/Documentation/process/coding-style.rst
> > > index e17de69845ff..494ab3201112 100644
> > > --- a/Documentation/process/coding-style.rst
> > > +++ b/Documentation/process/coding-style.rst
> > > @@ -183,7 +183,21 @@ Descendants are always substantially shorter than the parent and
> > >  are placed substantially to the right.  A very commonly used style
> > >  is to align descendants to a function open parenthesis.
> > >  
> > > -These same rules are applied to function headers with a long argument list.
> > > +These same rules are applied to function prototypes with a long argument list.
> > > +
> > > +Very long ``for`` loops are split at the ``;`` characters making it easier
> > > +to see which code goes to which clause:
> > > +
> > > +.. code-block:: c
> > > +
> > > +	for (int i = 0;
> > > +	     i < N;
> > > +	     i += 1)
> > > +	{
> > > +	}
> > > +
> > > +Opening curly is placed on a separate line then to make it easier to tell
> > > +loop body from iteration clause.
> > 
> > Is that actually the style - I don't remember seeing it.
> 
> Check include/linux/list.h.

That is a complex #define, not a "normal" for loop.

greg k-h

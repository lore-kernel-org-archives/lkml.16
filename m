Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 99CA71CEEB2;
	Wed, 21 May 2025 16:58:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747846728; cv=none; b=tEbkGt7/6OGr6EBv7p7NgUyt6Z36tFBpzulfKsuTCHnxuO2jg4D/QLliC6Ke7P5+rMx26/YOSXN/GnZ3V8+IZx1s2/NEuqZWQT8VZP51Vfd6/2LnegHhrESgUEgp+uclQO/SfBWriYJEIYdbHLplpESXH+7eLnpl+e6GvnQ56CA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747846728; c=relaxed/simple;
	bh=59oAJcTJpmR8OLFJ0gR8UPLguvkoStgGoffZseDex2g=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=CdA4isKl49KyCq693+7uLkH4Kvk29L+b6xrtLYfhXJPPZ3wwyuQfSDCLUcMs8eD9tk+5TXqqrWtEA1ezqUy2U1yE4zbw7WecL3WyVO2MQFDPL8HL6ASBbPJvWfvABOP1aYu8xGQPzlm55ig4A6MwW9d29s2IZKCMr8YYf5h2FDw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=hEcWuyg8; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="hEcWuyg8"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9CCC2C4CEE4;
	Wed, 21 May 2025 16:58:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1747846728;
	bh=59oAJcTJpmR8OLFJ0gR8UPLguvkoStgGoffZseDex2g=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=hEcWuyg8NDZHwjwFdz1hKQdHeyloCDmxGf4ySMcqClZTIFYnrGv6Z9k/7vxobndeY
	 Md28uGshRkdCxLeXocEiFhcg6/0elgPtySg9cy6VIV/5+F5+2LUCmiCXqnjZVjABcP
	 C6+723bA/Ct345PLSLtIS7Zl2V/BSKfJ2MrU2n7A=
Date: Wed, 21 May 2025 18:58:45 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Remo Senekowitsch <remo@buenzli.dev>
Cc: Rob Herring <robh@kernel.org>, Saravana Kannan <saravanak@google.com>,
	Miguel Ojeda <ojeda@kernel.org>,
	Alex Gaynor <alex.gaynor@gmail.com>,
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>,
	=?iso-8859-1?Q?Bj=F6rn?= Roy Baron <bjorn3_gh@protonmail.com>,
	Benno Lossin <benno.lossin@proton.me>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>,
	Danilo Krummrich <dakr@kernel.org>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Dirk Behme <dirk.behme@de.bosch.com>, linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org, rust-for-linux@vger.kernel.org
Subject: Re: [PATCH v5 4/9] rust: device: Enable printing fwnode name and path
Message-ID: <2025052116-gem-blend-2585@gregkh>
References: <20250520200024.268655-1-remo@buenzli.dev>
 <20250520200024.268655-5-remo@buenzli.dev>
 <2025052153-steadier-bargraph-e81a@gregkh>
 <DA1UXY2O47Y2.1ND9MC6L01217@buenzli.dev>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <DA1UXY2O47Y2.1ND9MC6L01217@buenzli.dev>

On Wed, May 21, 2025 at 03:03:07PM +0200, Remo Senekowitsch wrote:
> On Wed May 21, 2025 at 2:02 PM CEST, Greg Kroah-Hartman wrote:
> > On Tue, May 20, 2025 at 10:00:19PM +0200, Remo Senekowitsch wrote:
> >> Add two new public methods `display_name` and `display_path` to
> >> `FwNode`. They can be used by driver authors for logging purposes. In
> >> addition, they will be used by core property abstractions for automatic
> >> logging, for example when a driver attempts to read a required but
> >> missing property.
> >> 
> >> Signed-off-by: Remo Senekowitsch <remo@buenzli.dev>
> >> ---
> >>  rust/kernel/device/property.rs | 72 ++++++++++++++++++++++++++++++++++
> >>  1 file changed, 72 insertions(+)
> >> 
> >> diff --git a/rust/kernel/device/property.rs b/rust/kernel/device/property.rs
> >> index 70593343bd811..6ccc7947f9c31 100644
> >> --- a/rust/kernel/device/property.rs
> >> +++ b/rust/kernel/device/property.rs
> >> @@ -32,6 +32,78 @@ pub(crate) fn as_raw(&self) -> *mut bindings::fwnode_handle {
> >>          self.0.get()
> >>      }
> >>  
> >> +    /// Returns an object that implements [`Display`](core::fmt::Display) for
> >> +    /// printing the name of a node.
> >> +    pub fn display_name(&self) -> impl core::fmt::Display + '_ {
> >> +        struct FwNodeDisplayName<'a>(&'a FwNode);
> >> +
> >> +        impl core::fmt::Display for FwNodeDisplayName<'_> {
> >> +            fn fmt(&self, f: &mut core::fmt::Formatter<'_>) -> core::fmt::Result {
> >> +                // SAFETY: self is valid by its type invariant
> >> +                let name = unsafe { bindings::fwnode_get_name(self.0.as_raw()) };
> >> +                if name.is_null() {
> >> +                    return Ok(());
> >
> > So if there is no name, you are returning Ok()?  Are you sure that's ok
> > to do?  What will the result of the string look like then?
> 
> In that case we're not writing anything to the formatter, which is
> equivalent to an empty string. `Ok(())` means that writing succeeded.
> 
> I assumed that a valid node would always have a name. And we're
> guaranteed to have a valid node. So I assumed this case would never
> happen and didn't think too hard about it. But even if a valid node has
> not name, empty string is probably the correct thing, right?

I don't know what this "name" is used for.  An empty string might not be
what you want to use here, given that you could be naming something
based on it, right?  fwnode_get_name() is used for many things,
including the detection if a name is not present at all, and if not,
then the code needs to clean up and abort.

So what exactly are you going to be using this for?

thanks,

greg k-h

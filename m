Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D9AC221719;
	Tue, 29 Apr 2025 16:39:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745944761; cv=none; b=W2m7614f2uTqKCd60pmgnlntYfvMUuyKHyaU+9135W1MlUpuApdK/MbiiD9d6IobgXRcMmwHYkPO79tMT7XBhUI1aTMgxBMlGT7JYhlHigrpl0FPwygqwAcMNRCIPHIe7MHEMujF5a2HuwMXyYz6ySysdYvkOJysoZzXIi6DMF0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745944761; c=relaxed/simple;
	bh=IUKUx5rHs3y0JzulFjrxiQiR+dG93QZgEfRxFoGZczw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=e/8okBdXCMALyvriDTMBN4U0WUBG2j6jSYdnaDHNhquOnpCNKop3yHkXf06C7mgITA+VqmQjF26WzJv7W1rv2i6VYK87hDe/fZWm9AbCHljqK4N/zAE19oHBbRZ/dCqUvHyGPPMnjM0ghg17CNBDqu0eAmUZ3AAax10oBDoBCgM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=HZvYhjBW; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="HZvYhjBW"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E931EC4CEE3;
	Tue, 29 Apr 2025 16:39:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1745944760;
	bh=IUKUx5rHs3y0JzulFjrxiQiR+dG93QZgEfRxFoGZczw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=HZvYhjBWJAWG88PFpWa0g8IHHenaqjt964kpD2VBxwvic8PB3n5xGhxKOVvyGtixn
	 aoUwNKZxDEQ+l/eDF5n5nffas9V4ow3d9l/T1X4NA/Iir3GtEjuJpxpjsHrb6xj3Va
	 OBMAjxKK6o2TsPE6+Uq4y0EuMyE3/2Ey4JoVR6p0=
Date: Tue, 29 Apr 2025 18:39:17 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Ayush Singh <ayush@beagleboard.org>
Cc: Danilo Krummrich <dakr@kernel.org>,
	Jason Kridner <jkridner@beagleboard.org>,
	Deepak Khatri <lorforlinux@beagleboard.org>,
	Robert Nelson <robertcnelson@beagleboard.org>,
	Dhruva Gole <d-gole@ti.com>, Miguel Ojeda <ojeda@kernel.org>,
	Alex Gaynor <alex.gaynor@gmail.com>,
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>,
	=?iso-8859-1?Q?Bj=F6rn?= Roy Baron <bjorn3_gh@protonmail.com>,
	Benno Lossin <benno.lossin@proton.me>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] rust: kernel: device: Add
 devm_of_platform_populate/depopulate
Message-ID: <2025042956-yelling-magnifier-5778@gregkh>
References: <20250429-rust-of-populate-v2-1-0ad329d121c5@beagleboard.org>
 <aBDi2LE3O1rIsGqn@pollux>
 <2025042904-trade-leverage-0f98@gregkh>
 <aBDl5oRIRpwbPrC1@pollux>
 <2025042945-aviator-subzero-0263@gregkh>
 <1fda026e-9ec5-46f6-84e8-4111263350ff@beagleboard.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <1fda026e-9ec5-46f6-84e8-4111263350ff@beagleboard.org>

On Tue, Apr 29, 2025 at 09:37:04PM +0530, Ayush Singh wrote:
> On 4/29/25 20:27, Greg Kroah-Hartman wrote:
> 
> > On Tue, Apr 29, 2025 at 04:44:54PM +0200, Danilo Krummrich wrote:
> > > On Tue, Apr 29, 2025 at 04:37:49PM +0200, Greg Kroah-Hartman wrote:
> > > > On Tue, Apr 29, 2025 at 04:31:52PM +0200, Danilo Krummrich wrote:
> > > > > On Tue, Apr 29, 2025 at 05:09:26PM +0530, Ayush Singh wrote:
> > > > > > +    /// Remove devices populated from device tree
> > > > > > +    pub fn devm_of_platform_depopulate(&self) {
> > > > > > +        // SAFETY: self is valid bound Device reference
> > > > > > +        unsafe { bindings::devm_of_platform_depopulate(self.as_raw()) }
> > > > > > +    }
> > > > > > +}
> > > > > One additional question regarding devm_of_platform_depopulate(). This function
> > > > > is only used once throughout the whole kernel (in [1]), and at a first glance
> > > > > the usage there seems unnecessary.
> > > > > 
> > > > > In your upcoming driver you call devm_of_platform_depopulate() from a fallible
> > > > > path [2].
> > > > > 
> > > > > So, I think we should change devm_of_platform_depopulate() to return an error
> > > > > instead of WARN(ret).
> > > > > 
> > > > > If [1] needs it for some subtle reason I don't see, then I think we can still
> > > > > call it from there as
> > > > > 
> > > > > 	WARN(devm_of_platform_depopulate())
> > > > > 
> > > > > [1] https://elixir.bootlin.com/linux/v6.15-rc4/source/drivers/soc/ti/pruss.c#L558
> > > > > [2] https://github.com/Ayush1325/linux/commit/cdb1322b7166532445c54b601ad0a252866e574d#diff-7b9e3179e36732d5f3a681034d70c2fda4ff57745c79ad4a656f328c91e54b77R71
> > > > Ugh, no, we should just delete this function entirely if only one driver
> > > > is using it.  That implies it's not really needed at all.
> > > Ayush's driver calls {de}populate() from a sysfs store path [2]; not sure what
> > > it's doing semantically or if this is a valid use-case though.
> > That's going to be rough, and full of tricky corner-cases and probably
> > shouldn't be doing that at all :)
> > 
> > So let's hold off on this entirely until we see a real user that can
> > actually pass review.  Trying to do system configuration like this in
> > sysfs is a much larger discussion than just adding rust bindings.
> > 
> > (hint, configfs is for system configuration, not sysfs...)
> > 
> > Anyway, worst case, you just "open code" the single function call that
> > this one binding was trying to "wrap".  which is what I think the
> > in-kernel user should be doing now.
> > 
> > thanks,
> > 
> > greg k-h
> 
> 
> Well, I don't really want to convert this discussion to addon board
> connector setup discussions. So I will try to keep things as short as
> possible here while linking to all the other discussions for the same.
> 
> For starters, what the driver does is as follows:
> 
> 1. Provide 3 sysfs entries:
> 
>     - New cape: Can write the name of the cape (I have not settled on the
> naming convention yet). This name is then used to load appropriate overlay
> from `/lib/firmware/` and populate all the devices. The overlay is applied
> to the connector node. Only one cape overlay can be used at a time.
> 
>     - Current cape: Just a ro entry to get the name of any active cape.
> 
>     - Delete cape: Remove cape overlay and registered devices.

That's great, but I don't think that's what sysfs is good for, we can
discuss that later when you submit your driver for review.

Again, look at configfs please, that's for "configuring" things.  sysfs
is for basic device properties and some tunables, but is NOT a major api
interface that requires a lot of logic like loading an overlay would
require.

Also, circumventing the "normal" device tree overlay interface and
discussion isn't ok either, this needs to work for all types of devices,
not just for "capes" like you have here.  To accept something like this
would be going around all of those other maintainers with their strong
views of how things should be done.

Anyway, we can discuss that when you submit your code for review, but
for now, I don't want to take this binding either as I think the whole
function should just be removed from the kernel anyway :)

thanks,

greg k-h

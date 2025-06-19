Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4A6CF2165E2;
	Thu, 19 Jun 2025 08:21:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750321289; cv=none; b=MuknxEdy7vlkYLId2obmCFHCYo4JILdQbf4ksMRZhrBx6EukCOVNBzrCKMBcA0HACb6gz2m9syGB3HOaFCFl1H8oxxujLouuVurE/M8gnnuEzzrMlBbO9Ke+iII7z3X44D5vOaocMys+3DVn8hmV3vIbT0LhdG+w/9SRlztGgk4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750321289; c=relaxed/simple;
	bh=5SuXMdojateYVCvuAk3sCmtmcLAbalP0g9EhYVurrOA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=pblx8gCylm7/TqwVEaUgZ7WzMsooZDXbtYHavi0eYeDqXlPz6iSdryotv1lEfPxP0qgXfUsshreNmBBerlQNM8TkcxAmhNxu0j9WRrusRLbAqOIn9n3kxQTdnZ5Y4qHP6orcehwkrNlrO+/okNUUvlCsauBp5Nn13GLjS01wvn4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=pcvzKo8O; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="pcvzKo8O"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 33771C4CEEA;
	Thu, 19 Jun 2025 08:21:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1750321288;
	bh=5SuXMdojateYVCvuAk3sCmtmcLAbalP0g9EhYVurrOA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=pcvzKo8OBZdXts9ZyCZ8I/H1s6YWs/Eg2MH9txyNAt5vFHMuG2TnBhlbT/CFgqUC2
	 0G9Uazl+qLB961WYVHC2E2xpOnvVEQgOFkgGGRkpuSXSPWQDtgAjeB5A33MBnWp8nw
	 mZ5vhD71haeWhnPNcvvgiy+uSYlJXdZ7YYBUsppk=
Date: Thu, 19 Jun 2025 10:21:25 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Sean Anderson <sean.anderson@linux.dev>
Cc: Saravana Kannan <saravanak@google.com>,
	"Rafael J . Wysocki" <rafael@kernel.org>,
	Danilo Krummrich <dakr@kernel.org>, linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org, Christoph Hellwig <hch@lst.de>,
	Rob Herring <robh+dt@kernel.org>,
	Grant Likely <grant.likely@linaro.org>
Subject: Re: [PATCH] driver core: Prevent deferred probe loops
Message-ID: <2025061929-produce-petticoat-8e0f@gregkh>
References: <CAGETcx-koKBvSXTHChYYF-qSU-r1cBUbLghJZcqtJOGQZjn3BA@mail.gmail.com>
 <a52c513c-ff93-4767-a370-3f7c562df7bd@linux.dev>
 <2025061147-squishier-oversleep-80cd@gregkh>
 <7d6d8789-e10b-4b06-aa99-5c1a1bdd3b4c@linux.dev>
 <CAGETcx9E5DB4UtdjjAO2=XfTNXdXocj7uk0JkVZ8hf9YadwNcA@mail.gmail.com>
 <70958a2e-abc8-4894-b99a-f2981db9981f@linux.dev>
 <2025061700-unmapped-labrador-a8c9@gregkh>
 <0ee2f641-c3f3-4a3a-87b4-e1279a862d68@linux.dev>
 <2025061740-banter-acclaim-2006@gregkh>
 <24a0f3fa-2121-4de3-89fd-482b217ab98d@linux.dev>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <24a0f3fa-2121-4de3-89fd-482b217ab98d@linux.dev>

On Tue, Jun 17, 2025 at 01:14:31PM -0400, Sean Anderson wrote:
> On 6/17/25 11:49, Greg Kroah-Hartman wrote:
> > On Tue, Jun 17, 2025 at 11:35:04AM -0400, Sean Anderson wrote:
> >> On 6/17/25 04:50, Greg Kroah-Hartman wrote:
> >> > On Thu, Jun 12, 2025 at 04:40:48PM -0400, Sean Anderson wrote:
> >> >> On 6/12/25 13:56, Saravana Kannan wrote:
> >> >> > On Thu, Jun 12, 2025 at 8:53 AM Sean Anderson <sean.anderson@linux.dev> wrote:
> >> >> >>
> >> >> >> On 6/11/25 08:23, Greg Kroah-Hartman wrote:
> >> >> >> > On Tue, Jun 10, 2025 at 07:44:27PM -0400, Sean Anderson wrote:
> >> >> >> >> On 6/10/25 19:32, Saravana Kannan wrote:
> >> >> >> >> > On Tue, Jun 10, 2025 at 11:35 AM Sean Anderson <sean.anderson@linux.dev> wrote:
> >> >> >> >> >>
> >> >> >> >> >> A deferred probe loop can occur when a device returns EPROBE_DEFER after
> >> >> >> >> >> registering a bus with children:
> >> >> >> >> >
> >> >> >> >> > This is a broken driver. A parent device shouldn't register child
> >> >> >> >> > devices unless it is fully read itself. It's not logical to say the
> >> >> >> >> > child devices are available, if the parent itself isn't fully ready.
> >> >> >> >> > So, adding child devices/the bus should be the last thing done in the
> >> >> >> >> > parent's probe function.
> >> >> >> >> >
> >> >> >> >> > I know there are odd exceptions where the parent depends on the child,
> >> >> >> >> > so they might add the child a bit earlier in the probe
> >> >> >> >>
> >> >> >> >> This is exactly the case here. So the bus probing cannot happen any
> >> >> >> >> later than it already does.
> >> >> >> >
> >> >> >> > Please fix the driver not to do this.
> >> >> >>
> >> >> >> How? The driver needs the PCS to work. And the PCS can live on the MDIO
> >> >> >> bus.
> >> >> > 
> >> >> > Obviously I don't know the full details, but you could implement it as
> >> >> > MFD. So the bus part would not get removed even if the PCS fails to
> >> >> > probe. Then the PCS can probe when whatever it needs ends up probing.
> >> >> 
> >> >> I was thinking about making the MDIO bus a separate device. But I think
> >> >> it will be tricky to get suspend/resume working correctly. And this
> >> >> makes conversions more difficult because you cannot just add some
> >> >> pcs_get/pcs_put calls, you have to split out the MDIO bus too (which is
> >> >> invariably created as a child of the MAC).
> >> >> 
> >> >> And what happens if a developer doesn't realize they have to split off
> >> >> the MDIO bus before converting? Everything works fine, except if there
> >> >> is some problem loading the PCS driver, which they may not test. Is this
> >> >> prohibition against failing after creating a bus documented anywhere? I
> >> >> don't recall seeing it...
> >> > 
> >> > What do you mean "failing after creating a bus"?  If a bus is failed to
> >> > be created, you fail like normal, no difference here.
> >> 
> >> Creating the bus is successful, but there's an EPROBE_DEFER failure after
> >> that. Which induces the probe loop as described in my initial email.
> > 
> > Then don't allow a defer to happen :)
> 
> Well, I could require all PCS drivers to be built-in I guess. But I suspect
> users will want them to be modules to reduce kernel size.

True, then just auto-load them as needed like all other busses do.

> > Or better yet, just succeed and spin up a new thread for the new bus to
> > attach it's devices to.  That's what many other busses do today.
> 
> Sorry, I'm not sure I follow. How can you attach a device to a thread? Do
> you have an example for this?

Busses discover their devices in a thread, which then calls probe for
them when needed.  A device isn't being attached to a thread, sorry for
the confusion.

thanks,

greg k-h

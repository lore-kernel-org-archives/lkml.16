Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A78DA28C5DC;
	Tue, 29 Apr 2025 08:50:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745916625; cv=none; b=m4KOZdLDzL3WJ1mZxoyNrzOnRPlafydnQ2vUaZWMJ9LGhRJMTl1vLu31HAxHFiIEDoC6SVOJTR3u83Tq3h1KeSM50h/biWOBgUvCab1E5pTZuphxHrV09ig4ffRuWqYOxVO05P67mfiCCSdd4AHIKPrHKExCM1CQFAttbIhFvVU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745916625; c=relaxed/simple;
	bh=Ml/13q0vC95SyVzhWSFXBnPjXdnRbqMxvb9SdPD+jS0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=LoZwphIPmc4OVoNpp1KH2Mlgk9XrsGmlMtUs9/m0HA0H0KkBCP51xUEfYfbIST2IXiNeXYQjruxaJwNIQG23HdDGqT43I8AyIDwJmShjAhc4YLijdpeScLnKG9lmvWL4/kXwkOt0xYP5mfO7yxxbuxS9SyIRD41ZAQvXS1yAiBs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=YtZWEZj6; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="YtZWEZj6"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 73009C4CEE3;
	Tue, 29 Apr 2025 08:50:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1745916625;
	bh=Ml/13q0vC95SyVzhWSFXBnPjXdnRbqMxvb9SdPD+jS0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=YtZWEZj6zIU8Jbq5ysBhy3/KTtuWI44HUn+4eAGzkqrPdwNZxU8E2kzHDW/4NxkeZ
	 4VNDlXFEOzZVaj5PGu0xGc7pChvECFgnoEBTlflGnCONJgDVTzpi2XvzRnaWtJCo/H
	 BDrobDQ8VgELEIH51GNKXyIwjgqSPZzHQh3n5wMhDQ0NjNOOf2WDZn8zbBBmSKPpO8
	 iO4PwsReqwe0png7H7HRjuFbNz/5M9qzCTFmhDSPSgKfCNXxRPYHABBwLYSiH7SrJw
	 0oPxrxvTlhtZ3DvLCuKa4eIOU1U9oPVfyZUuXnrityvWZBcLtbQdOIPg6I5PwYpt1Z
	 eKQD9kryqH+NQ==
Date: Tue, 29 Apr 2025 10:50:18 +0200
From: Danilo Krummrich <dakr@kernel.org>
To: Remo Senekowitsch <remo@buenzli.dev>
Cc: Rob Herring <robh@kernel.org>, Dirk Behme <dirk.behme@de.bosch.com>,
	Dirk Behme <dirk.behme@gmail.com>,
	Saravana Kannan <saravanak@google.com>,
	Miguel Ojeda <ojeda@kernel.org>,
	Alex Gaynor <alex.gaynor@gmail.com>,
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>,
	=?iso-8859-1?Q?Bj=F6rn?= Roy Baron <bjorn3_gh@protonmail.com>,
	Benno Lossin <benno.lossin@proton.me>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
	rust-for-linux@vger.kernel.org
Subject: Re: [PATCH v3 3/7] rust: property: Introduce PropertyGuard
Message-ID: <aBCSymzemg_6Fy2h@pollux>
References: <aAuryiI0lY4qYyIt@pollux>
 <81a65d89-b3e1-4a52-b385-6c8544c76dd2@gmail.com>
 <aAyyR5LyhmGVNQpm@pollux>
 <0756503c-02e7-477a-9e89-e7d4881c8ce6@gmail.com>
 <aA4ht5sUic39mnHj@pollux>
 <ee888c8f-4802-48a1-bd08-b454b782fff4@de.bosch.com>
 <aA-oQAol8rAU7vzg@cassiopeiae>
 <20250428204840.GB1572343-robh@kernel.org>
 <aA_xUWQt6-UCdlGM@cassiopeiae>
 <D9ILR2IG980H.34N8WNWKWJJO3@buenzli.dev>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <D9ILR2IG980H.34N8WNWKWJJO3@buenzli.dev>

On Mon, Apr 28, 2025 at 11:50:19PM +0200, Remo Senekowitsch wrote:
> On Mon Apr 28, 2025 at 11:21 PM CEST, Danilo Krummrich wrote:
> > On Mon, Apr 28, 2025 at 03:48:40PM -0500, Rob Herring wrote:
> >> 
> >> One thing that's really hard to debug in C drivers is where an 
> >> error came from. You can for example turn on initcall_debug and see that 
> >> a driver probe returned an error. It's virtually impossible to tell 
> >> where that originated from. The only way to tell is with prints. That is 
> >> probably the root of why probe has so many error prints. I think we can 
> >> do a lot better with rust given Result can hold more than just an int. 
> >
> > This I fully agree with, not sure if the solution is to put more stuff into the
> > Result type though. However, there are things like #[track_caller] (also
> > recently mentioned by Benno), which might be a good candidate for improving this
> > situation.
> >
> > As mentioned, for now let's go with
> >
> > 	pub fn required_by(self, dev: &Device) -> Result<T>
> >
> > additional to required() for this purpose to get a proper dev_err() print.
> 
> Could it make sense to _replace_ `required` with `required_by` ?
> Otherwise `required` sits a little awkwardly between `optional` and
> `required_by`. I can't think of a situation where `required` would be
> preferred.

Fine with me; required() also seems not useful to implement required_by().

However, I think we should revisit those generic error prints once we tackled
the issue of ergonomics in finding the source of an error in general.

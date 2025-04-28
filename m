Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 72D85A94A;
	Mon, 28 Apr 2025 21:21:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745875288; cv=none; b=oNOoj9wvGhdUZ9vnz1AnyUWfF4JY0WHQrnEvvdRYDDoW4AM5tZhiVLt6IxJNJv7D/cQAtvu4bo0r1k2ITcY944cS6kgg1wmNynUKbcoj/3XObeseRvujJbbWZQVMDruDeDHFbbtLKoYs4hxmTZI5yu2MxW8fE2nXWARJ2O3CT+o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745875288; c=relaxed/simple;
	bh=4YwjeJ3TGpwKkuGzjO7za9gGnG45ibSui6lQYdsZdc8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=kDCFJI4CcDPWxHxCGgRIYnxdFxsxnwihX6AtWbnKx4GzfKPie/QraaTG7uiL+AQpZLV/fBAp6CjWIAzoGym8jBZTqIC6Wj8P8ftGsNJKtu1PIDcLK0esQzkxyxKtS0B3iEZU/YcE76nHgt8AAMTFNQ/SbwSdKuk9cAHqN6qbMXE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=RA2TOoCV; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="RA2TOoCV"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2FC2DC4CEE4;
	Mon, 28 Apr 2025 21:21:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1745875287;
	bh=4YwjeJ3TGpwKkuGzjO7za9gGnG45ibSui6lQYdsZdc8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=RA2TOoCVf3/QBvdRc0cxe6uBb8HUMhLdeb5ai4AxyyvqizVBNqPWx4NKUXB/v4W3a
	 gm/GS/+b4PzmL+6+WrZKCzixb34+4AwB6Jdegjze3u40wCzXWKn3tY7nYlFzZakcav
	 t3z6YucDZWjZVM0uE87bj8WagYuZxe6H7pdF4er7Z5BMIxQsqsEjzDNHSUT21o4PYf
	 en4fGAF+cCJUYEWWh2XTwGMq1SUuFUrBkVzLUnFqUFpzXURAg+yP8NBGh1HmYR4ieu
	 KdBvGkinnxgc+uxHbfuMOxRpiTO2kF71WS+GkVlj4D7U0PMMxphIaqMCRmIihZR1pJ
	 EA8ADCaE2oihQ==
Date: Mon, 28 Apr 2025 23:21:21 +0200
From: Danilo Krummrich <dakr@kernel.org>
To: Rob Herring <robh@kernel.org>
Cc: Dirk Behme <dirk.behme@de.bosch.com>, Dirk Behme <dirk.behme@gmail.com>,
	Remo Senekowitsch <remo@buenzli.dev>,
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
Message-ID: <aA_xUWQt6-UCdlGM@cassiopeiae>
References: <20250425150130.13917-1-remo@buenzli.dev>
 <20250425150130.13917-4-remo@buenzli.dev>
 <aAuryiI0lY4qYyIt@pollux>
 <81a65d89-b3e1-4a52-b385-6c8544c76dd2@gmail.com>
 <aAyyR5LyhmGVNQpm@pollux>
 <0756503c-02e7-477a-9e89-e7d4881c8ce6@gmail.com>
 <aA4ht5sUic39mnHj@pollux>
 <ee888c8f-4802-48a1-bd08-b454b782fff4@de.bosch.com>
 <aA-oQAol8rAU7vzg@cassiopeiae>
 <20250428204840.GB1572343-robh@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250428204840.GB1572343-robh@kernel.org>

On Mon, Apr 28, 2025 at 03:48:40PM -0500, Rob Herring wrote:
> 
> One thing that's really hard to debug in C drivers is where an 
> error came from. You can for example turn on initcall_debug and see that 
> a driver probe returned an error. It's virtually impossible to tell 
> where that originated from. The only way to tell is with prints. That is 
> probably the root of why probe has so many error prints. I think we can 
> do a lot better with rust given Result can hold more than just an int. 

This I fully agree with, not sure if the solution is to put more stuff into the
Result type though. However, there are things like #[track_caller] (also
recently mentioned by Benno), which might be a good candidate for improving this
situation.

As mentioned, for now let's go with

	pub fn required_by(self, dev: &Device) -> Result<T>

additional to required() for this purpose to get a proper dev_err() print.

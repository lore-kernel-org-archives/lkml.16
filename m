Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9ABCE251788;
	Mon, 12 May 2025 17:44:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747071869; cv=none; b=JjFxv6VUtIsLK7jgEttErBB3php5yNh4S7uZ3PWPEOPXuo7NJu8Sw4+kFyuJldrH9CuY5O/qxlowmptRjGfnujtJb1SnZydw1OW6wTWqWbiSVkax3I1BNevxWQ18FtqJe06ACLlqen/gnKLFJb7seSJwGxWoaa9FLAjO59oKk1s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747071869; c=relaxed/simple;
	bh=2jaOeTXRTo6O+Dpv3rgcR5tqNqzM621hkni8JsfD2sE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=YwxsLt0uax57NwjPc+JeeoRJxIZc0kqojhByX1/MrQDlsnTbenCFXOk4B9+wstjO6rRGfNE8Mn6SoZVnbd1LrQ6+fL2weNCi64oO14IaYGvTbTQxuFj3TdH1txdyU5g5S1DexyWkCWvs5ABt1g7zK+NkSxlgS/pgw9ddzQ4Ont8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Tna/Lc78; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Tna/Lc78"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id ABB62C4CEEF;
	Mon, 12 May 2025 17:44:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747071869;
	bh=2jaOeTXRTo6O+Dpv3rgcR5tqNqzM621hkni8JsfD2sE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Tna/Lc78F3FoV8pMV38i88aoRvyDrdqGzWZDSnwfq5YQdcaEKoaIsEZehxhV6yVCd
	 /AZNBLTFvUIq8c4jmC+Az1NHFD2l1cyfKhu2oFmoi8p6EM+g0bqiDUsBNw8J175BMq
	 4tCUWqs5/t9CrZdERCIlJ1ASuBsFh3Yw6MDlUFammTMRRcjYbFXhEsv+t/IHpKfwRT
	 FUdPTKtEmpz/9lRSSlLlViw6pKODM5oxq+emXT56lvU9YvclAllPkzlq12lnrfFJvc
	 UZ9og2vnzvkqNGFlg8qkN3bGDFK67NKJ1F20J3y59vw5AHydHfQ2PnQGftCtHpydI3
	 9liB7bluMbxlw==
Date: Mon, 12 May 2025 19:44:23 +0200
From: Danilo Krummrich <dakr@kernel.org>
To: Rob Herring <robh@kernel.org>
Cc: Remo Senekowitsch <remo@buenzli.dev>,
	Viresh Kumar <viresh.kumar@linaro.org>,
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
	Dirk Behme <dirk.behme@de.bosch.com>, linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org, rust-for-linux@vger.kernel.org
Subject: Re: [PATCH v4 3/9] rust: device: Move property_present() to FwNode
Message-ID: <aCIzdx8drlVMzCLk@cassiopeiae>
References: <20250504173154.488519-1-remo@buenzli.dev>
 <20250504173154.488519-4-remo@buenzli.dev>
 <20250512172957.GB3463681-robh@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250512172957.GB3463681-robh@kernel.org>

On Mon, May 12, 2025 at 12:29:57PM -0500, Rob Herring wrote:
> On Sun, May 04, 2025 at 07:31:48PM +0200, Remo Senekowitsch wrote:
> > The new FwNode abstraction will be used for accessing all device
> > properties, so it must have the property_present method.
> > 
> > It's possible to duplicate the methods on the device itself, but since
> > some of the methods on Device would have different type sigatures as the
> > ones on FwNode, this would only lead to inconsistency and confusion.
> > Hence, remove the method from Device.
> > 
> > There aren't any users to update yet.
> 
> But there is one going into 6.16 most likely with the cpufreq stuff[1] 
> which complicates merging.

Should we target the upcoming merge window, I suggest to just add
FwNode::property_present() and remove Device::property_present() with a
subsequent patch for v6.17.

Should we not make it (which given that there are a few open points and -rc7 is
rather close is not that unlikely), we can just rebase and merge early.

> 
> Rob
> 
> [1] https://lore.kernel.org/all/f7e96b7da77ac217be5ccb09b9309da28fd96c90.1745218976.git.viresh.kumar@linaro.org/

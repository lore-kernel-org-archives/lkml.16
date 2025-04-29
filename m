Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B89902192E1;
	Tue, 29 Apr 2025 14:45:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745937901; cv=none; b=GzKhQLmIo1MQMSofcaf4DcWFBJHU854sPSspuVbmBnZ62//OfjwizXFSYF+1ASeCbxOR+gpDRwlf815wjnDpAjmq2fk2QDxPhd0KDNhJEoPiAe38+XxnhsmBlpe7NEXXOeo1y/yB1wk+aN5g2J1pl/l/PFmdDNCCyBwzM3V8Daw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745937901; c=relaxed/simple;
	bh=yh6jrYCzx4w3HFn+GGn6bJblwyr6OI1+JFpKoCro2MQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=om9wrvo5z59zjfzEqzA6uWSQOawq9FUWLFcU1eELuKt6rNqWAgvAAe/N3+3tPBd2Y085y2Dp/8urEnoTds0D3soBQ4oXJg3gh8c4oJOt+l1XDU3ZPxtv4uIdNE4XhzZKV8nPqLgej0V3Rf++vb2jg11riBJEwcLvC5a0qgL2dZM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Lipk2wGy; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Lipk2wGy"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A5591C4CEE3;
	Tue, 29 Apr 2025 14:44:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1745937901;
	bh=yh6jrYCzx4w3HFn+GGn6bJblwyr6OI1+JFpKoCro2MQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Lipk2wGyJSgUi1mhywaSDg0zku7ZooNg0E1sXIZtCj64hMsgb/hf7vxwXohfaW6Zo
	 fBOXjouqSuU1574csRw7ZzNNdEGJPoxwDT19w/4e0YXX/RlXspsTqBI6E2SPtndgLK
	 lYyIcZ/VemSwuOQOhBOJqMks220SSpx5ICKZ53Lq2+3EDW7W7na1NGJAiJt+aihgL9
	 FtxOpaev3+nK9sr9eE2HfvlqJotzGY+AktRfmj8+Z9k+QU3+qELq54cWlGUhKnYRgp
	 Cf3vkwf27FXJFp/SwxfnFlCwy3Es8UX5rqfRJIDZ69jsyFN3xTniKcaGeqkUog10gT
	 eV6LBXincn8dQ==
Date: Tue, 29 Apr 2025 16:44:54 +0200
From: Danilo Krummrich <dakr@kernel.org>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Ayush Singh <ayush@beagleboard.org>,
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
Message-ID: <aBDl5oRIRpwbPrC1@pollux>
References: <20250429-rust-of-populate-v2-1-0ad329d121c5@beagleboard.org>
 <aBDi2LE3O1rIsGqn@pollux>
 <2025042904-trade-leverage-0f98@gregkh>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <2025042904-trade-leverage-0f98@gregkh>

On Tue, Apr 29, 2025 at 04:37:49PM +0200, Greg Kroah-Hartman wrote:
> On Tue, Apr 29, 2025 at 04:31:52PM +0200, Danilo Krummrich wrote:
> > On Tue, Apr 29, 2025 at 05:09:26PM +0530, Ayush Singh wrote:
> > > +    /// Remove devices populated from device tree
> > > +    pub fn devm_of_platform_depopulate(&self) {
> > > +        // SAFETY: self is valid bound Device reference
> > > +        unsafe { bindings::devm_of_platform_depopulate(self.as_raw()) }
> > > +    }
> > > +}
> > 
> > One additional question regarding devm_of_platform_depopulate(). This function
> > is only used once throughout the whole kernel (in [1]), and at a first glance
> > the usage there seems unnecessary.
> > 
> > In your upcoming driver you call devm_of_platform_depopulate() from a fallible
> > path [2].
> > 
> > So, I think we should change devm_of_platform_depopulate() to return an error
> > instead of WARN(ret).
> > 
> > If [1] needs it for some subtle reason I don't see, then I think we can still
> > call it from there as
> > 
> > 	WARN(devm_of_platform_depopulate())
> > 
> > [1] https://elixir.bootlin.com/linux/v6.15-rc4/source/drivers/soc/ti/pruss.c#L558
> > [2] https://github.com/Ayush1325/linux/commit/cdb1322b7166532445c54b601ad0a252866e574d#diff-7b9e3179e36732d5f3a681034d70c2fda4ff57745c79ad4a656f328c91e54b77R71
> 
> Ugh, no, we should just delete this function entirely if only one driver
> is using it.  That implies it's not really needed at all.

Ayush's driver calls {de}populate() from a sysfs store path [2]; not sure what
it's doing semantically or if this is a valid use-case though.

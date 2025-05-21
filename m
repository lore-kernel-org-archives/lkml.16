Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 098902163BD;
	Wed, 21 May 2025 12:02:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747828970; cv=none; b=Qer+nBnBc9/E69iof3s/jMjCJBqhKiwLaU1grFrBJ416gSgyKvPT4Sk4WgD9UT5mplyG1Q6yu18lSgrtG+D2jR6Kmc1yRsFW8JOg2vQGS3j439pxRx3nqCCGCyudergBHJXwLaq+Kx88fqjgm64Sh2y7G37SG8EPm7cJBtlzEIs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747828970; c=relaxed/simple;
	bh=sdqaJ4spndMyYdm225LztWmZox/m2wDtMrpvyeg07f4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=UhkUKpeag5882PmPDjypQzSsT6J0DcZ8/3/NwyTW23bhQlKKEfsw/FZ+x+Gk9seJ7VEsTo4iUBD/fpIxnscjTdOMSyCeBVBAnmWiCSDHJJkMkKMqr512Wp384H//yHUuWTBEkFruew+vzDyPqhbHXNVAR3qO/TFmw0WSOZB5yPU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=wj/jfIfM; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="wj/jfIfM"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CE36FC4CEE7;
	Wed, 21 May 2025 12:02:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1747828969;
	bh=sdqaJ4spndMyYdm225LztWmZox/m2wDtMrpvyeg07f4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=wj/jfIfMbJZfR464GpB6T/cSnpn2qisnrJ1xPapKWW37XEPdWv2o1tpoD9pejFl1j
	 5NAFgkzNEhB69/qEf3fHcFf6AQ9FpXr8EOvLhz8VXfv0Uoh3KTFEW0O0W6b9fOaFiu
	 MFbNMkV9SktdybWFTyYQPp1ZvskXHl0+6GVvJq84=
Date: Wed, 21 May 2025 14:02:46 +0200
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
Message-ID: <2025052153-steadier-bargraph-e81a@gregkh>
References: <20250520200024.268655-1-remo@buenzli.dev>
 <20250520200024.268655-5-remo@buenzli.dev>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250520200024.268655-5-remo@buenzli.dev>

On Tue, May 20, 2025 at 10:00:19PM +0200, Remo Senekowitsch wrote:
> Add two new public methods `display_name` and `display_path` to
> `FwNode`. They can be used by driver authors for logging purposes. In
> addition, they will be used by core property abstractions for automatic
> logging, for example when a driver attempts to read a required but
> missing property.
> 
> Signed-off-by: Remo Senekowitsch <remo@buenzli.dev>
> ---
>  rust/kernel/device/property.rs | 72 ++++++++++++++++++++++++++++++++++
>  1 file changed, 72 insertions(+)
> 
> diff --git a/rust/kernel/device/property.rs b/rust/kernel/device/property.rs
> index 70593343bd811..6ccc7947f9c31 100644
> --- a/rust/kernel/device/property.rs
> +++ b/rust/kernel/device/property.rs
> @@ -32,6 +32,78 @@ pub(crate) fn as_raw(&self) -> *mut bindings::fwnode_handle {
>          self.0.get()
>      }
>  
> +    /// Returns an object that implements [`Display`](core::fmt::Display) for
> +    /// printing the name of a node.
> +    pub fn display_name(&self) -> impl core::fmt::Display + '_ {
> +        struct FwNodeDisplayName<'a>(&'a FwNode);
> +
> +        impl core::fmt::Display for FwNodeDisplayName<'_> {
> +            fn fmt(&self, f: &mut core::fmt::Formatter<'_>) -> core::fmt::Result {
> +                // SAFETY: self is valid by its type invariant
> +                let name = unsafe { bindings::fwnode_get_name(self.0.as_raw()) };
> +                if name.is_null() {
> +                    return Ok(());

So if there is no name, you are returning Ok()?  Are you sure that's ok
to do?  What will the result of the string look like then?

thanks,

greg k-h

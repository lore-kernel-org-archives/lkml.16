Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 40DA31DF25A;
	Wed, 30 Apr 2025 12:06:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746014805; cv=none; b=sJdOg8QilcYwNBdBEP+ndU97XF95HLbVTLTqN/76eCBQwCeU3yifGFaPXJfdVjpYuWWuyxWWujUPMng0Tsoz4mU1aXs3okRxhl5VFWUMRwyAkZLwzIMo/lS1cqlO6ieEoIPZYYt+jfyuSuU/1w8lAYk70dzEBxUYe4ueg65n69s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746014805; c=relaxed/simple;
	bh=IyVmcnxLst8x7+dH9uH0uZDS0nl/G8b8yL/MQzWe33w=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=B2GBJLCRHLMtFVgtmzU76kUb2dXc08U8PKgXyEbSVTuSZkKS7rDR1IDllAElpLncba5GA3YXVgzV3Tp4whsCd353qy0Pm9XQ4koM9KWsWatxaD5e2We83d3inc9BuqZyGkdbaLpA/huJtxRdVgnVy93FHlijS2wOp3MW3AwGK9U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=Ssij5tKD; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="Ssij5tKD"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7F7CEC4CEE9;
	Wed, 30 Apr 2025 12:06:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1746014805;
	bh=IyVmcnxLst8x7+dH9uH0uZDS0nl/G8b8yL/MQzWe33w=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Ssij5tKD22afvb834uyi/Xtzsd7VHbVkry/FS0u30StCJOZ6X3tFwDxzsaXlhxhtl
	 HM9W9c52wSUKiZBAR1Owjv2+xrax5vszv+fJLNsBlOBdYTZ0SQY0GeP+px7aOj15iD
	 1aC0mzBYv2N02dHhbarGsn3jzXZY649LRk6JFskM=
Date: Wed, 30 Apr 2025 13:04:05 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Alice Ryhl <aliceryhl@google.com>
Cc: Miguel Ojeda <ojeda@kernel.org>,
	Andrew Morton <akpm@linux-foundation.org>,
	Alexander Viro <viro@zeniv.linux.org.uk>,
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>,
	=?iso-8859-1?Q?Bj=F6rn?= Roy Baron <bjorn3_gh@protonmail.com>,
	Benno Lossin <benno.lossin@proton.me>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Trevor Gross <tmgross@umich.edu>,
	Danilo Krummrich <dakr@kernel.org>, rust-for-linux@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 2/2] uaccess: rust: add
 UserSliceReader::strcpy_into_buf
Message-ID: <2025043046-divisive-crawling-e4b9@gregkh>
References: <20250429-strncpy-from-user-v2-0-7e6facac0bf0@google.com>
 <20250429-strncpy-from-user-v2-2-7e6facac0bf0@google.com>
 <2025042919-varsity-registrar-fb45@gregkh>
 <aBICQt-CzQkMw4uk@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aBICQt-CzQkMw4uk@google.com>

On Wed, Apr 30, 2025 at 10:58:10AM +0000, Alice Ryhl wrote:
> On Tue, Apr 29, 2025 at 01:09:18PM +0200, Greg Kroah-Hartman wrote:
> > On Tue, Apr 29, 2025 at 09:02:23AM +0000, Alice Ryhl wrote:
> > > This patch adds a more convenient method for reading C strings from
> > > userspace. Logic is added to NUL-terminate the buffer when necessary so
> > > that a &CStr can be returned.
> > > 
> > > Note that we treat attempts to read past `self.length` as a fault, so
> > > this returns EFAULT if that limit is exceeded before `buf.len()` is
> > > reached.
> > > 
> > > Signed-off-by: Alice Ryhl <aliceryhl@google.com>
> 
> > > +        let mut len = raw_strncpy_from_user(self.ptr, dst)?;
> > > +        if len < dst.len() {
> > > +            // Add one to include the NUL-terminator.
> > > +            len += 1;
> > > +        } else if len < buf.len() {
> > > +            // We hit the `self.length` limit before `buf.len()`.
> > > +            return Err(EFAULT);
> > 
> > How can this happen?  And if it does, why is that a memory fault?
> > Doesn't this just mean that we read smaller than our overall size of our
> > buffer?  Or am I misreading this completely?
> > 
> > Maybe a self-test would be good to exercise all of this :)
> 
> How can I test userspace access? Is there a way to create a kernel
> buffer that strncpy_from_user will let you read from for use in a kunit
> test?

I think you'll need to just wire up a misc device and test it from
userspace, sorry.

thanks,

greg k-h

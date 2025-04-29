Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE03122157B;
	Tue, 29 Apr 2025 15:50:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745941845; cv=none; b=VfVZAPQvgD49vVcRkW9/MYtw0AkUuaC9/FAOoWld7JzJBjizWHuDlgKlimJXCkX3vby5AOwdz4q8F3LNStFVtuS8/iQ+7remqsWjBCZcJ70cij2N0AFvh9kebXwjHNphnKpenLLfO21y/BTvo6mekbIqidcnFxYGjJSe/MxNjTo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745941845; c=relaxed/simple;
	bh=jHZ8EeTe+TGi307GjaraxiWDdfXMhKwny28FuPPyazI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=eOOBG+MMFnuYjm0pLYTIeyv4um6UxDRHmuO+1tV8h29LoXNMBMqYuB/lEdp6skzO4OCJJ4CXG4OPQyE8SjB3XN+Sy6HShYOuHHlQ/mqsCIeTJRJ2jILAvDE2Dh7k7npqECvcEDmHzlXOj5clE5vYkOrkLJx3wU8TBwoougi1BkA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=HqY7zQAE; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="HqY7zQAE"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 95A19C4CEE3;
	Tue, 29 Apr 2025 15:50:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1745941845;
	bh=jHZ8EeTe+TGi307GjaraxiWDdfXMhKwny28FuPPyazI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=HqY7zQAEzYZlQpMuxmnguoDZfBMI9Wi7CTvR0vyHigPiBzbyHajVzZitlgLpbu4Av
	 rAuNwbz5ZnnoNhV6QNi7dkWOX1/CFARe6HiiDcdRcD7xwpFsJeCtDf/xnhDxHoKZT6
	 I69C11JIZWMUIKv54ZaLJZckwrH6485Uar/O86RQ=
Date: Tue, 29 Apr 2025 17:50:42 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Alice Ryhl <aliceryhl@google.com>
Cc: Danilo Krummrich <kernel@dakr.org>, Miguel Ojeda <ojeda@kernel.org>,
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
Message-ID: <2025042937-chemo-uprising-8524@gregkh>
References: <20250429-strncpy-from-user-v2-0-7e6facac0bf0@google.com>
 <20250429-strncpy-from-user-v2-2-7e6facac0bf0@google.com>
 <2025042919-varsity-registrar-fb45@gregkh>
 <4b54a2385923b1312606dbb5b651e163@dakr.org>
 <2025042946-accustom-bankroll-d934@gregkh>
 <aBDs9aMQSCLIqD96@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aBDs9aMQSCLIqD96@google.com>

On Tue, Apr 29, 2025 at 03:15:01PM +0000, Alice Ryhl wrote:
> On Tue, Apr 29, 2025 at 01:48:19PM +0200, Greg Kroah-Hartman wrote:
> > On Tue, Apr 29, 2025 at 01:38:26PM +0200, Danilo Krummrich wrote:
> > > On 2025-04-29 13:09, Greg Kroah-Hartman wrote:
> > > > On Tue, Apr 29, 2025 at 09:02:23AM +0000, Alice Ryhl wrote:
> > > > > +        let mut len = raw_strncpy_from_user(self.ptr, dst)?;
> > > > > +        if len < dst.len() {
> > > > > +            // Add one to include the NUL-terminator.
> > > > > +            len += 1;
> > > > > +        } else if len < buf.len() {
> > > > > +            // We hit the `self.length` limit before `buf.len()`.
> > > > > +            return Err(EFAULT);
> > > > 
> > > > How can this happen?
> > > 
> > > See my reply here (if I did not get it wrong):
> > > 
> > > https://lore.kernel.org/rust-for-linux/aBCrqJe4two4I45G@pollux/
> > 
> > Ah, I should have read ahead :)
> > 
> > I agree, some comments here would be good.  We want everyone to be able
> > to easily read and understand this code, off-by-one errors are rough.
> 
> I will add this comment:
> 
> if len < dst.len() {
>     // Add one to include the NUL-terminator.
>     len += 1;
> } else if len < buf.len() {
>     // This implies that len == dst.len() < buf.len().
>     //
>     // This means that we could not fill the entire buffer, but we had
>     // to stop reading because we hit the `self.length` limit of this
>     // `UserSliceReader`. Since we did not fill the buffer, we treat
>     // this case as if we tried to read past the `self.length` limit and
>     // received a page fault, which is consistent with other
>     // `UserSliceReader` methods that also return page faults when you
>     // exceed `self.length`.
>     return Err(EFAULT);

Looks great, thanks!

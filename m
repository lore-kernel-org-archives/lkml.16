Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6BD121ADC70;
	Sat,  1 Feb 2025 21:58:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738447122; cv=none; b=PYyu2xapfU5/F2bWSoaCwZizonKDMh479q9mA8vVQ3gHILrX6abfh4lFlStvAfKQNmZC37La6ApA+W1Z5Mv+VtfXjo7HUqnrEuyExWI+AAPgB4qq2pP1UVks15fOsTzeUUnQfIXquFKJlING0kITppHY50OCL4iIlxHMBfVQBqk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738447122; c=relaxed/simple;
	bh=4yah1ABe3jE+Fe5JVSEIfySOMTAzN0kapjiR7MMrkGc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=d7RrdAcx4Dj/4w8rJBWWSNQo6+2Uk3DouNAHRWitTBnGtEReaSAYe8k7sIYYW2fCsVHLsfTVMcxBMymJtZp7hQZj39zEQzq9HQqAVwtJrNkqqyrAxasH0QUEPmzYfSS8lIFin9CcoaQhlMjkPIiwpHTazQT7O5XR2CF8HmPk8p4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ioy/mTlh; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ioy/mTlh"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 49859C4CED3;
	Sat,  1 Feb 2025 21:58:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1738447121;
	bh=4yah1ABe3jE+Fe5JVSEIfySOMTAzN0kapjiR7MMrkGc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ioy/mTlhjq9m151pNAFVsf1W+L+m+A4nicWYXv7TIwJDqoGQZLoM4KpoRkwrD4psM
	 hsBxU95ZF7BoFQ/CKqZnXRuHXyGtBONdkfQffwQCoNqZjjoF/0jLdfE/haKQcjz0uH
	 b/UMAQtklUP6sGx3s14ReJJFgzEc/qBjZ5t3XYRIIoSF2sDOcKwa0oIijpWDQrEz6x
	 RRSQ3M7i75tOdoRXZgLQHjsGvj+oCFWZKcKOgVTR7LJq/W2hBEiQ6S2FXGF6j6sQ3e
	 uzo1YXFq6SyOJaPKXGzkL41RWQSWEqnYUf7t6XtjU8eZoKkSLMIC5uZF88IcLjHYAy
	 YNOJhtLm6ssqQ==
Date: Sat, 1 Feb 2025 22:58:36 +0100
From: Danilo Krummrich <dakr@kernel.org>
To: Tamir Duberstein <tamird@gmail.com>
Cc: Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>,
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>,
	=?iso-8859-1?Q?Bj=F6rn?= Roy Baron <bjorn3_gh@protonmail.com>,
	Benno Lossin <benno.lossin@proton.me>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>,
	rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] rust: alloc: satisfy `aligned_alloc` requirements
Message-ID: <Z56ZDEM9gcJhIXxW@pollux.localdomain>
References: <20250201-aligned-alloc-v1-1-c99a73f3cbd4@gmail.com>
 <Z56Bq94kPaN9UX5H@cassiopeiae>
 <CAJ-ks9n3KfcSqocjXY6QojF6R_aGBiRsXBuyiX8Y0rHtjm3sNw@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAJ-ks9n3KfcSqocjXY6QojF6R_aGBiRsXBuyiX8Y0rHtjm3sNw@mail.gmail.com>

On Sat, Feb 01, 2025 at 04:19:48PM -0500, Tamir Duberstein wrote:
> Hi Danilo, thanks for the review!
> 
> On Sat, Feb 1, 2025 at 3:18 PM Danilo Krummrich <dakr@kernel.org> wrote:
> >
> > I think I prefer this to be slightly more compact:
> >
> >    let min_align = core::mem::size_of::<*const crate::ffi::c_void>();
> >    let (align, size) = if layout.align() < min_align {
> >        (min_align, layout.size().div_ceil(min_align) * min_align)
> >    } else {
> >        (layout.align(), layout.size())
> >    };
> 
> I was trying to avoid repeated calls to either function, but I'm happy
> to shorten the variable names. Would that suit?

I think calling layout.align() twice is fine, no need shadow align for that.

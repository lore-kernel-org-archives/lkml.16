Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 587DE266577;
	Mon,  5 May 2025 16:12:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746461561; cv=none; b=HQEWyU++J08N6sg+Jefes8UetHtMwT5liODAQiHSrdSbyHBg99nNv+5fo+t5FtW5rsTwH8IZe3de0lLXeYF38A1uJ//KSgSHcTfQxpD3S8Dfi8qqwDRuxHwxfcVq1/8pDxOsVCSAMpzb3E4mAJMZZeYRK22b1xYlIFjFeRuGo9w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746461561; c=relaxed/simple;
	bh=GLMSUylzy48tyBX2/tC6g+YqsvG/I5O51oJlIWP071w=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=sCEs6I5A7ok44PwTw92utu50FOGzVR2x6Vc1osvDe8PdlsAuDtonn1WFupulNPjsp+Sm3iLelvrM+GtbN5aZVt6gwPhPlYUGnDSFHZ6Qalj8SQsiKOo7M6elud7TNuXJg0GI3zliSwt8h3bhiK51+Sh2QIXTh1AjgBAUtkc4pDY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=VB+XQ9SG; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="VB+XQ9SG"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A883AC4CEE4;
	Mon,  5 May 2025 16:12:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1746461559;
	bh=GLMSUylzy48tyBX2/tC6g+YqsvG/I5O51oJlIWP071w=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=VB+XQ9SGFdAbinGs+GNkllLN97Y5Mo2G0XEtUO93BJ9dcYb8OfBw4o0wsz3HdSt6j
	 lT2TBbUysMI/217e+v5IkmIWIKnhht5ZdUYNyJxV+xarqDAlQbKUfmkjIfuUpSvK9Y
	 FzBeyJB904OuJp02KhvC1SHUxW6CqPWY633G99uSI9gqBP7Y0BP0+JLYcx2/fw24dL
	 qj/0qZBc5tNefxNFLqa3bfbeH8VZ+QZdlAPNNzc9iE7VQwLUm/enWbiPPSzj3Q29pl
	 mbr4IW2Dpy6DMH8ndTV5ufB8aHjc9k2FkFBR0W4rrtFe3fCLFvE3NaUhyjrxUxUsAV
	 cQ3z+ZbJZ8YPw==
Date: Mon, 5 May 2025 18:12:30 +0200
From: Danilo Krummrich <dakr@kernel.org>
To: Remo Senekowitsch <remo@buenzli.dev>
Cc: Rob Herring <robh@kernel.org>, Dirk Behme <dirk.behme@de.bosch.com>,
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
Subject: Re: [PATCH v4 5/9] rust: device: Introduce PropertyGuard
Message-ID: <aBjjbj5Ax9ebbHj_@polis>
References: <20250504173154.488519-1-remo@buenzli.dev>
 <20250504173154.488519-6-remo@buenzli.dev>
 <5946174b-3178-462d-bb59-1e0d6c5f4dda@de.bosch.com>
 <D9O8WJ0RDNIA.4JYLWLYLBC2A@buenzli.dev>
 <CAL_Jsq+bzCc2r4H6=MfWq=9ku1SMCUL03KkCTeBPcqQrUEUMLg@mail.gmail.com>
 <D9OCJQ1HH5CM.2OHEAOF271GMC@buenzli.dev>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <D9OCJQ1HH5CM.2OHEAOF271GMC@buenzli.dev>

On Mon, May 05, 2025 at 05:53:33PM +0200, Remo Senekowitsch wrote:
> On Mon May 5, 2025 at 5:37 PM CEST, Rob Herring wrote:
> > They definitely exist. Any property in a child node of the device's
> > node when the child itself is not another device for example.
> 
> I don't think that counts, because you do have a device in that
> situation. The log should be assicated with that. So callers are
> responsible to propagate a reference to the device to wherever the call
> to .required_by(dev) is happening.

Exactly, let's keep things as they are for now. We can still add further methods
when we run into a real use-case. Currently, I can't see one coming in any time
soon.

- Danilo

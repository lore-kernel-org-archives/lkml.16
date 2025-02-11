Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 22CDA17C91;
	Tue, 11 Feb 2025 15:20:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739287260; cv=none; b=AM73WsjbxROE7VS4z3mV6QHBgCx0+REeS3sSCv1PFS3LyR6DgN/WSY8jPWCh0JgIR5RsJb7q1TAgiC+WkVdF3EZPrmkcgex4NZmKMlPTI1/7ZvcFpsgKCvywAnFFIBqWdMWnqE+mquRXlApVJypv7+VkY0WOTj0k4LAmU5ganVk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739287260; c=relaxed/simple;
	bh=YOgPfLEW60ZUOkAlUPJ0WPLrme4y4NTuEgefCCJdWms=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=i/xPAFjYlyA9El13Eglztt9JXcfejhbsyCI0DfGIZnusY4t6mAMVkW7CmXLtAtoAdG7U1inYzrS3AxPkwd8bVQfCQpKC6JOnvwW9cr6ED/tDLle6irjNo7lnOmV944xuqV4GEGX67LZKhp3FNzB2BL0F2RuYqN+eln93eaqkbiM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=PUPOPUTl; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="PUPOPUTl"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 459F4C4CEDD;
	Tue, 11 Feb 2025 15:20:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1739287259;
	bh=YOgPfLEW60ZUOkAlUPJ0WPLrme4y4NTuEgefCCJdWms=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=PUPOPUTlWCpikfRTvvf50NQt17SXtIct30j+ZS9jwVv9yeKy8Qs7mrLDg2NvAOn96
	 WPccsqXA4tf/thnOLMVCQC3PA+1IpBJXPgneydGjo2uS1xZUI0oGWTvpbtE42j1fWf
	 JDxIkGnzYkF3v5lSfhLfL20Ktvqm8dV00731c8uQNgP/B1Zqap4f+al+AfHzR1OBTw
	 md11LYzZ99yJELcbUDkERFJWoUWMS4pb3V6FofzJn2RJ9bePOk6hIOlTL1Rvy5MjHv
	 Ix4wDJFEzDNbdOkfXxroVnK8HnSbXxasS7o/W2CGra9S1lrTJH3UKwlgBVcNlAeXab
	 ffBqPs7VO3CDQ==
From: Andreas Hindborg <a.hindborg@kernel.org>
To: "Tamir Duberstein" <tamird@gmail.com>
Cc: "Miguel Ojeda" <ojeda@kernel.org>,  "Alex Gaynor"
 <alex.gaynor@gmail.com>,  "Boqun Feng" <boqun.feng@gmail.com>,  "Gary Guo"
 <gary@garyguo.net>,  =?utf-8?Q?Bj=C3=B6rn?= Roy Baron
 <bjorn3_gh@protonmail.com>,  "Benno
 Lossin" <benno.lossin@proton.me>,  "Alice Ryhl" <aliceryhl@google.com>,
  "Trevor Gross" <tmgross@umich.edu>,  "Kees Cook" <kees@kernel.org>,
  "Fiona Behrens" <me@kloenk.dev>,  "Martin Rodriguez Reboredo"
 <yakoyoku@gmail.com>,  "Asahi Lina" <lina@asahilina.net>,
  "Boris-Chengbiao Zhou" <bobo1239@web.de>,
  <rust-for-linux@vger.kernel.org>,  <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v2 0/2] rust: fix rust-analyzer configuration for
 generated files
In-Reply-To: <20250210-rust-analyzer-bindings-include-v2-0-23dff845edc3@gmail.com>
 (Tamir
	Duberstein's message of "Mon, 10 Feb 2025 13:04:15 -0500")
References: <uCkPc4oYMQYOO_OIOr9hdmmD0i6lpFa28yuPw6NZIf9H6UXHOExwYhoeVH4ZTnxI9hRjHj9fJTqNXMeDptF3vA==@protonmail.internalid>
	<20250210-rust-analyzer-bindings-include-v2-0-23dff845edc3@gmail.com>
User-Agent: mu4e 1.12.7; emacs 29.4
Date: Tue, 11 Feb 2025 16:20:44 +0100
Message-ID: <87tt90h5ir.fsf@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

"Tamir Duberstein" <tamird@gmail.com> writes:

> The individual patches should be descriptive on their own. They are
> included in a single series because the second patch uses a function
> introduced in the first.
>
> I've confirmed this allows me to navigate to symbols defined in
> generated files as well as to the generated files themselves. I am using
> an out-of-source build.
>
> Signed-off-by: Tamir Duberstein <tamird@gmail.com>

This is amazing, I have been missing this for so long =F0=9F=98=86 With thi=
s patch
I get auto completion of symbols in `bindings` and `uapi`, without it,
no completions. I build out of tree.

For the whole series:

Tested-by: Andreas Hindborg <a.hindborg@kernel.org>


Best regards,
Andreas Hindborg



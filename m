Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B5FF6225775;
	Fri,  2 May 2025 10:10:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746180631; cv=none; b=riv2/yWUk+fBmMho3wMg2W7woRzKLemhR/tcVLDjj4nkF407HFRpWsG4WGfvbow/OywMkTNoxav9vAxSvIU90AcXSK2avAgZpGo6Jms1BbeJVxmFhzcwBRRE5U/FdIgILss7sITyJKnYFAIE1VGboD7ZsnxxWwHihWaL87yBLQU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746180631; c=relaxed/simple;
	bh=Zqz34sHw6jEmLlDZDKcAkHnEq5y4Tbru6RcfdKMRiK8=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=gcVsEUp+JXhLKpHAr4yTPwfH6gv73qCx0B4uyg6UnVJtftMm+zNwRohmihv5lLzoWti/fHAeIvv89M3nawGYSL5D80SNuBPUTv1CiCHSdMLHIAHMvUWG1jqMd37JkO5QIF+zxtMzLxphbN6FVg50cIojNL+a1ZYpK0RsEKNkYds=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ophtlWu4; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ophtlWu4"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7C5D2C4CEE4;
	Fri,  2 May 2025 10:10:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1746180631;
	bh=Zqz34sHw6jEmLlDZDKcAkHnEq5y4Tbru6RcfdKMRiK8=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=ophtlWu4fXprAoJQfVNkZniRVp5uZMWw+8HntSQaLTBfB7m3u3nxxDN9CFAs/AfG6
	 Y031hgbVpJkfj7x05AeM51AtZqgD3cLHa9UZIr5GiLfzCNGsooZMlMgBt/xljSSE4Y
	 yTKpr8fWHO0Z2ZdV4+RMJjWLNGkGFqYmososb0tYCDxx91gzzzqCwhFODZR0tWOFWx
	 J0RRpW0RK8vidLlBGCmFdgtw6HAww74VI7m83Edt67ZJshzQlhcv/g/ls3phXMh9hZ
	 JyvUujWFrOABrbEg8tRgjLtagsF63kUVhRGDCQhURgvI9OmfpkXRu6rYqaJDNpQqPt
	 W9shR3JSdy+zw==
From: Andreas Hindborg <a.hindborg@kernel.org>
To: "Oliver Mangold" <oliver.mangold@pm.me>
Cc: "Miguel Ojeda" <ojeda@kernel.org>,  "Alex Gaynor"
 <alex.gaynor@gmail.com>,  "Boqun Feng" <boqun.feng@gmail.com>,  "Gary Guo"
 <gary@garyguo.net>,  =?utf-8?Q?Bj=C3=B6rn?= Roy Baron
 <bjorn3_gh@protonmail.com>,  "Benno
 Lossin" <benno.lossin@proton.me>,  "Alice Ryhl" <aliceryhl@google.com>,
  "Trevor Gross" <tmgross@umich.edu>,  "Asahi Lina" <lina@asahilina.net>,
  <rust-for-linux@vger.kernel.org>,  <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v10 2/5] rust: Rename AlwaysRefCounted to RefCounted
In-Reply-To: <20250502-unique-ref-v10-2-25de64c0307f@pm.me> (Oliver Mangold's
	message of "Fri, 02 May 2025 09:02:37 +0000")
References: <20250502-unique-ref-v10-0-25de64c0307f@pm.me>
	<j4Y2zgdg2RF4_FoquA0g4xizEoZ_AQPmh-n-jsWU5RL8p-aPZC6FXSV2vOQo4yNsDS63xJOqRZAyyqrNEeSJBQ==@protonmail.internalid>
	<20250502-unique-ref-v10-2-25de64c0307f@pm.me>
User-Agent: mu4e 1.12.7; emacs 30.1
Date: Fri, 02 May 2025 12:10:12 +0200
Message-ID: <87tt63z5kr.fsf@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

"Oliver Mangold" <oliver.mangold@pm.me> writes:

> AlwaysRefCounted will become a marker trait to indicate that it is allowed
> to obtain an ARef<T> from a `&T`, which cannot be allowed for types which
> are also Ownable.
>
> Signed-off-by: Oliver Mangold <oliver.mangold@pm.me>
> Suggested-by: Alice Ryhl <aliceryhl@google.com>


I would suggest using `code spans` when you mention code items
(`ARef<T>` and `&T`) the commit message.


Reviewed-by: Andreas Hindborg <a.hindborg@kernel.org>


Best regards,
Andreas Hindborg



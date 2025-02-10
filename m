Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CBB0B1C5F30;
	Mon, 10 Feb 2025 10:36:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739183786; cv=none; b=IcDH7oah4th3clgOO2c0AyT4OlTGi4qS1svcJF66qnkAGrcn298Yq1Kn8fkfiBOL+G2a9mvPMzpl57mcfy3Q13XIQz4wQxzgLmXmU6m4TI1Oatxj+IH0XLtF3FZ/8yrAwiYD+bDWhRq8ImslJspN0l4xXcw4GJVgzem0BEp2dV0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739183786; c=relaxed/simple;
	bh=cjXUsuPxGkKXxKH/DR3AMnNBl++GarbR2csEFI/F/ps=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=i+rwjtWGF3cbOW7n2t03Izsifn53BbHyhaDC/qHnp8uP8sdvaRgWFjsh1Zb88eKj1htCJzhj/pdGeEMjNYL4DlqDZwQv5J9J5h+f5qd30FYEFphgR71bnmmV83Zr/DN/IeRM6gIvKAl8zKa4j7iASHfuQ7QTA8xg4aPoCxjQR/o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=WJ5K7JKV; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="WJ5K7JKV"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 17A20C4CED1;
	Mon, 10 Feb 2025 10:36:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1739183786;
	bh=cjXUsuPxGkKXxKH/DR3AMnNBl++GarbR2csEFI/F/ps=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=WJ5K7JKVvMTPCkIj1PDn3DL832op06ZkwteFH2JFwfIHSP7OexHtt9Nk0s79eAqaE
	 u9/yr7MQs8z/MTLsQXjSg2r5O2jBoi+3QePTAcL5cZ4cbf4WCTlOhYc2ppbnNMvQbE
	 m6FZasyx+FKk6y5SgZuU9FhLDVOk0jTNAW+rWarWKqbigiab+o/LUvWCAOaicoeM0D
	 y35LMHFnffg+6Gg8Nqsdh9WUqJz7r/yzRAabgsx/EgHKx2txWw5JoQvE4ZZ0jOtyPg
	 agQYt76jPs4zl5n0wxW8aul4JC+l2JbvUB20YZBURTyG7s9fLgwLj0xkMKkHgeAkmT
	 3IEWXmJDrOEDA==
From: Andreas Hindborg <a.hindborg@kernel.org>
To: "Charalampos Mitrodimas" <charmitro@posteo.net>
Cc: "Danilo Krummrich" <dakr@kernel.org>,  "Miguel Ojeda"
 <ojeda@kernel.org>,  "Alex Gaynor" <alex.gaynor@gmail.com>,  "Boqun Feng"
 <boqun.feng@gmail.com>,  "Gary Guo" <gary@garyguo.net>,  =?utf-8?Q?Bj?=
 =?utf-8?Q?=C3=B6rn?= Roy Baron
 <bjorn3_gh@protonmail.com>,  "Benno Lossin" <benno.lossin@proton.me>,
  "Alice Ryhl" <aliceryhl@google.com>,  "Trevor Gross" <tmgross@umich.edu>,
  "Joel Becker" <jlbec@evilplan.org>,  "Christoph Hellwig" <hch@lst.de>,
  "Peter Zijlstra" <peterz@infradead.org>,  "Ingo Molnar"
 <mingo@redhat.com>,  "Will Deacon" <will@kernel.org>,  "Waiman Long"
 <longman@redhat.com>,  "Fiona Behrens" <me@kloenk.dev>,
  <rust-for-linux@vger.kernel.org>,  <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v2 2/3] rust: configfs: introduce rust support for configfs
In-Reply-To: <m2zfiw9lhi.fsf@posteo.net> (Charalampos Mitrodimas's message of
	"Sat, 08 Feb 2025 21:26:17 +0000")
References: <20250207-configfs-v2-0-f7a60b24d38e@kernel.org>
	<20250207-configfs-v2-2-f7a60b24d38e@kernel.org>
	<CZGVkZ7mvOAUI_2w8U2G_EoAobqvavP0Ic76I2F-1KzaCpp_SyIadNx_bF_dyjC9ednyqDz3phXuUgekW3uXDg==@protonmail.internalid>
	<m2zfiw9lhi.fsf@posteo.net>
User-Agent: mu4e 1.12.7; emacs 29.4
Date: Mon, 10 Feb 2025 11:36:14 +0100
Message-ID: <87mseuhysh.fsf@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

"Charalampos Mitrodimas" <charmitro@posteo.net> writes:

> Andreas Hindborg <a.hindborg@kernel.org> writes:
>
>> This patch adds a rust API for configfs, thus allowing rust modules to use
>> configfs for configuration. The implementation is a shim on top of the C
>> configfs implementation allowing safe use of the C infrastructure from
>> rust.
>>
>> The patch enables the `const_mut_refs` feature on compilers before rustc
>> 1.83. The feature was stabilized in rustc 1.83 and is not required to be
>> explicitly enabled on later versions.
>>
>> Signed-off-by: Andreas Hindborg <a.hindborg@kernel.org>
>>

[...]

>
> Tested-by: Charalampos Mitrodimas <charmitro@posteo.net>

Thanks for testing!

>
> One minor nit, "4096" is mentioned a lot in the sample, which is normal,
> should we have it as PAGE_SIZE (from kernel::page)?

Yes, I forgot. I will fix that.


Best regards,
Andreas Hindborg



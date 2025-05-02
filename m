Received: from r-passerv.ralfj.de (r-passerv.ralfj.de [109.230.236.95])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6404A433CE;
	Fri,  2 May 2025 09:00:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=109.230.236.95
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746176414; cv=none; b=T5iakt28PDhKtCx7dKVsTOiDxInLY3gjqQRhVIPRJKIKLCgumeZROWnXoBXOW4wd03OpnHawpr73FFiaAd/vxLGPwTFFSqUCPjCKOc33bC8rfgQiJItGKTU9UKqABXuuO+TEGu8DPtTsG0/98NG7d7/Fi/badP0RdbwO+E9+uM4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746176414; c=relaxed/simple;
	bh=nSJ7dsHhOdpMAvJWRIFCr0DtPePTSeT5BiA66yYg5OQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=HEJfSGZ9WjPhNolwJotGFulx/w+QxadxTyyDiUu48XmXBUy+vbwdx27xH4w2xT/4uZNgz6BGg4odVqnm5tUsejfqCKvvhBg0jOrVdDFtfGhICv7G7LMkwPlY12SEtBKNxGAZ5drane2+GIkmUGYExMN1RsVBzWUXWXsoOPcj1dQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ralfj.de; spf=pass smtp.mailfrom=ralfj.de; dkim=pass (1024-bit key) header.d=ralfj.de header.i=@ralfj.de header.b=mcqQVIGA; arc=none smtp.client-ip=109.230.236.95
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ralfj.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ralfj.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ralfj.de header.i=@ralfj.de header.b="mcqQVIGA"
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=ralfj.de; s=mail;
	t=1746176409; bh=nSJ7dsHhOdpMAvJWRIFCr0DtPePTSeT5BiA66yYg5OQ=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=mcqQVIGARTr04yLOdQA25G/JP2J4tbwSKg6otRAFuVAxy41dJ5WyDryonfXJCjGmY
	 dSrp+xFA26ImlcCSWxQqeMJVog4vklrMJGk/g7uhpv2Zed8NGq/vFKTr/AZmhSZjts
	 ohOx5Jb3Dnrj/ziselh4No7ZZlONh5Wa7086uzmo=
Received: from [IPV6:2001:67c:10ec:5784:8000::87] (2001-67c-10ec-5784-8000--87.net6.ethz.ch [IPv6:2001:67c:10ec:5784:8000::87])
	by r-passerv.ralfj.de (Postfix) with ESMTPSA id 667472052D19;
	Fri,  2 May 2025 11:00:09 +0200 (CEST)
Message-ID: <03dbef12-cecc-473e-8fb0-c736061f3e04@ralfj.de>
Date: Fri, 2 May 2025 11:00:09 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/3] rust: add UnsafePinned type
To: Christian Schrefl <chrisi.schrefl@gmail.com>,
 Benno Lossin <lossin@kernel.org>, Sky <sky@sky9.dev>,
 Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>,
 Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>,
 =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>,
 Benno Lossin <benno.lossin@proton.me>,
 Andreas Hindborg <a.hindborg@kernel.org>, Alice Ryhl <aliceryhl@google.com>,
 Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>,
 =?UTF-8?Q?Gerald_Wisb=C3=B6ck?= <gerald.wisboeck@feather.ink>
Cc: linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org
References: <20250430-rust_unsafe_pinned-v2-0-fc8617a74024@gmail.com>
 <20250430-rust_unsafe_pinned-v2-1-fc8617a74024@gmail.com>
 <D9JVKYI3LL5L.2SFOJMSK91HLA@kernel.org>
 <d433986a-fdad-4859-b8bf-080a18158189@gmail.com>
 <D9L1TI5NVKJU.361JFPWMLDWN4@kernel.org>
 <7bc9f839-a69a-4819-ba6d-36eadd8776b3@gmail.com>
 <D9L6XO6T7JEU.CK47C5BOQ0NG@kernel.org>
 <d5e8e635-08c4-4d3d-99a8-27f3b3a2153b@gmail.com>
Content-Language: en-US, de-DE
From: Ralf Jung <post@ralfj.de>
In-Reply-To: <d5e8e635-08c4-4d3d-99a8-27f3b3a2153b@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi all,

>> If you have a link to somewhere that explains that hack, then I'd also
>> put it there. I forgot if it's written down somewhere.
> 
> I haven't found anything that describes the hack in detail.
>  From what I understand its a combination of disabling `noalias`
> [0] (this PR enables it for `Unpin` types) and disabling
> `dereferencable` [1] on `&mut !Unpin` types.
> Related rust issue about this [2].
> 
> Maybe Alice, Ralf or someone else form the rust side can provide
> a better reference?

The `!Unpick` hack simply removes `noalias` and `dereferenceable` from `&mut 
!Unpin` and `Box<!Unpin>` types (similar to how we already remove  `noalias` and 
`dereferenceable` from `&!Freeze` types). This is not a stable guarantee and 
will probably change in future version of the compiler.

Kind regards,
Ralf


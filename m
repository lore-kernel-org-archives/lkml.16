Received: from mout-p-202.mailbox.org (mout-p-202.mailbox.org [80.241.56.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 572BE26A0BA;
	Tue, 20 May 2025 10:38:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.241.56.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747737482; cv=none; b=SfT9OeHYMp4IWnIAhFtIoUMfHtdMrgu/hieUjsnjOuPQjVbA9ZTJYbi+IuyZ6qx+mneOIRSAiawnrdoREL1juYq+41yBIBBN6zux4EJ8dBw6xj+DzkR4MpCQ/OaTZwDTgLrmhCr8fZTyztfNxq4BIfbV/bu0TEW8nkVc136BivM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747737482; c=relaxed/simple;
	bh=iS1bj/2sR5+h0HyFFRKyrXpUIPVQ48MY14zFmD4QMfE=;
	h=Mime-Version:Content-Type:Date:Message-Id:Cc:Subject:From:To:
	 References:In-Reply-To; b=u76n/d34kqz0R1vD7RLuFYodrnqxEkDlx/uWp3B7+d4cILHLOtae0U6eBh9Sxstx/xa6Z1wmsPZmiqQqqCUSPEG1zfT7QiwtZRUlfni1q5tr4oCZvkESfMcri5mWLnzFnrR6M9c8D6LCBYBxbOEQXoPsDx//6auvKyUrBytYGyU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=buenzli.dev; spf=pass smtp.mailfrom=buenzli.dev; arc=none smtp.client-ip=80.241.56.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=buenzli.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=buenzli.dev
Received: from smtp2.mailbox.org (smtp2.mailbox.org [IPv6:2001:67c:2050:b231:465::2])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-202.mailbox.org (Postfix) with ESMTPS id 4b1rc45FYrz9syt;
	Tue, 20 May 2025 12:37:56 +0200 (CEST)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 20 May 2025 12:37:51 +0200
Message-Id: <DA0X867CPP0V.22GHRMZOW4DHB@buenzli.dev>
Cc: "Rob Herring" <robh@kernel.org>, "Saravana Kannan"
 <saravanak@google.com>, "Miguel Ojeda" <ojeda@kernel.org>, "Alex Gaynor"
 <alex.gaynor@gmail.com>, "Boqun Feng" <boqun.feng@gmail.com>, "Gary Guo"
 <gary@garyguo.net>, =?utf-8?q?Bj=C3=B6rn_Roy_Baron?=
 <bjorn3_gh@protonmail.com>, "Benno Lossin" <benno.lossin@proton.me>,
 "Andreas Hindborg" <a.hindborg@kernel.org>, "Alice Ryhl"
 <aliceryhl@google.com>, "Trevor Gross" <tmgross@umich.edu>, "Greg
 Kroah-Hartman" <gregkh@linuxfoundation.org>, "Rafael J. Wysocki"
 <rafael@kernel.org>, "Dirk Behme" <dirk.behme@de.bosch.com>,
 <linux-kernel@vger.kernel.org>, <devicetree@vger.kernel.org>,
 <rust-for-linux@vger.kernel.org>
Subject: Re: [PATCH v4 6/9] rust: device: Add bindings for reading device
 properties
From: "Remo Senekowitsch" <remo@buenzli.dev>
To: "Benno Lossin" <lossin@kernel.org>, "Danilo Krummrich" <dakr@kernel.org>
References: <20250504173154.488519-1-remo@buenzli.dev>
 <20250504173154.488519-7-remo@buenzli.dev> <aCH5WgORn9ZGl9Il@pollux>
 <DA093HA2415H.29OCPLS0M7H84@buenzli.dev> <aCtici15vSCBDbzE@pollux>
 <DA0EDC6W54E5.2CO8VXPTOXXJK@buenzli.dev>
 <DA0T1M8YEHZ9.1AW3IGD1IZX7Z@kernel.org>
 <DA0TG9P9N7CI.3STZPSRIV6NDX@kernel.org>
In-Reply-To: <DA0TG9P9N7CI.3STZPSRIV6NDX@kernel.org>
X-Rspamd-Queue-Id: 4b1rc45FYrz9syt

On Tue May 20, 2025 at 9:40 AM CEST, Benno Lossin wrote:
> On Tue May 20, 2025 at 9:21 AM CEST, Benno Lossin wrote:
>> On Mon May 19, 2025 at 9:51 PM CEST, Remo Senekowitsch wrote:
>>> On Mon May 19, 2025 at 6:55 PM CEST, Danilo Krummrich wrote:
>>>> Also, the PropertyInt trait itself has to be unsafe, given that it con=
tains
>>>> unsafe functions.
>>>
>>> I don't think a trait necessarily has to be marked unsafe just because
>>> it has unsafe methods. Marking a trait as unsafe means that implementor=
s
>>> of the trait must uphold some invariants. This is not the case here
>>> IIUC. Here's a good explanation of my understanding: [1]
>>
>> Yes this is correct, I don't think that the trait itself should be
>> unsafe.
>
> Ahh, I understood now why Danilo suggested this: if the trait should
> guarantee that `fwnode_property_read_*_array` is called, then the trait
> would have to be `unsafe`.

Oh yeah, that's true. Callers rely on the fact that if the function
returns zero, the requested number of elements have been initialized.
That's definitely a safety invariant implementors must uphold...
So I guess marking the trait unsafe is correct.

> But I don't think that's necessary, we don't have any other unsafe code
> that needs to rely on that.

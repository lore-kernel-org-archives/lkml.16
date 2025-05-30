Received: from mout-p-201.mailbox.org (mout-p-201.mailbox.org [80.241.56.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F0E8E289E0E;
	Fri, 30 May 2025 21:45:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.241.56.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748641548; cv=none; b=HAZ93pZVkOEeKBbV4CNSA91y5DaotNPTfxnIad3lXSQcebJtClreXAfljJkNUKTMfPq6eut+5jwWs6uTUpuNg1IqDk30QapyM5q5aMeHghwFGwZPL42T9S1lMkjvXySbUkyemBipAtGIV9iF+xleRBaaNvcQvMmSP2ZzWjyMVMc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748641548; c=relaxed/simple;
	bh=ELGDWYaT/yqGnkIaDK9K5mFt6JxZBw9PbPqY0ncpWtQ=;
	h=Mime-Version:Content-Type:Date:Message-Id:Cc:Subject:From:To:
	 References:In-Reply-To; b=nrbSkm3cdq3XY4JIzQXv5C1O+O97qz1valU+QjxvCQDMw8mLMreJVOgSIqM5cZLKP1kB6LCliojzv/Lou8HWaVYSAdIWfucEsuuo0WqkeYtmf3JsozumBHz7s2wTKn2tGaoCjiVOs6xPX94sKx23evYfO4M0aOUGIOFbCI3o1yk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=buenzli.dev; spf=pass smtp.mailfrom=buenzli.dev; arc=none smtp.client-ip=80.241.56.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=buenzli.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=buenzli.dev
Received: from smtp1.mailbox.org (smtp1.mailbox.org [IPv6:2001:67c:2050:b231:465::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-201.mailbox.org (Postfix) with ESMTPS id 4b8Gxx6496z9tj8;
	Fri, 30 May 2025 23:45:41 +0200 (CEST)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 30 May 2025 23:45:38 +0200
Message-Id: <DA9TOWRKLFUF.3AWTUTNDPI8OR@buenzli.dev>
Cc: "Rob Herring" <robh@kernel.org>, "Saravana Kannan"
 <saravanak@google.com>, "Miguel Ojeda" <ojeda@kernel.org>, "Alex Gaynor"
 <alex.gaynor@gmail.com>, "Boqun Feng" <boqun.feng@gmail.com>, "Gary Guo"
 <gary@garyguo.net>, =?utf-8?q?Bj=C3=B6rn_Roy_Baron?=
 <bjorn3_gh@protonmail.com>, "Benno Lossin" <lossin@kernel.org>, "Andreas
 Hindborg" <a.hindborg@kernel.org>, "Alice Ryhl" <aliceryhl@google.com>,
 "Trevor Gross" <tmgross@umich.edu>, "Greg Kroah-Hartman"
 <gregkh@linuxfoundation.org>, "Rafael J. Wysocki" <rafael@kernel.org>,
 "Dirk Behme" <dirk.behme@de.bosch.com>, <linux-kernel@vger.kernel.org>,
 <devicetree@vger.kernel.org>, <rust-for-linux@vger.kernel.org>
Subject: Re: [PATCH v7 0/9] More Rust bindings for device property reads
From: "Remo Senekowitsch" <remo@buenzli.dev>
To: "Danilo Krummrich" <dakr@kernel.org>
References: <20250530192856.1177011-1-remo@buenzli.dev>
 <aDoNczwEWCDows_-@pollux>
In-Reply-To: <aDoNczwEWCDows_-@pollux>
X-Rspamd-Queue-Id: 4b8Gxx6496z9tj8

On Fri May 30, 2025 at 9:56 PM CEST, Danilo Krummrich wrote:
> On Fri, May 30, 2025 at 09:28:47PM +0200, Remo Senekowitsch wrote:
>> changes in v7:
>> * Fix a typo in a commit message.
>> * Fix bug in `FwNode::display_path`. I took a slightly different
>>   approach than the one suggested, using `Either` to handle the
>>   owned and borrowed case. That also removes the conditional
>>   `fwnode_handle_put` at the end.
>
> That's a good idea, but also a bit unfortunate; there are efforts to remo=
ve
> Either [1] in favor of using - more descriptive - custom enum types.
>
> Can you please replace this with e.g. an enum Node with a Borrowed and Ow=
ned
> variant?
>
> [1] https://lore.kernel.org/lkml/20250519124304.79237-1-lossin@kernel.org=
/

Sure, that seems reasonable.

Btw. what's the normal waiting time before posting a new version of a
patch series? The requested changes have been getting fewer and I could
crank these out much faster, but my gut feeling tells me not to spam the
list too much. Or is that wrong and people can deal with quick updates
just fine?

Best regards,
Remo

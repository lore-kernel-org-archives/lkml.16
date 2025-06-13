Received: from mout-p-103.mailbox.org (mout-p-103.mailbox.org [80.241.56.161])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7AFD7257429;
	Fri, 13 Jun 2025 07:45:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.241.56.161
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749800762; cv=none; b=uH4zgIHcm1Ao9jZD2/iShtll4NCuq2Jgn2L2O5GbO2P2P/uTjRMGRPijmQKhLLnk37RwlZvld6Vg2v93wOscZQg5sn6gw6FLrDqPcUtSJ7AaF1Qn3zB5r/j8iNHyX+O3umtRk0GBDtXeOOSKUlCMKd7E+C27OTNUwxZdBywHajk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749800762; c=relaxed/simple;
	bh=HSsbIO/yBWYpAUsXUWOO0TGRD0D9fEyuSZV/FHrGhc8=;
	h=Mime-Version:Content-Type:Date:Message-Id:From:To:Cc:Subject:
	 References:In-Reply-To; b=Gyt0i9SXLPyX7g7yin1R0xM/QLMZdU8/BN6Mb5Cvthxd25+PFUcwvNazaSRtzcanVGKx2i57DKkvHPJ4rz9TkWB1FSdjyjsUQKOFfIIx8wp7Vz/IhooPMjFm2Dr296HL5vKgJlf3NhbMLTOnkmVQH7Hmkj696qZbj3pqfj+qs9M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=buenzli.dev; spf=pass smtp.mailfrom=buenzli.dev; arc=none smtp.client-ip=80.241.56.161
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=buenzli.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=buenzli.dev
Received: from smtp2.mailbox.org (smtp2.mailbox.org [10.196.197.2])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-103.mailbox.org (Postfix) with ESMTPS id 4bJWfT4Z1gz9s2L;
	Fri, 13 Jun 2025 09:45:53 +0200 (CEST)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 13 Jun 2025 09:45:47 +0200
Message-Id: <DAL8LI3LMET9.3LW0J9JED1EZG@buenzli.dev>
From: "Remo Senekowitsch" <remo@buenzli.dev>
To: "Danilo Krummrich" <dakr@kernel.org>
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
Subject: Re: [PATCH v8 0/9] More Rust bindings for device property reads
References: <20250611102908.212514-1-remo@buenzli.dev>
 <aEtjONTgqDikCoB6@cassiopeiae>
In-Reply-To: <aEtjONTgqDikCoB6@cassiopeiae>

On Fri Jun 13, 2025 at 1:31 AM CEST, Danilo Krummrich wrote:
> On Wed, Jun 11, 2025 at 12:28:59PM +0200, Remo Senekowitsch wrote:
>> Remo Senekowitsch (9):
>>   rust: device: Create FwNode abstraction for accessing device
>>     properties
>>   rust: device: Enable accessing the FwNode of a Device
>>   rust: device: Move property_present() to FwNode
>>   rust: device: Enable printing fwnode name and path
>>   rust: device: Introduce PropertyGuard
>>   rust: device: Implement accessors for firmware properties
>>   samples: rust: platform: Add property read examples
>
> Applied to driver-core-testing, thanks!
>
> Once the patches passed 0-day testing they will be merged into driver-cor=
e-next.
>
>>   rust: device: Add child accessor and iterator
>>   rust: device: Add property_get_reference_args
>
> I did drop those two patches for now, because:
>
>   (1) They're basically dead code.
>
>   (2) It seems that FwNode::property_get_reference_args() leaks a struct
>       fwnode_handle reference. property_get_reference_args() explicitly s=
ays
>       that the caller is responsible "for calling fwnode_handle_put() on =
the
>       returned @args->fwnode pointer", which doesn't seem to happen.
>
> Can you please fix the leak and resend those two patches with an addition=
al one
> that adds a sample usage of the introduced methods to the platform sample
> driver?

Alright, thanks. I suppose that should be a new patch series, with a new
title and starting at v1 ..?

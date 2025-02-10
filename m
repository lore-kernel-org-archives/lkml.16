Received: from mail-40133.protonmail.ch (mail-40133.protonmail.ch [185.70.40.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 69E8D24F587;
	Mon, 10 Feb 2025 16:32:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.70.40.133
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739205151; cv=none; b=qKasEAdIbyNmPMb1lLijhlTmvTt410Dhu0odOUXDhajGFZgwncbDuq/ny1ryXC3DbXIAachicO/Id4zn8PHBB7Zgm1jiWF89cuUaLWcxH/gA3QmY+8+/3ct8edVUXapngMvXnMvJZttO8eQei9aOFTJhhH92kT7nx2yyJaYW73M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739205151; c=relaxed/simple;
	bh=ugd1qIuke76CaTA7KQybUf2kPKH3fnXth307upmf4sw=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=PUYbMWY2NY/1gUzQZhCqzV3/aLaFZi1r/G2qZGrhHudSznuHWdzQ7xlLM2rkzv8NH87/mZ3OeTl5Yq3rUpzqri/IcdVl+O/LZix0fdcTZHNPfQBYqEWBOVWux1ve9dR/Eit998dbCz3ayoXD7BgFavwPYeOjU+GRbY0yCaAAfGw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=proton.me; spf=pass smtp.mailfrom=proton.me; dkim=pass (2048-bit key) header.d=proton.me header.i=@proton.me header.b=CeFn2u6/; arc=none smtp.client-ip=185.70.40.133
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=proton.me
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=proton.me
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=proton.me header.i=@proton.me header.b="CeFn2u6/"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=proton.me;
	s=protonmail; t=1739205141; x=1739464341;
	bh=ugd1qIuke76CaTA7KQybUf2kPKH3fnXth307upmf4sw=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector:List-Unsubscribe:List-Unsubscribe-Post;
	b=CeFn2u6/QbRozbj668LMSNjTqUS42qFcwfNQv76gcb7ozEGV6pKZtAEQlSrtDmbex
	 1YWf+7YNKx/49ge6A8dfMirfIg4J6lp9BReA6nddzT7xVNrvNWSe0kb0fQ51XoIp40
	 /e9N6GoRSO7c2W+jtXWRNBw5cCCqngFLYRciQGoFuAia0uPf6CP6hGikmz8YrcS6ag
	 TVnCrdQSDlu4m0Oxo8e/UsA9RPH+okLYGAfNznul4yTx1HN+U8pnFGDUGz/3wPKXNi
	 BC6bwCCFQRMxZqs2wiPzcdUesYH9flYjQDwbqz/5uE6E48jEByRP7w5+FwcCpSLLBD
	 mFm5oljHnKoBQ==
Date: Mon, 10 Feb 2025 16:32:15 +0000
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-kernel@vger.kernel.org, Lyude Paul <lyude@redhat.com>, "Rafael J. Wysocki" <rafael@kernel.org>, Danilo Krummrich <dakr@kernel.org>
From: Benno Lossin <benno.lossin@proton.me>
Cc: Alexander Lobakin <aleksander.lobakin@intel.com>, Andy Shevchenko <andriy.shevchenko@linux.intel.com>, Bjorn Helgaas <bhelgaas@google.com>, Jonathan Cameron <Jonathan.Cameron@huawei.com>, Liam Girdwood <lgirdwood@gmail.com>, Lukas Wunner <lukas@wunner.de>, Mark Brown <broonie@kernel.org>, =?utf-8?Q?Ma=C3=ADra_Canal?= <mairacanal@riseup.net>, Robin Murphy <robin.murphy@arm.com>, Simona Vetter <simona.vetter@ffwll.ch>, Zijun Hu <quic_zijuhu@quicinc.com>, linux-usb@vger.kernel.org, rust-for-linux@vger.kernel.org, Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Subject: Re: [PATCH v4 2/9] rust/kernel: Add faux device bindings
Message-ID: <c00ee85d-8e8f-4d59-9c90-af5fd35cc4ac@proton.me>
In-Reply-To: <2025021026-exert-accent-b4c6@gregkh>
References: <2025021023-sandstorm-precise-9f5d@gregkh> <2025021026-exert-accent-b4c6@gregkh>
Feedback-ID: 71780778:user:proton
X-Pm-Message-ID: 0a946bef26e36d0a883a3eba6dd1e454915b1684
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On 10.02.25 13:30, Greg Kroah-Hartman wrote:
> From: Lyude Paul <lyude@redhat.com>
>=20
> This introduces a module for working with faux devices in rust, along wit=
h
> adding sample code to show how the API is used. Unlike other types of
> devices, we don't provide any hooks for device probe/removal - since thes=
e
> are optional for the faux API and are unnecessary in rust.

For me it would be useful to know why this is the case. I looked at the
dummy regulator driver and it still has a `probe` function. Presumably,
because it has to wait until other resources are usable and that is the
case once `probe` gets called. But doesn't the same hold for Rust? Or
are Rust modules loaded later than C modules? Because if I were to
rewrite the regulator driver in Rust (assuming we had the abstractions),
the `probe` code would be put into the `Module::init` function, right?
Or am I missing something?

Thanks!
Benno


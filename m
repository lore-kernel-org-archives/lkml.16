Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BABFE22A1E5;
	Wed, 14 May 2025 16:05:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747238717; cv=none; b=YDFQwnEI2UQDq8s+kbi4YEn3mNJgaYQiSbnQUQPlCMrl9PNnbTWp/PSxEoVucvg6EN1nFyywsb/HTGO0/G3UhRjywJo2lbjsj6G1h3ZkDCGkrKsBRxdUENJqpLm/1dAEbMU80morVaa00J7Lu125NAUXPBosxosVNPNO/Dk+KOs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747238717; c=relaxed/simple;
	bh=K5SbCUR48viLumkMFB4d7bJeXuIy++1ZKMdNBUHbUFE=;
	h=Mime-Version:Content-Type:Date:Message-Id:Cc:Subject:From:To:
	 References:In-Reply-To; b=H8AG09Mx8yFTrs54BX7o+olG4dKdMnW6IeyFn2IuJhNZdSA4DRoHNCO2y2o4CUqtwBUzAa7XUQVP1MWeBP667ZvCw6mlR+15t8xqL2dL24pIcrPH+H9FRodjEdr5yMGYw47mgQIEKGbNOG6ShztOdpznbAawNwDh6Nfp5VmaPfg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Yy0QP7v7; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Yy0QP7v7"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EA930C4CEE3;
	Wed, 14 May 2025 16:05:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747238717;
	bh=K5SbCUR48viLumkMFB4d7bJeXuIy++1ZKMdNBUHbUFE=;
	h=Date:Cc:Subject:From:To:References:In-Reply-To:From;
	b=Yy0QP7v7ghmckWndnzmIs0qPPRDE1FBSrLltHlpSBFEWqaaeCfjoibV4vD1yKPFv5
	 Sq7vWsus/M7SF/4SalFwYhIKrT7L832eBRF08Iasql+db0I2eU1tZMMYmH2OqFhPI/
	 4uUFfSr+gJhXaJCy0hsdX9dbZLqBItGDDYAci5mPkG12Qq7l+zKaMZ1vQaeVfX+tWX
	 +4/8txqrO/DUbM7qj+D5TXVzk1ASpDUzEVLfyRtNTYcDao38t1+6psPVHMc9TD56au
	 vzoQN0Slw0VO8shqVXmiX6qHuWVrQ4yjk41k3RfgPMK0hJIaJytn/SXHW4aTHX93do
	 eucpC0DElWW6g==
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 14 May 2025 18:05:11 +0200
Message-Id: <D9W0FJ6MKPTE.1NI5HK0TJRHCM@kernel.org>
Cc: "Daniel Almeida" <daniel.almeida@collabora.com>, "Miguel Ojeda"
 <ojeda@kernel.org>, "Alex Gaynor" <alex.gaynor@gmail.com>, "Boqun Feng"
 <boqun.feng@gmail.com>, "Gary Guo" <gary@garyguo.net>,
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, "Benno Lossin"
 <benno.lossin@proton.me>, "Andreas Hindborg" <a.hindborg@kernel.org>,
 "Alice Ryhl" <aliceryhl@google.com>, "Trevor Gross" <tmgross@umich.edu>,
 "Danilo Krummrich" <dakr@kernel.org>, "Boris Brezillon"
 <boris.brezillon@collabora.com>, "Sebastian Reichel"
 <sebastian.reichel@collabora.com>, "Liam Girdwood" <lgirdwood@gmail.com>,
 <linux-kernel@vger.kernel.org>, <rust-for-linux@vger.kernel.org>
Subject: Re: [PATCH v3] rust: regulator: add a bare minimum regulator
 abstraction
From: "Benno Lossin" <lossin@kernel.org>
To: "Mark Brown" <broonie@kernel.org>
X-Mailer: aerc 0.20.1
References: <20250513-topics-tyr-regulator-v3-1-4cc2704dfec6@collabora.com>
 <D9VATLUHDGU8.53I80TGVRV0J@kernel.org>
 <B288AFB1-BA0A-4383-9823-EAC9E5DCA59F@collabora.com>
 <D9VXPNT4HNXP.1PKET0Q1H7O9Y@kernel.org>
 <52CFFCA2-F253-49F1-9EA5-2865BD094B25@collabora.com>
 <D9VZV8APBYWU.2SWXJLHIQ18ZB@kernel.org>
 <aCS71sbQKn7zeosR@finisterre.sirena.org.uk>
In-Reply-To: <aCS71sbQKn7zeosR@finisterre.sirena.org.uk>

On Wed May 14, 2025 at 5:50 PM CEST, Mark Brown wrote:
> On Wed, May 14, 2025 at 05:38:40PM +0200, Benno Lossin wrote:
>> On Wed May 14, 2025 at 4:40 PM CEST, Daniel Almeida wrote:
>> > By the way, IIUC, regulator_disable() does not disable a regulator nec=
essarily.
>> > It just tells the system that you don't care about it being enabled an=
ymore. It can
>> > still remain on if there are other users.
>
>> Hmm, so a `struct regulator` might already be enabled and calling
>> `regulator_enable` doesn't do anything?
>
> It takes a reference to the regulator.  This may or may not result in a
> change in an underlying physical regulator.

Gotcha. So calling `regulator_enable` twice on the same regulator is
fine?

If that is the case -- and after re-reading the functions exposed on
both types `EnabledRegulator` and `Regulator` -- I am confused why we
even need two different type states? Both expose the same functions
(except `enable` and `disable`) and I don't otherwise see the purpose of
having two types.

---
Cheers,
Benno

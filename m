Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA84B7262D;
	Thu, 15 May 2025 13:29:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747315745; cv=none; b=mvYJstlMWwEKb5DPZr5ZiMnPJzpYGTzcBO4pqzyJM8aUj7xyLtTJiKUl5GKRmS5OO6Ymixwh7ZXn3DheHRDArMyGSkq3N4j1GlWmBOIXx/r3p320MdLaLQWYN+IiJeZA3sDJ6FjKvRoCym2EM8u4dfnrCRWGFp4HEY1ds6mG/PE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747315745; c=relaxed/simple;
	bh=as9VQCDyej3bYgQhqBQanTgoIbZWHqfC/FD8GRN9t8o=;
	h=Mime-Version:Content-Type:Date:Message-Id:Subject:From:To:Cc:
	 References:In-Reply-To; b=V9kOrGSxkngcgKuW9cob2gYMcjnkhPrBJBWfAa+poO9l8LCD6rVTMQCkvFeuD5iX2kZ/ws82GCR9PR4CKp3iMl6X2SVqPjll2tdBQ5qVZ86dgCSPKlZroQ0EoF4sfyLikiQkgP+wCLFeVORq2rPjQab6AAVSkrmyU2pKXlPMj0s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Np/mvxr0; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Np/mvxr0"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2DF81C4CEE7;
	Thu, 15 May 2025 13:29:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747315745;
	bh=as9VQCDyej3bYgQhqBQanTgoIbZWHqfC/FD8GRN9t8o=;
	h=Date:Subject:From:To:Cc:References:In-Reply-To:From;
	b=Np/mvxr04ZqRFTv+Eyaa28XNbe8vudosSLqCQB9tN8hGvAkdYnIJTEkDiZmk9My42
	 m4tGpMTYTMQXItcRTzg+DSjQBLO2A6bKQbmbyHqEBaVbYVBBBQnSUvcM2OlpIVwYvE
	 5iaN4VH76/pE4n1ZHCWM23JPmCeDomDRdLIKNAkkuvnovr0kHlyn3aI5oaW+AGsr+P
	 LlBcueb1vTUYMBd5ZdCJaNZ/VSmaBWUynjrxcSYViL6vhkBQGcI6qWLgx75L8zI+HC
	 iNHfL5vmG5G49JohoXcxLnogC0nFDK2ou4WXvolGhSVYf3khQkA3+0sztyD1oUytx/
	 I4OVV7XzQhjzA==
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Thu, 15 May 2025 15:28:58 +0200
Message-Id: <D9WRQGTC8G4L.3JQF3MUBD8KAR@kernel.org>
Subject: Re: [PATCH v3 1/2] rust: irq: add support for request_irq()
From: "Benno Lossin" <lossin@kernel.org>
To: "Danilo Krummrich" <dakr@kernel.org>, "Daniel Almeida"
 <daniel.almeida@collabora.com>
Cc: "Miguel Ojeda" <ojeda@kernel.org>, "Alex Gaynor"
 <alex.gaynor@gmail.com>, "Boqun Feng" <boqun.feng@gmail.com>, "Gary Guo"
 <gary@garyguo.net>, =?utf-8?q?Bj=C3=B6rn_Roy_Baron?=
 <bjorn3_gh@protonmail.com>, "Benno Lossin" <benno.lossin@proton.me>,
 "Andreas Hindborg" <a.hindborg@kernel.org>, "Alice Ryhl"
 <aliceryhl@google.com>, "Trevor Gross" <tmgross@umich.edu>, "Greg
 Kroah-Hartman" <gregkh@linuxfoundation.org>, "Rafael J. Wysocki"
 <rafael@kernel.org>, "Thomas Gleixner" <tglx@linutronix.de>,
 <linux-kernel@vger.kernel.org>, <rust-for-linux@vger.kernel.org>
X-Mailer: aerc 0.20.1
References: <20250514-topics-tyr-request_irq-v3-0-d6fcc2591a88@collabora.com> <20250514-topics-tyr-request_irq-v3-1-d6fcc2591a88@collabora.com> <aCUQ0VWgoxdmIUaS@pollux> <A7E3A124-AF77-4A4A-B4E2-AE7DDB1CE007@collabora.com> <aCXYaCGvO_tI1OOh@pollux> <39C56E3E-07C6-44BB-B5F6-38090F037032@collabora.com> <aCXh1g5FWNiz7exb@pollux>
In-Reply-To: <aCXh1g5FWNiz7exb@pollux>

On Thu May 15, 2025 at 2:45 PM CEST, Danilo Krummrich wrote:
> On Thu, May 15, 2025 at 09:27:51AM -0300, Daniel Almeida wrote:
>> Well, not really, because this impl PinInit can be assigned to something=
 larger
>> that is already pinned, like drm::Device::Data for example, which is (or=
 was)
>> already behind an Arc, or any other private data in other subsystems.
>>=20
>> IIUC what you proposed has yet another indirection. If we reuse the exam=
ple
>> from above, that would be an Arc for the drm Data, and another Arc for t=
he
>> handler itself?
>
> Can't you implement Handler for drm::Device::Data and e.g. make Registrat=
ion
> take an Arc<T: Handler>?

Couldn't you store the registration inside of the `drm::Device::Data`?
Or is that too early in the device lifecycle?

---
Cheers,
Benno

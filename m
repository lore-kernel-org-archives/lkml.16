Received: from sender4-pp-f112.zoho.com (sender4-pp-f112.zoho.com [136.143.188.112])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D7AEA20DD4D;
	Thu, 27 Mar 2025 13:47:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.188.112
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743083223; cv=pass; b=DsMfWXEGi4xxsamCy/js1e/8vL83ZM3HGB2dVP1x5O/Rr+8eJqTE67pY9+JtigUyI2TrPxlG8OQ/kGivyYT3PyXdCpCB/4xB5vPkl6LK7ku/ku0QKQFziyBQr9OeOmPtLvCBv0LRD1y5gDcOVQBOAzPm1maciIR81dTcGdGwFoU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743083223; c=relaxed/simple;
	bh=SLUxjfTytuTXkm0ZV5mwqh8ZxkVkPIHWO5tXHBHT3Fw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=nDT0UGj7ocEIw2JVriUn7faaEAxgs99D2zu4iTpg7nmtxjOcboNyiFo9kh4ri4AeKY8ZiZOID+h2+TWXfHVIVE3sO/1Gb+WtNNk57TMWWz+gcud2Hki7usJYDbiFKmHmNnHF4MeFPHqBNW/yOsni/QF5GOsgdjZ07vtmutk3CpI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (1024-bit key) header.d=collabora.com header.i=sebastian.reichel@collabora.com header.b=lQ5T7J3T; arc=pass smtp.client-ip=136.143.188.112
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=collabora.com header.i=sebastian.reichel@collabora.com header.b="lQ5T7J3T"
ARC-Seal: i=1; a=rsa-sha256; t=1743083196; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=NVYMy9HnNLqGZG42kIKaNWeUamhFYNAVgfBG1tqLMhUYnILfAzLS908F1HdJRSnBQS+SUnnTcODgzoZKoFqiq7brP0Lrh0EC3JOw7Wv8YMk8XRhFoVMb2cnWx1r9FAD4xTC8c0l+9DBUC033oV7Zwf9js4JarkF+UT2mVoeRVJo=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1743083196; h=Content-Type:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=ehwn0eQcEIVrlPhTdcgJsA+l7jiw8BKWzcfn+2hit6M=; 
	b=hZYTrDx5O5oJwTQz+FUWaSxwevdbjO0lZYBxCAi41ON4LOZUWtQ/uANBaTPaopo5aWysI8Fc5+2Nah8SuE8fZOrAE2jPAFYsHMXvcWat6h90/WdL2wHfptFsdn0MWtsp4m8Cm+5sAmzKj4ijkT8Iet0VJX/0XU6OqUdjmEHKEM0=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=sebastian.reichel@collabora.com;
	dmarc=pass header.from=<sebastian.reichel@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1743083196;
	s=zohomail; d=collabora.com; i=sebastian.reichel@collabora.com;
	h=Date:Date:From:From:To:To:Cc:Cc:Subject:Subject:Message-ID:References:MIME-Version:Content-Type:In-Reply-To:Message-Id:Reply-To;
	bh=ehwn0eQcEIVrlPhTdcgJsA+l7jiw8BKWzcfn+2hit6M=;
	b=lQ5T7J3TIvcUHiFIKN9JmJLijCyY3Auv4iBU4toqnmwDQJ0k0gUeyjGSj+M7tgOW
	LwUoTEhd9ZtAFeNNukjUNwmY9mCOZX+c70L9AlIbf9dacIPOh7drc11ROC8BEN3G0a7
	fXJqer+Jpvu2luXFR7SqELomUkaDRPRdVamPoy/c=
Received: by mx.zohomail.com with SMTPS id 1743083195187729.6171611042369;
	Thu, 27 Mar 2025 06:46:35 -0700 (PDT)
Received: by venus (Postfix, from userid 1000)
	id 669F4180510; Thu, 27 Mar 2025 14:46:30 +0100 (CET)
Date: Thu, 27 Mar 2025 14:46:30 +0100
From: Sebastian Reichel <sebastian.reichel@collabora.com>
To: Daniel Almeida <daniel.almeida@collabora.com>
Cc: Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	=?utf-8?B?QmrDtnJu?= Roy Baron <bjorn3_gh@protonmail.com>, Benno Lossin <benno.lossin@proton.me>, 
	Andreas Hindborg <a.hindborg@kernel.org>, Alice Ryhl <aliceryhl@google.com>, 
	Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>, 
	Boris Brezillon <boris.brezillon@collabora.com>, lgirdwood@gmail.com, broonie@kernel.org, 
	linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org
Subject: Re: [PATCH RESEND v2] rust: regulator: add a bare minimum regulator
 abstraction
Message-ID: <opip2gbm6tpjqnx4hqk4mghbkhv7egexeqs5ukfn7oz3mm7nev@y7qffwz5ckdz>
References: <20250326-topics-tyr-regulator-v2-1-780b0362f70d@collabora.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="ublvsxzjg6uy6qpe"
Content-Disposition: inline
In-Reply-To: <20250326-topics-tyr-regulator-v2-1-780b0362f70d@collabora.com>
X-Zoho-Virus-Status: 1
X-Zoho-AV-Stamp: zmail-av-1.4.2/243.29.94
X-ZohoMailClient: External


--ublvsxzjg6uy6qpe
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Subject: Re: [PATCH RESEND v2] rust: regulator: add a bare minimum regulator
 abstraction
MIME-Version: 1.0

Hi,

On Wed, Mar 26, 2025 at 03:39:33PM -0300, Daniel Almeida wrote:
> +    pub fn get(dev: &Device, name: &CStr) -> Result<Self> {
> +        // SAFETY: It is safe to call `regulator_get()`, on a device pointer
> +        // received from the C code.
> +        let inner = from_err_ptr(unsafe { bindings::regulator_get(dev.as_raw(), name.as_ptr()) })?;
> +
> +        // SAFETY: We can safely trust `inner` to be a pointer to a valid
> +        // regulator if `ERR_PTR` was not returned.
> +        let inner = unsafe { NonNull::new_unchecked(inner) };
> +
> +        Ok(Self { inner })
> +    }

I think it's worth discussing using regulator_get() VS
regulator_get_optional(). We somehow ended up with the C regulator
API being more or less orthogonal to other in-kernel C APIs (clocks,
gpio, reset, LED) with the _optional suffixed version returning
-ENODEV for a missing regulator (and thus needing explicit handling)
and the normal version creating a dummy regulator (and a warning).

Considering the Rust API is new, it would be possible to let the
Rust get() function call regulator_get_optional() instead and then
introduce something like get_or_dummy() to call the normal
regulator_get() C function.

I see reasons in favor and against this. I just want to make sure it
has been considered before the API is being used, which makes it a
lot harder to change.

Greetings,

-- Sebastian

--ublvsxzjg6uy6qpe
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEE72YNB0Y/i3JqeVQT2O7X88g7+poFAmflVrIACgkQ2O7X88g7
+pq9zA/9FENRJp4Q0a5/LfXxwh5lGHBar89GysLA5RJRRQG6kURjfTzWhMeND0tU
ZN0o9TA9vfg85DmYM3zLFvuNBKZvclGIQrapwVjWgYFomQL3O9EGSf6GG/fdIhIF
M4k4qQPsDWhd+/pKS15bBPQp1XhSRhxxFrCwEQkn6uBiRhPupxBfaU3ezrqz8/yB
samus3LsVYXHa6eKZ6BT52rnFyPkNeDvjJte6WRNMRTKxnmLNVVcH3yJ6BXG2J5f
wJzdjyCY1nk7JbDKGOiClsZbR17LyQdQMjZD6Vh/0ejddY83IZ1EPylyMP2t0AHm
DLL6WXo53CWd024SMRiC9cPOFpFTBTK1AjgleJRmls4G6LqrPX7TTYisH0IqDEVA
DqTACMskQovxZ9ObR9tX1j24275IlBBneLbi6f9UqeZ9opu4u/Fk3s0luEySKU4+
gaggrWgo9o6MQzFiLK5F1RqQ8yhSDYQuSd8DRgSKdfwrORGN6wmz5vnOGz3Qf/ba
uNDeK9GtuhWD7A+hdM1kAGdHxC2Fi0KZD/ob/T+R4QEKvUHepaNtuhy0euhARQtT
UN6ymILyCuhU6p5zLfmL7pUjaE+JmVO8qo977Ja6mY1Gwv8z77yR1GOBi3FI1H6d
UW0eGuLAr8p0eEn5ieWgzvDvL3X/SjOPipmhyf7ORGT7azxuV+g=
=NRAH
-----END PGP SIGNATURE-----

--ublvsxzjg6uy6qpe--

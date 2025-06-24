Received: from sender4-pp-f112.zoho.com (sender4-pp-f112.zoho.com [136.143.188.112])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DCB002E2EF3;
	Tue, 24 Jun 2025 17:31:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.188.112
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750786305; cv=pass; b=DWv7dZ5frDIvRGxQYGNQJ48dGY64mQXCScOxzsIKK1eYr+ne4yM6TcMXJ8qMd4AmGBjqSggZtYifab7MHOEH1Rc+HUpRszLLvJZg45Y8jjs9E8PY0G+QqMnKqAHIP0tB7xuPF7wHUDS34G2OmeYKusL3jINioOdH2/CgMGX4NXQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750786305; c=relaxed/simple;
	bh=6uQIBIbjnn5wBkdimUyd9y1fLHHG9ndetWdwBfTeL2k=;
	h=Content-Type:Mime-Version:Subject:From:In-Reply-To:Date:Cc:
	 Message-Id:References:To; b=mDv172ZYkC93vU/CdMZNES52TtoSXed581paa4aE/8BbhKZoA5uBx0y+Ieh6/dZu/3Y5fRHVcSzhGkNilDLTb2l1F0k+Qrgo0c7haC7I0FW5kIulhhcTbOIWDF9DHWMCxGcYoISx3otR/4s8/buJxjiOLnFtfxLw0MXnAmtgIz8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (1024-bit key) header.d=collabora.com header.i=daniel.almeida@collabora.com header.b=jxpcajzd; arc=pass smtp.client-ip=136.143.188.112
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=collabora.com header.i=daniel.almeida@collabora.com header.b="jxpcajzd"
ARC-Seal: i=1; a=rsa-sha256; t=1750786284; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=OTihyH1xHeyCmGHLwW/WUDIvSBAZwwKzEK6tIT4A3JIhzPJW60A6U+NKw8TBHOzz3Egk4lsrA8KqCPvNMRnIhZNAPNCBXHGsn6fy83Y77Tziz/lxRQzkcG1Kx64J2EbEg633BpqKfG3hRXODmxUygRXj8jUMl4Ha3+EIzfUDD4g=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1750786284; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=peXpUbUK9wxpg7pgEEvIjlLUOzGHw8YzGxh/wBgU7s0=; 
	b=DTT7yV3s2dSRr3ADTxv0PopkcIBEQFhNUHaZwiJirTnZk8u9kgsNGNxpWkKrSXuAiytwjZI5wAyxluboIGOXBMMBxEtun6QJzOBQy7Z9Ml0TFEYXU/yldODuEX/N2R6lxRZXtFbSlb0egdBjMeuuSrP+ok9PJblxvdUr8L7fzxQ=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=daniel.almeida@collabora.com;
	dmarc=pass header.from=<daniel.almeida@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1750786284;
	s=zohomail; d=collabora.com; i=daniel.almeida@collabora.com;
	h=Content-Type:Mime-Version:Subject:Subject:From:From:In-Reply-To:Date:Date:Cc:Cc:Content-Transfer-Encoding:Message-Id:Message-Id:References:To:To:Reply-To;
	bh=peXpUbUK9wxpg7pgEEvIjlLUOzGHw8YzGxh/wBgU7s0=;
	b=jxpcajzdXycdVljDd+E6P8hWTxHc7PU9hIFgfRp0ftRzgNI9VeYILSvRZm/N3yG2
	S9kxRsfA/0LcfhAUd016Mxc4kDw+40evaBUi/Q3iMW8XUasO9y6qPa//0L2dsGoh1iE
	p1ZZOSqeCEGmccVqtRw1tVmX0eYKf2J2YszzTaNA=
Received: by mx.zohomail.com with SMTPS id 1750786281954653.6534158182855;
	Tue, 24 Jun 2025 10:31:21 -0700 (PDT)
Content-Type: text/plain;
	charset=utf-8
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3826.600.51.1.1\))
Subject: Re: [PATCH v5 1/2] rust: regulator: add a bare minimum regulator
 abstraction
From: Daniel Almeida <daniel.almeida@collabora.com>
In-Reply-To: <20250623-topics-tyr-regulator-v5-1-99069658cb54@collabora.com>
Date: Tue, 24 Jun 2025 14:31:05 -0300
Cc: linux-kernel@vger.kernel.org,
 rust-for-linux@vger.kernel.org
Content-Transfer-Encoding: quoted-printable
Message-Id: <63C9EBE0-771F-411E-93E0-B22DFDCB960D@collabora.com>
References: <20250623-topics-tyr-regulator-v5-0-99069658cb54@collabora.com>
 <20250623-topics-tyr-regulator-v5-1-99069658cb54@collabora.com>
To: Miguel Ojeda <ojeda@kernel.org>,
 Alex Gaynor <alex.gaynor@gmail.com>,
 Boqun Feng <boqun.feng@gmail.com>,
 Gary Guo <gary@garyguo.net>,
 =?utf-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>,
 Benno Lossin <benno.lossin@proton.me>,
 Andreas Hindborg <a.hindborg@kernel.org>,
 Alice Ryhl <aliceryhl@google.com>,
 Trevor Gross <tmgross@umich.edu>,
 Danilo Krummrich <dakr@kernel.org>,
 Boris Brezillon <boris.brezillon@collabora.com>,
 Sebastian Reichel <sebastian.reichel@collabora.com>,
 Liam Girdwood <lgirdwood@gmail.com>,
 Mark Brown <broonie@kernel.org>
X-Mailer: Apple Mail (2.3826.600.51.1.1)
X-ZohoMailClient: External

Hi,

> +    /// Attempts to convert the regulator to an enabled state.
> +    pub fn try_into_enabled(mut self) -> Result<Regulator<Enabled>, =
Error<Disabled>> {
> +        self.enable_internal()
> +            .map(|()| Regulator {
> +                inner: self.inner,
> +                _phantom: PhantomData,
> +            })
> +            .map_err(|error| Error {
> +                error,
> +                regulator: self,
> +            })
> +    }
> +}
> +
> +impl Regulator<Enabled> {
> +    /// Obtains a [`Regulator`] instance from the system and enables =
it.
> +    ///
> +    /// This is equivalent to calling `regulator_get_enable()` in the =
C API.
> +    pub fn get(dev: &Device, name: &CStr) -> Result<Self> {
> +        Regulator::<Disabled>::get_internal(dev, name)?
> +            .try_into_enabled()
> +            .map_err(|error| error.error)
> +    }

I just realized that this is a bug.

The pre-typestate code was using ManuallyDrop<T> here, and it was =
forgotten on
the newer versions. This means that the destructor for self runs here, =
which
decreases the refcount by calling regulator_put().

My proposed solution is:

    /// Attempts to convert the regulator to an enabled state.
    pub fn try_into_enabled(mut self) -> Result<Regulator<Enabled>, =
Error<Disabled>> {
        // We will be transferring the ownership of our regulator_get() =
count to Regulator<Enabled>
        let mut regulator =3D ManuallyDrop::new(self);

        regulator.enable_internal()
            .map(|()| Regulator {
                inner: regulator.inner,
                _phantom: PhantomData,
            })
            .map_err(|error| Error {
                error,
                regulator: ManuallyDrop::into_inner(regulator),
            })
    }
}



Alex, Benno, thoughts?

=E2=80=94 Daniel


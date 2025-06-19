Received: from forward501b.mail.yandex.net (forward501b.mail.yandex.net [178.154.239.145])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A8C7B217F36;
	Thu, 19 Jun 2025 10:06:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=178.154.239.145
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750327566; cv=none; b=qbOxmKKjwp7g1NzOCmhOgvo+FdqvYdDIOpecGBgF45yuC4KPMBCCei8ewKQ2WqXCnpMsjAnyOx3w5rtPt5kBQPh4jH16tu5AbCDaY4NtKtvylOn+Vqr8FHogEtxK31Sr2B8gVzbf56OqPXu2K7gc+IJ27ANGNbfUuSB0P8t16Dc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750327566; c=relaxed/simple;
	bh=3Q859OB643D+9nMxoAjoOVmWNmeQfgcpihaipu4T+w4=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=MGMDeb38Tuuyn3TB7oNKOtxcyizldlrxgCmyzkRcanueFNNgX8hfc1naeXdPreAmwo0mVgnqGv4NDQZS3X4WbVpsb4xiNrPTrGQE+QN6unoJAFxLy0LLpL9BuF8yfxKVvtcSd6ibEYS8esayTodAyQa6o/Gq72HcujMK3fDNyjQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=onurozkan.dev; spf=pass smtp.mailfrom=onurozkan.dev; dkim=pass (1024-bit key) header.d=onurozkan.dev header.i=@onurozkan.dev header.b=eWhmSDau; arc=none smtp.client-ip=178.154.239.145
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=onurozkan.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=onurozkan.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=onurozkan.dev header.i=@onurozkan.dev header.b="eWhmSDau"
Received: from mail-nwsmtp-smtp-production-main-55.sas.yp-c.yandex.net (mail-nwsmtp-smtp-production-main-55.sas.yp-c.yandex.net [IPv6:2a02:6b8:c23:2db2:0:640:9334:0])
	by forward501b.mail.yandex.net (Yandex) with ESMTPS id D919B61B84;
	Thu, 19 Jun 2025 13:05:55 +0300 (MSK)
Received: by mail-nwsmtp-smtp-production-main-55.sas.yp-c.yandex.net (smtp/Yandex) with ESMTPSA id p5Lw11ALbqM0-nTVsfCIV;
	Thu, 19 Jun 2025 13:05:54 +0300
X-Yandex-Fwd: 1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=onurozkan.dev;
	s=mail; t=1750327555;
	bh=3Q859OB643D+9nMxoAjoOVmWNmeQfgcpihaipu4T+w4=;
	h=Cc:Message-ID:Subject:Date:References:To:From:In-Reply-To;
	b=eWhmSDauEWHYMVbL1Y25p9riHykM4mzD6LRmI0aDx7YAGfO4ANdaPzwrwAe8sc72e
	 wiV4b9eMQzqjNKPiB9DmUNje/lkIi2WsFX+AbpJOl3f3QiTN3gDW4xM6M6PGufBYqM
	 a1mVANxypPG8bE62wiFcAGXxsGRmf5MvK+xEFQcA=
Authentication-Results: mail-nwsmtp-smtp-production-main-55.sas.yp-c.yandex.net; dkim=pass header.i=@onurozkan.dev
Date: Thu, 19 Jun 2025 13:05:51 +0300
From: Onur <work@onurozkan.dev>
To: Viresh Kumar <viresh.kumar@linaro.org>
Cc: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>,
 "linux-clk@vger.kernel.org" <linux-clk@vger.kernel.org>,
 "rust-for-linux@vger.kernel.org" <rust-for-linux@vger.kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "mturquette@baylibre.com" <mturquette@baylibre.com>, "sboyd@kernel.org"
 <sboyd@kernel.org>, "ojeda@kernel.org" <ojeda@kernel.org>,
 "alex.gaynor@gmail.com" <alex.gaynor@gmail.com>, "boqun.feng@gmail.com"
 <boqun.feng@gmail.com>, "gary@garyguo.net" <gary@garyguo.net>,
 "bjorn3_gh@protonmail.com" <bjorn3_gh@protonmail.com>, "lossin@kernel.org"
 <lossin@kernel.org>, "a.hindborg@kernel.org" <a.hindborg@kernel.org>,
 "aliceryhl@google.com" <aliceryhl@google.com>, "tmgross@umich.edu"
 <tmgross@umich.edu>, "dakr@kernel.org" <dakr@kernel.org>
Subject: Re: [PATCH] Various improvements on clock abstractions
Message-ID: <20250619130551.388da2a2@nimda>
In-Reply-To: <20250619064534.nipg4rs2gwepxqw2@vireshk-i7>
References: <20250616200103.24245-1-work@onurozkan.dev>
	<CANiq72n0v7jinSyO85vorYRFB=y5NH5roW4xLRjwZz+DFJ5QSQ@mail.gmail.com>
	<42151750134012@mail.yandex.com>
	<CANiq72n3+qzDCCf0ct-5gtQHKXDbT2rr1fgxVQP4qBW69JmmhA@mail.gmail.com>
	<20250619064534.nipg4rs2gwepxqw2@vireshk-i7>
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.49; x86_64-unknown-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Thu, 19 Jun 2025 12:15:34 +0530
Viresh Kumar <viresh.kumar@linaro.org> wrote:

> On 17-06-25, 08:55, Miguel Ojeda wrote:
> > On Tue, Jun 17, 2025 at 6:28=E2=80=AFAM Onur =C3=96zkan <work@onurozkan=
.dev>
> > wrote:
> > >
> > > Yes, it should be "Onur =C3=96zkan", sorry. Should I update that part
> > > and re-send the patch?
> >=20
> > I would suggest to wait for other feedback, and then you can send a
> > v2 if needed.
> >=20
> > > where my patch converts this into a single straight line which I
> > > think makes it more idiomatic.
> >=20
> > Up to the maintainers :) So far we have both styles around.
>=20
> I am okay with all the changes, the commit log can be improved as you
> mentioned earlier.
>=20
> Acked-by: Viresh Kumar <viresh.kumar@linaro.org>
>=20

FWIW I split this patch into 3 parts and sent them separately as it
was suggested earlier by Alexandre.

Here are the patches I sent yesterday:

- https://lore.kernel.org/all/20250618092810.29370-1-work@onurozkan.dev/
- https://lore.kernel.org/all/20250618093508.16343-1-work@onurozkan.dev/
- https://lore.kernel.org/all/20250618091442.29104-1-work@onurozkan.dev/


Regards,
Onur

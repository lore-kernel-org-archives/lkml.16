Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 966DD1DD9AC;
	Tue, 17 Jun 2025 12:02:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750161771; cv=none; b=kW8Nid1TnSb9aTHDgSlHnbVd3/++ja7z90ob+WqjSP6PB41eQaCp1iUvb9dhg9txlsOWHlepsbUOlbLtcMLF6sq5FhzFhaIyCvo5pWyp3UWysszOLpcGoeKLIv8Ra3yduoSxtcR7VL/3ntlmLRjCQvvfbsLcmKOCqM0F0T59MDo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750161771; c=relaxed/simple;
	bh=lgdy5E+oqIYHdNt3F+D0lEuWC74tIxjQzu2g7Rp7xgk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=hYjEDLt93Sg0YE/qCSRj+dydc4/vFkIip7BXuIBSRwcvvHzukLBcuxJw/kBaLzWvnfwi1RQ+XuqeRqytfL/yJi6/fuExX4bJbruBZlyCXO/9SGFxT/6HyO8IrFjhHGI57H+ZxScAv+8lD9YtnNs0+4OtQVYf7HyAKsRQ1yB+BpY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=F7HpeC0h; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="F7HpeC0h"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BABE5C4CEF0;
	Tue, 17 Jun 2025 12:02:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1750161771;
	bh=lgdy5E+oqIYHdNt3F+D0lEuWC74tIxjQzu2g7Rp7xgk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=F7HpeC0hn3voqySR3/DsHDStZnG3K169YWkik+JIbOoqASUbKfGs8lYiG3sEpDas8
	 TGETqFWUhwcQJSWunkk44byEwJgCPMHjpzHCGtTtJT9cAcxu1SwEdiVJOdHKLnN0md
	 nVzDvLV+vatm3B5CwXO7U2TAisRNI/YsJeH16Qv3VkCTT9M6KF6dpcQrFM1fdl7P7k
	 PYdP6E88zDw3nz62jHW4M7UYlLFs2N4cF/roTPYOz9xtEkSW6omRYgbNl2bi5QVnap
	 PPXKJdq3gq10fJrtFD30fBi8vgA3cp1xKaKauht5OCCyfwVEvMz6xCB5EnhsC32hYU
	 wn1L+cLqo8pfQ==
Date: Tue, 17 Jun 2025 13:02:46 +0100
From: Conor Dooley <conor@kernel.org>
To: Klara Modin <klarasmodin@gmail.com>
Cc: Valentina Fernandez <valentina.fernandezalanis@microchip.com>,
	paul.walmsley@sifive.com, palmer@dabbelt.com,
	conor.dooley@microchip.com, conor+dt@kernel.org,
	jassisinghbrar@gmail.com, robh@kernel.org, krzk+dt@kernel.org,
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org
Subject: Re: [PATCH v6 0/4] Add Microchip IPC mailbox
Message-ID: <20250617-confess-reimburse-876101e099cb@spud>
References: <20241217113134.3508333-1-valentina.fernandezalanis@microchip.com>
 <gcn3ot6angrjpmk5nu7gwcuqqrdecuxgisysmgkp4mof3egzot@dvruxuw6w5kp>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="JxZyEEACyPxmQ/io"
Content-Disposition: inline
In-Reply-To: <gcn3ot6angrjpmk5nu7gwcuqqrdecuxgisysmgkp4mof3egzot@dvruxuw6w5kp>


--JxZyEEACyPxmQ/io
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Jun 16, 2025 at 08:44:01PM +0200, Klara Modin wrote:
> On 2024-12-17 11:31:30 +0000, Valentina Fernandez wrote:
> >=20
> > Valentina Fernandez (4):
> >   riscv: sbi: vendorid_list: Add Microchip Technology to the vendor list
> >   riscv: export __cpuid_to_hartid_map
> >   dt-bindings: mailbox: add binding for Microchip IPC mailbox controller
> >   mailbox: add Microchip IPC support
> >=20
> >  .../bindings/mailbox/microchip,sbi-ipc.yaml   | 123 +++++
> >  arch/riscv/include/asm/vendorid_list.h        |   1 +
> >  arch/riscv/kernel/smp.c                       |   1 +
> >  drivers/mailbox/Kconfig                       |  13 +
> >  drivers/mailbox/Makefile                      |   2 +
> >  drivers/mailbox/mailbox-mchp-ipc-sbi.c        | 504 ++++++++++++++++++
> >  include/linux/mailbox/mchp-ipc.h              |  33 ++
> >  7 files changed, 677 insertions(+)
> >  create mode 100644 Documentation/devicetree/bindings/mailbox/microchip=
,sbi-ipc.yaml
> >  create mode 100644 drivers/mailbox/mailbox-mchp-ipc-sbi.c
> >  create mode 100644 include/linux/mailbox/mchp-ipc.h
> >=20
> > --=20
> > 2.34.1
> >=20
>=20
> Building this driver as a module with SMP=3Dn fails becuase the non-SMP
> cpuid_to_hartid_map() depends on the non-exported boot_cpu_hartid
> (discovered via randconfig).
>=20
> >From the description of the driver it doesn't seem to be very useful
> with SMP=3Dn, would it make sense to have it depend on SMP rather than
> exporting boot_cpu_hartid?

No, I think boot_cpu_hartid needs to get exported, the driver is
intended for use in AMP situations so the kernel config may have SMP
disabled.

--JxZyEEACyPxmQ/io
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCaFFZYQAKCRB4tDGHoIJi
0vmKAP9tlz5kkwRKNkY0SNcbvhAt36eMbcF3/NxGX/qAO/prpwD/bdiwwZmMTZ2K
6MTrYk2DgPZmqbn0hnrRUxYmdUXNQwQ=
=Lxrl
-----END PGP SIGNATURE-----

--JxZyEEACyPxmQ/io--

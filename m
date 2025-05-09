Received: from out-171.mta1.migadu.com (out-171.mta1.migadu.com [95.215.58.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 05C4D22CBE9
	for <linux-kernel@vger.kernel.org>; Fri,  9 May 2025 15:34:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746804879; cv=none; b=EeEixd7h5eOAEYM4OdqIObo4U55StZqhvdyUTaXcdGJv0z777ZVQQWcKJnliz2G3y4LLE5yq4Vx2jvszea0tcOAedoXsx3ct0HbxznWnM1ufrfJAd99OJ+NBEBgs6ebpI1DW9oVFJfL97a7IMjb4DdD5cc7vpb5YNlx8ryyCzMA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746804879; c=relaxed/simple;
	bh=M/D2bCLzM2dNhvHnPdTPWBYPQWBtWxVT62QHaSi/vdQ=;
	h=Mime-Version:Content-Type:Date:Message-Id:Cc:Subject:From:To:
	 References:In-Reply-To; b=cu8RhdhrMmfjnqT8gkVmryCZbxsWvhOFGwAfWcK2MCCa515u8ZOf1bvQVND4jjqgFuqL1oJISn8bNgRBk8rx3lBqOzx+UT38YgL1+z/tjA3ZTHqJvyJPEqFkyM4fH0Q40gCtPoajvH6e/aMy9o6CrEMCMvuIz22UT9ry8TNnUlo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=cknow.org; spf=pass smtp.mailfrom=cknow.org; dkim=pass (2048-bit key) header.d=cknow.org header.i=@cknow.org header.b=txjLPg+2; arc=none smtp.client-ip=95.215.58.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=cknow.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cknow.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cknow.org header.i=@cknow.org header.b="txjLPg+2"
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cknow.org; s=key1;
	t=1746804875;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=K1E2b0XxNtqEsAhxKbHa26ec+Iv+4B3ST0nSXvkyMcE=;
	b=txjLPg+2r2oCcSAmqMhRMoJ6ogAGxsVdesD30F5X6afQ/G6keHvb8TuZG8TPtcuMozvGZe
	mSnluLjZf32SfIaFxu2kDCMJdwF5NkV7iI1pmMdBjCKWl8GvSPe9gB7DIrMEQiY4/xw76s
	vZd3sx72Z/HPVrdL1gWryYxjPr2HZvDyhr/krmQsylu9GGhoaG2khy8Zk+sfCR+wlHEB1E
	wZmiIhnXtDKkuuqp+YLzVcGVLLjLQ4oZiWjOI8bZQKJAMfsO21Nczv6cRcQA94Bg5XCucw
	/7q1wq12+OQ3wF4FoP8vshSdux+lhiBfUi5nN/c1XxJYWGUJcEnBKwprc0dCHw==
Content-Type: multipart/signed;
 boundary=7a05250e7073856251351d2d7eed564a7ba885e16373e9e67c2c1e611f0e;
 micalg=pgp-sha512; protocol="application/pgp-signature"
Date: Fri, 09 May 2025 17:34:21 +0200
Message-Id: <D9RQN76VZXO8.T3I0046FNVG3@cknow.org>
Cc: "Conor Dooley" <conor+dt@kernel.org>, "Krzysztof Kozlowski"
 <krzk+dt@kernel.org>, "Dragan Simic" <dsimic@manjaro.org>, "Rob Herring"
 <robh@kernel.org>, <linux-arm-kernel@lists.infradead.org>,
 <linux-rockchip@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
 <devicetree@vger.kernel.org>
Subject: Re: [PATCH 0/1] arm64: dts: rockchip: rk3568: Move PCIe3 MSI to use
 GIC ITS
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: "Diederik de Haas" <didi.debian@cknow.org>
To: "Chukun Pan" <amadeus@jmu.edu.cn>, "Heiko Stuebner" <heiko@sntech.de>
References: <20250308093008.568437-1-amadeus@jmu.edu.cn>
In-Reply-To: <20250308093008.568437-1-amadeus@jmu.edu.cn>
X-Migadu-Flow: FLOW_OUT

--7a05250e7073856251351d2d7eed564a7ba885e16373e9e67c2c1e611f0e
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8

Hi,

On Sat Mar 8, 2025 at 10:30 AM CET, Chukun Pan wrote:
> For a long time, rk3568's MSI-X had bugs and could only work on one node.
> e.g. [    7.250882] r8125 0002:01:00.0: no MSI/MSI-X. Back to INTx.
>
> Now the ITS of GICv3 on rk3568 has been fixed by commit b08e2f42e86b
> ("irqchip/gic-v3-its: Share ITS tables with a non-trusted hypervisor")
> and commit 2d81e1bb6252 ("irqchip/gic-v3: Add Rockchip 3568002 erratum
> workaround").
>
> Following commit b956c9de9175 ("arm64: dts: rockchip: rk356x: Move
> PCIe MSI to use GIC ITS instead of MBI"), change the PCIe3 controller's
> MSI on rk3568 to use ITS, so that all MSI-X can work properly.
>
> ~# dmesg | grep -E 'GIC|ITS'
> <snip>
>
> ~# lspci -v | grep MSI-X
>         Capabilities: [b0] MSI-X: Enable- Count=3D1 Masked-
>         Capabilities: [b0] MSI-X: Enable- Count=3D128 Masked-
>         Capabilities: [b0] MSI-X: Enable+ Count=3D32 Masked-
>         Capabilities: [b0] MSI-X: Enable- Count=3D128 Masked-
>         Capabilities: [b0] MSI-X: Enable+ Count=3D32 Masked-

I tested this patch on my NanoPi R5S with a 6.15-rc3 kernel + a number
of [vcc|phy]-supply patches that have been accepted for 6.16 (and a
small WIP LED patch).

With this patch I get the following kernel warnings:

pci 0001:10:00.0: Primary bus is hard wired to 0
pci 0002:20:00.0: Primary bus is hard wired to 0

If I 'unapply' this patch, I don't see those warnings.
The output of the above mentioned ``dmesg`` and ``lspci`` commands is
exactly the same in both cases.

The PCI IDs refer to:
PCI bridge: Rockchip Electronics Co., Ltd RK3568 Remote Signal Processor (r=
ev 01)

It's possible that this patch only brought a(nother) problem to light,
but was I supposed to see an improvement and if so where/how?

Cheers,
  Diederik

> Chukun Pan (1):
>   arm64: dts: rockchip: rk3568: Move PCIe3 MSI to use GIC ITS
>
>  arch/arm64/boot/dts/rockchip/rk3568.dtsi | 8 ++++----
>  1 file changed, 4 insertions(+), 4 deletions(-)


--7a05250e7073856251351d2d7eed564a7ba885e16373e9e67c2c1e611f0e
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQT1sUPBYsyGmi4usy/XblvOeH7bbgUCaB4ghAAKCRDXblvOeH7b
bl/EAQD+K7c6vUljn1EBtoIGabanVcKojXgvdX70yKiRNSvqPQEAvapmOAWC5jab
K8JwHx8knw5EZOulmU6azbvFEkAZqAk=
=bpa6
-----END PGP SIGNATURE-----

--7a05250e7073856251351d2d7eed564a7ba885e16373e9e67c2c1e611f0e--

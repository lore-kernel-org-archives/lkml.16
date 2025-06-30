Received: from out-173.mta0.migadu.com (out-173.mta0.migadu.com [91.218.175.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7BF8F28C87A
	for <linux-kernel@vger.kernel.org>; Mon, 30 Jun 2025 13:13:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751289192; cv=none; b=A0XiEB2Hs6sLex0ca+L/oROj+tJtbimxGTQeFI2XBrJvt/TyX4GVhZcNNwzC/6pKMCEpeIboCA9GTRkw/7kF8tHx2wjaUCjz7SfIoo1i0iufidu/1gFup7rJM2sgVl0WVoG92YM59NUIZ+1OjPTSz1jhT6MD3FjE/aiywHjEDIE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751289192; c=relaxed/simple;
	bh=sBgkn0f8/4VXlX8UWPXjVuNBjjXBIZJ/mKg68iRvsJ4=;
	h=Mime-Version:Content-Type:Date:Message-Id:Cc:Subject:From:To:
	 References:In-Reply-To; b=F/tGY5kQSW+IpqRCBDIV9kqci9Kixzwp3T36Y5/f9j+wUwgBmBe7k/0hB7EF0exhPLp+z4J8SwkFX2Vo11h1LDvrv0mUpP/QsGWaGrjlZ/emA0gixi+S6kqbPYx2aGOn8CGZzNtZ2DnGwcPOcRq7O265MF13GLt/EIIhqQcD+Oo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=cknow.org; spf=pass smtp.mailfrom=cknow.org; dkim=pass (2048-bit key) header.d=cknow.org header.i=@cknow.org header.b=Qt/xf8jv; arc=none smtp.client-ip=91.218.175.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=cknow.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cknow.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cknow.org header.i=@cknow.org header.b="Qt/xf8jv"
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cknow.org; s=key1;
	t=1751289184;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=TpapsnvN2qo9hhPhQHWIegeAB6bx1Q9QSQ1S7RYoiB8=;
	b=Qt/xf8jvowFgC12MA52xjmF0ThLOYdQaLftpgkvXJadJkSgMfDayzMLNa8IjYygLdcFLhg
	z/WC7CnjE3bpRYZ4rwLuQI1pdSLIE7CU75h+QkuZ2Y09OPbcbCc5GtizQAnuqrkjZM2hEr
	9g+wkuXxX/kxtOJz+KRFIv+SAmTBAq9wmztrlyEapOsPglHrN1D9qrrrspbcDhnGk9nC1h
	cuMV2maGNu/Zfo+CcABkJBAczKh13xrTz88Jfk3CvOLAU81kP1lutYYfAXHTeCV33uvS54
	ezpbVrnGiUMKbvOfrw6k+E9+IW3i1ABrBldKqDlaXHZKXE3J7lOqibP/spxoTA==
Content-Type: multipart/signed;
 boundary=cabcb7cd44803ee80fe883dca4e1018394457acca069f00ba0876c0d4cf7;
 micalg=pgp-sha512; protocol="application/pgp-signature"
Date: Mon, 30 Jun 2025 15:12:56 +0200
Message-Id: <DAZW78SRQQ0Y.2R1T9V72Q7AZH@cknow.org>
Cc: <llvm@lists.linux.dev>, <oe-kbuild-all@lists.linux.dev>, "Dragan Simic"
 <dsimic@manjaro.org>, "Quentin Schulz" <quentin.schulz@cherry.de>, "Johan
 Jonker" <jbx6244@gmail.com>, <devicetree@vger.kernel.org>,
 <linux-arm-kernel@lists.infradead.org>,
 <linux-rockchip@lists.infradead.org>, <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH 2/8] arm64: dts: rockchip: Refactor DSI nodes on rk3399
 boards
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: "Diederik de Haas" <didi.debian@cknow.org>
To: "Krzysztof Kozlowski" <krzk@kernel.org>, "kernel test robot"
 <lkp@intel.com>, "Rob Herring" <robh@kernel.org>, "Conor Dooley"
 <conor+dt@kernel.org>, "Heiko Stuebner" <heiko@sntech.de>
References: <20250627152645.740981-3-didi.debian@cknow.org>
 <202506290852.bWro2lBe-lkp@intel.com>
 <DAYXOI4WITJW.1G5DBWEQDDY1Z@cknow.org>
 <9f1ac97a-6109-40d1-bf85-f2a8e25138f0@kernel.org>
In-Reply-To: <9f1ac97a-6109-40d1-bf85-f2a8e25138f0@kernel.org>
X-Migadu-Flow: FLOW_OUT

--cabcb7cd44803ee80fe883dca4e1018394457acca069f00ba0876c0d4cf7
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8

On Mon Jun 30, 2025 at 7:57 AM CEST, Krzysztof Kozlowski wrote:
> On 29/06/2025 12:09, Diederik de Haas wrote:
>>=20
>> Luckily I've now found why my build script didn't catch it.
>> ```sh
>> export PATH=3D~/dev/kernel.org/dt-schema-venv/bin/:$PATH CROSS_COMPILE=
=3Daarch64-linux-gnu- ARCH=3Darm64
>> make distclean
>> make debarm64_defconfig
>> make CHECK_DTBS=3Dy W=3D1 rockchip/px30-cobra-ltk050h3146w-a2.dtb
>> <quite-a-long-list-of-all-boards-at-least-I-thought-so>
>> ```
>>=20
>> (debarm64_defconfig is my own defconfig based on Debian's kernel config)
>>=20
>> That long list didn't have ``rockchip/rk3399-rockpro64-screen.dtbo``.
>> Is there a better/simpler way to validate all rockchip boards without
>> having to explicitly list each and every one of them?
> make defconfig && make
>
> or make dtbs

``make dtbs`` is faster then I recalled, but I do like the detail with
``make CHECK_DTBS=3Dy W=3D1 rockchip/<board1>.dtb rockchip/<board2>.dtb``.

If I don't specify a list of boards, then it will build them all
including freescale/qcom/renesas/etc, while I only want the rockchip
ones. And as my script takes 20-30 minutes, that will probably be
several hours. Per run. And I ran it after each patch.

Giving ``rockchip/*.dtb[o]`` as parameter is basically what I want, but
I'm not aware of that being possible.
OTOH it's (already) a script, so I will probably just do a ``find`` to
dynamically generate the board list.

Cheers,
  Diederik

--cabcb7cd44803ee80fe883dca4e1018394457acca069f00ba0876c0d4cf7
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQT1sUPBYsyGmi4usy/XblvOeH7bbgUCaGKNWgAKCRDXblvOeH7b
brfvAQCxEpSIjkdmRZ7MkQ5i4THNqBXbUOtLpJCTsHAh8TEeqwD7Btya8sIXw2rg
yTjCXv4ijLgp0OdfAo5k5i8MXuWUyQI=
=isL+
-----END PGP SIGNATURE-----

--cabcb7cd44803ee80fe883dca4e1018394457acca069f00ba0876c0d4cf7--

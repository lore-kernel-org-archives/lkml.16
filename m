Received: from out-172.mta0.migadu.com (out-172.mta0.migadu.com [91.218.175.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 582A021770D
	for <linux-kernel@vger.kernel.org>; Sun, 29 Jun 2025 10:10:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751191812; cv=none; b=Z4aC3DfThtfquWaUH26f9340DSLqKjduBOjmlfMOm8yHkFGN826f0LtazTxyibiGZTV6ZV7i97GaPV0zvs4zp2/YdIhvysX5fasV3r8c0S+kA6xd95oWn/oq0g/kaUVuoRM4j1GxCviIij+uv1pSYBLetPPyXcKU/4N3zFXimjY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751191812; c=relaxed/simple;
	bh=R6uSRM1xEjbR8Uh/ppwy7XPm0tCcOs8UMbZXeqNBPkY=;
	h=Mime-Version:Content-Type:Date:Message-Id:From:To:Cc:Subject:
	 References:In-Reply-To; b=HJbkFOabvJ49QqAtFW7bx5U+g2kyR5/UO4xaxWu57TcRlDmPTYa6mfCiE30t8LE4VNAB1pcRc3EXaQBCUW5Y2iZXGyeyZCyH4aAZte1SVI0t3yuJVja51FlJtqP9KeTeqIbW7xkw191m3n1kpE0rj9awCfuEZ6r2vza8XlnUEv0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=cknow.org; spf=pass smtp.mailfrom=cknow.org; dkim=pass (2048-bit key) header.d=cknow.org header.i=@cknow.org header.b=jbLTkcMk; arc=none smtp.client-ip=91.218.175.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=cknow.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cknow.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cknow.org header.i=@cknow.org header.b="jbLTkcMk"
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cknow.org; s=key1;
	t=1751191803;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=H6Wlp3JgvEp0ycS0t6Z7WKduaZTKhf5gEm0eW6oKUXk=;
	b=jbLTkcMkzlOS4+CCECrHk6uIoEiUlZ8gi1AojI4kxi/eKj82hZVBUd0JkXPnB663LhL/Ek
	gVqtKR4nI0DDAfDOLpK/pQysjigMfgN3b1oiUOlRymhs+BHhUm9Z2CIhjA6/dxDofMziof
	bnZIC1eACNKyzLAaEjVmvFIWqNG5ubaMMU3Bswi2HkrK89/j4dBSJJ+/1Zwh7tZHRPMd7F
	h8lCIjiqZr5zNjUESE1775Fn9QF8oEovSIHTMpvWLnkHDCJkdQKwj0qhGDK74YgzHqetQ1
	lUR6lfFU1Fa45OZRahJUi6V6lS9ljIdgWs2JFN09YMxLkfMYs6Tf+IRgJb//Zg==
Content-Type: multipart/signed;
 boundary=43508436bcd3ad84eb98e0bb756b39ac53921fae364149a231ac9f8d2b94;
 micalg=pgp-sha512; protocol="application/pgp-signature"
Date: Sun, 29 Jun 2025 12:09:49 +0200
Message-Id: <DAYXOI4WITJW.1G5DBWEQDDY1Z@cknow.org>
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: "Diederik de Haas" <didi.debian@cknow.org>
To: "kernel test robot" <lkp@intel.com>, "Rob Herring" <robh@kernel.org>,
 "Krzysztof Kozlowski" <krzk@kernel.org>, "Conor Dooley"
 <conor+dt@kernel.org>, "Heiko Stuebner" <heiko@sntech.de>
Cc: <llvm@lists.linux.dev>, <oe-kbuild-all@lists.linux.dev>, "Dragan Simic"
 <dsimic@manjaro.org>, "Quentin Schulz" <quentin.schulz@cherry.de>, "Johan
 Jonker" <jbx6244@gmail.com>, <devicetree@vger.kernel.org>,
 <linux-arm-kernel@lists.infradead.org>,
 <linux-rockchip@lists.infradead.org>, <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH 2/8] arm64: dts: rockchip: Refactor DSI nodes on rk3399
 boards
References: <20250627152645.740981-3-didi.debian@cknow.org>
 <202506290852.bWro2lBe-lkp@intel.com>
In-Reply-To: <202506290852.bWro2lBe-lkp@intel.com>
X-Migadu-Flow: FLOW_OUT

--43508436bcd3ad84eb98e0bb756b39ac53921fae364149a231ac9f8d2b94
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8

Hi,

On Sun Jun 29, 2025 at 2:32 AM CEST, kernel test robot wrote:
> kernel test robot noticed the following build errors:
>
> [auto build test ERROR on rockchip/for-next]
> [also build test ERROR on next-20250627]
> [cannot apply to robh/for-next krzk/for-next krzk-dt/for-next linus/maste=
r v6.16-rc3]
> [If your patch is applied to the wrong git tree, kindly drop us a note.
> And when submitting patch, we suggest to use '--base' as documented in
> https://git-scm.com/docs/git-format-patch#_base_tree_information]
>
> url:    https://github.com/intel-lab-lkp/linux/commits/Diederik-de-Haas/a=
rm64-dts-rockchip-Refactor-DSI-nodes-on-px30-boards/20250627-233300
> base:   https://git.kernel.org/pub/scm/linux/kernel/git/mmind/linux-rockc=
hip.git for-next
> patch link:    https://lore.kernel.org/r/20250627152645.740981-3-didi.deb=
ian%40cknow.org
> patch subject: [PATCH 2/8] arm64: dts: rockchip: Refactor DSI nodes on rk=
3399 boards
> config: arm64-randconfig-002-20250629 (https://download.01.org/0day-ci/ar=
chive/20250629/202506290852.bWro2lBe-lkp@intel.com/config)
> compiler: clang version 19.1.7 (https://github.com/llvm/llvm-project cd70=
8029e0b2869e80abe31ddb175f7c35361f90)
> reproduce (this is a W=3D1 build): (https://download.01.org/0day-ci/archi=
ve/20250629/202506290852.bWro2lBe-lkp@intel.com/reproduce)
>
> If you fix the issue in a separate patch/commit (i.e. not just a new vers=
ion of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202506290852.bWro2lBe-lkp=
@intel.com/
>
> All errors (new ones prefixed by >>):
>
>>> Error: arch/arm64/boot/dts/rockchip/rk3399-rockpro64-screen.dtso:75.1-6=
 syntax error
>    FATAL ERROR: Unable to parse input tree

The kernel test robot is right as the ``&mipi_out`` node is missing a
closing ``;``, so thanks for that :-)
The problem is also present in v2, so I'll send a v3 shortly.

Luckily I've now found why my build script didn't catch it.
```sh
export PATH=3D~/dev/kernel.org/dt-schema-venv/bin/:$PATH CROSS_COMPILE=3Daa=
rch64-linux-gnu- ARCH=3Darm64
make distclean
make debarm64_defconfig
make CHECK_DTBS=3Dy W=3D1 rockchip/px30-cobra-ltk050h3146w-a2.dtb
<quite-a-long-list-of-all-boards-at-least-I-thought-so>
```

(debarm64_defconfig is my own defconfig based on Debian's kernel config)

That long list didn't have ``rockchip/rk3399-rockpro64-screen.dtbo``.
Is there a better/simpler way to validate all rockchip boards without
having to explicitly list each and every one of them?

Cheers,
  Diederik

--43508436bcd3ad84eb98e0bb756b39ac53921fae364149a231ac9f8d2b94
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQT1sUPBYsyGmi4usy/XblvOeH7bbgUCaGEQ8wAKCRDXblvOeH7b
bkmOAP9oM6RsgNp49/g+vN6x7caM8SHQCK0m03vWy5v9AUMPCAD9Gu0vIsw3p1fn
Jw3UxbRGaW+2LtlZ/raAKpP6oBKDRA4=
=vkok
-----END PGP SIGNATURE-----

--43508436bcd3ad84eb98e0bb756b39ac53921fae364149a231ac9f8d2b94--

Received: from mail-24416.protonmail.ch (mail-24416.protonmail.ch [109.224.244.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 64FA329A2
	for <linux-kernel@vger.kernel.org>; Sat,  5 Jul 2025 11:48:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=109.224.244.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751716087; cv=none; b=gZsQ23u9ShhXIqn9YUC6L8Fzlj3OH/Ij3qumYA0wpNQbLKYQAj5LpilfAb4bj7VY9MVwJmhtsUP/SJne2dikNRA8+qchTLLN7jDm4gRWYWYyf5i+35qnH8aa5Eo6QRhqY5YEwhYtga3o/hZkvNPfPFV1waZKrLa4kKk6m0q7PEw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751716087; c=relaxed/simple;
	bh=J8qcIEE70SB/9XoQJlUDk3lierzSpVmt7i94rUb6dyc=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=csnPVJFCSk/0YP9TCAIerJkCw3hvRcXQ6PHxirNCQWY3eF6I06H8M6TGaDTiB+MPHvgXbgWkNtiH6NN0jInqpWt8PghsOq09YgI78eFUr23vsUlbFuJZ+MU0OVji0xniOiBFtaUJtMjzQxMCtMOklKBXY9XTbpIvM4lQIE70ong=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=proton.me; spf=pass smtp.mailfrom=proton.me; dkim=pass (2048-bit key) header.d=proton.me header.i=@proton.me header.b=lNGSAAFP; arc=none smtp.client-ip=109.224.244.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=proton.me
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=proton.me
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=proton.me header.i=@proton.me header.b="lNGSAAFP"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=proton.me;
	s=6jkn22ie5vbihk2u7c7sdltbsm.protonmail; t=1751716076; x=1751975276;
	bh=J8qcIEE70SB/9XoQJlUDk3lierzSpVmt7i94rUb6dyc=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector;
	b=lNGSAAFPU1MmzqoCV75zjasud+Ltau2kMAf0ucoEJNdAv3QWhms7yq51MwkJZnfcj
	 7hBkRK9R2WmK4w1JG2u4mCWV7F9k3Johv2zake/jMsn5oYtbJKY8lmQiy9IJbp2J/G
	 xOlTYR1VNDtEx6H98fhU3geuQyf2ZPTfRWulXUmkI3fd+48Y6wjDPGJy+u8h44sjso
	 7SasVQfsjinPqv07yROXw41U3Bhu/9KzzLfynmoTM3onN2EpW3lqblXcAiz/biBgFo
	 s7EulQJl0iETPIQ9c4k3QeplPvYXGNhyy+25uNWRNO2XhUFNjfR7baSU4Fn/DD2T5P
	 S1h1rOoPQRC1g==
Date: Sat, 05 Jul 2025 11:47:47 +0000
To: Andy Yan <andyshrk@163.com>
From: Piotr Zalewski <pZ010001011111@proton.me>
Cc: hjc@rock-chips.com, heiko@sntech.de, andy.yan@rock-chips.com, maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de, airlied@gmail.com, simona@ffwll.ch, dri-devel@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org, Diederik de Haas <didi.debian@cknow.org>
Subject: Re:[PATCH] rockchip/drm: vop2: make vp registers nonvolatile
Message-ID: <zsSK9sOtcc1AH88pS645eND72d0SjKh2VXYA7waci9cnxW5rwIdm55a028FTHz8vZXJfScx_GJmiXXZBkLW_7EwQj518m3UYtauIIH0BnEw=@proton.me>
In-Reply-To: <9947ce4.7929.197d484ec6b.Coremail.andyshrk@163.com>
References: <20250628180914.1177177-2-pZ010001011111@proton.me> <9947ce4.7929.197d484ec6b.Coremail.andyshrk@163.com>
Feedback-ID: 53478694:user:proton
X-Pm-Message-ID: 6d028a90de22091ad8d42a1328fbfe0732ace29e
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

> Hello Piotr,
Hi Andy,

> > */
> > static const struct regmap_range vop2_nonvolatile_range[] =3D {
> > + regmap_reg_range(RK3568_VP0_CTRL_BASE, RK3588_VP3_CTRL_BASE+255),
>=20
>=20
> Small nit: there should be spaces before and after the +
>=20
Hmm weird, checkpatch.pl didn't catch it. I will send v2.

Best regards, Piotr Zalewski

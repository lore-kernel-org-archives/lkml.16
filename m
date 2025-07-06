Received: from mail-10631.protonmail.ch (mail-10631.protonmail.ch [79.135.106.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 17CEF1E86E
	for <linux-kernel@vger.kernel.org>; Sun,  6 Jul 2025 10:21:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=79.135.106.31
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751797271; cv=none; b=SkMe2sv6JGDEp4G9m0pFn5G51g2di42eTpMgI1CRcpbdiwgqTjCNRDq45Wapt9g/Kzs864O1bEIynJWUX6CkaTZiGy6UVxRlmxzFOdO56NV8wpRx+27/OI6Kuha0ifMxkzdHgZkDa28GSUK+BCtmMIJE4PHEC0B029uCavEHvTA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751797271; c=relaxed/simple;
	bh=TRpeYUjYOCK7fAy5xC95Yl5UuQXVTR4cjv4XrdE76eg=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=QV1ZTFWWwKC0RZCsRMzUbAgKDaEL76EQRxPF6Y5uvpc3v2OUL4LgpA3K8Jt0jtbDvpnaevg4ypoqc28EdPmYC7Cna9S5XZx5dWt+ilCY40VYH5AcIlh3I8X93yYPfMO9Hs3SpHk/V14wJpTAMWNO98FWGxUpgqeMdgiyyHJW7nU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=proton.me; spf=pass smtp.mailfrom=proton.me; dkim=pass (2048-bit key) header.d=proton.me header.i=@proton.me header.b=KIEVgAER; arc=none smtp.client-ip=79.135.106.31
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=proton.me
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=proton.me
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=proton.me header.i=@proton.me header.b="KIEVgAER"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=proton.me;
	s=jy3swzlwwvekrdzd7oepny45be.protonmail; t=1751797263; x=1752056463;
	bh=TRpeYUjYOCK7fAy5xC95Yl5UuQXVTR4cjv4XrdE76eg=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector;
	b=KIEVgAERnbR2vz9eE5jB3dxeBTNNIHZIFZuYheCWsRkuwVmh6orUQ2oIDGbxY2teV
	 C6hUUvSulbrg0mGhZEtOY8KGarvqrxhixl90ZEpaUoUcc26D4RuFxISHlorG2Oazjl
	 1STE3Wd5Ned1iAXjCXtzE54aMTm1PT3WLx0cD38cXhWoKK4VfRycJl3gMuF4YRvrLh
	 +Qu+oR6B3hK/9ldP9iozGDrDnsIdzVBb5maqhfu/zDdJ1djRy0B8SvfhhgrMDw36yb
	 ToqPTNSLg3vyx1WQWev9x1Y62uUI8op4fG1H589h8nxQ6ZPXHhXPyt6BW+0/PiB/de
	 brfhvlFt380gg==
Date: Sun, 06 Jul 2025 10:20:56 +0000
To: Diederik de Haas <didi.debian@cknow.org>
From: Piotr Zalewski <pZ010001011111@proton.me>
Cc: hjc@rock-chips.com, heiko@sntech.de, andy.yan@rock-chips.com, maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de, airlied@gmail.com, simona@ffwll.ch, dri-devel@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] rockchip/drm: vop2: make vp registers nonvolatile
Message-ID: <OWFHI491RHadO01jlQPA34GX28LC7SseKfNRwqQy4etkkJyP1YeF_0EDdAgpSXx5RW7go62EAOkedW5nbyn_hlz_K-NUrnNJeDFWv0OOSO8=@proton.me>
In-Reply-To: <DB4W0GOQZ8MZ.MA7QXHJWCTK2@cknow.org>
References: <20250706083629.140332-2-pZ010001011111@proton.me> <DB4W0GOQZ8MZ.MA7QXHJWCTK2@cknow.org>
Feedback-ID: 53478694:user:proton
X-Pm-Message-ID: fd5f69f618c951cf7280e90a0113a2616a1050d8
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

> Hi Piotr,
Hi Diederik=20

> With a new version of a patch, you're supposed to add the tags you
> received for previous versions, like my Tested-by tag [1].
>=20
> (unless the new version has changed so much you feel they should not be
> carried over; you then need to explicitly describe that and why you
> dropped them)
=20
Forgot... Should i send it as PATCH v2 RESEND?

Best regards, Piotr Zalewski

Received: from xry111.site (xry111.site [89.208.246.23])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D7B8F1F91CD
	for <linux-kernel@vger.kernel.org>; Tue,  1 Apr 2025 11:47:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=89.208.246.23
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743508038; cv=none; b=Xd4Nu4kuHD2pyQ+LFC5e6lSf7Qgd/RoD6zjQdhJ3ZfNEGdI0jAEqDVE4hhDtwAjsgPFtVH3vgYFgnK27vw91KvaKXwAMFt+4BA8p9cH8jxlxHzVtB8ZZuct03Z5bKqWYRcZ3SiKbynMcwnMSg2CYWPCKEIr3+0u2OJCBOXSzuvg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743508038; c=relaxed/simple;
	bh=3YoYCaMl4xwoOuMmYKwlQClWXfKQ6um8Ft4Xc4A2jvU=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=HPAiIqX5SLE5JOTeHEXLsld0X5QTCIsU0pWzbesP+TXEYOzbqZzGRyJjroyalVW+mX2QQ1NxG/1Fzfb+O3O5lxvhZz4Qlo6hS/5fEb9LJDwSNwMvbXPKWOAVxPGEr4sfFK9gOkf/cAZu8VKJMi5pArOlblTi+sMtSn1U8j/eoJo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=xry111.site; spf=pass smtp.mailfrom=xry111.site; dkim=pass (1024-bit key) header.d=xry111.site header.i=@xry111.site header.b=jrqAPSFG; arc=none smtp.client-ip=89.208.246.23
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=xry111.site
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=xry111.site
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=xry111.site header.i=@xry111.site header.b="jrqAPSFG"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xry111.site;
	s=default; t=1743508034;
	bh=5/jxYKlKQRl4c7LYaZU1HrJfBEil5P4qm108AVZro4c=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References:From;
	b=jrqAPSFGUOl7yO3IyeVgKnRyb+WDsH7EooDU/YsAm6ehn8X8Wq1gC/TZsxhnWuN+E
	 xzCoPI3JGbNHt7mU4N5udwE51U7FetigFLHAxfobOOLtzmC+CQiXj/F3K9cY1tYwlu
	 efaa4DmfymAwFm0BJRwCpEV1Ip07b/9Oxnxs6McA=
Received: from [IPv6:240e:454:8310:8bd:3bd7:3f9c:6187:a52a] (unknown [IPv6:240e:454:8310:8bd:3bd7:3f9c:6187:a52a])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (secp384r1) server-digest SHA384)
	(Client did not present a certificate)
	(Authenticated sender: xry111@xry111.site)
	by xry111.site (Postfix) with ESMTPSA id EFC28659C8;
	Tue,  1 Apr 2025 07:47:09 -0400 (EDT)
Message-ID: <46ed31b37b4b92720b26be66f3e6366a714024cf.camel@xry111.site>
Subject: Re: [PATCH] arm64: Add overrride for MPAM
From: Xi Ruoyao <xry111@xry111.site>
To: Anshuman Khandual <anshuman.khandual@arm.com>, James Morse
	 <james.morse@arm.com>, Marc Zyngier <maz@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Shameer Kolothum <shameerali.kolothum.thodi@huawei.com>, Mingcong Bai
 <jeffbai@aosc.io>
Date: Tue, 01 Apr 2025 19:47:03 +0800
In-Reply-To: <409f6d27-3efe-4c45-8319-d360ded80f16@arm.com>
References: <20250401055650.22542-1-xry111@xry111.site>
	 <409f6d27-3efe-4c45-8319-d360ded80f16@arm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.0 
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

On Tue, 2025-04-01 at 14:04 +0530, Anshuman Khandual wrote:
> On 4/1/25 11:26, Xi Ruoyao wrote:
> > As the message of the commit 09e6b306f3ba ("arm64: cpufeature: discover
> > CPU support for MPAM") already states, if a buggy firmware fails to
> > either enable MPAM or emulate the trap as if it were disabled, the
> > kernel will just fail to boot.=C2=A0 While upgrading the firmware shoul=
d be
> > the best solution, we have some hardware of which the vender have made
> > no response 2 months after we requested a firmware update.=C2=A0 Allow
> > overriding it so our devices don't become some e-waste.
>=20
> There could be similar problems, where firmware might not enable arch
> features as required. Just wondering if there is a platform policy in
> place for enabling id-reg overrides for working around such scenarios
> to prevent a kernel crash etc ?

In https://lore.kernel.org/all/87jzcfsuep.wl-maz@kernel.org/:

   > For such cases, when MPAM is incorrectly advertised, can we have kerne=
l
   > command line parameter like mpam=3D0 to override it's detection?
  =20
   We could, but only when we can confirm what the problem is.

And there was prior arts like:

commit 892f7237b3ffb090f1b1f1e55fe7c50664405aed
Author: Marc Zyngier <maz@kernel.org>
Date:   Wed Jul 20 11:52:19 2022 +0100

    arm64: Delay initialisation of cpuinfo_arm64::reg_{zcr,smcr}
   =20
    Even if we are now able to tell the kernel to avoid exposing SVE/SME
    from the command line, we still have a couple of places where we
    unconditionally access the ZCR_EL1 (resp. SMCR_EL1) registers.
   =20
    On systems with broken firmwares, this results in a crash even if
    arm64.nosve (resp. arm64.nosme) was passed on the command-line.
   =20
    To avoid this, only update cpuinfo_arm64::reg_{zcr,smcr} once
    we have computed the sanitised version for the corresponding
    feature registers (ID_AA64PFR0 for SVE, and ID_AA64PFR1 for
    SME). This results in some minor refactoring.

--=20
Xi Ruoyao <xry111@xry111.site>
School of Aerospace Science and Technology, Xidian University

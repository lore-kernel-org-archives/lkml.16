Received: from szxga04-in.huawei.com (szxga04-in.huawei.com [45.249.212.190])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C1743201270
	for <linux-kernel@vger.kernel.org>; Tue, 22 Apr 2025 09:26:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.249.212.190
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745313997; cv=none; b=SnkEXXMpFYkqQdO/HUconnBXVyApcFfLWrqGeRRWxWeVqsBOCJ2000J1nrqsHSi9PDyp0HLI6g1iV/krV7Pv1hjQ+yc/4uXsVAimGYkdjNjYDbSx1ywXpQE/tLv8jyi7IX0GHBFpblqm0Z6KWX6uMND7o0LiWjvGfSOVo2D7cww=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745313997; c=relaxed/simple;
	bh=jaFevAJjGyxewjfpMC+dQrgdwAOVmCC3Nqx9Yc6qTcA=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=eMkaNiYOK/BOTb392mZhH8opnBltV6MLtILAQ8zTvVctUEOu1CGOE2YTorwbGqRciaGIkX4nQmEbRf1/0ukfxLwYvifJuxa5XnkYE6nfdv7RAgQGhCiGL9+493jeBjtn5hSFT61a+NwhudwpE60wwHx5WJQFWdI79T0/pSt9S54=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com; spf=pass smtp.mailfrom=huawei.com; arc=none smtp.client-ip=45.249.212.190
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=huawei.com
Received: from mail.maildlp.com (unknown [172.19.88.234])
	by szxga04-in.huawei.com (SkyGuard) with ESMTP id 4ZhcLJ5cl8z2TSBD;
	Tue, 22 Apr 2025 17:26:16 +0800 (CST)
Received: from kwepemd100012.china.huawei.com (unknown [7.221.188.214])
	by mail.maildlp.com (Postfix) with ESMTPS id 03EC4140296;
	Tue, 22 Apr 2025 17:26:32 +0800 (CST)
Received: from kwepemd100011.china.huawei.com (7.221.188.204) by
 kwepemd100012.china.huawei.com (7.221.188.214) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.10; Tue, 22 Apr 2025 17:26:31 +0800
Received: from kwepemd100011.china.huawei.com ([7.221.188.204]) by
 kwepemd100011.china.huawei.com ([7.221.188.204]) with mapi id 15.02.1748.010;
 Tue, 22 Apr 2025 17:26:31 +0800
From: duchangbin <changbin.du@huawei.com>
To: Ingo Molnar <mingo@kernel.org>
CC: duchangbin <changbin.du@huawei.com>, Thomas Gleixner <tglx@linutronix.de>,
	Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, Dave Hansen
	<dave.hansen@linux.intel.com>, "x86@kernel.org" <x86@kernel.org>, "H. Peter
 Anvin" <hpa@zytor.com>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] x86: remove orphan header file e820.h
Thread-Topic: [PATCH] x86: remove orphan header file e820.h
Thread-Index: AQHbsnPehTqp5R0IhUiNco+yC0Z+prOuvGyAgACv3IA=
Date: Tue, 22 Apr 2025 09:26:31 +0000
Message-ID: <4f2c331fc758402fa662ad5bf4a2293c@huawei.com>
References: <20250421041419.3167094-1-changbin.du@huawei.com>
 <aAc9seuR4AMuO4qw@gmail.com>
In-Reply-To: <aAc9seuR4AMuO4qw@gmail.com>
Accept-Language: en-US
Content-Language: zh-CN
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ms-exchange-imapappendstamp: kwepemd100011.china.huawei.com (15.02.1748.010)
x-ms-exchange-messagesentrepresentingtype: 1
Content-Type: text/plain; charset="us-ascii"
Content-ID: <D35DE5D01902A645AE70B325D63F6EF4@huawei.com>
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

Hi, Ingo,
On Tue, Apr 22, 2025 at 08:56:49AM +0200, Ingo Molnar wrote:
>=20
> * Changbin Du <changbin.du@huawei.com> wrote:
>=20
> > The header arch/x86/include/uapi/asm/e820.h isn't used by any source fi=
le any
> > more. The e820 related items are defined in arch/x86/include/asm/e820/t=
ypes.h.
> > So clean it up.
> >=20
> > Signed-off-by: Changbin Du <changbin.du@huawei.com>
> > ---
> >  arch/x86/include/uapi/asm/e820.h | 82 --------------------------------
> >  1 file changed, 82 deletions(-)
> >  delete mode 100644 arch/x86/include/uapi/asm/e820.h
>=20
> This is part of the specification of the bootloader protocol between=20
> bootloaders and the Linux kernel and thus should not be removed.
>=20
> The kernel has its internal types that adhere to the same=20
> specification, but that's not grounds to remove this header.
>
Regarding the e820 definitions used in the boot protocol, the main componen=
ts
involved are 'struct boot_params::e820_table' and the SETUP_E820_EXT node. =
Both
of these utilize the 'struct boot_e820_entry' defined in arch/x86/include/u=
api/asm/setup_data.h,
which is also part of the UAPI.

The header arch/x86/include/uapi/asm/e820.h is not referenced by boot proto=
col
definitions. In this scenario, can the header file arch/x86/include/uapi/as=
m/e820.h
be safely removed?

> Thanks,
>=20
> 	Ingo
>=20

--=20
Cheers,
Changbin Du

Received: from mail.zytor.com (terminus.zytor.com [198.137.202.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2C40B202C26
	for <linux-kernel@vger.kernel.org>; Thu, 10 Apr 2025 06:53:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.137.202.136
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744267996; cv=none; b=LaN/W8m8FS5yXBlNaUzmm6qUfBlE+yTaTrXHN/64YETqZiVf/7NgvyrJC3XEzxGeLnEb67SrU17ooemrWIKghnyRmp6X6zsTgzjoy+bNuZRMbpfwQ1NT63qbE+dtt4V5Kc+Q03W6bfAJzIiPgzWEo69DG6/tSNuM3C+yhBpFy/4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744267996; c=relaxed/simple;
	bh=kMv4eNfAHTuMb+whB2sNtJjmAaZl9jaZaYcTdWgSEZI=;
	h=Content-Type:From:Mime-Version:Subject:Date:Message-Id:References:
	 Cc:In-Reply-To:To; b=UGLr9CRe+/PSG1G8idUnfCEToiNwKeJA8RNvFK5O6+5CG/9eA+G2duiap4EVzMzLisx6waLYFK56n68cahMTV3KqV4sF2C0Uu3hqZHxNa/LDgPZrogg+pMGaclFhRfSdAQtz6G0qaQGWlkUJlOK6vLgFiQm7IKH+edkYL/Y6t54=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=zytor.com; spf=pass smtp.mailfrom=zytor.com; dkim=pass (2048-bit key) header.d=zytor.com header.i=@zytor.com header.b=nFQ+M90u; arc=none smtp.client-ip=198.137.202.136
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=zytor.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=zytor.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=zytor.com header.i=@zytor.com header.b="nFQ+M90u"
Received: from smtpclient.apple ([71.202.166.45])
	(authenticated bits=0)
	by mail.zytor.com (8.18.1/8.17.1) with ESMTPSA id 53A6qlP73957602
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NO);
	Wed, 9 Apr 2025 23:52:48 -0700
DKIM-Filter: OpenDKIM Filter v2.11.0 mail.zytor.com 53A6qlP73957602
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zytor.com;
	s=2025032001; t=1744267968;
	bh=ec08kOlU5S4dGWdvwRiz4hMm/+KbnOkwaRvrhZlgRMI=;
	h=From:Subject:Date:References:Cc:In-Reply-To:To:From;
	b=nFQ+M90ugn0Ja6PD/eLx1LOOMfkj35vIrBkhVeCwX1pU91kfZU94Puoep6tqZFmaR
	 EslSRasc1D53ad1MSY5R/Yyl/4COKfA8uRyhCBM8uFvk1fr9OKufIEA8lNCHEPjoQB
	 ja57zlBlyOjNBe9TYL+9IyiPNDN/tkKxKDePG+grqmlqdG8ReJyR68sYUkITzZAM+U
	 PabFhBfyLu5I+6kqysbB2Kko0It8nrf7TbZJjpao+Z2Zz1H/RqVjPLLEjMjSQZDERK
	 eEJH5FskLKljru0/Eg7ZApYTBoypBSPeL4WRCT+mBkzAdhc/IJmuytj4u9zr+nxf60
	 mzM+C65j8WiOQ==
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
From: Xin Li <xin@zytor.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0 (1.0)
Subject: Re: [PATCH 06/20] x86/msr: Standardize on 'u32' MSR indices in <asm/msr.h>
Date: Wed, 9 Apr 2025 23:52:37 -0700
Message-Id: <B4CD0964-4394-4659-AD1B-208EFB950556@zytor.com>
References: <Z_dnraUGp0Vbzk6k@gmail.com>
Cc: "Anvin H. Peter" <hpa@zytor.com>, linux-kernel@vger.kernel.org,
        Gross Juergen <jgross@suse.com>, Hansen Dave <dave.hansen@intel.com>,
        Torvalds Linus <torvalds@linux-foundation.org>,
        Zijlstra Peter <peterz@infradead.org>, Petkov Borislav <bp@alien8.de>,
        Gleixner Thomas <tglx@linutronix.de>
In-Reply-To: <Z_dnraUGp0Vbzk6k@gmail.com>
To: Molnar Ingo <mingo@kernel.org>
X-Mailer: iPhone Mail (22E240)

On Apr 9, 2025, at 11:41=E2=80=AFPM, Ingo Molnar <mingo@kernel.org> wrote:
>>=20
>> not worth it at all?
>=20
> No:
>=20
> - Using 'const' for input parameter pointers makes sense because it's
>   easy to have a bug like this in a utility function:
>=20
>    obj_ptr->val =3D foo;
>=20
>   this has a side effect on the calling context, spreading the local
>   rot, so to speak, corrupting the object not owned by this function.
>=20
> - Using 'const' for non-pointer input parameters makes little sense,
>   because the worst a function can do is to corrupt it locally:
>=20
>    val_high =3D foo;
>=20
>   ... but this bug won't be able to spread via corrupting objects
>   through a pointer, any bug will be limited to that function.
>=20
> So neither the kernel, nor any of the major libraries such as glibc
> will typically use const for non-pointer function parameters, outside
> of very specific exceptions that strengthen the rule.

Thanks for the explanation!=


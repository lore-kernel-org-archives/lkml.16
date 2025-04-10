Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5ED03204086
	for <linux-kernel@vger.kernel.org>; Thu, 10 Apr 2025 06:40:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744267239; cv=none; b=uPTOuMoNZIh3iYyG5m+D8T2nPuOrGiTC3EpBgJ7gHq5sj8flG+l9HGFBcsou/aD8P+O6cIsmJxNdpV+mKMkFwH8qM4LV5gQPlvms0a+0nStVY94eAb2vFNSFpEmiwJN/OAH9Pn1FREiDWuUnxi0E4xHJc41hFPax6RDd94n4pxU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744267239; c=relaxed/simple;
	bh=hRdqL+1LC2dQsAas1joXReQ92Tt1faK5vyWCOwb5DZs=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=f/8tdOHcMAHtnQlRGk/SmVr5zYzRFef2yEfjRGmmaZhAfBczJR/ywGmsY1/Zl4SRHh9CXdGZoiZsgjBq9tWvONN1KoZbEJpTV9PoKKae3IWdhIMjr0et6tATNnF3lciQUzEL3otALr+WaSHSV3p4/d5S5a8e8+Gmf2Xud6TQlFI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=cAgMKsqc; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="cAgMKsqc"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 74181C4CEDD;
	Thu, 10 Apr 2025 06:40:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744267238;
	bh=hRdqL+1LC2dQsAas1joXReQ92Tt1faK5vyWCOwb5DZs=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=cAgMKsqcbBCzRDS9LSQv4BiryjBBDuDFcbfaiirtafO14PbN2nw85d1n/FS4+7dTY
	 Wi86b8nkNiu32D4sKO/fSGOQ59tXWBBgUGOEXdX0f/1HcC0LIs1P/1G1uAEN8ZpLGy
	 kQkI2bQVzIKSavdGlHeiPC4BwMXYKVNOEXLsALUKpeLHaTZ/OxDdXeWF/c2CUub5/q
	 m7lGXL9+TNpT+4I4Qk/TyNNNc6yIgR1FpvqIjH/r0fwJgHCQTqMtd2iopPDtWXoFDp
	 9k2f888VKl55vNgUvCqGnuJ6kEmPH0J+VBykn9G3RPNsqIR45p9o5SvK3wXSuqVbtb
	 t4TUouETH+s1w==
From: =?utf-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn@kernel.org>
To: yunhui cui <cuiyunhui@bytedance.com>
Cc: Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt
 <palmer@dabbelt.com>, Alexandre Ghiti <alex@ghiti.fr>, Song Shuai
 <songshuaishuai@tinylab.org>, linux-riscv@lists.infradead.org, Nick
 Kossifidis <mick@ics.forth.gr>, linux-kernel@vger.kernel.org,
 =?utf-8?B?QmrDtnJuIFTDtnBlbA==?=
 <bjorn@rivosinc.com>
Subject: Re: [External] [PATCH v3 2/2] riscv: kexec_file: Support loading
 Image binary file
In-Reply-To: <CAEEQ3wmb37Y6gOn0cC53DMJgQopcD4pf38c83AexFv+Pj7Er3w@mail.gmail.com>
References: <20250409193004.643839-1-bjorn@kernel.org>
 <20250409193004.643839-3-bjorn@kernel.org>
 <CAEEQ3wmb37Y6gOn0cC53DMJgQopcD4pf38c83AexFv+Pj7Er3w@mail.gmail.com>
Date: Thu, 10 Apr 2025 08:40:35 +0200
Message-ID: <87jz7s4izg.fsf@all.your.base.are.belong.to.us>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Hey Yunhui!

yunhui cui <cuiyunhui@bytedance.com> writes:

> Hi Bj=C3=B6rn,
>
> On Thu, Apr 10, 2025 at 3:31=E2=80=AFAM Bj=C3=B6rn T=C3=B6pel <bjorn@kern=
el.org> wrote:

...

>> +       kbuf.buffer =3D kernel;
>> +       kbuf.bufsz =3D kernel_len;
>> +       kbuf.mem =3D KEXEC_BUF_MEM_UNKNOWN;
>> +       kbuf.memsz =3D le64_to_cpu(h->image_size);
>> +       kbuf.buf_align =3D le64_to_cpu(h->text_offset);
>
> It is necessary to ensure that the kernel entry is aligned to
> PMD_SIZE; otherwise, BUG_ON() in setup_vm() will be triggered.

Indeed, and text_offset is that [1]. FWIW, the text_offset name in the
Image has always weird/confusing to me.


Bj=C3=B6rn

[1] https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree=
/arch/riscv/kernel/head.S#n47


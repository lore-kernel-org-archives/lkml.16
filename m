Received: from mout-p-101.mailbox.org (mout-p-101.mailbox.org [80.241.56.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C69E1221FD7
	for <linux-kernel@vger.kernel.org>; Thu, 24 Apr 2025 10:22:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.241.56.151
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745490167; cv=none; b=m6Eas+QQk5dQlIcGKqPJPGBQVuW5klBriNUX6VITifUra8D05QfVAFteCDm4tJgzE0MksGmIuEyNp2m6OFuV7UNyc1m4imwkxQgk2X1f21YUoH1WGlb4cY+mMW+GyLFVkKtztscim2SohROcwHQdLnEa3x0fYmnL/KyWauprpIA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745490167; c=relaxed/simple;
	bh=JqVP0sZWU+KDW7kLQ9V0YoIHdgYP8O5tPelN4uvoZPM=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=uWYNUVxyq+IjIYX9/onh8QP10kocklwk3JZpgWqQVNfq5Dkj+pl63FJpYjBwpiChKXAle3wzlyXm7KRlvz/1XX4jWt7y3RZ0g4atfAOT0LbN+eHomgJTEKvWj4yO37C9PT8aRx1++9IJXhZZ9GwMZVddHvFarD+Ffpu1fgPSFxw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org; spf=pass smtp.mailfrom=mailbox.org; dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b=KKJjnzik; arc=none smtp.client-ip=80.241.56.151
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mailbox.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b="KKJjnzik"
Received: from smtp102.mailbox.org (smtp102.mailbox.org [IPv6:2001:67c:2050:b231:465::102])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-101.mailbox.org (Postfix) with ESMTPS id 4ZjsVL6XWYz9sbt;
	Thu, 24 Apr 2025 12:22:34 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1745490154; h=from:from:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=DCNr98wlrrnRy8Lxn/AniOKF9h/eQDxQxANLC7G6Izs=;
	b=KKJjnzikM2fKvVqbWOwNJ7bclsWPAjwoHRR+AgrxP+F3uo/cJpulksWKMXlTBduC9H4o/P
	8/hHlErYVDyqt7fNG3+TYqaSkoLxmSdr7LQKrlXoNI9X65uG0+a5LM+le6U9+Fj6Vs0OAZ
	vUODYShfD3ivYdFJbs6qN370ZD2FmWG8srphm2peuUTW23aEsKcZEFOIDk6wZkaferrxif
	6BgaUuNRD6uorE6uX5xL6WqNNkFZGue9l5EEnwL0KqWfur3of7s+4gomfAH9DLw/JNzpp0
	mR+6Ld0f+i9a3QN0oIRcq3WQxy5q+C8G/34KnEYNZ89i14aM+OoLVzPK7jccWg==
Message-ID: <cc549efcd078fdefafc12442b08ae7ceaa197eb9.camel@mailbox.org>
Subject: Re: [PATCH] x86/boot: Work around broken busybox truncate tool
From: Philipp Stanner <phasta@mailbox.org>
Reply-To: phasta@kernel.org
To: Ard Biesheuvel <ardb+git@google.com>, linux-kernel@vger.kernel.org
Cc: x86@kernel.org, Ard Biesheuvel <ardb@kernel.org>, phasta@kernel.org
Date: Thu, 24 Apr 2025 12:22:32 +0200
In-Reply-To: <20250424101917.1552527-2-ardb+git@google.com>
References: <20250424101917.1552527-2-ardb+git@google.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MBO-RS-ID: 791cd6bf46637b5f7d2
X-MBO-RS-META: syaqwz1kbjnm6knixxrwdpydc5x6akk7

Thank you very much for this fix :)

On Thu, 2025-04-24 at 12:19 +0200, Ard Biesheuvel wrote:
> From: Ard Biesheuvel <ardb@kernel.org>
>=20
> The GNU coreutils version of truncate, which is the original, accepts
> a
> % prefix for the -s size argument which means the file in question
> should be padded to a multiple of the given size. This is currently
> used
> to pad the setup block of bzImage to a multiple of 4k before
> appending
> the decompressor.
>=20
> busybux reimplements truncate but does not support this idiom, and

typo, busybox.

> therefore fails the build since commit
>=20
> =C2=A0 9c54baab4401 ("x86/boot: Drop CRC-32 checksum and the build tool
> that generates it")

Should this be marked as an official bug?

If so, I'd put this as a Fixes: tag below.

>=20
> Work around this by avoiding truncate altogether, and relying on dd
> to
> perform the padding.
>=20
> Reported-by: <phasta@kernel.org>

Tested-by: Philipp Stanner <phasta@kernel.org>


Thx,

P.

> Signed-off-by: Ard Biesheuvel <ardb@kernel.org>
> ---
> I personally think using a busybox environment for building the
> kernel
> is a terrible idea, and does not satisfy the build tool requirements
> listed in the documentation. But apparently, it used to work and now
> it
> doesn't, and the workaround is rather straight-forward.
>=20
> IOW, I don't care whether this gets applied or not, so I will leave
> it
> to others to make the argument.
>=20
> =C2=A0arch/x86/boot/Makefile | 2 +-
> =C2=A01 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/arch/x86/boot/Makefile b/arch/x86/boot/Makefile
> index 81f55da81967..640fcac3af74 100644
> --- a/arch/x86/boot/Makefile
> +++ b/arch/x86/boot/Makefile
> @@ -59,7 +59,7 @@ KBUILD_CFLAGS	+=3D $(CONFIG_CC_IMPLICIT_FALLTHROUGH)
> =C2=A0$(obj)/bzImage: asflags-y=C2=A0 :=3D $(SVGA_MODE)
> =C2=A0
> =C2=A0quiet_cmd_image =3D BUILD=C2=A0=C2=A0 $@
> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 cmd_image =3D cp $< $@; truncate -s %4K $=
@; cat
> $(obj)/vmlinux.bin >>$@
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 cmd_image =3D (dd if=3D$< bs=3D4k conv=3D=
sync status=3Dnone; cat
> $(filter-out $<,$(real-prereqs))) >$@
> =C2=A0
> =C2=A0$(obj)/bzImage: $(obj)/setup.bin $(obj)/vmlinux.bin FORCE
> =C2=A0	$(call if_changed,image)


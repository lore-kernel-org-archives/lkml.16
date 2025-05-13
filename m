Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B30A45695
	for <linux-kernel@vger.kernel.org>; Tue, 13 May 2025 00:58:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747097929; cv=none; b=GvpjDdeRFyvMkJd1ThHwzjhQqwoBUGGX3hbzeCtdsgbWW+B8buDT4mzpCJTKAVtJuYo8G6QCVUgZxxnFSA3zbZ/tq6Pn3ynFxD4Zh09B9rlL8QL5SnVOFhfo6q7ts51UKaaDRCm9T0Qc6uAnePORYSqPKLpW6bG88gIUzqHZYKg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747097929; c=relaxed/simple;
	bh=VQJ/7XFHobUA+tHhOdVbc5Hh4E9jXT6RtZ/Fcp7dtU0=;
	h=Date:From:To:Cc:Subject:Message-Id:In-Reply-To:References:
	 Mime-Version:Content-Type; b=jul0iDkneLyiAd3hWksOFAwLTwiMucF+hBtM2z1AmfZNK//iYiLt1gSwxPhB4twXQbK415KdI08Tl9+hqluArtjnQNle9RxtAAPXCJXXUF0GsEYnmqYSjgauH+r/UYo259oceFQzfrwxNG40N1uzsCuwUcpOUmnjAr8n0qVR9Dg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b=w51gTfSR; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="w51gTfSR"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D3B22C4CEE7;
	Tue, 13 May 2025 00:58:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linux-foundation.org;
	s=korg; t=1747097929;
	bh=VQJ/7XFHobUA+tHhOdVbc5Hh4E9jXT6RtZ/Fcp7dtU0=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=w51gTfSRoc+xh7Ax4AcRPFYnRDbLlwitjtoA0dit5D1WG42A4DK+gDwRC+AnVkLLt
	 EyiTquF9H5ZrNKhb/i8Pbsp0EjdAsVltalp9TztrTpgZa0MmCtjPapCRHF0B6goNBO
	 lPLR2xxMoqMTyl/1TZI+8BIO3nEHwkRuXII1rQjs=
Date: Mon, 12 May 2025 17:58:48 -0700
From: Andrew Morton <akpm@linux-foundation.org>
To: Boian Bonev <bbonev@devuan.org>
Cc: linux-kernel@vger.kernel.org, Balbir Singh <bsingharora@gmail.com>, Yang
 Yang <yang.yang29@zte.com.cn>, Wang Yaxin <wang.yaxin@zte.com.cn>, Kun
 Jiang <jiang.kun2@zte.com.cn>, xu xin <xu.xin16@zte.com.cn>
Subject: Re: Bug 220102 - struct taskstats breaks backward compatibility
 since version 15
Message-Id: <20250512175848.ee67ac056e1d203f754318ce@linux-foundation.org>
In-Reply-To: <d113c621664bdfefee95fee5f17fb00c593d7f66.camel@devuan.org>
References: <5c176101cd5fd8e629b18380bf7678ea6c6a5d63.camel@devuan.org>
	<20250509141727.19b616d1c4a549d01656e5dd@linux-foundation.org>
	<d48f4302ac09d9539242a324ec4d0917fede6a71.camel@devuan.org>
	<20250510132316.3719945330c9d0ebed86f8c9@linux-foundation.org>
	<d113c621664bdfefee95fee5f17fb00c593d7f66.camel@devuan.org>
X-Mailer: Sylpheed 3.8.0beta1 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

On Sun, 11 May 2025 01:03:58 +0300 Boian Bonev <bbonev@devuan.org> wrote:

> >=20
> > > I also see that Wang Yaxin
> > > <wang.yaxin@zte.com.cn> has already sent a different but working
> > > patch...
> >=20
> > Cool.=A0 Except I cannot find that patch.=A0 Help?
>=20
> That one was on email.
>=20
>=20
> diff --git a/include/uapi/linux/taskstats.h b/include/uapi/linux/taskstat=
s.h
> index 95762232e018..7f169c65b16e 100644

I don't think I've yet seen a usable patch for this issue?  Can someone
please email one at me in the usual fashion?



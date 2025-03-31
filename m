Received: from ms.lwn.net (ms.lwn.net [45.79.88.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3DE231953A1;
	Mon, 31 Mar 2025 13:30:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.79.88.28
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743427815; cv=none; b=t0HvYIB4mBTrEfWxNSnhBCxGd7/iYuAxPLwo9UaoioWkLDjX0kVrREPHbWiLuIyc6cbP+LU73SmhD6PhugM7R1EBzuUQrXiYGLHOQvv4r0OtFaxvz8b/wZMH/evXXhGvJ+Gix0GXNrPSC8baG5RVPwZ+qStPWX/IaG5E4dlmGDU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743427815; c=relaxed/simple;
	bh=xvAxcwjxyDJWhDXu7y5JzLvjmhF/Q59dGZAjf5dEFKE=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=Y9BxUiKn17LwEB/RMexJ3g7Sqr2RoklV9Qwq/UtGOi0MidMsmwdWdGubQL4kCBebuWXItQASJYKIRdz3UJx+oQPGCev2h6Yi9VzM9m2fONEe8fOQWE4s2olJzKap6Orrtugu7wgbSahgm06YTqMeYD+e0xjfyIAWT1qpYx1eZ6g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net; spf=pass smtp.mailfrom=lwn.net; dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b=nr44Ae1H; arc=none smtp.client-ip=45.79.88.28
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lwn.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b="nr44Ae1H"
DKIM-Filter: OpenDKIM Filter v2.11.0 ms.lwn.net BB63640407
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lwn.net; s=20201203;
	t=1743427438; bh=3vxoY1G1VGLAh9adACl66l74IKVyT0LyXE9/eEvA3mo=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=nr44Ae1Hm1y8Afi7T/AqZYrVmVe2NiUTLykpI+Qv/ZO3Twlt+1m6SJpNPO3phY/Dr
	 X69N752/DXzz0WluggDvCTeSOpLQpb5x2fdQffnNeRmZZpOq4Dka0YfmPlO8UXUBf/
	 RckQ0cqfM8+DmNcxB93dLS4DqDLCCeyyeN8vd7PCdaAd8ZlVPc4a+mGjDw9MBk+XYX
	 X7tr35VXUF93tEiM9PkZeA2TlRX2hfDX9De7bLbY1utJKMgvEWhun8v+Zb0Wljggc+
	 VWc9tiJHBqNorLlBVSgzUM8xQtkj9MU4fgVBDLD7wVf3N4srVtxfHCPaS0jbwhj2NE
	 xtXjfeRAo3QRg==
Received: from localhost (unknown [IPv6:2601:280:4600:2da9::1fe])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by ms.lwn.net (Postfix) with ESMTPSA id BB63640407;
	Mon, 31 Mar 2025 13:23:58 +0000 (UTC)
From: Jonathan Corbet <corbet@lwn.net>
To: Integral <integral@archlinuxcn.org>
Cc: linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
 ziyao@disroot.org, integral@archlinuxcn.org, workflows@vger.kernel.org
Subject: Re: A contradiction of "summary phrase" definition in
 process/submitting-patches.rst
In-Reply-To: <eb1abac9-d6d2-4dce-a5f6-d0702ceca103@archlinuxcn.org>
References: <eb1abac9-d6d2-4dce-a5f6-d0702ceca103@archlinuxcn.org>
Date: Mon, 31 Mar 2025 07:23:57 -0600
Message-ID: <87h639e3ki.fsf@trenco.lwn.net>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Integral <integral@archlinuxcn.org> writes:

> I found a contradiction in process/submitting-patches.rst:
>
> The canonical patch subject line is::
>  =C2=A0=C2=A0=C2=A0 Subject: [PATCH 001/123] subsystem: summary phrase
>
> The ``summary phrase`` may be prefixed by tags enclosed in square
> brackets: "Subject: [PATCH <tag>...] <summary phrase>".
>
> The former means "summary phrase" doesn't include "subsystem", while the=
=20
> latter means "summary phrase" includes "subsystem".
>
> So, which one is correct?

I honestly don't see the contradiction here; the summary phrase is as
described here; the subsystem indicator is part of it.

When in doubt, look at the commits in the subsystem you are interested
in, and you will see the expected pattern quickly enough.

Thanks,

jon

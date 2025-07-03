Received: from ms.lwn.net (ms.lwn.net [45.79.88.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 33A2529C351;
	Thu,  3 Jul 2025 23:50:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.79.88.28
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751586618; cv=none; b=Wddn/VlL/WOg4gVXJY2Wmcs+tMWmLoeaQXBKWlDU5QLWIfxfDQvb1fXCLiODx5DH0fmz6LHozvK4+fw72KXwbHG6gfkpyqmiC31xWT+jrbhVlgg9mCYfU69+GgXqqmx8kKTOMQiBp0rLyGJO9kTQ/n7h3/B1K3lKd5WG4SwUP5c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751586618; c=relaxed/simple;
	bh=Oe3QQgJWZ56o+ycCPLVB9VISYiwHmlWi1PPZPZiKgDU=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=pyR342JzoVcU9LWs6LLmkLHP8TOckjO5Mh8WwCTYHnooVyT0fS/1qe48wPlM+V9FTmVtG965nwTMeZaHMSlOZHZNZ7dl8/IR6oh7OdaKeGKw5Pew5Zxn3C1JLekXqwjyf5h5l1TdANzV8NV/HJx47knCq3MkeFiUxfgHTuuaD0I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net; spf=pass smtp.mailfrom=lwn.net; dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b=rbMoDk4l; arc=none smtp.client-ip=45.79.88.28
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lwn.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b="rbMoDk4l"
DKIM-Filter: OpenDKIM Filter v2.11.0 ms.lwn.net 3F132406FC
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lwn.net; s=20201203;
	t=1751586615; bh=+Ni/Yq+mC3Wm6z94sO7qxNlDh19w0DmweAP27z8OY04=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=rbMoDk4ltkPAM5BEdVehqCcjN6UZOIpoYY2qbarlNVf6CjlIyA2Vk0eaWTRW58JP1
	 JntEayhrA+rX2W9vHKzt4eNO7kOSXE0KRafluWfMSJDdZ6Gfc1Km6kQ/Ml4uZDWuk0
	 mh0wQynn+iGx7d0Qy/Mpr/QPFYidmtE8a2wqcznQZrMEzVqiXAulg6juvKFSEdATR8
	 G5mPeOGWNuuTzsBkZMO0xzQpIVAzxpWreHZORm9D0+oIWiQ/dh11sSAFGdsnruxbJL
	 sfA2RazHRHrU1pZlOxJH+4q6LjQ6vN5+oQktvSUfGolb5AxdLRPv4m+hB/W5IWOKsq
	 rkvgUv09qS6KA==
Received: from localhost (unknown [IPv6:2601:280:4600:2da9::1fe])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by ms.lwn.net (Postfix) with ESMTPSA id 3F132406FC;
	Thu,  3 Jul 2025 23:50:15 +0000 (UTC)
From: Jonathan Corbet <corbet@lwn.net>
To: Carlos Bilbao <carlos.bilbao.osdev@gmail.com>, Bagas Sanjaya
 <bagasdotme@gmail.com>
Cc: Vegard Nossum <vegard.nossum@oracle.com>, Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>, Linux Documentation
 <linux-doc@vger.kernel.org>, Mauro Carvalho Chehab <mchehab@kernel.org>,
 Federico Vaga <federico.vaga@vaga.pv.it>, Akira Yokosawa
 <akiyks@gmail.com>, Carlos Bilbao <carlos.bilbao@kernel.org>, Avadhut Naik
 <avadhut.naik@amd.com>, Alex Shi <alexs@kernel.org>, Yanteng Si
 <si.yanteng@linux.dev>, Dongliang Mu <dzm91@hust.edu.cn>, Thomas Gleixner
 <tglx@linutronix.de>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Stanislav Fomichev <sdf@google.com>, David Vernet <void@manifault.com>,
 Miguel Ojeda <ojeda@kernel.org>, James Seo <james@equiv.tech>, Daniel
 Vetter <daniel.vetter@ffwll.ch>
Subject: Re: [PATCH RFC] Documentation: typography refresh
In-Reply-To: <CAOc0haLSQVO9RexsMDRJ9zx=TPOi5yC6ADX4VLSbFvi1bhP_iw@mail.gmail.com>
References: <20250619042318.17325-2-bagasdotme@gmail.com>
 <75f99fce-affa-4acc-afeb-2a9f70a6d907@oracle.com>
 <aFjNA1TkBiHXNKPD@archie.me>
 <250eb150-ef18-4e62-9791-f2ec4801cd39@gmail.com>
 <fb2d7547-dd6e-4f6a-978f-b92ae2eb20cb@gmail.com>
 <CAOc0haLSQVO9RexsMDRJ9zx=TPOi5yC6ADX4VLSbFvi1bhP_iw@mail.gmail.com>
Date: Thu, 03 Jul 2025 17:50:14 -0600
Message-ID: <87ikk8kf61.fsf@trenco.lwn.net>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Carlos Bilbao <carlos.bilbao.osdev@gmail.com> writes:

> Some, we can talk about it, I=E2=80=99d personally like to see a small fl=
ag
> displayed to the left of the language options at the top button.

If I understand you correctly, that's dangerous territory...flags and
languages are fraught with all kinds of disagreement and discord.  The
conventional wisdom is to avoid the use of flags to represent
languages.

Thanks,

jon

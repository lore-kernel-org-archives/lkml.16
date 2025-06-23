Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C6C1223328
	for <linux-kernel@vger.kernel.org>; Mon, 23 Jun 2025 18:25:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750703156; cv=none; b=LQ7Ep0eRMjmpzodO3lq1fKqKTswdSv1MfjhBfbBXZid0rYSAVabRVuPkGv9W5N+5oCWpiIGuMMRThNVqeMjRioUKnKJBCsO3ptaokTusZiAuSQOetBdNsKm9yYIc3H93GzUWeA7EZtTK2q4kSGsZLkZUFUyfqilD0YvXQmIZOAA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750703156; c=relaxed/simple;
	bh=D4etnCOphWgkD4/q3hoMGGAGx18azzSpuI03l96KjmA=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=HPH4mPwUtUl9doYNCPlCPMQG1oPcBZkzYnDptwVfdnLlEjOqmWoFQILo0prVseOFHLyiYyGl1ielB4o+6lN5NucqrRxMOtGbQD0ouWKBL2VOyJE02FPV1rjasUGwpwgWWTSUHP4EEcoLtNHK2nX21PnLzazMtpAvXKYheVEozGc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=EvQ07qVs; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="EvQ07qVs"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1BBCBC4CEEA;
	Mon, 23 Jun 2025 18:25:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1750703155;
	bh=D4etnCOphWgkD4/q3hoMGGAGx18azzSpuI03l96KjmA=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=EvQ07qVsZ3Bgen8iASGWfd1ZID1HwfDXEtNkTc/1QFW/zeZhiiqX2Vi0mv9F6IFfR
	 SSJ2wxWXetZHETcCX1ctX75JMNlf12PfUOn+GadcRMIuCzUrUEub1Up/GBgb6gUkht
	 wROnwsdgv7Rd8UXdBcVbHn5bPSf9Zg3nPzYmxflXUe1clfDEm4T13NU9aALfaHQ18V
	 YgOYumNOloopsfOQ/9v8dI3buwsOXd0Q6b3/LHd+6MSDtVBjl+bLcHMuV/+jIuWrsh
	 p026houDD5kI/h3l5nOd7gvuiKwf9voAxIZDR105sUn/yyhL9bcMiDE/tkET+kGaEQ
	 Q8mjnGgS/UqwA==
Date: Mon, 23 Jun 2025 20:25:49 +0200
From: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Cc: WangYuli <wangyuli@uniontech.com>, masahiroy@kernel.org,
 ojeda@kernel.org, nathan@kernel.org, alan.maguire@oracle.com,
 laurent.pinchart@ideasonboard.com, kris.van.hees@oracle.com,
 linux@weissschuh.net, tamird@gmail.com, vegard.nossum@oracle.com,
 ardb@kernel.org, lizhijian@fujitsu.com, linux-kernel@vger.kernel.org,
 corbet@lwn.net, zhanjun@uniontech.com, niecheng1@uniontech.com,
 guanwentao@uniontech.com
Subject: Re: [PATCH] gitignore: allow .pylintrc to be tracked
Message-ID: <20250623202549.3146d77d@foz.lan>
In-Reply-To: <CANiq72m+VbEdrTC8f+2Kmqa5YJqcGYOgLhOeDPV45zERz6BaBw@mail.gmail.com>
References: <1A357750FF71847E+20250623071933.311947-1-wangyuli@uniontech.com>
	<CANiq72m+VbEdrTC8f+2Kmqa5YJqcGYOgLhOeDPV45zERz6BaBw@mail.gmail.com>
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.49; x86_64-redhat-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

Em Mon, 23 Jun 2025 10:08:21 +0200
Miguel Ojeda <miguel.ojeda.sandonis@gmail.com> escreveu:

> On Mon, Jun 23, 2025 at 9:20=E2=80=AFAM WangYuli <wangyuli@uniontech.com>=
 wrote:
> >
> > The .pylintrc file was introduced by commit 02df8e3b333c ("docs: add a
> > .pylintrc file with sys path for docs scripts") to provide Python path
> > configuration for documentation scripts. However, the generic ".*" rule
> > in .gitignore causes this tracked file to be ignored, leading to warnin=
gs
> > during kernel builds.
> >
> > Add !.pylintrc to the exception list to explicitly allow this
> > configuration file to be tracked by git, consistent with other
> > development tool configuration files like .clang-format and .rustfmt.to=
ml.
> >
> > This resolves the build warning:
> >   .pylintrc: warning: ignored by one of the .gitignore files
> >
> > Fixes: 02df8e3b333c ("docs: add a .pylintrc file with sys path for docs=
 scripts")
> > Signed-off-by: WangYuli <wangyuli@uniontech.com> =20
>=20
> I haven't used the file, but dotted tool files should be in the list, so:
>=20
> Reviewed-by: Miguel Ojeda <ojeda@kernel.org>
Reviewed-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
>=20
> Thanks!
>=20
> Cheers,
> Miguel



Thanks,
Mauro

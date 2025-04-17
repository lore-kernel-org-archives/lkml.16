Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1DCBD2AD0C
	for <linux-kernel@vger.kernel.org>; Thu, 17 Apr 2025 20:06:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744920403; cv=none; b=X34/mRvQ2+e1+vrBthTwvPnnUB29O4XBFvBBS+MQ/896PieF1q1wSd6SiC87ZdKGd5cG9ci/n6GRombRP+rvRUHqYw89hUPD3G0aN5b+1BTctsZgbtsGGaqhKpIwl+M6yw49floA6QERlPsajukU3WlcVUbZD1JXY5UO6AtkerU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744920403; c=relaxed/simple;
	bh=q/vy1YX2+uTRbBtFY8YVzxCyPtEyoNyrwpp/Fz+rrmU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=YRzNUXrL6eYdZ0vX/r4PnsZAFQ9uvVyUqfXilbNVf766KRkC+aUc+hsyD7i03OD5TTvTpaEyHXzyTL9hRC8ephykaKlifxQryd9PBevdjB/lgUgjfw8KRfr6OYa65BQLPMa68sxgK/estM5vR79v2I5NwTOMv1g+Kfs2xgbiYos=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=h5mOVqGl; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="h5mOVqGl"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8518BC4CEE4
	for <linux-kernel@vger.kernel.org>; Thu, 17 Apr 2025 20:06:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744920402;
	bh=q/vy1YX2+uTRbBtFY8YVzxCyPtEyoNyrwpp/Fz+rrmU=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=h5mOVqGlHCcbMeh2iJ6P+/ydaqwlAqttTTGyiYkZKwLDyKFVfr/5JuoBBehOpMKpd
	 9G5wrdnD/b64DhM7anEk3K4xfbv87LbYZJQwFSGhhMdgPoOsYfnSvv8jmWrb9aqPx+
	 60yW6E7+PMonSxqgGXe5OlOd/v7Z6XAUBVgwoP4y1u55npg3jyxyh6kYRWOK/ErREz
	 hn5bbbSdt57KQCgxHAWhqu7yDEV1ZtEfj3ggSkAvXJ0p9Tn4J8MUO5p3d7XDq2L5Fl
	 t8oL+JYt2Owt0vbh+YgfH45tUxlKKBa33VbhX/8gVja2iL/gQHcMOEwxlSORjiVpXC
	 ALKJmT8wRi3lw==
Received: by mail-pj1-f49.google.com with SMTP id 98e67ed59e1d1-301918a4e1bso973697a91.1
        for <linux-kernel@vger.kernel.org>; Thu, 17 Apr 2025 13:06:42 -0700 (PDT)
X-Gm-Message-State: AOJu0YxcV115kwaKiMR3BIoUdu+Ps0Yjhq/VhqUSP4plCSdOdxYen33/
	24j1g7+UUGjpz9fZoBIxp61fBEEjVElSeiXbeocd1Fm7D4EEb3T5Io+F/1GAVu2OmZZhUTe0bC1
	hbjrJYeI+eczLyA8pbxl+FOp2Wt4=
X-Google-Smtp-Source: AGHT+IFoYGmudZ4wDvEbvWTf2r56JPhAO7qbG3oOwmR4uGiCuK25awOfWAowI0Ayig76hPvaE8ajyGfik99RnLLhGoM=
X-Received: by 2002:a17:90b:5827:b0:2ee:f076:20f1 with SMTP id
 98e67ed59e1d1-3087ba53cd7mr578860a91.0.1744920402036; Thu, 17 Apr 2025
 13:06:42 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <Z_6bxZUiodrE45HJ@bombadil.infradead.org> <CAPhsuW5HYYvGoFO2L81EBkHDmozxxjpmdRh+GPrAxea-+91YNQ@mail.gmail.com>
 <aAEV2U2A1sXdVffx@bombadil.infradead.org>
In-Reply-To: <aAEV2U2A1sXdVffx@bombadil.infradead.org>
From: Song Liu <song@kernel.org>
Date: Thu, 17 Apr 2025 13:06:29 -0700
X-Gmail-Original-Message-ID: <CAPhsuW5avVeJMZpCJut8EDOxsTOafa3pf_Ncn6To5AfvKzHHEA@mail.gmail.com>
X-Gm-Features: ATxdqUEem8cc5zoHMv7j1mSpy22YJnG19ybOFsRiawngpOGlz5_BRvFdUGq7QNI
Message-ID: <CAPhsuW5avVeJMZpCJut8EDOxsTOafa3pf_Ncn6To5AfvKzHHEA@mail.gmail.com>
Subject: Re: The future of kernel-patches-daemon - folding under LF?
To: Luis Chamberlain <mcgrof@kernel.org>
Cc: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, kdevops@lists.linux.dev, 
	Jim Zemlin <jzemlin@linux-foundation.org>, Konstantin Ryabitsev <mricon@kernel.org>, 
	=?UTF-8?Q?Javier_Gonz=C3=A1lez?= <javier.gonz@samsung.com>, 
	Greg Marsden <greg.marsden@oracle.com>, Tso Ted <tytso@mit.edu>, 
	Gustavo Padovan <gus@collabora.com>, Alexei Starovoitov <ast@kernel.org>, 
	Daniel Borkmann <daniel@iogearbox.net>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Apr 17, 2025 at 7:53=E2=80=AFAM Luis Chamberlain <mcgrof@kernel.org=
> wrote:
>
> On Wed, Apr 16, 2025 at 10:28:06PM -0700, Song Liu wrote:
> > Hi Luis,
> >
> > How about we discuss different options over a video conference?
> > We have a BPF office hour scheduled every Thursday at 9am PST.
> > Would this time work for folks?
>
> Works for me. How about next Thursday April 24th?


Yes. April 24th sounds great. I added this topic to the agenda.

Please refer to the following link for information about the office hour.

https://docs.google.com/spreadsheets/d/1LfrDXZ9-fdhvPEp_LHkxAMYyxxpwBXjywWa=
0AejEveU/edit?usp=3Dsharing

Song

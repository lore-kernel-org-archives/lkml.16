Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A7620BA50
	for <linux-kernel@vger.kernel.org>; Fri,  2 May 2025 20:41:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746218506; cv=none; b=A5zLEs8CI+t+bEHCjoZ0x8lFhPpAbGXmsSYHu1vWd6fu9Vu5nzXfcXdOwGfAtzdOurgAv85M2g3UlFhZYUow3nWiam/gyFYkXjkbMQstiC9x+eQBw20z8gIBthSKzaHrSNoe77ueSyyEXI/664RmCQNAMr/Xtg1tI3WaKtiac9I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746218506; c=relaxed/simple;
	bh=xleCRzouMoJU6VhrPnnaQ5GwdB/KpUkIdiiso6kUMyo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Uayob4qW3Z6kOk0dgPYE3eCzac4P2kreguQ7dC+lqEIPi1VfvNHjv3CJDUJ5oEuOPUIrHVTEqKhXzb1mA7EZkb78oUHAC1ZdDctZhp88H96slHt1uY8nKeFti0NDxXNKyrWdbKeNB72o0PpxYYvCFA73o3g0lbtX6V9jgs74Bcw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Jz6zHNry; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Jz6zHNry"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 37E10C4CEEF
	for <linux-kernel@vger.kernel.org>; Fri,  2 May 2025 20:41:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1746218506;
	bh=xleCRzouMoJU6VhrPnnaQ5GwdB/KpUkIdiiso6kUMyo=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=Jz6zHNryAN87xQEjGFdVzMf+IZI2vUGbcDs6Apg085g4f4qdi2knkKu9kq+qeh4rL
	 czlTuyZqD7PWxzTE1mBZgX7CVhp7/CWTBjDG7CeM5LnrIdgJmFlxb58FYqyMORl8Tj
	 C6MTGgtw7UnWelMXjgz23Sc+FBDaVaQ+7gE1pxhW9Jx/VNYhbpcjISwaZydPJ09WsR
	 nGFU0tKEz0zh+IQW3KNFx5N3XWDm6ihRCBGEdFx72szD+BlihVtuOKDqvLBEpQB/x5
	 pFVuZmmbVNBd+N8IO1xTDwPQUbciRFQjoQmSMnb91n2IyjPzUkvR1NzfulBcGmUtvb
	 bb5zO5uDrP8iQ==
Received: by mail-qv1-f41.google.com with SMTP id 6a1803df08f44-6ecf99dd567so33777306d6.0
        for <linux-kernel@vger.kernel.org>; Fri, 02 May 2025 13:41:46 -0700 (PDT)
X-Gm-Message-State: AOJu0Yy0MHDxhErQTFzYJqrZOv7ljFLhAPXqGPp71E81p7t8fjkbXzgZ
	U3hZa7Rg+1RcfGeg+ltLIRZuOaKAtx8S+QYeTx3RhfirlRGGEs5IAamAr3p1Vb+huf+FleieL63
	GVX/t1Zu6vQDx0OKPrB6k1O0J5FU=
X-Google-Smtp-Source: AGHT+IH3Efx1OnxkHj0v+TBHA44Ljh9s0//gmOhjf7fZj6jdNi+ZqlnLXyYjZ8xhC114DTbaP+zGEKZwEx7y+WxeOv4=
X-Received: by 2002:a05:6214:495:b0:6e8:ed7f:1a79 with SMTP id
 6a1803df08f44-6f5155ec7a0mr69416326d6.32.1746218505426; Fri, 02 May 2025
 13:41:45 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <Z_6bxZUiodrE45HJ@bombadil.infradead.org> <CAPhsuW5HYYvGoFO2L81EBkHDmozxxjpmdRh+GPrAxea-+91YNQ@mail.gmail.com>
 <aAEV2U2A1sXdVffx@bombadil.infradead.org> <CAPhsuW5avVeJMZpCJut8EDOxsTOafa3pf_Ncn6To5AfvKzHHEA@mail.gmail.com>
In-Reply-To: <CAPhsuW5avVeJMZpCJut8EDOxsTOafa3pf_Ncn6To5AfvKzHHEA@mail.gmail.com>
From: Song Liu <song@kernel.org>
Date: Fri, 2 May 2025 13:41:32 -0700
X-Gmail-Original-Message-ID: <CAPhsuW4huT=MxbnR8FrsEoB9His+NoW+TBLHBLs=k-hPiYwA2A@mail.gmail.com>
X-Gm-Features: ATxdqUEDQTaaReURxpubT_Jy1vjJZRA8MSI_nn7DWR4hnj2rpSwMKDxusnWZ6w4
Message-ID: <CAPhsuW4huT=MxbnR8FrsEoB9His+NoW+TBLHBLs=k-hPiYwA2A@mail.gmail.com>
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

Hi Luis and folks,

As we discussed, we moved KPD repository to an account that does not
require CLA:

https://github.com/kernel-patches/kernel-patches-daemon

Please use this repository as the base of development.

Thanks,
Song


On Thu, Apr 17, 2025 at 1:06=E2=80=AFPM Song Liu <song@kernel.org> wrote:
>
> On Thu, Apr 17, 2025 at 7:53=E2=80=AFAM Luis Chamberlain <mcgrof@kernel.o=
rg> wrote:
> >
> > On Wed, Apr 16, 2025 at 10:28:06PM -0700, Song Liu wrote:
> > > Hi Luis,
> > >
> > > How about we discuss different options over a video conference?
> > > We have a BPF office hour scheduled every Thursday at 9am PST.
> > > Would this time work for folks?
> >
> > Works for me. How about next Thursday April 24th?
>
>
> Yes. April 24th sounds great. I added this topic to the agenda.
>
> Please refer to the following link for information about the office hour.
>
> https://docs.google.com/spreadsheets/d/1LfrDXZ9-fdhvPEp_LHkxAMYyxxpwBXjyw=
Wa0AejEveU/edit?usp=3Dsharing
>
> Song

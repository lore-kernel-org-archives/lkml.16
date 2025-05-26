Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com [209.85.214.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A86107263B
	for <linux-kernel@vger.kernel.org>; Mon, 26 May 2025 18:00:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748282447; cv=none; b=EZDzw/0kD4apfUKoZgA1AGuTpZyg4U6e0Vs5c5+LLydL1PWNnbxVB1Crl22ZnPjitHLst9LrzncXJtbvioi9JOKYcrfqvDXkTMFVRfvFHRsJ5bbwFLOL/ds0yKWRZiA1qnIouNf4nsMSjRGoRImukoPnHQXDi5xC03NO/HeLVpo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748282447; c=relaxed/simple;
	bh=rI+licYUolL5nhcW9GoIZLfSpbwxMtL6YthxBl22SZU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=buM4EfzJ55gLgvw7a220Rg3zuyiyBRPXQArEnDCeiRfDqtgQ1jpwFAhxvj+LY/hGR185rwJQJLfTW8qpu0SWzoVLiUfh6legBj+OT50TrEcwVwdSxPOV3hpw4u+65uO2hzd1jmXrn4dEzHNBq9U65N+Mv7iotGni6gnn8dN/2iA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=f7vNnabh; arc=none smtp.client-ip=209.85.214.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="f7vNnabh"
Received: by mail-pl1-f182.google.com with SMTP id d9443c01a7336-2349068ebc7so48355ad.0
        for <linux-kernel@vger.kernel.org>; Mon, 26 May 2025 11:00:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1748282444; x=1748887244; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BE00iNGaQOBcvJTWH1HJdDZjS8vODDdLLtmR/QEPXS8=;
        b=f7vNnabhvdOz0PP/Pa+YruFib71wohXXIsckWp4N7raMihaWFWdtGU0iwOCFIUuKsp
         rHDtYtQm8cvpalAzewKWO5Qsu2Ni/Lj388MvKw+8Ubnks0PPr3Bu6WhunmtXo3CrKUTv
         FEa4NQNNzeBdCLIOcO2Ablmh3WcJ7VDyumAWkhPl2NY1/AHTPrvmAGd25fjGTMsm7xOb
         OrEVPBJ3NPzLIW5m/zqzTVAZp7HSkx5QIvBX9xBrQ/MifvQxp/reImpMB4t39wpUcN8K
         HaHm7RrnACuH2U8cWM/prs4K4HStYaQkftkA6T25bScCeeNtaw8zc0UukANCGaMPR19P
         GySA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748282444; x=1748887244;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=BE00iNGaQOBcvJTWH1HJdDZjS8vODDdLLtmR/QEPXS8=;
        b=opkHwwoKNGFxZY2dSCPMuODrFK1MuLO7h4YHnNgz4D3Pk4CMEBPFf9HFpwrNfjPYB0
         Cl4zN50DLDxPF4rCJOUswgVA66lQe8EoRgOnJEpq5wbhLmNOKJyQMz9HieyCSWmucVJq
         fYEw6scpuomwEicmEPLhxNEAyI41lOYTpiegKXI8jrqwTJUEb9GBzcSKmDICCNjfD3KP
         cf3bvCZTYefnGkCrPBI3iMUCb8bS2Q0RA81oXIDXZcNtRhwVfaY+wlJp7zasYNa62qKm
         b3ZLH0qS9gSLhCx2S/E+7+1vEA5AWu8NKv9WFUk7khWkrYQ6slkzjsqYvk2ErfBu9C4X
         P+ow==
X-Forwarded-Encrypted: i=1; AJvYcCUzDmUFxEnAc1ti6PEfohgwsJVz6MxUJVvyu0IS7mMLZGRxSpD7cGQI21dnZhkfYZT6eh77Q/9snIl7qxo=@vger.kernel.org
X-Gm-Message-State: AOJu0YzpVBtCQBWY0H5JKvB0RiPFosf4FFER+JA8+fH1jeDBPcs2pz1a
	x9tJ/+1vkUCj3EW7pGLr2rZOrLQ/y4HbUZpM0fVIgG7lQBrDlDzsdremhXX0m6eaPFqxaK3+/pe
	zebDZPhQstbS5h6Q+SeRw7BUP4jRd6d4uFXCNI9NZ
X-Gm-Gg: ASbGncti1Bd3aOJpyiWfksWlX9YzaxOYHxLttA1hloLFc/vHINcqSIhhDGSMjkEKz7/
	2pideypomvQz88mLVNH7ZkQ6lkaRCJcps5mARx9CWtLMpMCuQdSOEQIR06OT8QYdG6VGDNloHni
	Tf/5XSGMbRjPTSYGgn2x8ySm573xe+BL2tY1N9x1e6Bimk
X-Google-Smtp-Source: AGHT+IEtmxefPpCTSi1gvHA9a9DIBuanG4oeTpITjr5Cfh4ZkHf1HTV7gnyeYgG8lD3UeMrlJvwRa++zz4aloVbC260=
X-Received: by 2002:a17:902:ec8d:b0:216:6ecd:8950 with SMTP id
 d9443c01a7336-2341b52771amr4576785ad.19.1748282443435; Mon, 26 May 2025
 11:00:43 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250523032609.16334-1-byungchul@sk.com> <20250523032609.16334-14-byungchul@sk.com>
 <CAHS8izOX0j04=KB-=_kpyR+_HZHk+4hKK-xTEtsGNNHzZFvhKQ@mail.gmail.com>
 <20250526030858.GA56990@system.software.com> <20250526081247.GA47983@system.software.com>
In-Reply-To: <20250526081247.GA47983@system.software.com>
From: Mina Almasry <almasrymina@google.com>
Date: Mon, 26 May 2025 11:00:30 -0700
X-Gm-Features: AX0GCFsrsXIO7EOCYLWTkGfVc6XTbNgw4nzAjpdO0g7ysDNdP-dZJFnwMLd86jQ
Message-ID: <CAHS8izOMkgiWnkixFLhJ1+7OWFbYv+N0am83jV_2cgBecj-jxw@mail.gmail.com>
Subject: Re: [PATCH 13/18] mlx5: use netmem descriptor and APIs for page pool
To: Byungchul Park <byungchul@sk.com>
Cc: willy@infradead.org, netdev@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-mm@kvack.org, kernel_team@skhynix.com, kuba@kernel.org, 
	ilias.apalodimas@linaro.org, harry.yoo@oracle.com, hawk@kernel.org, 
	akpm@linux-foundation.org, davem@davemloft.net, john.fastabend@gmail.com, 
	andrew+netdev@lunn.ch, asml.silence@gmail.com, toke@redhat.com, 
	tariqt@nvidia.com, edumazet@google.com, pabeni@redhat.com, saeedm@nvidia.com, 
	leon@kernel.org, ast@kernel.org, daniel@iogearbox.net, david@redhat.com, 
	lorenzo.stoakes@oracle.com, Liam.Howlett@oracle.com, vbabka@suse.cz, 
	rppt@kernel.org, surenb@google.com, mhocko@suse.com, horms@kernel.org, 
	linux-rdma@vger.kernel.org, bpf@vger.kernel.org, vishal.moola@gmail.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, May 26, 2025 at 1:12=E2=80=AFAM Byungchul Park <byungchul@sk.com> w=
rote:
>
> On Mon, May 26, 2025 at 12:08:58PM +0900, Byungchul Park wrote:
> > On Fri, May 23, 2025 at 10:13:27AM -0700, Mina Almasry wrote:
> > > On Thu, May 22, 2025 at 8:26=E2=80=AFPM Byungchul Park <byungchul@sk.=
com> wrote:
> > > >
> > > > To simplify struct page, the effort to seperate its own descriptor =
from
> > > > struct page is required and the work for page pool is on going.
> > > >
> > > > Use netmem descriptor and APIs for page pool in mlx5 code.
> > > >
> > > > Signed-off-by: Byungchul Park <byungchul@sk.com>
> > >
> > > Just FYI, you're racing with Nvidia adding netmem support to mlx5 as
> > > well. Probably they prefer to take their patch. So try to rebase on
> > > top of that maybe? Up to you.
> > >
> > > https://lore.kernel.org/netdev/1747950086-1246773-9-git-send-email-ta=
riqt@nvidia.com/
> > >
> > > I also wonder if you should send this through the net-next tree, sinc=
e
> > > it seem to race with changes that are going to land in net-next soon.
> > > Up to you, I don't have any strong preference. But if you do send to
> > > net-next, there are a bunch of extra rules to keep in mind:
> > >
> > > https://docs.kernel.org/process/maintainer-netdev.html
>
> It looks like I have to wait for net-next to reopen, maybe until the
> next -rc1 released..  Right?  However, I can see some patches posted now.
> Hm..
>

We try to stick to 15 patches, but I've seen up to 20 sometimes get reviewe=
d.

net-next just closed unfortunately, so yes you'll need to wait until
it reopens. RFCs are welcome in the meantime, and if you want to stick
to mm-unstable that's fine by me too, FWIW.

--=20
Thanks,
Mina

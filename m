Received: from mail-yw1-f178.google.com (mail-yw1-f178.google.com [209.85.128.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 540D92A1C9;
	Mon, 23 Jun 2025 09:12:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750669973; cv=none; b=c2ZKtCWw6u8MLOQnG8QaWf/7LJgjAHfNJAUMNvbZv7uWaAjQMv1mbuHvBsMNYPps/O+PkOlID4ce/PpDcTaLpXMml9j7Xwz0skUPG6m/NMMxjYCddVrE2VRXlzyYfLJlxEmY4s2WEL1NDbyO8KipcM6UHp9B8KffeZOELB9vU6k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750669973; c=relaxed/simple;
	bh=oaHTIrFsTJslwFK2Oe2h8dhFDmaNXxpX29yDLq6jl6g=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=itx+U0sWWloWujsxOx70K4pscbeA8WJD+ajcqyWaSc1YDCZ+nzuCDuFSR0CdFsg/53Ok9Lhji+2ctzzmOIrR7b/eEnPEWV7eeoN1r8rsjnOJ1SouJhZrCaVjR61q61E/VFzTt3m0tKxGoVyZAX4ans/b4I8Dt/vERXQ3RKRZnMw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=iGkxnIFn; arc=none smtp.client-ip=209.85.128.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="iGkxnIFn"
Received: by mail-yw1-f178.google.com with SMTP id 00721157ae682-710e344bbf9so37249247b3.2;
        Mon, 23 Jun 2025 02:12:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1750669971; x=1751274771; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=oaHTIrFsTJslwFK2Oe2h8dhFDmaNXxpX29yDLq6jl6g=;
        b=iGkxnIFnV3knc6Xm4bayHZSqoygI3z3SOCY1o1ITtL4MZ/9ANCxRLal9Am/4jA4Cub
         ihniCemmO+L7BfLBEFjHC+oYgQe3ulab3+kCi7T+YkAt5BrzJNDVrGhv9CpNhM1kvXsj
         2KXU5z6YnmtPcLmprJKAdN2P1cwP+UB8bERkxKpd2XQLsUZzhv0rxhjfcyCmGaqUdkR1
         8SjqdHUnC/I9c0U+HQbK220G7TuNtLXPWqDW8a29rHr4RrWnB7lPGSUaSJ092RiINRgz
         LnokasIBH/K2naaYhTwLTxVPoRNBSevJfutZM9UJe7Fza3quM1gOyzseU/aClCOLVbqx
         F1SA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750669971; x=1751274771;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=oaHTIrFsTJslwFK2Oe2h8dhFDmaNXxpX29yDLq6jl6g=;
        b=qZo8OQ6Z1JlYmynBDNe1AjfMHisFwMbIYERieAOCWPsPba+U6TUV6191avRnPEQDwd
         5cxum4aCQOyY7yVBiOSHwiVpijCllRGKR179LcRBKDud80OwnlcLggarCJO//79MC5sV
         y1466N3b8nJCc3rjOp/QmHFJ+leCwDHgnTdoSX3y27l1NzWGgE9vbmQwPdz3TdGtVJVI
         YH3lBkmnqtlvdnGCNkJzceZfn72yI6g64mYTLzzpHsOGuGAEGkx88vlHeTsByk/2wMw4
         skH5lcVt0d00HqxwBWd7EZeeJ4wIBpQUzOJa89u1hh7AdPhZf7tlMFhLCO5eW+1PagGd
         t/1w==
X-Forwarded-Encrypted: i=1; AJvYcCUH5akgxTWqOA5ORSFLMwmME4g5pQlU5OybLgGsNjN9LzGB2ZZFcs064XNOsN4zrUTJuaRaQv88kXe+nM9K@vger.kernel.org, AJvYcCVsONIcwVvZknOprHF1/zQCA85eF6FedwtQABtGvU9iIDg9yHd8MpuVJI9azdYYP9gVLqYq4ZoFpbg=@vger.kernel.org
X-Gm-Message-State: AOJu0YyqD/SXw5Awe/Ki55otdn1BiJFq5YaI2De/i38w/R4R8F+UG/QC
	7cbpuqQH2PmW4BRbEiRL1yQ9BY3gd6lSuiFVy0IM4ujmb9RlvtStxeuqMrwvREe9r5o+W0Ve3/+
	tExGQ8VyFxjyswWR0qrcAR8n+7FwUpHQ=
X-Gm-Gg: ASbGncv5pWAUhme6QZb8ynB+Vhr5ZXpOeJAZCSetwLQF0Uea5szG/r5MZD2kIusLz01
	szWkC76dm4xFWOaD07ZKG2IS1/HveV63ChMNrjvV3KawG422e49za+viEGQDnvi0FSILsnRuaBN
	r9thwa8Ql8F1kc37C7OTn3wFqzXd8aNknl7hERBdQTR8Gbzw==
X-Google-Smtp-Source: AGHT+IFmhY/vt9oNQjuh/xCp9QjF4OjLx+Y1VFbCyRG/NTpSueTo81/o/aDOJLbSztmxX2uuEP6Xgv/Qqyl8CVF3UDI=
X-Received: by 2002:a05:690c:350f:b0:70e:7882:ea91 with SMTP id
 00721157ae682-712c6776185mr165203447b3.35.1750669971187; Mon, 23 Jun 2025
 02:12:51 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250622004249.9083-1-sef1548@gmail.com> <b16a1df5-0b81-4600-bd68-2d261d2a3780@redhat.com>
 <CABZAGRGvf9Ge5EvMgFP3FUHt2QOpq6xXe9nB4=it9zb+V1DNwg@mail.gmail.com>
In-Reply-To: <CABZAGRGvf9Ge5EvMgFP3FUHt2QOpq6xXe9nB4=it9zb+V1DNwg@mail.gmail.com>
From: Dongliang Mu <mudongliangabcd@gmail.com>
Date: Mon, 23 Jun 2025 17:12:24 +0800
X-Gm-Features: AX0GCFv88oBmJMR5_Gb7Q4je7M7rRRwaULhgqxt57MvO_TTowEz2vo07wpjVA-8
Message-ID: <CAD-N9QV5r4YyO6qbL477x0sJar2=WTdHH=x58P9Qatff_HC3Nw@mail.gmail.com>
Subject: Re: [PATCH] mm/balloon_compaction: update Chinese docs for movable_ops
To: Nick Huang <sef1548@gmail.com>
Cc: David Hildenbrand <david@redhat.com>, alexs@kernel.org, si.yanteng@linux.dev, 
	dzm91@hust.edu.cn, corbet@lwn.net, akpm@linux-foundation.org, 
	wangkefeng.wang@huawei.com, vishal.moola@gmail.com, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-mm@kvack.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Jun 23, 2025 at 4:51=E2=80=AFPM Nick Huang <sef1548@gmail.com> wrot=
e:
>
> David Hildenbrand <david@redhat.com> =E6=96=BC 2025=E5=B9=B46=E6=9C=8823=
=E6=97=A5 =E9=80=B1=E4=B8=80 =E4=B8=8B=E5=8D=884:08=E5=AF=AB=E9=81=93=EF=BC=
=9A
> >
> > On 22.06.25 02:42, Nick Huang wrote:
> > > Remove Non-LRU Page Migration and Add Movable_ops Page Migration
> > >
> >
> > I'm afraid most people you CC on Chinese doc updates will not be able t=
o
> > help in any reasonable way.
> >
> > --
> > Cheers,
> >
> > David / dhildenb
>
> How can I fix these things?

From my understanding, you can follow this how-to.rst[1] and submit
your patches.

This is more friendly for reviewers and maintainers.

[1] https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree=
/Documentation/translations/zh_CN/how-to.rst

>
>
> --
> Regards,
> Nick Huang
>

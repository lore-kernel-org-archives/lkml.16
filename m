Received: from mail-qt1-f179.google.com (mail-qt1-f179.google.com [209.85.160.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D8FB21579F
	for <linux-kernel@vger.kernel.org>; Fri,  9 May 2025 15:27:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746804458; cv=none; b=ofuvAFprCwEdZNTq2X9fltLJ+ltWtV1Ge9yiUGYX3F9/UfMiN6vCRLdHI6DcIB5pbv7nCOc5GNw0UXgtr0SGZ98efxb3JznbC9m6P8yTwsSYTWcOr00EL1ElF0yU9185Ly+5O4ERjxHWhA8kPs8HDHYYmHyCFsgcB/ORwyhksKk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746804458; c=relaxed/simple;
	bh=w7Y9hkYouh/ruXihXj++7+rQzUGgn/3Py4i9kAfnqaU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Content-Type; b=YGLMpmh+Outd/udOlqafnQzYhT5SBstUxHxaSZNruJw255Skp8DQqrsHbTXIfYQbU1lLVavKqKdeXmxaXEhtb7ZQHszWS2XhzY3/T+FX6SJMy4tMmZPdoDhso419lIi6mMiS2sfiUyZzFRrL/byX2HmI4NWJrTM8yzpMPifaDEE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=soFFiIFU; arc=none smtp.client-ip=209.85.160.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="soFFiIFU"
Received: by mail-qt1-f179.google.com with SMTP id d75a77b69052e-47666573242so371711cf.0
        for <linux-kernel@vger.kernel.org>; Fri, 09 May 2025 08:27:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1746804455; x=1747409255; darn=vger.kernel.org;
        h=content-transfer-encoding:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jG9EE6VQeTuEiYsSLxlwDzhKExC7nkCkVw5vNICkPms=;
        b=soFFiIFUku+Q4eSNN4QcwL8ix9btkYyfBGl+VyChfjXgQGG/z/7LmRGBrGiZYFACbw
         3/hyPdbFuTj/AGxNqEhHanlPUXdsaMeK+jksxfKSrMAUG8FgRL7T0NrRPX8cat8GQUmI
         5msB9l/deYZSI2Z1piwBr7dxapj3y+kRtsn9yG9T1GhOy6yeXRDVSQIK3HOfshs6zO6y
         qtUEWz1doscGdeAgREpPPQqREyNpYJthymw7HWvmuLdw0NAbcm7woYwikLqFUeZkGlWD
         XYY+YXe2YaHVPrXwJR5UYfOrZp5Dudykp6sGAnfpb9zUlnE40v/5okc3e+hJKQKytm9t
         FCQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746804455; x=1747409255;
        h=content-transfer-encoding:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=jG9EE6VQeTuEiYsSLxlwDzhKExC7nkCkVw5vNICkPms=;
        b=EGLWVv1DJmGZro043W/s7QFE3JlzQCsEpkAZLSO3NWz/DZs7RkffWcR/POl97GyT2g
         BGOF2J5L7MwsoZNra8mv5ZIVFLnYZP2JcD12RCZXbE9rVAudiDruEWCwbJijVpuKWCpq
         5YBDVUFgT61kBWWbNl1p9c1CusnHywl1p9QR00SJh9uSaPJtLMi0ZZghQBDzIvKzBeVE
         WPQ4hhO28nx0CQg1A5GbUh9d65CXWe/tyr/hPc9BUll4Ve+oOp2L8E4ZG1+ndzefd4Sc
         eCuwroJPOY6+uUPF/hTgsrp/bBQNCqdzinQVxaEeEkCGz9DuiHl/FcTl4DBwUQsYKSwb
         fIpg==
X-Forwarded-Encrypted: i=1; AJvYcCWuHQAdnrhKgkMBiXrUpNd9Sqpzn3RxmZxj8DlLvqnYwaMNiVVL2EwPHo5GFI44lPfuRKA1B7CnwWWWeF0=@vger.kernel.org
X-Gm-Message-State: AOJu0YzU+WbuwTboXC8+okSLlNudDky+AUSR6X5UbW9+5n5G/pCEb41d
	EI4Wv267H0N9FIz6nOMD9F7CJLfo/WUnLiKhpkDOp9AYT+l0Qi9wOVBex/yZI9qmcaRsqg2uy+i
	DRdfOMuXfFRadov+JB7WKIZXmrh/Ag2F3miel
X-Gm-Gg: ASbGncuiODoB5w+/XckUnG9SpZbFqvJuhukp/hQkpxYaB9ea3Ft+KgssbXy1K1VLFWU
	8ZRs2hhEiRr3DA6acBwDghHtwxv+To36x77RP/pMM3xuPOyO5j1K+KkXGxmd86rC1d2eHyTONeW
	G6tTCtn5owEGPEUuQRE96r
X-Google-Smtp-Source: AGHT+IHApWir+Vo2/cy0YO8oikkiLlm8XQykhat6pTBhzrhQ/LwUY77hX9i0V/Re8ShFn/hJAzb3YKYGyOXal5OvpBs=
X-Received: by 2002:a05:622a:190b:b0:47a:e803:da1 with SMTP id
 d75a77b69052e-49453c2a4e5mr4115081cf.5.1746804454756; Fri, 09 May 2025
 08:27:34 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250429014754.1479118-1-Liam.Howlett@oracle.com> <z2hyuganxadlf7guskolgd6epu75jutipt7uwg5sqwew6a7lyv@6fbcue5r745x>
In-Reply-To: <z2hyuganxadlf7guskolgd6epu75jutipt7uwg5sqwew6a7lyv@6fbcue5r745x>
From: Suren Baghdasaryan <surenb@google.com>
Date: Fri, 9 May 2025 08:27:23 -0700
X-Gm-Features: AX0GCFu18kgfCkdbJqYlBB7hChaHXYsZauHXXbNvU9KC5JGedHdYp6mKPm8QELk
Message-ID: <CAJuCfpFXuyg+otnr2uHauGi1-UD2sxxS26ONQNBwuUUisOssQQ@mail.gmail.com>
Subject: Re: [RFC PATCH v6.6] maple_tree: Fix MA_STATE_PREALLOC flag in mas_preallocate()
To: "Liam R. Howlett" <Liam.Howlett@oracle.com>, maple-tree@lists.infradead.org, 
	linux-mm@kvack.org, linux-kernel@vger.kernel.org, 
	Zhaoyang Huang <zhaoyang.huang@unisoc.com>, Hailong Liu <hailong.liu@oppo.com>, 
	Lorenzo Stoakes <lorenzo.stoakes@oracle.com>, Suren Baghdasaryan <surenb@google.com>, 
	"zhangpeng . 00 @ bytedance . com" <zhangpeng.00@bytedance.com>, Steve Kang <Steve.Kang@unisoc.com>, 
	Matthew Wilcox <willy@infradead.org>, Sidhartha Kumar <sidhartha.kumar@oracle.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, May 7, 2025 at 8:50=E2=80=AFAM Liam R. Howlett <Liam.Howlett@oracle=
.com> wrote:
>
> * Liam R. Howlett <Liam.Howlett@oracle.com> [250428 21:48]:
> > Temporarily clear the preallocation flag when explicitly requesting
> > allocations.  Pre-existing allocations are already counted against the
> > request through mas_node_count_gfp(), but the allocations will not
> > happen if the MA_STATE_PREALLOC flag is set.  This flag is meant to
> > avoid re-allocating in bulk allocation mode, and to detect issues with
> > preallocation calculations.
> >
> > The MA_STATE_PREALLOC flag should also always be set on zero allocation=
s
> > so that detection of underflow allocations will print a WARN_ON() durin=
g
> > consumption.
> >
> > User visible effect of this flaw is a WARN_ON() followed by a null
> > pointer dereference when subsequent requests for larger number of nodes
> > is ignored, such as the vma merge retry in mmap_region() caused by
> > drivers altering the vma flags.
> >
> > Reported-by: Zhaoyang Huang <zhaoyang.huang@unisoc.com>
> > Reported-by: Hailong Liu <hailong.liu@oppo.com>
> > Fixes: 54a611b605901 ("Maple Tree: add new data structure")
> > Link: https://lore.kernel.org/all/1652f7eb-a51b-4fee-8058-c73af63bacd1@=
oppo.com/
> > Link: https://lore.kernel.org/all/20250428184058.1416274-1-Liam.Howlett=
@oracle.com/
> > Cc: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
> > Cc: Suren Baghdasaryan <surenb@google.com>
> > Cc: Hailong Liu <hailong.liu@oppo.com>
> > Cc: zhangpeng.00@bytedance.com <zhangpeng.00@bytedance.com>
> > Cc: Steve Kang <Steve.Kang@unisoc.com>
> > Cc: Matthew Wilcox <willy@infradead.org>
> > Cc: Sidhartha Kumar <sidhartha.kumar@oracle.com>
> > Signed-off-by: Liam R. Howlett <Liam.Howlett@oracle.com>
>
> ...
>
> I have a version of this for mm-new and I'd like to send it out.  Once
> this is upstream, it will be backported to the stable kernels with
> something that looks a lot like what I sent out here.
>
> Did this fix the issue in the longer running tests?

- everyone else

Hi Liam,
I think the delay is due to the holidays in China. I requested an
update from the partners but they will probably provide it next week.
Thanks,
Suren.

>
> Thanks,
> Liam

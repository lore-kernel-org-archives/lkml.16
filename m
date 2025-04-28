Received: from mail-qt1-f177.google.com (mail-qt1-f177.google.com [209.85.160.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C1F2A94A
	for <linux-kernel@vger.kernel.org>; Mon, 28 Apr 2025 21:08:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745874500; cv=none; b=fcYd/7w1eyo2gjccHh3pdad8dyytEFF2WrKR0NjaD1VhlXRiO2gWxwn2cvP0O94xUdkks+LwhUEplw3pfuRCI1PZPrOsb6zHuoLgTBcl6W5EjG/EDT88JsNADxHqRC8AE0LAYuvudfBW+sPDJNeX+SuMoYlrOKrlY6KLwIk20XE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745874500; c=relaxed/simple;
	bh=96KWHbGjqb6O9nMPWtYXbUpYWSkJs4xNj6NtH3I4gE4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=fEqphV5+2ckkZLRW3H3LoCsiER5QHxQxhTKO4jMncYlGRTt/Kbww6OTgyG9L3TGz7OpiJ0WlSUZzdR0ocyxSv0gcbvYRsdMeSe2YZYjwwTz3h2X/lgJqLCzECsi0r6I3+92UdJfwkWkl6iOpGJuxcLXC/TekLIEts6RDcep/idg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=bBc8WQaJ; arc=none smtp.client-ip=209.85.160.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="bBc8WQaJ"
Received: by mail-qt1-f177.google.com with SMTP id d75a77b69052e-47681dba807so23401cf.1
        for <linux-kernel@vger.kernel.org>; Mon, 28 Apr 2025 14:08:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1745874497; x=1746479297; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FT0CaeuueSO43RohZzjCWW30DBf6Dm/pusaOGrzO4mw=;
        b=bBc8WQaJqHPpTuMuDwhOULgbSbWQUKX80na/u+jojOAZTAFKdTmwK748ncZuroIKgI
         EdWVUj2bkmm9KKhNnZCiuzXlVDG/Fbe40PQNuyCzLTt9FDrOyWLSQKAP3CHG82zyl93V
         IRD6pfwm/zTi+M4j7z9zVOYbtpmHKLrJyqWx11gmA+0/z7aVpYk2V38Ify6GzjS0MJe2
         7kLXFoxNpzyjGXBHpzIOSDgO+QhSrBDfRqyW8yi1B5FlwXn7msw0oRiRYmxh6XwtVI07
         5S9WGW5RQfOsVP+9qAWHJYjTjZt+eq6mH24Nzwvu8fFqO0UNJDSIGS3zwV3agOj0mzp2
         GmbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745874497; x=1746479297;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=FT0CaeuueSO43RohZzjCWW30DBf6Dm/pusaOGrzO4mw=;
        b=IKfPHeOpImBWqHulpBvwMyZJH/yzsVyG4AG83OX5EyGxA72WMW5KS5+iAaLLu+APJP
         9i3FmFHj2pNAJ+b4h/mDxWVAFfVtssNTRxUJUKeZmVLyF9blAG8VmxmNgBy8RnEX+y+K
         qNAk8Dztwp3Oq0YLxRI99u6ZEzamKkoM959b/Gqk8EIKICo4i/zCl7tqT7dc1PSdpbs9
         DM7nJPKUYghDRiR8wibDAVAfaDuryYbeB/snhpQa9k3g9TaS9YxMvn6GCChNIHVPi6e3
         QD/HLDwUokV4khJoQ29x7XkOX9usvc+7ZsMCLhu8MMWFWTgHuAVSTXuu76hEuqsr9u1k
         Ribw==
X-Forwarded-Encrypted: i=1; AJvYcCUl0lvp/UQXTyaIpKNsvCm3VshQA1eZgtkl/V31Q5kxc7kInHZZBmCgbnkzzYJ34pXOQkTTV4g6zHu+mS8=@vger.kernel.org
X-Gm-Message-State: AOJu0YwqoI+U2TUSaiEV7WCoF6YMcVZejmIIRRl8WMSF5EpZVBd4Rgjz
	IpAEN1BR5MYCYKi7ebGX8plqyI4fH0pHSE/6H5GBliI18lYHCEvqN8kXm10U66a9T0Yr49nCI66
	fu9RWjbOl1nDtho52gHR3JqTQzga2JpoLZsLW
X-Gm-Gg: ASbGncvSdgDxMExD/qP6EO/VvUrZ6UXS/w/NPxyWctHEGtO4RGXu5SM1nPBFIXHGy5P
	OwNWLPDFePMHfIAbOsjVp95V1BnxCkfYEzNm8d5KGcWAKbM2u+tci1gxWChT9NGheDyaCvkCEAp
	Wgoxv3lOi1hdSbskCbsYv6
X-Google-Smtp-Source: AGHT+IF7nEeNN5IoHYUZOsksCwxGnP76MH/oM4Ag+TLub1j6OYkYCBReXTbDlN3KDAptidyK0UifPW7MNggZmdZ4WsA=
X-Received: by 2002:ac8:7dd3:0:b0:486:adf7:36a4 with SMTP id
 d75a77b69052e-4885e5a2f5amr1100811cf.18.1745874496976; Mon, 28 Apr 2025
 14:08:16 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250428184058.1416274-1-Liam.Howlett@oracle.com>
In-Reply-To: <20250428184058.1416274-1-Liam.Howlett@oracle.com>
From: Suren Baghdasaryan <surenb@google.com>
Date: Mon, 28 Apr 2025 14:08:06 -0700
X-Gm-Features: ATxdqUG5yGDhO1Uwi8IbUUJ9HWVg6HGCcUvY-98PnsAZxbZMsP2M7PaJRH1Z8Jw
Message-ID: <CAJuCfpF9aBvTw-r-CMM4+BgbAKCePZpR7_H4ouifWDHDiYQ8Qg@mail.gmail.com>
Subject: Re: [RFC PATCH v6.6] maple_tree: Fix mas_prealloc() reset
To: "Liam R. Howlett" <Liam.Howlett@oracle.com>
Cc: sidhartha.kumar@oracle.com, maple-tree@lists.infradead.org, 
	linux-mm@kvack.org, linux-kernel@vger.kernel.org, 
	Zhaoyang Huang <zhaoyang.huang@unisoc.com>, Hailong Liu <hailong.liu@oppo.com>, 
	Lorenzo Stoakes <lorenzo.stoakes@oracle.com>, 
	"zhangpeng . 00 @ bytedance . com" <zhangpeng.00@bytedance.com>, Steve Kang <Steve.Kang@unisoc.com>, 
	Matthew Wilcox <willy@infradead.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Apr 28, 2025 at 12:02=E2=80=AFPM Liam R. Howlett
<Liam.Howlett@oracle.com> wrote:
>
> A previously used maple state may not be in the correct state for the
> preallocation to correctly calculate the number of nodes necessary for th=
e
> configured store operation.
>
> The user visible effect of which is warning that there are no nodes
> allocated followed by a crash when there is a null pointer dereference
> shortly after.
>
> The NULL pointer dereference has been reported to happen when a vma
> iterator is used to preallocate after walking to a leaf node but then
> requesting to preallocate for a store across node boundaries (in v6.6.
> of the kernel).  The altered range means that there may not been enough
> nodes as the maple state has been incorrectly configured.  A critical
> step is that the vma iterator then detects the misconfigured maple state
> and resets, thus ensuring the tree is not corrupted - but ultimately
> causes a failure when there are no nodes left.
>
> Detect a misconfigured maple state in the mas_preallocate() code by
> examining the current location and planned write to ensure a reset is
> done if required.  The performance impacts are minimal and within the
> noise in initial testing.

With this fix applied I can still see the issue using Hailong's
reproducers, both the userspace one that he shared over the weekend
and the one posted at
https://lore.kernel.org/all/1652f7eb-a51b-4fee-8058-c73af63bacd1@oppo.com/

>
> Reported-by: Zhaoyang Huang <zhaoyang.huang@unisoc.com>
> Reported-by: Hailong Liu <hailong.liu@oppo.com>
> Fixes: fec29364348fe ("maple_tree: reduce resets during store setup")
> Link: https://lore.kernel.org/all/1652f7eb-a51b-4fee-8058-c73af63bacd1@op=
po.com/
> Cc: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
> Cc: Suren Baghdasaryan <surenb@google.com>
> Cc: Hailong Liu <hailong.liu@oppo.com>
> Cc: zhangpeng.00@bytedance.com <zhangpeng.00@bytedance.com>
> Cc: Steve Kang <Steve.Kang@unisoc.com>
> Cc: Matthew Wilcox <willy@infradead.org>
> Signed-off-by: Liam R. Howlett <Liam.Howlett@oracle.com>
> ---
>  lib/maple_tree.c | 35 +++++++++++++++++++++++++++++++----
>  1 file changed, 31 insertions(+), 4 deletions(-)
>
> diff --git a/lib/maple_tree.c b/lib/maple_tree.c
> index 4eda949063602..17af9073494f5 100644
> --- a/lib/maple_tree.c
> +++ b/lib/maple_tree.c
> @@ -5350,6 +5350,8 @@ static inline void mte_destroy_walk(struct maple_en=
ode *enode,
>
>  static void mas_wr_store_setup(struct ma_wr_state *wr_mas)
>  {
> +       unsigned char node_size;
> +
>         if (!mas_is_active(wr_mas->mas)) {
>                 if (mas_is_start(wr_mas->mas))
>                         return;
> @@ -5372,17 +5374,42 @@ static void mas_wr_store_setup(struct ma_wr_state=
 *wr_mas)
>          * writes within this node.  This is to stop partial walks in
>          * mas_prealloc() from being reset.
>          */
> +
> +       /* Leaf root node is safe */
> +       if (mte_is_root(wr_mas->mas->node))
> +               return;
> +
> +       /* Cannot span beyond this node */
>         if (wr_mas->mas->last > wr_mas->mas->max)
>                 goto reset;
>
> -       if (wr_mas->entry)
> +       /* Cannot span before this node */
> +       if (wr_mas->mas->index < wr_mas->mas->min)
> +               goto reset;
> +
> +       wr_mas->type =3D mte_node_type(wr_mas->mas->node);
> +       /* unfinished walk is okay */
> +       if (!ma_is_leaf(wr_mas->type))
>                 return;
>
> -       if (mte_is_leaf(wr_mas->mas->node) &&
> -           wr_mas->mas->last =3D=3D wr_mas->mas->max)
> +       /* Leaf node that ends in 0 means a spanning store */
> +       if (!wr_mas->entry &&
> +           (wr_mas->mas->last =3D=3D wr_mas->mas->max))
>                 goto reset;
>
> -       return;
> +       mas_wr_node_walk(wr_mas);
> +       if (wr_mas->r_min =3D=3D wr_mas->mas->index &&
> +           wr_mas->r_max =3D=3D wr_mas->mas->last)
> +               return; /* exact fit, no allocations */
> +
> +       wr_mas->slots =3D ma_slots(wr_mas->node, wr_mas->type);
> +       mas_wr_end_piv(wr_mas);
> +       node_size =3D mas_wr_new_end(wr_mas);
> +       if (node_size >=3D mt_slots[wr_mas->type])
> +               goto reset; /* Not going to fit */
> +
> +       if (node_size - 1 > mt_min_slots[wr_mas->type])
> +               return; /* sufficient and will fit */
>
>  reset:
>         mas_reset(wr_mas->mas);
> --
> 2.47.2
>

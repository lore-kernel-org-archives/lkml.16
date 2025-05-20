Received: from mail-qt1-f171.google.com (mail-qt1-f171.google.com [209.85.160.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 54EC320C473
	for <linux-kernel@vger.kernel.org>; Tue, 20 May 2025 15:20:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747754452; cv=none; b=H1jpQJ6eAYtG7CMLoki1PAXThco1EtEGJvtryOyBYZLs7BzEJI3AB1NoSuiT5+TaEoKN6BqrHZejxX/e0iHzBZI4N8USapLRv4eQwgY+cdZGit9yvYoRgGRE3E1fR3IG1pCj5OJrrdmbDBgt8NT28qA69qMf3nLRzQBMqjT8z5Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747754452; c=relaxed/simple;
	bh=w3T8AvivgiFTSQv1ULlmSX1cmJkhVDHYEOpGIa8Ypms=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=uVakzpUH7oI2bmftFybba2H2Pa9QRcEBpc07rf2rp1jwVeK1ldRxMjIbY/3V5akJP+en1LIdhugNlH4jZWIczL1ZB2IwattjEgYOmA0ho2JdmuOi8jMLTC7qchwGx65YuO1PKxwgo8LkxwcbICRkTIJImRP6YGapKG8lRMsadQc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=olv01epP; arc=none smtp.client-ip=209.85.160.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="olv01epP"
Received: by mail-qt1-f171.google.com with SMTP id d75a77b69052e-4774611d40bso858811cf.0
        for <linux-kernel@vger.kernel.org>; Tue, 20 May 2025 08:20:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1747754450; x=1748359250; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=v3MrdtSTY4wKglagIHVXNzkkUsqfR79ur5B+p/qdTJ0=;
        b=olv01epP4KV+VZuhiegQEiefmmFPEQZ+QVZcTclm96P6UvId5mTFsF/9ld4sXIiZ7e
         RvrDCfSWy1JKVA4vwnPW9sRhSEZ02hJAn/hc1eyciiYWh9u3BZAMKysfrK8UjJazkwW1
         1dd3MVPn+Uz8WdyzvUCJIku+QKXv0dsVcQF85fq8WxjNCd/DmJRb4JTpec7fDgyxD9wF
         zLMs9eiJVMUf7vloTG1+RwnMUCEBQOUkY5yhV92/masSMUnmImF2cqP39cjN9romlNJx
         gPUss3SGTGzmlevy5BQe7nvxvILhGybRrJSToxB21okZFUCcBTKylvvgrHCnZQ8Q4atA
         niYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747754450; x=1748359250;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=v3MrdtSTY4wKglagIHVXNzkkUsqfR79ur5B+p/qdTJ0=;
        b=vCBAL0joXCPYQxroweDMe0xvrD37hs0q3VZ8dMJrgCaG+yAJNfZQINJInzdtCJ4Jtj
         45H+LXZpmHgIYj5K8QtSZ+1fDmuPVsdnxHL/M/gdERiRuSnQsGVrs+8/LlMxiXUlB3Xy
         UzL6osA7QmJMTJaOCVTgCl/RhZWt8EsumidcEB46CZ0S/iRmzuy6izR2KKm8S4r7xmLC
         YPrIE/zbUiNxbwvKZKO/VYSAx57QLgnWRO+t7/nQz3Gnu4frCTvZseHYSRmhHqIph/KC
         dSPh21zuc85qbJLz6QcSC1taIPGvM97Mu2Kr6lASNELjsbLDR/bl0xUa+UQiE2B/xy/e
         kW7A==
X-Forwarded-Encrypted: i=1; AJvYcCWyD1mPKeBjm8m1GQJuGBszHE2otIr+5i+vbsKzl9Edlk+dPyU6JXgt5Ylnr8keL+4nvl9xXFQsPDk+QtY=@vger.kernel.org
X-Gm-Message-State: AOJu0YwPNwXxius5uuXka4WS+j6fMi40n/LFOT6l/mx2ATMK1zAWovl8
	+8n6L1gvWvwB1UOP9eobprTjh4G/6jrRKimx59ZqKqshC4P1fAN9L+fhgCod6TolpinwoB9Xt/I
	8D5ql+MT7JMSkYN118qbeN/faBcm0NzyeX4Zv++FnFbj/Y7fpD7m/RDMARlM=
X-Gm-Gg: ASbGncurQXwe2I4ERa3b4EWtPDyy+ZhlMb4ebKHhHKJn3uPRdTQIlTsXdL4wtT8ef4w
	jZ9TMT0Ik8PgEWAFdadXIgVLnigjiH2HCaiHhz+I095sQ+ORMK7C8b2gc3Zptd9wXjGQQCQG3OX
	wS+8GYewxUyyXLutuT98XdjLJeLXsLeex2RL7exiKO84cjGO7wpUjF6U44zfMPG57fFiG3NQI0a
	1scmPKXF2w=
X-Google-Smtp-Source: AGHT+IF7oSHLctYVPC6f6D7Wt3pmznOFYfEJFyea3DIJ5UOsx7qH8Nkpb8EezW5dKVDCCU5Ue2Kat1rkfVWfxpFZ5Jo=
X-Received: by 2002:ac8:57d6:0:b0:471:f34d:1d83 with SMTP id
 d75a77b69052e-49600b8a5eamr11172951cf.7.1747754449801; Tue, 20 May 2025
 08:20:49 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250520122547.1317050-1-usamaarif642@gmail.com>
 <3divtzm4iapcxwbzxlmfmg3gus75n3rqh43vkjnog456jm2k34@f3rpzvcfk3p6>
 <6d015d91-e74c-48b3-8bc3-480980a74f9b@gmail.com> <b696e3c2-3d96-4729-9e07-87bb644f145b@gmail.com>
In-Reply-To: <b696e3c2-3d96-4729-9e07-87bb644f145b@gmail.com>
From: Suren Baghdasaryan <surenb@google.com>
Date: Tue, 20 May 2025 08:20:38 -0700
X-Gm-Features: AX0GCFv793lIfMLoXYJzZEQOhHK703DUxeFSvODGjDn1KjZgtwC7v1s2Xb3hFKI
Message-ID: <CAJuCfpEL__bRSbVWATs0qbNF3E2ZS_n7banhRxU01FFT2aTPAQ@mail.gmail.com>
Subject: Re: [PATCH 1/2] mm: slub: allocate slab object extensions non-contiguously
To: Usama Arif <usamaarif642@gmail.com>
Cc: Kent Overstreet <kent.overstreet@linux.dev>, Andrew Morton <akpm@linux-foundation.org>, 
	hannes@cmpxchg.org, shakeel.butt@linux.dev, vlad.wing@gmail.com, 
	linux-mm@kvack.org, linux-kernel@vger.kernel.org, kernel-team@meta.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, May 20, 2025 at 7:13=E2=80=AFAM Usama Arif <usamaarif642@gmail.com>=
 wrote:
>
>
>
> On 20/05/2025 14:46, Usama Arif wrote:
> >
> >
> > On 20/05/2025 14:44, Kent Overstreet wrote:
> >> On Tue, May 20, 2025 at 01:25:46PM +0100, Usama Arif wrote:
> >>> When memory allocation profiling is running on memory bound services,
> >>> allocations greater than order 0 for slab object extensions can fail,
> >>> for e.g. zs_handle zswap slab which will be 512 objsperslab x 16 byte=
s
> >>> per slabobj_ext (order 1 allocation). Use kvcalloc to improve chances
> >>> of the allocation being successful.
> >>>
> >>> Signed-off-by: Usama Arif <usamaarif642@gmail.com>
> >>> Reported-by: Vlad Poenaru <vlad.wing@gmail.com>
> >>> Closes: https://lore.kernel.org/all/17fab2d6-5a74-4573-bcc3-b75951508=
f0a@gmail.com/
> >>> ---
> >>>  mm/slub.c | 2 +-
> >>>  1 file changed, 1 insertion(+), 1 deletion(-)
> >>>
> >>> diff --git a/mm/slub.c b/mm/slub.c
> >>> index dc9e729e1d26..bf43c403ead2 100644
> >>> --- a/mm/slub.c
> >>> +++ b/mm/slub.c
> >>> @@ -1989,7 +1989,7 @@ int alloc_slab_obj_exts(struct slab *slab, stru=
ct kmem_cache *s,
> >>>     gfp &=3D ~OBJCGS_CLEAR_MASK;
> >>>     /* Prevent recursive extension vector allocation */
> >>>     gfp |=3D __GFP_NO_OBJ_EXT;
> >>> -   vec =3D kcalloc_node(objects, sizeof(struct slabobj_ext), gfp,
> >>> +   vec =3D kvcalloc_node(objects, sizeof(struct slabobj_ext), gfp,
> >>>                        slab_nid(slab));
> >>
> >> And what's the latency going to be on a vmalloc() allocation when we'r=
e
> >> low on memory?
> >
> > Would it not be better to get the allocation slighly slower than to not=
 get
> > it at all?
>
> Also a majority of them are less than 1 page. kvmalloc of less than 1 pag=
e
> falls back to kmalloc. So vmalloc will only be on those greater than 1 pa=
ge
> size, which are in the minority (for e.g. zs_handle, request_sock_subflow=
_v6,
> request_sock_subflow_v4...).

Not just the majority. For all of these kvmalloc allocations kmalloc
will be tried first and vmalloc will be used only if the former
failed: https://elixir.bootlin.com/linux/v6.14.7/source/mm/util.c#L665
That's why I think this should not regress normal case when slab has
enough space to satisfy the allocation.

Received: from mail-qt1-f177.google.com (mail-qt1-f177.google.com [209.85.160.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 25FC11B0F0A
	for <linux-kernel@vger.kernel.org>; Tue,  6 May 2025 23:09:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746572947; cv=none; b=OUJigoTrhMOWopywnN+eVz0uFrBCht0gLViwN1i7vEQnWARrh3POmlnD48KsAz4n36k/Jf+yYm+IZ9rwOWoqWMuh4h/0mmHnJ0A3C3mmW+VmGpQTFYsbXy2BOeoEigwj3IOUlwvbop/8jK4Tjw3iRa8zRKnClTqadqpbMno2Vhs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746572947; c=relaxed/simple;
	bh=NnlHqvKr4hlcoyMcoWZpneIE1UpjuOs+diHL6G9mIkU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=uMVLTxuKm1oUcOftRanIjgWp+ssZni4zAg+qqWP4hlBWn/A/TotJEdZga13JYiMi9u0sFaY93Q2o8NdDkZD8cRHW6k/EPwbzg+ucI0iYUGYQOy2V4RoWlAqk2xj2feYgyUTDg5bvUVxgyMC9GZF6MOZA3gsfcp1HpWAVcLiU4ik=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=lJSOm4T/; arc=none smtp.client-ip=209.85.160.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="lJSOm4T/"
Received: by mail-qt1-f177.google.com with SMTP id d75a77b69052e-47666573242so137391cf.0
        for <linux-kernel@vger.kernel.org>; Tue, 06 May 2025 16:09:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1746572945; x=1747177745; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xxPItkCULhLXAPQ5iFgOw4QtWWEZjchNSaY2C2ePnb0=;
        b=lJSOm4T/S2hoxFpUuGmwpHf5OubHnH8LrMpoHBjEunTgyzeY0uylNH1qJ9Fw0z6yqc
         OwpnXFxkQ3IyB/ZzQmt9RmfFCjEbKOxgF9mtapYNzwaj+P56Eix6quOYQ8LdSP+dU+dn
         ZbWN5R/5S05PEIvXcJwcJWm24CVUc+TlaX7XQCfHB0dwutIUnxEl7tp2LfbkObi2MqtL
         RZksGwuDqgBwqRQbznzh3OLhivamDWclz8qWWR4Texsye/SO8amLDA2RSGuu/TnfzOIi
         caGHscwEK43E+jcmNF8zBBAOLkLZsLCQnB9FL1nj57dNqGHlkZgNCmM5+unYS1dcU73y
         bF7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746572945; x=1747177745;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=xxPItkCULhLXAPQ5iFgOw4QtWWEZjchNSaY2C2ePnb0=;
        b=i2DkrYnShhe5PqxyM2Fol9XfkeEyDl21XfGEWcmGSWNzuZB1H+oBprLSxuljI0eTJD
         TF0uZ+X0pyNVHPCf2PJ/ZlG8q4ruydzlEzxDnmfgjD6ZeaTFBTf1c3+W7YRhQqyLLpsx
         MNipPiGPveCbPpGCTGcC+duQnWeJ98phC/8g/3iW585AxBkXGX8qya1Pb51kW9q8vTh3
         w272YtmhJCrAN9uVt6QwbYJop7pWRV3LSTSRqKUfC6JIddZbI332ZOyWaDeNY/G9ItKb
         CPJotCns5MDsAxxyikiptUluKNLCTQh5Gx+F8IgivSo/r+GpbLQCUHeLDZonvv4KarW9
         DAzQ==
X-Forwarded-Encrypted: i=1; AJvYcCX7qMLPq2u+K7pSszdPnkLW3aR2V5URdaQbkiYKsl7hNIbcYBG6Wkhfj0fA+nfsLqCRJE0Do5SyfJz9r7I=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy3b7al0gJ8vVJhKox0vLIqgjbyfyiH/QqwxYthFx8b05t002a0
	wIykbhrZLRSiyPQLpYG61ZkzDcZMZ18Ez+XyLl8dCGY4RSorl3Glo8+kAdVUbAk569t6z+bwXA+
	899bLMbM8MGEJBkd2L96jLXzggT+JXSDkjqyL
X-Gm-Gg: ASbGncvKYLCfRdYRSNIZuPJOfoQAk6r2zHfNpcE3ehuF8FKmSoYSnzk1b4UKa1lpPuu
	d/1UpM3ek7fLsLuqWe35OGGBC5TeP61uWELFEGSBSoAczdEf2YYwF6qTfmneAdNnI4eHz1qheo2
	8gq8raVRCc3ishOxxbnV0OCdMVSyESifTacVuuUJ8wWdE+rq5AziQ=
X-Google-Smtp-Source: AGHT+IGP1isC8oGxnqcL1S764BVjRtAKN+0MlbSwBIXweFCE5/InZg+eVfljqLAlWEUBwkWKH7bKVHqwKGbzUX4QRSA=
X-Received: by 2002:a05:622a:30f:b0:47d:cdd2:8290 with SMTP id
 d75a77b69052e-4924b4adbd5mr568191cf.9.1746572944750; Tue, 06 May 2025
 16:09:04 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250425-slub-percpu-caches-v4-0-8a636982b4a4@suse.cz> <20250425-slub-percpu-caches-v4-8-8a636982b4a4@suse.cz>
In-Reply-To: <20250425-slub-percpu-caches-v4-8-8a636982b4a4@suse.cz>
From: Suren Baghdasaryan <surenb@google.com>
Date: Tue, 6 May 2025 16:08:53 -0700
X-Gm-Features: ATxdqUHjQpg8Q7ppTF_3V6gxLs9-FA4gl9o9yxrLe_TG-If4XLsn7u0YsMefSnQ
Message-ID: <CAJuCfpH5omB4CUJEvT=GzKmj3bYn=1zSGXZckbY8Bon8UbbdZg@mail.gmail.com>
Subject: Re: [PATCH v4 8/9] mm, vma: use percpu sheaves for vm_area_struct cache
To: Vlastimil Babka <vbabka@suse.cz>
Cc: "Liam R. Howlett" <Liam.Howlett@oracle.com>, Christoph Lameter <cl@linux.com>, 
	David Rientjes <rientjes@google.com>, Roman Gushchin <roman.gushchin@linux.dev>, 
	Harry Yoo <harry.yoo@oracle.com>, Uladzislau Rezki <urezki@gmail.com>, linux-mm@kvack.org, 
	linux-kernel@vger.kernel.org, rcu@vger.kernel.org, 
	maple-tree@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Apr 25, 2025 at 1:28=E2=80=AFAM Vlastimil Babka <vbabka@suse.cz> wr=
ote:
>
> Create the vm_area_struct cache with percpu sheaves of size 32 to
> improve its performance.
>
> Signed-off-by: Vlastimil Babka <vbabka@suse.cz>

I think Lorenzo's refactoring moved this code out of fork.c, so it
will have to be adjusted.

Reviewed-by: Suren Baghdasaryan <surenb@google.com>

> ---
>  kernel/fork.c | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/kernel/fork.c b/kernel/fork.c
> index c4b26cd8998b8e7b2b516e0bb0b1d4676ff644dc..3bd711f0798c88aee04bc30ff=
21fc4ca2b66201a 100644
> --- a/kernel/fork.c
> +++ b/kernel/fork.c
> @@ -3216,6 +3216,7 @@ void __init proc_caches_init(void)
>         struct kmem_cache_args args =3D {
>                 .use_freeptr_offset =3D true,
>                 .freeptr_offset =3D offsetof(struct vm_area_struct, vm_fr=
eeptr),
> +               .sheaf_capacity =3D 32,
>         };
>
>         sighand_cachep =3D kmem_cache_create("sighand_cache",
>
> --
> 2.49.0
>

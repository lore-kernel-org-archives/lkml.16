Received: from mail-ej1-f50.google.com (mail-ej1-f50.google.com [209.85.218.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BAE512E11CA;
	Fri, 13 Jun 2025 16:02:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749830558; cv=none; b=OlzMcxuLjd0eNgEN3Sv0lm5LAtrjAIp1srueWcyh/nxptzVH6blJJJQzcbG+F14oYcXS10T23g/jlD5OtG2ysPgpwEVkkxIZRe/AiKZqbaaidoI8kSb+SGPkN1zRvbJ1H5ye5vKeZGvGrrIoykKU/fkbKIwOI0m1POxwM2bJvls=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749830558; c=relaxed/simple;
	bh=ZebeOwLSI23Kxel4xf6Al1F6s45Vl8wyBG0DVFwGFV0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=aP5yvMJt0825l8j9gMrOOXvwNm9MQWichzoaImttM/un2/NWPIG7fPaqrKaRUI0P5kfO2SY5C2Q3mGn/vFp+YCNZzWp8kkq1ZWE6upkZ9kwIXXE0qDzwnif8a9Z/4PhV9m1f28mqOTLkv1YaxBJPH2wrgHxo+/qG2GjyEHiql8Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=VZpwwqWD; arc=none smtp.client-ip=209.85.218.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="VZpwwqWD"
Received: by mail-ej1-f50.google.com with SMTP id a640c23a62f3a-ad574992fcaso353455266b.1;
        Fri, 13 Jun 2025 09:02:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1749830554; x=1750435354; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=EolkFjwa32486SxkHimT0PoLXhvW13QswRm2sB8b3Go=;
        b=VZpwwqWDDZwQcPJ40EZSgb02RtUBfJgph/9FKU8NXjNsUYKAYWfzny4v7KON72Ei5J
         Xf6hut/dcJoLlvyJiOekOBV79fbeOSDJpv/tJQ4O5BW24zcjHN4DZCDF+7x1DBiQbjXv
         qI57cBd6iPZFQwP2sLhpxaaD4K1+Fl7Vz9pPgKJmyAnArkKRcl1UH0jMZ5IO1iQBPnRj
         OWA4t746IvvWDMAks+09wkQv6m9Up2DRU7eyVFJ8cN7iqN2fYBqxNJeuRqrmmu9qKJfv
         SrhYau48X6RoTTWrx3ho2xL4o+FVQoir6ZSTznb88xJPZO3979aeeyttXYHZUq+1Zzsk
         Oq5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749830554; x=1750435354;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=EolkFjwa32486SxkHimT0PoLXhvW13QswRm2sB8b3Go=;
        b=KnUtpU6LPprWTovSHkCiDT/yU/QiTN/fhdbQZ8F6dSeN1IzyCEZXIeZGIu+cGeqDBM
         GbnM6vuiSr06zy3qkjB+uGobNThYogqxebRKpMvNDnAkPDF9CicyWWs42/t5YijiHvVY
         fRqdwPK28NJZ7YOY3P/lFENNgZcNWsx+yqgYuCFPRf9gnR2vO7RT7U2vtUzOGu1cgc28
         dHsGZhik6zjCMIp3w0mI6eCIRBA+ezeV6WJIqagoFfwhoIvI+wcKX5rdkrS9K+PreCB/
         pNHQPIpySHHMdhlw6k3+TXnxN+xPKEwu+/ygHXnvZoSPxPJhE3cv2s/ykRujMyIdwwnX
         8psQ==
X-Forwarded-Encrypted: i=1; AJvYcCUe8K1PhWD2Z3Pby2w9Dx/F6tbJcFswXkuLgv+mr0ZabQ5N1PEYJYTWbq6Y0mbS86Sb1F1nISWaFiDbmR+x@vger.kernel.org, AJvYcCWTtkFqYLpuoONn9KvB6PCGN4OO3NuOvSox2MOhwXZIxYcTkgFWXaHjTd/lcDoUnlB7Mom5sSTD0JU=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx9T43DwrIuB1DfuU9SOO8dF5xMhntq+y5CNlWoxmbZVgYtVzEo
	ph3LAaDIj7ZcEVz28N/a/PQw0xRghifLMaYSae0u3MQE4OhFdkAQILS2kYKcyZ9DKafei8rMcY4
	dDVBou1phq8mceJqF6xPzUac1EgV2YUE=
X-Gm-Gg: ASbGncuaT2hQEDtD9f9dg+iDRSfaYWMVmDeX4HLg6utT26QaJuueZFX3jBumIOvGtd+
	UHHSKwattL8ew/7TmzDDP1HOcTfpBw/91jB+w6fxDlauRGKVyAV+8KaiTOCy3/XdU6COzt0IxiV
	cepYn/WL1/AvEmlZGjbVsB00wiXK8TVf7woSFP12XdIG+5PTNlKEeluaeiBd9b9FAUxjh9L/pRi
	wCQ
X-Google-Smtp-Source: AGHT+IGAK5cy8SvdVQyZPmEOukEmvVLoi77USHaZ8HE50a/XPUDwRV2/XI+o9a9sjbYnuvbGDNhT0rm/lrJAt/GFfdM=
X-Received: by 2002:a17:907:3f1a:b0:ad8:9b5d:2c38 with SMTP id
 a640c23a62f3a-adec5564a1cmr383361866b.26.1749830552242; Fri, 13 Jun 2025
 09:02:32 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250612234942.3612-1-sj@kernel.org> <875xh0747l.fsf@DESKTOP-5N7EMDA>
In-Reply-To: <875xh0747l.fsf@DESKTOP-5N7EMDA>
From: Bijan Tabatabai <bijan311@gmail.com>
Date: Fri, 13 Jun 2025 11:02:20 -0500
X-Gm-Features: AX0GCFteGyv6q1eNkeTKJgzYqopZRdUgq7cFJrBGrNlx7JkrByQHyxHa2nxi6bU
Message-ID: <CAMvvPS6EncxZsHvWpOvAdHxDWvYCcL+XYx7Sj8ekfVDqxmZSVQ@mail.gmail.com>
Subject: Re: [RFC PATCH 0/4] mm/damon: Add DAMOS action to interleave data
 across nodes
To: "Huang, Ying" <ying.huang@linux.alibaba.com>
Cc: SeongJae Park <sj@kernel.org>, linux-mm@kvack.org, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, akpm@linux-foundation.org, corbet@lwn.net, 
	david@redhat.com, ziy@nvidia.com, matthew.brost@intel.com, 
	joshua.hahnjy@gmail.com, rakie.kim@sk.com, byungchul@sk.com, 
	gourry@gourry.net, apopple@nvidia.com, bijantabatab@micron.com, 
	venkataravis@micron.com, emirakhur@micron.com, ajayjoshi@micron.com, 
	vtavarespetr@micron.com, damon@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Jun 12, 2025 at 9:42=E2=80=AFPM Huang, Ying
<ying.huang@linux.alibaba.com> wrote:
>
> SeongJae Park <sj@kernel.org> writes:
>
> > Hi Bijan,
> >
> > On Thu, 12 Jun 2025 13:13:26 -0500 Bijan Tabatabai <bijan311@gmail.com>=
 wrote:
> >
> >> From: Bijan Tabatabai <bijantabatab@micron.com>
> >>
> >> A recent patch set automatically set the interleave weight for each no=
de
> >> according to the node's maximum bandwidth [1]. In another thread, the =
patch
> >> set's author, Joshua Hahn, wondered if/how these weights should be cha=
nged
> >> if the bandwidth utilization of the system changes [2].
> >
> > Thank you for sharing the background.  I do agree it is an important qu=
estion.
> >
> >>
> >> This patch set adds the mechanism for dynamically changing how applica=
tion
> >> data is interleaved across nodes while leaving the policy of what the
> >> interleave weights should be to userspace. It does this by adding a ne=
w
> >> DAMOS action: DAMOS_INTERLEAVE. We implement DAMOS_INTERLEAVE with bot=
h
> >> paddr and vaddr operations sets. Using the paddr version is useful for
> >> managing page placement globally. Using the vaddr version limits track=
ing
> >> to one process per kdamond instance, but the va based tracking better
> >> captures spacial locality.
> >>
> >> DAMOS_INTERLEAVE interleaves pages within a region across nodes using =
the
> >> interleave weights at /sys/kernel/mm/mempolicy/weighted_interleave/nod=
e<N>
> >> and the page placement algorithm in weighted_interleave_nid via
> >> policy_nodemask.
> >
> > So, what DAMOS_INTERLEAVE will do is, migrating pages of a given DAMON =
region
> > into multiple nodes, following interleaving weights, right?
Hi Ying,

> Hi, Bijan,
>
> It's hard for me to understand what you want to do in your original
> patch description.  SeongJae's description is helpful.  So, can you add
> more description in the future version?

Yes, sorry about that. I added more detail in my reply to SeongJae and
will include more detail in the cover letter of the next revision.

> So, you will migrate allocated pages to follow new weight?

Yes

> How to interact with the weight specified by users explicitly?  Usually w=
e will
> respect explicit user policy.

I am not entirely sure I understand the question completely, but I
will try to answer
the best I can.

We interact with the user provided weights through the policy_nodemask func=
tion,
which gives us the node id a page should be on. This patch only reads the u=
ser
provided weights and migrates pages to be consistent with new weights provi=
ded
by the user, so I believe these changes do respect the explicit user
policy. Please let
me know if you disagree.

Thanks for the review,
Bijan

P.S. Sorry for sending this twice - I accidentally replied instead of
replied all.

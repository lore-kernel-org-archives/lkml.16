Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 26501136E
	for <linux-kernel@vger.kernel.org>; Mon, 26 May 2025 00:12:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748218323; cv=none; b=bPT6JiBy1UZJ15SUpu+xjNFZ+dyTTVjCeNf9MdYZgIByMpjViIM3WL0prIdKD3+3oHizfNe5eqPakm7PWHs9/i2sfkw7NyLKQ+tSZHI+zorJyFm1NBc5I6R1+/RXVY1ZK44raKypByMu7GVSSB1j7zxVtu2gHr8pJ41o0HilBag=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748218323; c=relaxed/simple;
	bh=mZawqeNCtV5RIiwM8QEaWmEbfpt929UpPSKQmlEeQ0w=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=NBd22klZZMJjk9wKGhAX0d/SyVU5D5N5C+k1sG0TaEY3VOUSSOIyFA0N4L4/uBsZGHadGl8thvTjXbCB5Tr0ByFakv3Hw9wPukAN4uFIo0guTbtWLYT3Rd3+SAe32na72ND68SWwMp4PvBpc4KDDFN/5Y63tUE0MWXzG9zjUlIE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=eFxnMc9n; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="eFxnMc9n"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1748218320;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=YnEQ3B0+tF9saGwjZYy8KszduZXiKUGwKSNDFaV3AFA=;
	b=eFxnMc9nEskDZVp7E+NNoRFkTETTx6QBhj/stWU0o0LNKaZsf/4tKF4BSWDqHJEubESzGN
	P2evMlfwor70EUgZSOY2wNXnd6T2UzSf1WRBsqQKo7OvB0GPXEE1Zzj+rNgjk//ekQB8qc
	pl9ie11BE90EBqGFBu24SCLPi/mWMGg=
Received: from mail-lj1-f200.google.com (mail-lj1-f200.google.com
 [209.85.208.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-120-Jukt4NicPbypdSUz4rfEUA-1; Sun, 25 May 2025 20:11:56 -0400
X-MC-Unique: Jukt4NicPbypdSUz4rfEUA-1
X-Mimecast-MFC-AGG-ID: Jukt4NicPbypdSUz4rfEUA_1748218315
Received: by mail-lj1-f200.google.com with SMTP id 38308e7fff4ca-326ad1825c1so6203321fa.1
        for <linux-kernel@vger.kernel.org>; Sun, 25 May 2025 17:11:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748218315; x=1748823115;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=YnEQ3B0+tF9saGwjZYy8KszduZXiKUGwKSNDFaV3AFA=;
        b=Qt9iQuewfwr2JscQ/OcJQuKad01+ggaIGHdy4F1lb5USDMedYZmDvftZM1OHsIgR2x
         bNeRhikTJyuD9uD3MbLFrxAcNdighLz90fsRAspmi68K1BpqGmdhCIBao3Q97phb2XKU
         NwFNOTFACqcUQqYsxiV98H3wEn3qMTZFVD568BfabC8YGRlLr2tIZTSv34+5EAXvE9ig
         KDxcoJAt/lRB6APZGSTgkdTqxrmTuAGQWAzQmtW32Wyf4Sd5C9P+x8j2IEpP7tlTsmF6
         g3tGmkXhhiJs1gSWb7pBo0qvc3Ek5SIr3G9ac3NucMaYyYJOlrbpMpeZ5/UVCPmhpLCc
         IiLQ==
X-Forwarded-Encrypted: i=1; AJvYcCXF2Yt9ET3YPqeDoiDj5fQMGu3hkAZLgoIpXW83KQAMbwKF4lQcVHOAims/E0NagraH2RYydNihUhh0ASA=@vger.kernel.org
X-Gm-Message-State: AOJu0YxTS1AORDGB/s25Lhav4uupSCEf5SvzMnsF60Hk27M93QVhDaMq
	r2dAJBvsogQCW1H2zTcrgCIoE9Ngh8wYnfKtZQ4wCm3iI4f98tz60qlrO2JF8LOe6UBwode9gvw
	pX/TMjmKNejE7e/OlDpZ+cw7MoDyKVL69+r2I4IZhDZyfajIS0s8ZmW453TGCOclggfPx0rFroh
	x23iibd8FqTnOCD2+CieGnBqKBK2MUt4Z9a6ISOu4X
X-Gm-Gg: ASbGncuqb6sDPyid7hAZgdplSVvZv3/+lv54wkMCg9LG8VOWK2Nq+Gn2nXCxDU/37dK
	HCpsZFDJdNxEYgzxBe3yILEoc2xqn2RQ0RPsX77Ktv4hZpBF8daqAasM0Zofg4+D48tBwyNag8t
	gc21K60wI1AUcpzFyBG6Ya5GIu8eo=
X-Received: by 2002:a05:651c:305c:b0:30b:9813:b011 with SMTP id 38308e7fff4ca-3295ba594abmr11293941fa.28.1748218314938;
        Sun, 25 May 2025 17:11:54 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGxSzrANjGZO695pzuEQ2v9B+qoSVMdjfmIKV1W9Kge1MLAjgpFVyrOHqu+lJwacTKEzp6ex38r98Sy7KHAdo8=
X-Received: by 2002:a05:651c:305c:b0:30b:9813:b011 with SMTP id
 38308e7fff4ca-3295ba594abmr11293911fa.28.1748218314504; Sun, 25 May 2025
 17:11:54 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250522052453.GA42746@system.software.com>
In-Reply-To: <20250522052453.GA42746@system.software.com>
From: Alexander Aring <aahringo@redhat.com>
Date: Sun, 25 May 2025 20:11:43 -0400
X-Gm-Features: AX0GCFv7v9Pg2Kx0t6ojR2Iku4i4QqGsQeOK7H63LAvoObcpfkGL-rils5Ws1JI
Message-ID: <CAK-6q+iiXFh+XhBfghaP6C_+89GnbAzYAfVnm66joA3YTMCJng@mail.gmail.com>
Subject: Re: [RFC] DEPT(DEPendency Tracker) with DLM(Distributed Lock Manager)
To: Byungchul Park <byungchul@sk.com>
Cc: kernel_team@skhynix.com, linux-kernel@vger.kernel.org, 
	gfs2 <gfs2@lists.linux.dev>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Byungchul,

On Thu, May 22, 2025 at 1:40=E2=80=AFAM Byungchul Park <byungchul@sk.com> w=
rote:
>
> Hi Alexander,
>
> We briefly talked about dept with DLM in an external channel.  However,
> it'd be great to discuss what to aim and how to make it in more detail,
> in this mailing list.
>
> It's worth noting that dept doesn't track dependencies beyond different
> contexts to avoid adding false dependencies by any chance, which means
> though dept checks the dependency sanity *globally*, when it comes to
> creating dependencies, it happens only within e.g. each single system
> call context, each single irq context, each worker context, and so on,
> with its unique context id assigned to each independent context.
>
> In order for dept to work on DLM, we need a way to assign a unique
> context id to each interesting context in DLM's point of view, and let
> dept know the id.  Once making it done, I think dept can work on DLM
> perfectly.
>
> Thoughts or any concern?

I think the unique context would be the "lock resource". The lock
resource is a unique byte array and is the unique cluster wide lock
context. It is the parameter name of "dlm_lock()" [0].
We don't have a unique id for it, but I guess this can be somehow created.

The locking context in DLM is per node, we don't do everything
locally. It does have a locking protocol over the network and works
with lock masters. A lock master is a unique node in the network to be
chosen to do all lock operations on. To maintain/create a unique lock
id context is I think more difficult when using real networking and
several nodes in a network, although I also think that DEPT is not
capable of running in such a distributed environment right now.

However a RFC patch series [2] is pending to add support for
net-namespace functionality so everything can be "simulated" on one
Linux kernel instance with several net-namespaces as per node
separation. With such functionality DEPT can be used to find deadlocks
in DLM applications. A unique lock context id for the resource name
can be easily created as we know everything about the network in a
local environment.
This is just the proof of concept, how it works in a real distributed
system would be another question...

[0] https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree=
/fs/dlm/lock.c?h=3Dv6.15-rc7#n3372
[1] https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree=
/fs/dlm/lock.c?h=3Dv6.15-rc7#n694
[2] https://lore.kernel.org/gfs2/20240930201358.2638665-1-aahringo@redhat.c=
om/


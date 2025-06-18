Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 545D916B3B7
	for <linux-kernel@vger.kernel.org>; Wed, 18 Jun 2025 19:49:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750276185; cv=none; b=UcsA7kIRO9xeCHJpLASSGAHvr+2EV5ijp/FyU/xmlIAMQEW/BkG5AXpziMGGTLWbU63fnkm48KtmZcqJ0VgrFsm6hzueM+yu7oORuhUru5trXa6GeeT/tF96voTWfsrEHUbrdYvOQ16LOyom2CT8bn9hwS6hDRqeRLb2ZCJ7bj8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750276185; c=relaxed/simple;
	bh=MG1pEIZLmGVhX4VT57wG9IpwU1gyZSURLd0jfdhuuXI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=BGqfeLm0ccix65GPMy1+9nafl8q0YDKYi/HdM8jdS3sSx393PQwANERI+e4PJGdE1xtp4//MYZ54xzSl8vQWl1Ia6iUaLTzI7+G6KduGGJP78u3RIKZ/hPADki5a1Ua/n6Efc++WqGTcXFbPNaM8W9ywW/RaNTRWCVwc1O+4iFQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=U7iBH5bH; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="U7iBH5bH"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1750276183;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=spMAP0vJug7Oj/wf3ph2/rHFlk61+cha0KAqJSwmXxE=;
	b=U7iBH5bH5vY/Goj5AVPbU3L85Wgow7+8fLtEYisdtoxYKWX6TwzpsTnSRJKTV5BTZai3it
	4zwNC6XMh+RdWaCuGZQYYIWP1AFzFXo4IVKe8NkvOYL9WNZXnDhtgXRPh0xVTJuy9MZ+d7
	04D9QYE3c0rw2AsWVWVbkcRC52LJPf0=
Received: from mail-ej1-f72.google.com (mail-ej1-f72.google.com
 [209.85.218.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-641-Ep_KKXBMOWe8ywgk4FlvIw-1; Wed, 18 Jun 2025 15:49:41 -0400
X-MC-Unique: Ep_KKXBMOWe8ywgk4FlvIw-1
X-Mimecast-MFC-AGG-ID: Ep_KKXBMOWe8ywgk4FlvIw_1750276180
Received: by mail-ej1-f72.google.com with SMTP id a640c23a62f3a-ade57fec429so603527866b.3
        for <linux-kernel@vger.kernel.org>; Wed, 18 Jun 2025 12:49:41 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750276180; x=1750880980;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=spMAP0vJug7Oj/wf3ph2/rHFlk61+cha0KAqJSwmXxE=;
        b=HFzTOulQsKMbVnlP6GKxYy+FomD3igm8KEWMF8K6U66U/ujK2H7RPEEHPDt3d5sjqe
         JvZramg4OD1WQjKgbGo8rwbIJinIM/FAUHQ3dVVHkiz3okem/RKKFSDET6X5htMM+nIb
         I6a3CHJZ+7Qr0VqKo5FkFkbOe9w34ATomZC12TSPiDFF7jAVGr1ztq9ln9VjbL0SZOpP
         VMiWcLjyV9UNZabGdD7N2ADG0ayhSTV9xQreehVem48srfh9h5jLv74eBH5FnvcQIECW
         OMj/cArfTCo8A/Euj/fh3SC1nBPWd4s0mOvZZOGAVxm4u3/OFByVFg0o74/ESg/oIAP4
         YR8w==
X-Gm-Message-State: AOJu0YxZxoQ7CaOjumNWyFJJUjfl47MCretqqMPb29nZXZAlsjZgQcmT
	D0Vx1rhqhOageeH0H8Axp5vgf3voufWD098AjNlFYTgliJJiQRr7f3Dko236/Rh84tKPxX71Hxx
	2jT+PFlDz+iWreNsGRjvS1pLdVB8tYW1I9+a08tk2Ms59EXrdkBuQMhogkl5LypXKjf0rPfGJh4
	GIA4BgEkXpH4+uGVhVfLuHSs+C1HYj19z3Cjsltuj7rbnMDLOo
X-Gm-Gg: ASbGncsRQE+kR9t4SogNAr+ibZfM724ILSa2nx/J1ppECa0Odsenfr4Nb4QTuwM9lui
	rNaQ9SFlnVd4dT9BPwx+DN+plk1PPuwjcYb8uUmnj+ahWf8DzUMHsA6EhmXl+iLyYcPn3udE+vI
	fAWdFKt5olIwjdE7yoqkvFQEF4dKFvkHv6Rhg=
X-Received: by 2002:a17:906:f5a3:b0:ad8:ae51:d16 with SMTP id a640c23a62f3a-adfad53058cmr1775199166b.55.1750276179697;
        Wed, 18 Jun 2025 12:49:39 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IE/MVgLO4a+Nz9lfefxp1CGaIdNf865jsdT3qKLWeEb4hjkyrz4NU5h42NVrxZ+cgkQEiHFwb6yFl1DMvIU4Ts=
X-Received: by 2002:a17:906:f5a3:b0:ad8:ae51:d16 with SMTP id
 a640c23a62f3a-adfad53058cmr1775197166b.55.1750276179375; Wed, 18 Jun 2025
 12:49:39 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250530200305.85319-2-jsavitz@redhat.com> <CAL1p7m53yJ-dpg6L2QVQM7bshWYXAxOJjrVGdTG8cDMEhNogyA@mail.gmail.com>
In-Reply-To: <CAL1p7m53yJ-dpg6L2QVQM7bshWYXAxOJjrVGdTG8cDMEhNogyA@mail.gmail.com>
From: Joel Savitz <jsavitz@redhat.com>
Date: Wed, 18 Jun 2025 15:49:23 -0400
X-Gm-Features: Ac12FXzZG0suvYwB77Q9iyOL1hEoyEas5QD2fssP_UudYEoiXGGaWp_m6usGh1M
Message-ID: <CAL1p7m4bK1LA6Atc4P0h_wC1Kb47Vzb93C8tmJtMiEBDLy6yzA@mail.gmail.com>
Subject: Re: [PATCH 0/3] kernel/nsproxy: Minor nsproxy code simplification
To: linux-kernel@vger.kernel.org
Cc: Christian Brauner <brauner@kernel.org>, Al Viro <viro@zeniv.linux.org.uk>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Jun 9, 2025 at 10:23=E2=80=AFAM Joel Savitz <jsavitz@redhat.com> wr=
ote:
>
> On Fri, May 30, 2025 at 4:03=E2=80=AFPM Joel Savitz <jsavitz@redhat.com> =
wrote:
> >
> > The first patch removes an unnecessary guard by the same logic as
> > commit 5caa2d89b7f1 ("kernel/nsproxy: remove unnecessary guards").
> >
> > The second patch fixes the total ordering of resource acquisition
> > in validate_nsset().
> >
> > The third patch implements usage of the cleanup helper added by commit
> > d057c108155a ("nsproxy: add a cleanup helper for nsproxy").
> >
> > Joel Savitz (3):
> >   kernel/nsproxy: remove unnecessary guard in validate_nsset()
> >   kernel/nsproxy: fix put_*() call ordering in validate_nsset()
> >   kernel/nsproxy: utilize cleanup helper for nsproxy references
> >
> >  kernel/nsproxy.c | 12 +++---------
> >  1 file changed, 3 insertions(+), 9 deletions(-)
> >
> > --
> > 2.45.2
> >
>
> ping

ping 2


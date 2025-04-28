Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E0CD52222A0
	for <linux-kernel@vger.kernel.org>; Mon, 28 Apr 2025 12:54:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745844866; cv=none; b=JAw5q7jaC+k9UMbdOveghTSachNPYg7Gc9Jmd9Kj+QWVPvldu6/wWVpN+SpAuGrPAImpPScL85A94A8DF4nTdn5ms0qEtyYIvuKu1D+j+/vJyX7OBaAQgegqILJfMA/EXEvvuM/kniBp8aWvqUZZeTsJYGIcj37pZBotiutRB48=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745844866; c=relaxed/simple;
	bh=UtaHAfdmSj4qXn5u8+vo9J5JBw9YwAKk1Lf6jvKCU28=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=h0VWpc7vpR8IKUR7q4pmMeayhfIwaXGqkxFRGDvZx2sNPWGZmC10Laq763IDutjaJ3uVcqgHQzV9+tzG1xR9mcw3udnUcckc0RNaNAjkBgxUBkF+bFhJZKq+eEcLPhHoZZktIe9iUxXqd4RZoNywf+yP5+YR5AO4SxlSU0Ty5E0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=ZZyviIRX; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="ZZyviIRX"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1745844863;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ipeKwooPNECwWcnMizDPwSDiqiyokClUjBvMFkUD7nM=;
	b=ZZyviIRXRwfKEm5eMxKw8YV1A0h+nwmfuL6zB7V6MS794mPLQAZLK0owHdiMmUmTFSBvwU
	dbDuy1UqhiYhShr6HPCRu1Y5JeBN2R6tS39nTP7/rkf6ecimFcggjobqM3eitzKE+JxzJ2
	AjA/kYNBR3hs9hpCaLwdCBm/9clgO9M=
Received: from mail-ej1-f72.google.com (mail-ej1-f72.google.com
 [209.85.218.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-444-kVAebmnhNuK31c0oLom_XQ-1; Mon, 28 Apr 2025 08:54:22 -0400
X-MC-Unique: kVAebmnhNuK31c0oLom_XQ-1
X-Mimecast-MFC-AGG-ID: kVAebmnhNuK31c0oLom_XQ_1745844861
Received: by mail-ej1-f72.google.com with SMTP id a640c23a62f3a-acbbb0009aeso341314166b.1
        for <linux-kernel@vger.kernel.org>; Mon, 28 Apr 2025 05:54:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745844861; x=1746449661;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ipeKwooPNECwWcnMizDPwSDiqiyokClUjBvMFkUD7nM=;
        b=Fn0TagikGNzH8XifKN/e37Dltnp3rEd6/xBtaTTi59lgvGC9wvWGJCA7CK2X4kl0st
         UConvlp8qKmvyG5bUGnvpHuV3CWJAtQLGmlYkjeiu92XnQDQXhejGKiU0Vc1EuYVNTs+
         cnrxCx10oMZPbX6y2EKxTTk5bn34PWhXww/278Pq0QIbc/VDBA1oGc8d/ImxxgjphcK/
         zRYConOTFzPQlm9+K/qj+Qm3O66nDVYW+qNFKVA3jJEm9jMopDMhGhH9iAc5C3uwVvbz
         LpZCC8knpafRcBtl1x0bgrnTc83dwgN5YY0DM6IXKAp2Aja2Nnw+Bz5pjDZSniTtDwk3
         xuXg==
X-Gm-Message-State: AOJu0Yz38gnM14ihTi7wmTQGlbV7M9yhPOwQoESCzTAT4ccGh7Sj0Pl1
	tI82RQFZQZiMNRI8qXCEUL5mz2cI0ucQ20F099bP5spu4ipshG52rV5uFNqrAlb9YwHG/nxzAwQ
	brUJ3LxDWt3lirudRKDZoXOfRXxXqYc4QUtSBmr0PzTHmaQGZi70TKiw5pBwjMyK6gvSjkGCkyK
	kiNNDrFbqw+7cS2DeuIhIHc7C+lZd50nZwFjZYeYwXA/4MXPY=
X-Gm-Gg: ASbGncvikJwZDHy2LKHR7XKJP8SBMswMGLn+EGyFwAu0A/4gTRSnk3iVAxv0ZjIQnZr
	uDbVF9GYj6txydxf9lreZyh1eYg63E7HS2WkZjQ/7LB00LAeLBsWrOmanKgUtVDcovGNetb/Pg3
	GQMQW1A4rADy3OhzdzgUdRUPE=
X-Received: by 2002:a17:906:7955:b0:ac4:2ac:3c2e with SMTP id a640c23a62f3a-ace713fd1dbmr1194511566b.54.1745844860682;
        Mon, 28 Apr 2025 05:54:20 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IE7hWtsOC3o5eLo49dSK3X+xHJwtfut3oGlCL9XaN9FVlEPi2hqQyJZ2wXe1HY2/7Ad2vT8cba5dnAHOhcLcBY=
X-Received: by 2002:a17:906:7955:b0:ac4:2ac:3c2e with SMTP id
 a640c23a62f3a-ace713fd1dbmr1194510266b.54.1745844860372; Mon, 28 Apr 2025
 05:54:20 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250421161723.1138903-1-jsavitz@redhat.com>
In-Reply-To: <20250421161723.1138903-1-jsavitz@redhat.com>
From: Joel Savitz <jsavitz@redhat.com>
Date: Mon, 28 Apr 2025 08:54:03 -0400
X-Gm-Features: ATxdqUGuFUEGLu9q6K3lucxpUjLuWYmBdAh3jsxIQYw3BSz__RLVI95M0qJ3C9A
Message-ID: <CAL1p7m6enT=5Hyh3e0Frf_faWLTXjChOYiuJr61zBg5sy0PdeA@mail.gmail.com>
Subject: Re: [PATCH v3] docs: namespace: Tweak and reword resource control doc
To: linux-kernel@vger.kernel.org
Cc: Jonathan Corbet <corbet@lwn.net>, linux-doc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Apr 21, 2025 at 12:17=E2=80=AFPM Joel Savitz <jsavitz@redhat.com> w=
rote:
>
> Fix the document title and reword the phrasing to active voice.
>
> Signed-off-by: Joel Savitz <jsavitz@redhat.com>
> ---
> Changes since v2:
> - Fix another typo
> Changes since v1:
> - Fix spelling of resource
>
>  .../namespaces/resource-control.rst           | 24 +++++++++----------
>  1 file changed, 12 insertions(+), 12 deletions(-)
>
> diff --git a/Documentation/admin-guide/namespaces/resource-control.rst b/=
Documentation/admin-guide/namespaces/resource-control.rst
> index 369556e00f0c..553a44803231 100644
> --- a/Documentation/admin-guide/namespaces/resource-control.rst
> +++ b/Documentation/admin-guide/namespaces/resource-control.rst
> @@ -1,17 +1,17 @@
> -=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D
> -Namespaces research control
> -=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D
> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> +User namespaces and resource control
> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
>
> -There are a lot of kinds of objects in the kernel that don't have
> -individual limits or that have limits that are ineffective when a set
> -of processes is allowed to switch user ids.  With user namespaces
> -enabled in a kernel for people who don't trust their users or their
> -users programs to play nice this problems becomes more acute.
> +The kernel contains many kinds of objects that either don't have
> +individual limits or that have limits which are ineffective when
> +a set of processes is allowed to switch their UID. On a system
> +where the admins don't trust their users or their users' programs,
> +user namespaces expose the system to potential misuse of resources.
>
> -Therefore it is recommended that memory control groups be enabled in
> -kernels that enable user namespaces, and it is further recommended
> -that userspace configure memory control groups to limit how much
> -memory user's they don't trust to play nice can use.
> +In order to mitigate this, we recommend that admins enable memory
> +control groups on any system that enables user namespaces.
> +Furthermore, we recommend that admins configure the memory control
> +groups to limit the maximum memory usable by any untrusted user.
>
>  Memory control groups can be configured by installing the libcgroup
>  package present on most distros editing /etc/cgrules.conf,
> --
> 2.45.2
>

Hi,

Just a quick follow up on this. Are the changes acceptable?

Best,
Joel Savitz


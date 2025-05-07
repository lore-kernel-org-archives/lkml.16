Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9BA6B1A841B
	for <linux-kernel@vger.kernel.org>; Wed,  7 May 2025 06:35:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746599716; cv=none; b=m1NKk0Y5AFXkPrK3ffqgV2Gc93tyyMpU6lzdpu5aznHQB4F+CUP2egNPjW+jOkor2Us2xSq9lTmfgKh2Xl8ravapQmmcC/DK+47Y3yJetIbmKHVdhJGlXjg+yMfOro6m4hCEQAa6q4UvuhPbyQfEzqEcJHzyrACtxxxHFHjL1fw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746599716; c=relaxed/simple;
	bh=yUZQ2hjPMFywZsjZQl47eCrBPONdW38f3aMv0Ef9BOc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=K2PYyrhWiNOY5aVr0Y6oqeKrWfCTryMky511J8MsKkqomcCUszmcsNulOPHSYlKQbWKWbP7xLIRI5L6919aYx8VxiihjNySUSgKvTnz5YGR5A6Gep82NAiBBSqI9AiqCMsO3g79K8/7wWVeA0+6qmgCxlAZhAH5NlQ6bjV3iO5s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=IeBSdTim; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="IeBSdTim"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1746599713;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=olGmiL/bpb3HhYKj9w+O3Ue1rN7I+9eYOjkkyJupzJ4=;
	b=IeBSdTimet5kkPyjZrlm96DPMrZeTneybW4zb8UwoX8H00HTgcL0oZ5U3xcxhiJegRCSQA
	59DJnXEl43Uv8zoILJFEP5Q7qpnrFygfRQ0pPp2rqxZAjwWAat4wyuiFH9JJTxd9x+DXwK
	vZCe2x4GmeJcCaRRi2Iq8jGNM3wh/c8=
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com
 [209.85.216.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-339-w1VPHLuGOJyIxBeDc-ngcg-1; Wed, 07 May 2025 02:35:11 -0400
X-MC-Unique: w1VPHLuGOJyIxBeDc-ngcg-1
X-Mimecast-MFC-AGG-ID: w1VPHLuGOJyIxBeDc-ngcg_1746599711
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-309e8dc1e21so658841a91.0
        for <linux-kernel@vger.kernel.org>; Tue, 06 May 2025 23:35:11 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746599711; x=1747204511;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=olGmiL/bpb3HhYKj9w+O3Ue1rN7I+9eYOjkkyJupzJ4=;
        b=VFqgHm5c5fomHrr/FhAVQx11c0s8dRfzHRUzuxWVzWhDnIFAxO49gIrpi1Q2wM37eK
         gdgvwvAv2CFn3H5JXtcU2hqhgsovH1MKygm+YwFd5aV/xQoprrdlI3ZlBx8hlHPdYK8O
         6oQmH3CGKVywZCZT3Y85J5F59V7KHO4FE/z/+b4Ij+XKpBsNtlrLki+2iMxqYKurMIO6
         9Xyz3mgoLVfBF8haV1P5AvMz/qjvPin9Kv8QJnG1jA81/f807COGH+taT6d7wpGLHy4I
         YqWZC4F+PsXyVQ2RCdCmS3Fp7G5JiDZhU181zpQ3wzSqD2+foPK6jOuJM7wM4g6FwG3A
         1ZKA==
X-Gm-Message-State: AOJu0YzRk4xGI/NK1A/Be9yUPlkzfY/Bh/S/lsf1EMW6ToGFsHqcqdC5
	3RpsSnUh3d5kBj21KbB298EsFtbhjlYqev3nOuP5ns3bX9OOuEH1hLgoxjQguBH1LCnJrGez/J+
	vvWy9YFLIDnvVNcI/7+4ulXU7l0P+CtCBkmvLg1hoqBnO2hfVtepvGYawnSwV28mwb5d2m8YJk0
	1H18BIcA8o5fwuYKCGdWeSqmyAeiNpttYnennA
X-Gm-Gg: ASbGncuE7t/W+Argw+I3CmROzH8GKtR/5sWv79kIfs/5i/rvSZALvqvwyF3QYrlvnWs
	J9IuIE5NNYrs71oQ+Da/jXw2nFnoKFCr0DkwdH22VWxdKB+FxrEwt1djyiTe2MQsH0g9FL/I6xL
	desNI9Hzyv+HaQSTcZSYtZ9eo8Wg==
X-Received: by 2002:a17:90b:1d50:b0:30a:9cd5:5932 with SMTP id 98e67ed59e1d1-30aaed58c2fmr2983053a91.13.1746599710709;
        Tue, 06 May 2025 23:35:10 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IE2st4MZM6rukOnt1RBPeqd6Hl7BB8Yf+anKJAPFoSTcLQDQqvLtdrl6A0wgkeKKL9+74j+ob0jxS9j0urxu0A=
X-Received: by 2002:a17:90b:1d50:b0:30a:9cd5:5932 with SMTP id
 98e67ed59e1d1-30aaed58c2fmr2983026a91.13.1746599710360; Tue, 06 May 2025
 23:35:10 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250507055145.23345-2-bagasdotme@gmail.com>
In-Reply-To: <20250507055145.23345-2-bagasdotme@gmail.com>
From: Lukas Bulwahn <lbulwahn@redhat.com>
Date: Wed, 7 May 2025 08:34:59 +0200
X-Gm-Features: ATxdqUG7iKNbcYXJ9aSWebiBhm30eHOJoPvUZiWIkVp0rxHX5NRxKRt42VftXuU
Message-ID: <CAOc5a3OKA-zQQU1pF3T4HT7awEg3JMgD-BYOXbviqMDyZr-__Q@mail.gmail.com>
Subject: Re: [PATCH] Documentation: ioctl-number: Update table intro
To: Bagas Sanjaya <bagasdotme@gmail.com>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, 
	Linux Documentation <linux-doc@vger.kernel.org>, Jonathan Corbet <corbet@lwn.net>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Frederic Barrat <fbarrat@linux.ibm.com>, 
	Michael Ellerman <mpe@ellerman.id.au>, Andrew Donnellan <ajd@linux.ibm.com>, 
	"Steven Rostedt (Google)" <rostedt@goodmis.org>, Eric Biggers <ebiggers@google.com>, 
	Nuno Das Neves <nunodasneves@linux.microsoft.com>, 
	Beau Belgrave <beaub@linux.microsoft.com>, Jan Kara <jack@suse.cz>, 
	Lukas Bulwahn <lukas.bulwahn@redhat.com>, 
	Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, May 7, 2025 at 7:52=E2=80=AFAM Bagas Sanjaya <bagasdotme@gmail.com>=
 wrote:
>
> Introduction paragraph to the ioctl numbers table states that only
> ioctls in ancient Linux kernel version (v2.6.31) for x86 arch are
> listed. This is inaccurate as the table also lists ioctls from non-x86
> archs and the kernel is continously developed (currently in v6.x).
>
> Update the paragraph accordingly.
>
> Signed-off-by: Bagas Sanjaya <bagasdotme@gmail.com>
> ---
>  Documentation/userspace-api/ioctl/ioctl-number.rst | 5 ++---
>  1 file changed, 2 insertions(+), 3 deletions(-)
>
> diff --git a/Documentation/userspace-api/ioctl/ioctl-number.rst b/Documen=
tation/userspace-api/ioctl/ioctl-number.rst
> index 83e5d2abdad694..51269ff250882f 100644
> --- a/Documentation/userspace-api/ioctl/ioctl-number.rst
> +++ b/Documentation/userspace-api/ioctl/ioctl-number.rst
> @@ -62,9 +62,8 @@ Following this convention is good because:
>  (5) When following the convention, the driver code can use generic
>      code to copy the parameters between user and kernel space.
>
> -This table lists ioctls visible from user land for Linux/x86.  It contai=
ns
> -most drivers up to 2.6.31, but I know I am missing some.  There has been
> -no attempt to list non-X86 architectures or ioctls from drivers/staging/=
.
> +This table lists ioctls visible from userland for Linux version 6.x+,
> +excluding ones from drivers/staging/.

It is probably best to avoid mentioning any version information at all.

Lukas

>
>  =3D=3D=3D=3D  =3D=3D=3D=3D=3D  =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D =3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D
>  Code  Seq#    Include File                                           Com=
ments
>
> base-commit: b91a0cbb6f27ee499e376091e8c8c0ddfd69103c
> --
> An old man doll... just what I always wanted! - Clara
>


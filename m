Received: from mail-yw1-f173.google.com (mail-yw1-f173.google.com [209.85.128.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3726C283126
	for <linux-kernel@vger.kernel.org>; Fri, 30 May 2025 20:15:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748636106; cv=none; b=ORTNsJx0FSLCaNXMMUnnibC9F4S23aQ+dPejdNinRajKBu1d+6T5jszQd3rdDOwxqztnC061W+4HFRD/sMYCmIH47RdS8UoN3z2QnQYVkYPnY+fXQVbLenzzVCVHNu/aWiJf8lyf0NU2YG3wH51CllY80a3B8Ux+Uc5Ccgj3F1A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748636106; c=relaxed/simple;
	bh=zKZD7kycK+DTv2eWWuFIsoyy8NdEndn/seS2tgq91d0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=uo3dETBMjJ20mUssDnQT466twCnitAQcj2jls4k3JznEZZYrOE3twkDt5kauU2BQYuyftLzy3ixlXLSnAw11pf3eb5D77EbaCt+9BMhZ2ZEHj405PyfJ5mHIWOaKlyQhl8R5jonqqHfrGyZ+maPLnIUde7Im7oLsGRpCUf5TpDU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=paul-moore.com; spf=pass smtp.mailfrom=paul-moore.com; dkim=pass (2048-bit key) header.d=paul-moore.com header.i=@paul-moore.com header.b=dq24m/Ux; arc=none smtp.client-ip=209.85.128.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=paul-moore.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=paul-moore.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=paul-moore.com header.i=@paul-moore.com header.b="dq24m/Ux"
Received: by mail-yw1-f173.google.com with SMTP id 00721157ae682-70a57a8ffc3so26692327b3.0
        for <linux-kernel@vger.kernel.org>; Fri, 30 May 2025 13:15:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=paul-moore.com; s=google; t=1748636104; x=1749240904; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/6M9vTIekjqMakDV8dozG4WyWbU1408sp+iknzocvmg=;
        b=dq24m/Ux7r5bRIaTKep599VlR96VKDws42dMDOlgzHeMBRIAc3HxVFD8MN1+qCQHvI
         uvwOjH6Mn/GOs6TqaQOQ6/qivWi6JEfgLxZU6iss3AhdZeJm6Bt+g1HOy5l9brfTc9rQ
         squiwRu7NZroCvM9U62qg8RfhrqCIafK5aTUv4jt53kxIkRo9pEApJHZpmSLDMXOVnNo
         bz95duKhI1yHjgUkbbRg47QmFOIpVLBEsPua6ESvIucNq1/WxzcBpb3Cm4QX8zVLsiMN
         Mk6q+T77T+Q/5EEg8OyQh3MiWkTYKdtIW6haVImoDGyMmk05LTmd77yKS3uanxvaABAz
         8bQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748636104; x=1749240904;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/6M9vTIekjqMakDV8dozG4WyWbU1408sp+iknzocvmg=;
        b=gSXaXUMLpNV6f5b6T+FrAztbFwOJuUWgkfjMH89VRDFjzo1dLCBFUocq3fyjvmwYDc
         quplkSu8zIUoT7QMOcaJAHPoNAlSNulAnoCvJ3kTQZerR8v60V8cWOwpxymCJLf8TaMQ
         yEIdUa02/2bo6mqxNLbuM1Yu0pWPy62lf3gOX9C+OR6AMZ9QwAE6HXwVJGRHIn+WHzOf
         Spi7qLyFZ2NasVhe5JMzKrZ5cs3vG8rLsh1ksemR3U0XgxiMFAlRsfvhryj2Ni72vjhS
         D4KIKrozQtpat6CK2x00KH0hPGte08j6sCry+J1+l7ofvaO0wAPR4S3+Hw57hoPwS2O6
         sdpA==
X-Forwarded-Encrypted: i=1; AJvYcCVmqljoeRckNQ2t5lwm5vEjLO3IRP5i7TqnSNYqbd/JAZnEyhq2OJaULInUFM8ntdhpfePZsfZ6IKGvnyk=@vger.kernel.org
X-Gm-Message-State: AOJu0YzEibyLI0JXGDmY6Gs2Dbfyx0p2pW64lzBxIf/B/nt/yVewNxMo
	A1qChYxLwyPv8k1Cyh5myGXzFh1bTc94EVlSDiIdz4YdJ41eUIFOVdUf6hbNMKBXrPkHPiN/rXe
	KqNcxuYe7na/WtFhLFng56NASkPMoc3inoj/U0Axo
X-Gm-Gg: ASbGnctagTcD0mPMoaG2lvaJrif2Jod49EjBF0OPNynGLNHIGhEFfdtnyIK5BL+rdB5
	WnpmJH68I5ZPvnWR15Aw3d371MZvLstjukI0pB6kps5Tm2Lj8UgzJdLTzXgj5iOJNWSHK1iwArL
	Rnewkqztb2NsaV9df1dlYCCqDhnT+Y6wUl
X-Google-Smtp-Source: AGHT+IGEgHJSnIpVMDUNuG4nRg+8xziUWzrtuXTTXaLUVkbGQ8T73R7RDyW+rOrdzHlp1IDD3+QOw7QkKNA1Z0zveMw=
X-Received: by 2002:a81:fe16:0:b0:70e:7503:1176 with SMTP id
 00721157ae682-710504bb2b5mr39109027b3.4.1748636104081; Fri, 30 May 2025
 13:15:04 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250528215037.2081066-1-bboscaccy@linux.microsoft.com> <CACYkzJ5oJASZ43B531gY8mESqAF3WYFKez-H5vKxnk8r48Ouxg@mail.gmail.com>
In-Reply-To: <CACYkzJ5oJASZ43B531gY8mESqAF3WYFKez-H5vKxnk8r48Ouxg@mail.gmail.com>
From: Paul Moore <paul@paul-moore.com>
Date: Fri, 30 May 2025 16:14:52 -0400
X-Gm-Features: AX0GCFvae8Nhzjdj75blgRs5ebZiu1Eaj7gYSoOZMxFQAT5NXKLhQ6NPMfSadE8
Message-ID: <CAHC9VhSLOjQr4Ph2CefyEZGiB-Vqd4a8Y9=uA2YPo79Xo=Qopg@mail.gmail.com>
Subject: Re: [PATCH 0/3] BPF signature verification
To: KP Singh <kpsingh@kernel.org>
Cc: Blaise Boscaccy <bboscaccy@linux.microsoft.com>, jarkko@kernel.org, zeffron@riotgames.com, 
	xiyou.wangcong@gmail.com, kysrinivasan@gmail.com, code@tyhicks.com, 
	linux-security-module@vger.kernel.org, roberto.sassu@huawei.com, 
	James.Bottomley@hansenpartnership.com, Alexei Starovoitov <ast@kernel.org>, 
	Daniel Borkmann <daniel@iogearbox.net>, John Fastabend <john.fastabend@gmail.com>, 
	Andrii Nakryiko <andrii@kernel.org>, Martin KaFai Lau <martin.lau@linux.dev>, 
	Eduard Zingerman <eddyz87@gmail.com>, Song Liu <song@kernel.org>, 
	Yonghong Song <yonghong.song@linux.dev>, Stanislav Fomichev <sdf@fomichev.me>, Hao Luo <haoluo@google.com>, 
	Jiri Olsa <jolsa@kernel.org>, David Howells <dhowells@redhat.com>, Lukas Wunner <lukas@wunner.de>, 
	Ignat Korchagin <ignat@cloudflare.com>, Quentin Monnet <qmo@kernel.org>, 
	Jason Xing <kerneljasonxing@gmail.com>, Willem de Bruijn <willemb@google.com>, 
	Anton Protopopov <aspsk@isovalent.com>, Jordan Rome <linux@jordanrome.com>, 
	Martin Kelly <martin.kelly@crowdstrike.com>, Alan Maguire <alan.maguire@oracle.com>, 
	Matteo Croce <teknoraver@meta.com>, bpf@vger.kernel.org, linux-kernel@vger.kernel.org, 
	keyrings@vger.kernel.org, linux-crypto@vger.kernel.org, kys@microsoft.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, May 30, 2025 at 12:42=E2=80=AFPM KP Singh <kpsingh@kernel.org> wrot=
e:
> On Wed, May 28, 2025 at 11:50=E2=80=AFPM Blaise Boscaccy
> <bboscaccy@linux.microsoft.com> wrote:

...

> Please hold off on further iterations, I am working on a series and
> will share these patches based on the design that was proposed.

I don't think there is any harm in Blaise continuing his work in this
area, especially as he seems to be making reasonable progress towards
a solution that satisfies everyone's needs.  Considering all of the
work that Blaise has already invested in this, and his continued
willingness to try to work with everyone in the community to converge
on a solution, wouldn't it be more beneficial to work with Blaise on
further developing/refining his patchset instead of posting a parallel
effort?  It's your call of course, I'm not going to tell you, or
anyone else, to refrain from posting patches upstream, but it seems
like this is a good opportunity to help foster the development of a
new contributor.

> > 2. Timing of Signature Check
> >
> > This patchset moves the signature check to a point before
> > security_bpf_prog_load is invoked, due to an unresolved discussion
> > here:
>
> This is fine and what I had in mind, signature verification does not
> need to happen in the verifier and the existing hooks are good enough.

Excellent, I'm glad we can agree on the relative placement of the
signature verification and the LSM hook.  Perhaps I misunderstood your
design idea, but I took your comment:

"The signature check in the verifier (during BPF_PROG_LOAD):

 verify_pkcs7_signature(prog->aux->sha, sizeof(prog->aux->sha),
   sig_from_bpf_attr, =E2=80=A6);"

https://lore.kernel.org/linux-security-module/CACYkzJ6VQUExfyt0=3D-FmXz46GH=
Jh3d=3DFXh5j4KfexcEFbHV-vg@mail.gmail.com/

... to mean that the PKCS7 signature verification was going to happen
*in* the verifier, with the verifier being bpf_check().  Simply for my
own education, if bpf_check() and/or the bpf_check() call in
bpf_prog_load() is not the verifier, it would be helpful to know that,
and also what code is considered the be the BPF verifier.  Regardless,
it's a good step forward that we are all on the same page with respect
to the authorization of signed/unsigned BPF programs.  We still have a
ways to go it looks like, but we're making good progress.

--=20
paul-moore.com

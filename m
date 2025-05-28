Received: from mail-lf1-f48.google.com (mail-lf1-f48.google.com [209.85.167.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD60A221268
	for <linux-kernel@vger.kernel.org>; Wed, 28 May 2025 20:29:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748464185; cv=none; b=XdXTFf8r2+sats2pINNTntT0n0jNV0M3V7KWtGI0wCH+PRUrE8yivfYJ3oEej4bZ+QfCJr1EyHmCU76gJiJAzw8n6tLCtZJsP/NmIyfXx+tDj5dGw6MIsS7nMYZMSrKcG7gxytC/X+6aauj7XPdJ4rsEMtMRkYXftnO1uJFUJHA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748464185; c=relaxed/simple;
	bh=sbF3z9kaUzweO2TUVbqeSb4prVvCanJ6u3NDjk6MEFc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=BP86kwZy9eZbQrcudSwLFWs/+lXBUTjqZQBHcIy+WKSzu84Qy871hxqPuUA0YVjLilGO3ZB/xJWvFCUATGBvRA4kPKWvbwV6H2I0d1BMitsMMcLMHqLZNCHrS/Eo3Ljvzh8RCk7WSFh2E4V53bkfsP3SAAvhtqdWEduSCCm25GM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=0VwF6iVX; arc=none smtp.client-ip=209.85.167.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="0VwF6iVX"
Received: by mail-lf1-f48.google.com with SMTP id 2adb3069b0e04-54b166fa41bso228722e87.0
        for <linux-kernel@vger.kernel.org>; Wed, 28 May 2025 13:29:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1748464182; x=1749068982; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YAQTz4gs0qjYnO6FgGT3yFTm8XMDLPUsfY93F9OnJmM=;
        b=0VwF6iVX8HV48gHRxW05PCG6yttFfYkunrLxnLp6SBCwIdmio03m+AzBorJjF/P6TQ
         UnQSEb2PHG+Sz6qkX+S4r0U0YeDKKmIW1YwQE1ElYD24AQ7BN/OzOqMKVJSzbvSNOqo6
         GHuKVIv2Ba5qipTcPRQixB/9ucTmPnWtbWDakp57nlbMSo8kZohdRkkDYM9bcMWu2c0x
         VLlcoXL8dARAW27fKb9aPeomY2b3W6/4vT4avn2U1UWnp6yiSxb2OgA1lEHN5TBMUc7v
         Gv3UOEYijgEF/9OJcIAhyd/ixqzPOZD3DaNqfc4IwFAA5QchpUDd+sqeWmKf8xZnyOIi
         OrKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748464182; x=1749068982;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=YAQTz4gs0qjYnO6FgGT3yFTm8XMDLPUsfY93F9OnJmM=;
        b=K6iHKdqLGe+zZHXhTlPhRysnnrQgwMVgAbi/KLSOvPghb+xCZMHlmhNMvi08wks7xp
         vpZYMRyRWLxXrpObBnNTbUOkJVFr/BzzYkZZhDn8oi/fO8c3lp8tvW+wjFzwUlILTsQG
         L7Q1EDutDxcBL5BRSkpiuC6Qq4QOz7YoUgZNiDWPyp5b3s0o/kZXW5hye6NQklclwviQ
         uA0uYVa/F9C6s2UdQ6m/SNGbHXjE/JR2OecYeP28RaiVOSVSG+L7U3Llv0AZak1TNook
         oCe2JO9INDEpwG71v/WGSBXyrZwbKE5zCNwhiGReeAKN2jeVJgygoSMHEZ43QKgeXHA4
         s83A==
X-Forwarded-Encrypted: i=1; AJvYcCXwMRpW9ftMkXcLnnNzWCVFKV5QV0k2gBuWG7Orctikz51HQoAT6dVcFcpLit9yB4fQfzmD2SwgBmq3pCs=@vger.kernel.org
X-Gm-Message-State: AOJu0YyxA5WCDSPeuFsVBsc3msRdsI1U4OJ46kOWijbd06ET5zTvuYkS
	/oGsMjNslU4fJrJimZynUfxtNSzuJFu37OX1SSdY5FK0SLjzmlpKpWXxO+isrimBvwbiAd50JZw
	juChi601R4ABNUe0le9YzIc20JyJmSk0cbe/9oIeR
X-Gm-Gg: ASbGncuvSEGf6SzEWQSVpovE6dx1bAqbTdgnTKJxlEmgtQnmnEwggE6GOnyFYKMfBi+
	gM1jnAYJ9QXZrZdm/0XeBLCisKssIFSTQJwDTtiuHUn4TXIaLWTIcmgmRcvJdbVo0mOVj0qwgtr
	Hm/oB8rvm4yzArU7HLZXn4vcsBJ4s0N2aRkIkVwcr/kUo=
X-Google-Smtp-Source: AGHT+IF45STyrs34elU44CUwMCYWgaMk1iP9fwetArWutXYXe6915Ne5pggJH8TEQNxrkcCcU+Zu5CZn4NKDFdXs8YM=
X-Received: by 2002:ac2:568b:0:b0:553:24bf:2287 with SMTP id
 2adb3069b0e04-55324bf24f9mr3571266e87.11.1748464181753; Wed, 28 May 2025
 13:29:41 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250515182322.117840-1-pasha.tatashin@soleen.com> <20250515182322.117840-11-pasha.tatashin@soleen.com>
In-Reply-To: <20250515182322.117840-11-pasha.tatashin@soleen.com>
From: David Matlack <dmatlack@google.com>
Date: Wed, 28 May 2025 13:29:13 -0700
X-Gm-Features: AX0GCFu-az7wXS3tUctrkttv1BpVxbVwipCz3lDeWXiCiQMHX4cL0MiB-XnGYnI
Message-ID: <CALzav=eAWdADOyZHxCTF-eKwiYhw2ELj3mKJ+8uQY6sOf0Hmuw@mail.gmail.com>
Subject: Re: [RFC v2 10/16] luo: luo_ioctl: add ioctl interface
To: Pasha Tatashin <pasha.tatashin@soleen.com>
Cc: pratyush@kernel.org, jasonmiu@google.com, graf@amazon.com, 
	changyuanl@google.com, rppt@kernel.org, rientjes@google.com, corbet@lwn.net, 
	rdunlap@infradead.org, ilpo.jarvinen@linux.intel.com, kanie@linux.alibaba.com, 
	ojeda@kernel.org, aliceryhl@google.com, masahiroy@kernel.org, 
	akpm@linux-foundation.org, tj@kernel.org, yoann.congal@smile.fr, 
	mmaurer@google.com, roman.gushchin@linux.dev, chenridong@huawei.com, 
	axboe@kernel.dk, mark.rutland@arm.com, jannh@google.com, 
	vincent.guittot@linaro.org, hannes@cmpxchg.org, dan.j.williams@intel.com, 
	david@redhat.com, joel.granados@kernel.org, rostedt@goodmis.org, 
	anna.schumaker@oracle.com, song@kernel.org, zhangguopeng@kylinos.cn, 
	linux@weissschuh.net, linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org, 
	linux-mm@kvack.org, gregkh@linuxfoundation.org, tglx@linutronix.de, 
	mingo@redhat.com, bp@alien8.de, dave.hansen@linux.intel.com, x86@kernel.org, 
	hpa@zytor.com, rafael@kernel.org, dakr@kernel.org, 
	bartosz.golaszewski@linaro.org, cw00.choi@samsung.com, 
	myungjoo.ham@samsung.com, yesanishhere@gmail.com, Jonathan.Cameron@huawei.com, 
	quic_zijuhu@quicinc.com, aleksander.lobakin@intel.com, ira.weiny@intel.com, 
	andriy.shevchenko@linux.intel.com, leon@kernel.org, lukas@wunner.de, 
	bhelgaas@google.com, wagi@kernel.org, djeffery@redhat.com, 
	stuart.w.hayes@gmail.com, ptyadav@amazon.de
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, May 15, 2025 at 11:23=E2=80=AFAM Pasha Tatashin
<pasha.tatashin@soleen.com> wrote:
> +static int luo_open(struct inode *inodep, struct file *filep)
> +{
> +       if (!capable(CAP_SYS_ADMIN))
> +               return -EACCES;

It makes sense that LIVEUPDATE_IOCTL_EVENT* would require
CAP_SYS_ADMIN. But I think requiring it for LIVEUPDATE_IOCTL_FD* will
add a lot of complexity.

It would essentially require a central userspace process to mediate
all preserving/restoring of file descriptors across Live Update to
enforce security. If we need a central authority to enforce security,
I don't see why that authority can't just be the kernel or what the
industry gains by punting the problem to userspace. It seems like all
users of LUO are going to want the same security guarantees when it
comes to FDs: a FD preserved inside a given "security domain" should
not be accessible outside that domain.

One way to do this in the kernel would be to have the kernel hand out
Live Update security tokens (say, some large random number). Then
require userspace to pass in a security token when preserving an FD.
Userspace can then only restore or unpreserve an FD if it passes back
in the security token associated with the FD. Then it's just up to
each userspace process to remember their token across kexec, keep it
secret from other untrusted processes, and pass it back in when
recovering FDs.

All the kernel has to do is generate secure tokens, which I imagine
can't be that hard.

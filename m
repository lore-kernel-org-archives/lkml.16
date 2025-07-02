Received: from mail-qt1-f170.google.com (mail-qt1-f170.google.com [209.85.160.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 970B0275AFF
	for <linux-kernel@vger.kernel.org>; Wed,  2 Jul 2025 14:02:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751464962; cv=none; b=sQfwWWSKrONdnBat4rAZ5Y6GXhAyrKkZMN4S21JxgkjEru9gEfoRn0w0zPyfLdzHrlJieMKOOONXJimXCU2TNBhnk5wywo1S/lWyvcKrJ9iDGweParN3zIACn+OjOW7+Q1PxAWI/2nMIHVomtjLUbd4p/tHWehZEXzDsIJon+2o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751464962; c=relaxed/simple;
	bh=au8lDoPnHHAjIaSnJ99Ta7vYDcZpfeKmxV6mR/w0U/4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=FJdNUPCAM9pE4vAgWTnFAxAcBlyEUSSRUClxtFsCct4NZPJjbAb1upAEJGNOj/HUmrf9xI3Mk4ZHGcTpVZRwf32cVB6xfJvpliic6Mb9d+3TbQG1KoP+HHEwq6Nz7e5wq4f1sX3BIpSYQuLBRzwIFyy69t39ctgirXHQtcsWLZ4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=dWjV0Gld; arc=none smtp.client-ip=209.85.160.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="dWjV0Gld"
Received: by mail-qt1-f170.google.com with SMTP id d75a77b69052e-4a752944794so77563291cf.3
        for <linux-kernel@vger.kernel.org>; Wed, 02 Jul 2025 07:02:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1751464959; x=1752069759; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=uDsxmFPSdS4IlYHnsA2Um+LGtK/4VYhWhmhj+jKqT6U=;
        b=dWjV0Gldu4Cyqla30dtsPn/XR8fgc1Z4kJJkYmuGXCLl7wosxuKVM7YpboqFWgc2hx
         DduMcKrpfT5i/dyKp2KQ8i+Ap0bQd7DW+JqAI3unKNcxrikojcmAjLDc3f1ZsbpsHqPO
         j9tTho+K6qLiFW4tqj67bV+ydclUPxMXpai2T7XbkTgmTksEAgDp1YDGc5MzZz5wbdb7
         QDW6T+auj/n6zgvgRJS0oP8QKKOxsTKkU1gfOMYBN8irvnOAtlnvKXB4gGC/7CQUZ3D2
         M4QCiUgpqnVshXacL/hUFGMLBKzPDC+7+8WuWS5Xm2nriEb9hgvE/Cwz385fRVtt2Bgk
         CoEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751464959; x=1752069759;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=uDsxmFPSdS4IlYHnsA2Um+LGtK/4VYhWhmhj+jKqT6U=;
        b=sHuoSAhCM6Ap1jeuX4y4dwOL3ncIootmr9rJjE1EbEpNP+NSaclD4NXQ8JN80CCjri
         jkrX6PpETn7Mq+8DnuVNzOYHRER6vKkKK5W1x8Tm2ByAPDJT3FZHOLjPYGWumMfe7h5E
         jnoVtFvGFxMu5TyZjNsqrh79J7aEaF5J5Y/B8+bm72e2wQPENhWsVcRYCJZ2TUliJFsT
         EJvSvn351qMTR+5Gxieo1cTxD5OeQEyzKhF83ZQ8h+JQmEqMC2Pr88z4ce1VMCxZW5i0
         wg08vPhLd7atgXkquUc4u4hD4no02I14BIjHEesPOWYxv5vGnMgcL3NGcvOd8/PSqFvf
         0OAQ==
X-Forwarded-Encrypted: i=1; AJvYcCUB6k5vTSqsmRnRpnKFpdrDOAPlR7BzFFTFLbD3uOj+m0CwT4980B6cKTkkZ+ftbOsil7hMt99mPBkKDRQ=@vger.kernel.org
X-Gm-Message-State: AOJu0YyOQWGFgZ7TZNHh+rqX00OdVgcRD9FhsJSbnhFFnE0Kwu+5bVpM
	CejQdlI3X9ktc5wyo2xx9mdwVJc2Wef3peaZFD501h8ou8hVSgXceP71FHgDZPGB26cykmX4uXU
	UzgC2Xq5HPa8p9byS8mW8Oj/SjBFmfO82ej7aEmMV
X-Gm-Gg: ASbGncuFrwSss5vmIGjXF28kliqS5FpcI/ORkJClWdhWbgJjJnUjdW3exevL05gTEpM
	ecVMrUsRT3FN4kQ/2iyoDi6Dq0MfzxkXR8Tr//3DtS/xjsRLrflvbg6vf70kKHK8QxM11jLT3dU
	Vq2voFLpctBcJbTKAYsRp2JQpm0ZwqDY4LLRHwaDptGA==
X-Google-Smtp-Source: AGHT+IFbF9G6vh3MukO6aBJpYKW/hcKdIcWaNoMxfXYUo16gF6b9Evfx/JNl1SrWK1BIXK+jeyYf2F/GkWqpIYJIhE0=
X-Received: by 2002:a05:622a:11c5:b0:4a7:f9ab:7899 with SMTP id
 d75a77b69052e-4a976a53c98mr49828831cf.35.1751464959071; Wed, 02 Jul 2025
 07:02:39 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250702110039.15038-1-jiayuan.chen@linux.dev>
 <c9c5d36bc516e70171d1bb1974806e16020fbff1@linux.dev> <CANn89iJdGZq0HW3+uGLCMtekC7G5cPnHChCJFCUhvzuzPuhsrA@mail.gmail.com>
In-Reply-To: <CANn89iJdGZq0HW3+uGLCMtekC7G5cPnHChCJFCUhvzuzPuhsrA@mail.gmail.com>
From: Eric Dumazet <edumazet@google.com>
Date: Wed, 2 Jul 2025 07:02:27 -0700
X-Gm-Features: Ac12FXwMIS3lW_uVU7P4nhYxGHAR81RWZmByuPLVEv6OHHFXnWu1Z9-FbDLxxPo
Message-ID: <CANn89iJD6ZYCBBT_qsgm_HJ5Xrups1evzp9ej=UYGP5sv6oG_A@mail.gmail.com>
Subject: Re: [PATCH net-next v1] tcp: Correct signedness in skb remaining
 space calculation
To: Jiayuan Chen <jiayuan.chen@linux.dev>
Cc: netdev@vger.kernel.org, mrpre@163.com, 
	Neal Cardwell <ncardwell@google.com>, Kuniyuki Iwashima <kuniyu@google.com>, 
	"David S. Miller" <davem@davemloft.net>, David Ahern <dsahern@kernel.org>, 
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Simon Horman <horms@kernel.org>, 
	David Howells <dhowells@redhat.com>, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Jul 2, 2025 at 6:59=E2=80=AFAM Eric Dumazet <edumazet@google.com> w=
rote:
>
> On Wed, Jul 2, 2025 at 6:42=E2=80=AFAM Jiayuan Chen <jiayuan.chen@linux.d=
ev> wrote:
> >
> > July 2, 2025 at 19:00, "Jiayuan Chen" <jiayuan.chen@linux.dev> wrote:
> >
> >
> > >
> > > The calculation for the remaining space, 'copy =3D size_goal - skb->l=
en',
> > >
> > > was prone to an integer promotion bug that prevented copy from ever b=
eing
> > >
> > > negative.
> > >
> > > The variable types involved are:
> > >
> > > copy: ssize_t (long)
> > >
> > > size_goal: int
> > >
> > > skb->len: unsigned int
> > >
> > > Due to C's type promotion rules, the signed size_goal is converted to=
 an
> > >
> > > unsigned int to match skb->len before the subtraction. The result is =
an
> > >
> > > unsigned int.
> > >
> > > When this unsigned int result is then assigned to the s64 copy variab=
le,
> > >
> > > it is zero-extended, preserving its non-negative value. Consequently,
> > >
> > > copy is always >=3D 0.
> > >
> >
> > To better explain this problem, consider the following example:
> > '''
> > #include <sys/types.h>
> > #include <stdio.h>
> > int size_goal =3D 536;
> > unsigned int skblen =3D 1131;
> >
> > void main() {
> >         ssize_t copy =3D 0;
> >         copy =3D size_goal - skblen;
> >         printf("wrong: %zd\n", copy);
> >
> >         copy =3D size_goal - (ssize_t)skblen;
> >         printf("correct: %zd\n", copy);
> >         return;
> > }
> > '''
> > Output:
> > '''
> > wrong: 4294966701
> > correct: -595
> > '''
>
> Can you explain how one skb could have more bytes (skb->len) than size_go=
al ?
>
> If we are under this condition, we already have a prior bug ?
>
> Please describe how you caught this issue.

Also, not sure why copy variable had to be changed from "int" to "ssize_t"

A nicer patch (without a cast) would be to make it an "int" again/

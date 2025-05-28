Received: from mail-qt1-f180.google.com (mail-qt1-f180.google.com [209.85.160.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 229752853EF
	for <linux-kernel@vger.kernel.org>; Wed, 28 May 2025 13:41:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748439722; cv=none; b=ORlnpw26BRrYtGUhEZ3JIfR6vc4JtiOO7Lbtib8LdCUvthnPSMlNKHYO1tkXFjSlWYCpxvmoi3ITp4ILLBVnIv6mRWuc5cP8oDtsBLwD1rVdBrt5s7RlW9ea0qVDsf20Oxw9jSg0mKKoYYhJfLuNTTzNMjLGZNn1URqUc8l0jnk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748439722; c=relaxed/simple;
	bh=q6+NUbSkDfbULFIkQSRxG3LqAFTgY8fsGbQ0EjJoDmg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=qMwihIxCT3KJdPNDBDnOP9m38989vK3aXMr54Yv2Hcln2RcGn5O/PQe2R25g3mSYOx8UxbcDsaWvpeaTWDsKDnOQut0hnsQGB2o22p3xDWvQ4Ukl/DObkstO/V96I1NUo90sWN3ihvVCpbWgtE8ZE4nBTJpHk36DuoGtjc71604=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=dvDTI76j; arc=none smtp.client-ip=209.85.160.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="dvDTI76j"
Received: by mail-qt1-f180.google.com with SMTP id d75a77b69052e-47677b77725so41399911cf.3
        for <linux-kernel@vger.kernel.org>; Wed, 28 May 2025 06:41:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1748439719; x=1749044519; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=q6+NUbSkDfbULFIkQSRxG3LqAFTgY8fsGbQ0EjJoDmg=;
        b=dvDTI76jZZGKZmTUy8Wff5m8yyne23JCwucBRkoFbQLgPKmcWzyLZ2j6RrrAgnWDlA
         Db5GSXJPcEIp1gJIjJmCCAnswBjT7gBApuO25JjYe/9SkA5BSUfPS02mZUwesFAVHmL+
         mrvM509kQpcIPbIWZPVIWspkkPPA3rxuHJKyloF4yoyc0wrHf8oA325hyPgtI6+n0Uo0
         qUPjyuJAKbzSwr10pvyQU8OKlKxenOXH7rvszJf1DqxBrBU2ZdhzifhdezlkvRgijtFs
         CLqEaXxVmkLzvJya9w2F3JcjClKiCSTiyXAgdCTx/qnSD394/bmpLZdVjJPwcdOpAOJK
         EANw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748439719; x=1749044519;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=q6+NUbSkDfbULFIkQSRxG3LqAFTgY8fsGbQ0EjJoDmg=;
        b=FjTRhJe5ZzMwejRELtuuqTrcp3w8kh+j12h9jX1cwGVc1JkFHvQkuFlkaecJaatbgl
         zUIDEaSH6pkp/vR1DkoArFgHvR74Dgk0lsMU++0fGDB2k0yxahwT5MyGLI9ZgglcIy7Y
         jQfYOHsbNMUJeUu9k/fS0NOLPfEzamxh9AjkJpRZcu0MXV8ldmSiuzC1fPHmwbTSts/w
         J7xuYQXRAn3g01vunNmKrZ/kJgy60EYhk2i0cw1oqVW3j/hxXPP1q1F/LHZVdVRzo8Rc
         aN5KGXJ7YICAndspxZBiBJaCW5XSXFSHgAfOOlId260AnvL4QP95nlkbBTkYKZ65OvDG
         hoAQ==
X-Forwarded-Encrypted: i=1; AJvYcCWvKwwS6Pto4VVEgXD9MxbImLfiV5FdJH/mwyKmIsjus7lDHX4WnZAHPOH3jmn6pOiXhHUpXhHeJpJLnzs=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx/L21gOA0WSHT1EQWTmiG0iuIAvE7HfiylkQ6hul4dYPvDmYfc
	6eZ7LPP6TP2jOP9TXcjsXNK0qZKHL6Dsy+nKsFYX7oe4Ort1cljt9FUiQafjniXZAScGZbvUa2V
	wBm8VbIp29ictywM/lryQS8hPXQ4Nm5qvKczgpn2x
X-Gm-Gg: ASbGncvn4OSgPhCCq5rrAuYMp/hzeNRbeUR5ZcAjMhqnYPGJBAILuZ3+ubXn7vBtXyc
	mQQmqC4mwDgsZwXFokY4FE62Cj2Joxix14MH3zH90XtmXgDSDifDVHdtb0Ht82G4686mihtZR5H
	33k1U/I4/tWqbiLQo5Oo6GRsW/8LdKLL8rJqfP1ky+e2nkjef98W34Fw==
X-Google-Smtp-Source: AGHT+IFXUSUWOaRqlGgnQsk3Ddxf9ikBISkt0/KlPz6xvIxI0l0YyOvrvNO9ok6mnWdgT9562252wxJ87xj+prWb40Q=
X-Received: by 2002:a05:622a:5c15:b0:476:add4:d2a9 with SMTP id
 d75a77b69052e-49f46c33b2dmr291076841cf.30.1748439717984; Wed, 28 May 2025
 06:41:57 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <CAN2Y7hxscai7JuC0fPE8DZ3QOPzO_KsE_AMCuyeTYRQQW_mA2w@mail.gmail.com>
 <aDcLIh2lPkAWOVCI@strlen.de> <CAN2Y7hzKd+VxWy56q9ad8xwCcHPy5qoEaswZapnF87YkyYMcsA@mail.gmail.com>
In-Reply-To: <CAN2Y7hzKd+VxWy56q9ad8xwCcHPy5qoEaswZapnF87YkyYMcsA@mail.gmail.com>
From: Eric Dumazet <edumazet@google.com>
Date: Wed, 28 May 2025 06:41:45 -0700
X-Gm-Features: AX0GCFtlj7sv-EQdf2aW5VpoDTLIYK53zi24E4KIItVmjWV2JQld-StOJ3wEEoo
Message-ID: <CANn89iLG4mgzHteS7ARwafw-5KscNv7vBD3zM9J6yZwDq+RbcQ@mail.gmail.com>
Subject: Re: [bug report, linux 6.15-rc4] A large number of connections in the
 SYN_SENT state caused the nf_conntrack table to be full.
To: ying chen <yc1082463@gmail.com>
Cc: Florian Westphal <fw@strlen.de>, pablo@netfilter.org, kadlec@netfilter.org, 
	davem@davemloft.net, kuba@kernel.org, pabeni@redhat.com, 
	netfilter-devel@vger.kernel.org, coreteam@netfilter.org, 
	netdev@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, May 28, 2025 at 6:26=E2=80=AFAM ying chen <yc1082463@gmail.com> wro=
te:
>
> On Wed, May 28, 2025 at 9:10=E2=80=AFPM Florian Westphal <fw@strlen.de> w=
rote:
> >
> > ying chen <yc1082463@gmail.com> wrote:
> > > Hello all,
> > >
> > > I encountered an "nf_conntrack: table full" warning on Linux 6.15-rc4=
.
> > > Running cat /proc/net/nf_conntrack showed a large number of
> > > connections in the SYN_SENT state.
> > > As is well known, if we attempt to connect to a non-existent port, th=
e
> > > system will respond with an RST and then delete the conntrack entry.
> > > However, when we frequently connect to non-existent ports, the
> > > conntrack entries are not deleted, eventually causing the nf_conntrac=
k
> > > table to fill up.
> >
> > Yes, what do you expect to happen?
> I understand that the conntrack entry should be deleted immediately
> after receiving the RST reply.

Then it probably hints that you do not receive RST for all your SYN packets=
.

Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DCB3728B7C7
	for <linux-kernel@vger.kernel.org>; Mon, 30 Jun 2025 13:12:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751289130; cv=none; b=B2TyGk96pxq70TQJP1Zroe6tGLawlS32SbwqdDH9iN7yl96WpbM11WiILwUZNyOfuSj5s6nPMhTua/3yijHZlsTKOpfj8ijYLncNguIR62T4r1sMJ1Zwc4svhdGXXXk3Yfcvg1oZk+9qocH7D9qTq2TPvRWBQN+MI6XLzEp7zNM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751289130; c=relaxed/simple;
	bh=kICfyUf7g+VjQXZDoFlxctXqW06H9TiroVcWuKRBfPg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=RbdTiWUG1XWDiClcJ+5s8S64eQQusL+EOkeXG27ZVx/OcOb1Briwfh8MQ33UF00nHXb4+iJ3NBOVSZr20ARqvzDuSBhznr5MnWzAPT5kWku6wy0Hhm3zZmCaGWemKdlXcPJ5LkLGOQTyEI6x3nDTfGVA8ZxtWBIQbZb+LQ2TQGw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=UXBEnYBd; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="UXBEnYBd"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BBF77C4CEF0
	for <linux-kernel@vger.kernel.org>; Mon, 30 Jun 2025 13:12:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1751289130;
	bh=kICfyUf7g+VjQXZDoFlxctXqW06H9TiroVcWuKRBfPg=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=UXBEnYBdTZXKq7U08kKvtCiA5A54jIkw2Q9K8AAurwP8AtLYSnNvbxNt9gfxb1ZB0
	 G7u5CrJOF1Ap9GBkJ8C+OFJ5iDq5aoXMd1SYYFsBfWPtR9WEWGOlGxYs5tJzH0fs0e
	 6Zyi1kY7+LQjmgeE275r403bQXQtCu34JMFMUQGVbOHjS4ngw30acWeiv8WbO8jmdr
	 zq/i5BjsFcR8DRW1RvP/q6BdeuqvFrEyDxlIgQIiFcJCGhHrkt4D5zEBVSiOZU7RDy
	 kK+eEGqSdwpnd/9F1jJaJeS6yMD6p2oEvJDcTJOrGgLa314lJctVPuk4vNkBV3L9+D
	 eISw1auLwyAxw==
Received: by mail-lf1-f41.google.com with SMTP id 2adb3069b0e04-5561c20e2d5so457220e87.0
        for <linux-kernel@vger.kernel.org>; Mon, 30 Jun 2025 06:12:10 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCWXYFgathLcz2/CHYDeY2s00WDaO9kfd+2MGieeKwT2+pVG8E0qZHULu1DtI4Liq283F1MX2mxWDnvH+DM=@vger.kernel.org
X-Gm-Message-State: AOJu0YzkMyWmNwGgWq8QYGkpu3SB7h7HzlDIgEHf8FzoKrR8PimXTRgz
	4UgRNJt337JUsoUcqDGh2/EqiWb+8QS9VCdLoWIM3oNAvn8Tosm5Z+74zcumWTl/+IuTM9IoklB
	gaYGorKRV9Q0uc30x8V8lRL9TcYEbjNc=
X-Google-Smtp-Source: AGHT+IGEVjATyQBWpC6GwiYUUrqRupGRjaXWr7DTk83gMsPal8sZisQ1vmQiz9ik8hYYNN/rbU475sLfMmLuJm/vqjs=
X-Received: by 2002:a05:6512:350b:b0:553:202e:a405 with SMTP id
 2adb3069b0e04-5550b74c278mr3970295e87.0.1751289129369; Mon, 30 Jun 2025
 06:12:09 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250513160056.7576-1-wen.yang@linux.dev> <20250515-magpie-of-ideal-pluck-c6e323@bergen>
 <3b09f8b7-579b-441b-8c0e-2dbab7ac1740@linux.dev>
In-Reply-To: <3b09f8b7-579b-441b-8c0e-2dbab7ac1740@linux.dev>
From: Masahiro Yamada <masahiroy@kernel.org>
Date: Mon, 30 Jun 2025 22:11:33 +0900
X-Gmail-Original-Message-ID: <CAK7LNARzAW8xQ_AV_a3J0fKDcvSCTDc7noeTXHrxuRZNJq88cA@mail.gmail.com>
X-Gm-Features: Ac12FXwUS6QAP3gSQmETWwEYdo--AzT7mGGAuXSlD4xV3FbrxLGDOj1TLILKiH0
Message-ID: <CAK7LNARzAW8xQ_AV_a3J0fKDcvSCTDc7noeTXHrxuRZNJq88cA@mail.gmail.com>
Subject: Re: [PATCH] scripts: headers_install: fix a false positive
To: Wen Yang <wen.yang@linux.dev>
Cc: Nicolas Schier <nicolas@fjasle.eu>, Andrew Morton <akpm@linux-foundation.org>, 
	Miguel Ojeda <ojeda@kernel.org>, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, May 17, 2025 at 12:45=E2=80=AFAM Wen Yang <wen.yang@linux.dev> wrot=
e:
>
>
>
> On 5/15/25 19:32, Nicolas Schier wrote:
> > On Wed, May 14, 2025 at 12:00:56AM +0800, Wen Yang wrote:
> >> The current implementation only handles C89 style comments (/*... */) =
in
> >> the code, and there are false positives for C99 style comments (//...)=
.
> >>
> >> This patch fixes this issue.
> >>
> >> Signed-off-by: Wen Yang <wen.yang@linux.dev>
> >> ---
> >>   scripts/headers_install.sh | 1 +
> >>   1 file changed, 1 insertion(+)
> >>
> >> diff --git a/scripts/headers_install.sh b/scripts/headers_install.sh
> >> index 6bbccb43f7e7..41722bcc8668 100755
> >> --- a/scripts/headers_install.sh
> >> +++ b/scripts/headers_install.sh
> >> @@ -44,6 +44,7 @@ scripts/unifdef -U__KERNEL__ -D__EXPORTED_HEADERS__ =
$TMPFILE > $OUTFILE
> >>   # Remove /* ... */ style comments, and find CONFIG_ references in co=
de
> >>   configs=3D$(sed -e '
> >>   :comment
> >> +    s://.*::
> >>      s:/\*[^*][^*]*:/*:
> >>      s:/\*\*\**\([^/]\):/*\1:
> >>      t comment
> >> --
> >> 2.25.1
> >
> > thanks.  The patch looks good to me, but I cannot find any false
> > positives.  Have you found any concrete?
> >
>
> Thanks. We have enhanced dmabuf on our SoC platform and modified the
> include/uapi/linux/dma-buf.h file, and then found this issue.

The SPDX License Identifier in UAPI headers use
/* ... */, and never C++ style comments.

In my understanding, the idea behind this is
UAPI headers follow more strict C.


--=20
Best Regards
Masahiro Yamada

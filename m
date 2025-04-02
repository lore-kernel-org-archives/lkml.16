Received: from mail-lj1-f172.google.com (mail-lj1-f172.google.com [209.85.208.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7287B367;
	Wed,  2 Apr 2025 13:59:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743602344; cv=none; b=YNG4+b0ByhQRQdDquEv40hgdtt8NQ64pZO6xlMHtjouqVbdHJOKHYa3+TBk/e2KUC34bBkuidpSL6QOXFauS5QWxK07jz9ZxlGo1pEd/VcQ1rFfv6J+4W/EqWONdkKdDiTTiHLJGW6M90ztqjyIUteXjw4rhx1Uca2n3riLbt0A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743602344; c=relaxed/simple;
	bh=vTMqK5JsGJkV3D9uwxiRrS81D76Lq1lchZmymzYuSgQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=p3Nhrm9QTTs9rnNUXnGwF8dNTM/k+FxvA1Y3/ifRl0P2XwAC0FtweGYvJnn3gmKv4OoIdRdGw1QAbkhJOd0aYcsLiVX5k+gCt7tgtW5OVVIusv2uJVn+wcYK6HBSmeuxX5r38TXwLiytkcrhOV7uuu7F5fPvLJVDDNcP9NbZ2j0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=i8tz5lF8; arc=none smtp.client-ip=209.85.208.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="i8tz5lF8"
Received: by mail-lj1-f172.google.com with SMTP id 38308e7fff4ca-30bfed67e08so68579891fa.2;
        Wed, 02 Apr 2025 06:59:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1743602341; x=1744207141; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vTMqK5JsGJkV3D9uwxiRrS81D76Lq1lchZmymzYuSgQ=;
        b=i8tz5lF8BiXzlz5YFY5MWXZCfPz60ra/Iz69MzG+wN9Y6BulyBgnl2ST3uTSkAaXwr
         x3hwChQM3L4pVJivcAP6KMSqAXwYUecxN/oTalq7hzE0zjXo+L/vMwPornaorkjhqF8l
         Wlt6Bme3N9D+h+BHlpRs5LcMOClmfs2rApmWuxqsdTp6t5ZyTd++QK7oLUK7ys1sIE6f
         hAxFrCVD212DI9UJCVE30Pu+eIIIYPHGXHqE+TcPOx6w7yUG1od3Zz6qvDEiYAA4GAmt
         f+7lUUGrJ3750QPyBjUpVzEWZ0wfb5K6QwRIUCTiSkSc+ga395xv6/A/faJz5BIVDcCD
         CFFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743602341; x=1744207141;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=vTMqK5JsGJkV3D9uwxiRrS81D76Lq1lchZmymzYuSgQ=;
        b=YUnEcb3vGuYeXg2q3zT0d2rwUL3fA6BMum1UoBZ4jzpu4ecCDVUyLRbyafafkDnpCz
         xoQGlVO23UCoD8zXizKJCdoE8R46PIUQ1SzMdIZS3boBMFlqeT2s5Hhi8su+D5ZzvVqE
         9JXmWyslTF/k6dsv7MOVCq0/CWqEz2uTBRg6dYxUShDqPwMT9CidgVfhjTQwGVI5cakw
         /rW3K+5je6qs0SVFvk4Ir+nEJkG+dhS8CTU1f1USmg7HTMa9g1AGy2cJ1cHWHpR1V6O7
         qvrgVdligStc/97zyaN9HJdKeeYh/znad+rCfSdPMkf5LBRL3TIlkO9D/3yUecoJG5gt
         5P+w==
X-Forwarded-Encrypted: i=1; AJvYcCWfIoKtBuhXCH7Cx3L2Pc6lL5nAUOtMimKkJtrKekLLgvW2VlUDkbROQD9FCgT4PQX8H183jB0nl8kILMQ=@vger.kernel.org, AJvYcCWtrhY8TPhZ4/NQ5qIbWVRU5w8G63ASoXeHSgpwXMTMVFSKONuOVq0G5ZxPHLk+E5aff3Jkdk4/Dq7Ci04Zwz4=@vger.kernel.org
X-Gm-Message-State: AOJu0YxbT9LsNbIBGJQD4xUcJj35jkFC6pDZusaq1foL7jLrvqTTs3EZ
	MdaKQLa7VyFIpAlGdsI6DRg45Xp0AkBspfGUmXLNAR8kF/s+Muxyfa/lqV29xfjQvFH08NSqUbH
	/fRhAvkfU1vni7hmUNC1Mi+Oe988=
X-Gm-Gg: ASbGncsnNVkVjKP5VFqZzA/6GM2AB0EdPEqMochkrTQDInScVfvlVEQsshuz6/7c6HX
	wRTdGHc6pvQybKpGVcs7YSyfQXXnimgPPFB80khG3PAD0xXYyFqJj/SOZQcDoGj8oxG1R85z91n
	CWbOYrBZ8W3tSkTE5fxcfRmlo7dqKSCMDdkF3Lk7ht1g==
X-Google-Smtp-Source: AGHT+IEoOP9OJacFp4ypS6GUG779N/1XqdaJI4YYpqIYC5vpdqMDP+fGMWlF4r2D8VUDYn6eHoqMl8exjta7+xc7RV0=
X-Received: by 2002:a05:651c:2203:b0:30c:3099:13d0 with SMTP id
 38308e7fff4ca-30de027899dmr64849571fa.21.1743602340379; Wed, 02 Apr 2025
 06:59:00 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250401221205.52381-1-ojeda@kernel.org> <D8VPGBN60E61.1Z48FQW6TL3A@proton.me>
 <CANiq72mdvnHvWbVNQbiXSRxd1xrF+A=v0RdJO74xeY3HyhRmcg@mail.gmail.com>
In-Reply-To: <CANiq72mdvnHvWbVNQbiXSRxd1xrF+A=v0RdJO74xeY3HyhRmcg@mail.gmail.com>
From: Tamir Duberstein <tamird@gmail.com>
Date: Wed, 2 Apr 2025 09:58:22 -0400
X-Gm-Features: AQ5f1Jq2gyAHyF-tCYUwI-tokOiFWHXkHJV1fpYwtQRaEhz50SkLmO1wNlDMOqA
Message-ID: <CAJ-ks9nAAcoJoFF+qNPbhsM32kOh9u+LGYUwFN_n9qqudB6YhA@mail.gmail.com>
Subject: Re: [PATCH] rust: clean Rust 1.86.0 new `clippy::needless_continue` cases
To: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Cc: Benno Lossin <benno.lossin@proton.me>, Miguel Ojeda <ojeda@kernel.org>, 
	Alex Gaynor <alex.gaynor@gmail.com>, Boqun Feng <boqun.feng@gmail.com>, 
	Gary Guo <gary@garyguo.net>, =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Andreas Hindborg <a.hindborg@kernel.org>, Alice Ryhl <aliceryhl@google.com>, 
	Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>, rust-for-linux@vger.kernel.org, 
	linux-kernel@vger.kernel.org, patches@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Apr 2, 2025 at 7:15=E2=80=AFAM Miguel Ojeda
<miguel.ojeda.sandonis@gmail.com> wrote:
>
> On Wed, Apr 2, 2025 at 1:53=E2=80=AFAM Benno Lossin <benno.lossin@proton.=
me> wrote:
> >
> > I'm not too sure about this change, if the loop is longer than one
> > screen, it makes a lot of sense to have a `continue` instead of `()`,
> > since one might not see that there is nothing after the `match`.
> >
> > I also think that an explicit `continue` is nicer from a expressability
> > standpoint. So I think we should keep them.
>
> Yeah, I feel similarly. It is sad because the lint did find other
> cases in the past that were useful.
>
> If nobody else cares about keeping this one enabled, then I will send
> the alternative patch. Hopefully we can re-enable it at some point in
> the future.

Rather than disabling globally, why not `#[expect]` these instances
with a reason?

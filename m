Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3285317A304;
	Wed, 16 Apr 2025 19:25:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744831551; cv=none; b=goXZN/eNKle8SJF0BhCDfy3kOLUlr1UM6DMk64re0BfwdeLyBvEQnVN7Q/eYuEV+Htz0LbyI1+Z/hmN84L2O74sobdtm16t14XnT3lcD33EFjmuQ6363RO8gxULWEUkb5rVLN50/UF/yqnri3/37NsIqj5oXJIYF5jjqaqCuEvw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744831551; c=relaxed/simple;
	bh=GoKF/LHpNhib2a1akfwq5UC5HXAUAFvsZueILxTSKdw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=JWoCOK3jyB/TU9xZgxDyywpBfv6VpbO48Ft2f2J+dkdhmwc6vXwewaCiIRqOg3pifLiwoMd2JS87mK8cxuogA7f2St0+L5myVUSR+rjoDIS1HzN1xYIlyYPN65K2AzSOCYoYG8MONybBNzM5OkLx5zOP1HoeokY3BXOplbbuSKc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=sKLbGIU+; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="sKLbGIU+"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A12B2C4CEE4;
	Wed, 16 Apr 2025 19:25:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744831550;
	bh=GoKF/LHpNhib2a1akfwq5UC5HXAUAFvsZueILxTSKdw=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=sKLbGIU+HO9oZU+O5p9XTmPx+Nqcai3OsVsKBiUp0z5zjXGCTlcI9vYM8cMDoNYWb
	 5qMKvsSGucyMcBNpnxubc95XB/wmy4ZiqWkRoc/6fS8HXEmT4fgCfmgF9O/tEBhBo8
	 at397kBMTIdPbsAVZt3Wqv0q9YU3R6VFhzMQTIYbi5e8dVPAa+l63MCVRH9pFNFHLl
	 BMQ2r/aPJUacA6zKOfU228AFH+4Fc3MxriRxuy2zvfho7ZqTUgiD513BNmxx/9Wz7f
	 Kzpw1dhOh/LM8ERdDbiIB91jMvHhPiV7n74jGk+lS3jQ1YIOdh49SGalirewopj5RA
	 murx2vyirJNGA==
Received: by mail-ej1-f47.google.com with SMTP id a640c23a62f3a-ac34257295dso1333767966b.2;
        Wed, 16 Apr 2025 12:25:50 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCWxGZ6wFUzH1KOT5RM0gXMrvj2ecwuRelug9wODkF2Wsy44c2FvZY5kRbzas5siTm0MS+5dfHIQsNMERTQ=@vger.kernel.org
X-Gm-Message-State: AOJu0YyfbhrNkG7wZYMUwFHUs7DnaRfzAZAB6xbhTjXN5VjOMGF37kid
	/7zzB8wW7JSFtbVbBnDq8zeo1Kx/CNhMmeyMYhGWyoLlPsp8rU1F28ZxvfAV5S351qrOmO4bg9/
	YiLA2S3RscZXx0T3toxpwtO5JqQ==
X-Google-Smtp-Source: AGHT+IFh1JR5Z0LAxnoYuZevCEEpxkJH9c1vzPj8jxuIXtqnUi8yKHEwDF59bxVh8xYkFd1igpWXehoXB7ESE8EBUos=
X-Received: by 2002:a17:907:720c:b0:ac7:4d45:f13e with SMTP id
 a640c23a62f3a-acb428d3a04mr335420066b.13.1744831549136; Wed, 16 Apr 2025
 12:25:49 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <CAL_Jsq++MbY=s5t1hmE0AhcmFA14t3fxLM1xPFZAA0ETX_ee-g@mail.gmail.com>
 <tencent_607C227A96060DD8EC83C78184305D264109@qq.com>
In-Reply-To: <tencent_607C227A96060DD8EC83C78184305D264109@qq.com>
From: Rob Herring <robh@kernel.org>
Date: Wed, 16 Apr 2025 14:25:37 -0500
X-Gmail-Original-Message-ID: <CAL_JsqK733Q9bbxC0Wz5uxyZ9m7bs+bci5kUJF9GJMv73-dO4w@mail.gmail.com>
X-Gm-Features: ATxdqUFF9-IUSq1djrMpuWjuhr9hIZbcSKeFY8qPTBYsU0Aj7DIvMGHJilsZfgc
Message-ID: <CAL_JsqK733Q9bbxC0Wz5uxyZ9m7bs+bci5kUJF9GJMv73-dO4w@mail.gmail.com>
Subject: Re: [PATCH] of: reserved-mem: Warn for missing initfn in __reservedmem_of_table
To: 1425075683@qq.com
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	m.szyprowski@samsung.com, saravanak@google.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Apr 15, 2025 at 9:02=E2=80=AFPM <1425075683@qq.com> wrote:
>
> > On Tue, Apr 15, 2025 at 9:16=E2=80=AFAM Liya Huang <1425075683@qq.com> =
wrote:
> > >
> > > For the data in __reservedmem_of_table, its function pointer initfn m=
ight
> > > be NULL. However, __reserved_mem_init_node() only considers non-NULL =
cases
> > > and ignores NULL function pointers.
> >
> > If initfn is NULL, there's no point to the entry and that's a bug.
> > Unless you have a build time check, there's no point to add this.
> >
> > Rob
>
> Thank you for your response. Based on your suggestion, I have made the
> modifications and used static_assert() to perform the check at compile
> time. The specific code is as follows. Could you please review whether
> this modification is reasonable? If it is acceptable, I will proceed with
> submitting the patch.
>
> I did not find any usage of static_assert() for null pointer checks in th=
e
> kernel code.

That's a bit strange, but the use of static_assert() is a bit new.

> Additionally, BUILD_BUG_ON() cannot be used globally.
>
> ---
> diff --git a/include/linux/of_reserved_mem.h b/include/linux/of_reserved_=
mem.h
> index e338282da652..87446ad2deb2 100644
> --- a/include/linux/of_reserved_mem.h
> +++ b/include/linux/of_reserved_mem.h
> @@ -29,6 +29,7 @@ typedef int (*reservedmem_of_init_fn)(struct reserved_m=
em *rmem);
>  #ifdef CONFIG_OF_RESERVED_MEM
>
>  #define RESERVEDMEM_OF_DECLARE(name, compat, init)                     \
> +       static_assert((init) !=3D NULL);  \
>         _OF_DECLARE(reservedmem, name, compat, init, reservedmem_of_init_=
fn)

I'm pretty sure we can apply this globally in _OF_DECLARE() as any
NULL init function would be useless. The special case is
CLK_OF_DECLARE which wraps the init function.

Rob

Received: from mail-lj1-f175.google.com (mail-lj1-f175.google.com [209.85.208.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 625C724A043
	for <linux-kernel@vger.kernel.org>; Tue, 15 Apr 2025 07:35:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744702530; cv=none; b=nNqPBtZk2aDHD4OJunlxm9QhaFHaFdCkwjNzSnD9+bOALoFWD0O0Amu02Vm2QYsVRFjPRoY3WgWmxij7ScGWi5SExnnIlZwvn0aEqA6a4c5FhPBYR6oMsei3pKw9yuiIyqjQ8/3JhuUzFuqK+9JhCeOq6Mztg7rRPPlzjWwPMgw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744702530; c=relaxed/simple;
	bh=/t01dfXvGRgfX4KTskLD9RHr8QjggEKBR5una7CkTdM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Wez+vb2JF8VSuW1CsFuriC5f7bKmg5hUuNGAzdo8WcJTPt39Tkl7cGrUNrGHaNCTiJJjw2it8u95REpwkCW4HGlagrQU16pstLhg5jlQnl+TALTvS43Wex4xfRUyAxuc1H5hvBrj53rAN80KUv5RUy7OiGtbIB0tzqy3MnaWIW8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=s+oo7O0h; arc=none smtp.client-ip=209.85.208.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="s+oo7O0h"
Received: by mail-lj1-f175.google.com with SMTP id 38308e7fff4ca-30db1bd3bddso51076941fa.3
        for <linux-kernel@vger.kernel.org>; Tue, 15 Apr 2025 00:35:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1744702526; x=1745307326; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Z5s8lHjULdMShwAF8jjer9y5ggl6mu2Z2yK+KvFB6hE=;
        b=s+oo7O0hziTMTn6ffzLugD78KNSlG1XVVmBSNq7/dA2+BW+COsqPeulYH1zmbHlyXD
         YRiFIof75U2YhtqwpQOc4yHyBTmuwwaNjI9STsEKbAuHlHbhGEJhGavHL6jwgqQ6K1Q8
         u4T5uVapy/DQM8ExQU4KQE5sFdt7QdIgLpAmVtIzavjMn4ci77v0VtHX2K8sl+obp34G
         GHgVk1E5oiRb59saVQLjCA2W8y5XWTmcG6bPqRVFHyJl28t+hBio6SXIB5BNOX+ienNf
         ntV0TX487Fw+Gngj+c9Y5JiENlGQRJ82XYkt+0FFvVvjEo/HefvdGyiHqPI7/GzadqRm
         liAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744702526; x=1745307326;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Z5s8lHjULdMShwAF8jjer9y5ggl6mu2Z2yK+KvFB6hE=;
        b=KAbrzPVz3wePQKbplRXKGzH55nGyoM1pqaNQq0oHNo6zJhZeuuHE8dGUApI4ZbpRDg
         szzeF6i/GPVbDO4y9Ewlv3w49icCImQKADKlAROZ4esdn5iBTaaw6IMKmfLAijZXZ3oY
         OWph2v1M7WZRWLvbiUEm1lG/K8x/9l+0MLtcaGWKpMUK+TTBeTH3bFvOxRP2fwirYue9
         5hDbWmT1Z08kikueeN7SHKQXDCYf6GwhUoq/NzdCBh1PsVMdIV8NlwistmgbmeZkVE6X
         7qJSPxZcEymu3/YThdySLA1VO6BHuAkyz+6NokCxIo9tUqhbQ9jZEt9L/xJT4HGmpXOQ
         u6rg==
X-Forwarded-Encrypted: i=1; AJvYcCV0/M6tnPgqI9TqBclYHDtFY/ZKEEyo1YdrjPT+DEBajP/dTBrUPrx+EyQejCJFak2/KUITBuKvoJckRF4=@vger.kernel.org
X-Gm-Message-State: AOJu0Yyx4t15rgbwjnhUhEsH114Ii+GDrksqVv5KZksfKN99qZXykvxM
	PG0S+F1TD4EieGtaWLzifec3JX3BOa7QPnXiKBcdBIZIsNLHDhLHcMp/w5UfWXTcdMHNNbzkT9c
	HuxfVTfIu9FCvwlN05LMqioXRYYpZLfbl1bJokg==
X-Gm-Gg: ASbGncvBJrzGSH/SqFrKOgFv/eKc7w76XaPBcrcn9nRvYPr13ptL5MLvZpdDwCK+CS2
	i5Rb8+RqKaD9+DGPDbcr+wWgnFN8PZAxBLWtHNTVPmeoPQ8QwFti+ar27u9SeXkB09t4Fyxw6Zt
	8PmQoV+gNGtPHbwp2cy1KHc77I6AbWzsUq
X-Google-Smtp-Source: AGHT+IF/f3ma4C5o9c0efnyvduCTab9wDDK72+7lhXFZsmhgzu8nGsMsG6D4c0qe2PhRQIiyrICHnRVYY1XaZjetoDw=
X-Received: by 2002:a05:651c:30c1:b0:30d:b3d1:a71 with SMTP id
 38308e7fff4ca-31049a80682mr54317271fa.33.1744702526493; Tue, 15 Apr 2025
 00:35:26 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250412-03-k1-gpio-v8-0-1c6862d272ec@gentoo.org> <20250415023234-GYA29961@gentoo>
In-Reply-To: <20250415023234-GYA29961@gentoo>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Tue, 15 Apr 2025 09:35:15 +0200
X-Gm-Features: ATxdqUFrvoN3oToav7nR6RzJi6WKzvpJz5pszWK5ULoM2MOJjET7tU5z2QtEKvY
Message-ID: <CACRpkdZ6A0xORRQBnNNPFcNHg3xL=U3_xAcePmaDN3_ZYMzsaA@mail.gmail.com>
Subject: Re: [PATCH v8 0/5] riscv: spacemit: add gpio support for K1 SoC
To: Yixun Lan <dlan@gentoo.org>
Cc: Bartosz Golaszewski <brgl@bgdev.pl>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Conor Dooley <conor@kernel.org>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Alex Elder <elder@riscstar.com>, Yangyu Chen <cyy@cyyself.name>, 
	Jisheng Zhang <jszhang@kernel.org>, Jesse Taube <mr.bossman075@gmail.com>, 
	Inochi Amaoto <inochiama@outlook.com>, Icenowy Zheng <uwu@icenowy.me>, 
	Meng Zhang <zhangmeng.kevin@linux.spacemit.com>, linux-gpio@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-riscv@lists.infradead.org, spacemit@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Apr 15, 2025 at 4:32=E2=80=AFAM Yixun Lan <dlan@gentoo.org> wrote:

> Hi Bartosz,
>   I think this version is good to go, if you agree,
> can you take patch [1,2 / 5] through gpio tree?

I agree with this, it's the final piece making use of all the nice
infrastructure we put in for threecell GPIO and threecell
IRQ so let's merge patches 1+2!

Yours,
Linus Walleij

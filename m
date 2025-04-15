Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 44819535D8;
	Tue, 15 Apr 2025 14:52:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744728733; cv=none; b=uuqB8mWF7vFKRWc1YwCJeTQePYf50zSqBew7I5S82mEnzYcBAIOzkEk6STF76RgNvvuJm7vrRl05o+fK2BIVzGqQOvOm2NuVsAbU4a5yoroKMuMwA1DUzzSctipVgf5Es4voI/8sM0nwyALdqFtX12tJ675zRvEFCnHayT9UBeQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744728733; c=relaxed/simple;
	bh=snCmSC3+XllzjenNJuiYQQLOeMF1tUGdj1sBr7T4mIQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=HKcxCfNwn40rpiQ8mokhTxGfFkDHfPQqWeWP6py3zcGDaPxO9C2P0qq5yfXEZgaW4xr6fAvxWoQSVWQbRZ8PwOIotM2UwfoUFO8enqqHlGz5bWc80vDUILpSyp3Nc1eQaaCZSjqIs5UVGJxuTJwDlZey39tyBZIcZCf2Y4J14f0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Uf5NBddi; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Uf5NBddi"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B893CC4CEEE;
	Tue, 15 Apr 2025 14:52:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744728732;
	bh=snCmSC3+XllzjenNJuiYQQLOeMF1tUGdj1sBr7T4mIQ=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=Uf5NBddiATB3RryAFZESQswmTpJLcveWI1tafe6mo8n5v44sRHJIVPg9AJL2rSpWe
	 uO3Xjg0NLjXQ9eR1QAkwV3hpkI3TNZO3gzvZwTc1ZZWqf2D0KUJNoJ8OByN/PYG1Hm
	 q5/lZl0aNgH4dqFYVGsp7Pudi3GU2iGLYmyD7Vay09MmQs4Ojb9kPqGvpj384rmT1S
	 JUfpt+jcK7CjIGx3Y9f2gpc/TcCongTNvF7CqHsXLv871FPBT0SltXp3u+b1i5Z7wn
	 NZZmFem0s6HuFfwrQdGW6Sci6ZkiG1I0kxtbIFqv4uXD+2IN/W+9aNLtyykjFb28cd
	 MHZBATTF4o75A==
Received: by mail-ed1-f49.google.com with SMTP id 4fb4d7f45d1cf-5e5deb6482cso12404179a12.1;
        Tue, 15 Apr 2025 07:52:12 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCV74UHwbZfckA5/N05HacBCreBkO0XsBm5ENkye2Ss03i1IFMVq/iuYBoPbJaa4K0De7ODWFlu34DeMU5UP@vger.kernel.org, AJvYcCVeYknn6UIRy8UjN8WQWrw0rXhf8d/W7aPoVYQtGPWMACBw6NORYoEUgJbeFopakLxt2T94xhWVFYuZ@vger.kernel.org
X-Gm-Message-State: AOJu0Yy+kYnGPBJf5MKpdO8aCPW4zfXKwhZEgNRZXBNlRmzi6XAZECAu
	D91ZqZa9tUoEYUQrCdyfK6+qohQGDsrlUBQHy4LTTnEXAleHmGiezuCG766GWCCweJ5e8qpu2s8
	xGcTkhjXc3QEYTu3acu4dDAG4lw==
X-Google-Smtp-Source: AGHT+IElNRejW7H0MvMKqVJd83SYHEviVdbU4tEY6r816KeYkX6joN56eHCYOKnpTL5DFaiKBdwIU12luYEJVqfMFTA=
X-Received: by 2002:a05:6402:210f:b0:5ec:8aeb:812a with SMTP id
 4fb4d7f45d1cf-5f45dff3335mr3104516a12.14.1744728731365; Tue, 15 Apr 2025
 07:52:11 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <tencent_FFC8E7A5A76050982D28F811C81F936D9205@qq.com>
In-Reply-To: <tencent_FFC8E7A5A76050982D28F811C81F936D9205@qq.com>
From: Rob Herring <robh@kernel.org>
Date: Tue, 15 Apr 2025 09:51:59 -0500
X-Gmail-Original-Message-ID: <CAL_Jsq++MbY=s5t1hmE0AhcmFA14t3fxLM1xPFZAA0ETX_ee-g@mail.gmail.com>
X-Gm-Features: ATxdqUG4c4EClp3gS0m6AEGJjtYgevxH2MgIUqsCDzJiOk0kU1YmnC23zzTKW2c
Message-ID: <CAL_Jsq++MbY=s5t1hmE0AhcmFA14t3fxLM1xPFZAA0ETX_ee-g@mail.gmail.com>
Subject: Re: [PATCH] of: reserved-mem: Warn for missing initfn in __reservedmem_of_table
To: Liya Huang <1425075683@qq.com>
Cc: Saravana Kannan <saravanak@google.com>, Marek Szyprowski <m.szyprowski@samsung.com>, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Apr 15, 2025 at 9:16=E2=80=AFAM Liya Huang <1425075683@qq.com> wrot=
e:
>
> For the data in __reservedmem_of_table, its function pointer initfn might
> be NULL. However, __reserved_mem_init_node() only considers non-NULL case=
s
> and ignores NULL function pointers.

If initfn is NULL, there's no point to the entry and that's a bug.
Unless you have a build time check, there's no point to add this.

Rob

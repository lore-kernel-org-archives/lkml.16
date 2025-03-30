Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D21D418DF6D
	for <linux-kernel@vger.kernel.org>; Sun, 30 Mar 2025 08:40:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743324022; cv=none; b=ktEIPQsGgs18aaA50G2fW7bBVTcXynvOQadbHDIbyu0FznZvUS6oKgpqeQejwVAk7LwfaOC3bJSRs1yaDlDr9l7g5YwoqgM2qkITWMGO53+IcHg5wa8BvckoHd9n2RWeleuhnD46Uq11KrbqGDiFYa/C2eASU/kfvR0RDEXYFb0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743324022; c=relaxed/simple;
	bh=ca5Lq/0EQ7jPAb3oWTyli15DsYson7jaU3ejVDyRXHw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=byX1ktT5enqWBnKKWCHBHGkw3o/7h0jvCiG9sLi+BYGD++DNuwWiKmPMz5ET9yC/TAzdXVf8v1GkUd1hmvh+1z/ShtQBnvsaAg27dlTn9sroNRgnOdEBTeWJpntoTqMuY4DATYI2Hmszg8nw3cSSVdzR8lapLZOi/RDuKjDPzzo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=XKMgljRK; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="XKMgljRK"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 64CDEC4CEE8
	for <linux-kernel@vger.kernel.org>; Sun, 30 Mar 2025 08:40:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1743324022;
	bh=ca5Lq/0EQ7jPAb3oWTyli15DsYson7jaU3ejVDyRXHw=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=XKMgljRKvL4AO1eX36ymWzy3P0jjfHeIfdZu/+uYDZOcsGsTs4KllnR7ZJeShfZIm
	 ANW61QQWKqt4ACCZkYejxaYxll+SKWaFWkR3PemovCK3m8i56supLX4RIoMhs8nd/b
	 hU80tK3ApvjKAJyYgt1mNv7RQIOCARD3GOeThIvNFzIBNmFFj6q7YwfkJH7hwtX0+p
	 OeNu1tgENzJPeb47Cw7QTGgvA84cjW7W+5a8oGuRIx4YX+B+wQlRxc0ktCRHBqyKmu
	 GAjDiNOG65ynzkbIX2X5c6JlheZVN3YIHiwpTzMr0SmQnUQxcfRNQefQpel+ef3PA4
	 0GBb0buthwSjQ==
Received: by mail-ej1-f49.google.com with SMTP id a640c23a62f3a-ac6e8cf9132so619129966b.2
        for <linux-kernel@vger.kernel.org>; Sun, 30 Mar 2025 01:40:22 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCUatASz9RYhNWUmFT6cQrutSRgt3MpotHbCBSHx9jqjO8lqfz5wG4CPeXqXI86yHEZh3WbNkwb3Cf9IS70=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx4+1CL9qgoDngTw/7SXIc7LluiWFYjP8Bv+hWuKM8LcYCWvDB0
	3v0S8G2rht02002Ddrp3oPw0cYCdKcGQbF8zU8X2m52JXK0KRpIXI2LexNPsWTZZV2zapl1AklW
	hQD7XKxO9NfJpKMQu9phdR3obapA=
X-Google-Smtp-Source: AGHT+IEaTL7KP2VLk2bwtDA9C4Ekdb7n8ZwK058Y6N9KwEcNBMb5l8HLNp2UJfs8Vk9cgMj+oA5ubRu6EVYSnxM88Ys=
X-Received: by 2002:a17:907:a08a:b0:ac3:cff:80f1 with SMTP id
 a640c23a62f3a-ac738c880d3mr413105666b.54.1743324020941; Sun, 30 Mar 2025
 01:40:20 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <CAAhV-H5T3DLFfzPg4Zgzn7JbzqoNZdYn5_F06QNHS230xq-1MA@mail.gmail.com>
 <tencent_928F84F5CCDFC9B34B7BCACF5CA00FED5006@qq.com>
In-Reply-To: <tencent_928F84F5CCDFC9B34B7BCACF5CA00FED5006@qq.com>
From: Huacai Chen <chenhuacai@kernel.org>
Date: Sun, 30 Mar 2025 16:40:09 +0800
X-Gmail-Original-Message-ID: <CAAhV-H4mAHixEZOgoYb3v1ELMW0=xUJwsfmR_DG5G3i7QTo=3A@mail.gmail.com>
X-Gm-Features: AQ5f1JplMwHWAOKASkzCgYlRsRXZPm7krKQyvbHM_XbTUYWI8r1eDh3a1GeUN_s
Message-ID: <CAAhV-H4mAHixEZOgoYb3v1ELMW0=xUJwsfmR_DG5G3i7QTo=3A@mail.gmail.com>
Subject: Re: Re: [PATCH] LoongArch: Kconfig: Fix help text of CMDLINE_EXTEND
To: =?UTF-8?B?6LCi6Ie06YKmIChYSUUgWmhpYmFuZyk=?= <Yeking@red54.com>
Cc: guoren@kernel.org, jiaxun.yang@flygoat.com, kernel@xen0n.name, 
	linux-kernel@vger.kernel.org, loongarch@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Mar 29, 2025 at 5:45=E2=80=AFPM =E8=B0=A2=E8=87=B4=E9=82=A6 (XIE Zh=
ibang) <Yeking@red54.com> wrote:
>
> Hi, Huacai,
>
> > How about replace "to the built-in command line" with "with the
> > built-in command line" and keep others unchanged?
> It seems that the use of the preposition "with" does not conform to the r=
egular
> collocation of "append" and may lead to ambiguity.
> You can consult an LLM such as DeepSeek, Qwen, or ChatGPT.
OK, I applied but change the title to "LoongArch: Fix help text of
CMDLINE_EXTEND in Kconfig", thanks.

Huacai

>
> Zhibang
>

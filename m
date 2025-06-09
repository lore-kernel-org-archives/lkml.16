Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 770A9194C75
	for <linux-kernel@vger.kernel.org>; Mon,  9 Jun 2025 04:31:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749443519; cv=none; b=Xac9niGVEBwG/diZ9t/8Oxi9bTwfVz5tJQ9d9thOxvJnYHSH0AxDzevYOeyxMUwMQzU08Ms8D+GVOHhdLRg58GlHaBwy5M8YEoDSenhQDpyKQ394b7vqkj+cqTj0U3ZUvLopCBYqWoCAQZKPREGztKPQNnkAXvwwubsgDredJd0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749443519; c=relaxed/simple;
	bh=AFjIMMuomt4wCKUVw0eh/280n2j/pJGyBO9kzI4Mr7k=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=s0SRW55p6A2ueeUh+nKF0iE7KjdoYAE37PJLfMFaioHDif2fi9/LL6SG/dOPPCsICndyyZCUpuqe4togy9GxaiXOIKPwTJOeH5Jcqs0dbkt/ZKaWMxBRZ2gLwPu7+//IwMWYN+YeQ3XejG822RkFpLEblfk+U9Swau+6UiSOEec=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=JW0DlDvn; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="JW0DlDvn"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EDCA6C4CEF2
	for <linux-kernel@vger.kernel.org>; Mon,  9 Jun 2025 04:31:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1749443519;
	bh=AFjIMMuomt4wCKUVw0eh/280n2j/pJGyBO9kzI4Mr7k=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=JW0DlDvnzQcajP4jjgaJs5hUKwexjtMF102HDweoy72l3kxnILa/D+tMz/cSQlQ57
	 O1nj1oI76twFSlnoCyZDVP8gjO6z+ELPmU1QkUkjKqS7PAcc9q+LVLsB5fWRCtfZF4
	 TmteFlTTatbBEizC6aS7RrAwapudvdlH3A+TKG2FculG6jsKJOJ9HacC3vl6+JIIVs
	 PwPkThg81mRkimNXvkx6On8Q/qID98RVXKyWlqxTqiPJwd5Pn5MFRcEyYVDoqusl1D
	 zzeBEQqU+zvZ0JEj4+uCNG3hna7Ds3ohs70lIdfOeWMe9CChdyYIW+bvuvBR2ZsZZ4
	 vIVkREi0l5NQw==
Received: by mail-lf1-f53.google.com with SMTP id 2adb3069b0e04-55342bca34eso3765340e87.2
        for <linux-kernel@vger.kernel.org>; Sun, 08 Jun 2025 21:31:58 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCVaMgLB3Jq6raSNIz9D7sLck3Yr8AWpsfJHdynne4PcF1trLJGA1xIKu2qokflvkIasxoKJj+kwmkUvTm4=@vger.kernel.org
X-Gm-Message-State: AOJu0YwO901pep1k6Lf1xRI9iZemT9pbMiei1VwADor+x3nqa0pj0imi
	v12dyu+bGAbFtyonVfjPpWLXtPOcpbMAfju3GmtqkxZA5WnSXZfE0D9pweFl+8gedM6g7/7mbVz
	wqerog6IUABkA1DZ50+wCOBxXBU724QQ=
X-Google-Smtp-Source: AGHT+IFxpU9h9vD+7+ej+rM8HurQ8p5BN3Eg3FHPZV+4WzLJl/wTSGT3OGmNsQs+kraXQvn/FjpYTTJeBoMFKa+XoLM=
X-Received: by 2002:a05:6512:3e0f:b0:553:252f:aded with SMTP id
 2adb3069b0e04-55366bd2438mr2572503e87.6.1749443517484; Sun, 08 Jun 2025
 21:31:57 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250607102005.1965409-1-masahiroy@kernel.org> <875xh5wx0f.fsf@mpe.ellerman.id.au>
In-Reply-To: <875xh5wx0f.fsf@mpe.ellerman.id.au>
From: Masahiro Yamada <masahiroy@kernel.org>
Date: Mon, 9 Jun 2025 13:31:20 +0900
X-Gmail-Original-Message-ID: <CAK7LNAQvDJ5-bywrxPoD4hkQp22r0kq_feHJu-S94yOR07jmQw@mail.gmail.com>
X-Gm-Features: AX0GCFtJ6Wfh0kBbQm_-oWzZtVI6SKBm2c6RqpLJ8pPh51aAiKhji_o2fYREqtY
Message-ID: <CAK7LNAQvDJ5-bywrxPoD4hkQp22r0kq_feHJu-S94yOR07jmQw@mail.gmail.com>
Subject: Re: [PATCH] powerpc: unify two CONFIG_POWERPC64_CPU entries in the
 same choice block
To: Michael Ellerman <mpe@ellerman.id.au>
Cc: Madhavan Srinivasan <maddy@linux.ibm.com>, Nicholas Piggin <npiggin@gmail.com>, 
	Christophe Leroy <christophe.leroy@csgroup.eu>, Naveen N Rao <naveen@kernel.org>, 
	linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Jun 9, 2025 at 9:59=E2=80=AFAM Michael Ellerman <mpe@ellerman.id.au=
> wrote:
>
> Masahiro Yamada <masahiroy@kernel.org> writes:
> > There are two CONFIG_POWERPC64_CPU entries in the "CPU selection"
> > choice block.
> >
> > I guess the intent is to display a different prompt depending on
> > CPU_LITTLE_ENDIAN: "Generic (POWER5 and PowerPC 970 and above)" for big
> > endian, and "Generic (POWER8 and above)" for little endian.
>
> Yeah.
>
> > I stumbled on this tricky use case, and worked around it on Kconfig wit=
h
> > commit 4d46b5b623e0 ("kconfig: fix infinite loop in sym_calc_choice()")=
.
> > However, I doubt that supporting multiple entries with the same symbol
> > in a choice block is worth the complexity - this is the only such case
> > in the kernel tree.
> >
> > This commit merges the two entries. Once this cleanup is accepted in
> > the powerpc subsystem, I will proceed to refactor the Kconfig parser.
>
> OK. Sorry for the trouble.
>
> It could be split into two symbols to keep the separate prompts, but it's
> probably not worth the trouble.
>
> Acked-by: Michael Ellerman <mpe@ellerman.id.au> (powerpc)

No rush for this patch.
Please take it to your ppc tree.
Thank you.


Best Regards
Masahiro Yamada

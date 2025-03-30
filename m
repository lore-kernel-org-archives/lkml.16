Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com [209.85.214.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 25FA54207F;
	Sun, 30 Mar 2025 15:41:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743349276; cv=none; b=qNdYJ6K2jy4khn42RyZvW9jsAHY1n7WyJ9AihSIg6f4rB0WVVPu1fuziZRSek2I/p62xnn1lt0d3jZyOz/FqPkBMCcAFI3QUmpkMpZJkxMANKZD7WK2xlRPE6YBvGE7Fkp2d+Mo1vgg42djouQWA32/qUV/H6OCVzmP9lLpa23Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743349276; c=relaxed/simple;
	bh=jngc2KNcY7N13o+oStS7JZtPmi/K0V0y0+D/jnwY45Y=;
	h=Mime-Version:Content-Type:Date:Message-Id:Cc:Subject:From:To:
	 References:In-Reply-To; b=qjsr+PKMomjrvMCbZqnon5W1ydMNz/eF9+jf5jddRMTXK02DonQ0iZSmiXi3IWCURlJJSfdeJpdpPNDcWlX1gkSWpVJK99sKNiBMn0CHQArgAOvu3kW3qiCya4Fb1OXIC/A2iY0/qafrSymdc8UtrFcBmKKoC/r1JbX39TRvKRk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=GsnhZ/5p; arc=none smtp.client-ip=209.85.214.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="GsnhZ/5p"
Received: by mail-pl1-f182.google.com with SMTP id d9443c01a7336-223a7065ff8so48400565ad.0;
        Sun, 30 Mar 2025 08:41:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1743349274; x=1743954074; darn=vger.kernel.org;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jngc2KNcY7N13o+oStS7JZtPmi/K0V0y0+D/jnwY45Y=;
        b=GsnhZ/5phj9Qf2RsSOJc8n+feEV6RCnDao5D07EKaeNLq5I4bJGMLPvRXPIk8Hc/hV
         PblLL1H9mowPT2dcm1hUW2M2wEnTy10emu//SUMLpWMkRat7aP7SIf71/RAEze6hh5rE
         3tzmw6/6LvXBHYyNY4RiJCLR8a+c/FyMbHkrWjfQpB5ywztIUREo/ciGdfuIrzm9zOCV
         w/zCRYHkEZ1amBieudzX0OaDaWryEYK5eStBfdui7aSgrWreSj0eIJery/mA5otfNS0m
         MpIW3zbkMoHHT1FumOfWxjADW6JI8e3L+xySd5msZFrleO5+iAGl/HfIAgwesKNPCK7S
         gisQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743349274; x=1743954074;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=jngc2KNcY7N13o+oStS7JZtPmi/K0V0y0+D/jnwY45Y=;
        b=Y/P9n/DFaMqN/5duQXESkkklxRpA/0lDmQxNNK6xj9I5LsQav+Z6Y4kP1bopGWikCe
         GB4YdLnu0CaugnnQYxL+D6Av5dWWrA49z2v5I4RJ+B0rRVembpg93YGuR1vRn5AUegyJ
         WrOXklNg7CsAf7cpPGLOEdiCdlZN2EiZ9ixiXMVJd2RVCDJZFTtoaRfV7S8bS8YefW5p
         PNHSGO1Q24rIW5zaljVNsEMJSMdo+3davw65PchD89DDUtPddGlJmR9VPyRuLf3OuraN
         89+oY62cjwwheHd9Xn7Fp0EWoDQ5MGjx8MRUUb4Lw79M+fCxJd3AXsRRLOd8pMKA2SR0
         APAQ==
X-Forwarded-Encrypted: i=1; AJvYcCVv/b/iYE4Sle0yOgTLbqNaa1rNOZu1+QvbY7jwES8XRgheAk/mAXftjmc1ANpMdTeYZiPEvgWuvcvxrsA=@vger.kernel.org, AJvYcCX1aGBGNT9DRqySMw2sy7Mg0+8py9S6hm6Rrzwf5axglNxaqj0dj3MmgAZaGIf8aTfz8MC5aa5uuwdaF92aOAvP/MoeqQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Yzzocd3IVQCEcXzU9tKSlfzVHHUU6qOYchMgWPHM0JCZ6oa7rr6
	QGmk7IWFp6mRR8ZBocThSYqVh5AblFMBSddG9wr/3psVDklPVgkbMRuDsg==
X-Gm-Gg: ASbGnctUa4aZBV/b6cfcMmygEgtxEim/YN1ooeZwrGy1+88umlenGCFp3SHDibwB5kw
	zHLJ3cRgWXcg06WRvz/yCl7tPMUqgAYTpipWDbYByhWRfXgfX4SWLNBMostJ1EviW8zapcZxf2q
	3VN4e4rwzRTxW34hrjxQGuBNLuqywR7J2MARjebPfiIsQP9/Rg4wZzf6EbnZiZNZ9UAQaN2Yc4U
	/V8MlB88YkbuK2UajvrNzJMJ/0tESRrCi4C9sMCSg4NNCJh1Lj/JLe87hTAFUtMpqbxn/uX6LpA
	Iyw8Xpx7lEWM/LhY9QqVlUwWWEHDwag+kAoOrA==
X-Google-Smtp-Source: AGHT+IFXLQuQHYykk7MLl78LXCntqt8swyAiHrIVAIyPQoLnmVvJdwkzlqdRH6dAZVAYmTPU54+9TQ==
X-Received: by 2002:a05:6a20:2d27:b0:1fd:f8eb:d232 with SMTP id adf61e73a8af0-2009f644c2cmr10964937637.24.1743349274434;
        Sun, 30 Mar 2025 08:41:14 -0700 (PDT)
Received: from localhost ([181.91.133.137])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-af93ba10871sm4132057a12.73.2025.03.30.08.41.12
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 30 Mar 2025 08:41:14 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Sun, 30 Mar 2025 12:41:11 -0300
Message-Id: <D8TPQMU8LMXF.71ASYXE4U0C8@gmail.com>
Cc: <hmh@hmh.eng.br>, <ibm-acpi-devel@lists.sourceforge.net>,
 <platform-driver-x86@vger.kernel.org>, "Linux Kernel Mailing List"
 <linux-kernel@vger.kernel.org>
Subject: Re: Kernel Null Pointer Dereference on Fedora with thinkpad_acpi
From: "Kurt Borja" <kuurtb@gmail.com>
To: "Damian Tometzki" <damian@riscv-rocks.de>
X-Mailer: aerc 0.20.1-0-g2ecb8770224a
References: <CAL=B37kdL1orSQZD2A3skDOevRXBzF__cJJgY_GFh9LZO3FMsw@mail.gmail.com> <D8TDEP8ZEYE6.24AVWSGXURB4I@gmail.com> <CAL=B37ko7Zyr6gJxYTvsFKsfXKNTPw80UvjNgbQ+B6EZ9GGfaw@mail.gmail.com> <D8TEDS91VAGU.1UVZWWWWMRRNG@gmail.com> <CAL=B37nDNmkNo46tSfH-B7a+Uhex2LqhkbhJ7pjU9zrv+j3wug@mail.gmail.com>
In-Reply-To: <CAL=B37nDNmkNo46tSfH-B7a+Uhex2LqhkbhJ7pjU9zrv+j3wug@mail.gmail.com>

On Sun Mar 30, 2025 at 7:16 AM -03, Damian Tometzki wrote:
> Hello Kurt,
> hello together,
>
> I successfully tested the patch on my ThinkPad X1. System boots
> normally without errors.
>
> Tested-by: Damian Tometzki <damian@riscv-rocks.de>
>
> Best regards
> Damian

Thanks a lot for reporting and testing! The fix has been submitted now.

--=20
 ~ Kurt

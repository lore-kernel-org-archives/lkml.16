Received: from mail-il1-f181.google.com (mail-il1-f181.google.com [209.85.166.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C1C797DA73
	for <linux-kernel@vger.kernel.org>; Thu, 22 May 2025 16:21:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747930875; cv=none; b=jzvG806U6C0bMSloHBWGTLRWFH0I9CaxaH6Xg295EsbEaHWgAV9rE0JynssnDfRZGU/jDt3C8iEK5fMt/x2TuTjl0WT39DJsdph046gWSxRFLf9Q0gLDD5Ik9xWlSmw05U47FUvJwxoCTG3DCMVgGwgzA7xxNOV6feFRPdZYL20=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747930875; c=relaxed/simple;
	bh=rrLDAIKiEK4nCi+9i4gqRmBlWWl8TS9ByU/6a1reG7A=;
	h=Mime-Version:Content-Type:Date:Message-Id:Subject:From:To:Cc:
	 References:In-Reply-To; b=d0SX3JWUFO5eRLigEAywJh0Rgqfg0F1z8tWbcBX2VplMwL0Ivaq5/q0g+GVWCbuLD4HzqUfNxrj8yp5vFp/TqlsGCLLWQnLkms99RS1/gqrg1lTo32ZFzLr8CwqTta4dmAI8c6WWp8onIiryBM89mITWxFEaJj0O7ywIJbleVWI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=brighamcampbell.com; spf=pass smtp.mailfrom=brighamcampbell.com; dkim=fail (0-bit key) header.d=brighamcampbell.com header.i=@brighamcampbell.com header.b=kjJRtSdx reason="key not found in DNS"; arc=none smtp.client-ip=209.85.166.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=brighamcampbell.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=brighamcampbell.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="key not found in DNS" (0-bit key) header.d=brighamcampbell.com header.i=@brighamcampbell.com header.b="kjJRtSdx"
Received: by mail-il1-f181.google.com with SMTP id e9e14a558f8ab-3d6d6d82633so25826095ab.0
        for <linux-kernel@vger.kernel.org>; Thu, 22 May 2025 09:21:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=brighamcampbell.com; s=google; t=1747930873; x=1748535673; darn=vger.kernel.org;
        h=in-reply-to:references:cc:to:from:subject:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rrLDAIKiEK4nCi+9i4gqRmBlWWl8TS9ByU/6a1reG7A=;
        b=kjJRtSdxbbKx6m7257Q1Yf5MyDqQiy1gVp6Ghey6vSDA6bxJRB/Yf4rh1yDIOYmr3z
         quBh8qkb7oMSy5KKqNvva8I8kjRXOXwDaTMqLaAg/g0onePypucRj5qqapQI7jPO4eqM
         PTjh57Jw5JNMPsv4KCoqrFxEw1F7GWYSCRJJ41lgDpAub9+v/IN5TztiFp95o7SLLsNV
         gA6Zc6CdTT3IoGJ1Lvh4rYGbOwfnOiGxHshhwINqy3KmE+01nxw1MoMcj+jl4Xfoxud1
         EyEh6MQVuvCRYjB+uoINWEn295outnc+SUgy1jNdi8gqu9OKA3HZR1PUMxmaWmoVlfXA
         y+zQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747930873; x=1748535673;
        h=in-reply-to:references:cc:to:from:subject:message-id:date
         :content-transfer-encoding:mime-version:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=rrLDAIKiEK4nCi+9i4gqRmBlWWl8TS9ByU/6a1reG7A=;
        b=DSUQVOQeEzM9RFizzxFZdunsobnb6+QlP5O+nqvMtrXoKgmbmm9n1a88J6ffEJEuqJ
         QQVpYnR3BnRXE+0krtsk892XzSlEd4ukagj9MH7ydR1ACAQzwgjkgvAPhu4+5ET83JhB
         qYXIfmCtkN/AYuSMdKJc/DAzFGYz5H9HyFrM/FxAitOC6QtG8K10XDFkIpU7Ny15Kb49
         YCqsk5IJgiiExax2j4wCfykqTB1r0gI9jz1QaeMq5LY7kB8NEIUBRu/tVP91ZPKF49lq
         B6wEVVt7a0VIFWxcQeapE3ttjzPgqlFqKuJVaD3j4M3jKTF5j7e8h7nwgpa5lDZj8lhU
         SZxQ==
X-Forwarded-Encrypted: i=1; AJvYcCU/HY/mEmJxzjZcbcQ5XBAe0c7wgsp3Squ8iIK5fJ5oXCIYyjxJUHg+F1Yb+uYTU66Ckqba0cKgSoqdnFo=@vger.kernel.org
X-Gm-Message-State: AOJu0YxCt61o5GjaR7+LOo4AFlPlnQzuXqvQpHJCjrc6QQZ41ykD4JqQ
	yIY4X9mavpNrWs2FEtygQJfhfxYcp+QUAi49I4w2h7SJNa5z7txmyRgqH3wDkCn5gorfHvnuX5X
	JOjvoPwHIIw==
X-Gm-Gg: ASbGncvqRnFJDd5lpURNFMi9Af35SP+65CLupq4Xj5S1BemPU48Deya7UXMp9B5gdm0
	7LieS1a8M08FiQCObHhOBgUrIUJDjxvgOMWsmbKaEVrywTXviHL8ZT6IlJcRUqngl3N+hPgvHYK
	mhlCTReXmYl0n0gZz0fJkd1n82g1HUgTIQ5/OwaScQtf6De0GWDffcClsK9IQ4Bd3x0070KoJBR
	POzq6qgYdqrCKN8KouqMmMmHhiZb8NkGEP3hHMykYsRmvQPZfgEp8F6jZQn5vKUrY7bqfwJMJJG
	xS6iKrutHCKPJ0LPJWAB+lnKbQAeP+R/W3Rn8ThdIKEJjN6L
X-Google-Smtp-Source: AGHT+IHOQ0SWVebfgDZDKmRx+6jWi05MfuX7gwZSb++7o+5qstcoX0pcP1SvRwbgMuT4PSBEfZtP+A==
X-Received: by 2002:a05:6e02:743:b0:3dc:8c4e:2b8b with SMTP id e9e14a558f8ab-3dc8c4e2c10mr39021205ab.8.1747930872568;
        Thu, 22 May 2025 09:21:12 -0700 (PDT)
Received: from localhost ([64.71.154.6])
        by smtp.gmail.com with ESMTPSA id e9e14a558f8ab-3dc89bfeee0sm6988515ab.70.2025.05.22.09.21.10
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 22 May 2025 09:21:11 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Thu, 22 May 2025 10:21:10 -0600
Message-Id: <DA2TS4HXZHLK.1WH4DSREYSAP4@brighamcampbell.com>
Subject: Re: [PATCH 1/1] usb: typec: tipd: fix typo in
 TPS_STATUS_HIGH_VOLAGE_WARNING macro
From: "Brigham Campbell" <me@brighamcampbell.com>
To: "Greg KH" <gregkh@linuxfoundation.org>
Cc: "Jihed Chaibi" <jihed.chaibi.dev@gmail.com>,
 <heikki.krogerus@linux.intel.com>, <linux-usb@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, <linux-kernel-mentees@lists.linux.dev>,
 <skhan@linuxfoundation.org>
X-Mailer: aerc 0.20.1-0-g2ecb8770224a
References: <20250521214851.386796-1-jihed.chaibi.dev@gmail.com>
 <DA2IV4ZGT2M8.3QXO3L57VXSA5@brighamcampbell.com>
 <2025052234-brewing-recall-a7ed@gregkh>
In-Reply-To: <2025052234-brewing-recall-a7ed@gregkh>

On Thu May 22, 2025 at 2:30 AM MDT, Greg KH wrote:
>
> Too many characters for that sha1 value :)

I heard recently about concerns regarding the collision of 12-character
sha1 abbreviations [1] and had assumed that using 16 characters is
acceptable. Regrettably, I neglected to read Linus's response to the
email which rose those concerns. After reading his response, I'm
satisfied knowing that there is still very little risk of a collision
between the abbreviations of commit objects specifically.

I'll modify my git config to use 12 character abbrevs.

Thanks,
Brigham

[1]: https://lore.kernel.org/lkml/cover.1733421037.git.geert+renesas@glider=
.be/


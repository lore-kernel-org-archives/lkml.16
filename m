Received: from mail-qt1-f170.google.com (mail-qt1-f170.google.com [209.85.160.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 14C211C2324;
	Wed,  9 Apr 2025 17:08:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744218496; cv=none; b=LVoDu1rGnE+gRCLXr+odpkTKkjEAne5cLbwlI+/60LXkZQJLNTfpb5afTPt5QIYGSR1gxxdoPsty+C9Z11jAVXEEMYAVixSsZzpUdXcKdrNgphM6WXWfvU+dpCd8JsrUq/MQxB7ew9OdLAGbP/HAND7VhKbqS0gfEQOx4TDWu7s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744218496; c=relaxed/simple;
	bh=iOeB+D7hHLfOumoiYclzkNLQWOZ6MxWqpBTCBAaYbHw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Bmba357mrufEcJp3d33i08aLvD2byElh860msFDJBsJEND+JHlubDJdCinIt4U//o3Di0qtByc23zbyg+5zHqiWpQCA7lJ/OOmJT5m/7gYICPF1ZRt0kJdtWb87aTYRvXa3BjEODWDaCOy+ljC1hEGgHqShOUKOdVLuzeINb3Cs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.160.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qt1-f170.google.com with SMTP id d75a77b69052e-476af5479feso68667021cf.2;
        Wed, 09 Apr 2025 10:08:13 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744218491; x=1744823291;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=oQY1o7SxIT4SK13jx8540K5lOFJCUfKlKKOAT7vzuN4=;
        b=NwtgrvLYK/Jiue3ECzs0CDztukh+45ietjWYEADBG2bo3cbxsXQ+s15rcrJtsYHwxt
         m980Eu+y3N+fGGpjJVvn67Ud3TsXqBDSvADhLrF4uI2Cu1LYVtE0C/ljIko0TmPxWZkb
         8pjnFJR0vBz46D7aKfBAYX2bBMzzD9iA/KcT0k7r0lWH7sLkc7OJqGSWcKP3GKq2qF9X
         107C0I0iLgrvAf8/7NwanFZi/Dogug865tI606yVSSNhL/ls9jP2wbTD2ZYjkaT8o7+h
         HfpNJwoZAbFvoDwfFuXmRLKtJClBkAV1Hfonc6XXgG/dth7GI5rVtn+mCX9tgi9Q/BFe
         Tpsg==
X-Forwarded-Encrypted: i=1; AJvYcCWs/7f1M/GbpR9Pp4QfMRKP8ljm6o9uwRAfCYCVOrgvmK0oQ9pLXBso5lSa4buBG0rZ6Ks5oUytX1UVBNi4gTk=@vger.kernel.org, AJvYcCWvAkNFAbOSqwS+Lu+uf/91DjS82rk5JWXSk8fKll58uf+FyDJQaIxSgVYmy0ftPgfuSI9AFUZ8wKmMYXo=@vger.kernel.org
X-Gm-Message-State: AOJu0YzVwBn2tdQbwdQr9IBkjocw2ruXKKaKBHUwo2zU0WJknRtVeupW
	RvLnKb6tYMmOoUaPFFVZ7Q0WHloJ2GW1q2IMEptwR7qYcg9wD8YNA5Nqmq1PukY=
X-Gm-Gg: ASbGnctnWKY/jHuYjjzLPOgT/+PyG2kSxnWExyXxeV4vMu9Orrljg1kYxAQej8YhR9w
	IofjsfzwTrORi7qdsJO39whlTY8sTtzpI0vbq7jhMsfN7YqP40DXFzs1EPSJmtJqNf1ck4gYMQy
	gmm9SzyEgEdNGWOYR3XFaEAj2E1cygn2tWdxK1aGV/pNq0/2D+D8hWVZ7OfWLFRuh8sABDEgyTg
	zufBlhwKaEVyvadwG8xNcIpGQLaVGN2n23435y8L7Bcaka1DL0mOnNso0l+5/9k4cQB3ecUEu4Q
	8uYsBUuJ1bkQLDJaKiXq3owDKEL6W63Pz3FusMUGDbADGFMd3IGLlSOSNrNKM5nqtm295f2yEkS
	LY1shGtE=
X-Google-Smtp-Source: AGHT+IHqQhe9bvbGPb2d0plfGbID0qYrk67eoNDVlBSwmQZXe1wM8EhBVOuxYi7mxMNZPK7pciZ4Fw==
X-Received: by 2002:ad4:4ea1:0:b0:6e8:fde9:5d07 with SMTP id 6a1803df08f44-6f0dd0ac556mr42405866d6.26.1744218490679;
        Wed, 09 Apr 2025 10:08:10 -0700 (PDT)
Received: from mail-qk1-f170.google.com (mail-qk1-f170.google.com. [209.85.222.170])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6f0dea07ef3sm9500836d6.71.2025.04.09.10.08.09
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 09 Apr 2025 10:08:10 -0700 (PDT)
Received: by mail-qk1-f170.google.com with SMTP id af79cd13be357-7c7913bab2cso290420085a.0;
        Wed, 09 Apr 2025 10:08:09 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCUWFDJBb3M60aUz3OKmtZ18HmV/GISzM8yUnQCKyRBdymtDN+caEvaCpOUX+F+b0XaL+Y46mQwM6ikU7kw=@vger.kernel.org, AJvYcCUicDLFsEbhN6XltiBw+QTfrq/tHxUW/meqlrtzh0JpHZ7B26qMSoZGxxQqDzkxx9xE1Z/woHIe6WWwM9shcus=@vger.kernel.org
X-Received: by 2002:a05:620a:298e:b0:7c5:56c0:a8 with SMTP id
 af79cd13be357-7c79dd93ccemr445711285a.1.1744218489140; Wed, 09 Apr 2025
 10:08:09 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250409061129.136788-1-fujita.tomonori@gmail.com> <CANiq72mbci8kxEx5jrq=HVc6WKuJqq8NCLzNsjH1wFcJNoHm+w@mail.gmail.com>
In-Reply-To: <CANiq72mbci8kxEx5jrq=HVc6WKuJqq8NCLzNsjH1wFcJNoHm+w@mail.gmail.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 9 Apr 2025 19:07:56 +0200
X-Gmail-Original-Message-ID: <CAMuHMdWtgSjxeGYJVNzeWPOCd9nUWeKQnCtFQaROQ1o=r_-QwQ@mail.gmail.com>
X-Gm-Features: ATxdqUGA2zHq6_S5SB_qEsVdujtLoXOP8BLoi9G8SgAElmMjDh-OTkFg66-F8QM
Message-ID: <CAMuHMdWtgSjxeGYJVNzeWPOCd9nUWeKQnCtFQaROQ1o=r_-QwQ@mail.gmail.com>
Subject: Re: [PATCH v1] um: fix incompatible argument type in iounmap()
To: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Cc: FUJITA Tomonori <fujita.tomonori@gmail.com>, richard@nod.at, 
	anton.ivanov@cambridgegreys.com, johannes@sipsolutions.net, 
	linux-um@lists.infradead.org, linux-kernel@vger.kernel.org, 
	rust-for-linux@vger.kernel.org, Logan Gunthorpe <logang@deltatee.com>, 
	Stephen Bates <sbates@raithlin.com>, Danilo Krummrich <dakr@kernel.org>, Dinh Nguyen <dinguyen@kernel.org>, 
	Arnd Bergmann <arnd@arndb.de>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Miguel,

CC arnd

On Wed, 9 Apr 2025 at 16:48, Miguel Ojeda
<miguel.ojeda.sandonis@gmail.com> wrote:
> On Wed, Apr 9, 2025 at 8:16=E2=80=AFAM FUJITA Tomonori
> <fujita.tomonori@gmail.com> wrote:
> >
> > Align iounmap() signature with other architectures.
>
> Most indeed have `volatile`, but nios2 and m68k don't -- Cc'ing them
> just in case.

Indeed. Apparently the volatile keyword has not always been there...
Why does iounmap() need the volatile keyword?
Why does pci_iounmap() not have the volatile keyword?

Gr{oetje,eeting}s,

                        Geert


--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k=
.org

In personal conversations with technical people, I call myself a hacker. Bu=
t
when I'm talking to journalists I just say "programmer" or something like t=
hat.
                                -- Linus Torvalds

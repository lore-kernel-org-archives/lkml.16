Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 311721EA80;
	Sun, 11 May 2025 12:00:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746964840; cv=none; b=es2udiXvgeUbNsdxzS1iTiD6qbr9D8EfisGVr1V9sIFtmH7qJkswHopEmRVAGZOiLZ/1NVwCLYYf6WNYBkOItmZO2/FTvUFkGCKK8n/Tc6PzwR9KiSaEs5sPrIVjc1HiNDVdBnJEOuM6ag9VFN0iYg45r4fsCeiwDMIav6g5Sbw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746964840; c=relaxed/simple;
	bh=D3PBTXrFAxlY+eEyaTNWwLnmg3A31RD4Y7uGWUvDGfk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=JzFDjM1EvnpOlnzi7bSTuuRhUfleZlaAQYtjSrniWGm+2QddxaXKEXinl4KGdKx4AyfGzBuqrpsp7/OM1LhEdTQfmK9NcqJ2H+q3kPZB00CQ+KDMKUHBqE9FQ1aT+W4qRLvUIzwx2MABDRiPHddsKQYcDeuvr6ko81J0YPEsbX0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=eCJfUw6s; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="eCJfUw6s"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 95362C4AF09;
	Sun, 11 May 2025 12:00:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1746964839;
	bh=D3PBTXrFAxlY+eEyaTNWwLnmg3A31RD4Y7uGWUvDGfk=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=eCJfUw6spCRRHlMrGdomB/Mnz/KA4rcdWP4MR54Bq/efo41zwyMXQ/NRcOzNhWas+
	 IsmdIeU0a11Y0BCK758sOn4hvqTQ/y1ASfukz3SOoFI0KhLGijp+kG6oxdYV3yuwaU
	 2j7Nlz6SWXmYczmuzzXPT5YKgHuydyhWnyjNlJTsjxbzdXgSpwKe4XGcP2FptDi+oB
	 26T1GKNWKsJK+H6w/ptqLO0C7DQnq3CzdgssDBqP7eMFI4Xh1aalHzb7Qqu8fCzGIY
	 OTXqK2nmVrELpBMufXS6EWl1GE/uwClYXGL2/J0qYP8OOWJuJut90dPm9vh1qvpGfg
	 6YB4OSBgaMKdA==
Received: by mail-oa1-f46.google.com with SMTP id 586e51a60fabf-2c2ada8264aso3166593fac.2;
        Sun, 11 May 2025 05:00:39 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCUd41QF8SzrsuzhPXdnO2OH5ilELlwDoyKYwyy85VJ6LajmhHjcMxKSQyvZRSnUExIsSrTsplcf/ye68ltU@vger.kernel.org, AJvYcCW68aHwN0Oh6uanq/adtEjS71xdCjV0toMhX7b/u4dONr7mG/Tz+cSpWlOaViIgDTc+5M2wqQP6l2Dh@vger.kernel.org
X-Gm-Message-State: AOJu0YyfwxdK+l8CLyL1I3VzU1kKC5QEKjs53Xojt1iKLdTMqTadr2fn
	06p0518QtYZgenPLj8glCI5MZbpUARVWSgffjn5UY3ztFHGlbkwcb0057neRn4+OI/5srwej4A4
	/lEkzMEWumIuh2t/3GvuOyG/7YvY=
X-Google-Smtp-Source: AGHT+IFqyQGigILFU2ECSi6E5ms65UwoVAMiMzenjbRMrpkaDFwmJRcd/7RXGw2dJa09ArKgbIl9L33U3JoB2mMZHAk=
X-Received: by 2002:a05:6871:5824:b0:2d5:4f51:37fa with SMTP id
 586e51a60fabf-2dba44e3613mr6045354fac.31.1746964838994; Sun, 11 May 2025
 05:00:38 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250506073216.43059-1-clamor95@gmail.com>
In-Reply-To: <20250506073216.43059-1-clamor95@gmail.com>
From: Chanwoo Choi <chanwoo@kernel.org>
Date: Sun, 11 May 2025 21:00:02 +0900
X-Gmail-Original-Message-ID: <CAGTfZH3hTGYL-QnK0nFhCkY58w+VU0NWDFFj96Coj3nuS9wmMg@mail.gmail.com>
X-Gm-Features: AX0GCFvoSjIMUxgTWRraiTkKSskn-Lbl3BVtgo9u3LYtsHCmsgZhvMr9LXSITG8
Message-ID: <CAGTfZH3hTGYL-QnK0nFhCkY58w+VU0NWDFFj96Coj3nuS9wmMg@mail.gmail.com>
Subject: Re: [PATCH v3 0/2] extcon: add basic Maxim MAX14526 MUIC support
To: Svyatoslav Ryhel <clamor95@gmail.com>
Cc: MyungJoo Ham <myungjoo.ham@samsung.com>, Chanwoo Choi <cw00.choi@samsung.com>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

Applied them.

Thanks,


On Tue, May 6, 2025 at 5:09=E2=80=AFPM Svyatoslav Ryhel <clamor95@gmail.com=
> wrote:
>
> The MAX14526 is a simple multiplexer of common inputs on a single
> mini/micro USB for portable devices.
>
> ---
> Changes on switching from v2 to v3:
> - fixed overflow issue with ~USB_DET_DIS
>
> Changes on switching from v1 to v2:
> - added port and connector to schema
> - removed -muic suffix
> - removed unneded comment header
> - removed unneded gpios in private data
> - improved code formatting
> ---
>
> Svyatoslav Ryhel (2):
>   dt-bindings: extcon: Document Maxim MAX14526 MUIC
>   extcon: Add basic support for Maxim MAX14526 MUIC
>
>  .../bindings/extcon/maxim,max14526.yaml       |  80 +++++
>  drivers/extcon/Kconfig                        |  12 +
>  drivers/extcon/Makefile                       |   1 +
>  drivers/extcon/extcon-max14526.c              | 302 ++++++++++++++++++
>  4 files changed, 395 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/extcon/maxim,max145=
26.yaml
>  create mode 100644 drivers/extcon/extcon-max14526.c
>
> --
> 2.48.1
>
>


--
Best Regards,
Chanwoo Choi
Samsung Electronics

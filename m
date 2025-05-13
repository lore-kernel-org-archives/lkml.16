Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8F0E92BE0F5
	for <linux-kernel@vger.kernel.org>; Tue, 13 May 2025 16:35:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747154146; cv=none; b=RVEzjRhI/k+Y0YrENqZvfe8gSYTzCj3D9OLh6wRFRZDkMTAnERm/8HrtIdRWzJNR35zWCW7NZw3YDfGiqWfURCl32ko0t2uSoFiwq7zgKs3OJWz4jpjQgcmLGnP8/6daG13TmNqZ0d+cHwsENSBUS9MJa+9L0H2LeMGz2io6aoY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747154146; c=relaxed/simple;
	bh=DTMs4yP2ggPA2F1PZB6dLUYJj7PN8M7LJUEZPRRTtP4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=dMnwLeDWTFoskN38eiXXsW63d/U9sK5/6bIfmhQUeM6iBnO0sivppqkey4+gxiD5xWq28/GOvV6eIqNf0pz9jo7dKydeQNOdHihyXCetsDSnxoFaofzqIxYdZUQxLGEWFMMFMFeGBvdf2iLga/huzSlbiBwgUQeEaX6y2kbUIRs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=taInxOnV; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="taInxOnV"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 10D05C4CEE4
	for <linux-kernel@vger.kernel.org>; Tue, 13 May 2025 16:35:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747154146;
	bh=DTMs4yP2ggPA2F1PZB6dLUYJj7PN8M7LJUEZPRRTtP4=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=taInxOnVwxByvk7Amh3PZpQTJciuHpw5g+N9wLtpknZm7EgEzl7SxcRZPOO8r9WK9
	 msqwAyYm9tJEW0fsz7mQsYDz68XeUYIwOX1AKB8EWLXN+r/9jm5ZUQ/qsG6n6IyIMC
	 qbTsbPIF0gyny9EHavB5GcSxOfJLyf4vxggSEerC8UtXvgNVHyfpdJOR4QpFvr9O+1
	 y2cslQCjk8lnUud5qF/KSWjQWbHqSb+lgyaBzO9hMD4f7j/xEhNqTwbntzUj8e7BeP
	 Mka9XL4vgt5x58EmCEDaelzezO5Ix/fHA763cjI8C+aWjL3BFe4ixGpSpPNQ7/XW1I
	 Z1Qf4FdL3e+uQ==
Received: by mail-ej1-f44.google.com with SMTP id a640c23a62f3a-ad21c5d9db2so761050466b.3
        for <linux-kernel@vger.kernel.org>; Tue, 13 May 2025 09:35:45 -0700 (PDT)
X-Gm-Message-State: AOJu0YwcSiqOIEF/Wnh/C/3W1+2nfcQUtwC4y/Q3DGLF5T9eaz4aBb+x
	6Fa5JsH+2g3qwHqgpE78929pkayn85NJnxA1Oruld6HzVfpgs3mIcbebE6jLnXLmk8F8eKE12ib
	oW8qwBBmadAaK8Itw+U7Guzfa5Z4=
X-Google-Smtp-Source: AGHT+IHlEFo8ZKL7+OrPDPZRXEjtqczfBcbSIo+TW5TyyR4WllMbK8p+SbVF8Irk3KeS9kFJZF8uMyCs7tcRwZpUg+I=
X-Received: by 2002:a17:907:86a1:b0:ad2:39f2:368d with SMTP id
 a640c23a62f3a-ad4f70f6984mr28817566b.11.1747154144941; Tue, 13 May 2025
 09:35:44 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250513002313.954908-1-rdunlap@infradead.org>
In-Reply-To: <20250513002313.954908-1-rdunlap@infradead.org>
From: Chanwoo Choi <chanwoo@kernel.org>
Date: Wed, 14 May 2025 01:35:10 +0900
X-Gmail-Original-Message-ID: <CAGTfZH1aHVxB+BbJmP+2zCFvR81fGJgK8KBVyx3PkAf3ATatXQ@mail.gmail.com>
X-Gm-Features: AX0GCFulf_GLeIygHRzs7hY6UkcfEk2TMCR7q5KbvphpjI7hc31b_HZJmjJW5ww
Message-ID: <CAGTfZH1aHVxB+BbJmP+2zCFvR81fGJgK8KBVyx3PkAf3ATatXQ@mail.gmail.com>
Subject: Re: [PATCH] extcon: Maxim MAX14526: avoid defined but not used warning
To: Randy Dunlap <rdunlap@infradead.org>
Cc: linux-kernel@vger.kernel.org, Svyatoslav Ryhel <clamor95@gmail.com>, 
	Chanwoo Choi <cw00.choi@samsung.com>, MyungJoo Ham <myungjoo.ham@samsung.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

In order to keep the consistent style of extcon patches,
I'd like you to edit the patch title as following:
- As-Is: extcon: Maxim MAX14526: avoid defined but not used warning
- To-Be: extcon: max14526: avoid defined but not used warning

On Tue, May 13, 2025 at 9:23=E2=80=AFAM Randy Dunlap <rdunlap@infradead.org=
> wrote:
>
> SIMPLE_PM_DEV_OPS() is deprecated according to <linux/pm.h>.
> Use DEFINE_SIMPLE_PM_DEV_OPS() instead. This avoids a build warning
> when CONFIG_PM is not enabled:
>
> drivers/extcon/extcon-max14526.c:265:12: warning: =E2=80=98max14526_resum=
e=E2=80=99 defined but not used [-Wunused-function]
>   265 | static int max14526_resume(struct device *dev)
>
> Fixes: c2aeb8647e53 ("extcon: Add basic support for Maxim MAX14526 MUIC")
> Signed-off-by: Randy Dunlap <rdunlap@infradead.org>
> Cc: Svyatoslav Ryhel <clamor95@gmail.com>
> Cc: Chanwoo Choi <cw00.choi@samsung.com>
> Cc: MyungJoo Ham <myungjoo.ham@samsung.com>
> ---
>  drivers/extcon/extcon-max14526.c |    2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> --- linux-next-20250512.orig/drivers/extcon/extcon-max14526.c
> +++ linux-next-20250512/drivers/extcon/extcon-max14526.c
> @@ -272,7 +272,7 @@ static int max14526_resume(struct device
>         return 0;
>  }
>
> -static SIMPLE_DEV_PM_OPS(max14526_pm_ops, NULL, max14526_resume);
> +static DEFINE_SIMPLE_DEV_PM_OPS(max14526_pm_ops, NULL, max14526_resume);
>
>  static const struct of_device_id max14526_match[] =3D {
>         { .compatible =3D "maxim,max14526" },
>


--=20
Best Regards,
Chanwoo Choi
Samsung Electronics

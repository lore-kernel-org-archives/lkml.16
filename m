Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com [209.85.214.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB42020CCE4;
	Thu, 15 May 2025 10:19:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747304354; cv=none; b=MWo3fMQttvPn/edy1BmkHqzUt6qizH43U7sw13yijXCpLPuSBXDaUDGEDmCxtCX8HJ15YCk+x7MRXFfZb1oTo99hCmrxuJUbXhu1NU35ElOEZtt4B+3mAbaRKOzC0P81zbBKDe+BgZsBlo93M7WsSRW1ebLBA8XtdUVs/7jiMyE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747304354; c=relaxed/simple;
	bh=/cnbovOFj/4K/kSKZHZsimOqCSA+C4agdVHxhrxUPSY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=UJ5jX5W/ftAy4zLazAtqQBnhJgycKrH2D5isNUnNPXH52O1AOjeVHS8w6WlMT4k0Pbyv9nbMTUK00ZcAP/B9cDznvPVq5AWoXAQFHV8ClYmWYtiz3YC3uJn8JMWuqOc73zDsPn61BULP4OYdi4DZnW99f0T+UEdI6Toh3ktfnyU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Ai1m5y0i; arc=none smtp.client-ip=209.85.214.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Ai1m5y0i"
Received: by mail-pl1-f171.google.com with SMTP id d9443c01a7336-22fa414c565so6434365ad.2;
        Thu, 15 May 2025 03:19:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1747304352; x=1747909152; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=SgEmQPsTMSukLECA6PYoxAhOxF/9eSkMwkJFG9w+Jwg=;
        b=Ai1m5y0iTWLHUmneikfBqcihMFCyMnOJd05V0Hegd+9rJ9NgHYkHFqp7/1zvUPI5nn
         3WnzMjAwDPUAm1jeS1lCvw3/erZSVC658AwdwqcMmScY2qVyFAFhCw4LnhiARKBi7SH5
         B9tR4mF9RysnBo1gRc56WpU3IGrg3scPKh2g5yOzjDdpWgzqmul0fdWQ5sFJ1heyqGvs
         1lDWt2NLPJAeBNMxUKG5172gUvOfkb93fsnG/3tbnlJzTg5jyAJu+LdPL0JWyvg+qMZS
         Hj4r8t9RvKsQWTn85KTqPdXv0NKgdgkji757hHDFAMYQD6ynWHjnLQYc2ZQxebycu+Mf
         ZwRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747304352; x=1747909152;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=SgEmQPsTMSukLECA6PYoxAhOxF/9eSkMwkJFG9w+Jwg=;
        b=akLI01ozqJV/wi/8Dyb2eSkUNsGnfnh6FUTtEOY9lO0GUTGYOAe3ldBoRsuZoVXxh9
         6/HjIRWgUyJWdt0Kxg2kZyJNuJs2NST+m/ZmkMVw70SGnUMLUb5zS4PVdE7Y+V3wRb9n
         AUSqw1pTQN0/+QoM6PXipjFKUXDWl9GzvvHGZLRdg/Ysl+ttXFjyH0OgDY7uwW3kfRvx
         MPf8jqz8Cn6OnoLeqpYyYhosV14ZKdEPxvS/Voux4mnzNy7626Jo5o36LmvZMu+Y8AK6
         /gS0475XVz0IbdMCtkUDw36pBhKGgwaErQJBaPM+w5LGHsoHxgXreIrgD+NvLJwnZYFJ
         Xf+Q==
X-Forwarded-Encrypted: i=1; AJvYcCUJv7+YOf+/B2YBIz1IKHNZuk9MspK6Bezt7P5m8zOGcXEdpihN+RmvHnn1htuuUiJMZ3vYE845gX8bbo9z@vger.kernel.org, AJvYcCVdFMK4J3DUMrIwL03Qb+oOy6FB7vxv30L7+3p5auOH6d3wENE1C4OW5GaOlSjeEM8Y/oYMiiXfqUi/@vger.kernel.org
X-Gm-Message-State: AOJu0YxtoDTmTxBQ6hkncxIJbz7E3ONsJ9w1EEMkj4maGNd5icZ4Tg/T
	jqdLsM21v3k8MjbJXRVx2US6AXEjGL113cRvC3rwu0scgEFlxdHtttLVcSdIB53m6lXRAB3UoG+
	2mJlg+61NPnEc6YlMNSRUJSNwXdU=
X-Gm-Gg: ASbGncvIRRDVOuIrGKzjPi/fVOvWMfQgk5XSJFALmVHN227m6jrTTBmxnG5P7otX4qz
	PEbTClWZ875YvPW0/cvCV1D+aQLizxeZhuLRmGp+bpTYl7+/q42NonESB03mxa8/Mmig5fC+Tu2
	lRD8BjWmE4XrRGNtsUqdGIeaG3PoalVw==
X-Google-Smtp-Source: AGHT+IEsIUOtHqCyd3RUFAmp28tpSkSzHX7erUjCawa8T/wazwsdJ3+WuKQBWkKpBGFc9cg7xp3+86p/M24KmPAv1WQ=
X-Received: by 2002:a17:902:da81:b0:22f:b6d6:2737 with SMTP id
 d9443c01a7336-231b5e51d4emr26927485ad.10.1747304351996; Thu, 15 May 2025
 03:19:11 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250515051900.2353627-1-shengjiu.wang@nxp.com> <20250515051900.2353627-2-shengjiu.wang@nxp.com>
In-Reply-To: <20250515051900.2353627-2-shengjiu.wang@nxp.com>
From: Daniel Baluta <daniel.baluta@gmail.com>
Date: Thu, 15 May 2025 13:21:00 +0300
X-Gm-Features: AX0GCFtYRGBFzwrIv-5BkoOX-4f7j8QWlxzR2F9_CR7P2Wf-QEkia7AjZk42Z20
Message-ID: <CAEnQRZBJgJpyE-K6fn3_s61-Q7j=mXk5FGMggpaBhnH62w+ACQ@mail.gmail.com>
Subject: Re: [PATCH 1/6] arm64: dts: imx94: Add micfil and mqs device nodes
To: Shengjiu Wang <shengjiu.wang@nxp.com>
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, 
	shawnguo@kernel.org, s.hauer@pengutronix.de, kernel@pengutronix.de, 
	festevam@gmail.com, devicetree@vger.kernel.org, imx@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	shengjiu.wang@gmail.com, carlos.song@nxp.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, May 15, 2025 at 8:21=E2=80=AFAM Shengjiu Wang <shengjiu.wang@nxp.co=
m> wrote:
>
> Add micfil and mqs device nodes
>
> Signed-off-by: Shengjiu Wang <shengjiu.wang@nxp.com>
> ---
>  arch/arm64/boot/dts/freescale/imx94.dtsi | 30 ++++++++++++++++++++++++
>  1 file changed, 30 insertions(+)
>
> diff --git a/arch/arm64/boot/dts/freescale/imx94.dtsi b/arch/arm64/boot/d=
ts/freescale/imx94.dtsi
> index 3661ea48d7d2..77297dde5c95 100644
> --- a/arch/arm64/boot/dts/freescale/imx94.dtsi
> +++ b/arch/arm64/boot/dts/freescale/imx94.dtsi
> @@ -108,6 +108,16 @@ scmi_misc: protocol@84 {
>                 };
>         };
>
> +       mqs1: mqs1 {
> +               compatible =3D "fsl,imx943-aonmix-mqs";
> +               status =3D "disabled";
> +       };
> +
> +       mqs2: mqs2 {
> +               compatible =3D "fsl,imx943-wakeupmix-mqs";
> +               status =3D "disabled";
> +       };

Node names should be somehow generic.

So here, we need to have something like:

mqs1: mqs@<ip_addr>

similar for mqs2.

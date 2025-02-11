Received: from mail-pj1-f42.google.com (mail-pj1-f42.google.com [209.85.216.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6DEC820CCF4;
	Tue, 11 Feb 2025 13:04:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739279099; cv=none; b=WsYID+KFOzkzkOu6nsmihPI9miatFKaf/ptwDNA3pcl3SoA//FKPE2padGoA2VcZS3IW1FtkbO2lD/RZkCAJOvt5SE/MMBNg2vToKYPcCtzIHmL2wX6kJ8Ueb2SnSEYASHL+kH1iqwY/i2sJgB4phADFMwaq2U4R3AsZWwXldmc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739279099; c=relaxed/simple;
	bh=sXnE1EmrYVMTqzdCX051zDX20HTB+AMpDH5rWReVBoc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=onFojaMEjjNNhgjRvCywBmVm9J+hSZDaKacP3wYZ/I9ABzaVGtEykJbmHVXYeXNA0pwpqjQVFb4wiiQ0JZi0Hk5fPbtSj27XjzrcBddW0FyklUDA0m5jSTKAqNLXKXfo+/VIaXHW4skw9IapkcREo/53AoZBb8ZYNhSyySFMDk8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=O+fMJtZn; arc=none smtp.client-ip=209.85.216.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="O+fMJtZn"
Received: by mail-pj1-f42.google.com with SMTP id 98e67ed59e1d1-2fa1a3c88c5so7098542a91.3;
        Tue, 11 Feb 2025 05:04:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1739279097; x=1739883897; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=I5mGdMwF5cu1aorS2vZbnAj6wLlbFO7781j7ylyHZ94=;
        b=O+fMJtZnlYAVqbCU/z23VvaLDr1hwJGmAAGxuAhg8fEGWA0rRP+bZwWsfW6n3TztjW
         Yg0yE266w7159ANtyaxufr2ljgzx5Bp9qSYWcdyF4sT9Ss90Yc4fB0WPpy/nZSOh9WnV
         kfStmedMCnLbvDHUxeiNmY1TKt2hrABt9D5Gy5nkwa12hPISdlNKgXu4HJi5V0v66OXE
         20SAcWODtyBZaoDtC66OUddfEU90ed9CeBx+faFLuP/ltHpd9se4W19e1YpIimIUDHxB
         AxSZbADIK61FnTiPZth6ULds4IL4cp4+3AVYLjZYITE1qGYYFSYjpmBs6U0YmhMHKRIb
         O3Mg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739279097; x=1739883897;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=I5mGdMwF5cu1aorS2vZbnAj6wLlbFO7781j7ylyHZ94=;
        b=k+xV5vMV9pGiinrwcK66w1YCuP93+3kAhuI2351Z6LqE6Hv4DgdGhDxYrUhRrErAfv
         DJOhZJT7rc0CW8xBWIHC3ab+5Kx7RtnejOJahDpa7UHZrTnDbckslyakqryZng0nv0EC
         8s9dYr1iCMC/DiJE2haf3ZDOrmtd2Jfh78UJVcOPP6gH6guJEr3bgUxBPD1vbT475LwE
         GWyhZe1gftFM0H9bRdZSIHhgzfTvIj0w3KHKPRp/i8365FGFMge8fU2jIHyLSmejI/tk
         MIk6lBYlmMLG0P3gmD9aimTCxg+dyT1ldP+NhMfiiPoPzGZLS5z3HISdLDfCyiujMoM6
         w0HQ==
X-Forwarded-Encrypted: i=1; AJvYcCVoyPYdCSxTgj4phbKKNM4mZ90TlGVs71+jUtQEEv7VjUKj6iHg/IdNSPVJ4e2CYyRyVhe+hJbLU/Km9Icd@vger.kernel.org, AJvYcCXNYi6Jnp6P8Hx+5lAGq3UIgO7+NVIMLj4RKE7GOMOEfwQKCxEcONnM4YV7iPB8f1yWSHiFs2ELXr0MCeQ=@vger.kernel.org, AJvYcCXbPcBP3zzhs/LLAV9YtJ2Aug0Y/0+Cyg7mDhTpsTobzHBf16wQK8KtkVMZQ4svjvVeQgHRKgZQb5S7@vger.kernel.org
X-Gm-Message-State: AOJu0Yyt5DAdvNhwXvI1KzVgIGi1xMf5ZetaLchHDXr3ZV1X3J6bkEIH
	UAFVWRQ4xCR9PjeZBIFBixJ5uBJ8g4W/+etxK9KyfHf5/lclRT/Ftcw+yEuts4rXjMGnI9bjpDv
	425q3By18E9VkbqJ/avqSK+fXAS8=
X-Gm-Gg: ASbGnctN0G8lSyBEG9c/+AwUm/23PgzFYmkwJ8Z8AW/FU4YICb3DQ3KCQWbI0B+Unp0
	ngx8FXcaUWtcD/6OftlcV3J8VnEcX7msltjVrR1j7W3+BJWK1M1Bo2PETPG5A14cIvTr9Hw==
X-Google-Smtp-Source: AGHT+IHxrSbz+UMf0ZSE5PZbnCLY0l+6wu1dbGZuTcxLw9cyD1B/2N0NzHUPXxohK81nTZucVVt76ckOaeCaUTE/ZDI=
X-Received: by 2002:a17:90b:2545:b0:2ee:f687:6ad5 with SMTP id
 98e67ed59e1d1-2fa9ed5d37bmr5548858a91.2.1739279097573; Tue, 11 Feb 2025
 05:04:57 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250211035737.3886974-1-shengjiu.wang@nxp.com>
In-Reply-To: <20250211035737.3886974-1-shengjiu.wang@nxp.com>
From: Daniel Baluta <daniel.baluta@gmail.com>
Date: Tue, 11 Feb 2025 15:06:26 +0200
X-Gm-Features: AWEUYZkxR9jtS8NDetBx_vRl7m1cPQuJxMC1s9IXybxI-_qoyigAvbqfYgvFG70
Message-ID: <CAEnQRZDC+mQ=QzzpBsXzt0kSSDAo-LbfRkbDLfxrbxW9Nse-+w@mail.gmail.com>
Subject: Re: [PATCH 0/2] ASoC: imx-card: support playback or capture only
To: Shengjiu Wang <shengjiu.wang@nxp.com>
Cc: shengjiu.wang@gmail.com, Xiubo.Lee@gmail.com, festevam@gmail.com, 
	nicoleotsuka@gmail.com, lgirdwood@gmail.com, broonie@kernel.org, 
	perex@perex.cz, tiwai@suse.com, shawnguo@kernel.org, s.hauer@pengutronix.de, 
	kernel@pengutronix.de, linux-sound@vger.kernel.org, 
	linuxppc-dev@lists.ozlabs.org, imx@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, 
	devicetree@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Feb 11, 2025 at 5:58=E2=80=AFAM Shengjiu Wang <shengjiu.wang@nxp.co=
m> wrote:
>
> Be similar to audio graph card, support playback or capture only
> for imx-audio-card.
>
> Shengjiu Wang (2):
>   ASoC: dt-bindings: imx-card: Add playback-only and capture-only
>     property
>   ASoC: imx-card: Add playback_only or capture_only support
>
>  .../devicetree/bindings/sound/imx-audio-card.yaml         | 8 ++++++++
>  sound/soc/fsl/imx-card.c                                  | 5 +++++
>  2 files changed, 13 insertions(+)

For entire patchseries,

Reviewed-by: Daniel Baluta <daniel.baluta@nxp.com>

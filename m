Received: from mail-ed1-f44.google.com (mail-ed1-f44.google.com [209.85.208.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C9EF25E466
	for <linux-kernel@vger.kernel.org>; Mon, 28 Apr 2025 09:59:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745834351; cv=none; b=qxSEzruSedqTzoR3durPYgySBqGIBAiO1pY3/SxKujejc/BsNFgM6bxFRak769I3zOw6C8Ix+BTyRsZHrDD+SECvvOiQNNIkZMJpHuDBWrbRRuXjW/8bGl2rushwvaE2jNTQFt2StREXZcMQ6zZXFHa0l+q9zmQmX0XbKlR091w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745834351; c=relaxed/simple;
	bh=J3q7+ERLGGMYNzcLUoAdfmlz8C/A9OhMRW6zKx/4oqY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=nU2AXut8Wyq4VVmLozJpzVKPHBx+Cc4lQP8umYHZ411Vy60SKagilIUSr8sMN9LGsMKNuB/J+gfED/21eYbiq/HsJtm70R1wWY/V2Wg7ThhLOfg0c8mvTuKSPJYtKn+8xAzwv/xzUL8CftLJwVeQjtlKP90pESabq+K1/9KPX6Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ionos.com; spf=pass smtp.mailfrom=ionos.com; dkim=pass (2048-bit key) header.d=ionos.com header.i=@ionos.com header.b=gyx3AxP1; arc=none smtp.client-ip=209.85.208.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ionos.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ionos.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ionos.com header.i=@ionos.com header.b="gyx3AxP1"
Received: by mail-ed1-f44.google.com with SMTP id 4fb4d7f45d1cf-5f623af283fso536356a12.0
        for <linux-kernel@vger.kernel.org>; Mon, 28 Apr 2025 02:59:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ionos.com; s=google; t=1745834346; x=1746439146; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rINvUOH68ih2WYNJ2sZFwzY5douH3ogOju4in3oWC7g=;
        b=gyx3AxP1LbAFzwF1G67ZZIxLvOdeieULCRh/p20zfKIl8cG638HuNQnZDD0MO5nZwA
         S5gnQ9C7u+GBk6jK9xCEJ5rsAe1Povnp1AdqgBL5KlbHk27IDKluZXthYbX62I8T82Gh
         f7pv6gxiAdG/lEQ7lsYKT43EHtWgjPFYNw9jkjn5d7guqwKEzgWPPwps/PFhCGjUJET9
         T7Z9GPsMFSS37t2/MJ7+eShvmo81EdwMZ6xsJAI6sq5e1lXvze0dQkmSztoSv4kBMjEQ
         JeQ8BJ/mtOv7DU5aJJAfwBeCq508AxGTg9Kd0arwJZ97zcTMNHW/zG/Hig4dMOYzDPKS
         I2aw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745834346; x=1746439146;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=rINvUOH68ih2WYNJ2sZFwzY5douH3ogOju4in3oWC7g=;
        b=Mzd+fdM/3//l5+HMhQpsUosB6JDnko/SFtMN6+frmo90f9I8fki3js4Jru3OC4z4Oo
         L2UbVY4X2v+DiS3v4L9EWtdqXtW7nNLLTp4/g8OJ5vuzQT1KqY6BcWQWXP5mJTpQSsjm
         LhDrMW2ou4+kTucx5koSmb3Rx3ovDyHqtcgD78FNvxj2KSKkeStU9JKa+LfTRw3F8SUA
         fQgBFYOedeEKG73TdlwR6sLsUbXTzIHmlheiLZJykpmqzURnSiMt4w5xo8WAda86tD2V
         JHcxDPFnMR5kxuBoDr8OLTbsxrbQd7YI+l3JSBudOt6elLcdGHWbuvBmoOtHPMRxaAXU
         0hXw==
X-Forwarded-Encrypted: i=1; AJvYcCX8zcBPonZQrSosRy6jv4EH4Bwn/HZDvR5ggkbwXXpidHYUvN8P4QAuZ4QosTZsKluurv8r2+kgwywchMk=@vger.kernel.org
X-Gm-Message-State: AOJu0YwBNAgKW7AKJuO+vSpQAM7ViPmHvfziTH3B3V6gphrHgXj+kQDY
	FVmbnDYKnjlpydW8zxmnLaFBVQpD7h6fZkmRATZjkjvcqKoyY61snS29ljo8QPPicJQ32qETaWu
	Gf/iKrmyT6QPuXyGK5yZQ11Yw7r1HV6GmmnCJNQ==
X-Gm-Gg: ASbGncsEPvHjhxjvZjmkiFeO4xxpOKQFlJKtUgGjxFtdX+2HF4X4UiFY+0FGA7Wqfke
	If+Kd0uPfDsC99JgW3Ea22iUJz8iXjZjrXpM9qUK4mtGbX2ab1Dyl9X92XPaCxfjtyaj6OZ8O/Q
	mSdvcPQXjQTpeIDOHejUcBeA==
X-Google-Smtp-Source: AGHT+IHHy6cjJLCZOHoKD0Vir+Tlj+84pXwRNtT9CfC5vOM1rZhJdWTi3FlcQ1xaGBYFZ0wYE7qauMRO4rQ0F79VUm0=
X-Received: by 2002:a05:6402:1d4a:b0:5f4:d131:dbef with SMTP id
 4fb4d7f45d1cf-5f723a137cbmr3068606a12.8.1745834345736; Mon, 28 Apr 2025
 02:59:05 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <aA5Rzse_xM5JWjgg@pc>
In-Reply-To: <aA5Rzse_xM5JWjgg@pc>
From: Jinpu Wang <jinpu.wang@ionos.com>
Date: Mon, 28 Apr 2025 11:58:55 +0200
X-Gm-Features: ATxdqUG1FpHJ7ywPwQYIG1Fv3071Xq963wpMBqS0BrlJJM0d8JjCStD9cCOICTU
Message-ID: <CAMGffEnT+C2xSNXuEFzGm9Yh_f=sRVrPsFO=tSasLMWciqKPhw@mail.gmail.com>
Subject: Re: [PATCH] block: rnbd: add .release to rnbd_dev_ktype
To: Salah Triki <salah.triki@gmail.com>
Cc: "Md. Haris Iqbal" <haris.iqbal@ionos.com>, Jens Axboe <axboe@kernel.dk>, linux-block@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

On Sun, Apr 27, 2025 at 5:48=E2=80=AFPM Salah Triki <salah.triki@gmail.com>=
 wrote:
>
> Every ktype must provides a .release function that will be called after
> the last kobject_put.
>
> Signed-off-by: Salah Triki <salah.triki@gmail.com>
This change cause crashing during unmap device.
We already have rnbd_client_release from rnbd_client_ops, so no memleak.

Nacked.

Thx!
> ---
>  drivers/block/rnbd/rnbd-clt-sysfs.c | 8 ++++++++
>  1 file changed, 8 insertions(+)
>
> diff --git a/drivers/block/rnbd/rnbd-clt-sysfs.c b/drivers/block/rnbd/rnb=
d-clt-sysfs.c
> index 6ea7c12e3a87..144aea1466a4 100644
> --- a/drivers/block/rnbd/rnbd-clt-sysfs.c
> +++ b/drivers/block/rnbd/rnbd-clt-sysfs.c
> @@ -475,9 +475,17 @@ void rnbd_clt_remove_dev_symlink(struct rnbd_clt_dev=
 *dev)
>         }
>  }
>
> +static void rnbd_dev_release(struct kobject *kobj)
> +{
> +       struct rnbd_clt_dev *dev =3D container_of(kobj, struct rnbd_clt_d=
ev, kobj);
> +
> +       kfree(dev);
> +}
> +
>  static const struct kobj_type rnbd_dev_ktype =3D {
>         .sysfs_ops      =3D &kobj_sysfs_ops,
>         .default_groups =3D rnbd_dev_groups,
> +       .release        =3D rnbd_dev_release,
>  };
>
>  static int rnbd_clt_add_dev_kobj(struct rnbd_clt_dev *dev)
> --
> 2.43.0
>

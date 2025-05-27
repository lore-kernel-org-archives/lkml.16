Received: from mail-yb1-f169.google.com (mail-yb1-f169.google.com [209.85.219.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E9302225D7
	for <linux-kernel@vger.kernel.org>; Tue, 27 May 2025 09:05:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748336723; cv=none; b=JW63Nn7QpKB+9HsJosgeXIj5G+pCu0o2MwpRamILp0N73qyH+PeZoiOgRCd7Mn7NZbDW6DVjEnQQaE2oqjpNFNlCBWmoIi6pjo81fxU26DAQsY/vQ29mtmA/ElGHi1TgEFGOgsUwdRX3tIWP3J15K9jz5TJQwGToamYvyaTRFHk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748336723; c=relaxed/simple;
	bh=CRpfTBPGsU/+tqdI9xlMiEq0T70swRutbZRigIjFYyc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Hs0ydnjCdTax8JqD6SFmtcfM2eVXnsrwq45eU5qJWE8kl8MV00xwgCM1GgrzkXSSq7LDhFfjvfe61UOKjWzDzMylPHsoXS/hrsL14GytM6xk6Owc6Cxiv0nAo4hvLtpqY+utfzuP78B+J0SQVIA4iR3Jqa/ryxTKiE9+qVyR89E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=nLOg2s6X; arc=none smtp.client-ip=209.85.219.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="nLOg2s6X"
Received: by mail-yb1-f169.google.com with SMTP id 3f1490d57ef6-e7dc89108bfso290306276.3
        for <linux-kernel@vger.kernel.org>; Tue, 27 May 2025 02:05:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1748336720; x=1748941520; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LTZd01UwRRbxtjj6Iv0AjAyRW61W+KGsLF4BZOeCQNY=;
        b=nLOg2s6XbZ+9gRzR1FyfkX+jn5Zwk+lbSOdqo2W3guvUk9F6dWNBPLJ+XcZU/FE6JA
         f3bqa1dUHmANelb1y7Iu6k1dISLzsJwdVi82JX6A5bE9nuzXNjyxH0gh9e/kLazaTGvt
         QeOEsqtE01frCgz7NROoVzevM+vQTuLc7AUYlu6+KQ7lftZQb+cZLaW1dywWEua6HgyK
         TfM/Aaeqvk6zOUdM+8BDWVrb3eLjrz5czR7FCLX2kS/OPyHvhvCyWZm8/uOskc8PPUFN
         XDrr95m13CZXYrex+TcUOSsxQ5vqqYOWl9HPYGfJX+pEQwOK9wmzYg/xEWqgbJ6GRBd5
         SfLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748336720; x=1748941520;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=LTZd01UwRRbxtjj6Iv0AjAyRW61W+KGsLF4BZOeCQNY=;
        b=pC+fInImGwq5aHzxWBhmjygecTPBnYz2r94LbDPlhPcQw0H8wvB64Z/F6Mm/uhjXfr
         +HEpJEGFNJJ5DHacdIhgL89nJxRkWeSgdlGkme4LYZPXUce5EHgicdRla2MolVCqK40x
         JnzW9hn2W0Ymho1ixsckhMIXIM2MIdC8AYr9ondGN6xOEZp8yx24UTlegdNVk8OShB1z
         qk3K2lxwhkybUTV67KFreWTS8ooeM7p+70LSnVbuj/w2MJ4pqg7mDOc9pw9wHDUUgWcw
         XewCnyr5fy+FoykSi92y39bBFe5Tus9dAlvoXI48dHD7/Cx9GtWDXqlzOzhhbjxfscdh
         5ofQ==
X-Forwarded-Encrypted: i=1; AJvYcCVFoXloWZjRHzHKnM0yqNFx9mJ+ttPURgmp7923eUZnnlQvuaZp5kPpo1LGn6SPaNhujqUGFiqkhYdBvRs=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw1ewudOdRUybqHTf3ixZQ9guuU95lhi3uJhmM7jmlt2SjIneSX
	zmOPdzGNmaHBq4xBp0E3hHkIhQUaqk3IOBxKXLugRsOjk19+b6qUKyRecWDJeJwdtgVEIdOtVBS
	0SGKBwHzbCyEwMVyDR3VqS/t3OpV6+qYQlhLlTyKY
X-Gm-Gg: ASbGncu34S4bqG+ECI2/mZ5POviDU78Jw0vWBtBN/b3BtWT1ZbNI+t7YcSAUREQQioX
	Z1+3C98pEPAbYEUPUUY7QF+cDvChjhfqoskldIYn3hd/HznZ0/BmIAgCKkJrQMW4Hj238HdAp3C
	6rHfVkyG2WgqUyuDAFQHDEdV3foILezrUfVsmhPKYOolOJ1R/zBv8E4hY=
X-Google-Smtp-Source: AGHT+IFKMIHWgeFu3xBM1RWDE/WEs3TcahlWcU3GOovHQ5dAwRv/prvQiF+8ccGJ492KAiRXV4sznqZrP7KO0+OOKwU=
X-Received: by 2002:a05:6902:6c09:b0:e7d:81c7:3291 with SMTP id
 3f1490d57ef6-e7d912e0c0fmr11236246276.0.1748336719732; Tue, 27 May 2025
 02:05:19 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250527074737.21641-1-brgl@bgdev.pl>
In-Reply-To: <20250527074737.21641-1-brgl@bgdev.pl>
From: Hsin-chen Chuang <chharry@google.com>
Date: Tue, 27 May 2025 17:04:42 +0800
X-Gm-Features: AX0GCFt06KcqokYcO9FSO7kQTD9JduQQO9FBuLb_nJmBU7e9JKNOWhA7JnDhj40
Message-ID: <CADg1FFdVu7BjLi+Jr4KaHnkQBJCShOCpc7veXmqKN0nYkdhAYg@mail.gmail.com>
Subject: Re: [PATCH] Bluetooth: hci_qca: move the SoC type check to the right place
To: Bartosz Golaszewski <brgl@bgdev.pl>
Cc: Marcel Holtmann <marcel@holtmann.org>, Luiz Augusto von Dentz <luiz.dentz@gmail.com>, 
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, 
	Balakrishna Godavarthi <bgodavar@qti.qualcomm.com>, Jiating Wang <jiatingw@qti.qualcomm.com>, 
	Vincent Chuang <vincentch@google.com>, linux-bluetooth@vger.kernel.org, 
	linux-kernel@vger.kernel.org, 
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>, stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, May 27, 2025 at 3:47=E2=80=AFPM Bartosz Golaszewski <brgl@bgdev.pl>=
 wrote:
>
> From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
>
> Commit 3d05fc82237a ("Bluetooth: qca: set power_ctrl_enabled on NULL
> returned by gpiod_get_optional()") accidentally changed the prevous

typo: previous

> behavior where power control would be disabled without the BT_EN GPIO
> only on QCA_WCN6750 and QCA_WCN6855 while also getting the error check
> wrong. We should treat every IS_ERR() return value from
> devm_gpiod_get_optional() as a reason to bail-out while we should only
> set power_ctrl_enabled to false on the two models mentioned above. While
> at it: use dev_err_probe() to save a LOC.
>
> Cc: stable@vger.kernel.org
> Fixes: 3d05fc82237a ("Bluetooth: qca: set power_ctrl_enabled on NULL retu=
rned by gpiod_get_optional()")
> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> ---
>  drivers/bluetooth/hci_qca.c | 14 +++++++-------
>  1 file changed, 7 insertions(+), 7 deletions(-)
>
> diff --git a/drivers/bluetooth/hci_qca.c b/drivers/bluetooth/hci_qca.c
> index e00590ba24fdb..a2dc39c005f4f 100644
> --- a/drivers/bluetooth/hci_qca.c
> +++ b/drivers/bluetooth/hci_qca.c
> @@ -2415,14 +2415,14 @@ static int qca_serdev_probe(struct serdev_device =
*serdev)
>
>                 qcadev->bt_en =3D devm_gpiod_get_optional(&serdev->dev, "=
enable",
>                                                GPIOD_OUT_LOW);
> -               if (IS_ERR(qcadev->bt_en) &&
> -                   (data->soc_type =3D=3D QCA_WCN6750 ||
> -                    data->soc_type =3D=3D QCA_WCN6855)) {
> -                       dev_err(&serdev->dev, "failed to acquire BT_EN gp=
io\n");
> -                       return PTR_ERR(qcadev->bt_en);
> -               }
> +               if (IS_ERR(qcadev->bt_en))
> +                       return dev_err_probe(&serdev->dev,
> +                                            PTR_ERR(qcadev->bt_en),
> +                                            "failed to acquire BT_EN gpi=
o\n");
>
> -               if (!qcadev->bt_en)
> +               if (!qcadev->bt_en &&
> +                   (data->soc_type =3D=3D QCA_WCN6750 ||
> +                    data->soc_type =3D=3D QCA_WCN6855))
>                         power_ctrl_enabled =3D false;
>
>                 qcadev->sw_ctrl =3D devm_gpiod_get_optional(&serdev->dev,=
 "swctrl",
> --
> 2.48.1
>

Thanks for the fix!

Tested on a Chromebook device with WCN3991 chip.
Without the patch the hdev->reset callback would make the HCI device
unrecoverable, and with the patch the callback can reset the HCI
device smoothly.

Tested-by: Hsin-chen Chuang <chharry@chromium.org>
Reviewed-by: Hsin-chen Chuang <chharry@chromium.org>


Best Regards,
Hsin-chen

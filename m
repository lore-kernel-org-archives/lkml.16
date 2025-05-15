Received: from mail-ua1-f46.google.com (mail-ua1-f46.google.com [209.85.222.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EEC371E7660
	for <linux-kernel@vger.kernel.org>; Thu, 15 May 2025 01:43:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747273408; cv=none; b=BmK1eor7D+UFea3EYshNFb2OQt/vDAjqQur9kpfOyMP0d+X0ROpQJzyeYJYrEu/IadkY6R2CoDA6DXYLxwTY39Z2c2/6yJmmdywxBcyt3hf3lNhNrAJKq9vqDA+IaEZbLthuIjTMWRG0AvkJ9g9bf3JGzd57FSc9vHDdiN29DTk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747273408; c=relaxed/simple;
	bh=O/AYs6+m4Rx3EZIZOuoIqMa/PICDZR/bnE8mCWr48YY=;
	h=From:References:In-Reply-To:MIME-Version:Date:Message-ID:Subject:
	 To:Content-Type; b=ug9FRIeHs5aHMDLOipOh02I6xwca/AHJWXTcGhg1wGwnFIfTXFDXNY3bDtSo8NnDmwfgq+pZV97MYtLO9QgchKF85wftJIfhpl9k88esQliK66PnrNJNx5MsPQ7GQZs4ApP+OJPrpuO5v11HOafe5ofTg8K2xkxKTeC+U9t0VDw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=broadcom.com; spf=fail smtp.mailfrom=broadcom.com; dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b=EW+SKxqk; arc=none smtp.client-ip=209.85.222.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b="EW+SKxqk"
Received: by mail-ua1-f46.google.com with SMTP id a1e0cc1a2514c-877c48657f9so123132241.1
        for <linux-kernel@vger.kernel.org>; Wed, 14 May 2025 18:43:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1747273406; x=1747878206; darn=vger.kernel.org;
        h=to:subject:message-id:date:thread-index:mime-version:in-reply-to
         :references:from:from:to:cc:subject:date:message-id:reply-to;
        bh=tMpdCKzT3aDH2bzNOpaSoXGCKqympWSrpRQBSPoD/IE=;
        b=EW+SKxqkuAPXBBcIKhekMLVwLKk9eRHik6IHNBLYLShiBg6/jHhP1+xia19MrSRqV0
         G65dbzaMFAJdIJm/iqlthYoh/QAILjoifOdsoe9ZzV/brLRxdseAMA5oPHxjNVpS4vi4
         8ecjsqrnCncunHuSvuBCsTe8lpjce6om91UKk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747273406; x=1747878206;
        h=to:subject:message-id:date:thread-index:mime-version:in-reply-to
         :references:from:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tMpdCKzT3aDH2bzNOpaSoXGCKqympWSrpRQBSPoD/IE=;
        b=ZwxbjuGp4PZ8p6LX88dLiX6IQUBfRJNv97YsIzu8KnqMOn0N9wzcodAoUGOBOkwE1r
         olgWfKGR5swVDuQbQRNXD2BsOVr4V0RKId1EMBJvaSzn0AqwybDfu/NElaxz9BX6P7FB
         XD+cbnCYX79X61vvFuh0aTXoT0c8C8wncV9CkckdpFE83egG0A0y4FMXUzxmREbwMvJ5
         USSFNuhFC44XVHWLYu65WbsIt4iEws5nPW1bDd4pf6rZZzcJuL72Ha8xpOIuKrPYyBmV
         peglgxUAUwwRrltCZLvFUTfcw9LWaBnFCBrD2WCXnOdYS0PvlU2OALAFDD8hFj2i4sz/
         3TGA==
X-Forwarded-Encrypted: i=1; AJvYcCUDQEb7RouOx1I53jQ2Au/NOR2h6RYClcyPGBHShwYJxHr83kSDjI1GGsytUQxYcotPB+Bgh2zTYnj+vkQ=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw8yqTb9g5zapYdeqHcTKVYsY1NGvRZGPGNYi9dgM0FjUyUu4hP
	a6jXTYirkhTc46q8w7o8pGyvzEb0DvSu1TPsE7zzvjdtd6bqK5Niq3ZVUGD/yRNtX+k5zJLUapE
	JkQVhFNp5d0Rw4cr00sLrv5/xYpK2c8jseXqw
X-Gm-Gg: ASbGncuYazsQHvQTR9Nimr7mb+50cu6lUdonnXhMBBRhbgybEWYKUJtcqkTT9CRrN+N
	wAjU4dFA0ArQnG/trxzlAdmmt6Qjc7deZZ6YT0QUOhqDs0zdh8aegOw83nV/Vl6zKJL7sBGGlBT
	wASI1OBpnjgL8umoGKMt/dC0QQ5rkb7epZfG3B1+rMhPHz
X-Google-Smtp-Source: AGHT+IGzCb7rGrVAvnUO3VzK6QMFGPAruJiBQPAGg8I+RNAAeyZ9DMna5WPJcxLRiYZ1u2Hpjca4WXDje1ifrGV+Rq8=
X-Received: by 2002:a05:6102:3e0c:b0:4df:84d5:543e with SMTP id
 ada2fe7eead31-4df9541ae27mr564446137.7.1747273405750; Wed, 14 May 2025
 18:43:25 -0700 (PDT)
From: William Zhang <william.zhang@broadcom.com>
References: <20250514061454.772340-1-noltari@gmail.com>
In-Reply-To: <20250514061454.772340-1-noltari@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Mailer: Microsoft Outlook 16.0
Thread-Index: AQJo9WPXIWpdZdfQwHBIXdGSWtFI9LK4ipkQ
Date: Wed, 14 May 2025 18:43:24 -0700
X-Gm-Features: AX0GCFssGc7GWQqWAtRjeTKy_bAXfWhR19KpFEGbhWzPMKjHuHiM951JmRwIJrQ
Message-ID: <3f72afed2f7843b2d6c8f0346ee0a8ae@mail.gmail.com>
Subject: RE: [PATCH v2] mtd: rawnand: brcmnand: remove unused parameters
To: =?UTF-8?B?w4FsdmFybyBGZXJuw6FuZGV6IFJvamFz?= <noltari@gmail.com>, 
	dregan@broadcom.com, Florian Fainelli <florian.fainelli@broadcom.com>, 
	computersforpeace@gmail.com, Kamal Dasu <kamal.dasu@broadcom.com>, 
	bcm-kernel-feedback-list@broadcom.com, miquel.raynal@bootlin.com, 
	richard@nod.at, vigneshr@ti.com, jonas.gorski@gmail.com, dgcbueu@gmail.com, 
	linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org
Content-Type: multipart/signed; protocol="application/pkcs7-signature"; micalg=sha-256;
	boundary="000000000000b1c12f063522cae1"

--000000000000b1c12f063522cae1
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Alvaro,

> -----Original Message-----
> From: bcm-kernel-feedback-list.pdl@broadcom.com <bcm-kernel-feedback-
> list.pdl@broadcom.com> On Behalf Of =C3=81lvaro Fern=C3=A1ndez Rojas
> Sent: Tuesday, May 13, 2025 11:15 PM
> To: dregan@broadcom.com; florian.fainelli@broadcom.com;
> computersforpeace@gmail.com; kamal.dasu@broadcom.com; bcm-kernel-
> feedback-list@broadcom.com; miquel.raynal@bootlin.com; richard@nod.at;
> vigneshr@ti.com; jonas.gorski@gmail.com; dgcbueu@gmail.com; linux-
> mtd@lists.infradead.org; linux-kernel@vger.kernel.org
> Cc: =C3=81lvaro Fern=C3=A1ndez Rojas <noltari@gmail.com>
> Subject: [PATCH v2] mtd: rawnand: brcmnand: remove unused parameters
>
> last_cmd and last_byte are now unused brcmnand_host members.
> last_addr is only written and never read so we can remove it too.
>
> Signed-off-by: =C3=81lvaro Fern=C3=A1ndez Rojas <noltari@gmail.com>
> Reviewed-by: Florian Fainelli <florian.fainelli@broadcom.com>
> ---
>  drivers/mtd/nand/raw/brcmnand/brcmnand.c | 24 ++++++------------------
>  1 file changed, 6 insertions(+), 18 deletions(-)
>
>  v2: fix unused host variable warnings.
>
> diff --git a/drivers/mtd/nand/raw/brcmnand/brcmnand.c
> b/drivers/mtd/nand/raw/brcmnand/brcmnand.c
> index 17f6d9723df9..299dd2bca5b4 100644
> --- a/drivers/mtd/nand/raw/brcmnand/brcmnand.c
> +++ b/drivers/mtd/nand/raw/brcmnand/brcmnand.c
> @@ -310,9 +310,6 @@ struct brcmnand_host {
>  	struct platform_device	*pdev;
>  	int			cs;
>
> -	unsigned int		last_cmd;
> -	unsigned int		last_byte;
> -	u64			last_addr;
>  	struct brcmnand_cfg	hwcfg;
>  	struct brcmnand_controller *ctrl;
>  };
> @@ -2233,14 +2230,11 @@ static int brcmnand_read_page(struct nand_chip
> *chip, uint8_t *buf,
>  			      int oob_required, int page)
>  {
>  	struct mtd_info *mtd =3D nand_to_mtd(chip);
> -	struct brcmnand_host *host =3D nand_get_controller_data(chip);
>  	u8 *oob =3D oob_required ? (u8 *)chip->oob_poi : NULL;
>  	u64 addr =3D (u64)page << chip->page_shift;
>
> -	host->last_addr =3D addr;
> -
> -	return brcmnand_read(mtd, chip, host->last_addr,
> -			mtd->writesize >> FC_SHIFT, (u32 *)buf, oob);
> +	return brcmnand_read(mtd, chip, addr, mtd->writesize >> FC_SHIFT,
> +			     (u32 *)buf, oob);
>  }
>
>  static int brcmnand_read_page_raw(struct nand_chip *chip, uint8_t *buf,
> @@ -2252,11 +2246,9 @@ static int brcmnand_read_page_raw(struct
> nand_chip *chip, uint8_t *buf,
>  	int ret;
>  	u64 addr =3D (u64)page << chip->page_shift;
>
> -	host->last_addr =3D addr;
> -
>  	brcmnand_set_ecc_enabled(host, 0);
> -	ret =3D brcmnand_read(mtd, chip, host->last_addr,
> -			mtd->writesize >> FC_SHIFT, (u32 *)buf, oob);
> +	ret =3D brcmnand_read(mtd, chip, addr, mtd->writesize >> FC_SHIFT,
> +			    (u32 *)buf, oob);
>  	brcmnand_set_ecc_enabled(host, 1);
>  	return ret;
>  }
> @@ -2363,13 +2355,10 @@ static int brcmnand_write_page(struct nand_chip
> *chip, const uint8_t *buf,
>  			       int oob_required, int page)
>  {
>  	struct mtd_info *mtd =3D nand_to_mtd(chip);
> -	struct brcmnand_host *host =3D nand_get_controller_data(chip);
>  	void *oob =3D oob_required ? chip->oob_poi : NULL;
>  	u64 addr =3D (u64)page << chip->page_shift;
>
> -	host->last_addr =3D addr;
> -
> -	return brcmnand_write(mtd, chip, host->last_addr, (const u32 *)buf,
> oob);
> +	return brcmnand_write(mtd, chip, addr, (const u32 *)buf, oob);
>  }
>
>  static int brcmnand_write_page_raw(struct nand_chip *chip, const uint8_t
> *buf,
> @@ -2381,9 +2370,8 @@ static int brcmnand_write_page_raw(struct
> nand_chip *chip, const uint8_t *buf,
>  	u64 addr =3D (u64)page << chip->page_shift;
>  	int ret =3D 0;
>
> -	host->last_addr =3D addr;
>  	brcmnand_set_ecc_enabled(host, 0);
> -	ret =3D brcmnand_write(mtd, chip, host->last_addr, (const u32 *)buf, oo=
b);
> +	ret =3D brcmnand_write(mtd, chip, addr, (const u32 *)buf, oob);
>  	brcmnand_set_ecc_enabled(host, 1);
>
>  	return ret;
> --
> 2.39.5

Reviewed-by: William Zhang <william.zhang@broadcom.com>

--000000000000b1c12f063522cae1
Content-Type: application/pkcs7-signature; name="smime.p7s"
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="smime.p7s"
Content-Description: S/MIME Cryptographic Signature

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
YDZuuBJwnyCzevMoPtVYPharioL5H3BRnQi8YoTXH7/uRo33dewYFm474yFjwwnt82TFtveVZkVq
6h4WIQ4wTcwFfET8zMkELnGzS5SHCl8sPD+lNxxJ1JDZYwIDAQABo4IB2zCCAdcwDgYDVR0PAQH/
BAQDAgWgMIGjBggrBgEFBQcBAQSBljCBkzBOBggrBgEFBQcwAoZCaHR0cDovL3NlY3VyZS5nbG9i
YWxzaWduLmNvbS9jYWNlcnQvZ3NnY2NyM3BlcnNvbmFsc2lnbjJjYTIwMjAuY3J0MEEGCCsGAQUF
BzABhjVodHRwOi8vb2NzcC5nbG9iYWxzaWduLmNvbS9nc2djY3IzcGVyc29uYWxzaWduMmNhMjAy
MDBNBgNVHSAERjBEMEIGCisGAQQBoDIBKAowNDAyBggrBgEFBQcCARYmaHR0cHM6Ly93d3cuZ2xv
YmFsc2lnbi5jb20vcmVwb3NpdG9yeS8wCQYDVR0TBAIwADBJBgNVHR8EQjBAMD6gPKA6hjhodHRw
Oi8vY3JsLmdsb2JhbHNpZ24uY29tL2dzZ2NjcjNwZXJzb25hbHNpZ24yY2EyMDIwLmNybDAlBgNV
HREEHjAcgRp3aWxsaWFtLnpoYW5nQGJyb2FkY29tLmNvbTATBgNVHSUEDDAKBggrBgEFBQcDBDAf
BgNVHSMEGDAWgBSWM9HmWBdbNHWKgVZk1b5I3qGPzzAdBgNVHQ4EFgQUq65GzwZxydFHjjYEU/9h
xHhPWlwwDQYJKoZIhvcNAQELBQADggEBAA2hGG3JPAdGPH0ZdohGUCIVjKz+U+EFuIDbS6A/5jqX
VhYAxZlzj7tSjUIM7G7IhyfqPC46GKJ/4x+Amz1Z6YxNGy71L68kYD6hIbBcA5AM42QBUufly6Oa
/ppSz3WoflVyFFQ5YXniZ+eU+2/cdnYZg4aVUnFjimOF5o3NfMLzOkhQNxbaDjFUfUYD8hKmU6v4
0vUBj8KZ9Gi1LIagLKUREn8jku0lcLsRbnJ5Ey5ScajC/FESPyYWasOW8j8/1EoJksmhbYGKNS6C
urb/KlmDGfVrIRYDbL0ckhGQIP5c6L+kSQZ2sHnQK0e0WgIaZYxaPYeY5u0GLCOze+3vyRMxggJg
MIICXAIBATBrMFsxCzAJBgNVBAYTAkJFMRkwFwYDVQQKExBHbG9iYWxTaWduIG52LXNhMTEwLwYD
VQQDEyhHbG9iYWxTaWduIEdDQyBSMyBQZXJzb25hbFNpZ24gMiBDQSAyMDIwAgwxuh2XG3FXRL1W
JOEwDQYJYIZIAWUDBAIBBQCggccwLwYJKoZIhvcNAQkEMSIEIPXHd/7L/vGXZ0aynk4qHK6LT4Ri
76aPhm1d47JuVtviMBgGCSqGSIb3DQEJAzELBgkqhkiG9w0BBwEwHAYJKoZIhvcNAQkFMQ8XDTI1
MDUxNTAxNDMyNlowXAYJKoZIhvcNAQkPMU8wTTALBglghkgBZQMEASowCwYJYIZIAWUDBAEWMAsG
CWCGSAFlAwQBAjAKBggqhkiG9w0DBzALBgkqhkiG9w0BAQcwCwYJYIZIAWUDBAIBMA0GCSqGSIb3
DQEBAQUABIIBAIUp+1HM/uNGxdZ1uKruHEZDDjOnuHvSqnUAOkjYDfKy/NRU58zcwGv7919tp9g4
A5fadEywri/cDoDaRT1R0xLO5JBg9RdOmOlCg4HOhPrrb9c8ivM1FjCKrj3VKrz9NDr3ZjRp5YBB
OKM4+83ReefjhSdHVFrH8Vsy7Utfd9V+cifbZD3oVu0nqh2cYmyUZ3QmFPQW7vW7gp/pqAFWSDHR
W04TRtAiQ83/9g1Y2S71NpU3Gb5i+R3wpsX+tMC/wENh9PM9PUElqQyhhFt9KfSXsHmTi5X7OSsH
70J9y6MiKl3jGKs00UU0cGF6J3eZUx4CwH5NTO70AMLT4ZWOCfM=
--000000000000b1c12f063522cae1--

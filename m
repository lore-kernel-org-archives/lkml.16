Received: from mail-yw1-f172.google.com (mail-yw1-f172.google.com [209.85.128.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6ACC6264606
	for <linux-kernel@vger.kernel.org>; Thu,  3 Jul 2025 11:30:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751542205; cv=none; b=WQuvkyDQF2dyVjBL4D065wU18YYlf3v1inXo110eXEVPeT+BnAbOV2xWeJwrqoq7wfcIwDUc00CPIb6vrKTqm1OFNw9dtaPNs+/aEo29C49SMs5XDiKL7g3ZZFJvv5g1iNY4xfxGrkfYV1vhQ6WUBjkKYj0rFPTwkznHlCM5hwc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751542205; c=relaxed/simple;
	bh=4rezQ5xvhatNmBndtj5h/WkqxFzjVMWMPkWaOIY9VU8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=UlIwpRvqY8TGmQiItw/Qvb20JAc6I0Ia3R+m/l7pucseXtPDIYO0uBw53FIKtgQdkDJIHrE0RPTMeD0H/SJkGEmD9DwO7fKqeN3fMdrmBgH06a6b75YK8Wtv2hofB+nfHNC9OK4NvLZNzYgFOt6EcIgPaXKJ0+t1glt4bMDdloY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=e3303z5P; arc=none smtp.client-ip=209.85.128.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="e3303z5P"
Received: by mail-yw1-f172.google.com with SMTP id 00721157ae682-711d4689084so85828217b3.0
        for <linux-kernel@vger.kernel.org>; Thu, 03 Jul 2025 04:30:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1751542202; x=1752147002; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wZmXyGV2GnPjrvT+9+iiIPALoR0f06UEdAlM9BOBaW4=;
        b=e3303z5PTKUVlfdvOvCLVR4wZEX24DtBVDZjvqTmrB+i/CwENOvePw2AbMNhtTvLpd
         RidbYIP13sxOWnh2yhZfqTS0rcPDwH7D0nNSQq42zUeA7vDwnhzV7OGUZ+eO3Uvl/H/m
         TlGdMA6PyBggTUtaGODZVCEVxezNagdBUOtHjI4mbMmRdbB3m8jvmlxm0oKGwL9uCRAQ
         dtKnQEUPeYKN1s/cfDVY3B3+3ZPu+tvpMrf/Br6wmStSO2+nap2IlSiKf89UTpfA5foj
         KNjohHsfThzdOV+yXynMeQnwKWr+4+lh3r1szvMYHU3b1EumYIcwAchfTnlB/Q28XZqJ
         ib0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751542202; x=1752147002;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=wZmXyGV2GnPjrvT+9+iiIPALoR0f06UEdAlM9BOBaW4=;
        b=IOCKVZoS9WI66ZAj9DEn4eiqFSu2DwYL3xxtnuseZT1eua6LFGGKFmLkBvW8CNr53/
         knm+euWBqkHMtEe3qsD5moneJvQ4oGkmYfGA57pN2fu0kUbgKqQ37/t6+p9PezZmAnB2
         1BduaF4QSDsWO6XoTZFDx4c2uo6zbp9Zw9uxPz551F8iqxSBLHFgSoFuHR10Rsj+hY45
         ugZDLOsXFRYooqGxertwXxW952C6uUlHIq0nqZMA4I1mPf3A1BdzyuGOuZw5OWvIfMw4
         tabEe6hWBsekUU4qDmyO12KwFgr8MOoyejehzTFyi+37IkabbZwuQ7wCPkJxOrjA0t+v
         x7+g==
X-Forwarded-Encrypted: i=1; AJvYcCW0VDjsSBl8+w68AKVVzky1fxYUFTrTcKwhQYP8hy3QYmH0rnoboZEOgqsesNGqWbzE2muKVluGRePnqgc=@vger.kernel.org
X-Gm-Message-State: AOJu0YzRDlJYCrtCFJvwT5LtiNZUBXAcGJER7aVRhEOH5O3AUFeUN9Fk
	MJkLHd+z/gxl/Xw8fyAIKSIjVmIdx8K/dFeFsjTpJ10T9bIVqYBt+0b+r/Aywdv+bwkfNYTpLBa
	NAVhjPWYmzXeCjn7ODtiXQ+PFctbwTc0XEohyoc8vFQ==
X-Gm-Gg: ASbGnctU5Uc0nHuk9mX2zDRpX3AnoQ7SRK1yYcblQgM/lUOa9XylcgZ5QJdH7tTVCMg
	AekQ03+LXZgwHbsjVN1RPN8cy0JpgkgDuMNzOAhmMjEM7K6MFTvhBC9kQmJo+sjgJdiA/2R9/+i
	nadYV+HB5LbVC70zfQ6bPIZANdJ+MXQOOmiDpF6p8cg3+u
X-Google-Smtp-Source: AGHT+IG6OfLZXa8uznpOhK3VFg2Dni19BCh2d0WU1ZI2OOuaAG3B7tP6RIZi0qM5DF0QSon7SQc8focX3HYudW0t/AM=
X-Received: by 2002:a05:690c:386:b0:710:e4c4:a92f with SMTP id
 00721157ae682-7164d305daemr79996497b3.5.1751542202281; Thu, 03 Jul 2025
 04:30:02 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <cover.1750943549.git.benoit.monin@bootlin.com> <2a43386ffef4012530ca2421ad81ad21c36c8a25.1750943549.git.benoit.monin@bootlin.com>
In-Reply-To: <2a43386ffef4012530ca2421ad81ad21c36c8a25.1750943549.git.benoit.monin@bootlin.com>
From: Ulf Hansson <ulf.hansson@linaro.org>
Date: Thu, 3 Jul 2025 13:29:26 +0200
X-Gm-Features: Ac12FXyN0y_TiN8FVImkIhaYASrLJPPgJpXiPzCWiGCMjeDhQ7YGCgW8xXzMr1U
Message-ID: <CAPDyKFpxfn+kh8r39Fwoseh=k7rtwWYJr-A9FqMLK4OSiGBGZw@mail.gmail.com>
Subject: Re: [PATCH 2/2] mmc: sdhci-cadence: tune multi-block read gap
To: =?UTF-8?Q?Beno=C3=AEt_Monin?= <benoit.monin@bootlin.com>
Cc: Adrian Hunter <adrian.hunter@intel.com>, linux-mmc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, 
	Vladimir Kondratiev <vladimir.kondratiev@mobileye.com>, 
	Tawfik Bayouk <tawfik.bayouk@mobileye.com>, Gregory CLEMENT <gregory.clement@bootlin.com>, 
	=?UTF-8?B?VGjDqW8gTGVicnVu?= <theo.lebrun@bootlin.com>, 
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
	Vladimir Kondratiev <vladimir.kondratiev@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, 26 Jun 2025 at 16:44, Beno=C3=AEt Monin <benoit.monin@bootlin.com> =
wrote:
>
> From: Vladimir Kondratiev <vladimir.kondratiev@intel.com>
>
> Additional tuning required for multi-block read command.
> Implement it accordingly to Cadence recommendation.
>
> 2 registers used: HRS37 and HRS38. To HRS37, SD interface mode programmed=
,
> this selects HRS38 slot - there is separate slot for every SD interface
> mode. HRS38 contains gap parameter,
> it is selected by starting with gap=3D0 and sending multi-block read comm=
and.
> gap incremented until multi-block read succeeds.
>
> As of now, this tuning executed for HS200 only
>
> Signed-off-by: Vladimir Kondratiev <vladimir.kondratiev@intel.com>
> Signed-off-by: Beno=C3=AEt Monin <benoit.monin@bootlin.com>
> ---
>  drivers/mmc/host/sdhci-cadence.c | 142 ++++++++++++++++++++++++++++++-
>  1 file changed, 141 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/mmc/host/sdhci-cadence.c b/drivers/mmc/host/sdhci-ca=
dence.c
> index 27bd2eb29948..6dcf7ae0c99d 100644
> --- a/drivers/mmc/host/sdhci-cadence.c
> +++ b/drivers/mmc/host/sdhci-cadence.c
> @@ -36,6 +36,23 @@
>  #define   SDHCI_CDNS_HRS06_MODE_MMC_HS400      0x5
>  #define   SDHCI_CDNS_HRS06_MODE_MMC_HS400ES    0x6
>
> +/* Read block gap */
> +#define SDHCI_CDNS_HRS37               0x94    /* interface mode select =
*/
> +#define   SDHCI_CDNS_HRS37_MODE_DS             0x0
> +#define   SDHCI_CDNS_HRS37_MODE_HS             0x1
> +#define   SDHCI_CDNS_HRS37_MODE_UDS_SDR12      0x8
> +#define   SDHCI_CDNS_HRS37_MODE_UDS_SDR25      0x9
> +#define   SDHCI_CDNS_HRS37_MODE_UDS_SDR50      0xa
> +#define   SDHCI_CDNS_HRS37_MODE_UDS_SDR104     0xb
> +#define   SDHCI_CDNS_HRS37_MODE_UDS_DDR50      0xc
> +#define   SDHCI_CDNS_HRS37_MODE_MMC_LEGACY     0x20
> +#define   SDHCI_CDNS_HRS37_MODE_MMC_SDR                0x21
> +#define   SDHCI_CDNS_HRS37_MODE_MMC_DDR                0x22
> +#define   SDHCI_CDNS_HRS37_MODE_MMC_HS200      0x23
> +#define   SDHCI_CDNS_HRS37_MODE_MMC_HS400      0x24
> +#define   SDHCI_CDNS_HRS37_MODE_MMC_HS400ES    0x25
> +#define SDHCI_CDNS_HRS38               0x98    /* Read block gap coeffic=
ient */
> +#define   SDHCI_CDNS_HRS38_BLKGAP_MAX          0xf
>  /* SRS - Slot Register Set (SDHCI-compatible) */
>  #define SDHCI_CDNS_SRS_BASE            0x200
>
> @@ -251,6 +268,123 @@ static int sdhci_cdns_set_tune_val(struct sdhci_hos=
t *host, unsigned int val)
>         return 0;
>  }
>
> +/**
> + * mmc_send_mb_read() - send multi-block read command
> + * @host: MMC host
> + *
> + * Sends multi-block read command, CMD23/CMD18/CMD12, ignore read data
> + *
> + * Return: error code
> + */
> +static int mmc_send_mb_read(struct mmc_host *host)
> +{
> +       const int blksz =3D 512;
> +       const int blocks =3D 32;
> +       struct scatterlist sg;
> +       struct mmc_command sbc =3D {
> +               .opcode =3D MMC_SET_BLOCK_COUNT,
> +               .arg =3D blocks,
> +               .flags =3D MMC_RSP_R1 | MMC_CMD_AC,
> +       };
> +       struct mmc_command cmd =3D {
> +               .opcode =3D MMC_READ_MULTIPLE_BLOCK,
> +               .arg =3D 0,
> +               .flags =3D MMC_RSP_SPI_R1 | MMC_RSP_R1 | MMC_CMD_ADTC,
> +       };
> +       struct mmc_command stop =3D {
> +               .opcode =3D MMC_STOP_TRANSMISSION,
> +               .arg =3D 0,
> +               .flags =3D MMC_RSP_SPI_R1 | MMC_RSP_R1 | MMC_CMD_AC,
> +       };
> +       struct mmc_data data =3D {
> +               .flags =3D MMC_DATA_READ,
> +               .blksz =3D blksz,
> +               .blocks =3D blocks,
> +               .blk_addr =3D 0,
> +               .timeout_ns =3D  800000000,       /* 800ms */
> +               .timeout_clks =3D 1000,
> +               .sg =3D &sg,
> +               .sg_len =3D 1,
> +       };
> +       struct mmc_request mrq =3D {
> +               .sbc =3D &sbc,
> +               .cmd =3D &cmd,
> +               .data =3D &data,
> +               .stop =3D &stop,
> +       };
> +       int size =3D blksz * blocks, err =3D 0;
> +       u8 *data_buf;
> +
> +       data_buf =3D kzalloc(size, GFP_KERNEL);
> +       if (!data_buf)
> +               return -ENOMEM;
> +
> +       sg_init_one(&sg, data_buf, size);
> +
> +       mmc_wait_for_req(host, &mrq);
> +
> +       if (sbc.error) {
> +               err =3D sbc.error;
> +               goto out;
> +       }
> +
> +       if (cmd.error) {
> +               err =3D cmd.error;
> +               goto out;
> +       }
> +
> +       if (data.error) {
> +               err =3D data.error;
> +               goto out;
> +       }
> +
> +out:
> +       kfree(data_buf);
> +       return err;
> +}

The above function does not belong in a host driver. It's the core's
responsibility to create and manage requests/commands.

That said, I wonder if we really need a multiple-block-read - or if we
can just read the ext-CSD from the eMMC, as it also allows us to
exercise the DATA lines?

If reading ext CSD is okay, we already have mmc_get_ext_csd() being
exported and available for host drivers to use. In fact mtk-sd is
already using it for the similar reason.

[...]

Kind regards
Uffe

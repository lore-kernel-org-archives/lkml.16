Received: from mail-ej1-f50.google.com (mail-ej1-f50.google.com [209.85.218.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E6972EA736
	for <linux-kernel@vger.kernel.org>; Wed, 18 Jun 2025 15:17:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750259875; cv=none; b=hW09rCdbaC6IsWY1znO78TMMQikqisdkIRg3liTAUQKccsiwvOpGmUnk8YP8hTvZscthZ/kh4MJ4lwfEtyxUY0onCGdbuxw8mynVTwqB+W6F7EgjgFmb9KSXdks5+LpeSRivi0CEZ2k++dr407OocxYGey/mY21WgT9blox0AeM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750259875; c=relaxed/simple;
	bh=wCEXTVWKezWRe3+kvueBmdTlFjLcqbpodEztZ3pmC0c=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=AgaMqrvWSZ+TZueCvfcud/zPSrwL/UnocwdBJaf6UxZ+TTifEOz4h4gT/OUVCzupkw0+/4DGVI/f6++TIQtCroJa/MP5eyhiB1vFE6/A1AHmlOOFLD7VQnxco3a/Ty1/MAXiVZL8U/mMMwDe73gK8lYx/irVRkorYrae3LiEtg8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=ionos.com; spf=pass smtp.mailfrom=ionos.com; dkim=pass (2048-bit key) header.d=ionos.com header.i=@ionos.com header.b=ckYva8Ce; arc=none smtp.client-ip=209.85.218.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=ionos.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ionos.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ionos.com header.i=@ionos.com header.b="ckYva8Ce"
Received: by mail-ej1-f50.google.com with SMTP id a640c23a62f3a-ad8990ad0a3so104732666b.0
        for <linux-kernel@vger.kernel.org>; Wed, 18 Jun 2025 08:17:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ionos.com; s=google; t=1750259871; x=1750864671; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GqtCpc28xpA4VZWWsqjDW7hxuFsc37md0v7DTHRyNBY=;
        b=ckYva8Ce01oU5cO9EQ5nWRo5GxR+5/Oq7wS//pyMASo+ikIT+chHPRD5eu4dIo9Khf
         UTyZgusQnyBfDnz2bYoSOZkzOGtvJ9Ioqj5iG/srMgWtX1hxiMsj0q9kXHDeMvytbpzi
         /06e+UE8N6U+mJZ4/sp+r+H4SpyorkB57EUgnyoUwqpJcV50YW8YAT++qeR/3nLHeOqz
         8mMfCbq76IA7XbEGZjGcnBLWGxgNhYRbf//BgTS4ZHMzWQzBNlqmeHSztRtOUEtbQ5It
         9252KR8VmI7NR6mOba7Cyi+ng2YWdzZQ0/jfiOUYqSL/IwTXNjp5mto92/5nIOk3ku+7
         giyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750259871; x=1750864671;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=GqtCpc28xpA4VZWWsqjDW7hxuFsc37md0v7DTHRyNBY=;
        b=voSE1k2KFJ+WyGmmhco/5UPwpu2cx1P7U7guj4QEFSom08z/IEzAlvlVqoko5++E7Z
         fshPHeDjgxaNoaqElU2WlylGjoZ8YC22WjyORc5WX7inMzT8HiIqp48qA4vkf8qaxqcX
         tapzpTVrdFcKP7aXnETF2RKCjR2xO1CSVhyeyabZaS67yy0ADMbc9zlZZz9aNYPLXiEm
         9+3AjTkHXmk/f3rC0Gv+CKlOwoCt2gS2fb1fiaaSdMXgAYaagbLUDQZ9Cl6D2dhnGks0
         NrRvCX0D62OTfQocRzoygLNQOuzDq7AMWYmMF/zwhvzZMaepchcWePKZVadrk2aFO/QX
         OKvw==
X-Forwarded-Encrypted: i=1; AJvYcCUnZHXTYBL0Wognd/UXyAKjzAkevNzK3ncywWLWgUMjo1LBNYKr9snJaxwpDb6tfLBOYsKwwvRI3njnYfI=@vger.kernel.org
X-Gm-Message-State: AOJu0YwTQeNaI7xnpB50/yu4dgXtJluNTKCzDMjS3wCrpCbB9AGLto1k
	vMiemiGvy5sBTOBiC7ubBaiz+EGFFelwtldyVwIt019i1KCW9nFxic9lSHD7PLyzOpnyL7zV5HU
	SlpzzgSN0qkbl5MPO5x5ADNcKvnK+G7w8mY1qQU5kqw==
X-Gm-Gg: ASbGncv7I1ulb1u6qOlnRBcP2Vh14DXasj+TV4VlZHeUTduqPnGX2TOpS9d38kcSza1
	RXZO0pWyhwOfn1/zQrCxIP+76Ezbe/atw5/MapTK1ob6wNTfsd61QtuyrP40BarHfLmQS9/HOEN
	aq5wZ0O47B7ASy7S6fHdypBI3oeZU9ypQimIDggbpKc3RAiUTp57Y59DI/B6WyDESTR+N0ERl8t
	6zfX9EIhYU+wyU=
X-Google-Smtp-Source: AGHT+IGL55qHTnc/YF0chjzSE+oRyofOafjvA8Omq0cOKVVelFnONtLs6G4uzE4r7qfErywKZs3NDgaXyI3JhSekK1A=
X-Received: by 2002:a17:907:7f89:b0:ad8:9b93:8579 with SMTP id
 a640c23a62f3a-adfad01eb84mr574368966b.0.1750259870793; Wed, 18 Jun 2025
 08:17:50 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250617210443.989058-1-frankramirez@google.com>
In-Reply-To: <20250617210443.989058-1-frankramirez@google.com>
From: Jinpu Wang <jinpu.wang@ionos.com>
Date: Wed, 18 Jun 2025 17:17:40 +0200
X-Gm-Features: AX0GCFtFmbz6rbvhamkWddwvHsnhfjVvpjmxiqJOa-d9vJV2Nx-qOPfFoMBpFt0
Message-ID: <CAMGffEnbCe1y78O69GpT-gUqY5m5jNLsHbBue8EBMFc-wgcoYw@mail.gmail.com>
Subject: Re: [PATCH] scsi: pm80xx: Free allocated tags after failure
To: Francisco Gutierrez <frankramirez@google.com>
Cc: Jack Wang <jinpu.wang@cloud.ionos.com>, 
	"James E.J. Bottomley" <James.Bottomley@hansenpartnership.com>, 
	"Martin K. Petersen" <martin.petersen@oracle.com>, linux-scsi@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Jun 17, 2025 at 11:05=E2=80=AFPM Francisco Gutierrez
<frankramirez@google.com> wrote:
>
> This change frees resources after an error is detected.
>
> Signed-off-by: Francisco Gutierrez <frankramirez@google.com>
lgtm.
Acked-by: Jack Wang <jinpu.wang@ionos.com>
> ---
>  drivers/scsi/pm8001/pm80xx_hwi.c | 12 ++++++++++--
>  1 file changed, 10 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/scsi/pm8001/pm80xx_hwi.c b/drivers/scsi/pm8001/pm80x=
x_hwi.c
> index 5b373c53c0369..c4074f062d931 100644
> --- a/drivers/scsi/pm8001/pm80xx_hwi.c
> +++ b/drivers/scsi/pm8001/pm80xx_hwi.c
> @@ -4677,8 +4677,12 @@ pm80xx_chip_phy_start_req(struct pm8001_hba_info *=
pm8001_ha, u8 phy_id)
>                 &pm8001_ha->phy[phy_id].dev_sas_addr, SAS_ADDR_SIZE);
>         payload.sas_identify.phy_id =3D phy_id;
>
> -       return pm8001_mpi_build_cmd(pm8001_ha, 0, opcode, &payload,
> +       ret =3D pm8001_mpi_build_cmd(pm8001_ha, 0, opcode, &payload,
>                                     sizeof(payload), 0);
> +       if (ret < 0)
> +               pm8001_tag_free(pm8001_ha, tag);
> +
> +       return ret;
>  }
>
>  /**
> @@ -4704,8 +4708,12 @@ static int pm80xx_chip_phy_stop_req(struct pm8001_=
hba_info *pm8001_ha,
>         payload.tag =3D cpu_to_le32(tag);
>         payload.phy_id =3D cpu_to_le32(phy_id);
>
> -       return pm8001_mpi_build_cmd(pm8001_ha, 0, opcode, &payload,
> +       ret =3D pm8001_mpi_build_cmd(pm8001_ha, 0, opcode, &payload,
>                                     sizeof(payload), 0);
> +       if (ret < 0)
> +               pm8001_tag_free(pm8001_ha, tag);
> +
> +       return ret;
>  }
>
>  /*
> --
> 2.50.0.rc2.696.g1fc2a0284f-goog
>

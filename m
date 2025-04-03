Received: from mail-ej1-f41.google.com (mail-ej1-f41.google.com [209.85.218.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4A32619C574
	for <linux-kernel@vger.kernel.org>; Thu,  3 Apr 2025 05:27:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743658058; cv=none; b=K17O50dY39dFBskeEiVCeh5t3zSM60Lu+u2NzKRBJibeE0cBuj04NNIipcAjPOc1dSFayoWqMG5A1J0XYyN3TSal9wx0BhP2GXAjB8ZgOCgs6WxJ1FgEY8mS2b/KKAMHk947FXN5Ui4aBaqVix2mfpNdiVu3DCvS63HbHnG1PXc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743658058; c=relaxed/simple;
	bh=hvjrlvSg+m0lBDCJ6n1/h9y/sAEsNJ7+njvAq0qiFHc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=etXr8GBKPsNm5OJ7XjYq7gn+PON2N6r53PrSB7XStA1njYRgXX2TFqd+Kvhn8VvC7H2J9yJHsr8Ez9kNxMRsKIzxn2bGM4zMwRSlbV3zH7nVmXspYJ2oV3mY1VxRqc7INnhOcHn0nUCRRBnozw9efE801lyyo1Rb8GgNbhtk0DE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=QCxfScO+; arc=none smtp.client-ip=209.85.218.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="QCxfScO+"
Received: by mail-ej1-f41.google.com with SMTP id a640c23a62f3a-ac3b12e8518so96736466b.0
        for <linux-kernel@vger.kernel.org>; Wed, 02 Apr 2025 22:27:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1743658055; x=1744262855; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=IyMY2OXjejHMpppLC+gFLxGr7yisUTx8VU7zvak3fTk=;
        b=QCxfScO+8PdMwVzjcB1XqRlYYAqZ1XFxRLIeA3RMLDPhlqMoROHG1R2KnmwcF4IIBu
         9X63wqojVCxc7f1ZfOGqvhXec2aldQvGLAdHm0rGaG8rHISgT/X2lFtPO/bdoj/lF/sn
         7NHW7KeKEB9YKE5yzc3nRY54/iDVAou2yTvU2hlZeZWWQ4jzAa+6EP9+Pbi3yOmRmWpF
         yiZ35qD9AG2MK9CKnaa+igPFUcDFdesvQzGH3xyHd9UIK6T4EG6pvLdhbqIwK/t3NQm1
         iFY4xIVlSbLvutpjWufziLxfBZIKD7kU4dRogxn1uw1bSMk0EZWKyQm4v19HteKuk2xo
         6iQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743658055; x=1744262855;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=IyMY2OXjejHMpppLC+gFLxGr7yisUTx8VU7zvak3fTk=;
        b=BJ5boeeOcXwJ4m4jwqb+8lzauekQ6yymq2Dv7kenSo0BJIWSA9383zx84wN3SLoio8
         HXUQfsSQCmO84+GIldBwDOuFQ+fqrVeGg0/i/4MjoLkOdUVrjajzGKzzJtsMBZMAdvGt
         3Bz0LUqBzEiqhYPcxCUTIJ3q5ApZovG25lglDtA2xI1fdFJODz44RWDoPniGelAYAegt
         V2bbdqpKr7TaWi7IiJNA/BkqBhLuxVCRVn88MbVTr2XuEBJr6vcDc62RklKEE1h6MLyN
         1vLPaNC6cVR9ayP5MmL79t5xNg7PzVzuWtFLs82Wyf6z0kRiPhcIbAgPXL4vfB9GBkTB
         rpeA==
X-Forwarded-Encrypted: i=1; AJvYcCUIQp7mjyt7AY+oIpBu0ly4/p4Yv9dq9LCpOODLPro+83K3pS3MGob7c4ZBNPbLyoP7qkw7yvq+LJtThRY=@vger.kernel.org
X-Gm-Message-State: AOJu0YwNzT4uaWO17vakNztSqlKcfiCs6Zf0a5jwixfJ2+94wKiCVttR
	/mYl/Mi3xfZz3SzzZmSxAuh1l7ff4AFm2JGnaTbeTc4Q1lZGxj2+oODWEWaBtQ+Wc6wE6DKqHPk
	yZTZEn4fpys9p9pCVDY1qNlKCuWY=
X-Gm-Gg: ASbGncvik0AvMf/rmEG4y5Z2NwvSsH43pKYGSYiq9Utp1QuCcmZaLY2eG1BB2gCijJS
	dG5DR3qTA7n3hD/6Xr5lraTOA93QMuBCoGjbZ7pYhHPDC0dRj+vMqBuvlRCmDVALtOm2jtE8UhZ
	p3GGSM7BHEjR2xmPAZBWL4fQu8Gs9vNpQpQyeA
X-Google-Smtp-Source: AGHT+IGovQXLbbdbCSHS4ydKtET+lc3lBRWB9d7z9Vd5ovg6kbp9eQCovOgD4q8b/xER7kizK7DNlBR10Q4y0o/FQ3c=
X-Received: by 2002:a17:907:3e12:b0:ac7:9937:e259 with SMTP id
 a640c23a62f3a-ac7bbd472cfmr101031366b.0.1743658055294; Wed, 02 Apr 2025
 22:27:35 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <cover.1743635480.git.abrahamadekunle50@gmail.com> <f04b31c428beb6195ad5df5116d1421fc036af16.1743635480.git.abrahamadekunle50@gmail.com>
In-Reply-To: <f04b31c428beb6195ad5df5116d1421fc036af16.1743635480.git.abrahamadekunle50@gmail.com>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Thu, 3 Apr 2025 08:26:58 +0300
X-Gm-Features: AQ5f1Jr9q-DMHaDBKn30tVff0dED58LLdPAo3xT3e2KL4Zz_f00nTe-c7-qL80I
Message-ID: <CAHp75VegJ+DgG1g2PJ0WQMUFpMrt1aJOb_NgvzL90NsuD_Oosg@mail.gmail.com>
Subject: Re: [PATCH 2/2] staging: rtl8723bs: Prevent duplicate NULL tests on a value
To: Abraham Samuel Adekunle <abrahamadekunle50@gmail.com>
Cc: outreachy@lists.linux.dev, julia.lawall@inria.fr, hdegoede@redhat.com, 
	mchehab@kernel.org, sakari.ailus@linux.intel.com, andy@kernel.org, 
	gregkh@linuxfoundation.org, linux-staging@lists.linux.dev, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Apr 3, 2025 at 2:30=E2=80=AFAM Abraham Samuel Adekunle
<abrahamadekunle50@gmail.com> wrote:
>
> When a value has been tested for NULL in an expression, a
> second NULL test on the same value in another expression
> is unnecessary when the value has not been assigned NULL.
>
> Remove unnecessary duplicate NULL tests on the same value that
> has previously been NULL tested.
>
> Found by Coccinelle

...

> -                       if (psta) {
> +                       {
>                                 psta->sta_xmitpriv.txseq_tid[pattrib->pri=
ority]++;
>                                 psta->sta_xmitpriv.txseq_tid[pattrib->pri=
ority] &=3D 0xFFF;
>                                 pattrib->seqnum =3D psta->sta_xmitpriv.tx=
seq_tid[pattrib->priority];

Same comment, shift left and remove pointless {} altogether.


--=20
With Best Regards,
Andy Shevchenko

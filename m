Received: from mail-ed1-f42.google.com (mail-ed1-f42.google.com [209.85.208.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BFBD633997
	for <linux-kernel@vger.kernel.org>; Fri,  4 Apr 2025 10:53:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743764036; cv=none; b=GWQFa7+mwcpA1xTOq6e0T96KLNYGsCOVAw2bwRinCsR7yJrri5EZfm7oa58NBd2szCLD5f+pqMbykaXBCVGkP53McTBEBe7DFtYlqFkSIkUa9gc2AFekI2Myu683IvAuIeaJerw7jjvNHcro4WACgNR69EQBi9efT7wrp9YdWWM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743764036; c=relaxed/simple;
	bh=BZCPedUVcTzEEIOESnFwk8dQ2HdKzUmeXl81sv2UEek=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=aVgQYq2GLuVzvspNZvj3xg/XqODWNrU0HTcttMfF4via4+qstU0myLEIZEt09+gdIYBfJZUzOlKYhEkpFbsjmEB5bYSokjjGCiu7UiydTlUi71LNreljfkgMvSpPwciq2m93gDDf8SVcciib8gnKKKvSHJ9TIUirlM/srWgHz2E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=KG3X1D/R; arc=none smtp.client-ip=209.85.208.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="KG3X1D/R"
Received: by mail-ed1-f42.google.com with SMTP id 4fb4d7f45d1cf-5e61da95244so3275220a12.2
        for <linux-kernel@vger.kernel.org>; Fri, 04 Apr 2025 03:53:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1743764033; x=1744368833; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=SzoKOi3kQybFr6KxUAkiwvnDG/qKD+NYmi5Me4dtT8g=;
        b=KG3X1D/RIZ4LvoGAa+CF9uFNax+9d7gkuDoejf+IoHtp54ytoFKyFeyXaqpn4acSHA
         PzslcIRIRRFizZNDiT75+o7mIcVur/B2EQuXwwpZu8Z7KTskH1qgCXtrKz9hdFshOrAi
         YUECml1OYhL9vJcjz5nPdSlLH9dH4IkUcRfJRk6Ab9RkTbxDekMQRVo5wT8ZFq749/S5
         94Dt7cbhZqhFjXlI3lCMM4ydJG9361NPtzXstC+qIQsn1lIbsK2Z+nnCWNYg4WBmJjMg
         QPU+Z3HwcVEk+/0S96np7Z1+iUIXbUYc7x84UCOL6MTZ5g5WDIoRm62g2EM/FADIykJv
         zusg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743764033; x=1744368833;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=SzoKOi3kQybFr6KxUAkiwvnDG/qKD+NYmi5Me4dtT8g=;
        b=Z88cYBp3fiG9ObTjR3zvdMg63rx1VR2O5G+ILol7HuZkPZMByvqK6ivBmreD1rWs7K
         gXHeHIfIVgvuejc13r10sXH79FsMkKIJZ/6Ar9jRIL14ICp6A3uM+8vM6ToUB9ijfWk0
         JQ61QR9kfsG2tfS7fqItdNvRf25g16LSTd4W2bPsHZcwXx19/csfptqrore2gBScjaDG
         QETKNxuPytbMQy7tds8VvU2VfVVmFpEeg1I06O2fVVCsJPoZ62fmOJWi/OKm33orB5H4
         KfefCynicHUrdYW23uRkRKsvLkq3rnihhvj/Y5dxEIj0eE5D5hfyYOvQZBwkk2lVguW3
         kHDA==
X-Forwarded-Encrypted: i=1; AJvYcCXhUPueUmMDM++FMxzYF4PkFWvXgGVMi9Cu8U45tPNigkoGF+ILrSpS1BbYotc72s65trGz8oIW+l7ZqsQ=@vger.kernel.org
X-Gm-Message-State: AOJu0YzNWNjC/3r+NJOSBiGGDxjRRCuShfZUYMU40Xag68ApGjo6MTI9
	sDFsRFVlqkUm/7vfNSsxTG7HwbVoSbb7vTRPmQY0Yda7d/5ENhM5k38S7C/b+J8ffdBRQXXmhQn
	Lfrd13NPpNuiE50feSESt8mXLoDo=
X-Gm-Gg: ASbGncvKhC65+MBPXFVI3YZrmFCMWWnqrARkqiQKZOnutyponvcziVGiLF2piYGOhdY
	udwhl9ldKj5QTyGhbP36yyJHTLPkYfqN2HH9edEindD72wD8IeLjdd9G5qHydZJ7lVvNAIUXf79
	oHO2MIKFaw98iRfGtH/XVvV1q60RIJ
X-Google-Smtp-Source: AGHT+IEPV8PAptMWDzfSdlSImvE7AO2/uprJzp9c+dI/pYZBjRLhfIX603krWrIhQBVUgvcHx5yh2sq0T5QpfCoLFG4=
X-Received: by 2002:a17:906:c156:b0:ac7:1ec1:d8bd with SMTP id
 a640c23a62f3a-ac7d190dcd8mr276168666b.29.1743764032815; Fri, 04 Apr 2025
 03:53:52 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <cover.1743723590.git.abrahamadekunle50@gmail.com>
 <6fe7cb92811d07865830974cb366d99981ab1755.1743723591.git.abrahamadekunle50@gmail.com>
 <CAHp75Vem1E9wmmfXWsbawj2f+F=UkfzML7HyAnhTdsUqvjW91g@mail.gmail.com> <33a8d769-33b9-43df-9914-99175605b026@stanley.mountain>
In-Reply-To: <33a8d769-33b9-43df-9914-99175605b026@stanley.mountain>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Fri, 4 Apr 2025 13:53:16 +0300
X-Gm-Features: AQ5f1JrMhUrmnx9y1Elr0jkkAtENgAZyuItBSPMV9LiPOkfcs7Op25giXezOGJk
Message-ID: <CAHp75VfDOaK0EXNc79cM1mNWapm7fhshU550q1mAKQdtRbUNwg@mail.gmail.com>
Subject: Re: [v3 1/1] staging: rtl8723bs: Prevent duplicate NULL tests on a value
To: Dan Carpenter <dan.carpenter@linaro.org>
Cc: Abraham Samuel Adekunle <abrahamadekunle50@gmail.com>, outreachy@lists.linux.dev, 
	julia.lawall@inria.fr, gregkh@linuxfoundation.org, 
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org, andy@kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Apr 4, 2025 at 12:06=E2=80=AFPM Dan Carpenter <dan.carpenter@linaro=
.org> wrote:
> On Fri, Apr 04, 2025 at 10:53:22AM +0300, Andy Shevchenko wrote:
> > On Fri, Apr 4, 2025 at 3:03=E2=80=AFAM Abraham Samuel Adekunle
> > <abrahamadekunle50@gmail.com> wrote:

...

> > > +                       psta->sta_xmitpriv.txseq_tid[pattrib->priorit=
y] &=3D 0xFFF;
> >
> > > +                                       psta->BA_starting_seqctrl[pat=
trib->priority & 0x0f] =3D
> > > +                                               (tx_seq + 1) & 0xfff;
> >
> > > +                                       psta->BA_starting_seqctrl[pat=
trib->priority & 0x0f] =3D
> > > +                                               (pattrib->seqnum + 1)=
 % 4096;
> >
> > Logically it's obvious that you need to align all cases to have
> > consistent approach.
> > Besides that the commit message should mention this change. Something l=
ike this
> > "While at it, convert '& 0xfff' cases to use modulo operator and
> > decimal number to make the upper limit visible and clear what the
> > semantic of it is."
>
> No, I'm sorry but that's really against the rules in drivers/staging.
> Don't mix unrelated changes into a patch.  It needs to be done as a
> separate patch if we're going to do that.
>
> To be honest, I don't even want people fixing line length issues or
> adding spaces.  I would have accepted small white space changes but I
> prefered the v2 version of this patch.  Once you start changing
> "& 0xfff" to "% 4096" that's not white space and it must be done
> in a separate patch. I use a script to review white space patches
> because I'm always nervous someone will slip something malicious
> into 100+ lines of reformated code.  It's really fast to review
> patches with my script but once people start mixing things in then
> it's a headache for me.

Separate patch is even better, indeed.

> Also if the change accidentally introduces a bug, I want it to be a
> one liner change and not something hidden inside a giant reformat.

The noisy {] have no point to be left. Now I'm curious, what do you
propose here?

--=20
With Best Regards,
Andy Shevchenko

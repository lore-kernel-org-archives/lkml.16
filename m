Received: from mail-qv1-f44.google.com (mail-qv1-f44.google.com [209.85.219.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B827024CEE8
	for <linux-kernel@vger.kernel.org>; Thu,  3 Apr 2025 17:53:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743702807; cv=none; b=FtCXb8+nFIhNZeHkvAbQ5iPWKUG00DYCHzzdX3Xj4PPlx+7okRaCKDNBotiHmfp+g/AfcK6uIu49LiSZdQHTBmx550g0nLEp7isWMBkUOr9YR5+CmwSD9Wsvbwg+zy/ugc3r+t9MFRxRUlVKgwntnpj9EkVfXxkUgrt1bO0hTaU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743702807; c=relaxed/simple;
	bh=nJ8P8iSl2Rud9cQgkk2oyj4Nw4zewsVFtiPThQu+iF0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=NX3BuxqNAd041wsZ4fpU3U/eIKgUueZ0WvDcBVPbYdhEvkACtPPivUuw8MxsufmV2Pjvw0u83vt73/pijUwKmpa1lWIQz3ZF7zfu+PV8ulo0iljBCKoSRbXMRjKp2+hhoXyrXvAOqcXiPHx7DetSHC6PIDaVq28vXj4MwPOaXYw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=Nutgc6Pp; arc=none smtp.client-ip=209.85.219.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="Nutgc6Pp"
Received: by mail-qv1-f44.google.com with SMTP id 6a1803df08f44-6ecf0e07947so11973886d6.0
        for <linux-kernel@vger.kernel.org>; Thu, 03 Apr 2025 10:53:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1743702804; x=1744307604; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=i1pDUEscKj1Os+peQBo0kQaDotNDCTOulI3xxjBqRM0=;
        b=Nutgc6Ppai4dVXhduOKHeV7Ff6S0/uUrmPDaTFJecMkufIhJYBSvE6W71z5xkApUX1
         bwNa9o9bOeoXjNCUaE8qyxhHuvaFcoYjaZwZSDvY8JHphbJoiImZfhinqlRMxdforc7Y
         fDs8ZSGLB37zdfDqIvAUfuy0rmv2t1gz2GZH0g1Y/UeqemwRl/CWm6REmGfKzOTsvve2
         Ome/e5oLnSrlpIz9JTR3A7Ih8VIYhR3XNYP2yA09KAdvdiEyxRZeTr7MNhmERXg9Xr5e
         Mzbh0GTaJtjjPjTkHCxlc9DHR6b6BQHQYxPcAm/S9CleHeWIuymSxbkZShLrzQvnpIST
         W6Wg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743702804; x=1744307604;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=i1pDUEscKj1Os+peQBo0kQaDotNDCTOulI3xxjBqRM0=;
        b=tnq24BDhmGXotTndL6+UW4Ia8KCO4cZT+ozBgFQt2tTEW1Db57Hu96V4in58ZrcJZJ
         mTAUAwQFpC5vE3d2OGgOW0W4J2FkGbWdSycGOwVANFtvObFmhHcdSVYMkBYY6pPOuPhn
         ApvffCs6VaH6eqvClL9/fkN/hjkb4kmCxUEUuNcO9Vf7P+xsDEYFy1lgulqV7Zkpxrb2
         IiGDVpGjyPwWAgPJZ1wX3TnkzCPYCFebaUqgv+q5BizdJqfZXIl3Js+0TEP0734C5fmP
         KsqK8QCi7xx82LRpopVdwHxMHDBl7Q5M/+wMagMgKoTpu+MvQEIAcOBYoagV9r1rZ9Om
         QQxA==
X-Forwarded-Encrypted: i=1; AJvYcCXuZ59MSC1Y96b1JKHzWOfMPwDuHQ+u/yyNMurQN5uWXfbEsaX2mY5PRLlsvrEcCn0syMTBphS/d73AZtY=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz5R1gShEPxv14o+TxMo0itf3Z3MWm6NU6Gnc9NmYXj1JBMeOGP
	amiaEqX2aErHTpGm/ZMNHq9kFo5VsmLgXV9dCB/AmwCoRRE40AoT/AVmxN7V4TLp7Yc6nIXJoYG
	9HOhDeJlZNqqDH5oV/UQ+4eJAvfjX20278vI=
X-Gm-Gg: ASbGncsLQ8NuaRkiF+G8cZrnzFc5S4qu88X6Mn/dFFnNrJJRggdt2TE1x8B+/6BsrHb
	qJB1W+ffTHUlI7O1EYg2wFkgAzKH1tM7MvbhZte/d52UjZvxpmp4SXkZA3RcIfm3NYYBzJgiYYd
	PcNkRsbRnGVYDBxUM1pVslTvEVxw==
X-Google-Smtp-Source: AGHT+IGsQAS/vDMHleY+gdz7l418Xx70O/fvD1la7fWn33WmGNlS51X68cp9ILIAIkhbuIL68l77+iA5YwPwG/oefRA=
X-Received: by 2002:a05:6214:2528:b0:6e4:4676:85c3 with SMTP id
 6a1803df08f44-6ef0bec78e0mr66578316d6.11.1743702804283; Thu, 03 Apr 2025
 10:53:24 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250402011832.2970072-1-yabinc@google.com> <20250402011832.2970072-2-yabinc@google.com>
 <CALJ9ZPNBGBd9OTBgedoQStXh3d2oGDGi6fUF7PXbU5qTEBRHew@mail.gmail.com> <20250402130145.GI115840@e132581.arm.com>
In-Reply-To: <20250402130145.GI115840@e132581.arm.com>
From: Yabin Cui <yabinc@google.com>
Date: Thu, 3 Apr 2025 10:53:12 -0700
X-Gm-Features: ATxdqUHHcDcKVLeupaSiGhXiC7bOvmKwN3NcRZXw1qMIRHgc3mg76yRhMNK6d3w
Message-ID: <CALJ9ZPMx7vqjgkn8OApLBAPwF35v=enHc07A==LXG0C+922rag@mail.gmail.com>
Subject: Re: [PATCH v2 1/3] coresight: catu: Introduce refcount and spinlock
 for enabling/disabling
To: Leo Yan <leo.yan@arm.com>
Cc: Suzuki K Poulose <suzuki.poulose@arm.com>, Mike Leach <mike.leach@linaro.org>, 
	James Clark <james.clark@linaro.org>, 
	Alexander Shishkin <alexander.shishkin@linux.intel.com>, coresight@lists.linaro.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Apr 2, 2025 at 6:01=E2=80=AFAM Leo Yan <leo.yan@arm.com> wrote:
>
> Hi Yabin,
>
> On Tue, Apr 01, 2025 at 06:21:59PM -0700, Yabin Cui wrote:
>
> [...]
>
> > > @@ -486,12 +491,17 @@ static int catu_disable_hw(struct catu_drvdata =
*drvdata)
> > >
> > >  static int catu_disable(struct coresight_device *csdev, void *__unus=
ed)
> > >  {
> > > -       int rc;
> > > +       int rc =3D 0;
> > >         struct catu_drvdata *catu_drvdata =3D csdev_to_catu_drvdata(c=
sdev);
> > > +       guard(raw_spinlock_irqsave)(&catu_drvdata->spinlock);
> > >
> > > -       CS_UNLOCK(catu_drvdata->base);
> > > -       rc =3D catu_disable_hw(catu_drvdata);
> > > -       CS_LOCK(catu_drvdata->base);
> > > +       if (--csdev->refcnt =3D=3D 0) {
> > > +               CS_UNLOCK(catu_drvdata->base);
> > > +               rc =3D catu_disable_hw(catu_drvdata);
> > > +               CS_LOCK(catu_drvdata->base);
> > > +       } else {
> > > +               rc =3D -EBUSY;
>
> This is not an error if the decremented reference counter is not zero.
> It should return 0.  Otherwise, the change looks good to me.

In coresight_disable_helpers(), the return value of catu_disable()
isn't checked.
The -EBUSY return was used for consistency with other refcounted
disable functions
like tmc_disable_etf_sink() and tmc_disable_etr_sink(). I'm happy to
change it back
to 0 if you believe that would be the more accurate return value here.

>
> Thanks,
> Leo

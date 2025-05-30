Received: from mail-lj1-f169.google.com (mail-lj1-f169.google.com [209.85.208.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 69E9E224D6
	for <linux-kernel@vger.kernel.org>; Fri, 30 May 2025 00:51:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748566262; cv=none; b=gqUPUjshd1qFoVumBAC0LHPZTvM+CAtkS9pafKtQn7mHl81MVRHkcsV6hDfKlUYA52D3WxCr+oUkgPYRRMx96O0ZA+Yp4bhO9kZBFsEdPfICtRu5MS39Ndomx+k6ow4UnjszkCTYzUsdBeC8/DyiYs2tdSzTJ5m0u755PSRPLhY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748566262; c=relaxed/simple;
	bh=j90FZmy4DEJrDVtS1gLkiRde5vGGcByNWPeqa/Z3bcI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=err896yd3VIW2LEsV4en3VBKMBrigAlSOBaP+9Ayswi6bE3k280kgsKtuPoRCqK+dbgQpGW+rCnrnVNWfgG/lWhYtv3YSWODEfSo6emhSZfw32fZ40FMiVAG5dc7Gm2bvIgeU9romWPAiob0JD2kCoUiEWJbL2shNx5kObWhFz8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=broadcom.com; spf=fail smtp.mailfrom=broadcom.com; dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b=T8pa/qxT; arc=none smtp.client-ip=209.85.208.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b="T8pa/qxT"
Received: by mail-lj1-f169.google.com with SMTP id 38308e7fff4ca-32a72cb7e4dso15998391fa.0
        for <linux-kernel@vger.kernel.org>; Thu, 29 May 2025 17:51:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1748566258; x=1749171058; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=j90FZmy4DEJrDVtS1gLkiRde5vGGcByNWPeqa/Z3bcI=;
        b=T8pa/qxTV1FUDiglExhT0uccCsYa8Akq17rDEsZ1yVwPYsCO1HFPGnePoX08l1B1Cv
         PY0YDwKiIuktxs/1AXkp/8IXOhljxyJ4SZIb7UJMXdvDWYRvEDDiRfqyY8WfZY3CLRVw
         fXJFIyRgwFHT3PvSOFnGxrohHwCdBOtbv5CfA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748566258; x=1749171058;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=j90FZmy4DEJrDVtS1gLkiRde5vGGcByNWPeqa/Z3bcI=;
        b=dP0EpF5M4mBcvuELkUa8oGbUBk41aUuIAEJNMQx2fLf6z8NP+YJgJmoEUG+ebhm6kk
         BoXTRfSKDfJoIGfewMtQaA7w0lhrWuMUB4zbHgMZhBeQDUNpAKPnruAqe/vUx7g97cj+
         VIGv1IUnvVg2jDmX1GV5y49Jty9SDf6EuCi6Q9awUjjv/6j4Pabj3iObFDssdAA3DsOl
         kSrx9SedoUy3y9fodFs+Z5+GvEHOBg2bZ8KZUxrxYh/RoaC5mLaeNTMKE3JvxS8MWJFI
         0M8SOL+8LPoLGI+oJyS5+qVUatgfwUJNoyl+TqZhAhYWCo2gb1SfMt3X1uT/H0Ks5nVJ
         6YqQ==
X-Forwarded-Encrypted: i=1; AJvYcCWeNFFsLxhdyyeDhmssm4c9Md0BIMaMVVT5Kuk6Tnj5GzxQrN8raqoymx3G6hA9eTBJgxZc0w9ay3Suor8=@vger.kernel.org
X-Gm-Message-State: AOJu0YwI4tCZBTfeGvMtg271nRzO1OfgcAfebIsVqnZIOlQDvXXDRe4V
	PJ5VIflHYEnPRiYhGcHPFTeghGh7RrEqmxLWaOpsmyeZQklQma98IY+4YJwo+0y1dcHEdcswbKs
	uG+v8kPvOzXVhkEbnogxvvqBarhNsNEFNl9CaVG6S
X-Gm-Gg: ASbGncvj794bc8h0W+H+42D8hLZVhqgE/8gHksmJkDnVkUzKHliMxbJzQbqLUKlaZey
	4QHCp77VX98EJAnU0BLqRQcacXiowZOZRX911Yy7/3h54IG3qlnPhaSzw1A9taQR4PK+dR2KpFc
	oTMETaXT8qvbeejntXkcPjAexnUD7ShE5WCIPt4d0PvshM
X-Google-Smtp-Source: AGHT+IE2OMsxzwQzeTrwgN2Hez064UFdOpids0WCZHGQIRmxCVKPL8Xl/szjSGwe1gyhi+KhbeBt7vwdg9fn04v1Gmc=
X-Received: by 2002:a05:651c:1477:b0:32a:8614:4623 with SMTP id
 38308e7fff4ca-32a90691f96mr864261fa.16.1748566258461; Thu, 29 May 2025
 17:50:58 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250513210504.1866-1-ronak.doshi@broadcom.com>
 <20250515070250.7c277988@kernel.org> <71d0fbf8-00f7-4e0b-819d-d0b6efb01f03@redhat.com>
 <CAP1Q3XTLbk0XgAJOUSGv03dXfPxcUR=VFt=mXiqP9rjc9yhVrw@mail.gmail.com>
 <CAP1Q3XQcYD3nGdojPWS7K4fczNYsNzv0S0O4P8DJvQtRM9Ef1g@mail.gmail.com> <20250529163354.1d85c025@kernel.org>
In-Reply-To: <20250529163354.1d85c025@kernel.org>
From: Ronak Doshi <ronak.doshi@broadcom.com>
Date: Thu, 29 May 2025 17:50:40 -0700
X-Gm-Features: AX0GCFsRGySz0X3WjPXoBvDLDY3cvim3BsfdsBIzJvAllSe41uk0HX-0g9guY-g
Message-ID: <CAP1Q3XR1j77BBJ3aNm_YKo7gPdR+hdKcDHGNz0CBTuKFccuK5A@mail.gmail.com>
Subject: Re: [PATCH net] vmxnet3: correctly report gso type for UDP tunnels
To: Jakub Kicinski <kuba@kernel.org>
Cc: Paolo Abeni <pabeni@redhat.com>, netdev@vger.kernel.org, 
	Guolin Yang <guolin.yang@broadcom.com>, 
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, Andrew Lunn <andrew+netdev@lunn.ch>, 
	"David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
	open list <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, May 29, 2025 at 4:33=E2=80=AFPM Jakub Kicinski <kuba@kernel.org> wr=
ote:
>
> You put Paolo in the To: field, so I assumed your messages are directed
> to him. I'm not entirely sure what you're proposing, to apply this
> patch as is? Whether your driver supports segmentation or not - it
> should not send mangled skbs into the stack. Maybe send a v2 and
> explain next steps in the commit message, less guessing the better..

Sure, let me send a v2 patch to get this patch applied first and
explain next steps
to get the inner fields fixed in a future patch.


Thanks,
Ronak

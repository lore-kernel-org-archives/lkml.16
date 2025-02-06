Received: from mail-yw1-f171.google.com (mail-yw1-f171.google.com [209.85.128.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 70F144C8E
	for <linux-kernel@vger.kernel.org>; Thu,  6 Feb 2025 15:49:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738856951; cv=none; b=s3HUJwfNQ+GW9H+2kUudpEmwrjIldtjJoG5pVKpdge65ATWusl044oHGXPdLbTwiSvvX0fN2dzeyIUWULcPlLO6/Z7Q9WedxgxSCscynzOp6Qy3SoA4VICxrOXac7ncBHNCL82SQ7MIiBZhIs6jstHpZjBBujh30Z13fhyHH+SY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738856951; c=relaxed/simple;
	bh=gm5a18TPIE8jhjZVGIfDrBV0rkHyXJ5LhAXrIYfCdU8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=YTEgm12FWhu/g7fAvOrWWuF4F4awQfUOp5VYP8iUdFhjxzWdI6WcOrA9hGmtD4JdUT5SRPf9nC0CUOXD6Ccc4nmfGD7vi4vmwbAzPJ65szFPuuw2ty83ewe67dvX3wBiESdY+s2YveXm6QzArGYcXaIzaPdzsgtIQWAMgKxMbME=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=paul-moore.com; spf=pass smtp.mailfrom=paul-moore.com; dkim=pass (2048-bit key) header.d=paul-moore.com header.i=@paul-moore.com header.b=Yq8KNIjC; arc=none smtp.client-ip=209.85.128.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=paul-moore.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=paul-moore.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=paul-moore.com header.i=@paul-moore.com header.b="Yq8KNIjC"
Received: by mail-yw1-f171.google.com with SMTP id 00721157ae682-6ef9b8b4f13so9557627b3.2
        for <linux-kernel@vger.kernel.org>; Thu, 06 Feb 2025 07:49:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=paul-moore.com; s=google; t=1738856948; x=1739461748; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=X4yZmynuAqAaX/fsICNG3Afvx5zVtUE7n592NM4a374=;
        b=Yq8KNIjCfMI2J+h0DOOG2IrpKA1Yi2yuRVl51JeDauRaifHtFuyfJnuBEje0om/w4Z
         vWEXZZEcaNAWMKEyV1YaAi21bCSGEENGm9wwuzagfDyH2IpWb5hJYTygBToTV6rYoRB5
         treIbnP9hMtByXKYPH+5A8ejm5TEr/BkfwXHqoAiqK39USiH0qxE+01MEXMoXxoMrjWE
         yV4Z9GBZsSsRLOdkhPZ1OAtGRrzo7p21kh06luTSomE4+OSijsCKfCVFYQsynYWUo/LQ
         ixdskHv63SqrmQDKCai0T6qHGN6VftFBZsV9A6WJthprXigrFk6KEBPtl0+IlWmOCTpM
         J22A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738856948; x=1739461748;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=X4yZmynuAqAaX/fsICNG3Afvx5zVtUE7n592NM4a374=;
        b=DqFFDKZNjwLyt2YgNMMNUWoo+dg1cceU7C5mtPmL++WkqC7cx/IAiA+MsM9rm8UpxK
         5RNVnAg/4irqum2a1LRv5JHG0Yc66MbZMsNyWk65/Fcy13WRxFX+ZgYWW6T83ZWkzNJi
         iPPRONSIhP5+UBUi5OftCGSOL+2UrmURCLHE73qKuSiw5b1jSkobIXM7VA0jWLiynPS9
         P3mPzGts53Gnv247i0iWjIx5y/AnVJk3QOIWWuwrs0axSeO0yHScY8VTSyKxW1XnzSL2
         y1skH5XqQfAkurIK4zHnWZMJW5lbIj8hpCrgMCKJaIQMknBM0KRlkvMgyJxBEP6EtypS
         s3JA==
X-Forwarded-Encrypted: i=1; AJvYcCV8Zxy9Ulpn5t/yag407SlM35uRUvJBh1T0TmPfBwb0RpwDnAnHv1d8Mz6VM43EGmS8HphiSVYtkwi5TeE=@vger.kernel.org
X-Gm-Message-State: AOJu0Yxf8KfTfk0yqIfYUX7F1i0+Z8I996lAYjFHrtbN1kc4syqV7l6S
	eZV1RHYN7fshqKndRjxfPihZD23B87nkDXTuf7ECMlME4TMwTgOpoMvFJ0GI3/Q+sDo1+KummB7
	cy0yb2H+sPoqB8uNqwSo7QP67kpd6gEzS6o64
X-Gm-Gg: ASbGncuwRMtXPRIzeSILHltRKSDxunyG7D+1vQANsM8pRihbxipsVBFiznK7HDAQjV2
	m0UjE4I+c3FVe/nqhwK4GpxD58SdswX1S2YcPEbLwmleQl9F1QIAU4hhxPpE9NMJjNqluwQ8=
X-Google-Smtp-Source: AGHT+IFQMv8ErMjprARbuVDAhi7QMq8LWSphsU0CJhVswyKDLYm20gJ5SdMRSVF1SLnRrshn3RuDlYFo/kUPh+93LtY=
X-Received: by 2002:a05:690c:6302:b0:6ee:7339:ab42 with SMTP id
 00721157ae682-6f989eb2e40mr67811147b3.14.1738856948282; Thu, 06 Feb 2025
 07:49:08 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240826103728.3378-3-greg@enjellic.com> <8642afa96650e02f50709aa3361b62c4@paul-moore.com>
 <20250205120026.GA15809@wind.enjellic.com>
In-Reply-To: <20250205120026.GA15809@wind.enjellic.com>
From: Paul Moore <paul@paul-moore.com>
Date: Thu, 6 Feb 2025 10:48:57 -0500
X-Gm-Features: AWEUYZnmKtRI9VO3HSoX82L6GrgusAeFSML7fobxuKG6UrraUu5tWEyugLuu98Y
Message-ID: <CAHC9VhRq0PrH=0n6okkvfed=8QQOfv-ERA60NNWvLXetgrB_2w@mail.gmail.com>
Subject: Re: [PATCH v4 2/14] Add TSEM specific documentation.
To: "Dr. Greg" <greg@enjellic.com>
Cc: linux-security-module@vger.kernel.org, linux-kernel@vger.kernel.org, 
	jmorris@namei.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Feb 5, 2025 at 7:01=E2=80=AFAM Dr. Greg <greg@enjellic.com> wrote:
> On Tue, Jan 28, 2025 at 05:23:52PM -0500, Paul Moore wrote:
>
> > I believe the LSM can support both the enforcement of security policy
> > and the observation of security relevant events on a system.  In fact
> > most of the existing LSMs do both, at least to some extent.
> >
> > However, while logging of security events likely needs to be
> > asynchronous for performance reasons, enforcement of security policy
> > likely needs to be synchronous to have any reasonable level of
> > assurance.  You are welcome to propose LSMs which provide
> > observability functionality that is either sync, async, or some
> > combination of both (? it would need to make sense to do both ?), but
> > I'm not currently interested in accepting LSMs that provide
> > asynchronous enforcement as I don't view that as a "reasonable"
> > enforcement mechanism.
>
> This is an artificial distinction that will prove limiting to the
> security that Linux will be able to deliver in the future.
>
> Based on your response, is it your stated position as Linux security
> maintainer, that you consider modern Endpoint Detection and Response
> Systems (EDRS) lacking with respect to their ability to implement a
> "reasonable" enforcement and assurance mechanism?

As stated previously: "I'm not currently interested in accepting LSMs
that provide asynchronous enforcement as I don't view that as a
reasonable enforcement mechanism."

> If this is the case, your philosophy leaves Linux in a position that
> is inconsistent with how the industry is choosing to implement
> security.

In this case perhaps TSEM is not well suited for the upstream Linux
kernel and your efforts are better spent downstream, much like the
industry you appear to respect.

--=20
paul-moore.com

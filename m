Received: from mail-qt1-f176.google.com (mail-qt1-f176.google.com [209.85.160.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF3782475E8;
	Fri, 25 Apr 2025 11:42:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745581354; cv=none; b=mu/LjYO8BQDccfmnUgox9nW85/2fSf1yyNnFVMg2XxyNHqZjujT/99Jh6uxefOBpoi92TuqvOgS6lwkAOU4fgVVCtJ3FNfEb+FF/EJbJURorzwmi6VQvLhCtthVhyIT6wyzEgibKTvmsKL34fhHa6WrBt1SOBMzTb+8AJB6FDAk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745581354; c=relaxed/simple;
	bh=KxY34phc/sYvRn9Mn/62C1enBT8ITdvJFmB/8dHoUWc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=oXn+xJ41xvuC8jgZ6Sc3ByoO5r6HooG0ua58ZyTbsafggMj5uuq6J0FfqC9MP7w5B6PVKBhzrP51WjQvcYgk2lG/r9RLa9sYNepb5oCNawSBWM2zFGaDslHY3luuj2jyB7AvgCmlPkHoDCMdzXFLuQJMybMsW6szpoztM2sK8aE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=hbWfLsg1; arc=none smtp.client-ip=209.85.160.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="hbWfLsg1"
Received: by mail-qt1-f176.google.com with SMTP id d75a77b69052e-47664364628so25427751cf.1;
        Fri, 25 Apr 2025 04:42:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1745581352; x=1746186152; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kERhzbW6fqj+VWdgGLPvrSO+P7nlPj568y89UZPvhVc=;
        b=hbWfLsg1aYXuFXFSoLPVJrf7VWa9ZAygvz9w9B559IyjlvJWhJOlOrKM+/PUbAgyw/
         FFUgvJ+omi4z5+KVRJapKc84ICayt8tuEDiAgsxTWDrGNn3Bfb5JT9NjoGy2l11igZkg
         WU9/XO5+cx9K0T1Gqme15zY7lZtJRfX/q7lbgQ8RHddwClqFGqU/0BoNrXRxFHRUC2K/
         mUv2YhZAHPssTEftRA45YXaDWgUyYyn6IZzta6U0auEtkzUuxnskW9jpZvS0ypsohhvH
         wAbNzysddZr21sJrTquK4V00O0F+mnXRrVKf6IQ6K1ICQWuDcpPswyh0y6cKkYGvdP9j
         EHTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745581352; x=1746186152;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=kERhzbW6fqj+VWdgGLPvrSO+P7nlPj568y89UZPvhVc=;
        b=DN51KqQBHTrxpUSClGSdIdePZFiuA/vNArXSd3il3Ne5gDH4HkDzo8nv8P5D5vgHzk
         5MI6ipMcnEcqLutl6fDY2oy1fz1JvMDqjEQLJpkKuXRTGPzZsGOv0QP65JFb0VhTHNP/
         nxNSCslROMvfRzApFrsZARs0LZod57yXLh5h14nEt9DGshV8p5ZzqfAWjfuToecfC0h+
         3dqAyPNEFJTA6yoLPE1UcqxGpnx1a5B/kGbtXmX+60uckMoUq7BIKRsHf3GBFrTAjbgn
         YMvWCVaDYvpWjaoR3RUKCWFng6sQIa3Abe0FU9QkacNRKehwSmqnfKjAsdY3zPAGA5Bp
         MZGQ==
X-Forwarded-Encrypted: i=1; AJvYcCU3zicB2bmzB9RdDUipEyOZxKAkPb1ws7mMxpAzA73HLce2KaLUTY2QGiCyHPNDFsYZ2MT1a3/ToOhWp+6i@vger.kernel.org, AJvYcCW+pbqs1HoQJcNXWqQfICzx/JxMBXKb7wLw6FNdPP5QzZEIhjF7HMHTKb4ZHwnAT0A3Kos4GTMX3I2W@vger.kernel.org
X-Gm-Message-State: AOJu0YwbTjXVyxNYlWeWkXCScrQNbqem1q5yd95szvI3VgnRuYIVJz4K
	3RYjwavhOPC+a0KWC7DpVQf2tBogX/bQXDcyEQHMyk24n8NiCdT6lKLSXLywxtHXE+USRzaNp6Q
	c8Oct0eSgHtcMei7ugRSYr6E/2r3onojroe8G4A==
X-Gm-Gg: ASbGncvK/kIa2w0EV0YG/vBHSu/pkBvdqqgXVh5MdCeOlrgAfXWMRuf/GkA6ECVifba
	MWM8wj3ipZwlQyzgnw9D5HjEW54S5PCtSIkC8wCpDm1YDyqVz6KC/B3fyGllvtzyz2hsi4Z8KCv
	uHvwcXO77fWjt1aZqq8YzSG57mxXgQ19RRlUqXgqktUufoVj0FFrE47g==
X-Google-Smtp-Source: AGHT+IHxO2pVE4j4MuX5cO+0iehZIX54VpMBleDrSMBv7uoBupDS4fSEMklcDF2irlBNlksS6u7eJ2FGqDDcO0KTlsk=
X-Received: by 2002:a05:622a:2489:b0:478:db63:6f51 with SMTP id
 d75a77b69052e-47ec51e2afcmr95185921cf.25.1745581351760; Fri, 25 Apr 2025
 04:42:31 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250418-apc_paper_binding-v2-1-17c9023b7c9b@gmail.com>
 <20250425-polar-tamarin-of-reward-c57e01@kuoka> <CABjd4YynxcBT+q69GuXwM447uXmGbkZ4JxFF=c0M9+R25dnvtQ@mail.gmail.com>
In-Reply-To: <CABjd4YynxcBT+q69GuXwM447uXmGbkZ4JxFF=c0M9+R25dnvtQ@mail.gmail.com>
From: Alexey Charkov <alchark@gmail.com>
Date: Fri, 25 Apr 2025 15:42:42 +0400
X-Gm-Features: ATxdqUG8KIHfvlrCGK2uHuCM0syHQJIq73u-112fGNblwiUUlBy3gzO_q55Fuls
Message-ID: <CABjd4Ywcx=ZyDAohEFqiTOKm8LRcqgjt3nmACoGt7vHuTm_Nng@mail.gmail.com>
Subject: Re: [PATCH v2] dt-bindings: arm: vt8500: Add VIA APC Rock/Paper boards
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Apr 25, 2025 at 3:41=E2=80=AFPM Alexey Charkov <alchark@gmail.com> =
wrote:
>
> On Fri, Apr 25, 2025 at 2:19=E2=80=AFPM Krzysztof Kozlowski <krzk@kernel.=
org> wrote:
> >
> > On Fri, Apr 18, 2025 at 07:24:25PM GMT, Alexey Charkov wrote:
> > > APC Rock is a development board based on WonderMedia WM8950 SoC
> > > released around 2013. Paper is the same as Rock but lacking a
> > > VGA port and shipped with a recycled cardboard case.
> > >
> > > While at that, put myself as the maintainer, given that Tony is
> > > unavailable as of lately.
> > >
> > > Signed-off-by: Alexey Charkov <alchark@gmail.com>
> > > ---
> > > Split the series from v1 into separate bindings patches so as not to
> >
> > Hm? That's odd.
>
> Now that you've asked it (and in light of your comment below) I
> realize that Rob referred to rewrites of old textual bindings into
> YAML schemas, and probably not this patch in particular.
>
> > > spam all the subsystems with unrelated changes, per Rob's suggestion
> > >
> > > Changes in v2:
> > > - kept single-valued compatibles in a single enum (thanks Rob)
> > > - dropped the empty overall description node
> >
> > ...
> >
> > > +
> > > +      - description: VIA APC Rock and Paper boards
> > > +        items:
> > > +          - const: via,apc-rock
> >
> > Where is any user of this? Bindings always come with the user. Board
> > compatible comes with its user - board - both to SoC subsystem (in this
> > case me).
>
> The DTS addition was in the original "merged" series [1]. I will
> resubmit it along with this binding change: it has no external
> dependencies so should not create any hassle (i.e. it can be merged in
> any order vs. other VT8500 DTS additions and cleanups that I'm doing).

Lost this line:

[1] https://lore.kernel.org/all/20250416-wmt-updates-v1-12-f9af689cdfc2@gma=
il.com/

Best regards,
Alexey

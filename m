Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5952A21ABAA
	for <linux-kernel@vger.kernel.org>; Wed, 16 Apr 2025 18:29:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744828190; cv=none; b=qLPHSmLE4Vn5cBP3VMvFkJrbAmbMdC8iMZlWOytIvPgIcTJ5yRSSjQECilOWvZ1nCGcdnbafCBNJ6uha+68Xnd7MvLjhsh9CFyR5uUyNY4rvWxqYGYpgKndLVtlfDG9mUVq96Pnc1DNYKteqgqu0+JIwA1a/MvwaslTACXxc9m4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744828190; c=relaxed/simple;
	bh=7izFUHwou8CGTKQBC+Pj5lbCiJDPpF4vHPruu69zHJQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=AJ6jTZN7laCTJZsTsPBc6nyXzmQaSThA7T4sCpqwcFTETcUOlyjkaZbtLveDt5TT7VYnFpEj9/3Ks0717xZuDBLJBaSXnJn8hdJ8ebY77a0Gwz3Vtvxg9xr//E7OrjLQKWh40SrM2jiaWsLih4vkLzSOzWyZNvceGebVzVDQonQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=GLIuSvsp; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="GLIuSvsp"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1744828188;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=bwx5WjZbeRXciIDl7fHepP+WhVSAom/fNWecyvJ7Kms=;
	b=GLIuSvsp1trp0B5lWVIZaq1OlTEI8CP4LrtmRp2DCn07bejcbm9Hf3SbqJgj15tw3Vka0O
	h9zXkGd84wdIV190rn+SopqxxB8MnGu8ELGrfN698FaWsGR7/4NRAGD8/nwznGUEI0DMxZ
	x9vxyCoGfT0TyeWSw1cvG4F7ymeFdR0=
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com
 [209.85.208.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-445-9jiv7vQOOneKEgXCyeRbhg-1; Wed, 16 Apr 2025 14:29:46 -0400
X-MC-Unique: 9jiv7vQOOneKEgXCyeRbhg-1
X-Mimecast-MFC-AGG-ID: 9jiv7vQOOneKEgXCyeRbhg_1744828186
Received: by mail-ed1-f69.google.com with SMTP id 4fb4d7f45d1cf-5f4c30f881fso704105a12.1
        for <linux-kernel@vger.kernel.org>; Wed, 16 Apr 2025 11:29:46 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744828185; x=1745432985;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=bwx5WjZbeRXciIDl7fHepP+WhVSAom/fNWecyvJ7Kms=;
        b=KE1lf8Cx38JxFWN7NZlQwtoFCAcNrCThgGhKGS6r2JBWn7JHJZR7nahQwuZFu/HaVt
         hN+VMPihfPthY6gcYSEaxyYmuSgYsHYPDxud5+SLqEoSwmW+dhXJnuwZGqF7qXWKtFio
         ukAaNjWpEUOQbQpi9GxUiRIhr/zPmjl0J86Vy3q3F+wav5Vq2s7fMyx8ILMFUkMSPM6e
         K/wUVH3tUEv3lxWdFyyAdEcQl4e+XL0VVArqoWmlpQijKIlDGBXwYBK4JMlqpC2lsg4C
         BXS9yguyvOg8tAjqdAyZPZVjLGOutSnWXRKs1Ctha2OnM00DnMJyGUi1xHJ+21iZogpb
         rhKg==
X-Forwarded-Encrypted: i=1; AJvYcCX67g0BRewIw22xvhBvnbXVNRIc6EqSVEnSw4DahQKstiUuIe4m11VRFGGs/Z78nVIGSMxQfHwQoKNrkJk=@vger.kernel.org
X-Gm-Message-State: AOJu0YzWCtQC1WTs2R8nIaGru7rqwoKd8esgVNeRcezlxriAjwiE09HV
	sFATsceKF6CxUa52tkTfRYPrKz4PSoHHQyHKQfKjt+eV4Qot6fUmhP3un81BGklsJwPrOX/wXtJ
	kWM+FA0e6Xkp38KGYh8SB501Z5tCXLdBXitNst4KhvaMDapxkJAMkCnOclSDIdl1uFxcZVfDBuJ
	RVvQioA9qKxg4RleVJ1NbhRbJvCult4RMmtnvS
X-Gm-Gg: ASbGncsL1l2+tQ5aLajG2hC+UOYDRBW3T2JIRTVMcDWeJLSUx4CxlUmOCxY2HkANq4w
	QuFfTo+JbqLbLZlaAVBrbgq2YP8eBlqfNQrC6iiGDQXW7xHWavKJ7WzRo9ASuh/1SZCQ9d7CuAB
	W+KT9Thpbnq83XsD3YhCD3AA8=
X-Received: by 2002:a05:6402:3512:b0:5ec:96a6:e1cd with SMTP id 4fb4d7f45d1cf-5f4b71ea271mr2425973a12.2.1744828185634;
        Wed, 16 Apr 2025 11:29:45 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGF/O1rE4UuagKpLxQYRmJg58OWmw/yYHcF3mGNfOJqHYqMB1tcEn3p6wwEn2otzHPid/a/IRWXPHhHp9kWxYU=
X-Received: by 2002:a05:6402:3512:b0:5ec:96a6:e1cd with SMTP id
 4fb4d7f45d1cf-5f4b71ea271mr2425953a12.2.1744828185248; Wed, 16 Apr 2025
 11:29:45 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250416162144.670760-1-ivecera@redhat.com> <20250416162144.670760-3-ivecera@redhat.com>
 <174482532098.3485034.14305412993449574460.robh@kernel.org>
In-Reply-To: <174482532098.3485034.14305412993449574460.robh@kernel.org>
From: Ivan Vecera <ivecera@redhat.com>
Date: Wed, 16 Apr 2025 20:29:33 +0200
X-Gm-Features: ATxdqUFxjsZ_qFD__UPQiAZpI42mRoG1aY9Q_T20uCxi5IG-wqWWDZ5JjJEfrNM
Message-ID: <CAAVpwAurYhW1Eyw7C_gPY0cTrQJrw7o_FL3-npLdWsxE=FGXkg@mail.gmail.com>
Subject: Re: [PATCH v3 net-next 2/8] dt-bindings: dpll: Add support for
 Microchip Azurite chip family
To: "Rob Herring (Arm)" <robh@kernel.org>
Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>, netdev@vger.kernel.org, 
	Prathosh Satish <Prathosh.Satish@microchip.com>, Vadim Fedorenko <vadim.fedorenko@linux.dev>, 
	Kees Cook <kees@kernel.org>, Michal Schmidt <mschmidt@redhat.com>, 
	Conor Dooley <conor+dt@kernel.org>, Arkadiusz Kubalewski <arkadiusz.kubalewski@intel.com>, 
	linux-hardening@vger.kernel.org, Andrew Morton <akpm@linux-foundation.org>, 
	linux-kernel@vger.kernel.org, Lee Jones <lee@kernel.org>, 
	Jiri Pirko <jiri@resnulli.us>, Andy Shevchenko <andy@kernel.org>, devicetree@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Apr 16, 2025 at 7:42=E2=80=AFPM Rob Herring (Arm) <robh@kernel.org>=
 wrote:
>
>
> On Wed, 16 Apr 2025 18:21:38 +0200, Ivan Vecera wrote:
> > Add DT bindings for Microchip Azurite DPLL chip family. These chips
> > provides up to 5 independent DPLL channels, 10 differential or
> > single-ended inputs and 10 differential or 20 single-ended outputs.
> > It can be connected via I2C or SPI busses.
> >
> > Signed-off-by: Ivan Vecera <ivecera@redhat.com>
> > ---
> > v1->v3:
> > * single file for both i2c & spi
> > * 5 compatibles for all supported chips from the family
> > ---
> >  .../bindings/dpll/microchip,zl30731.yaml      | 115 ++++++++++++++++++
> >  1 file changed, 115 insertions(+)
> >  create mode 100644 Documentation/devicetree/bindings/dpll/microchip,zl=
30731.yaml
> >
>
> My bot found errors running 'make dt_binding_check' on your patch:
>
> yamllint warnings/errors:
>
> dtschema/dtc warnings/errors:
> /builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/d=
pll/microchip,zl30731.yaml: $id: Cannot determine base path from $id, relat=
ive path/filename doesn't match actual path or filename
>          $id: http://devicetree.org/schemas/dpll/microchip,zl3073x.yaml

Oops, my bad... I forgot to update $id after rename of the file...
Will fix.

Thanks,
Ivan


Received: from mail-il1-f178.google.com (mail-il1-f178.google.com [209.85.166.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 67443289813
	for <linux-kernel@vger.kernel.org>; Thu, 22 May 2025 16:32:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747931558; cv=none; b=tBHm2tsZzHH4+2icL1qROsJkuER+RWygs+Bx4UZQFMxZpYMqpjUSTZE9cdfdRVAAr6KdqgznY+k2AChOojKiaNlHqD1l+PPXd78zYutC6njYNOeDyW4XYctfBv42IryEPT2YHDI1NukYGz+QCVMHXrknP+MbpfMP9nKgVQPIUoA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747931558; c=relaxed/simple;
	bh=m532YtZgOHJFuAQ6CKfIArzDXL/x8d/xeyRJ9YSHfi4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=JbKBr3JakxiJgBqrtrA2e2Ltck+DFXjkPVTfZTettpNk36/yuusi7/eHw0fl7IzcX/SCtcflztcoNu4yNC8bJjwjSDjQslNBgTd6xyc/rvCxS4VDAfK4tHOXBLQgd+W8UJkC2R9c0u2YFfoePqu2TuunAkQOivXR3L/TOIQ0oRc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=geotab.com; spf=pass smtp.mailfrom=geotab.com; dkim=pass (2048-bit key) header.d=geotab.com header.i=@geotab.com header.b=LoX8i0M2; arc=none smtp.client-ip=209.85.166.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=geotab.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=geotab.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=geotab.com header.i=@geotab.com header.b="LoX8i0M2"
Received: by mail-il1-f178.google.com with SMTP id e9e14a558f8ab-3db6ddcef4eso70515665ab.2
        for <linux-kernel@vger.kernel.org>; Thu, 22 May 2025 09:32:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=geotab.com; s=google; t=1747931555; x=1748536355; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YRsgj+7bdFsJflwtJcWa1/posehx3XN2DFpavrVpfn0=;
        b=LoX8i0M2NTBi+C52d7EHBi5QeMRyyPgu96W4vMkKHRvN2qvsbm6xX75jdzkiZwj0/v
         KxPtc+mamPfHF+wajiPSIOSuDF4qChi2uRosTBRzb5bX6GFTw0VkgsunPAkPTCLNETpt
         pD5kn+TpDBDvUXwArSeyRo8y/cbK9tsCCme0Gfayp2LgyFMY2qUw/jo5MkI56ro+yWE3
         qeenD3AHyYQTdaAJZRWUrU02ajFxy/8qvZH6FPyxLLuw6RLsAGPgscQIPKbvhVPmEHEH
         BI1PtQZGetlqa6Fcc3CagTWv/2cuYpOB7NE76yuhENe5V6Kmq5PdxUMwJLwmLTAfO33a
         CG9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747931555; x=1748536355;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=YRsgj+7bdFsJflwtJcWa1/posehx3XN2DFpavrVpfn0=;
        b=VX58kWPGv/o3wd1r3pgdLbiaOr1biYjb2aBu5qiRTEtAHYTbpXmIfp3lLJ8pcLwpWz
         Zfna/kHiN48glg+vp5ZXki/bcsLYSyr/W4JS25676Vcer+dqiEd9WWtAoRoh9ix8GCBT
         zx53fsWap3NbpBFce2SQCpuOzeXGTdWB40aHkHe/wPPbRDyt2G73EGs/Gdcn/ynIUmna
         /1eMEhn1+3q+apyQgo8y5lD0kZv+3kaZkv9flEqFAr4Phhzmweemxlnh+1fBNOTwb8Pv
         ygRGgkHnGRGmhBPvjm3aBdecG4/ueolceqznbIrE3XhYiOS9Io+oO7AJ6zGlg1gIaUy1
         9+Uw==
X-Forwarded-Encrypted: i=1; AJvYcCVK121iR7bQzpN3+s4tli4VlAc1QzQ30A1DFjGx2M8JCOCGLh1aGyJPxSLpOpHo0rYcg3U+7J4KCODejL0=@vger.kernel.org
X-Gm-Message-State: AOJu0YxoJwu65a2lEzWKt7QkwNx+sLEK5GLw6RXCOVNLBTAZAzN3bsEq
	ITQOrXVf+bWeUTZJSrStpmpKAPNCn4BTtqVE+t7V5pxJwpr9rHqMrPqRTs4Vgp4FOTptjsO3hHW
	18mjgv3ZMxXAemLisNAuCAzc8JBV29yoOzyxlXV0V4g==
X-Gm-Gg: ASbGncvOKDaTqRq6BDf8GZCxbQtRTKrTSJ7NMQkyMtHvh46I2Z4f4b7S223UVdr2lNS
	lizK+bkWjVEDryWeDQu818QT+wFEI/XZjxJ1vInaSmrcgG7cEMDKBSuoX01/2SrumXrDJlqjIoq
	M+y1Hat38/D/Yn1i7CzpAl0Ibpdu8HMiBrJfWzZ1fVZA/pDa9l3APupym+zz0GaoiVVQ==
X-Google-Smtp-Source: AGHT+IGylajahnF/cgIthfvbVwDEKOBd3rrhavHupe+SMZEcTOvYYG8mQ4kpGVbujb9QYw+e5YASUEAywX1kKzBYbe8=
X-Received: by 2002:a05:6e02:2187:b0:3dc:79e5:e696 with SMTP id
 e9e14a558f8ab-3dc79e5e787mr115955495ab.11.1747931555539; Thu, 22 May 2025
 09:32:35 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250514-ubx-safeboot-v1-0-1ae771335356@geotab.com>
 <20250514-ubx-safeboot-v1-1-1ae771335356@geotab.com> <20250521-qualified-smart-myna-bddfc8@kuoka>
In-Reply-To: <20250521-qualified-smart-myna-bddfc8@kuoka>
From: Alejandro Enrique <alejandroe1@geotab.com>
Date: Thu, 22 May 2025 18:32:24 +0200
X-Gm-Features: AX0GCFuPYgaEv1Rugt8eq1c0aydf9uNV4j2qUO-ZQQgnKGNpnw9AkLLqfQdKxLc
Message-ID: <CAN=L63ouhz3+AKVj6-tzhW9eDr20xb9mJrELX3825XqgdT9Uhg@mail.gmail.com>
Subject: Re: [PATCH 1/2] dt-bindings: gnss: u-blox: add "safeboot-gpios" binding
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Johan Hovold <johan@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, May 21, 2025 at 11:27=E2=80=AFAM Krzysztof Kozlowski <krzk@kernel.o=
rg> wrote:
>
> You need if:then: disallowing (:false) this for 6m and 8. Move entire all=
Of down
> and add there new if: clause. (see example schema)

I see, I will add that.
>
> >    vcc-supply:
> >      description: >
> >        Main voltage regulator
> > @@ -61,5 +64,6 @@ examples:
> >              v-bckp-supply =3D <&gnss_v_bckp_reg>;
> >              vcc-supply =3D <&gnss_vcc_reg>;
> >              reset-gpios =3D <&gpio 1 GPIO_ACTIVE_LOW>;
> > +            safeboot-gpios =3D <&gpio 2 GPIO_ACTIVE_LOW>;
>
> Thats 8, not 8m?
My bad. Anyway I now checked the integration manual and it seems the
neo-8 also supports it. So I will send a version 2 of the patch
disallowing safeboot-gpios just for the neo-6m.
Thanks for the review..

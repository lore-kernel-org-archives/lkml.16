Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9125018D65F;
	Tue,  6 May 2025 19:11:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746558686; cv=none; b=qi5d8TSGJNQGJ+Vb/l/Ib2AOAB8fIbPiRb9buvxGNbSI/HsfwcJdEIX9zrRXp9z9PpiI6W+voVobNTUc9U7Z/WFUOHLNoaR+DPSr2C2qZUpwkEpz91HSX2ml54qyH+85qJLWt23HSpWM4bUNmBQn0rmAOii/EQo3lQliMEWQ7dY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746558686; c=relaxed/simple;
	bh=Gvo1dDxKWmorysKSoDu5MSo/13XHbpqcTdtuNSlfJd0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=KbOh3TrFnHNIjGz2shyCRdyWiwf4cTxQFFYyemc+7XiJLgyc5r+JArtg/klFwsoiJLqI5Td1cygRERTm5QEZLc6A/bhQxCSQkgiqvvWGrwcj3cZkWjLfuhteOOdiNWrovy2RnNS+k94iRVsxaIwYayqlweQFC9XtICMqQfJbgl8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=hW1GKAB7; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="hW1GKAB7"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F3FD5C4AF0B;
	Tue,  6 May 2025 19:11:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1746558686;
	bh=Gvo1dDxKWmorysKSoDu5MSo/13XHbpqcTdtuNSlfJd0=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=hW1GKAB7sKqoDRqLzoOC6VwuJIln7BH3tyrEs0I3k42iHymNWIQaKI2BQvIuqzKv8
	 hwb0wXwa3qlb/s+pfT0899iH1ZcGcbHwk/4LEO2Kmybcv+2YIO8Ziukh0YYSCG6rac
	 Pc01m1ZMMoQdQ2fN0TOSv2oRwb9YV+sjQHzFmBV5ld3aqUHcAFNtRZ79wfFpwopEJR
	 gehJ4OMPO8vSNHMzMbn5p6/VkPgwtdbSGFT4VfZOEIPyQWSrGWLxb+p3bwE96ZalPj
	 0oqGAYFrrb4n7E5/hJ3M3UXrG5tla0Xp+W2wRqUOSt2DRwb2OXEL0Cxh5K4pGaqWZK
	 /sxeUz1HNba4g==
Received: by mail-ej1-f50.google.com with SMTP id a640c23a62f3a-ace98258d4dso890612666b.2;
        Tue, 06 May 2025 12:11:25 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCVPlf/2eINRwpY6Y4MpetC0O5JMmkhcvFPEHNKrpX6+2gaIaZYJd2NdxM9FEgOJzaKnLrBe+bJprEWzdkKu@vger.kernel.org, AJvYcCWR1D3QlGnYtB/m/xo0lVtSXFsiog19DhNdaqehq7cAgyHG7X3xyFiqkgtPPkKWj6Fbs5YYlKFt7HUD@vger.kernel.org
X-Gm-Message-State: AOJu0YwoVssgWxecUNPcUYOFmpi5Zm2Aog021fzo4JF05QWVsu7wxQHa
	jJYcnAC9h9Gq9eVZMciNrHKEtRE2rnWObmubQOauCYfSgSJZ9i+6wnpBZwGrQn5MbZlJunHOqwT
	y2sDxTmwL/x7W8EFKq2il0WYd4g==
X-Google-Smtp-Source: AGHT+IH4AuBtQsPb0qWbwalc5ywdjeelGTCMgiJvAOr31Y1XA3guQBMVGvOepc7X6Qyba7bHxw3H9VwrROuDga9SFo4=
X-Received: by 2002:a17:907:970d:b0:ac7:66fb:6a07 with SMTP id
 a640c23a62f3a-ad1e8bc2a81mr53377466b.6.1746558684507; Tue, 06 May 2025
 12:11:24 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250505144813.1291810-1-robh@kernel.org> <aBo2A_SsUdeuH7UQ@antec>
In-Reply-To: <aBo2A_SsUdeuH7UQ@antec>
From: Rob Herring <robh@kernel.org>
Date: Tue, 6 May 2025 14:11:13 -0500
X-Gmail-Original-Message-ID: <CAL_JsqL2NXtfo4kS4WQ4PaDuY8uF47vTVUQa730=yLVDUT0UeA@mail.gmail.com>
X-Gm-Features: ATxdqUHPSFSyLiC4sNXut8Z5AFXll2tAzmv0_l5Q8i9mR73G5f3TxU7dLVAVU8k
Message-ID: <CAL_JsqL2NXtfo4kS4WQ4PaDuY8uF47vTVUQa730=yLVDUT0UeA@mail.gmail.com>
Subject: Re: [PATCH] dt-bindings: interrupt-controller: Convert openrisc,ompic
 to DT schema
To: Stafford Horne <shorne@gmail.com>
Cc: Thomas Gleixner <tglx@linutronix.de>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, linux-kernel@vger.kernel.org, 
	devicetree@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, May 6, 2025 at 11:17=E2=80=AFAM Stafford Horne <shorne@gmail.com> w=
rote:
>
> Hi Rob,
>
> On Mon, May 05, 2025 at 09:48:12AM -0500, Rob Herring (Arm) wrote:
> > Convert the OpenRISC OMPIC interrupt controller binding to schema
> > format. It's a straight-forward conversion of the typical interrupt
> > controller.
> >
> > Signed-off-by: Rob Herring (Arm) <robh@kernel.org>
> > ---
> >  .../interrupt-controller/openrisc,ompic.txt   | 22 ---------
> >  .../interrupt-controller/openrisc,ompic.yaml  | 45 +++++++++++++++++++
> >  2 files changed, 45 insertions(+), 22 deletions(-)
> >  delete mode 100644 Documentation/devicetree/bindings/interrupt-control=
ler/openrisc,ompic.txt
> >  create mode 100644 Documentation/devicetree/bindings/interrupt-control=
ler/openrisc,ompic.yaml
> >
> > diff --git a/Documentation/devicetree/bindings/interrupt-controller/ope=
nrisc,ompic.txt b/Documentation/devicetree/bindings/interrupt-controller/op=
enrisc,ompic.txt
> > deleted file mode 100644
> > index caec07cc7149..000000000000
> > --- a/Documentation/devicetree/bindings/interrupt-controller/openrisc,o=
mpic.txt
> > +++ /dev/null
> > @@ -1,22 +0,0 @@
> > -Open Multi-Processor Interrupt Controller
> > -
> > -Required properties:
> > -
> > -- compatible : This should be "openrisc,ompic"
> > -- reg : Specifies base physical address and size of the register space=
. The
> > -  size is based on the number of cores the controller has been configu=
red
> > -  to handle, this should be set to 8 bytes per cpu core.
> > -- interrupt-controller : Identifies the node as an interrupt controlle=
r.
> > -- #interrupt-cells : This should be set to 0 as this will not be an ir=
q
> > -  parent.
> > -- interrupts : Specifies the interrupt line to which the ompic is wire=
d.
>
> I guess this extra documentation is obsorbed by the fact that these are a=
ll
> standard fields?

Right, we only put details unique to this binding if any.

Rob

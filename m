Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 52620218821;
	Fri, 25 Apr 2025 10:17:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745576235; cv=none; b=sHcU1yX7OYXNEX8UUi/lehWfZW3ezBf/30wOZD2xqdyB/SO9R/v8V7UDqdwWMoDrVGpFCEISOu/9g+l5+MFKBYPpmTFsiK0N0BOBoim+xnCzLvfxVwAj+avj2EA8+wBl31zcqwGVi0BlVUCjKsost7NhYk5xilrYQwxnDseJu7U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745576235; c=relaxed/simple;
	bh=3kJN2rZrLpH/1OSaAa1JAYLgfBIGx+glguG8HC4QIZ8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=J53Xr3GWbxAKYr+Yd9rld3Kk4UckAK1ZU3w4RxDPBSnSKnOgEPuhKsPIMzqboOd6nMJ8mvFApeQvQUOY0fgYDONX/S9J1IHy00EPE7xXqfu4xo2snYTgZF4X9ppG5WUl50Pp0mp9dw/6XQVKyqtJ+R03o4YHJDm7774fmyemnvY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=VY1QGkiE; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="VY1QGkiE"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 57250C4CEE4;
	Fri, 25 Apr 2025 10:17:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1745576234;
	bh=3kJN2rZrLpH/1OSaAa1JAYLgfBIGx+glguG8HC4QIZ8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=VY1QGkiE8B6UTrCIYuNDEwRgVG/lBFa4MszcrDsXOAKSXDSqIFa6HCz4vQPvkPKFJ
	 bJtuMAKu3LBtonqb/W/aFyyP6HxhVBGrVkc+SIzL3NHZ+qFZ65sW1eaBunTIrIjS1C
	 tsCg2OwM6XW1DrjwpvQI7nr3IWcpE+t4Xf5DO5psJlbc6Q1xMi13LhfqIq2kQ+EhmJ
	 5v24zS2FSonoRSBaqVCRhO+zN9x6OPyI2EXecSXnvpKJXKTlrWIta37cs6/OZkmICs
	 4cTfzanp9zbZLyD4gBNVu49fzM8joA5QuT5RuJH/phCio49lX4mrtU1V2yzwTBRuZ6
	 pBSloqXLA+Arg==
Date: Fri, 25 Apr 2025 12:17:12 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Alexey Charkov <alchark@gmail.com>
Cc: Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] dt-bindings: arm: vt8500: Add VIA APC Rock/Paper
 boards
Message-ID: <20250425-mighty-elastic-peccary-bcbe5c@kuoka>
References: <20250418-apc_paper_binding-v2-1-17c9023b7c9b@gmail.com>
 <20250423153505.GA561193-robh@kernel.org>
 <CABjd4Yyiz0A4cSDmS7Tn1B03Hcoi+wTLXZqMTo1qRy-vWG0rvw@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <CABjd4Yyiz0A4cSDmS7Tn1B03Hcoi+wTLXZqMTo1qRy-vWG0rvw@mail.gmail.com>

On Wed, Apr 23, 2025 at 07:43:34PM GMT, Alexey Charkov wrote:
> On Wed, Apr 23, 2025 at 7:35=E2=80=AFPM Rob Herring <robh@kernel.org> wro=
te:
> >
> > On Fri, Apr 18, 2025 at 07:24:25PM +0400, Alexey Charkov wrote:
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
> > > spam all the subsystems with unrelated changes, per Rob's suggestion
> > >
> > > Changes in v2:
> > > - kept single-valued compatibles in a single enum (thanks Rob)
> > > - dropped the empty overall description node
> > >
> > > Link to v1: https://lore.kernel.org/all/20250416-wmt-updates-v1-7-f9a=
f689cdfc2@gmail.com/
> > > ---
> > >  Documentation/devicetree/bindings/arm/vt8500.yaml | 23 +++++++++++++=
+---------
> > >  1 file changed, 14 insertions(+), 9 deletions(-)
> >
> > Do you want me to apply or you will take via vt8500 tree?
>=20
> We don't have a dedicated public vt8500 tree right now, so if you
> could apply it would be much appreciated!

We have.

I'll take it.

Best regards,
Krzysztof


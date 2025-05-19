Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 87A01279337;
	Mon, 19 May 2025 12:59:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747659558; cv=none; b=QKPyN/VRZISHlTThJ0D3qhcgMVfuVjF1GPxfanIonxnHgmjVBPlD9aJO6nqRziuNyIVBw7PkaHf9GZi7TUKAy+o+2qx+E3XWySnJLhMII6IplQnuU5TJhZB1irQqBEIToDZY8HSmBZEZfOZcumPgrycf5z1jftUGkQBzg9cSfuE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747659558; c=relaxed/simple;
	bh=LxUmA0LfdZZmXiUYZhl31Gpdz6dDsvoTN2w488IDKA4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=SYkoIxIDr4HXu1Kuanas+n6/5gdv3dUzI7eXajAc7+DRdNIPW8wRa/Nq6z8gmdRA2yhtfSCayDoesFkgRggd0YUF+y1IFRqKgln8ym2lXJhuGQEUGSfSQp1IDTKoX3jE0Kd3LyY9gymSb8agH4Vwa4Tv7/kvdpLu6N1Ot1LWdHk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Gq6laGyQ; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Gq6laGyQ"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 08F5DC4CEE4;
	Mon, 19 May 2025 12:59:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747659558;
	bh=LxUmA0LfdZZmXiUYZhl31Gpdz6dDsvoTN2w488IDKA4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Gq6laGyQQxRpOa+QUTvCIG5DeVY/mX/58AB2xjOvuBWdFTpaFEl28vFceWKOQzaH4
	 hH+aQ0+nndsgxjNLDKD0RQHK3yLMkBDSfYO0217bj/Y8zj8uKV9D1flGYMSqCPtYQQ
	 ZaivrDJM+uw0WkBxPxyzhzy3q1oBkGM5siEHmulvN+zeyIcNXXsdQrmVDjihRdiiMN
	 fHUlwtS5M/wd+q+cZlF8paDlLYAxiqW/8sdLPXYRIZkkDStLLP5IVuwwbnYmojOUmn
	 JFPAuoLARvrktnZE8PRn8OuO/pqAE9RHt5ytQUgBYQ9Lax63WLJYXQiGUWYKRcgNGX
	 Z3NVFYldtjeLg==
Received: from johan by xi.lan with local (Exim 4.97.1)
	(envelope-from <johan@kernel.org>)
	id 1uH05J-000000006zn-1vp6;
	Mon, 19 May 2025 14:59:13 +0200
Date: Mon, 19 May 2025 14:59:13 +0200
From: Johan Hovold <johan@kernel.org>
To: Alejandro Enrique <alejandroe1@geotab.com>
Cc: Conor Dooley <conor@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org
Subject: Re: [PATCH v2 3/3] riscv: dts: sophgo: add zfh for sg2042
Message-ID: <aCsrIcQ5L3kcXE6L@hovoldconsulting.com>
References: <20250514-ubx-m9-v1-0-193973a4f3ca@geotab.com>
 <20250514-ubx-m9-v1-1-193973a4f3ca@geotab.com>
 <20250514-saggy-shifter-e4ac7152f823@spud>
 <CAN=L63qsjEAvfocgP0tGrpe-x6Rx1gvTAkPE9i99Ai2zJj6ssA@mail.gmail.com>
 <20250515-varying-swan-31ca63615b43@spud>
 <CAN=L63oc7a6+_e+nhiyCkttX-TSbcjcwBmSzPsSk94m1ebGt4w@mail.gmail.com>
 <20250516-unfasten-submersed-e854fc9a0142@spud>
 <CAN=L63phSnssXs1p2HXhf08HMaHCE80EgMZQR0vPqhME2tknBQ@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAN=L63phSnssXs1p2HXhf08HMaHCE80EgMZQR0vPqhME2tknBQ@mail.gmail.com>

On Fri, May 16, 2025 at 05:00:50PM +0200, Alejandro Enrique wrote:
> On Fri, May 16, 2025 at 4:01 PM Conor Dooley <conor@kernel.org> wrote:
> >
> > On Fri, May 16, 2025 at 12:23:35PM +0200, Alejandro Enrique wrote:
> > > On Thu, May 15, 2025 at 5:02 PM Conor Dooley <conor@kernel.org> wrote:
> > > >
> > > > On Wed, May 14, 2025 at 06:53:25PM +0200, Alejandro Enrique wrote:
> > > > > On Wed, May 14, 2025 at 5:49 PM Conor Dooley <conor@kernel.org> wrote:
> > > > >
> > > > > > On Wed, May 14, 2025 at 01:55:54PM +0200, Alejandro Enrique via B4 Relay
> > > > > > wrote:
> > > > > > > From: Alejandro Enrique <alejandroe1@geotab.com>
> > > > > > >
> > > > > > > Add compatible for u-blox NEO-9M GPS module.
> > > > > > >
> > > > > > > Signed-off-by: Alejandro Enrique <alejandroe1@geotab.com>
> > > > > > > ---
> > > > > > >  Documentation/devicetree/bindings/gnss/u-blox,neo-6m.yaml | 1 +
> > > > > > >  1 file changed, 1 insertion(+)
> > > > > > >
> > > > > > > diff --git a/Documentation/devicetree/bindings/gnss/u-blox,neo-6m.yaml
> > > > > > b/Documentation/devicetree/bindings/gnss/u-blox,neo-6m.yaml
> > > > > > > index
> > > > > > 7d4b6d49e5eea2201ac05ba6d54b1c1721172f26..cf5ff051b9ab03e5bfed8156a72170965929bb7e
> > > > > > 100644
> > > > > > > --- a/Documentation/devicetree/bindings/gnss/u-blox,neo-6m.yaml
> > > > > > > +++ b/Documentation/devicetree/bindings/gnss/u-blox,neo-6m.yaml
> > > > > > > @@ -22,6 +22,7 @@ properties:
> > > > > > >        - u-blox,neo-6m
> > > > > > >        - u-blox,neo-8
> > > > > > >        - u-blox,neo-m8
> > > > > > > +      - u-blox,neo-m9
> > > > > >
> > > > > > No match data in the driver, why is a fallback not sufficient?
> > > > > >
> > > > >
> > > > > I added the match data in the driver in the PATCH 2/2 of this series
> > > > > in the same fashion as previously supported modules.
> > > >
> > > > Did you? When I looked, there was just a compatible and no match data.
> > >
> > > You are right. I just added a compatible string, no match data. Sorry,
> > > I was not following.
> > > I just added the neo-m9 compatible the same way the neo-6m was previously
> > > added.
> > >
> > > What do you mean by using a fallback? Using one of the existent
> > > compatibles (none have match data) or adding a new fallback
> > > compatible, something like just "u-blox,neo"?
> >
> > Falling back to one of the existing ones, like neo-m8.
> 
> That is perfectly possible. I added the new compatible string based
> on what was previously done for the neo-6m one.
> https://lore.kernel.org/lkml/20190401115616.21337-5-megous@megous.com/
> 
> If that is not a good approach I think this series can be discarded already.

We still want a new compatible string for the new device. Depending on
how similar these products are it may be possible to avoid adding a new
entry to the driver for now by specifying a fallback compatible, for
example, to neo-m8:

	compatible = "u-blox,neo-m9", "u-blox,neo-m8";

This would then need to be encoded in the binding.

Johan

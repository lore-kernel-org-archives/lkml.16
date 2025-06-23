Received: from mail-yw1-f179.google.com (mail-yw1-f179.google.com [209.85.128.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D5326248F45
	for <linux-kernel@vger.kernel.org>; Mon, 23 Jun 2025 09:32:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750671154; cv=none; b=GT04BbHvPDnN8oDPQZKOTBPuYgwjsgVXngJQ4jSG2K/MUe/vxniGt0w1F6a23b8gyVcsYyz8Btlq8+qV2W1yr3Q723b4kKldMmEIwZ11RhGEyumcdXldKrwtX/dKKRvM/vh2fPld8UnxZVR27DYSTIHpsezh40V9fx33iEopX4E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750671154; c=relaxed/simple;
	bh=8zqTQe5V/MWF2+SM6ba9OGvXCxAdHeTLP/kIpW9vp7Y=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ofYUPd5BszXVjwfsMdZxDZd/7OagBk9R7/2P8AGcarBXoXftYnQnVUO7m1O3vvt26OSZdOk1bnHSzARhqOy3NWG6EbeQcN6rjgbE+sEvlsQV/3DPDARcy8E7ZBezK2PKgOGIOQjmbgxqmn3OE6rz6xm4t7So5Com0TTqPDqfuT4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com; spf=pass smtp.mailfrom=riscstar.com; dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b=ZpL4YP55; arc=none smtp.client-ip=209.85.128.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=riscstar.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b="ZpL4YP55"
Received: by mail-yw1-f179.google.com with SMTP id 00721157ae682-70e6bddc30aso32650377b3.0
        for <linux-kernel@vger.kernel.org>; Mon, 23 Jun 2025 02:32:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20230601.gappssmtp.com; s=20230601; t=1750671151; x=1751275951; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=IohYGBXBMMHolEXivXwknWifsYzrTuAwnfm4o79Rd9A=;
        b=ZpL4YP55BOESZV3mkhOj2GILCEn6GGBhnFyJ873U/W2vRmMoGLyNHE1N6uIHySh989
         EYGgDLtN/T6w+8QQ4bhBZgvrjpppYcqBItY2wI/yuYNhHiJnFC7KhM7NYzrkcv+MTKHT
         Ep3T9PMq2BPJFMjwzSanWKHt+UuAKDdOwYSkmqgkvkOPATGh14a9osDGnr1ktkXI3omu
         XVuUboapChgI89aNIgF8AW9Hf70oHRVaWAehu/4CWZHJyLFqvlfb8I8No7FoAOTeG5Ht
         /EEsC8ewraiBb2N9GRf7GavXoG/izfhmQt1eRAquedYxlLiJOBgnAKqLmtHvhLAmK8ZX
         pcGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750671151; x=1751275951;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=IohYGBXBMMHolEXivXwknWifsYzrTuAwnfm4o79Rd9A=;
        b=H+uOYSbN7aqvcXKC+eR54/74y3+aj4mrXZ+M4xG33AWUGAQDWVEKObXlQOk0NWhQ0o
         aiQd65gbUjLZQfTQexnhhaItq7cS3M0xFq5ks/GswrNkBp44RTWBgmTKDp9VY8szB8l/
         rsKJgEKUC8A6xKh0fQ3RlRaMj85ooHvG9L7lq5MzGwvMVy0WaZFiCLZmwE3DZ+KNk3ql
         4NPPt+Pt4xvM/UYOXTzpFpNhQMnZe7L6WFUYWa0u86IAQi25APqsxkdniV+lSLhYc30Z
         s1Zw8Wug4GiRWNJ2NnGlHGYOoWO8RpO2o2U4Rc3a1garlyYNt6d5nTPAzgRTXu+7iqUY
         963Q==
X-Forwarded-Encrypted: i=1; AJvYcCUkikEANSGE2a6U53j9VcoREIeDSHiUccH6fxTtipbqBU/m2fRfFlEEVtlBYdjTgGQggEJ838bJi/AjXP8=@vger.kernel.org
X-Gm-Message-State: AOJu0YxlraZuQphOT4AaFgtwJzmCPToh/Z4iP0KGuJUqNun+3u4hn+rm
	1OXrd+vRIhkJV7yMJHjTOnrN/7U/eQ8nwmH5ZCna9gXy2jXfRcl2xZRhBI2G1mG2faDZm4Cjxf7
	lMkc5VMEgQp0Ca1oZEd6q4Q6pt/hasWLGe3K8K3I6IA==
X-Gm-Gg: ASbGncvLwExZi5OJ6jfF5bPU2jFe4v6IzHGzc9FpMs71mtlny1IBhu2hivOKd+Oy0IT
	yaBhjcmVxSKRQ7E6Qlndnp+nQn+sCmgSQswq7DibPeBHUB0d3rzO2StlAayg8Sm6ZnVc7WcTAHd
	4Y8/fFLxa5YiANlVFZzXFs+Qd/61Jhv5UQdgGgtIY7YYpvMEHGdfxQOmI=
X-Google-Smtp-Source: AGHT+IHkU9wOf9CKiFQyoKC8uhz+jzZwtwTaVc98YG0Doj4MPLMAU7z6FvX52x0gAV6c3kOGkIJHFiS9jAQ/+MRrPTg=
X-Received: by 2002:a05:690c:360e:b0:70e:2b60:1562 with SMTP id
 00721157ae682-712c63b1f77mr177353247b3.16.1750671150746; Mon, 23 Jun 2025
 02:32:30 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250617-k1-dma-buses-rfc-wip-v1-1-c8ec192fbf58@iscas.ac.cn>
 <5cc644f8-7394-48f2-b62b-1e7cd5ce27d3@ieee.org> <9e5e54a9-ef90-4a87-b082-d6eb9c7468c5@iscas.ac.cn>
 <20250620105619-GYA165049@gentoo> <CAH1PCMZibCc-P7JQf4WyhkKuT607bWppKfKQ-7eo7-PyNGDAOg@mail.gmail.com>
 <20250620145751-GYB165049@gentoo> <20250623070147-GYA193822@gentoo>
In-Reply-To: <20250623070147-GYA193822@gentoo>
From: Guodong Xu <guodong@riscstar.com>
Date: Mon, 23 Jun 2025 17:32:19 +0800
X-Gm-Features: AX0GCFt_zGzH-x_eaOt0cvSdcRE4WyrfDcsSgeci8rAiiPGn_0SWCtd9iua8oTE
Message-ID: <CAH1PCMaCjM1xH9UMmOAPn62T-qicWVCZ4Lbej2XYgKZUJ+zy8g@mail.gmail.com>
Subject: Re: [PATCH RFC] riscv: dts: spacemit: Add DMA translation buses for K1
To: Yixun Lan <dlan@gentoo.org>
Cc: Vivian Wang <wangruikang@iscas.ac.cn>, Alex Elder <elder@ieee.org>, 
	Ze Huang <huangze@whut.edu.cn>, spacemit@lists.linux.dev, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>, devicetree@vger.kernel.org, 
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Jun 23, 2025 at 3:01=E2=80=AFPM Yixun Lan <dlan@gentoo.org> wrote:
>
> Hi Guodong, Vivian
>
> On 14:57 Fri 20 Jun     , Yixun Lan wrote:
> > Hi Guodong,
> >
> > On 22:10 Fri 20 Jun     , Guodong Xu wrote:
> > > On Fri, Jun 20, 2025 at 6:56=E2=80=AFPM Yixun Lan <dlan@gentoo.org> w=
rote:
> > > >
> > > > Hi Vivian, Alex,
> > > >
> > > > On 23:42 Thu 19 Jun     , Vivian Wang wrote:
> > > > > Hi Alex,
> > > > >
> > > > > Thank you for your comments on this.
> > > > >
> > > > > On 6/19/25 23:11, Alex Elder wrote:
> > > > > > On 6/17/25 12:21 AM, Vivian Wang wrote:
> > > > > >> The SpacemiT K1 has various static translations of DMA accesse=
s. Add
> > > > > >> these as simple-bus nodes. Devices actually using these transl=
ation will
> > > > > >> be added in later patches.
> > > > > >>
> > > > > >> The bus names are assigned according to consensus with Spacemi=
T [1].
> > > > > >>
> > > > > >> [1]
> > > > > >> https://lore.kernel.org/all/CAH1PCMaC+imcMZCFYtRdmH6ge=3DdPgnA=
Nn_GqVfsGRS=3D+YhyJCw@mail.gmail.com/
> > > > > >
> > > > > > So what you include here very closely matches what Guodong
> > > > > > said in the message above.  Yours differs from his proposal
> > > > > > and that makes it hard to compare them.  I have a few comments
> > > > > > on that below.
> > > > > >
> > > > > >> Signed-off-by: Vivian Wang <wangruikang@iscas.ac.cn>
> > > > > >> ---
> > > > > >> This is my concrete proposal for representing DMA translations=
 for
> > > > > >> SpacemiT K1.
> > > > > >
> > > > > > It's worth acknowledging that this is derived from what Guodong
> > > > > > proposed (it's not "your" proposal in that respect).  That said=
,
> > > > > > yours is a more complete and "formal" RFP than what he wrote.
> > > > > >
> > > > > I had thought that since the addresses were already there in vend=
or's DT
> > > > > [2], and the names were provided by SpacemiT, anything other than=
 the
> > > > > names was "well-known information". In retrospect, I should have =
made
> > > > > the chain of information of this clearer and make it explicit tha=
t this
> > > > > was based on Guodong's note.
> > > > >
> > > > > So, just to be clear, the information in my proposal is based on
> > > > > Guodong's reply [1] (link the quoted text), which I had assumed, =
but not
> > > > > explicitly confirmed, was based on already addresses in SpacemiT'=
s DT
> > > > > and names provided by SpacemiT.
> > > > >
> > > > > [2]: https://github.com/spacemit-com/linux-k1x/blob/k1/arch/riscv=
/boot/dts/spacemit/k1-x.dtsi
> > > > >
> > > > > >> For context, memory on the SpacemiT K1 is split into two chunk=
s:
> > > > > >>
> > > > > >> - 0x0000_0000 to 0x8000_0000: First 2 GiB of memory
> > > > > >> - 0x1_0000_0000 above: Rest of memory
> > > > > >>
> > > > > >> DMA-capable devices on the K1 all have access to the lower 2G =
of memory
> > > > > >> through an identity mapping. However, for the upper region of =
memory,
> > > > > >> each device falls under one of six different mappings. The map=
pings are
> > > > > >> provided in this patch as simple-bus nodes that device nodes s=
hould be
> > > > > >> added to.
> > > > > >>
> > > > > >> This patch is an RFC because it is not meant to be applied, or=
 at least,
> > > > > >> not certainly meant to be applied. Instead, this is an attempt=
 to come
> > > > > >> to a consensus on how these bus nodes should look like.
> > > > > >
> > > > > > I think the above is what Krzysztof might not have seen.  Perha=
ps
> > > > > > it could have been made more clear--maybe in the "main" descrip=
tion
> > > > > > section (above the ---) or even the subject line.
> > > > > >
> > > > > Yeah, that's my mistake in organizing the paragraphs.
> > > > >
> > > > > >> More specifically, I propose that the process proceeds as foll=
ows:
> > > > > >>
> > > > > >> - Firstly, relevant parties agree on these bus nodes given her=
e.
> > > > > >> - After that, each time the first user of a bus appears, the s=
eries
> > > > > >>    should include a patch to add the bus required for that dri=
ver.
> > > > > >> - If a driver being submitted uses the same bus as another one=
 that has
> > > > > >>    been submitted but hasn't yet landed, it can depend on the =
bus patch
> > > > > >>    from that previous series.
> > > > > >
> > > > > > Getting agreement is good, but otherwise this is basically
> > > > > > the process Guodong was suggesting, right?
> > > > >
> > > > > Hmm, actually re-reading the discussion now, I realized that I ma=
y have
> > > > > come to this late and missed out on some previous discussions, wh=
ich
> > > > > were alluded to in Yixun's messages. (This is again thread around=
 link
> > > > > [1] in quoted text.) This led me to believe that some of these we=
re not
> > > > > really agreed upon.
> > > > >
> > > > > I also realized I think one of the things I may have not yet made=
 clear
> > > > > is that I would like the bus node to be a *separate* patch. I thi=
nk this
> > > > > makes sense, because it's dealing with two different subsystems.
> > > > >
> > > > > >
> > > > > >> For conventions regarding coding style, I propose that:
> > > > > >>
> > > > > >> - #address-cells and #size-cells are 2 for consistency
> > > > > >> - These bus nodes are put at the end of /soc, inside /soc
> > > > > >> - These bus nodes are sorted alphabetically, not in vendor's o=
rder
> > > > > >> - Devices are added into *-bus nodes directly, not appended to=
wards the
> > > > > >>    end with a label reference
> > > > > >
> > > > > > I do like that you're trying to be more complete and explicit
> > > > > > on what you think needs agreement on.
> > > > > >
> > > > > Being thorough was the main goal of this RFC. If there was previo=
us
> > > > > agreement on how dma-ranges should be done, I'm sorry for missing=
 them,
> > > > > but from my observations on the mailing list on how these ended u=
p into
> > > > > patches I really haven't seen much consistency. Maybe there was
> > > > > misunderstanding, which I'm hoping to clear up.
> > > > >
> > > > > (Although see my paragraph above, maybe I haven't been thorough e=
nough.)
> > > > >
> > > > > >> The K1 DMA translations are *not* interconnects, since they do=
 not
> > > > > >> provide any configuration capabilities.
> > > > > >>
> > > > > >> These bus nodes names and properties are provided compliant wi=
th
> > > > > >> "simple-bus" bindings, and should pass "make dtbs_check".
> > > > > >>
> > > > > >> Remaining questions:
> > > > > >>
> > > > > >> - Should storage-bus exist? Or should drivers under it simply =
specify
> > > > > >>    32-bit DMA?
> > > > > >
> > > > > > Explicitly saying storage devices have one-to-one mapping
> > > > > > seems informative, to me.
> > > > sounds good to be explicit
> > > >
> > > > > >
> > > > > >> ---
> > > > > >>   arch/riscv/boot/dts/spacemit/k1.dtsi | 53
> > > > > >> ++++++++++++++++++++++++++++++++++++
> > > > > >>   1 file changed, 53 insertions(+)
> > > > > >
> > > > > > The short summary of what differs between your proposal
> > > > > > and what Guodong said is:
> > > > > > - You sort nodes alphabetically, Guodong did not
> > > > > > - You dropped the unit address
> > > > I'd agree with not adding unit number to the simple-bus
> > > >
> > > > > > - You dropped the comments he had, which indicated which
> > > > > >   devices "belonged" to each mapping
> > > > I went ahead and checked those comments, and found them all about
> > > > devices under specific bus, I'm not strongly against adding the
> > > > comments but feel it's kind of unnecessary, or even in worst cases,
> > > > it may bring extra confusions.. on the other hand, you can always
> > > > check  device nodes under the bus to find what's there.
> > > >
> > > > exmaple for dram4_range(vendor code)/dma_bus, the comments is
> > > >  /* DMA controller, and users */
> > > > what's is 'users'? still have to check the dts, and find them -
> > > > uart, spi, i2c, qspi, hdmi, sounds..
> > > >
> > > > If people really want to add comments and help others to understand
> > > > this patch, then I'd suggest to add explanation in commit message(b=
etter?)
> > > > to fully describe all the busses, or why choose this name? -
> > > >  storage/multimedia/pcie/camera/dma/network_bus
> > > > pretty much in much high level perspective..
> > > >
> > > > > > - You added a compatible property to each ("simple-bus")
> > > > > > - You added an explicit (empty) ranges property to each
> > > > > > - You add #address-cells and #size-cells properties, both 2
> > > > > > - Your dma-ranges properties are identical to Guodong's,
> > > > > >   for all nodes
> > > > I think those all above already exist in Guodong's version which
> > > > align his idea
> > > >
> > > > > >
> > > > > That was a good summary. Thanks!
> > > > >
> > > > > My main goal of organizing the bus this way is making it actually=
 pass
> > > > > "make dtbs_check". I'm not sure if Krzysztof still objects to my =
reading
> > > > > of simple-bus.yaml though.
> > > > It would be great if DT maintainer can clarify, or give an ACK
> > > >
> > > > >
> > > > > By the way, I don't think I will be making an RFC v2 of this. I t=
hink we
> > > > > should get everything sorted under this one thread.
> > > > >
> > > > Instead, from a SoC tree maintainer's perspective (whom taking care=
 of
> > > > merging all the dts files), I'd rather perfer an independent or
> > > > separated patch for this given every party reached consesus, so we =
could
> > > > get this patch merged first and early, instead of getting them dist=
ributed all
> > > > over in different series, IMO, separated patches brings more dedepe=
ndencies
> > > > if more than two series require one bus and result in more merge co=
nflicts..
> > > > Besides, introducing new busses result in re-arrangement of previou=
s nodes,
> > > > those like uart, i2c (even they have no DMA feature implemented cur=
rently)..
> > > >
> > >
> > > Hi Yixun,
> > >
> > > So, here is my proposed plan: I will submit two patches. The first
> > > patch will introduce the dma-bus node and move the relevant (uart0, u=
art2
> > > ..uart9) device nodes under it. The second patch will then add the pd=
ma0
> > > node itself. Please let me know if you have a different approach in m=
ind.
> > >
> > ..
> > > Maybe you want to see an independent patchset with just the first pat=
ch? This
> > > way it can be merged early without waiting for the pdma0 series.
> > > Let me know. Thanks.
> > yes, I prefer this way, this will also help other drivers - usb/emac,
> > since they all wait for those bus nodes..
> >
> > please submit following two parts a) introduce bus b) move relevant nod=
es.
> > notice, I don't mind who (you or Vivian) doing the job, but keep in
> > mind don't duplicate the work..
> >
> to make it clear, I'd like to see all relevant *bus nodes added in one
> independent series, not only dma-bus, even some nodes currently not used.
> the goal here is "do it once, and do it well"
>
> in fact, I'd expect Vivian(or Guodong, whoever) to send a new version
> of this patch without RFC prefix..
>

I'm ok if Vivian can do that.
Thanks.

> > >
> > > On a side note, you mentioned I2C. I searched for upstream I2C DTS no=
des
> > > for the K1 but couldn't find any. I checked the for-next/dt-for-next
> > > branches in the spacemit-com/linux.git repository. Did I miss somethi=
ng?
> > >
> > you right here, the i2c driver is accepted, but not dts..
> > btw, the PMIC series do introduce i2c nodes at patch 3/6
> >
> > > BR,
> > > Guodong
> > >
> > >
> > > > >
> > > >
> > > > --
> > > > Yixun Lan (dlan)
> >
> > --
> > Yixun Lan (dlan)
>
> --
> Yixun Lan (dlan)

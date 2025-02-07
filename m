Received: from mail.thorsis.com (mail.thorsis.com [217.92.40.78])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0899B33EC;
	Fri,  7 Feb 2025 12:41:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.92.40.78
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738932092; cv=none; b=WO+oNEva61KAqMVha7mOQ9KrdQZbMgxXTGwGkorvzKj47H/LGtit9lvNLNHYsalGKC43yvkRHsTJNGF8uh2TwszlhehlZLNYWWWp/O7EyUHn5Geab2lwXJSVLeCmk5zfqocnDPrD0Fq3GV622ge//jK51Kwi7VlRKsm9hUpUJuo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738932092; c=relaxed/simple;
	bh=mpOr9v1Iv1g+eXBaWor4i6lRualGacDuJjfb0elRjJI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=fxXwg0jPFJa96bvZV5EYKp9MfYc3C1hY1X1/vAlSuu1CEKyBfbBwBlBikLAsaQh0MudJB3kb6h3MMebw62iUIXrLpHWpf8jv0Ro2md0tDGuiLa2P9g7CxbECf1Th1VReeEDwa/Y82xsZlNF11wVaKxJh5XLp3HCcAhZ/HSrlSpQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=thorsis.com; spf=pass smtp.mailfrom=thorsis.com; dkim=pass (2048-bit key) header.d=thorsis.com header.i=@thorsis.com header.b=mYIIh4Kw; arc=none smtp.client-ip=217.92.40.78
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=thorsis.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=thorsis.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=thorsis.com header.i=@thorsis.com header.b="mYIIh4Kw"
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id D8C6F1488009;
	Fri,  7 Feb 2025 13:41:17 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=thorsis.com; s=dkim;
	t=1738932080;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=QWD61r7CPB5282CAstyoSuCiptAtxZmL/Iy5R+ZqCfQ=;
	b=mYIIh4Kw2ro01GUWcCu+YHOZHXuCOY2BaxHODfNCufm21G+UaGCP/g41VcAYaV0Efn6qZ0
	D2iWAZy5kFIpnJu8fUgSHs9UUOtEWmOzXeTCbjbfDhoxAn/sd1JZEnqRmg6httQoB33RgA
	c45BoB1WlTWaQUZQB5mr3KEgWyARsoX2jiCtia7UEyqcChXAa7feOR4KAnqnc8ZULm6DSR
	cJZWKKRr7JAAzcN1YoUVETIDOHuadXvNdi9B39GGHMZHreAcCSvE8u3641SIGFtYp+5n/F
	CAL0a/MqrdePbLtPwkJMUBTR/McPNJXCwOENEmuYFPbPq7+adKqv2CwmNyePug==
Date: Fri, 7 Feb 2025 13:41:16 +0100
From: Alexander Dahl <ada@thorsis.com>
To: Ryan Wanner <ryan.wanner@microchip.com>
Cc: claudiu beznea <claudiu.beznea@tuxon.dev>, ada@thorsis.com,
	Rob Herring <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
	"open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>,
	Stephen Boyd <sboyd@kernel.org>,
	Christian Melki <christian.melki@t2data.com>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	open list <linux-kernel@vger.kernel.org>,
	Michael Turquette <mturquette@baylibre.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	"open list:COMMON CLK FRAMEWORK" <linux-clk@vger.kernel.org>,
	"moderated list:ARM/Microchip (AT91) SoC support" <linux-arm-kernel@lists.infradead.org>
Subject: Re: [PATCH v1 09/12] clk: at91: sam9x60: Allow enabling main_rc_osc
 through DT
Message-ID: <20250207-jailbird-circus-bcc04ee90e05@thorsis.com>
Mail-Followup-To: Ryan Wanner <ryan.wanner@microchip.com>,
	claudiu beznea <claudiu.beznea@tuxon.dev>,
	Rob Herring <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
	"open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>,
	Stephen Boyd <sboyd@kernel.org>,
	Christian Melki <christian.melki@t2data.com>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	open list <linux-kernel@vger.kernel.org>,
	Michael Turquette <mturquette@baylibre.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	"open list:COMMON CLK FRAMEWORK" <linux-clk@vger.kernel.org>,
	"moderated list:ARM/Microchip (AT91) SoC support" <linux-arm-kernel@lists.infradead.org>
References: <20240821105943.230281-1-ada@thorsis.com>
 <20240821105943.230281-10-ada@thorsis.com>
 <20240919-outsider-extending-e0a926bd23fa@thorsis.com>
 <464f599a-7f0b-4e4e-901a-8f88a25428d6@microchip.com>
 <e6c10efa-0ed6-4040-8fe2-e83d3903547a@tuxon.dev>
 <d226d9e4-667a-4b4f-bc3f-9910f7c0d3e0@microchip.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <d226d9e4-667a-4b4f-bc3f-9910f7c0d3e0@microchip.com>
User-Agent: Mutt/2.2.12 (2023-09-09)
X-Last-TLS-Session-Version: TLSv1.3

Hei hei,

I'm currently reworking this series.  Everything else is more or less
clear to me, but this core clock array index stuff makes knots in my
head, see below.  (I keep all the context, because it's been a while …)

Am Tue, Oct 01, 2024 at 08:04:55AM -0700 schrieb Ryan Wanner:
> On 9/26/24 00:42, claudiu beznea wrote:
> > EXTERNAL EMAIL: Do not click links or open attachments unless you know the content is safe
> > 
> > Hi, Ryan, Alexander,
> > 
> > Sorry for returning late, I took some time to think about it...
> > 
> > On 24.09.2024 18:52, Ryan Wanner wrote:
> >> Hello Alex,
> >>
> >> I think a possible solution is to put the DT binding ID for main rc oc
> >> after PMC_MCK and then add 1 to all the other IDs that are not dependent
> >> on PMC_MAIN, the IDs that are before the branch for the sama7g54.
> > 
> > If I understand correctly, wouldn't this shift also the rest of the IDs
> > and break the DT ABI?
> > 
> >>
> >> One issue I see with this solution is with SoCs that do not want the
> >> main rc os exported to the DT the driver array might be allocating too
> >> much memory, this can be solved by removing the +1 that is in the clock
> >> drivers next to the device tree binding macro, since this macro is now
> >> increased by 1 with this change.
> >>
> >> Doing a quick test on the sam9x60 and sama7g54 I did not see any glaring
> >> issues with this potential solution.
> >>
> >> Best,
> >>
> >> Ryan
> >>
> >>
> >> On 9/19/24 05:39, Alexander Dahl wrote:
> >>> EXTERNAL EMAIL: Do not click links or open attachments unless you know the content is safe
> >>>
> >>> Hello Claudiu,
> >>>
> >>> after being busy with other things, I'm back looking at this series.
> >>> As Nicolas pointed out [1], we need three clocks for the OTPC to work,
> >>> quote:
> >>>
> >>>   "for all the products, the main RC oscillator, the OTPC peripheral
> >>>   clock and the MCKx clocks associated to OTP must be enabled."
> >>>
> >>> I have a problem with making the main_rc_osc accessible for both
> >>> SAM9X60 and SAMA7G5 here, see below.
> >>>
> >>> Am Wed, Aug 21, 2024 at 12:59:40PM +0200 schrieb Alexander Dahl:
> >>>> SAM9X60 Datasheet (DS60001579G) Section "23.4 Product Dependencies"
> >>>> says:
> >>>>
> >>>>     "The OTPC is clocked through the Power Management Controller (PMC).
> >>>>     The user must power on the main RC oscillator and enable the
> >>>>     peripheral clock of the OTPC prior to reading or writing the OTP
> >>>>     memory."
> >>>>
> >>>> The code for enabling/disabling that clock is already present, it was
> >>>> just not possible to hook into DT anymore, after at91 clk devicetree
> >>>> binding rework back in 2018 for kernel v4.19.
> >>>>
> >>>> Signed-off-by: Alexander Dahl <ada@thorsis.com>
> >>>> ---
> >>>>  drivers/clk/at91/sam9x60.c       | 3 ++-
> >>>>  include/dt-bindings/clock/at91.h | 1 +
> >>>>  2 files changed, 3 insertions(+), 1 deletion(-)
> >>>>
> >>>> diff --git a/drivers/clk/at91/sam9x60.c b/drivers/clk/at91/sam9x60.c
> >>>> index e309cbf3cb9a..4d5ee20b8fc4 100644
> >>>> --- a/drivers/clk/at91/sam9x60.c
> >>>> +++ b/drivers/clk/at91/sam9x60.c
> >>>> @@ -207,7 +207,7 @@ static void __init sam9x60_pmc_setup(struct device_node *np)
> >>>>       if (IS_ERR(regmap))
> >>>>               return;
> >>>>
> >>>> -     sam9x60_pmc = pmc_data_allocate(PMC_PLLACK + 1,
> >>>> +     sam9x60_pmc = pmc_data_allocate(PMC_MAIN_RC + 1,
> >>>>                                       nck(sam9x60_systemck),
> >>>>                                       nck(sam9x60_periphck),
> >>>>                                       nck(sam9x60_gck), 8);
> >>>> @@ -218,6 +218,7 @@ static void __init sam9x60_pmc_setup(struct device_node *np)
> >>>>                                          50000000);
> >>>>       if (IS_ERR(hw))
> >>>>               goto err_free;
> >>>> +     sam9x60_pmc->chws[PMC_MAIN_RC] = hw;
> >>>>
> >>>>       hw = at91_clk_register_main_osc(regmap, "main_osc", mainxtal_name, NULL, 0);
> >>>>       if (IS_ERR(hw))
> >>>> diff --git a/include/dt-bindings/clock/at91.h b/include/dt-bindings/clock/at91.h
> >>>> index 3e3972a814c1..f957625cb3ac 100644
> >>>> --- a/include/dt-bindings/clock/at91.h
> >>>> +++ b/include/dt-bindings/clock/at91.h
> >>>> @@ -25,6 +25,7 @@
> >>>>  #define PMC_PLLBCK           8
> >>>>  #define PMC_AUDIOPLLCK               9
> >>>>  #define PMC_AUDIOPINCK               10
> >>>> +#define PMC_MAIN_RC          11
> >>>>
> >>>>  /* SAMA7G5 */
> >>>>  #define PMC_CPUPLL           (PMC_MAIN + 1)
> >>>
> >>> There are IDs defined in the devicetree bindings here, which are used
> >>> both in dts and in driver code as array indexes.  In v1 of the patch
> >>> series I just added a new last element in the end of the generic list
> >>> and used that for SAM9X60.
> >>>
> >>> For SAMA7G5 those IDs are branched of from PMC_MAIN in between, making
> >>> SAMA7G5 using a different last element, and different values after
> >>> PMC_MAIN.
> > 
> > Looking at it now, I think it was a bad decision to do this branch.
> > Thinking at it maybe it would be better to have per SoC specific bindings
> > to avoid this kind of issue in future. The PMC IP b/w different SAM SoCs is
> > anyway different and, as it happens now, we may reach to a point where, due
> > to issues in datasheet, or whatever human errors, we may reach this problem
> > again.
> > 
> > So, what do you think about having separate binding files for each SoC?
> 
> I think the simplest way to do this is having a separate file for the
> SAMA7 SoC clock bindings. To me it looks like the split is for the SAMA7
> SoCs only, so having a separate file will be the best solution as it
> will mean less duplicate code and still keeping the O(1) look up time.

This is not true, at least not anymore.  I try to wrap it up.

We have 13 different drivers now for 15 different compatibles/SoC
variants:

at91rm9200.c
at91sam9g45.c
at91sam9n12.c
at91sam9rl.c
at91sam9x5.c
at91sam9260.c   -> also for 9261 and 9263
sam9x7.c
sam9x60.c
sama5d2.c
sama5d3.c
sama5d4.c
sama7d65.c
sama7g5.c

Those use different sets of core clocks allocated by
pmc_data_allocate() and with different maximum index aka array size.
No driver uses all members of pmc_data->chws, each leaves more or less
many holes, each hole around 44 bytes AFAICT.

(I have a spreadsheet for this now if anyone is interested.)

I need to add a new clock (main rc oscillator) for using the OTPC, a
block available on sam9x60, sam9x7, sama7g5 and sama7d65.  The max
indexes for those are:

sam9x60:    PMC_PLLACK = 7                      (using 4, wasting 4)
sam9x7:     PMC_LVDSPLL = PMC_MAIN + 12 = 15    (using 8, wasting 8)
sama7d65:   PMC_INDEX_MAX = 25                  (using 12, wasting 13, defined in source!)
sama7g5:    PMC_MCK1 = PMC_MAIN + 10 = 13       (using 8, wasting 6)

Note: sam9x7 uses `PMC_AUDIOPMCPLL (PMC_MAIN + 6)` and above _and_
PMC_PLLACK which is after or lets say in between the "PMC_MAIN +
branchoff thing", making things even more messy.

I could just add PMC_MAIN_RC = PMC_MAIN + 15 = 18 now, this would be
more or less okay for the newer SoCs I guess, but it would mean 19
array members for sam9x60 of which only five are used, so 14 * 44 byte
wasted.

Over 600 byte wasted for a solution which already is quite messy?!

If there are no objections, I'm going to make this binding splitup now.
I see 2 variants:

1. full splitup per SoC/driver?
2. opportunistic approach keeping the old stuff up to sam9x60 and
sama5, and just create new headers for sam9x7 and shared
sama7g5/sama7d65?

Question is about naming the symbols then.  I guess it would be a bad
idea to define the same thing twice with different values like this?
Have this in one file for sam9x60:

    #define PMC_MAIN_RC 10

and this in a different file for sama7:

    #define PMC_MAIN_RC (PMC_MAIN + 15)


So I rather introduce some new headers including different new
per SoC values like this?  For sam9x60:

    #define SAM9X60_PMC_MAIN_RC 10

For sam9x7:

    #define SAM9X7_PMC_MAIN_RC (PMC_MAIN + 13)

For sama7*:

    #define SAMA7_PMC_MAIN_RC (PMC_MAIN + 15)


And then keep all the old names for now?  Should some definitions be
moved to the new headers already?  Add some comments maybe?  Or
duplicate the old definitions like this?
Keep in generic header:

    #define PMC_MCK3 (PMC_MAIN + 13)

Add in separate header:

    /* same as PMC_MCK3 */
    #define SAMA7_PMC_MCK3 16

I'll come up with something and you can review the patch series then.
Just let me know what you think, I mean Microchip, it's your SoCs and
drivers, I just need the UID on sam9x60, I did not intend to climb
down this rabbit hole in the first place. ;-)

Greets
Alex

> 
> Best,
> Ryan
> > 
> > Another option would be to xlate the clocks not by directly indexing in
> > struct pmc_data::chws but by matching the driver clock ID and DT provided
> > id. This will increase the lookup time, from O(1) to O(N), N being 13 for
> > SAMA7G5, 15 for SAM9X7 and SAMA7D55. And will need adjustment at least for
> > SAM9X{60, 7} and SAMA7{G5, D55}. With this the of_clk_hw_pmc_get() will be
> > something like:
> > 
> > diff --git a/drivers/clk/at91/pmc.c b/drivers/clk/at91/pmc.c
> > index 5aa9c1f1c886..22191d1ca78b 100644
> > --- a/drivers/clk/at91/pmc.c
> > +++ b/drivers/clk/at91/pmc.c
> > @@ -52,8 +52,10 @@ struct clk_hw *of_clk_hw_pmc_get(struct of_phandle_args
> > *clkspec, void *data)
> > 
> >         switch (type) {
> >         case PMC_TYPE_CORE:
> > -               if (idx < pmc_data->ncore)
> > -                       return pmc_data->chws[idx];
> > +               for (int i = 0; i < pmc_data->ncore; i++) {
> > +                       if (pmc_data->chws.idx[i] == i)
> > +                               return pmc_data->chws.hws[i];
> > +               }
> >                 break;
> > 
> > 
> > diff --git a/drivers/clk/at91/pmc.h b/drivers/clk/at91/pmc.h
> > index 4fb29ca111f7..f7e88f9872dc 100644
> > --- a/drivers/clk/at91/pmc.h
> > +++ b/drivers/clk/at91/pmc.h
> > @@ -19,7 +19,10 @@ extern spinlock_t pmc_pcr_lock;
> > 
> >  struct pmc_data {
> >         unsigned int ncore;
> > -       struct clk_hw **chws;
> > +       struct {
> > +               struct clk_hw **hws;
> > +               int *idx;
> > +       } chws;
> > 
> > Thank you,
> > Claudiu Beznea
> > 
> >>>
> >>> Now we need a new ID for main rc osc, but not only for SAM9X60, but
> >>> also for SAMA7G5.  I'm not sure what the implications would be, if the
> >>> new ID would be added in between before PMC_MAIN, so all values would
> >>> change?  Adding it to the end of the lists would probably be safe, but
> >>> then you would need a diffently named variant for SAMA7G5's different
> >>> IDs.  I find the current status somewhat unfortunate for future
> >>> extensions.  How should this new ID be added here?  What would be the
> >>> way forward?
> >>>
> >>> Greets
> >>> Alex
> >>>
> >>> [1] https://lore.kernel.org/linux-clk/ec34efc2-2051-4b8a-b5d8-6e2fd5e08c28@microchip.com/T/#u
> >>>
> >>>> --
> >>>> 2.39.2
> >>>>
> >>>>
> >>>
> >>
> 
> 

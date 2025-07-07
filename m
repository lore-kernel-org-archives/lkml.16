Received: from smtpbg150.qq.com (smtpbg150.qq.com [18.132.163.193])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 90BB71991CA;
	Mon,  7 Jul 2025 08:35:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=18.132.163.193
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751877332; cv=none; b=io3lXIJnZ+qzggHjGW51xSuO626bNUidSN9S+/Py9Ko6qPk2s29urUrLWhSGoSERsTe9YQKXfnUyCZwtmpyhMd1tzacd6beKswR0cfbszqkxweIPiRzbudfPRUv6F/4yvXEhx8NYGqn4llW855Z2dNk7SkbZG5UL3FG0eqkKbRU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751877332; c=relaxed/simple;
	bh=c+OHzeBm0ZQ5KVmICsG+TpRuQJv+FO1MlXQYnQ9Woc8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Ncj8tRaXfZI8+pg8a7YcK7RpeuXc3KTXrrD+eSMI6M8PKeXyhes1E2kaGcGolxqAMNvgNIC28rg7yJ0Zh2c8vcrncZimUkFv+sOBNcX+BbzN25nGQEzIz5x+/JIvr5bb5/VDSFQijpQL5jX7lJJro40lYfbhBHyNrAAkLBuVWHs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foursemi.com; spf=pass smtp.mailfrom=foursemi.com; arc=none smtp.client-ip=18.132.163.193
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foursemi.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=foursemi.com
X-QQ-mid: esmtpgz14t1751877245t6879af3a
X-QQ-Originating-IP: EXPBHUCjMuLBbyDHcC6ocEdsYFi+F1sQN5KjNonpwzY=
Received: from localhost ( [113.89.234.180])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Mon, 07 Jul 2025 16:34:03 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 11672384708710778107
EX-QQ-RecipientCnt: 12
Date: Mon, 7 Jul 2025 16:34:03 +0800
From: Nick Li <nick.li@foursemi.com>
To: Mark Brown <broonie@kernel.org>
Cc: lgirdwood@gmail.com, robh@kernel.org, krzk+dt@kernel.org,
	conor+dt@kernel.org, perex@perex.cz, tiwai@suse.com,
	xiaoming.yang@foursemi.com, danyang.zheng@foursemi.com,
	linux-sound@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v1 2/4] ASoC: codecs: Add FourSemi FS2104/5S audio
 amplifier driver
Message-ID: <88CC983A5550253C+aGuGe7pQvIBPclfz@foursemi.com>
References: <20250703035639.7252-1-nick.li@foursemi.com>
 <20250703035639.7252-3-nick.li@foursemi.com>
 <b1ad15d1-bf9f-4b94-abb8-1e9c6d512987@sirena.org.uk>
 <1C4720AC50797830+aGe3L70OToh6txmC@foursemi.com>
 <0370941d-63eb-4676-8a74-b8afef524376@sirena.org.uk>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <0370941d-63eb-4676-8a74-b8afef524376@sirena.org.uk>
X-QQ-SENDSIZE: 520
Feedback-ID: esmtpgz:foursemi.com:qybglogicsvrsz:qybglogicsvrsz3a-0
X-QQ-XMAILINFO: ONcd5u+FjiuQnR804v+HINLptnFnRAJHpfCkgG7xlisGJhqfmE4C69qT
	fdn1XhLXZvE4qwUzQ7J+dRvOb14le0niRpvmhgQB34NhbJo6HfmdJtjTWiKZ32mWgACKm7P
	aK8n95mg3Xn6VUgC89FCB2ZrPgmbHul1MRGnZWuiCBm5fcWQlUzcOpGb1SO3rwR+KEH4Qjk
	T9Enayh0y86+sVRUlxLpw/iH0moAdQYhK2qTjYuP1baT7f5rpPkf+PSKkh6pHLzaKEdbKKX
	PnZL21QCIOS9el2m+ANRAVONmuEhMJT648BAtPY9JW6nHzUoGkKJUOm3UkwN1MP36NkoLfx
	JFO7vHQaqfzjI2IOtmDXUtbMz7By/pQpfQTyJ+oY+yohc/malE7mkbKgNbfOEUvzhfVNeZn
	Nt8ogP9CVTcf2AScirz32CKD83U6X6w0rIKjZFr+7ksCXBkh6Fg/0rrcdL+SGMN96EM3Qja
	+jQVO3N687YaERH7nC2dBTSEtD8w3dK24IAe2mKJmlHIaT6K2QcPTyYXneBHRUPismgnPpn
	8U5Fmf+g76GL7BKkKVm7vvmduNyyeT/2zs8cvepfDw8QMXR3c1hR/bte0P4nRRpoOFUreNJ
	ZC2Qlc7p1EiVYsZFf82hFjAZ607OvTdurz80OYAxlh1jg3gliPCHro7lu1BEHHo+UpAN6lK
	ZrwJ5rfy3NNN5+K8qe5k3TVworC00ISuhuVfUY1i9d6cUykRROoeFp64wrI7z25IYg6pAdZ
	sDE+YtBaO9jensJdtGgk22aH9TGQetfFGthYPBUKArY5vU0MjJcnEJljMO4QwUY4ZOd4oRS
	g+HYQ23s73z7a+ce/MkLSbZfpux12o6/ojoVhNW4s4FQ0XE5maJRYHd4nQUZvIda4teVuXK
	H+spoYzgLaadbqSXh078DLiglpKZC+hv3rVVT3DwHzDJ/O7WQFPUzWZYp6SWXQ2PHRKgN6r
	zDZpPrkEtH+J+/WrDLZCVdlfM4Gy+wo90CaUK/23AJW8Rxc42BHBfbed58e3cdOFHTUTofF
	t8+81HfhQJA24res0w
X-QQ-XMRINFO: NyFYKkN4Ny6FSmKK/uo/jdU=
X-QQ-RECHKSPAM: 0

On Fri, Jul 04, 2025 at 03:37:32PM +0100, Mark Brown wrote:
> On Fri, Jul 04, 2025 at 07:12:47PM +0800, Nick Li wrote:
> > On Thu, Jul 03, 2025 at 03:59:34PM +0100, Mark Brown wrote:
> > > On Thu, Jul 03, 2025 at 11:56:37AM +0800, Nick wrote:
> 
> > > > +static int fs210x_set_pcm_volume(struct fs210x_priv *fs210x)
> 
> > > > +	ret  = fs210x_reg_write(fs210x, FS210X_39H_LVOLCTRL, vol[0]);
> > > > +	ret |= fs210x_reg_write(fs210x, FS210X_3AH_RVOLCTRL, vol[1]);
> 
> > > This looks pretty generic, why is it not using a standard control type?
> 
> > 1. We use regmap as REGMAP_NONE, because most of the registers settings
> >    are in the firmware, if we use a standard control,the driver shouldn't
> >    cache the registers after suspending the device(it will be reset).
> 
> You can exclude registers from a cache, including excluding most of
> them, or manually handle registers over suspend/resume.  It's generally
> better to share the userspace facing interfaces.

OK, we will update the volume control to:
SOC_DOUBLE_TLV(...)
and use the regmap to cache the volumes.

> 
> > 2. The volume registers of FS2104 and FS2105S are different,
> >    if we us a stardard control, we need two controls,
> >    and register it by checking the device type.
> > so we customize the volume control.
> 
> If the different devices have different controls you should just
> register different controls.

OK.

> 
> > > > +	ret = fs210x_set_pcm_volume(fs210x);
> 
> > > The driver should use the device defaults rather than having to 
> 
> > The volume contorl can be used to set different volumes,
> > the volume will be masked in fs210x->vol[2],
> > we restore the volume when the driver resumes(reinitializes) the deivce.
> 
> You're not just restoring the values on resume, you're also overwriting
> them on probe.

Yes, the volume will be set to the default value at the first time of initialization on probe,
and it may be updated by volume control later.
It's a good way to use the regmap cache(REGCACHE_RBTREE) to cache the volumes.

> 
> > > > +static void fs210x_sdz_pin_set(struct fs210x_priv *fs210x, bool active)
> > > > +{
> > > > +	if (!fs210x || !fs210x->gpio_sdz)
> > > > +		return;
> 
> > > Shouldn't this be integrated with the chip init/reset?
> 
> > 1. We implement this function(reset and wait times) to clarify that
> >    pulling up/down the SDZ/reset pin must to wait enougth delay time.
> 
> That doesn't really answer the question?

It's ok to integrate it into the chip init/reset.

> 
> > > > +	 * According to the power up/down sequence of FS210x,
> > > > +	 * the FS210x requests the I2S clock has been present
> > > > +	 * and stable(>= 2ms) before it playing.
> > > > +	 */
> > > > +	if (fs210x->clk_bclk) {
> > > > +		mutex_lock(&fs210x_mutex);
> > > > +		ret = fs210x_dev_play(fs210x);
> > > > +		mutex_unlock(&fs210x_mutex);
> > > > +	} else {
> 
> > > This is definitely not appropriate for mute, it should be in the power
> > > management flow - either set_bias_level() or a DAPM widget.
> 
> > 1. Because the device uses BCLK clock as the clock source,
> >    we need to start the device in the life cycle of the clock,
> >    also we need to start device after the PLL setting(set in dai->hw_params)
> >    so we start the device in here: dai->mute_stream(unmute)
> 
> All the power management happens after hw_params(), this isn't an issue.

We will evaluate the way to reduce the cost time of starting/stoping device:
Do PM by DAPM widget or set_bias_on.

> 
> > 2. If the SOC(s) doesn't have the clock(bclk) for us to configure,
> >    It meams no clock bclk defined in the DTS,
> >    and the clock is activated in dai->trigger start usually,
> >    so we will use a delay work to start the device in here.
> 
> > Any good ideas about satisfying this power up/down sequence?
> 
> There's not great options here, and you're going to loose the start of
> playback especially with devices that don't start clocking until audio
> starts.  You really need the CPU vendors you're working with to
> implement SND_SOC_DAIFMT_CONT or expose their clocks via the clock API
> but not all hardware is able to do this.  I think given how limited your
> hardware is here you really need something in trigger() or some new
> callback that runs later than that, the delayed work you've got there is
> trying to fudge things to run after trigger.
> 

We will start the start_work in dai->trigger if there is no clock bclk
for us to control, and disable fading in/out in firmware to reduce
the time consumption if it is needed(As a backup plan).

> > > > +	if (!(status & FS210X_05H_AMPS_MASK))
> > > > +		dev_err(fs210x->dev, "Amplifier unready\n");
> 
> > > Does this get triggered during the normal start/stop flow?
> 
> > It will get triggered when:
> > 1. BCLK clock is closed before stoping device
> > 2. BCLK clock is opened after starting device
> > We should avoid these power up/down sequence, it may cause pop noise,
> > If they happens, it should be reported and fixed?
> 
> If they don't happen in normal operation it's fine to have them, the
> concern was that this would be triggered during normal operation as part
> of the startup or shutdown sequence.

We can remove the registers dumping, and set the AMPS status to dev_dbg level.

> 
> > > > +	schedule_delayed_work(&fs210x->fault_check_work,
> > > > +			      msecs_to_jiffies(FS210X_FAULT_CHECK_INTERVAL_MS));
> 
> > > Might be good to have this tunable from sysfs.
> 
> > Good idea, or set the interval times by the DTS property.
> > We are considering adding a DTS property:
> > foursemi,monitor-period-ms
> 
> I suspect the DT people won't like that since it's more of a tuning
> thing.

OK, we add a sysfs node for this.

> 
> > > > +static int fs210x_suspend(struct snd_soc_component *cmpnt)
> > > > +{
> > > > +	struct fs210x_priv *fs210x;
> > > > +	int ret;
> > > > +
> > > > +	fs210x = snd_soc_component_get_drvdata(cmpnt);
> > > > +	if (!fs210x || !fs210x->dev)
> > > > +		return -EINVAL;
> 
> > > > +	cancel_delayed_work_sync(&fs210x->start_work);
> > > > +	cancel_delayed_work_sync(&fs210x->fault_check_work);
> 
> > > > +	mutex_lock(&fs210x_mutex);
> 
> > > We don't need to prevent new work being scheduled?
> 
> > Could you please explain more details to help me understand and test this case?
> 
> What if for example playback is starting up at the same time as the
> system enters suspend - the CODEC startup might get run after the
> delayed work is cancelled but before the lock is taken.

Understood, thanks a lot.

We evaluate to remove the resume/suspend(cold start up/down device):
The power consumptions between register settings and pins controlling are very close,
and it can help us to reduce the time consumption.

Best regards,
Nick


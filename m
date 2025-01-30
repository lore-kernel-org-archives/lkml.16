Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C41147483;
	Thu, 30 Jan 2025 13:12:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738242769; cv=none; b=IqccckXHplMN14YvadNrj29rrbLhI09i6FkAVNLBmiSZjX9QTP0ePhf8IHSEl8T+WKYVMxxWmsqwB1ArXN0I3psmPRGtRfbwukblLjvLADQoLOI9of5AaJmfDh08KJbaiQH5BS219esYT50zsJcfmam6iKmd0Ts9JnOO6yMyTpw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738242769; c=relaxed/simple;
	bh=pxk9h7dFK39OlqAfR/Md36k2wE+twrpEngJF4ySdnb0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=oMDQcGF9BdpsigyoCoffawatMCCJsgcRzyVL++BDsKBHHlfezQuUVNJ9/2VQfSKlSEJaCHhvFYs6q25c+AnEh4E81tSx7meIrgYVFWFksppFQJFB20JmRo7PHS2f2zpPwpQiY7qPHrKSwLXsYZQDEr9UmEmh4h2yMnRbAZtebR4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=gow9Ff1h; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="gow9Ff1h"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1738242764;
	bh=pxk9h7dFK39OlqAfR/Md36k2wE+twrpEngJF4ySdnb0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=gow9Ff1hkJeg3hH8d13gx3EItuszok/MRtfYOvE44E6b1PAINEmoQS9RHrP/Vgwuc
	 ozkCnO3u4EuXrSrk+ZTVLdHREO/SG2cWkoTf1Jx6KarmaFjGPpsMoFTsqOAF99gOB5
	 FnCbyiH47SdbXh/d64BEIVBvMOVsKtgNvURS/LVbUlD/IZRpo93100vxl1vUebi+6y
	 xPeGfBKNRviJb23NEBfnhqlBOvWDfxEM8ICM9RwhhVgt3QmCxZnFri9bAUJviBTH+M
	 yxQnKQfcoD+r+kFVQkAfDMNJDmxR+0YFP/stZpJRRiCB7NJp2vtRMyWqQnvwcDyyFd
	 g3z8FSHEfAW2g==
Received: from notapiano (unknown [IPv6:2804:14c:1a9:53ee::1001])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: nfraprado)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id F008717E1067;
	Thu, 30 Jan 2025 14:12:41 +0100 (CET)
Date: Thu, 30 Jan 2025 10:12:39 -0300
From: =?utf-8?B?TsOtY29sYXMgRi4gUi4gQS4=?= Prado <nfraprado@collabora.com>
To: Trevor Wu =?utf-8?B?KOWQs+aWh+iJryk=?= <Trevor.Wu@mediatek.com>
Cc: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>,
	"kernel@collabora.com" <kernel@collabora.com>,
	"linux-sound@vger.kernel.org" <linux-sound@vger.kernel.org>,
	"broonie@kernel.org" <broonie@kernel.org>,
	"tiwai@suse.com" <tiwai@suse.com>,
	"lgirdwood@gmail.com" <lgirdwood@gmail.com>,
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
	"matthias.bgg@gmail.com" <matthias.bgg@gmail.com>,
	"perex@perex.cz" <perex@perex.cz>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Subject: Re: [PATCH] ASoC: mediatek: mt8188: Enable apll1 clock during reg rw
 to prevent hang
Message-ID: <0b45b2c9-d65f-4fc7-a1ce-dbb145899d7b@notapiano>
References: <20241203-mt8188-afe-fix-hang-disabled-apll1-clk-v1-1-07cdd7760834@collabora.com>
 <a10dbdf265194e77a69b6e40afa3df9636b3ab14.camel@mediatek.com>
 <a70a0521-985d-43a4-a1fa-36eb733d5ca9@collabora.com>
 <1d2ee55dde84bcab6f777525042c6789b9f2c1fc.camel@mediatek.com>
 <108d4187-26af-43f6-8b1e-0e48516524a4@notapiano>
 <57cf1810250d922ee01b9eff096c945c5c3a1375.camel@mediatek.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <57cf1810250d922ee01b9eff096c945c5c3a1375.camel@mediatek.com>

On Wed, Dec 11, 2024 at 01:47:32PM +0000, Trevor Wu (吳文良) wrote:
> On Mon, 2024-12-09 at 17:07 -0300, Nícolas F. R. A. Prado wrote:
> > External email : Please do not click links or open attachments until
> > you have verified the sender or the content.
> > 
> > 
> > On Fri, Dec 06, 2024 at 06:57:00AM +0000, Trevor Wu (吳文良) wrote:
> > > On Thu, 2024-12-05 at 13:51 +0100, AngeloGioacchino Del Regno
> > > wrote:
> > > > 
> > > > 
> > > > Il 04/12/24 13:17, Trevor Wu (吳文良) ha scritto:
> > > > > On Tue, 2024-12-03 at 17:07 -0300, Nícolas F. R. A. Prado
> > > > > wrote:
> > > > > 
> > > > > > 
> > > > > > Currently, booting the Genio 700 EVK board with the MT8188
> > > > > > sound
> > > > > > platform driver configured as a module
> > > > > > (CONFIG_SND_SOC_MT8188=m)
> > > > > > results
> > > > > > in a system hang right when the HW registers for the audio
> > > > > > controller
> > > > > > are read:
> > > > > > 
> > > > > >    mt8188-audio 10b10000.audio-controller: No cache defaults,
> > > > > > reading
> > > > > > back from HW
> > > > > > 
> > > > > > The hang doesn't occur with the driver configured as builtin
> > > > > > as
> > > > > > then
> > > > > > the
> > > > > > unused clocks are still enabled.
> > > > > > 
> > > > > > Enable the apll1 clock during register read/write to prevent
> > > > > > the
> > > > > > hang.
> > > > > > 
> > > > > > Signed-off-by: Nícolas F. R. A. Prado <
> > > > > > nfraprado@collabora.com>
> > > > > > ---
> > > > > >   sound/soc/mediatek/mt8188/mt8188-afe-clk.c | 4 ++++
> > > > > >   1 file changed, 4 insertions(+)
> > > > > > 
> > > > > > diff --git a/sound/soc/mediatek/mt8188/mt8188-afe-clk.c
> > > > > > b/sound/soc/mediatek/mt8188/mt8188-afe-clk.c
> > > > > > index
> > > > > > e69c1bb2cb239596dee50b166c20192d5408be10..fb8cf286df3f02ac076
> > > > > > 528b
> > > > > > 898f
> > > > > > d0d7a708ec1ea 100644
> > > > > > --- a/sound/soc/mediatek/mt8188/mt8188-afe-clk.c
> > > > > > +++ b/sound/soc/mediatek/mt8188/mt8188-afe-clk.c
> > > > > > @@ -587,6 +587,8 @@ int mt8188_afe_enable_reg_rw_clk(struct
> > > > > > mtk_base_afe *afe)
> > > > > >          mt8188_afe_enable_clk(afe, afe_priv-
> > > > > > > clk[MT8188_CLK_AUD_A1SYS_HP]);
> > > > > > 
> > > > > >          mt8188_afe_enable_clk(afe, afe_priv-
> > > > > > > clk[MT8188_CLK_AUD_A1SYS]);
> > > > > > 
> > > > > > +       mt8188_afe_enable_clk(afe, afe_priv-
> > > > > > > clk[MT8188_CLK_APMIXED_APLL1]);
> > > > > > 
> > > > > > +
> > > > > >          return 0;
> > > > > >   }
> > > > > 
> > > > > Hi Nicolas,
> > > > > 
> > > > > If I understand correctly, APLL1 should be the parent clock of
> > > > > AUD_A1SYS_HP and AUD_A1SYS, so it should be enabled
> > > > > automatically
> > > > > by
> > > > > CCF.
> > > > > 
> > > > > I'm not sure why you resolved the hang issue after enabling
> > > > > APLL1.
> > > > > Could you share more details about the solution?
> > > > > 
> > > > 
> > > > Hmm. Now I see what's happening here...
> > > > 
> > > > Nicolas, Trevor,
> > > > 
> > > > Possible parents for top_a1sys_hp are:
> > > >   - clk26m
> > > >   - apll1_d4
> > > > 
> > > > ...what's happening here most probably is that after the clock
> > > > gets
> > > > disabled as
> > > > unused, it gets parented to clk26m by default as that is parent
> > > > index
> > > > 0... and
> > > > something else in AFE needs APLL1 to feed a clock to .. something
> > > > ..
> > > > to allow
> > > > register access.
> > > > 
> > > > Trevor, do you know why is this IP unaccessible when A1SYS is
> > > > parented to clk26m?
> > > 
> > > Hi Angelo,
> > > 
> > > As far as I know, it should work even though the clock is parented
> > > to
> > > clk26m.
> > > 
> > > Unfortunately, I have no idea about why APLL1 enabling can resolve
> > > the
> > > hang issue. I'm also curious about how Nicolas found the solution
> > > to
> > > resolve the problem.
> > > 
> > > From the description, it seems that the problem is related to
> > > register
> > > r/w hang. If I remembered correctly, when the mtcmos of ADSP_INFRA
> > > is
> > > ON, register r/w won't cause the cpu to hang. However, ADSP_INFRA
> > > has
> > > been configured as ALWAYS_ON in the driver. I'm not sure if it
> > > doesn't
> > > work correctly when the driver is configured as a module. Maybe
> > > Nicolas
> > > can also check this.
> > 
> > Indeed, as suggested by Angelo, adding
> > 
> >   assigned-clocks = <&topckgen CLK_TOP_A1SYS_HP>;
> >   assigned-clock-parents = <&topckgen CLK_TOP_APLL1_D4>;
> > 
> > to the afe node also fixes this issue.
> > 
> > In mt8188.dtsi, we currently have
> > 
> >   afe: audio-controller@10b10000 {
> >         ...
> >         assigned-clocks = <&topckgen CLK_TOP_A1SYS_HP>;
> >         assigned-clock-parents =  <&clk26m>;
> > 
> > So the question is, do other MT8188 platforms need clk26m to be the
> > parent of
> > a1sys_hp? Depending on that I can either update the parent on the
> > common
> > mt8188.dtsi or on the genio700-evk.dts, which is where I observed the
> > issue. I
> > don't have access to other mt8188 platforms. Trevor, do you know?
> 
> 
> If I remember correctly, the reason for assigning 26m as the parent of
> a1sys_hp is to save power[1], as APLL is not necessary in all cases.
> 
> [1] 
> https://lore.kernel.org/r/20230510035526.18137-5-trevor.wu@mediatek.com

Hi,

Following the suggestions, I have enabled the debug logs in 
mt8188-afe-clk.c, though that didn't reveal anything (the logs are only printed
in case of errors, so there are none). I also verified that forcing the
ADSP_INFRA power domain to be powered on during boot (and before these register
reads occur) doesn't change anything (this domain is marked as ALWAYS_ON, so
normally assumed to already be on and not touched).

I've also narrowed the issue further. The hang happens in

mt8188_afe_pcm_dev_probe()
  devm_regmap_init_mmio()
    regcache_hw_init()

specifically in the "fill the reg_defaults" loop.

What's more, it doesn't happen for every register, but rather a few specific
ones.

The following register reads caused the hang:
0x280
0x410 (AFE_GAIN1_CON0)
0x830 (AFE_CONN0_5)

The following ranges were read without a problem:
0x0   (AUDIO_TOP_CON0)     ... 0x27c
0x380 (AFE_SPDIF_OUT_CON0) ... 0x40c
0x550 (SPDIFIN_FREQ_INFO)  ... 0x82c

And again, if I enable the apll1 clock in mt8188_afe_enable_reg_rw_clk(), as
done in this patch, or parent a1sys_hp to apll1_d4 in the AFE DT node, then
those registers are read without any hangs.

So it seems that certain registers require the apll1 clock to be enabled
in order to be read, while others don't. Trevor, is the dependency between those
specific registers and the apll1 clock documented anywhere?

Unless there's a better solution, I think we should go forward with either
this patch or the DT clock parenting suggested by Angelo, as the power savings
come second to the machine actually being bootable.

Thanks,
Nícolas

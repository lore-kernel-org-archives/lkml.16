Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [185.203.201.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9BB2D22DFB8
	for <linux-kernel@vger.kernel.org>; Thu,  6 Feb 2025 13:19:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.203.201.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738847986; cv=none; b=bEqAsPR4NoPCP03xIBGZl5zcx/Oa1xNAfCey5uc/rsTcm2+/zpmC90IEquV+laZCHT2oh1ltAtgOhtuQN1qU1chz8bFtYHFjHGrKSfVk2K1FbidWi9/zeTIeWWlBB6L77Ab+InBj4es26Na/jKtqoYyLIXE2CVy2P1AgFDTBTDU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738847986; c=relaxed/simple;
	bh=DjXsARkHgHoafb2RZ0OVXNpdAADdXCF9fIVEpvnRI/A=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=uq8CUJ9tigE2JqbWWGy6LdkgUgCADqCD2v++Y9OALdnHEDqUu48H3XuTbteuqbAY7EIep8IMduMEidA+preYCIL6uYZzwSDGJuv7wveV3Gf0jaDgWPf1OZKTjJhxldX+UYeM9FVaS1qnuCUv09ySP2pjocSchpQDWdDqEJYpzhE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de; spf=pass smtp.mailfrom=pengutronix.de; arc=none smtp.client-ip=185.203.201.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pengutronix.de
Received: from ptz.office.stw.pengutronix.de ([2a0a:edc0:0:900:1d::77] helo=ratatoskr.pengutronix.de)
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <s.trumtrar@pengutronix.de>)
	id 1tg1n6-00010G-ES; Thu, 06 Feb 2025 14:19:36 +0100
From: Steffen Trumtrar <s.trumtrar@pengutronix.de>
To: "Rob Herring (Arm)" <robh@kernel.org>
Cc: netdev@vger.kernel.org,  Krzysztof Kozlowski <krzk+dt@kernel.org>,
  Conor Dooley <conor+dt@kernel.org>,  "David S. Miller"
 <davem@davemloft.net>,  Dinh Nguyen <dinguyen@kernel.org>,
  kernel@pengutronix.de,  linux-kernel@vger.kernel.org,  Paolo Abeni
 <pabeni@redhat.com>,  Jakub Kicinski <kuba@kernel.org>,  Eric Dumazet
 <edumazet@google.com>,  devicetree@vger.kernel.org,  Andrew Lunn
 <andrew+netdev@lunn.ch>
Subject: Re: [PATCH v4 2/6] dt-bindings: net: dwmac: Convert socfpga dwmac
 to DT schema
In-Reply-To: <173877418502.1694868.7734639778320336620.robh@kernel.org> (Rob
	Herring's message of "Wed, 05 Feb 2025 10:49:45 -0600")
References: <20250205-v6-12-topic-socfpga-agilex5-v4-0-ebf070e2075f@pengutronix.de>
	<20250205-v6-12-topic-socfpga-agilex5-v4-2-ebf070e2075f@pengutronix.de>
	<173877418502.1694868.7734639778320336620.robh@kernel.org>
User-Agent: mu4e 1.12.8; emacs 30.0.93
Date: Thu, 06 Feb 2025 14:19:33 +0100
Message-ID: <87ikpn43dm.fsf@pengutronix.de>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; format=flowed
X-SA-Exim-Connect-IP: 2a0a:edc0:0:900:1d::77
X-SA-Exim-Mail-From: s.trumtrar@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-kernel@vger.kernel.org


Hi,

On 2025-02-05 at 10:49 -06, "Rob Herring (Arm)" <robh@kernel.org> wrote:

> On Wed, 05 Feb 2025 16:32:23 +0100, Steffen Trumtrar wrote:
> > Changes to the binding while converting:
> > - add "snps,dwmac-3.7{0,2,4}a". They are used, but undocumented.
> > - altr,f2h_ptp_ref_clk is not a required property but optional.
> >
> > Signed-off-by: Steffen Trumtrar <s.trumtrar@pengutronix.de>
> > ---
> >  .../bindings/net/pcs/altr,gmii-to-sgmii.yaml       |  47 ++++++++++
> >  .../devicetree/bindings/net/socfpga-dwmac.txt      |  57 ------------
> >  .../devicetree/bindings/net/socfpga-dwmac.yaml     | 102 +++++++++++++++++++++
> >  3 files changed, 149 insertions(+), 57 deletions(-)
> >
>
> My bot found errors running 'make dt_binding_check' on your patch:
>
> yamllint warnings/errors:
>
> dtschema/dtc warnings/errors:
> /builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/net/pcs/altr,gmii-to-sgmii.example.dtb:
> phy@100000240: reg: [[1, 576], [8, 1], [512, 64]] is too short
> 	from schema $id: http://devicetree.org/schemas/pcs/altr,gmii-to-sgmii.yaml#
> /builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/net/pcs/altr,gmii-to-sgmii.example.dtb:
> phy@100000240: 'clock-names', 'clocks' do not match any of the regexes:
> 'pinctrl-[0-9]+'
> 	from schema $id: http://devicetree.org/schemas/pcs/altr,gmii-to-sgmii.yaml#
>
> doc reference errors (make refcheckdocs):
>
> See https://patchwork.ozlabs.org/project/devicetree-bindings/patch/20250205-v6-12-topic-socfpga-agilex5-v4-2-ebf070e2075f@pengutronix.de
>
> The base for the series is generally the latest rc1. A different dependency
> should be noted in *this* patch.
>
> If you already ran 'make dt_binding_check' and didn't see the above
> error(s), then make sure 'yamllint' is installed and dt-schema is up to
> date:
>
> pip3 install dtschema --upgrade
>
> Please check and re-submit after running the above command yourself. Note
> that DT_SCHEMA_FILES can be set to your schema file to speed up checking
> your schema. However, it must be unset to test all examples with your schema.

'pipx upgrade dtschema' says I have version 2025.2, but I still don't get theses errors.

    make O=build dt_binding_check DT_SCHEMA_FILES=Documentation/devicetree/bindings/net/pcs/altr,gmii-to-sgmii.yaml
    make[1]: Entering directory '(...)'
      CHKDT   (...)/Documentation/devicetree/bindings
      LINT    (...)/Documentation/devicetree/bindings
      DTC [C] Documentation/devicetree/bindings/net/pcs/altr,gmii-to-sgmii.example.dtb

Anything I'm missing or doing wrong?


Best regards,
Steffen

--
Pengutronix e.K.                | Dipl.-Inform. Steffen Trumtrar |
Steuerwalder Str. 21            | https://www.pengutronix.de/    |
31137 Hildesheim, Germany       | Phone: +49-5121-206917-0       |
Amtsgericht Hildesheim, HRA 2686| Fax:   +49-5121-206917-5555    |

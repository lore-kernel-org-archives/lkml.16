Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EAC6418EB0;
	Tue,  6 May 2025 21:21:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746566467; cv=none; b=aiY+MEGdyxVKsYN2/K8LIKAClvnNWw3no1m8n8brnTcOdud4QjdCaVK+YTR8BPrYbBGa/lLqI18h391JbVXpLvm6Rc3V7AMMd2Cv/ex3sw7kXVUzNOkJMET55XlG338V4TpclVVEFpVpMGuaJYXHTAZh2wQBiWOXlupVIPlQbSQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746566467; c=relaxed/simple;
	bh=nRmEletgct8wCAY0yyDfqxigpW3/eAknwmWs08z/9vY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Cw8fdsNF04BHmb9mbra2BJFsd42aLuPB5LV5pq4pV6tqzBwLnvIhqvTDTRk1xJEHwvvJP9mdFLsywvwG7bfL7fZF312UGCk/pJg+rNpPGWXrWwx4GbSddWJ3c9qt3e7RfQhj/Dzcp/FQ2yCxMz0etQxFBXMCldXDAVG8CttlfCM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=esWHlVLH; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="esWHlVLH"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1746566462;
	bh=nRmEletgct8wCAY0yyDfqxigpW3/eAknwmWs08z/9vY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=esWHlVLHL9leIpq2KcTz8MaRK6525bDP08Y42Zh6PCU/0D/boTaD/x1Kb4DHKwY4s
	 b2rYavwLaS2DWbXNHew6/grbZLIcxqlW5+qtPk+zMYzBcIP3VEvANap1pIZ3cvTCYQ
	 j7/kghbAmwFR/oh/pARzjS97PxSCxYzxb06LhpW3NHz4vEMO7VmLMutaisftBNHv+j
	 2VLa0+qxyeRbM2hs/lGfZX8C0jeuvgfxgg4fFt0EH6Y1Gc/gu6MBCRorQDGuD6/D/T
	 9dSnubimRDvBAPdh7x5SiXyLn7OrMHlzsM0rYaSho7gJE7dIOUu+mC4Cuhow2k9U2B
	 H/Jb4J/ebLL7g==
Received: from notapiano (unknown [70.107.117.78])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: nfraprado)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id BFAAD17E0FBA;
	Tue,  6 May 2025 23:21:00 +0200 (CEST)
Date: Tue, 6 May 2025 17:20:58 -0400
From: =?utf-8?B?TsOtY29sYXMgRi4gUi4gQS4=?= Prado <nfraprado@collabora.com>
To: Alexandre Mergnat <amergnat@baylibre.com>
Cc: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	kernel@collabora.com, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	Fabien Parent <fparent@baylibre.com>,
	Conor Dooley <conor+dt@kernel.org>
Subject: Re: [PATCH] arm64: dts: mediatek: mt6357: Drop regulator-fixed
 compatibles
Message-ID: <1e8b80c9-d491-4b71-b424-e2322c711fd3@notapiano>
References: <20250502-mt6357-regulator-fixed-compatibles-removal-v1-1-a582c16743fe@collabora.com>
 <174652097090.119919.16240846809714782858.b4-ty@collabora.com>
 <99febf26-2ada-4fed-b4b3-596ac4abf581@baylibre.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <99febf26-2ada-4fed-b4b3-596ac4abf581@baylibre.com>

On Tue, May 06, 2025 at 11:30:08AM +0200, Alexandre Mergnat wrote:
> Hello Nícolas and Angelo,
> 
> On 06/05/2025 10:42, AngeloGioacchino Del Regno wrote:
> > On Fri, 02 May 2025 11:32:10 -0400, Nícolas F. R. A. Prado wrote:
> > > Some of the regulators in the MT6357 PMIC dtsi have compatible set to
> > > regulator-fixed, even though they don't serve any purpose: all those
> > > regulators are handled as a whole by the mt6357-regulator driver. In
> > > fact this is the only dtsi in this family of chips where this is the
> > > case: mt6359 and mt6358 don't have any such compatibles.
> > > 
> > > A side-effect caused by this is that the DT kselftest, which is supposed
> > > to identify nodes with compatibles that can be probed, but haven't,
> > > shows these nodes as failures.
> > > 
> > > [...]
> > 
> > Applied to v6.15-next/dts64, thanks!
> > 
> > [1/1] arm64: dts: mediatek: mt6357: Drop regulator-fixed compatibles
> >        commit: d77e89b7b03fb945b4353f2dcc4a70b34baa7bcb
> 
> I'm surprised that patch is applied after the Rob's bot reply.
> Also, I've some concern:
> 
> On 02/05/2025 17:32, Nícolas F. R. A. Prado wrote:
> > Some of the regulators in the MT6357 PMIC dtsi have compatible set to
> > regulator-fixed, even though they don't serve any purpose: all those
> > regulators are handled as a whole by the mt6357-regulator driver. In
> > fact this is the only dtsi in this family of chips where this is the
> > case: mt6359 and mt6358 don't have any such compatibles.
> This is the only dtsi in this family to do this, yes. But according to
> all other vendor DTSI, which use regulator-fixed when a regulator can't
> support a range of voltage, IMHO, it make sense to use it, isn't it ?
> If other DTSI from the family of chips doesn't, why don't fix them to be
> aligned with the other families?

Well, but this isn't just like any other regulator-fixed in a DTSI. In this case
it is part of a multi-function device (MFD) and so it gets probed by a parent
node. That's the source of the issue, because then no driver gets assigned to
the node itself.

> 
> >
> > A side-effect caused by this is that the DT kselftest, which is supposed
> > to identify nodes with compatibles that can be probed, but haven't,
> > shows these nodes as failures.
> >
> I lack of data about kselftest, but according to what is reported here, it
> appear to me this is something which could be fixed in the test itself. It make
> sense for a DTS, but not for a DTSI because it expose HW capability of a
> device, not the board, so it isn't mandatory to probe all DTSI node.
> Again, I'm not an expert, the test shouldn't show the DTSI node as failure,
> but maybe more a warning.

The DT kselftest is a run-time test, so it wouldn't be able to distinguish
between DTSI and DTS. But in any case, we do want to check that devices from
DTSIs have probed, a lot of the devices come from them. When a particular board
doesn't actually have a node from a DTSI present then the node should be
disabled, and in that case the kselftest ignores the node.

It would be possible to ignore this particular compatible, "regulator-fixed", in
the kselftest, if it is a compatible that can't be expected to be probed. Of
course that would mean that all the other regulator nodes that aren't MFD
children and do get probed by that driver would no longer be checked by the
test.

> 
> > Remove the useless compatibles to move the dtsi in line with the others
> > in its family and fix the DT kselftest failures.
> If you remove compatible from these regulators, I think mediatek,mt6357-regulator.yaml
> documentation file should be modified to be consistent and avoid dt-check error.

Ah, yes, totally agreed, I seem to have missed running dtbs_check on this patch,
sorry. Indeed now either the binding needs to be fixed or the patch reverted.

I believe the most reasonable option would be to update those regulators in the
binding to reference the generic regulator binding, ie:

diff --git a/Documentation/devicetree/bindings/regulator/mediatek,mt6357-regulator.yaml b/Documentation/devicetree/bindings/regulator/mediatek,mt6357-regulator.yaml
index 6327bb2f6ee0..9308008f420e 100644
--- a/Documentation/devicetree/bindings/regulator/mediatek,mt6357-regulator.yaml
+++ b/Documentation/devicetree/bindings/regulator/mediatek,mt6357-regulator.yaml
@@ -33,7 +33,7 @@ patternProperties:

   "^ldo-v(camio18|aud28|aux18|io18|io28|rf12|rf18|cn18|cn28|fe28)$":
     type: object
-    $ref: fixed-regulator.yaml#
+    $ref: regulator.yaml#
     unevaluatedProperties: false
     description:
       Properties for single fixed LDO regulator.

as well as updating the examples in the YAML. The fixed-regulator.yaml binding
doesn't seem to provide any additional checks compared to regulator.yaml,
besides enforcing the regulator-fixed compatible, which in this case doesn't
serve any purpose.

Thoughts?

Thanks,
Nícolas

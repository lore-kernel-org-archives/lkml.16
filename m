Received: from mx1.tq-group.com (mx1.tq-group.com [93.104.207.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AFE7A25DAEF;
	Wed,  9 Apr 2025 10:59:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=93.104.207.81
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744196403; cv=none; b=Txdct5XfeWC6ePpo0wLGOAioy1XJTCgr9KLYzK4gCJEVBSqEgvGf853yeUCBYHUNC/1y0UfzHR9GmxzRlPz/AucfbQw3iDC2XXvgXLpgfRB2x0CfhS40+0DE0mQuh2jcECpG9IGtFxlm0d0hd/3MO/QQskT6oOvR7Kbi10y36aw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744196403; c=relaxed/simple;
	bh=TfB1w3nVESPRx1uoE2Mc5Ze55+L0OBKpgUXDoSKfnCE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=b4WrV+3MnmcZ1FsdLNbgBhvuAaPfqVFfYTY8kIwQWNmuWK6nFxP2aeUXtt8eeWZf0WZcPEMAS1vIr4WBXRnE1HUtvZAKKg+pEPWlt32CCUdu5wHCGYJRtz3O+KLda1+Sge2gRKKNomZEsi00EOe5CVZXRgNxdigPiO03MuLipIg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ew.tq-group.com; spf=pass smtp.mailfrom=ew.tq-group.com; dkim=pass (2048-bit key) header.d=tq-group.com header.i=@tq-group.com header.b=RIb4T0jX; dkim=fail (0-bit key) header.d=ew.tq-group.com header.i=@ew.tq-group.com header.b=c6yWtWu5 reason="key not found in DNS"; arc=none smtp.client-ip=93.104.207.81
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ew.tq-group.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ew.tq-group.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tq-group.com header.i=@tq-group.com header.b="RIb4T0jX";
	dkim=fail reason="key not found in DNS" (0-bit key) header.d=ew.tq-group.com header.i=@ew.tq-group.com header.b="c6yWtWu5"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
  t=1744196399; x=1775732399;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=Kn75fkqPv9i2aiN1xOdOZGSnE5xqACnS+FveSU5qwDo=;
  b=RIb4T0jX2jIy1weYafwVy2t14ihbWZ1UxIGZ647ecTgJqFs4pBKGaVUM
   V6NYU7weNgD0DBEapQsBgcNEeZIoHWfvYENFY8znnGSYNcbUvY3rKXQRx
   x6Syj17GH24c43FzXu7DEW4N8M2rNVadMDu2D4J5vfQFnWCc/5NSCVaAS
   Ut5UXJMLM6+5MUkzHeZ0LyPv8HkuZP00P5OEwhJZuS4GKz9OiCDCX1cIF
   0mnFWE2PffT8Q/Ry5IY4lozDopUeF3lDY/2HhB9xj43jQy5VWpiABj1/9
   3OjK2pR5v6ajm50M8lb111b0gkHcTSOLqYlGKpEITTVeHxkTA1d5P0wOG
   Q==;
X-CSE-ConnectionGUID: FaxeuNCfQkWKH7AtI6ab7g==
X-CSE-MsgGUID: 5VwsxvJMQVCKcn0dBh+4hA==
X-IronPort-AV: E=Sophos;i="6.15,200,1739833200"; 
   d="scan'208";a="43426690"
Received: from vmailcow01.tq-net.de ([10.150.86.48])
  by mx1.tq-group.com with ESMTP; 09 Apr 2025 12:59:56 +0200
X-CheckPoint: {67F6532B-59-7141A0B0-E6EDEC14}
X-MAIL-CPID: C309E74E949F8B32217D51A50BFA7CA5_3
X-Control-Analysis: str=0001.0A006371.67F65329.000F,ss=1,re=0.000,recu=0.000,reip=0.000,cl=1,cld=1,fgs=0
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id B4609165763;
	Wed,  9 Apr 2025 12:59:50 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ew.tq-group.com;
	s=dkim; t=1744196391;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Kn75fkqPv9i2aiN1xOdOZGSnE5xqACnS+FveSU5qwDo=;
	b=c6yWtWu5ldp40FtgZLvlKrLPY8tZFdZikCLZSAcQjmnId/U1Z42jqJJzy/rq+jP4UqS4Hf
	SLkiGUErbtWr5TQ6KSRVKwv6NjWsBOAx4GrxWkl+HOBqBEk6iYFgIMKQbuzrnhUN44zOqe
	2P4t+3fKlVkeuur7IWfG8M6AjMTT3Ui0rFqoUU6gveNIhFl7l1N0wely8wPDYYE3OrtLVG
	2mrthxPtuqoAv5GNLJwvrjVcFNJiq9dVMVdEZhu5XEfvRDmsXnLig9ktLHjeUh4U/rOyQt
	6x8jvhu+Jsu9eBSbzO0eHVsHZYL+MkisR4MZEBnVRHtvGcE4CQ2Ley5EF7aIbg==
From: Alexander Stein <alexander.stein@ew.tq-group.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
 Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>, Peng Fan <peng.fan@nxp.com>
Cc: devicetree@vger.kernel.org, imx@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject:
 Re: [PATCH v2 1/1] dt-bindings: firmware: imx95-scmi: Allow linux,code for
 protocol@81
Date: Wed, 09 Apr 2025 12:59:50 +0200
Message-ID: <2003940.PYKUYFuaPT@steina-w>
Organization: TQ-Systems GmbH
In-Reply-To: <20241104085622.177781-1-alexander.stein@ew.tq-group.com>
References: <20241104085622.177781-1-alexander.stein@ew.tq-group.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="iso-8859-1"
X-Last-TLS-Session-Version: TLSv1.3

Hi,

Am Montag, 4. November 2024, 09:56:21 CEST schrieb Alexander Stein:
> BBM protocol supports a single power button, supported by driver
> imx-sm-bbm-key.c. By default this is KEY_POWER, but can also be overwritt=
en
> using linux,code. Add a reference to this schema and add linux,code as a
> supported property.
>=20
> Signed-off-by: Alexander Stein <alexander.stein@ew.tq-group.com>

Is there any other feedback or things to do here?

Thanks
Alexander

> ---
> Changes in v2:
> * Added default value
>=20
>  .../devicetree/bindings/firmware/nxp,imx95-scmi.yaml   | 10 ++++++++--
>  1 file changed, 8 insertions(+), 2 deletions(-)
>=20
> diff --git a/Documentation/devicetree/bindings/firmware/nxp,imx95-scmi.ya=
ml b/Documentation/devicetree/bindings/firmware/nxp,imx95-scmi.yaml
> index 1a95010a546b1..c1b7140ee0098 100644
> --- a/Documentation/devicetree/bindings/firmware/nxp,imx95-scmi.yaml
> +++ b/Documentation/devicetree/bindings/firmware/nxp,imx95-scmi.yaml
> @@ -12,13 +12,19 @@ maintainers:
> =20
>  properties:
>    protocol@81:
> -    $ref: '/schemas/firmware/arm,scmi.yaml#/$defs/protocol-node'
> -    unevaluatedProperties: false
> +    type: object
> +    allOf:
> +      - $ref: '/schemas/firmware/arm,scmi.yaml#/$defs/protocol-node'
> +      - $ref: /schemas/input/input.yaml#
> +    additionalProperties: false
> =20
>      properties:
>        reg:
>          const: 0x81
> =20
> +      linux,code:
> +        default: 116  # KEY_POWER
> +
>    protocol@84:
>      $ref: '/schemas/firmware/arm,scmi.yaml#/$defs/protocol-node'
>      unevaluatedProperties: false
>=20


=2D-=20
TQ-Systems GmbH | M=FChlstra=DFe 2, Gut Delling | 82229 Seefeld, Germany
Amtsgericht M=FCnchen, HRB 105018
Gesch=E4ftsf=FChrer: Detlef Schneider, R=FCdiger Stahl, Stefan Schneider
http://www.tq-group.com/



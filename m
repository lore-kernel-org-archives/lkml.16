Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F164946BF;
	Mon, 31 Mar 2025 08:16:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743408963; cv=none; b=qxNVm+SYqR8F1Uem5yKjDD04vNAbDiicEYld0qRWfznWwWXaPuIAQQdkZm2LMLGTMqSN0rI6ve0DTvzRNq7qK9yqKDXejRx3T3ahVliIs7wuNLRKKbQ/NcXkg+Fs62uan8WAwTo/hS+9liORpyvJxh9Ww5noxsX/r8UvxMiUkA4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743408963; c=relaxed/simple;
	bh=n/AGtLCTuyDKU9z411GAmNJ6h/6MCP/tI1vTxsGxQ4Q=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Rjn646xeOtLd0pVajLy14bDynMSoOx2L9qVxyZSpRRYYVn0ur4t+9yxu9plCumoXlMdEXAFgBMo4xTSZdoUWVt6VrXtaYuYZIFeOsmoLhKMlJKy7eiKvX+TJmHm5b73KeekITJeaevfj8UPsuOTHPtHekJDCgjjy8Iq6RusESB4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=oc0sePzh; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="oc0sePzh"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 89A3CC4CEE3;
	Mon, 31 Mar 2025 08:16:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1743408962;
	bh=n/AGtLCTuyDKU9z411GAmNJ6h/6MCP/tI1vTxsGxQ4Q=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=oc0sePzhrGWkcxjuc4eQOHW6D1HRc4Em/XqacKGhSIXT4Cy2upsgVNfGakKfvcMRt
	 KKYDYowkxiAoQb+R1IJOOE5UcKfO9CMJWVsWKwUGwa1niJXmD+kKUir9RXAVyOIqyd
	 1RDxi4qUepfn9yUL+86ly1Eajqev/fW3aXIUWNirnLS/6ArdrlzSOG3h++aK/4ihCw
	 kj4yY+XcUNQy4eYjqxkBi6gUrdHG/K/wRvvAVu+1ZlYa5xDBDFwxlPOyzGwklQ8I4e
	 IraZFDeidJIc+ixalrvCaAsz6NfyJdcIdqCDuMPvGKFox0YYT49f/BRwAaZyq11N3p
	 ukQLNMkvFawng==
Date: Mon, 31 Mar 2025 10:15:58 +0200
From: "krzk@kernel.org" <krzk@kernel.org>
To: Yannic Moog <Y.Moog@phytec.de>
Cc: "kernel@pengutronix.de" <kernel@pengutronix.de>, 
	"s.hauer@pengutronix.de" <s.hauer@pengutronix.de>, "festevam@gmail.com" <festevam@gmail.com>, 
	"robh@kernel.org" <robh@kernel.org>, "shawnguo@kernel.org" <shawnguo@kernel.org>, 
	"krzk+dt@kernel.org" <krzk+dt@kernel.org>, "conor+dt@kernel.org" <conor+dt@kernel.org>, 
	Benjamin Hahn <B.Hahn@phytec.de>, Yashwanth Varakala <Y.Varakala@phytec.de>, 
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "upstream@lists.phytec.de" <upstream@lists.phytec.de>, 
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, 
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "imx@lists.linux.dev" <imx@lists.linux.dev>, 
	Jan Remmet <J.Remmet@phytec.de>, Teresa Remmet <T.Remmet@phytec.de>
Subject: Re: [PATCH 1/3] dt-bindings: add imx8mp-libra-rdk-fpsc
Message-ID: <20250331-zippy-apricot-seriema-cbafe8@krzk-bin>
References: <20250328-wip-y-moog-phytec-de-imx8mp-phycore-fpsc-v1-0-28324c7f81fa@phytec.de>
 <20250328-wip-y-moog-phytec-de-imx8mp-phycore-fpsc-v1-1-28324c7f81fa@phytec.de>
 <9a8635d8-631e-483f-9d31-33cf0bea7daf@kernel.org>
 <4610469e0002796fb0de9feabd3fe328d5bf7aa9.camel@phytec.de>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <4610469e0002796fb0de9feabd3fe328d5bf7aa9.camel@phytec.de>

On Mon, Mar 31, 2025 at 06:03:05AM +0000, Yannic Moog wrote:
> > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 - description: PHYTEC phyCORE-i.MX8MP=
 FPSC based boards
> > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 items:
> > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 - enum:
> > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 - phytec,imx8mp-libra-rdk-fpsc=C2=A0 # i.MX 8M Plus Libra RDK
> > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 - const: phyt=
ec,imx8mp-phycore-fpsc # phyCORE-i.MX 8M Plus FPSC
> >=20
> > And that's different than existing phycore som? You have entire commit
> > msg to explain that.
>=20
> Yes, it is different to the existing phycore som.
> I explained the differences in the second patch which introduces the devi=
ce trees.
> Would you like me to also add the explanation to this patch, or move it h=
ere from the second patch?

Some explanation should be here.


Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof


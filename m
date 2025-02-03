Received: from out-185.mta0.migadu.com (out-185.mta0.migadu.com [91.218.175.185])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8F0BC3A8CB
	for <linux-kernel@vger.kernel.org>; Mon,  3 Feb 2025 17:49:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.185
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738604943; cv=none; b=RKjYbLT1WfafLh/+hOaAcuFjqZN6bYIerWzscvYdJuZ64KwgwhO1uAk4j1kSd3ImTLXGvJr+mo01eal/sVU4J8yZU27shAKKk9nmHL+90pp0iPuf0CiZJYdHqgSLldT8wtmxVK6obikNa25fWNvWpq1m076JUSVmblkfHcsFrf4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738604943; c=relaxed/simple;
	bh=P7qsgwAoBh5F5PSnZbuhjlaHSVDOEQdeNekKrcCa3rE=;
	h=Mime-Version:Content-Type:Date:Message-Id:Subject:From:Cc:To:
	 References:In-Reply-To; b=E/5iGyd7OZvO+nOQEU9DevH68epb0vdDvPIJQy2f+wUabItIz3ujzmgu9VRZ7iCUn9f7MZUGKqHFihW1y3RmvQx/8/tW9YbYakUQWj1SPbaueEX8wSwkTTPXhBpPiW7vTv69JLScT98Lwdr9NeE75XQfz8a2BevdeSrExjwk8bE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=postmarketos.org; spf=pass smtp.mailfrom=postmarketos.org; dkim=pass (2048-bit key) header.d=postmarketos.org header.i=@postmarketos.org header.b=Dl4Nh2+x; arc=none smtp.client-ip=91.218.175.185
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=postmarketos.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=postmarketos.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=postmarketos.org header.i=@postmarketos.org header.b="Dl4Nh2+x"
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=postmarketos.org;
	s=key1; t=1738604936;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=wAX7PNJtWVKYZDJ8A6Vtwdu0ZwlwN4Kc8QcVWARzBUk=;
	b=Dl4Nh2+xLRGqNzL1rYOZED8vMwiHr3x2pPvpB52PjVCFvthQUL2ZFzLnRp5fN//2W2d2u7
	U2ipKgQH0DL8xQ2vG5oWTH+F48OzGdbA12TG2ESWG1QJuPqi/qHB6iWNKnIlvLtDcR8elo
	EDS39mOHTj3E13IaEDFJP1OaV8HjHghPYTEDVIc+0rX1pQEfBdFL2e/Gqn7ESeQYkO5QVI
	v3sFQOAuz/T1+tOqKeowoRDk/aXO6TxtaEWSkLkjf/gUqAroOxkY2/R1gjt4K3zVDuSQ7t
	bNFwL/xoYZPYTpPAFQPjjV6juO2nhN0H1u1b8Ads7t7qNMkTw0H8TcGsAnqnxA==
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 03 Feb 2025 17:48:08 +0000
Message-Id: <D7IZZVD446TD.EPLWERDL77DJ@postmarketos.org>
Subject: Re: [PATCH v3 2/2] arm64: dts: amlogic: add support for
 xiaomi-aquaman/Mi TV Stick
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: "Ferass El Hafidi" <funderscore@postmarketos.org>
Cc: <linux-arm-kernel@lists.infradead.org>, <devicetree@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, <~postmarketos/upstreaming@lists.sr.ht>,
 "Artur Weber" <aweber.kernel@gmail.com>, "Karl Chan"
 <exxxxkc@getgoogleoff.me>, "Christian Hewitt" <christianshewitt@gmail.com>
To: "Ferass El Hafidi" <funderscore@postmarketos.org>, "Neil Armstrong"
 <neil.armstrong@linaro.org>, "Kevin Hilman" <khilman@baylibre.com>, "Jerome
 Brunet" <jbrunet@baylibre.com>, "Martin Blumenstingl"
 <martin.blumenstingl@googlemail.com>, "Rob Herring" <robh@kernel.org>,
 "Krzysztof Kozlowski" <krzk+dt@kernel.org>, "Conor Dooley"
 <conor+dt@kernel.org>, <linux-amlogic@lists.infradead.org>
References: <20250203091453.15751-1-funderscore@postmarketos.org>
 <20250203091453.15751-3-funderscore@postmarketos.org>
In-Reply-To: <20250203091453.15751-3-funderscore@postmarketos.org>
X-Migadu-Flow: FLOW_OUT

On Mon Feb 3, 2025 at 9:14 AM UTC, Ferass El Hafidi wrote:
<...>
> +&uart_AO {
> +	status =3D "okay";
> +	pinctrl-0 =3D <&uart_ao_a_pins>;
> +	pinctrl-names =3D "default";
> +};
> +
> +&usb {
> +	status =3D "okay";
> +	dr_mode =3D "otg";
> +};
> +
> +&usb2_phy0 {
> +	vbus-supply =3D <&vcc_5v>;
> +};

I just noticed a typo.  This part should've been:

	&usb {
		status =3D "okay";
		dr_mode =3D "otg";
		vbus-supply =3D <&vcc_5v>;
	}

Sent a v4 to fix it:
https://lore.kernel.org/linux-amlogic/20250203174346.13737-1-funderscore@po=
stmarketos.org/

Cheers.

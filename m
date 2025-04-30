Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF9281D61BB;
	Wed, 30 Apr 2025 07:37:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745998638; cv=none; b=H5fnXDU1t/OgpXfxI7MlFRA2qb8oRES/aiyI1LxQEFmCBg0RFdybm+EeAja9LaO4z/6odNDu6qPyMSE0ejpTBQej0xxrbb4Ae5xFWCgHa+k6qre1Ghu+x7j2DLyt2DDSd+hSDlBK49iOR1z8Z1/B7Eq3n3Tyl0f4fCUazqnH3wY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745998638; c=relaxed/simple;
	bh=D5BW2gpx6wpLJIoZXvp/LiKyekPZG4Ijf80HhWU5hJo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=E0kaB/t0FUPWwUFEnuKi5nGsDPohiMx50frJbzhDlbhSTwtZZR2PlJG4FQ59jrzMQ7Av9iyXBBBr1xNDjoXTMRhh4dcl42XTlBHKcz+8sFf9YQArNJ/HGoqrXDa3VauowGTfTTJxtbJ69dA127xiyojZCGjavoP95mmVrd0jxbY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=h2WFTBv0; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="h2WFTBv0"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A431DC4CEE9;
	Wed, 30 Apr 2025 07:37:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1745998637;
	bh=D5BW2gpx6wpLJIoZXvp/LiKyekPZG4Ijf80HhWU5hJo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=h2WFTBv0+Ky7WjqYg7CNblp112S2OS1Yq6PrL1dVVCzbuN/RwGDkC+wT5zyIn9pya
	 fbErUuaw/+dbDO58zSAQUiqfKMjJtenaCWDNRYGFNGhGP2teIR8+C/XW8RMuqLjyql
	 KOgHHmNCppPZ7F+pjqnout4ojdCeVMbNOplhTR8PAeg/0KzjICSP6WS4NXeODw4lho
	 Nk1zvVeWFVlKMZFz2VHQ9r3yNnN8zO/KZ64JIkpf0AtNXqX8pzN+iGb1y+ydIEfbrS
	 /V4rlsZWj4Yzo78ee1E5eYwvZ6VdNugma7AUfhEIfV48YdZMNP8yJugs7+Z91xsNc6
	 6UF8eV72x5EPQ==
Date: Wed, 30 Apr 2025 09:37:14 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: =?utf-8?B?QmFybmFiw6FzIEN6w6ltw6Fu?= <barnabas.czeman@mainlining.org>
Cc: Neil Armstrong <neil.armstrong@linaro.org>, 
	Jessica Zhang <quic_jesszhan@quicinc.com>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
	Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org
Subject: Re: [PATCH v2 1/2] dt-bindings: display: panel: Add BOE TD4320
Message-ID: <20250430-economic-papaya-labradoodle-a947dd@kuoka>
References: <20250429-lavender-panel-v2-0-fb467ff81bac@mainlining.org>
 <20250429-lavender-panel-v2-1-fb467ff81bac@mainlining.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20250429-lavender-panel-v2-1-fb467ff81bac@mainlining.org>

On Tue, Apr 29, 2025 at 11:33:14PM GMT, Barnab=C3=A1s Cz=C3=A9m=C3=A1n wrot=
e:
> Document BOE TD4320 6.3" 2340x1080 panel
> found in Xiaomi Redmi Note 7 smartphone.
>=20
> Signed-off-by: Barnab=C3=A1s Cz=C3=A9m=C3=A1n <barnabas.czeman@mainlining=
=2Eorg>
> ---
>  .../bindings/display/panel/boe,td4320.yaml         | 65 ++++++++++++++++=
++++++
>  1 file changed, 65 insertions(+)

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof


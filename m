Received: from layka.disroot.org (layka.disroot.org [178.21.23.139])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AADB4223DD1;
	Thu, 12 Jun 2025 17:10:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=178.21.23.139
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749748229; cv=none; b=FHkEnuza4o5wrRhWPa45O/JTYWnbUjNUknpmC3bdThk2XXsJeSc0h1CitoqaRwU2SAtX/HsImxyFK38p0tlQ3HUxg7JlpEHbl3cHAO2wDG7UX494Xs1Lfc8te/nl6IPABFDgqVNYA9D6xhOWpvReJDGzlJGLHD6vm5yDiJI3Uoc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749748229; c=relaxed/simple;
	bh=kI3pWz5ciJdR+6gfjQTJB664EWheKt9HhsUyJ6DP3ow=;
	h=MIME-Version:Date:From:To:Cc:Subject:In-Reply-To:References:
	 Message-ID:Content-Type; b=fjuzLvUm3Ow+zTgARDLMD3EsTez1IuhVz28GmwQ4cQ3UnSzwYiMIpaj3PGMm2NINSsLYFAAL6lJxtLA2pEO5w8zwITnSDDlb7AXBKvJnidkRer7NqyylOruOdDqnDeNHFbQi8zz3nUNn2HhPDjI1y5WTLL0mW2y70J9xwQ4FtvU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=disroot.org; spf=pass smtp.mailfrom=disroot.org; dkim=pass (2048-bit key) header.d=disroot.org header.i=@disroot.org header.b=OrZFR7dw; arc=none smtp.client-ip=178.21.23.139
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=disroot.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=disroot.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=disroot.org header.i=@disroot.org header.b="OrZFR7dw"
Received: from mail01.disroot.lan (localhost [127.0.0.1])
	by disroot.org (Postfix) with ESMTP id ABC9025DC0;
	Thu, 12 Jun 2025 19:10:24 +0200 (CEST)
X-Virus-Scanned: SPAM Filter at disroot.org
Received: from layka.disroot.org ([127.0.0.1])
 by localhost (disroot.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id bwC3n6P74jcH; Thu, 12 Jun 2025 19:10:23 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=disroot.org; s=mail;
	t=1749748223; bh=kI3pWz5ciJdR+6gfjQTJB664EWheKt9HhsUyJ6DP3ow=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References;
	b=OrZFR7dwVxAcDcZIqnMV/6mj/709JInMhWhb2oSHlEapC3pHFqOeWT5YX74iT4KuJ
	 K1pz8E7/PfeZWUWz2CUf/nvNY9CNL9q5LfBbIjfhUjgWCJDkJDFzdG4+GMwLuvb8Ff
	 sEMcoxgEgVG3m9QrSICzzdIXFJRELHQsHHNHJvlbTpwa73+1mfrDuayaBg5+zV24ZN
	 KKfny0drPz/wxxukSi7XGEMnCPVbpxfwIfB6LNS++k1aj7DY1EBHXPd37stab5SOwt
	 8E75+AnXz4pTkm4xynpgyfqVaw4wGVteum/3zACucOWL5d3BGc1h7Zm2C2Am/qmDUr
	 qifDz3wFPuSJA==
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Date: Thu, 12 Jun 2025 17:10:23 +0000
From: Kaustabh Chakraborty <kauschluss@disroot.org>
To: Conor Dooley <conor@kernel.org>
Cc: Neil Armstrong <neil.armstrong@linaro.org>, Jessica Zhang
 <quic_jesszhan@quicinc.com>, David Airlie <airlied@gmail.com>, Simona Vetter
 <simona@ffwll.ch>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Jessica Zhang
 <jessica.zhang@oss.qualcomm.com>, dri-devel@lists.freedesktop.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/2] dt-bindings: display: panel: document Samsung
 S6E8AA5X01 panel driver
In-Reply-To: <20250612-lively-duplex-ff45181ffd5a@spud>
References: <20250612-panel-samsung-s6e8aa5x01-v1-0-06dcba071ea6@disroot.org>
 <20250612-panel-samsung-s6e8aa5x01-v1-1-06dcba071ea6@disroot.org>
 <20250612-lively-duplex-ff45181ffd5a@spud>
Message-ID: <0a89c2b2edee38fc910d2ec88760f2e5@disroot.org>
X-Sender: kauschluss@disroot.org
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On 2025-06-12 15:30, Conor Dooley wrote:
> On Thu, Jun 12, 2025 at 08:22:41PM +0530, Kaustabh Chakraborty wrote:
>> Samsung S6E8AA5X01 is an AMOLED MIPI DSI panel controller. Document the
>> compatible and devicetree properties of this panel driver. Timings are
>> provided through the devicetree node as panels are available in
>> different sizes.
>> 
>> Signed-off-by: Kaustabh Chakraborty <kauschluss@disroot.org>
> 
> Acked-by: Conor Dooley <conor.dooley@microchip.com>

Okay no, even this one has the ID wrong, ugh :(

>> +$id: http://devicetree.org/schemas/display/panel/samsung,s6e8aa0.yaml#

Will apply tag after fixing it.

Received: from layka.disroot.org (layka.disroot.org [178.21.23.139])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0A3822F2E;
	Sat,  5 Jul 2025 14:46:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=178.21.23.139
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751726770; cv=none; b=XGL1AsytWSI7oK41mU6ZjgT/CkDTlWEzMmpTIscWDQZ51oaqCOFavRmrh3jCWrtzdaJNY/Ki6GTXqVCgrS/LS+ROLVQOW1gyuAf+qTHKUf+FSTLj9q4Hk4QgpBgkwFnUBdi3Rs1PgI0qA3m4W0m4P7+0XG8jLv2YuuvVLj0mqOo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751726770; c=relaxed/simple;
	bh=goQ0hTzbefy4V8CQMAJj1Lgw47gXhBOVmH5piWXh8Mo=;
	h=MIME-Version:Date:From:To:Cc:Subject:In-Reply-To:References:
	 Message-ID:Content-Type; b=n4f++PvmgoOYvKFsBDXO7OivKZpa0BheI2WxtYc+CuOXafWeyOZKx/aNckuVZ+GHBofOzO+v8Jba0Lx0XkhmK1g5jRHe8kiPwuqll5SpT0zzj9Lud6VJqJuYslrJgbwq+OeKbrJUnyVhbQlpC+7yn+K1IjZy20RTT3suKteB2Ng=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=disroot.org; spf=pass smtp.mailfrom=disroot.org; dkim=pass (2048-bit key) header.d=disroot.org header.i=@disroot.org header.b=hKacc+Vo; arc=none smtp.client-ip=178.21.23.139
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=disroot.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=disroot.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=disroot.org header.i=@disroot.org header.b="hKacc+Vo"
Received: from mail01.disroot.lan (localhost [127.0.0.1])
	by disroot.org (Postfix) with ESMTP id 0140A25C85;
	Sat,  5 Jul 2025 16:46:03 +0200 (CEST)
X-Virus-Scanned: SPAM Filter at disroot.org
Received: from layka.disroot.org ([127.0.0.1])
 by localhost (disroot.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 1rSSLXsLas_B; Sat,  5 Jul 2025 16:46:02 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=disroot.org; s=mail;
	t=1751726762; bh=goQ0hTzbefy4V8CQMAJj1Lgw47gXhBOVmH5piWXh8Mo=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References;
	b=hKacc+Vo6+8x/FhFxsEQVjGy9F17hhqKOdfGpdKPv4qpkxW7s9hdQEyiX6LxOUPOs
	 AXC7pWmC+V4r+N4VuEhPdc4BFPuj6tFf6tc7faxw/QfgRfQdSifj3AsIdm81gHZTIu
	 lEJv3LXxRUVCWcV90QXFs+pfi9ZOCU+uCVzP4GqRPjanGRhrdX2DpDQXHi2QhfDy1R
	 uwqmCGZsuZR51cAboAbn9xNEQENgh2j3oX311JEfNn9Mwe7kzvi+H67bdcKksqjvou
	 PdAYIOYTtKpPdEma4vhU8VTxlsIVa2IgudgVUuf3IlyxkpZmqtblZyx5YPA5wd1WXn
	 TdeNZOEGzWQPA==
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Date: Sat, 05 Jul 2025 14:46:01 +0000
From: Kaustabh Chakraborty <kauschluss@disroot.org>
To: Maxime Ripard <mripard@kernel.org>
Cc: Neil Armstrong <neil.armstrong@linaro.org>, Jessica Zhang
 <quic_jesszhan@quicinc.com>, David Airlie <airlied@gmail.com>, Simona Vetter
 <simona@ffwll.ch>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
 dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, Conor Dooley <conor.dooley@microchip.com>
Subject: Re: [PATCH v3 1/2] dt-bindings: display: panel: document Samsung
 S6E8AA5X01 panel driver
In-Reply-To: <20250703-true-archetypal-skylark-dfb055@houat>
References: <20250625-panel-samsung-s6e8aa5x01-v3-0-9a1494fe6c50@disroot.org>
 <20250625-panel-samsung-s6e8aa5x01-v3-1-9a1494fe6c50@disroot.org>
 <80055981-3624-4165-af0c-3b60c345e8f8@linaro.org>
 <4b9e44b14395ff4c64eba1bd71e63150@disroot.org>
 <20250703-true-archetypal-skylark-dfb055@houat>
Message-ID: <5f2c37bf2882530453ba91f6801f8ec0@disroot.org>
X-Sender: kauschluss@disroot.org
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit

On 2025-07-03 09:01, Maxime Ripard wrote:
> On Mon, Jun 30, 2025 at 05:18:22PM +0000, Kaustabh Chakraborty wrote:
>> On 2025-06-30 15:29, Neil Armstrong wrote:
>> > On 25/06/2025 14:41, Kaustabh Chakraborty wrote:
>> > > Samsung S6E8AA5X01 is an AMOLED MIPI DSI panel controller. Document
>> > > the
>> > > compatible and devicetree properties of this panel driver. Timings are
>> > > provided through the devicetree node as panels are available in
>> > > different sizes.
>> >
>> > Wait, why ? Why not multiple compatibles ?
>> 
>> The panel dimensions is the only thing which differs. The model name,
>> controller, registers, and functionality are supposedly all similar, 
>> so
>> I believe this is fine...
> 
> If only the dimensions change, then width-mm and height-mm would be 
> enough, right?

Sorry, meant panel resolution.

> 
> Maxime

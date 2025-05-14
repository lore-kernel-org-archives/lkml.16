Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3DEE0270ED7;
	Wed, 14 May 2025 16:05:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747238739; cv=none; b=beRaHjo77d2J6LaDyIXJDI45XKE7Ka/fQFUSyFr3aYc5GeImt+EiPmKfeJiAzDm1UYNxI+8wyH08TB+Xbx+tM2Y4EZsjjV/VJduH20E8MABAAfUtY10L2g0R9Jls5vznJ2XE7u6DLLTGzUUdwIVl8iBUv7otDpsB0L9xKlVLmSg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747238739; c=relaxed/simple;
	bh=340q/KEUN+HnJ5ZK40hUt5FGwqCMJWS2IjUF828YIIU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ShqjhNrcPKT+xwWSdM0Nncj3Pg3ff3w2+7PDRFyrKWvw+6SHovCj8xXJQ4gjaWCLGxl6uYd4z/fNFwNb2w0Yz8CUTGTTVTaRkX9FLebKl/NFfAe+H5HgM9JYiAoH74jNX5Qxow/oLxCZVGUUFNaYLOD12OPJww33j3ZPkBjgl+0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=lCLGUS6u; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="lCLGUS6u"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 69ED3C4CEE3;
	Wed, 14 May 2025 16:05:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747238738;
	bh=340q/KEUN+HnJ5ZK40hUt5FGwqCMJWS2IjUF828YIIU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=lCLGUS6uVGyfJZuqXNyjpToH5HFpqKPKmc1tM9Qly7soW/qwKAp3sxZnznvJLizrJ
	 NbtoWYAfILYVbFwk0SZWbW56tKvefEyzc/rZM1FPOhp1n3prB6mwSWTpjFcu2usQi9
	 GLnIIRuix+C2Cwxu1r9lK/RWperOwZBOsf11usHJAovZl/KQytqFm/p7UTeN47vsWu
	 3W0SOqG+QbB3bNLhEEzdWWXKZmCF5NaVSSWoq99nMcTn5ZSdhruSEVgafzj632DpI3
	 KvHDDoiNz2SKin+Wsau21CGNDOuXotk+KKMtvDS/bPuph7N0tSxEc0PW09ilN6+CJ7
	 QNL0AJZXvMfng==
Date: Wed, 14 May 2025 11:05:36 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Svyatoslav Ryhel <clamor95@gmail.com>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	Conor Dooley <conor+dt@kernel.org>, dri-devel@lists.freedesktop.org,
	Jessica Zhang <quic_jesszhan@quicinc.com>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	Simona Vetter <simona@ffwll.ch>, David Airlie <airlied@gmail.com>
Subject: Re: [PATCH v3 3/4] dt-bindings: display: panel: Document Renesas
 R69328 based DSI panel
Message-ID: <174723873634.2424508.11724723514969082170.robh@kernel.org>
References: <20250506092718.106088-1-clamor95@gmail.com>
 <20250506092718.106088-4-clamor95@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250506092718.106088-4-clamor95@gmail.com>


On Tue, 06 May 2025 12:27:17 +0300, Svyatoslav Ryhel wrote:
> R69328 is liquid crystal driver for high-definition amorphous silicon
> (a-Si) panels and is ideal for tablets and smartphones.
> 
> Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
> ---
>  .../display/panel/renesas,r69328.yaml         | 73 +++++++++++++++++++
>  1 file changed, 73 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/display/panel/renesas,r69328.yaml
> 

Reviewed-by: Rob Herring (Arm) <robh@kernel.org>


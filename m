Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A3E832951DD;
	Thu,  3 Jul 2025 07:10:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751526641; cv=none; b=IYIlXCx0htZC37I88ifUCQltI/r6JbCrWisayPz9Qrdi/e9nITFjEWyeoRDAPU9faKyE1FCLIHs3KvYTy1a1l0UVjHA6x0HAyFDIwCqyiY2FQtWXGEkyb+0tV+lCm6avVYPJQNNQs7B+LISZDk4DN4dZm8zMC9R4M+ylLhOtpt4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751526641; c=relaxed/simple;
	bh=xq0PpWjYz8cPKeWInNSvsosTUjM8RN/gpvBqji2Yyt4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=qD5zYTKwfSHSzPrt8mdExf45Fz7Ws7bj4w/n4NHOA0ryc+jkTEzPTQ8QkfY3QHmd35Z9Tg6woE55Sb4xB42KDrSeLV5BVlcSpg9WQEicIj0urO4+i6ks5FGL0PEqEVnXDQUwGjak/QiEEjcWPrzFfs9chEanru6DOf60jflmSzI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ei5I9jhN; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ei5I9jhN"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 91CEFC4CEE3;
	Thu,  3 Jul 2025 07:10:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1751526641;
	bh=xq0PpWjYz8cPKeWInNSvsosTUjM8RN/gpvBqji2Yyt4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ei5I9jhNEL66axIal8D0bu1cywryGpLO0jw4d38AJqDTtLTLGJu4pjnLUihJCLXMF
	 oN3+5QqhdYmE/PJFYZSpArVe7HmItSkWpQYd/NqSbAQ9dGPyPtEjQ3fMDCyMIXaT+V
	 Idk/clNNPBsDlPQIeH9QmhNs/0Yo0tzgJv7k5np9vEGMCa8w5DhIBrUeHGL0ejhOg8
	 ls6K1oBycDVJ97z9EzSuJmktWFF+BTPM4+2hYqBvQTLd6ax3fmmJ4TA58F5yxmkiow
	 XPbwPmzm2Kt8n1pij6Lgb1SWcK+Fr61tX3uAFSTEnJvjDTkWaRBmU9H3po7jZYoouY
	 JPTb4d2SFt2ew==
Date: Thu, 3 Jul 2025 09:10:38 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Nick <nick.li@foursemi.com>
Cc: lgirdwood@gmail.com, broonie@kernel.org, robh@kernel.org, 
	krzk+dt@kernel.org, conor+dt@kernel.org, perex@perex.cz, tiwai@suse.com, 
	like.sin@gmail.com, xiaoming.yang@foursemi.com, danyang.zheng@foursemi.com, 
	linux-sound@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v1 3/4] ASoC: dt-bindings: Add dt bindings for FS2104/5S
 audio amplifiers
Message-ID: <20250703-primitive-puzzling-toucanet-2c4870@krzk-bin>
References: <20250703035639.7252-1-nick.li@foursemi.com>
 <20250703035639.7252-4-nick.li@foursemi.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250703035639.7252-4-nick.li@foursemi.com>

On Thu, Jul 03, 2025 at 11:56:38AM +0800, Nick wrote:
> From: Nick Li <nick.li@foursemi.com>
> 
> This patch adds bindings for FourSemi FS2104/5S audio amplifiers
> which can support both I2S and I2C interface.
> 
> Signed-off-by: Nick Li <nick.li@foursemi.com>
> ---
>  .../bindings/sound/foursemi,fs210x.yaml       | 95 +++++++++++++++++++
>  1 file changed, 95 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/sound/foursemi,fs210x.yaml
> 
> diff --git a/Documentation/devicetree/bindings/sound/foursemi,fs210x.yaml b/Documentation/devicetree/bindings/sound/foursemi,fs210x.yaml
> new file mode 100644
> index 000000000..3a1aba9b8
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/sound/foursemi,fs210x.yaml
> @@ -0,0 +1,95 @@
> +# SPDX-License-Identifier: GPL-2.0-only

Please run scripts/checkpatch.pl on the patches and fix reported
warnings. After that, run also 'scripts/checkpatch.pl --strict' on the
patches and (probably) fix more warnings. Some warnings can be ignored,
especially from --strict run, but the code here looks like it needs a
fix. Feel free to get in touch if the warning is not clear.

Best regards,
Krzysztof


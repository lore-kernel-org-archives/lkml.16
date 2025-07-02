Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AFEC9201261;
	Wed,  2 Jul 2025 07:17:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751440666; cv=none; b=a20+KbITyk7tHaKNmfetyEp/j8t798NtG6de1VLXzo9dOpPHH9XkITK9dxi9MI0tLDt+lbBE9is68UTTJ2RKDUdj2UPdAO2rSb1f7fVo5D68rVrRjFksVhlQm4x69sRJz0IOpCckd7DwVDlXYkC7OtQHZh4o5QqIwoIJtSlqrLM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751440666; c=relaxed/simple;
	bh=IlwKoiUCYuw1cVdfd5GoX8U1ubR8xzniGhMiSlw8mzg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Srl4YuPmmTfHueVs7kJgFRUkULe4SMTQpnEFabI0L2LCtvUD7uXllflMXynKUF/P3gdFQ6zEkDXCL9dVHVRFFo/dLiVndue9xBGu6QkLd+/4e0DovlfouPz5as3f9CnmLJh/WU/AYB00PkRFvPZZzwvsOUP9vOHt97Q/hhk4y0c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=VhovT1ow; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="VhovT1ow"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AE439C4CEEE;
	Wed,  2 Jul 2025 07:17:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1751440666;
	bh=IlwKoiUCYuw1cVdfd5GoX8U1ubR8xzniGhMiSlw8mzg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=VhovT1owv34nFedpb/TKIEsP/OT/X9OHDa48kcOhslM+TDAc3spkXiK0QsG/hgIYG
	 TNFULzVYhQbHnmKfIMgBTS6DvLuY3VYrNnT7nd6f85ZBTqWkJHfbTdLf5CcqVjrSco
	 7fISvjM1WQWsqTpE67CESKEZp5om7gqcjFRwv3vgFET2kS4A423RMBxKWSQW/u5O3V
	 ncq0WBztvTUJk923HdK1QOJ5SM1hLVOZRZeZZ8Udk9F5BoBXKtirgOT48RKcYV0IHd
	 lAghPXMAQ6TU/w+a1iqWnYgozgV92Hhtjb/rb/iRhtMe5TJJFL9WTO7xghh5nrP2sM
	 fkV8k4YtRfOjg==
Date: Wed, 2 Jul 2025 09:17:43 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Paul Kocialkowski <paulk@sys-base.io>
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Neil Armstrong <neil.armstrong@linaro.org>, 
	Jessica Zhang <quic_jesszhan@quicinc.com>, David Airlie <airlied@gmail.com>, 
	Simona Vetter <simona@ffwll.ch>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
	Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Thierry Reding <thierry.reding@gmail.com>, 
	Sam Ravnborg <sam@ravnborg.org>
Subject: Re: [PATCH 1/2] dt-bindings: display: simple: Add Olimex
 LCD-OLinuXino-5CTS
Message-ID: <20250702-uppish-unbiased-bullfrog-bcb5d3@krzk-bin>
References: <20250701201426.814750-1-paulk@sys-base.io>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250701201426.814750-1-paulk@sys-base.io>

On Tue, Jul 01, 2025 at 10:14:25PM +0200, Paul Kocialkowski wrote:
> Add the Olimex LCD-OLinuXino-5CTS, a 5-inch TFT LCD panel.
> 
> Signed-off-by: Paul Kocialkowski <paulk@sys-base.io>
> ---

Not tested or missing yamlint. Rob's report probably will follow up, but
even without it - please test before sending, not after.

Best regards,
Krzysztof


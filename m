Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 060BA28C5B2;
	Wed, 23 Apr 2025 15:24:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745421862; cv=none; b=tAfjMmYZeCKSBP+DL713KvHSK6eXKURlNVgOoUU1tZfUFeEfM01u/IeVGmzDPulgzOSLCVnYg9Te4I/6sWjf31YfqBboI6pJc8L9nvJ2agKX3e2660emAQdxu5r6gF7HebYN1FcS4E49aLytPgmjXVlkOnCkmC0NLYDuDXhkTQI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745421862; c=relaxed/simple;
	bh=MGkSDAhmsttNEFpJt61N5qgZgDOhGEDQKGrmLoEGji8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=IKyQroetbFLlqlCIfVo1Gl0zA7lEdqt+rwkYYanH11DcKa7YvPbCNxlboRJk+Y4qDOOpt1Aq5wa7LIPjGy0+DFqgkoHPvRMf9fS1uqScrZlCZ1z4o5oK8QlFjGuPesrWyCHoQqRt4ErLjPZYhixGyWWr+0ycF4x4ZJ7XwkMar7o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=j2MfFQT3; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="j2MfFQT3"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A06D5C4CEE2;
	Wed, 23 Apr 2025 15:24:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1745421861;
	bh=MGkSDAhmsttNEFpJt61N5qgZgDOhGEDQKGrmLoEGji8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=j2MfFQT34oLMAfbpJVPfDpvwGmvcGh/TuufkBrvtdvQ+wp63PV7M3qQKVsVOwYoKa
	 X9n3Pn+LUi83ar1QffPqYBT946ICCF2dt1yhqP52ONfcaPmd6xQo75YxT5mtkIJNfy
	 13JXoSeG/V7oytYAxNAlCp8vIAxHjcwYgNLYLWGyHnPDEtLDHgZzXX/ZTzM0JOP/9D
	 QkbO4i/7WAycKSJKdmmO9N2WakwKAhP9PwU9lSWhWdKfg/R9Im/QyUptOLvZB/Hk+a
	 sUkoSfCggUA/CKcHS42UfruWqzkTUBMHujQpKxM5qahvydJ57GzOWodhepSqm2Aa9j
	 f24LBdQ7bHY3A==
Date: Wed, 23 Apr 2025 10:24:20 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Alexey Charkov <alchark@gmail.com>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	Thomas Gleixner <tglx@linutronix.de>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v2] dt-bindings: interrupt-controller: via,vt8500-intc:
 Convert to YAML
Message-ID: <174542185825.550926.14913949740445861454.robh@kernel.org>
References: <20250418-via_intc_binding-v2-1-b649ce737f71@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250418-via_intc_binding-v2-1-b649ce737f71@gmail.com>


On Fri, 18 Apr 2025 17:57:25 +0400, Alexey Charkov wrote:
> Rewrite the textual description for the VIA/WonderMedia interrupt
> controller as YAML schema.
> 
> The original textual version did not contain information about the
> usage of 'interrupts' to describe the connection of a chained
> controller to its parent, add it here. A chained controller can
> trigger up to 8 different interrupts (IRQ0~7) on its parent.
> 
> Signed-off-by: Alexey Charkov <alchark@gmail.com>
> ---
> Split the series from v1 into separate bindings patches so as not to
> spam all the subsystems with unrelated changes, per Rob's suggestion
> 
> Link to v1: https://lore.kernel.org/all/20250416-wmt-updates-v1-2-f9af689cdfc2@gmail.com/
> ---
>  .../interrupt-controller/via,vt8500-intc.txt       | 16 -----
>  .../interrupt-controller/via,vt8500-intc.yaml      | 76 ++++++++++++++++++++++
>  MAINTAINERS                                        |  1 +
>  3 files changed, 77 insertions(+), 16 deletions(-)
> 

Applied, thanks!


Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 52DC5157487;
	Tue, 20 May 2025 19:55:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747770951; cv=none; b=V3c0+MnAHpxVG/KLmGG1txL0utLacjXc79NRx9RjMTJkxHJ1LUGqNtcrPpf5ykjVtM6TK2KT9gP0jmuCKgrYuy5L8uSqmCssN4augyKZHhI2djg+af1xcXI4bPOB6CAiTOWPW1l38YvaPIXcaJY2pqetXuonZFaryktgBr8D3TM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747770951; c=relaxed/simple;
	bh=jwgMcGlcHlw3+3ywi+HAwmkWo8kiB7wLjKMSEKs159Q=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=OSL8bdhfj9xG34BA1kI7Sbi6/qKq87vrmOW3GeK8jh49EK7XZAnu4fMOYWL5iPUxAGcgwcXvwvQVSsVfJ3+kFo/gYid8+Tv0WVk/SkwonFfBjLBEKZznTyAGm2xTvoNyY0L49Hh/5S+oF3uLGipsBjygn+9GLWF9NzLu7eDEt90=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=c5avvjDI; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="c5avvjDI"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9C69CC4CEE9;
	Tue, 20 May 2025 19:55:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747770950;
	bh=jwgMcGlcHlw3+3ywi+HAwmkWo8kiB7wLjKMSEKs159Q=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=c5avvjDIpuD27We6BetYqMmQ4ZLZCz/lKSIgz2pnOpFOMdX7yaH7Ccd6smqCE34CW
	 QvGrpRkMD6xYrf6H7MRgoarVUZr2oCQg7MMQsbVd3Q/c62D9zxiYfAfjEELUJBI1QE
	 wJ0X9NRauBxm/OIdzkYtRszN8yyZLSVQst/0yYCetJ44QArV3jdJgBs1yxlbylp92d
	 uFAJJfOC8KOWchfuGklMvYsumU0sa+zOTDSba/YX+eedXKBeOPrqHd2B95GPDLxHzB
	 yvxjp5furxngTh6am4mAuIYP0Ne/GZuK49Z3D0B8nwxUzPOlbaP5aM3mwEhk0AJ9a2
	 EoOtI1jqnWuKQ==
Date: Tue, 20 May 2025 14:55:48 -0500
From: Rob Herring <robh@kernel.org>
To: Sukrut Bellary <sbellary@baylibre.com>
Cc: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Tero Kristo <kristo@kernel.org>,
	Kevin Hilman <khilman@baylibre.com>,
	Andreas Kemnade <andreas@kemnade.info>, linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 0/3] dt-bindings: clock: ti: convert to yaml
Message-ID: <20250520195548.GA1254638-robh@kernel.org>
References: <20250516081612.767559-1-sbellary@baylibre.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250516081612.767559-1-sbellary@baylibre.com>

On Fri, May 16, 2025 at 01:16:09AM -0700, Sukrut Bellary wrote:
> Convert TI autoidle and fixed-factor-clock bindings to yaml. We are fixing
> binding warnings only. No change in the existing dts.
> 
> Changes in v2:
> 	Patch 1:
> 	- Dropped reg and example.
> 	- Updated description
> 	- Fixed the subject
> 	- Fixed line re-wrap.
> 
> 	Dropped clockdomain.yaml(patch 2 in v1). This will be taken
> 	  with prcm.txt binding conversion.
> 
> 	Patch 2:
> 	- Fixed ti,autoidle.yaml reference.
> 	- Added constraints.
> 	- Dropped description from clocks and clock-output-names.
> 
> 	Patch 3:
> 	- Restored the license.
> 
> Link to v1:
> 	https://lore.kernel.org/lkml/20250404014500.2789830-1-sbellary@baylibre.com/
> 
> Sukrut Bellary (3):
>   dt-bindings: clock: ti: Convert autoidle binding to yaml
>   dt-bindings: clock: ti: Convert fixed-factor-clock to yaml
>   dt-bindings: clock: ti: add ti,autoidle.yaml reference

Reviewed-by: Rob Herring (Arm) <robh@kernel.org>

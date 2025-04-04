Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6240A145B0B;
	Fri,  4 Apr 2025 15:34:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743780864; cv=none; b=kxctd6GBvvuRJuoQeC0bNK9FlvGrNFc8ZnUmbjczzC8gRZHng+416JEmlnz+vGL/cAyLrS0lLe/KfZGrtNie71Dnz8CxOFsJI8EEGeE99LHLIDD2I6ul0ojSV1O0tgXJNxgJxvpFJ6pcMlRkhhqSNtXYIiowk2p57vWaRluB5bU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743780864; c=relaxed/simple;
	bh=/4dirTW7v+Oh+pNv2aY5PDHiZhYmC1dQjpxEX1joon0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Q9/TWXbtVIKvt3Uqh5rKOqHm0EvWJQn456uoav02VlyEpqYKzwfjh1toqF1oR6znj9wB2ZEbaYJ1ML5OsmyvSFfQU//eAmf2aI0OsT2WNwJzIS7lhunHoFHLZQMXKZGYVWxyg9zM3ykdonOq4Lg6Q+WttlI9W7lbFhVy3lfdlX4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=b5jJbzkY; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="b5jJbzkY"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 90D02C4CEDD;
	Fri,  4 Apr 2025 15:34:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1743780863;
	bh=/4dirTW7v+Oh+pNv2aY5PDHiZhYmC1dQjpxEX1joon0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=b5jJbzkYJf8tHvmcTa4QGDPrr1S2tKH+01UTwhjiSXCjFs6Qq5QTG8743lkWdxRHD
	 XfGorU6sq/hnpWmBRKt/VQtIIj+LUNqHIskLA2Gvnj30nFSQ0xhCPdqHgM0o+xt/pe
	 02Yx2gM5VJsyDJfV674x46KHky82IHSOno+J/w/TtYqMO65FF6CgtwNi6Jy698n7a3
	 lVFnPgfaeCYrvLI9VPBsqjk27W7zFjV5H8gPVn1PrvJ6ZcF/O6tEPUVTeOTY9xtbxt
	 ypG58ohpvkxId0r3qvgLBRVhVbUv2wl5TaADCyW/lnJKM22AbnYK/Q+0GruA2Dnm6W
	 Xt4ZgFEaVW3tQ==
Date: Fri, 4 Apr 2025 10:33:39 -0500
From: Rob Herring <robh@kernel.org>
To: Juerg Haefliger <juerg.haefliger@canonical.com>
Cc: andersson@kernel.org, konradybcio@kernel.org, krzk+dt@kernel.org,
	conor+dt@kernel.org, linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/3] arm64: dts: qcom: x1e80100-hp-omnibook-x14: Create
 and include a dtsi
Message-ID: <20250404153339.GA1463808-robh@kernel.org>
References: <20250404090108.3333211-1-juerg.haefliger@canonical.com>
 <20250404090108.3333211-2-juerg.haefliger@canonical.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250404090108.3333211-2-juerg.haefliger@canonical.com>

On Fri, Apr 04, 2025 at 11:01:06AM +0200, Juerg Haefliger wrote:
> Create a dtsi for the HP OmniBook so it can be reused for the HP EliteBook
> which seems to be the same HW.
> 
> Signed-off-by: Juerg Haefliger <juerg.haefliger@canonical.com>
> ---
>  .../dts/qcom/x1e80100-hp-omnibook-x14.dts     | 1554 +---------------
>  .../dts/qcom/x1e80100-hp-omnibook-x14.dtsi    | 1557 +++++++++++++++++

Just include x1e80100-hp-omnibook-x14.dts where you need it. There is no 
rule against including .dts files.

Rob

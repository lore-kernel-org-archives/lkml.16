Received: from bayard.4d2.org (bayard.4d2.org [155.254.16.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3FD1A191F92;
	Tue, 13 May 2025 05:02:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=155.254.16.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747112575; cv=none; b=aJYSG9znrs65rKKEIMmy6wwvfvE1PwVra11BS9i4I1ZWZrlkv0+v49DhOjZgTqyB36ZaTzqYn5Ia5QfWx3IdyimnJsmCG8EUaYmfhFzKmLN8h4uzpLxOpmokYnM/Go0Hkq191PK9Pqdu0tboRNwz3OZX+HLLDxvzJU/xBCMihe8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747112575; c=relaxed/simple;
	bh=pmGvFHuiA36wKd6QquoJOIas6H2vuUJqSpbTefp3dbw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=fnq+yMjCBsJ6ALOrwPtpsO/arpW1vFkEWotEtgL6G8SKR/UKMD4X5FOpU/FKn7SbTT2bwGoTj/t1HvXMSurQkUvbOY7LKkvjyqvlFL/JXIXUIl2dl1iMOIfPYaF2l8C3iLalvjpGaO18uv+SlwFNz1zlIjZ2OxR03lkQp+c/EVY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=4d2.org; spf=pass smtp.mailfrom=4d2.org; dkim=pass (2048-bit key) header.d=4d2.org header.i=@4d2.org header.b=IGs/vfV1; dkim=pass (2048-bit key) header.d=4d2.org header.i=@4d2.org header.b=LMSinbuv; arc=none smtp.client-ip=155.254.16.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=4d2.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=4d2.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=4d2.org header.i=@4d2.org header.b="IGs/vfV1";
	dkim=pass (2048-bit key) header.d=4d2.org header.i=@4d2.org header.b="LMSinbuv"
Received: from bayard.4d2.org (bayard.4d2.org [127.0.0.1])
	by bayard.4d2.org (Postfix) with ESMTP id A2F3B12FB43C;
	Mon, 12 May 2025 22:02:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=4d2.org; s=mail;
	t=1747112573; bh=pmGvFHuiA36wKd6QquoJOIas6H2vuUJqSpbTefp3dbw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=IGs/vfV1iC52O+WkyE/wYDMnLrJ3APRv4bTF+gxydJtWry/9ShYrlF+lp4d2bryAt
	 B0mI49+HtWdxvnbXHFY1AgZJZTInRE6IIEq3ahR+mqOMCCM7pEdYGpXUb4nFHvBjyZ
	 K3+nUgC7av0W4ReGkm/Q8SK7DHQWdE27rpY869Vdp4pm3wdj6PTVyrqPr/EfnxrFmo
	 +UiBTvewauOW2Oq4jpZ4kZBcQR7ZhFXH272aP0hUQ9vjOUS7x4zjo6Klh/gtWIjJXG
	 fn/uQUBMp9mpMRx6PQ2bfX/E77ddq68Pm+50V60+ny1BA9cce8zmXJe51fZ0pUZmO8
	 WiBCZF+BrA2qA==
X-Virus-Scanned: amavisd-new at 4d2.org
Received: from bayard.4d2.org ([127.0.0.1])
 by bayard.4d2.org (bayard.4d2.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id e67-jXa9ihwv; Mon, 12 May 2025 22:02:19 -0700 (PDT)
Received: from ketchup (unknown [183.217.81.95])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: heylenay@4d2.org)
	by bayard.4d2.org (Postfix) with ESMTPSA id CD09412FB430;
	Mon, 12 May 2025 22:02:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=4d2.org; s=mail;
	t=1747112539; bh=pmGvFHuiA36wKd6QquoJOIas6H2vuUJqSpbTefp3dbw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=LMSinbuvmBlIB3o55y//CuXRRaaeUjcWmLfx3o4KOUTWfjyFaaYjVN+fPv5KX1yFt
	 NagZC9lR1Lhm0wjyx6quKhNsE3NoYMuM8p3Sp/i8JoKcw7UWG2oRI042Z+U2qFfugy
	 GNNTQCoDF5Kh5AI13q0VJiSY5GaICGMnEE+tmFonykLKhTn6uXB0zxn+CH+0B+dsfR
	 K0L7Mvpishm3Shk99WFEbHEaEz7hMVH+Olab9dj0pLfOqN1xIREMo4Di66kLv1YL7j
	 ZTCzzEkRqborJ0Dk7rCDe9hr6JcV+94wyJxgYHXy3AujGXtaJZuAjxutbHYOATk7dj
	 TbBQY4nFYRpBQ==
Date: Tue, 13 May 2025 05:02:12 +0000
From: Haylen Chu <heylenay@4d2.org>
To: Alex Elder <elder@riscstar.com>, robh@kernel.org, krzk+dt@kernel.org,
	conor+dt@kernel.org, mturquette@baylibre.com, sboyd@kernel.org,
	p.zabel@pengutronix.de, paul.walmsley@sifive.com,
	palmer@dabbelt.com, aou@eecs.berkeley.edu, alex@ghiti.fr,
	dlan@gentoo.org
Cc: inochiama@outlook.com, guodong@riscstar.com, devicetree@vger.kernel.org,
	linux-clk@vger.kernel.org, spacemit@lists.linux.dev,
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v9 2/6] soc: spacemit: create a header for clock/reset
 registers
Message-ID: <aCLSVB-AIF-fg_2a@ketchup>
References: <20250512183212.3465963-1-elder@riscstar.com>
 <20250512183212.3465963-3-elder@riscstar.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250512183212.3465963-3-elder@riscstar.com>

On Mon, May 12, 2025 at 01:32:07PM -0500, Alex Elder wrote:
> Move the definitions of register offsets and fields used by the SpacemiT
> K1 SoC CCUs into a separate header file, so that they can be shared by
> the reset driver that will be found under drivers/reset.
> 
> Signed-off-by: Alex Elder <elder@riscstar.com>
> ---
>  drivers/clk/spacemit/ccu-k1.c    | 111 +----------------------------
>  include/soc/spacemit/k1-syscon.h | 118 +++++++++++++++++++++++++++++++
>  2 files changed, 119 insertions(+), 110 deletions(-)
>  create mode 100644 include/soc/spacemit/k1-syscon.h

Reviewed-by: Haylen Chu <heylenay@4d2.org>

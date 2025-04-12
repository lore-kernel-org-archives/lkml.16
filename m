Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4E2A4204C2E;
	Sat, 12 Apr 2025 18:03:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744481026; cv=none; b=KtFOK1/DkjHqUf4EDOX9voc/GfEVIGHuNNDDZoniiLpv/TTsQjy1pcYvlbfan4SZFic1xJ8xbPlh9ZlXQEaP/OqK+vq5oOXNYF0Yzd4HQ55rBG+BFC7F7vOIQ5sBLn6exehEZdUjrsaEaDD56dmjW4IeSYaCdvrEQw6LSj2bXqk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744481026; c=relaxed/simple;
	bh=1AUMW9p2rIBFD6BguK3C9owmSBdUU41XGSu13NVq6cM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=rvHCIKmNOnl+3zMB2lGfRNRla/J8tyrWYfdRDPIpf/TU+lCptnYtJBiDBPF5NX4cVOJuPJspMZCFin538HFbXSouW0hXSHb579zx/8AxDpD6XK2/LFCnlDdT+lfKnwS77ALQf8+4/NBGbfw1CrBfSxEkGtmILvx1Ez5AruMmeFs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=c4KT3su+; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="c4KT3su+"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9B4A3C4CEE3;
	Sat, 12 Apr 2025 18:03:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744481024;
	bh=1AUMW9p2rIBFD6BguK3C9owmSBdUU41XGSu13NVq6cM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=c4KT3su+5+9E+s+sPOXj0mNLmgsawjS+tTAYXNLAIXRmHyJTZb7tk9t2niSFY4SxC
	 ug22xkcMhk4SKuj1cszRFtAgPXn6DQRkJALaT1ln6QJw+z98bkMasZyYcor+hPBreu
	 Fap+KZnQOUJ820yKUtI+RTKiWst0dYts74Vf9pZkxUpp3zOJoQBdkPEWR4Cc0+KVJ8
	 USJLUyiZW6IUzSSXSRYACJ5lC3HvayAYyyCU/UTIMAUdezXGMopCUInDMKXo/Fs275
	 S1zUOmyTGwwc4QP24znAnQsFoiySQVaxfutKfgmY1jB1SuaAWWwuw0xcoM01CWJR/3
	 UDo7dELIz7kbw==
Date: Sat, 12 Apr 2025 13:03:43 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Frank Li <Frank.Li@nxp.com>
Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Stephen Boyd <sboyd@kernel.org>,
	devicetree@vger.kernel.org,
	Michael Turquette <mturquette@baylibre.com>, imx@lists.linux.dev,
	linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org
Subject: Re: [PATCH 1/1] dt-bindings: clock: convert vf610-clock.txt to yaml
 format
Message-ID: <174448102270.1415062.15572681322070189263.robh@kernel.org>
References: <20250411212339.3273202-1-Frank.Li@nxp.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250411212339.3273202-1-Frank.Li@nxp.com>


On Fri, 11 Apr 2025 17:23:38 -0400, Frank Li wrote:
> Convert vf610-clock.txt to yaml format.
> 
> Additional changes:
> - swap audio_ext and enet_ext to match existed dts order
> - remove clock consumer in example
> 
> Signed-off-by: Frank Li <Frank.Li@nxp.com>
> ---
>  .../bindings/clock/fsl,vf610-ccm.yaml         | 58 +++++++++++++++++++
>  .../devicetree/bindings/clock/vf610-clock.txt | 41 -------------
>  2 files changed, 58 insertions(+), 41 deletions(-)
>  create mode 100644 Documentation/devicetree/bindings/clock/fsl,vf610-ccm.yaml
>  delete mode 100644 Documentation/devicetree/bindings/clock/vf610-clock.txt
> 

Reviewed-by: Rob Herring (Arm) <robh@kernel.org>


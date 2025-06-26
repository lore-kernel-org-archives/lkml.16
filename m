Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6DA902F1FDA;
	Thu, 26 Jun 2025 12:03:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750939432; cv=none; b=WEPW0P77x8ErcaandYyk/mioQfQwDoIcY4g7VMJ4UTWk6CGrle2Dockz4VUD9nOc52OaFPOnxs80sGD6vNCRf5lwEZ8I+xrXgkZaREkNQ6Zw3BI7fYV2eoSOilb91ibR1bwoacZZqIOwp9z5OnJHwD81b6fkF8xiIEe3uvdhkYE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750939432; c=relaxed/simple;
	bh=4hnWVm/WUKrVcAQs3GScuoi2DpfD6MZHWSrLCp87cMU=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=c5mZjBDzbhUE05bCgbTPWdNRAc+Vv8ok3rRbhcabUc3MYwGyaIdDVagd2OObtSU0PCzUfaoWIvgkRlAaFfuGncSvRBPBuO24Ts8e6CHm/eOGtXeJRtoWwnaOBsLYvTcWnGc9KOvd1Y7lsJ1P4XvQzJogPuHFtGegwtrXsOtBQS8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=nGbCeBRE; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="nGbCeBRE"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8F90AC4CEED;
	Thu, 26 Jun 2025 12:03:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1750939432;
	bh=4hnWVm/WUKrVcAQs3GScuoi2DpfD6MZHWSrLCp87cMU=;
	h=Date:Subject:To:References:From:In-Reply-To:From;
	b=nGbCeBREC5eH1u5LoXmzBL/KyhNMgjcwCqBdp4VdTIiAPPhxf0igOOfG1q8sKILbB
	 rjqtIZZfEJtiR4pE0nED5VcTVLpfFwRRcybg7U/wD9It/vIp1T9grEuJGWyYVeEw0c
	 uiK17aLdxBZ7+Gherpbb0j752P5rVT0xpduFeR1ACZK0LbzIEHsrT3jct9rOvhx+ku
	 6SGou8vV75LAtsu4aq1wb/UWy9rGafJK6zWeCcPkovfedTu/J5TnQ5KN2/2snXpzIs
	 LaeW0byiRY8HQUJI5Z0qRQr0Vj0rH8d3WP0jFIdgKKb1HQQy6zsyStwmDAxl7TgOL2
	 ZnG8sFtnnp9yQ==
Message-ID: <e038c70c-e7ce-41c5-9b6e-f7d5ca04b600@kernel.org>
Date: Thu, 26 Jun 2025 07:03:48 -0500
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm64: dts: altera: socfpga_stratix10: update internal
 oscillators
To: Matthew Gerlach <matthew.gerlach@altera.com>, robh@kernel.org,
 krzk+dt@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20250625151442.42191-1-matthew.gerlach@altera.com>
Content-Language: en-US
From: Dinh Nguyen <dinguyen@kernel.org>
In-Reply-To: <20250625151442.42191-1-matthew.gerlach@altera.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 6/25/25 10:14, Matthew Gerlach wrote:
> Add the clock-frequency property to the cb_intosc_ls_clk and
> cb_intosc_hs_div2_clk device tree nodes.
> 
> The f2s_free_clk is implemented by custom logic in the FPGA; so it
> should be disabled in the dtsi by default and enabled by a
> dts for a specific FPGA design on a specific board.
> 
> Signed-off-by: Matthew Gerlach <matthew.gerlach@altera.com>
> ---
>   arch/arm64/boot/dts/altera/socfpga_stratix10.dtsi | 3 +++
>   1 file changed, 3 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/altera/socfpga_stratix10.dtsi b/arch/arm64/boot/dts/altera/socfpga_stratix10.dtsi

Applied!

Dinh


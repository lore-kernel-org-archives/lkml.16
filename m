Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E66224C69B;
	Mon, 10 Feb 2025 22:29:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739226577; cv=none; b=IegEDrLN92WbCoWUgTwSaiQ9iu2ph7du4zPwV1Bg93faKae5dAMlItJhk2q0TGuGs+Rj+egjH51P1Vl8wBMcvqE2q4YcCz5o6lmneNoPXnCuf/wWDvru6TBJs0LlCU1aboPxTdguFukvX1c84hZ5RGHzepFhGyFKckG/HvyrvP4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739226577; c=relaxed/simple;
	bh=XBkjdB8FxhsInK3grQzoPMA65gXIywTvHXEKPbD9bxU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=EEBTJiKVFpjlb1VHlBVygZWRDcXdnlmZknp9UOHJ/9BzzQLnB9H/4BDzCP75mQpgXCdhEG0rWL9DmM5Mk0xQ/mBQSWJHDXp4nI4eYudZhQbJ0Uul/FuBCpSVVpQRbZnsq/ffwqeARpRQijuigZDSaSrbtWCNN3YBL0AfvNL9sRM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=C0giG28U; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="C0giG28U"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 71F91C4CED1;
	Mon, 10 Feb 2025 22:29:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1739226577;
	bh=XBkjdB8FxhsInK3grQzoPMA65gXIywTvHXEKPbD9bxU=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=C0giG28UAiz7YJCo1MQV3Ghf7mW+T2muZakV8fN3NbtkTCJQRcpc0BDgBs4tG1YHW
	 Kv0vitwdixfPRVEPFL2gAAuwF+dqDOVq9r0LUYeAWcW0/5YL72gVkW42s6L8LiQCKv
	 GwNy3C53s6N2mNRZnJvAgD4jA1+EAiDPmohUbbENZAiMXOrKfU3uPEJ7BfqHE3mtHL
	 FkLnRsrtwPm2xcASMJsFrEdGSH82IazZLKetHLa5vaSv11zDXM9L86O3maVDR8xfjD
	 RSKjVFqI6DHPuPb5gDIWMuXKEhfnKJUUJJghkMtwQzNblfGePOiF8J8PfsOLo18coo
	 LFNiaB5bYTdBg==
Message-ID: <45276881-11de-47c9-aa9c-488df537a596@kernel.org>
Date: Mon, 10 Feb 2025 16:29:34 -0600
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] ARM: dts: socfpga: remove syscon compatible string for
 sysmgr node
To: niravkumar.l.rabara@intel.com, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
Cc: kernel test robot <lkp@intel.com>
References: <20250117154244.4079614-1-niravkumar.l.rabara@intel.com>
Content-Language: en-US
From: Dinh Nguyen <dinguyen@kernel.org>
In-Reply-To: <20250117154244.4079614-1-niravkumar.l.rabara@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 1/17/25 09:42, niravkumar.l.rabara@intel.com wrote:
> From: Niravkumar L Rabara <niravkumar.l.rabara@intel.com>
> 
> The SoCFPGA System Manager(sysmgr) dt bindings do not use the syscon
> compitible, nor does the Linux system manager driver rely on it.
> Remove "syscon" for Arria5, Arria10 and Cyclon5 sysmgr node and fixed
> dtbs_check warnings like:
> 
> socfpga_arria5_socdk.dtb: sysmgr@ffd08000: compatible: 'oneOf' conditional failed, one must be fixed:
>     ['altr,sys-mgr', 'syscon'] is too long
>     'altr,sys-mgr-s10' was expected
>     'altr,sys-mgr' was expected
>     from schema $id: http://devicetree.org/schemas/soc/altera/altr,sys-mgr.yaml#
> 
> Reported-by: kernel test robot <lkp@intel.com>
> Closes: https://lore.kernel.org/oe-kbuild-all/202501102323.Xnte2yhi-lkp@intel.com/
> Signed-off-by: Niravkumar L Rabara <niravkumar.l.rabara@intel.com>
> ---
>   arch/arm/boot/dts/intel/socfpga/socfpga.dtsi         | 2 +-
>   arch/arm/boot/dts/intel/socfpga/socfpga_arria10.dtsi | 2 +-
>   2 files changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/arch/arm/boot/dts/intel/socfpga/socfpga.dtsi b/arch/arm/boot/dts/intel/socfpga/socfpga.dtsi
> index 35be14150f41..f124fb72e260 100644
> --- a/arch/arm/boot/dts/intel/socfpga/socfpga.dtsi
> +++ b/arch/arm/boot/dts/intel/socfpga/socfpga.dtsi
> @@ -853,7 +853,7 @@ spi1: spi@fff01000 {
>   		};
>   
>   		sysmgr: sysmgr@ffd08000 {
> -			compatible = "altr,sys-mgr", "syscon";
> +			compatible = "altr,sys-mgr";
>   			reg = <0xffd08000 0x4000>;
>   		};
>   
> diff --git a/arch/arm/boot/dts/intel/socfpga/socfpga_arria10.dtsi b/arch/arm/boot/dts/intel/socfpga/socfpga_arria10.dtsi
> index 6b6e77596ffa..015120fb4b02 100644
> --- a/arch/arm/boot/dts/intel/socfpga/socfpga_arria10.dtsi
> +++ b/arch/arm/boot/dts/intel/socfpga/socfpga_arria10.dtsi
> @@ -792,7 +792,7 @@ scu: snoop-control-unit@ffffc000 {
>   		};
>   
>   		sysmgr: sysmgr@ffd06000 {
> -			compatible = "altr,sys-mgr", "syscon";
> +			compatible = "altr,sys-mgr";
>   			reg = <0xffd06000 0x300>;
>   			cpu1-start-addr = <0xffd06230>;
>   		};

Did you test this patch on actual hardware? Unless something has changed 
in the system manager driver, this will probably cause the system hang.

Dinh

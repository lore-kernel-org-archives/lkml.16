Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 88B2B1F942D;
	Tue, 11 Feb 2025 14:17:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739283432; cv=none; b=NqETVmpXrtky5QmWLVwwFPqO+yjC50e9MoNt191yzOmRrIw07nJW5rBKs0GsdzN2spGFwe7GWyNZShENpmAhPsgzwOFbzkPsEHwzDnZV4pwxJU2JHi0hM8l5mFEwXXEPPbmnzG/N71vcVGsDfpyY7RTJ4miiN6cuf6W7iEQales=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739283432; c=relaxed/simple;
	bh=6Hy6BH8y0RHlOoaA0+wIPMx7hUagCP6QeLxk+ZJ5qHs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=YIjCKCQPeUv1GNMf0Iy09ED+2dxPYr37obXTfbACFoO1YZAPbhwylwn4qh1WAjnnaYxgbqhNq4wjZqBrcXkmrF+jM+NOTPpiVG2Yz1ovuNU+ddaLb4XCP3XJRGD882WVZ+GLv6o7HlO+aMloR4FM1KrCLU9R6hYwRZDjpb0kXXg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=UXpgDgvU; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="UXpgDgvU"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EE184C4CEDD;
	Tue, 11 Feb 2025 14:17:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1739283432;
	bh=6Hy6BH8y0RHlOoaA0+wIPMx7hUagCP6QeLxk+ZJ5qHs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=UXpgDgvUAfn4C5eikO1uR4hk9tNAo1B3FsOLiPacbg50590NKsrpSSEhQKFFPLAGH
	 1JMK/y1StcQ6GD0jLbWJPFRa6OfRQLEsZlGpAf2RJYoO3ExW9piglzTHFN5VRbIh4+
	 ffCPbLbSbskYSo29LweN9UcI6huJZ8F3qXGurRSqXjczKDbJHCBTGvtN1eI9KH2bCE
	 UJj1jAamlejRQSCJxmL4+8B2W+JsaWc8YKC9rUlaERpe1mRV+VlwE27g2BuMwF1Ba1
	 Bvuy8a1wHZ3p0WiGDAkcY5Dy7UB0mnVgdNhfaizNUlzkiyciBQvuvB9+na5XkfJK7G
	 cjqDqQJnO0d2A==
Received: from johan by xi.lan with local (Exim 4.97.1)
	(envelope-from <johan@kernel.org>)
	id 1thr4g-000000008Fv-4Bry;
	Tue, 11 Feb 2025 15:17:19 +0100
Date: Tue, 11 Feb 2025 15:17:18 +0100
From: Johan Hovold <johan@kernel.org>
To: chester.a.unal@arinc9.com
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
	dwayne Du Preez <dwayne.dupreez@xpedite-tech.com>,
	Alexander Scholten <alexander.scholten@xpedite-tech.com>,
	Zenon van Deventer <zenon@xpedite-tech.com>
Subject: Re: [PATCH v2] USB: serial: option: add MeiG Smart SLM828
Message-ID: <Z6tb7us7t7CmK-zV@hovoldconsulting.com>
References: <20250124-for-johan-meig-slm828-v2-1-6b4cd3f6344f@arinc9.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250124-for-johan-meig-slm828-v2-1-6b4cd3f6344f@arinc9.com>

On Fri, Jan 24, 2025 at 10:28:00AM +0000, Chester A. Unal via B4 Relay wrote:
> From: "Chester A. Unal" <chester.a.unal@arinc9.com>
> 
> MeiG Smart SLM828 is an LTE-A CAT6 modem with the mPCIe form factor. The
> "Cls=ff(vend.) Sub=10 Prot=02" and "Cls=ff(vend.) Sub=10 Prot=03"
> interfaces respond to AT commands. Add these interfaces.
> 
> The product ID the modem uses is shared across multiple modems. Therefore,
> add comments to describe which interface is used for which modem.
> 
> T:  Bus=01 Lev=01 Prnt=05 Port=01 Cnt=01 Dev#=  6 Spd=480  MxCh= 0
> D:  Ver= 2.10 Cls=00(>ifc ) Sub=00 Prot=00 MxPS=64 #Cfgs=  1
> P:  Vendor=2dee ProdID=4d22 Rev=05.04
> S:  Manufacturer=MEIG
> S:  Product=LTE-A Module
> S:  SerialNumber=4da7ec42
> C:  #Ifs= 6 Cfg#= 1 Atr=80 MxPwr=500mA
> I:  If#= 0 Alt= 0 #EPs= 2 Cls=ff(vend.) Sub=10 Prot=01 Driver=(none)
> E:  Ad=01(O) Atr=02(Bulk) MxPS= 512 Ivl=0ms
> E:  Ad=81(I) Atr=02(Bulk) MxPS= 512 Ivl=0ms
> I:  If#= 1 Alt= 0 #EPs= 3 Cls=ff(vend.) Sub=10 Prot=02 Driver=(none)
> E:  Ad=02(O) Atr=02(Bulk) MxPS= 512 Ivl=0ms
> E:  Ad=82(I) Atr=02(Bulk) MxPS= 512 Ivl=0ms
> E:  Ad=83(I) Atr=03(Int.) MxPS=  10 Ivl=32ms
> I:  If#= 2 Alt= 0 #EPs= 3 Cls=ff(vend.) Sub=10 Prot=03 Driver=(none)
> E:  Ad=03(O) Atr=02(Bulk) MxPS= 512 Ivl=0ms
> E:  Ad=84(I) Atr=02(Bulk) MxPS= 512 Ivl=0ms
> E:  Ad=85(I) Atr=03(Int.) MxPS=  10 Ivl=32ms
> I:  If#= 3 Alt= 0 #EPs= 3 Cls=ff(vend.) Sub=10 Prot=04 Driver=(none)
> E:  Ad=04(O) Atr=02(Bulk) MxPS= 512 Ivl=0ms
> E:  Ad=86(I) Atr=02(Bulk) MxPS= 512 Ivl=0ms
> E:  Ad=87(I) Atr=03(Int.) MxPS=  10 Ivl=32ms
> I:  If#= 4 Alt= 0 #EPs= 1 Cls=ff(vend.) Sub=ff Prot=ff Driver=(none)
> E:  Ad=88(I) Atr=03(Int.) MxPS=  64 Ivl=32ms
> I:  If#= 5 Alt= 0 #EPs= 3 Cls=ff(vend.) Sub=10 Prot=05 Driver=qmi_wwan
> E:  Ad=0f(O) Atr=02(Bulk) MxPS= 512 Ivl=0ms
> E:  Ad=89(I) Atr=03(Int.) MxPS=   8 Ivl=32ms
> E:  Ad=8e(I) Atr=02(Bulk) MxPS= 512 Ivl=0ms
> 
> Signed-off-by: Chester A. Unal <chester.a.unal@arinc9.com>

> Changes in v2:
> - Add to the relevant comment that SLM828 is based on Qualcomm SDX12.
> - Add to the comment for certain interface specification that SRM815
>   uses that interface specificiation as well.
> - Link to v1: https://lore.kernel.org/r/20250123-for-johan-meig-slm828-v1-1-6456996e94a5@arinc9.com
 
>  /* MeiG Smart Technology products */
>  #define MEIGSMART_VENDOR_ID			0x2dee
> -/* MeiG Smart SRM815/SRM825L based on Qualcomm 315 */
> +/* MeiG Smart SLM828, SRM815, and SRM825L use the same product ID. SLM828 is
> + * based on Qualcomm SDX12. SRM815 and SRM825L are based on Qualcomm 315.
> + */

Thanks for the patch and for documenting how these entries are related
(here and below).

I fixed up the multi-line comment above to follow the usual style:

	/*
	 * ...
	 */

when applying.

Johan

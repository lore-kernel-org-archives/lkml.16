Received: from layka.disroot.org (layka.disroot.org [178.21.23.139])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4734C2E401;
	Sat, 10 May 2025 08:02:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=178.21.23.139
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746864177; cv=none; b=J1C7ZVVsBtiP2z1aheQhKUqTs/PevzLF0KgjlqtyCZ6X54cdTwQxJiX0CG8T6kLZVOKSmhSpWThQyFL+MAEVQdCsFp1Yy3r0ktfrmuvzRorrlPFrZTqjhn+yU79S7HjTm4C6rM49n3d82AvOJXAZwWOJz8bAjHymqse0isdsZrE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746864177; c=relaxed/simple;
	bh=TgGotephKsM3CZvFEOAbmICkRQqBI40OGkRN9uP0W/s=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=BoLiqGSUZooISlj1bKniLeiM6Ng13ExvGc7X83bsET2tUvcGjGOTjZ8FbOlFjdQSW/p/Xd+dguwY65XGP5QKkHP6r2Xy9EB/LV6MyN6KXdomT4lOq5bECNltAlz12zFGLBwTp3bCxHAipvfJh/JhK3ARAhorZ2lAygfb0zlrw6g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=disroot.org; spf=pass smtp.mailfrom=disroot.org; dkim=pass (2048-bit key) header.d=disroot.org header.i=@disroot.org header.b=Cp+2ur12; arc=none smtp.client-ip=178.21.23.139
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=disroot.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=disroot.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=disroot.org header.i=@disroot.org header.b="Cp+2ur12"
Received: from mail01.disroot.lan (localhost [127.0.0.1])
	by disroot.org (Postfix) with ESMTP id 9416225F87;
	Sat, 10 May 2025 10:02:52 +0200 (CEST)
X-Virus-Scanned: SPAM Filter at disroot.org
Received: from layka.disroot.org ([127.0.0.1])
 by localhost (disroot.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id EgI7a7q_e3sx; Sat, 10 May 2025 10:02:51 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=disroot.org; s=mail;
	t=1746864163; bh=TgGotephKsM3CZvFEOAbmICkRQqBI40OGkRN9uP0W/s=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=Cp+2ur12X9YGgScUvhME4HTmlhADbBWK3Mc1HfKlC0WDvtn8pMHmpH0iY3wshCc3b
	 J+OfKmC0aZ82LgU9l4Sbi8PtgAh5icWcVRLWeVJ65H4xG9m26/59YWP0/ExK4gVhZ0
	 SPXYlEniuB953XVt92CAXcvVdLa8esWewf+AudhTRQSHu8liVU53tb6+BEoSypY3dF
	 k5waeYzDnbt7oSOtZ3PVgY/xjOxksCHx6KlVaH90hSsib3EDh7mG5V0cBz/lwzn891
	 3dfbggHa9kwQynBCS+3B9Y2MT3VoxNzVFc2KtR7CHBFMFYWSaLHnNd4DAt7m/tdk3b
	 LdqART5uD+xcw==
Date: Sat, 10 May 2025 08:02:29 +0000
From: Yao Zi <ziyao@disroot.org>
To: Jonas Karlman <jonas@kwiboo.se>, Heiko Stuebner <heiko@sntech.de>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: Chukun Pan <amadeus@jmu.edu.cn>, linux-rockchip@lists.infradead.org,
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 0/2] rockchip: Enable Ethernet controller on Radxa E20C
Message-ID: <aB8IFYq2uPPXm0HX@pie.lan>
References: <20250509202402.260038-1-jonas@kwiboo.se>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250509202402.260038-1-jonas@kwiboo.se>

On Fri, May 09, 2025 at 08:23:56PM +0000, Jonas Karlman wrote:
> The Rockchip RK3528 has two Ethernet controllers, one 100/10 MAC to be
> used with the integrated PHY and a second 1000/100/10 MAC to be used
> with an external Ethernet PHY.
> 
> This series add device tree nodes for the Ethernet controllers found in
> RK3528 and enable the LAN interface on Radxa E20C.
> 
> This include a gmac0 node for the 100/10 MAC and its related integrated
> PHY node that only have recived limited testing. I have no board that
> expose an Ethernet port for the gmac0 and the integrated PHY. However,
> the PHY can be identified on addr 0x2 as 0044.1400 and in vendor kernel
> this relate to the Rockchip RK630 PHY. A proper PHY driver will be
> needed to support any real use of gmac0.
> 
> Changes in v3:
> - Rebase on top of latest mmind/for-next
> 
> Changes in v2:
> - Split from the "Add GMAC support for RK3528" driver series [1]
> - Add ethernet-phy@2 for the integrated PHY
> - Rebase on top of the "Support I2C controllers in RK3528" series [2]
> 
> [1] https://lore.kernel.org/r/20250309232622.1498084-1-jonas@kwiboo.se
> [2] https://lore.kernel.org/r/20250309070603.35254-1-ziyao@disroot.org
> 
> Jonas Karlman (2):
>   arm64: dts: rockchip: Add GMAC nodes for RK3528
>   arm64: dts: rockchip: Enable Ethernet controller on Radxa E20C
> 
>  .../boot/dts/rockchip/rk3528-radxa-e20c.dts   |  30 +++++
>  arch/arm64/boot/dts/rockchip/rk3528.dtsi      | 105 ++++++++++++++++++
>  2 files changed, 135 insertions(+)

On my Radxa E20C board, iperf3 shows the interface could run at roughly
1Gbps with this series,

# iperf3 -c 192.168.114.51
Connecting to host 192.168.114.51, port 5201
[  5] local 192.168.114.50 port 41894 connected to 192.168.114.51 port 5201
[ ID] Interval           Transfer     Bitrate         Retr  Cwnd
[  5]   0.00-1.00   sec   113 MBytes   948 Mbits/sec    0    380 KByes
[  5]   1.00-2.00   sec   112 MBytes   944 Mbits/sec    0    399 KBytes
[  5]   2.00-3.00   sec   112 MBytes   940 Mbits/sec    0    399 KBytes
[  5]   3.00-4.00   sec   112 MBytes   942 Mbits/sec    0    399 KBytes
[  5]   4.00-5.00   sec   112 MBytes   944 Mbits/sec    0    399 KBytes
[  5]   5.00-6.00   sec   112 MBytes   940 Mbits/sec    0    399 KBytes
[  5]   6.00-7.00   sec   112 MBytes   940 Mbits/sec    0    399 KBytes
[  5]   7.00-8.00   sec   112 MBytes   944 Mbits/sec    0    399 KBytes
[  5]   8.00-9.00   sec   112 MBytes   941 Mbits/sec    0    399 KBytes
[  5]   9.00-10.00  sec   112 MBytes   941 Mbits/sec    0    399 KBytes
- - - - - - - - - - - - - - - - - - - - - - - - -
[ ID] Interval           Transfer     Bitrate         Retr
[  5]   0.00-10.00  sec  1.10 GBytes   942 Mbits/sec    0            sender
[  5]   0.00-10.00  sec  1.10 GBytes   941 Mbits/sec                  receiver

iperf Done.

Tested-by: Yao Zi <ziyao@disroot.org>

Thanks for your work!

> -- 
> 2.49.0
> 

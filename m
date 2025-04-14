Received: from sender4-pp-f112.zoho.com (sender4-pp-f112.zoho.com [136.143.188.112])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EB96A192D6B;
	Mon, 14 Apr 2025 18:31:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.188.112
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744655472; cv=pass; b=NU+MEJ93Ydn5e9P0EXQXhalMKtGf98XU7I9uVJfYMlAKprr2YsFOMhmweIxAhO8oJTNR8TbVuXkIBmTOCUlkgVcrABS/yLyjkPEw88VkhsaCUbjJVwXHFIthU5tb44fyVGBdLR+2qtCuBd6ozQD+YgGHamLR0N3IJ1VigQ9h+ZU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744655472; c=relaxed/simple;
	bh=nvfI6Dtjl9c8eSOHzN5OCdhlcKHF1Xh3nblGQq//xxs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=IeGshxuTcNH31/qnDmBSVjhrinPRiwFihQqHOQX4I210mbG9sRBhDlhWB3Z/sUdectzHTuKdvmE320XpgZjS5p9f9J17KUK3OjtLHSSR9sIqHI/KHAYs+wwde/yW9tLnqsR1AvxfMIM8533LoI9C0MjwrnyloQ1AwgCbfrYgmwg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (1024-bit key) header.d=collabora.com header.i=nicolas.frattaroli@collabora.com header.b=A9M8M+KD; arc=pass smtp.client-ip=136.143.188.112
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=collabora.com header.i=nicolas.frattaroli@collabora.com header.b="A9M8M+KD"
ARC-Seal: i=1; a=rsa-sha256; t=1744655447; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=aK9QbFLPjjNWwlAHM+7jqXXYkZSyotrm4OpqYBZ6Z+7vjhqlvez1f+PL379uk9xzqoSF6iITw0vcbLi/5d56FqTSxfckQ8bVg5OlU5oCF3kg4cd/t22MRnH8JVTkmi91wGUqj/PNsc2dHlDKILWgCHoGv596aKqZGHKYDCjqwiA=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1744655447; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=0W68kifwClbmxOD9uB2cLoC+ZOmDFfEOuSDxczncg7A=; 
	b=NnanDKGIw2jbi6e5Xc8Wy7BWebenhI2JPjGlWQZaOSjFO/+adLpumbi87vt34Pw9mygqSwkmkjWTIbSQKpBMHvR5Ce9B0Wlk/LiqOkwmLtFuKdfMt3clvw1c54CtQ49kEH49mBfTBBzoFLO/2aVawi+VBEAGE7vkb6hem77sVRI=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=nicolas.frattaroli@collabora.com;
	dmarc=pass header.from=<nicolas.frattaroli@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1744655447;
	s=zohomail; d=collabora.com; i=nicolas.frattaroli@collabora.com;
	h=From:From:To:To:Cc:Cc:Subject:Subject:Date:Date:Message-ID:In-Reply-To:References:MIME-Version:Content-Transfer-Encoding:Content-Type:Message-Id:Reply-To;
	bh=0W68kifwClbmxOD9uB2cLoC+ZOmDFfEOuSDxczncg7A=;
	b=A9M8M+KDKMG7ngJrCcR8EyH1YFAWoOsBiMjvc5f7DXQ9x4mceV+16Cb+JYnRFbp5
	eMN9g8GulITK60NJnEJuO3cH3+5U6KzGHHzzub8twfHPEIJQdWiKFIJ5hp1zIgDdA2t
	lqyBWjpaLaPs6cnIcPL++Vy6dfuJ4pV/lyRvktOI=
Received: by mx.zohomail.com with SMTPS id 1744655444841430.53710170104966;
	Mon, 14 Apr 2025 11:30:44 -0700 (PDT)
From: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
To: heiko@sntech.de, Kever Yang <kever.yang@rock-chips.com>
Cc: andersson@kernel.org, Kever Yang <kever.yang@rock-chips.com>,
 Shawn Lin <Shawn.lin@rock-chips.com>, Conor Dooley <conor+dt@kernel.org>,
 Finley Xiao <finley.xiao@rock-chips.com>,
 Frank Wang <frank.wang@rock-chips.com>, Rob Herring <robh@kernel.org>,
 Detlev Casanova <detlev.casanova@collabora.com>,
 linux-kernel@vger.kernel.org, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 linux-rockchip@lists.infradead.org, devicetree@vger.kernel.org,
 Andy Yan <andy.yan@rock-chips.com>, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v9 2/2] arm64: dts: rockchip: Add rk3576 pcie nodes
Date: Mon, 14 Apr 2025 20:30:38 +0200
Message-ID: <5019259.31r3eYUQgx@workhorse>
In-Reply-To: <20250414145110.11275-3-kever.yang@rock-chips.com>
References:
 <20250414145110.11275-1-kever.yang@rock-chips.com>
 <20250414145110.11275-3-kever.yang@rock-chips.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="utf-8"

On Monday, 14 April 2025 16:51:10 Central European Summer Time Kever Yang wrote:
> rk3576 has two pcie controllers, both are pcie2x1 work with
> naneng-combphy.
> 
> Signed-off-by: Kever Yang <kever.yang@rock-chips.com>
> Tested-by: Shawn Lin <Shawn.lin@rock-chips.com>
> ---
> 
> Changes in v9:
> - rebase on 6.15-rc1
> - Add test tag
> 
> Changes in v8: None
> Changes in v7:
> - re-order the properties.
> 
> Changes in v6: None
> Changes in v5: None
> Changes in v4: None
> Changes in v3:
> - Update the subject
> 
> Changes in v2:
> - Update clock and reset names and sequence to pass DTB check
> 
>  arch/arm64/boot/dts/rockchip/rk3576.dtsi | 108 +++++++++++++++++++++++
>  1 file changed, 108 insertions(+)
> 

Reviewed-by: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
Tested-by: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>

Successfully used this on an ArmSoM Sige5 RK3576 board. PCIe works.
Properties look correct, though the `ranges = ` doesn't separate out the
different ranges into individual `<cells>` but this doesn't seem to make
any difference and doesn't cause any warnings either. The only added
warning is "simple-bus unit address format error" which seems like a
bug in the thing generating the warning and not the device-tree itself,
as it doesn't seem to notice that the address of the node is within the
regs array, just not as the first cell.

I think this looks good for merging, I'll also send out a Sige5 enablement
patch shortly.

Thank you!

Regards,
Nicolas Frattaroli



Received: from sender4-pp-f112.zoho.com (sender4-pp-f112.zoho.com [136.143.188.112])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C58B42356C4;
	Tue, 27 May 2025 11:54:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.188.112
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748346889; cv=pass; b=G6/lyGMuGFzw+MLfAY5BsGsObruNKPOwv4jH1lmCIUzGc06a4Swqn9ZTkBflVuWYle74gAdSoML0Y5KJiSBLH5QQOT/HvFxAjaxi2xQWz+Mm60XbTNIhF2T9cXINo/TH1VBFGf6mnDt38fakirUZq1DbgdSRoz3qdMk6oeQ28qM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748346889; c=relaxed/simple;
	bh=NEwk7I7SHSJAjw5uUzDG2MT+rXVOnWpvGxj+6l66YSU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=S8NLt3fMNSoDMf879zLExz2ReisSDgboFceDryxHMYvr05igOI0JOmCmBuW7WIHd18U70aEUVNZpU/nNw3Q1Y8e0a/b+llKQvFI7pl8qdz+LfXsdPSYIDTftqx9G1UiJcJRPH2fZewesMcSo6TLo0nNMvD0X5HKV/iiTJG/hLdQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (1024-bit key) header.d=collabora.com header.i=nicolas.frattaroli@collabora.com header.b=VoZxWQ2I; arc=pass smtp.client-ip=136.143.188.112
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=collabora.com header.i=nicolas.frattaroli@collabora.com header.b="VoZxWQ2I"
ARC-Seal: i=1; a=rsa-sha256; t=1748346843; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=XV4cwb62i9jbfKhN5YxgyKOpblJwfCS4esxG/Hl5r6XTpy40Ks+5/1Wxsd4w8d21C6Dp62xx6je0WdS5MTyeykTxg67JcVSGikhCIm/O6cl1ZZ6JGkoiFOXR0Ep/5XhGo05KKyDkggAUIA7oMl05BMaHL1Te9iI7/u/Jf65ZzvE=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1748346843; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=9yF1OUbT1bqu1NB/QJlao6B5ghagW3BtXAYQCUIhaR8=; 
	b=Gfkxm9jbtRrUfZKi7vd0MLCn17HN0fTuH0PE0T8to3nJrkG77bwnm6RboXX0cZzK6YF06ZMxxVs6n/I3rbrkvGBMFvQ3W8erU29SfjqnJnv4+MlS8+sF3NxBKox73Iaj213zsH2AOpiwN953faCyfT69hURKY81Qeyy/gjs3Om8=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=nicolas.frattaroli@collabora.com;
	dmarc=pass header.from=<nicolas.frattaroli@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1748346843;
	s=zohomail; d=collabora.com; i=nicolas.frattaroli@collabora.com;
	h=From:From:To:To:Cc:Cc:Subject:Subject:Date:Date:Message-ID:In-Reply-To:References:MIME-Version:Content-Transfer-Encoding:Content-Type:Message-Id:Reply-To;
	bh=9yF1OUbT1bqu1NB/QJlao6B5ghagW3BtXAYQCUIhaR8=;
	b=VoZxWQ2IeFTd9cH4jQs4r4SzlZGf39Y8YHF1/y1CWVxa5UISmlLhsyWOZ28/0xhH
	2WMDvv4/ZWr0FFF6+E0hJrKdnOiiKDwITtJrPR87WtwuFTgJ5c3h48Yz34khg77dbv8
	dJTwToJj2bygZxc3nM1BD6O9SErZnnyiv/vmezUU=
Received: by mx.zohomail.com with SMTPS id 1748346840882568.0136270447825;
	Tue, 27 May 2025 04:54:00 -0700 (PDT)
From: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
To: heiko@sntech.de, linux-rockchip@lists.infradead.org,
 Andy Yan <andyshrk@163.com>
Cc: simic@manjaro.org, krzk+dt@kernel.org, robh@kernel.org,
 devicetree@vger.kernel.org, conor+dt@kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-rockchip@lists.infradead.org, algea.cao@rock-chips.com,
 Andy Yan <andy.yan@rock-chips.com>
Subject:
 Re: [PATCH v2] arm64: dts: rockchip: Adjust the HDMI DDC IO driver strength
 for rk3588
Date: Tue, 27 May 2025 13:53:56 +0200
Message-ID: <3704844.aeNJFYEL58@workhorse>
In-Reply-To: <20250522020537.1884771-1-andyshrk@163.com>
References: <20250522020537.1884771-1-andyshrk@163.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="utf-8"

On Thursday, 22 May 2025 04:05:24 Central European Summer Time Andy Yan wrote:
> From: Andy Yan <andy.yan@rock-chips.com>
> 
> For the RK3588 HDMI controller, the falling edge of DDC SDA and SCL
> almost coincide and cannot be adjusted by HDMI registrer, resulting
> in poor compatibility of DDC communication.
> 
> An improvement of the compatibility of DDC can be done by increasing
> the driver strength of SCL and decreasing the driver strength of SDA
> to increase the slope of the falling edge.
> 
> It should be noted that the maximum driving strength of hdmim0_tx1_scl
> is only 3, which is different from that of the other IOs.
> 
> Signed-off-by: Andy Yan <andy.yan@rock-chips.com>
> 
> ---
> 
> Changes in v2:
> - Correct the max drive level of hdmim0_tx1_scl.
> 
>  .../dts/rockchip/rk3588-base-pinctrl.dtsi     | 20 +++++------
>  .../dts/rockchip/rk3588-extra-pinctrl.dtsi    |  5 +--
>  .../boot/dts/rockchip/rockchip-pinconf.dtsi   | 35 +++++++++++++++++++
>  3 files changed, 48 insertions(+), 12 deletions(-)
> 

Tested-by: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>

Quickly tested this on both HDMI ports of a ROCK 5T with an HDMI capture
card on the other end. While I didn't originally have any issues to begin
with, this patch does not introduce any new ones, so seems good to me.



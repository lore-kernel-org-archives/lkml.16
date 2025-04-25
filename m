Received: from smtp.gentoo.org (woodpecker.gentoo.org [140.211.166.183])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C2DA2F2A;
	Fri, 25 Apr 2025 04:47:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.183
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745556474; cv=none; b=D7IgoVMBs+QIGpBJiQTcpAsvky7AuJVXi2/V2X21yM8/zokU3jI3y6zL4N6lAu1X0qQeeEW8ntrBenXnLdbkSzXbTNFkEr0jA/H85e4nElvXFrD8ruQW7egMBtTTfgL+j7l4IxPDMW2S7dOmEdCZmAL1kjLaTMfdPN9ZqB+iJ6A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745556474; c=relaxed/simple;
	bh=H/o4DAJaxSxbmykQzcz3r28hpuKCsdPEhQqzPot3dxQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=oYjuognn66gPn1pSibxbxKXUQdlj3Ot+ZYe7eJmjW/Pfaw7r+FnVgajvJji4UaT6+WKh44+Wmnl6Xwut9Xiuye8GX0abfFacG5UdvKe33g0qCzDt2IijuCY3aMY9+CxmfXscykzUirQpxugbKLUoRxkvk1MFSk8Wo5/ioAI9AkY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gentoo.org; spf=pass smtp.mailfrom=gentoo.org; arc=none smtp.client-ip=140.211.166.183
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gentoo.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gentoo.org
Received: from localhost (unknown [116.232.18.95])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: dlan)
	by smtp.gentoo.org (Postfix) with ESMTPSA id 21DF3340C76;
	Fri, 25 Apr 2025 04:47:51 +0000 (UTC)
Date: Fri, 25 Apr 2025 04:47:47 +0000
From: Yixun Lan <dlan@gentoo.org>
To: Chen-Yu Tsai <wens@csie.org>
Cc: Chukun Pan <amadeus@jmu.edu.cn>, andre.przywara@arm.com,
	conor+dt@kernel.org, devicetree@vger.kernel.org,
	jernej.skrabec@gmail.com, krzk+dt@kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-sunxi@lists.linux.dev, robh@kernel.org, samuel@sholland.org
Subject: Re: [PATCH 1/1] arm64: dts: allwinner: correct the model name for
 Radxa Cubie A5E
Message-ID: <20250425044747-GYA50408@gentoo>
References: <20250425023527-GYA50272@gentoo>
 <20250425030006.45169-1-amadeus@jmu.edu.cn>
 <CAGb2v649ntfAEUdV5S1wM8nUGhvaOP-RBw07XcxwdbafbC2PYQ@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAGb2v649ntfAEUdV5S1wM8nUGhvaOP-RBw07XcxwdbafbC2PYQ@mail.gmail.com>

Hi Chukun, Chen-Yu,

On 11:52 Fri 25 Apr     , Chen-Yu Tsai wrote:
> On Fri, Apr 25, 2025 at 11:00 AM Chukun Pan <amadeus@jmu.edu.cn> wrote:
> >
> > Hi,
> >
> > > It seems I'm a little bit late for this, but while we are here,
> > > Can we also append 'cubie' to dts file name?
> > > e.g. - sun55i-a527-radxa-cubie-a5e.dts
> >
> > Usually we use the device name (without the vendor name),
> > maybe sun55i-a527-cubie-a5e.dts would be better?
> 
> I agree with this one.
> 
I personally would prefer to keep vendor name, it's more explicit
and easy for poeple to distinguish/find the board dts

but, this isn't something I really care, so I won't insist on this,
please proceed either way, thanks

> I can probably squash in a name change (since I'll be squashing in the
> SD card slot fix anyway). Andre?
> 
I think it is better

> 
> In that case would you prefer to keep your current patch separate, or
> squashed in so that everything is clean from the first commit?
> 
> It's up to you since you lose out on commit stats.
> 
> 
> Thanks
> ChenYu
> 
> > Thanks,
> > Chukun
> >
> > --
> > 2.25.1
> >
> >

-- 
Yixun Lan (dlan)

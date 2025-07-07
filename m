Received: from mail-m16.yeah.net (mail-m16.yeah.net [1.95.21.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 81CAF800;
	Mon,  7 Jul 2025 08:11:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=1.95.21.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751875896; cv=none; b=SwJTUz5B8GJ7hANj/5XlT5Vgq1XZnTw7dzaeUisKDYhr3nti9KfeZD+1DZ4fAPEEwejq2Gf7Oe1TbYjZPshxtMZ7C8tg99nrSa6NubqobjeY8ZGX4LBT6T7wL7WmoHOKy7bIdJEJ6f5SYYAYIpXZEGyPXpL5ahX7zDlnmfqrDeE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751875896; c=relaxed/simple;
	bh=Kq5pU6gDzEffrT+9dFMbOU6haoLKeyQPRrR7upar/HY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=XXOKpZFwSc2Wb4Po9Q5x7kcyy7DRzC6xA6csH8jh9VybWG6nEqOvgIRnYpdgpmqC6csKI9254fiCFYdv5IT9x1L2ux3NJn7ybdge1xrJBOB8AAai7zF7VWOUEtwAZm1I0FHF5iZr929H7OFVSnDJ4qytKe42lY3s0NEHKC4DEtI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=yeah.net; spf=pass smtp.mailfrom=yeah.net; dkim=pass (1024-bit key) header.d=yeah.net header.i=@yeah.net header.b=LHnDhd9G; arc=none smtp.client-ip=1.95.21.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=yeah.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=yeah.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=yeah.net header.i=@yeah.net header.b="LHnDhd9G"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yeah.net;
	s=s110527; h=Date:From:To:Subject:Message-ID:MIME-Version:
	Content-Type; bh=wYX/8ebPYdpS41EyMmngCwqiXAfSXeLhLg4jCU+kiWA=;
	b=LHnDhd9GsZXNX1ANay97WouX3tk3XrUeICgpM53urvzr1D7DXARWl9dysQoJlB
	R0zHDZe6yMOwl7p7eQPlCbFIWcembZzb1GCmVjNIgVHRhVAjBse4l2FhsNG5XyJm
	xkykdDU3lBJ893oXW7Ffiyob9/rjaQjdCS5TpWQLOruXI=
Received: from dragon (unknown [])
	by gzsmtp3 (Coremail) with SMTP id M88vCgDn_3v2gGtoAmE8AA--.26131S3;
	Mon, 07 Jul 2025 16:10:32 +0800 (CST)
Date: Mon, 7 Jul 2025 16:10:30 +0800
From: Shawn Guo <shawnguo2@yeah.net>
To: Bence =?iso-8859-1?B?Q3Pza+Fz?= <csokas.bence@prolan.hu>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, devicetree@vger.kernel.org,
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Lothar =?iso-8859-1?Q?Wa=DFmann?= <LW@karo-electronics.de>
Subject: Re: [PATCH] arm: DT: imx6: Replace license text comment with SPDX
 identifier
Message-ID: <aGuA9gJj2cpCfIZ2@dragon>
References: <20250626-karo-dts-lic-v1-1-315f43121aaa@prolan.hu>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250626-karo-dts-lic-v1-1-315f43121aaa@prolan.hu>
X-CM-TRANSID:M88vCgDn_3v2gGtoAmE8AA--.26131S3
X-Coremail-Antispam: 1Uf129KBjvdXoW7JryfAF1UGF4DWF18Ww4rKrg_yoW3AFX_ua
	y8Xw1UAw4agF48KrWfuF1avasrKFWDZr17XwsYqFy7Aa4qqrZ8XFnYgr90vr1DGa1fJrnr
	uFy5J3y2yw17CjkaLaAFLSUrUUUUjb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
	9fnUUvcSsGvfC2KfnxnUUI43ZEXa7IUbSksDUUUUU==
X-CM-SenderInfo: pvkd40hjxrjqh1hdxhhqhw/1tbiIRhTuGhrgPgalAAA3n

On Thu, Jun 26, 2025 at 11:19:56AM +0200, Bence Csókás wrote:
> Replace verbatim license text with a SPDX-License-Identifier:
> 
> The comment heades mis-attributes this license to be "X11", but the
> license text does not include the last line "Except as contained in this
> notice, the name of the X Consortium shall not be used in advertising or
> otherwise to promote the sale, use or other dealings in this Software
> without prior written authorization from the X Consortium.". Therefore,
> this license is actually equivalent to the SPDX "MIT" license (confirmed
> by text diffing).
> 
> Cc: Lothar Waßmann <LW@KARO-electronics.de>
> Signed-off-by: Bence Csókás <csokas.bence@prolan.hu>

Applied with a bit change on subject prefix:

  ARM: dts: imx6-tx: ... 

Shawn


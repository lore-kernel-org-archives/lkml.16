Received: from bayard.4d2.org (bayard.4d2.org [155.254.16.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C04520E005;
	Thu,  8 May 2025 04:47:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=155.254.16.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746679641; cv=none; b=cyTyS08ESAMqpzUJYbzPX3j+HNIseUZQbNt1Eo51+VlKXErL/l1o49Fg1QTF/8nJ33NQRUnLHVB7iRDYr/oEklpyThn2dG56ydJdBlfxawncafpnHh81wcEK9gMBgFGVM6HAuSnwwwKWX9/GcKW64b3U1MlgkoFvvbTank336Io=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746679641; c=relaxed/simple;
	bh=e/P4+/XU5LouXeXa4I9PIC8t3qnOxk9ewZlbp+f9Ilk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=kcNTFbYKU60OpkXeSeqcF0SvtAvXUrsBnKSa6SMYtK9WG1zrwBnQOZLLi/V5pEYRramFdr6GI/IEYwl18T5FdP4ffagEQr33c3vetegH+lLrZUw6pwNAnvmRmkkPRpNwNEtndV2hAcI0xHVBN109S2XUJk7V64Xvgh0TuhTP/70=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=4d2.org; spf=pass smtp.mailfrom=4d2.org; dkim=pass (2048-bit key) header.d=4d2.org header.i=@4d2.org header.b=SaC/IPrJ; dkim=pass (2048-bit key) header.d=4d2.org header.i=@4d2.org header.b=GGIu25Jc; arc=none smtp.client-ip=155.254.16.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=4d2.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=4d2.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=4d2.org header.i=@4d2.org header.b="SaC/IPrJ";
	dkim=pass (2048-bit key) header.d=4d2.org header.i=@4d2.org header.b="GGIu25Jc"
Received: from bayard.4d2.org (bayard.4d2.org [127.0.0.1])
	by bayard.4d2.org (Postfix) with ESMTP id 81AD012FB439;
	Wed, 07 May 2025 21:47:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=4d2.org; s=mail;
	t=1746679637; bh=e/P4+/XU5LouXeXa4I9PIC8t3qnOxk9ewZlbp+f9Ilk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=SaC/IPrJUbgxUydNlXnWfhnLn/BGT5g0SHchKvIIGbGAuk8PUnQBbQmIEypysBcSt
	 0K1PSdXMOacxqBLILBaFqkRQ1T6jy0wBZ3moycRHp2JsUMU9Uw0a1o1KhOIK5VSjPA
	 YDIHx/DbLphl87c7lRNFvLPD42qebdrjomqrM7ks/JiEX0JNaoWqAq97d0JwS3/ZoF
	 zpoHl4KwK+nAFzaumgoHgAduv79zDZFvS4rRrIg0m1ZxH1kwLbLe36xqkcdRmuaawZ
	 DYSKAOgtfVRW4uYrw4oVLwmJtvPaGki6oRTjSB74BQLVQuCaxeMP+EpqXlRhL8+E+6
	 R4Huoj6O0eoYA==
X-Virus-Scanned: amavisd-new at 4d2.org
Received: from bayard.4d2.org ([127.0.0.1])
 by bayard.4d2.org (bayard.4d2.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Cr6EuxlS-V20; Wed,  7 May 2025 21:46:40 -0700 (PDT)
Received: from ketchup (unknown [183.217.82.204])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: heylenay@4d2.org)
	by bayard.4d2.org (Postfix) with ESMTPSA id 62CCD12FB404;
	Wed, 07 May 2025 21:46:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=4d2.org; s=mail;
	t=1746679600; bh=e/P4+/XU5LouXeXa4I9PIC8t3qnOxk9ewZlbp+f9Ilk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=GGIu25JcctzNnGEnFS2lVm5QZGmjFD6skk7MMUWRFgCumB/WY1axKqjUc4Wg+X8EE
	 m7kroffJQhK1Da2qF/kmfGqFTw/oH3/sYsL1K02oPPp42jubzJ7pvDg8wy0moMVLe0
	 d1Xlzul2oYZcXGsrOyAraYwKo5+KJZguNKol23J5dT6wK+XHz73QyUccV+6xf1DIce
	 ky29BbLNb+zA/BclXtGKnfg5y9FIlBJu/n9Jt8PgmtrNoaHdJjfd+vqPbNX7+RBXj7
	 roqKjR5o4GK3ttWym4bFIYSJe6WFBrufI212U7v9UGVh3DQzadcQ8+FLZDVVY5Jepg
	 D4xg7uLXY7FoA==
Date: Thu, 8 May 2025 04:46:32 +0000
From: Haylen Chu <heylenay@4d2.org>
To: Alex Elder <elder@riscstar.com>, robh@kernel.org, krzk+dt@kernel.org,
	conor+dt@kernel.org, mturquette@baylibre.com, sboyd@kernel.org,
	p.zabel@pengutronix.de, paul.walmsley@sifive.com,
	palmer@dabbelt.com, aou@eecs.berkeley.edu, alex@ghiti.fr,
	dlan@gentoo.org
Cc: inochiama@outlook.com, guodong@riscstar.com, devicetree@vger.kernel.org,
	linux-clk@vger.kernel.org, spacemit@lists.linux.dev,
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v6 3/6] clk: spacemit: set up reset auxiliary devices
Message-ID: <aBw3KNwjMeCIfnNR@ketchup>
References: <20250506210638.2800228-1-elder@riscstar.com>
 <20250506210638.2800228-4-elder@riscstar.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250506210638.2800228-4-elder@riscstar.com>

On Tue, May 06, 2025 at 04:06:34PM -0500, Alex Elder wrote:
> Add a new reset_name field to the spacemit_ccu_data structure.  If it is
> non-null, the CCU implements a reset controller, and the name will be
> used as the name for the auxiliary device that implements it.
> 
> Define a new type to hold an auxiliary device as well as the regmap
> pointer that will be needed by CCU reset controllers.  Set up code to
> initialize and add an auxiliary device for any CCU that implements reset
> functionality.
> 
> Make it optional for a CCU to implement a clock controller.  This
> doesn't apply to any of the existing CCUs but will for some new ones
> that will be added soon.
> 
> Signed-off-by: Alex Elder <elder@riscstar.com>
> ---
>  drivers/clk/spacemit/ccu-k1.c | 85 +++++++++++++++++++++++++++++++----
>  include/soc/spacemit/ccu_k1.h | 12 +++++
>  2 files changed, 89 insertions(+), 8 deletions(-)
> 
> diff --git a/drivers/clk/spacemit/ccu-k1.c b/drivers/clk/spacemit/ccu-k1.c
> index 9545cfe60b92b..6b1845e899e5f 100644
> --- a/drivers/clk/spacemit/ccu-k1.c
> +++ b/drivers/clk/spacemit/ccu-k1.c

...

> +static void spacemit_cadev_release(struct device *dev)
> +{
> +	struct auxiliary_device *adev = to_auxiliary_dev(dev);
> +
> +	kfree(to_spacemit_ccu_adev(adev));
> +}

spacemit_ccu_adev structures are allocated with devm_kzalloc() in
spacemit_ccu_reset_register(), which means its lifetime is bound to the
driver and it'll be automatically released after driver removal; won't
there be a possibility of double-free? I think the release callback
could be simply dropped.

...

> +static int spacemit_ccu_reset_register(struct device *dev,
> +				       struct regmap *regmap,
> +				       const char *reset_name)
> +{
> +	struct spacemit_ccu_adev *cadev;
> +	struct auxiliary_device *adev;
> +	static u32 next_id;
> +	int ret;
> +
> +	/* Nothing to do if the CCU does not implement a reset controller */
> +	if (!reset_name)
> +		return 0;
> +
> +	cadev = devm_kzalloc(dev, sizeof(*cadev), GFP_KERNEL);

Here spacemit_ccu_adev is allocated.

> +	if (!cadev)
> +		return -ENOMEM;
> +	cadev->regmap = regmap;
> +
> +	adev = &cadev->adev;
> +	adev->name = reset_name;
> +	adev->dev.parent = dev;
> +	adev->dev.release = spacemit_cadev_release;
> +	adev->dev.of_node = dev->of_node;
> +	adev->id = next_id++;
> +
> +	ret = auxiliary_device_init(adev);
> +	if (ret)
> +		return ret;
> +
> +	ret = auxiliary_device_add(adev);
> +	if (ret) {
> +		auxiliary_device_uninit(adev);
> +		return ret;
> +	}
> +
> +	return devm_add_action_or_reset(dev, spacemit_adev_unregister, adev);
> +}
> +

Best regards,
Haylen Chu

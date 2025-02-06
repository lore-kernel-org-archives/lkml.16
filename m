Received: from mail-m49220.qiye.163.com (mail-m49220.qiye.163.com [45.254.49.220])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 65BD61B7F4
	for <linux-kernel@vger.kernel.org>; Thu,  6 Feb 2025 01:53:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.254.49.220
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738806820; cv=none; b=adqf+SuF5uTpgdM7isM+XMQI3D/owSHKrjLOP8giv8C/xyjlA6EAgFMUr0t/GakjowppZmqT+enlzsJ+KBMXFSYvbLJSU4+UebSztj3eJXcneqb+tp7lGaPFJztVrmzkhOg4Uj0TwymwONfrYlxFZeFd/ftlytB+7mgAwykUiXw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738806820; c=relaxed/simple;
	bh=X0CUDcDHmjpvbIoz51hnk8KlJbu6iEbn9xwp50PgRuk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=KS6Y3wgfxoAWVzGuMhUyRYCreXx5ZbP3sNkU1PnF8So7Rxpw+vbpN+DkNl17teEzHbwJwIsxbBGRldyfl8mf5QXuXvoeuMQN9Fq0hWGhUQ7c3gTJges8T4OMQVVYERzCN8MXhl7wufaYGQ0WmD3c6T/dGPVpDdudRxcExN5l+Mg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rock-chips.com; spf=pass smtp.mailfrom=rock-chips.com; dkim=pass (1024-bit key) header.d=rock-chips.com header.i=@rock-chips.com header.b=UN6n1G5S; arc=none smtp.client-ip=45.254.49.220
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rock-chips.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rock-chips.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=rock-chips.com header.i=@rock-chips.com header.b="UN6n1G5S"
Received: from [172.16.12.26] (unknown [58.22.7.114])
	by smtp.qiye.163.com (Hmail) with ESMTP id a459f8a5;
	Thu, 6 Feb 2025 09:48:24 +0800 (GMT+08:00)
Message-ID: <465d8ecd-25bf-411e-8b12-95f88eb8620b@rock-chips.com>
Date: Thu, 6 Feb 2025 09:48:24 +0800
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] phy: core: don't require set_mode() callback for
 phy_get_mode() to work
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Vinod Koul <vkoul@kernel.org>, Kishon Vijay Abraham I <kishon@kernel.org>
Cc: linux-phy@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20250107-phy-fix-set-moe-v1-1-b3dfe9391672@linaro.org>
Content-Language: en-US
From: Damon Ding <damon.ding@rock-chips.com>
In-Reply-To: <20250107-phy-fix-set-moe-v1-1-b3dfe9391672@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFDSUNOT01LS0k3V1ktWUFJV1kPCRoVCBIfWUFZQklOGFZLTR1PGk4ZTx9PSExWFRQJFh
	oXVRMBExYaEhckFA4PWVdZGBILWUFZTkNVSUlVTFVKSk9ZV1kWGg8SFR0UWUFZT0tIVUpLSU9PT0
	hVSktLVUpCS0tZBg++
X-HM-Tid: 0a94d8f1abd603a3kunma459f8a5
X-HM-MType: 1
X-HM-Sender-Digest: e1kMHhlZQR0aFwgeV1kSHx4VD1lBWUc6OBw6OAw5HjIKQwlLAjMjLyka
	NTBPFAxVSlVKTEhDQ0tNTktOSU9LVTMWGhIXVR8aFhQVVR8SFRw7CRQYEFYYExILCFUYFBZFWVdZ
	EgtZQVlOQ1VJSVVMVUpKT1lXWQgBWUFKTUNJNwY+
DKIM-Signature:a=rsa-sha256;
	b=UN6n1G5SBJMCG5+EL85ZCWAcyzd4m+NGNoLAmD5XCnU7Oql0EYGWDljLJ37UfS6HtQS1VtdVnnebATES9utF2A8B+1NAphtXPRJp4oOpABuHgJmI/+w3f27NV7mM6hlTuiOdE3tQCf5CwN88c3bZ3SUIDi8xXsZx5yE8XK+IaVQ=; s=default; c=relaxed/relaxed; d=rock-chips.com; v=1;
	bh=aSm+b636JXlhsI6UQo+/pRLW7JvXY0L+B+9AfrOID3M=;
	h=date:mime-version:subject:message-id:from;

Hi Dmitry,

On 2025/1/7 19:34, Dmitry Baryshkov wrote:
> As reported by Diamond Ding, the phy_get_mode() call doesn't work as
> expected unless the PHY driver has a .set_mode() call. This prompts PHY
> drivers to have empty stubs for .set_mode() for the sake of being able
> to get the mode.
> 

I believe the correct spelling should be 'Damon' instead of 'Diamond'. ;-)

> Make .set_mode() callback truly optional and update PHY's mode even if
> it there is none.
> 
> Cc: Damon Ding <damon.ding@rock-chips.com>
> Link: https://lore.kernel.org/r/96f8310f-93f1-4bcb-8637-137e1159ff83@rock-chips.com
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---
>   drivers/phy/phy-core.c | 7 ++++---
>   1 file changed, 4 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/phy/phy-core.c b/drivers/phy/phy-core.c
> index 8dfdce605a905d7f38205727151258af41f807a9..067316dfcd83a6fc8428cddd27d3b7ebfc270831 100644
> --- a/drivers/phy/phy-core.c
> +++ b/drivers/phy/phy-core.c
> @@ -405,13 +405,14 @@ EXPORT_SYMBOL_GPL(phy_power_off);
>   
>   int phy_set_mode_ext(struct phy *phy, enum phy_mode mode, int submode)
>   {
> -	int ret;
> +	int ret = 0;
>   
> -	if (!phy || !phy->ops->set_mode)
> +	if (!phy)
>   		return 0;
>   
>   	mutex_lock(&phy->mutex);
> -	ret = phy->ops->set_mode(phy, mode, submode);
> +	if (phy->ops->set_mode)
> +		ret = phy->ops->set_mode(phy, mode, submode);
>   	if (!ret)
>   		phy->attrs.mode = mode;
>   	mutex_unlock(&phy->mutex);
> 
> ---
> base-commit: 7b4b9bf203da94fbeac75ed3116c84aa03e74578
> change-id: 20250107-phy-fix-set-moe-d275cff5e27b
> 
> Best regards,

Best regards
Damon


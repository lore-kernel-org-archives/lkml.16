Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F88415B54A;
	Sun,  6 Jul 2025 15:01:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751814089; cv=none; b=HNQ48sqry4Uy1ZnAvyqNr0tn+Mhkc0VwVZTeRUnDRLru2/r6IZexgtA6U+80zteVXXXsao375j3OplCaTD9LOO/ZnW7+VMAp6ZtNZn2fenwKz0yk8PsKpj2FjAtRAuN106OZb8Y6NZ3QMhLiTdsdzajKcMGA2/obYpVQDyD9Ouk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751814089; c=relaxed/simple;
	bh=xPCDaYe5bhsjIvhALV2YKGJzS/UhpegtfpjqIz3uM3E=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=IpEThYFma2/4F6bFnyDBktKrWe08K2D+nhlwNMgeZqNASnhHqYDcPGCCfkwFKkPh1MLlZSsx/IDbhgtMMgegqdzSz7w8MPC4YRtL75klQg0XqQajIUylBI5WSnjljClLi9+vi1rFLOVMg/n+DxGrWqGPJQ+sKJv8pAOgQVA4ziw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=uFYByJcD; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="uFYByJcD"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C22F5C4CEED;
	Sun,  6 Jul 2025 15:01:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1751814088;
	bh=xPCDaYe5bhsjIvhALV2YKGJzS/UhpegtfpjqIz3uM3E=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=uFYByJcDwLY3+3qGrOCaAQSGhSHefKhTXQSmdr2n5TfDZest4MWm6AenPgXoV1tTK
	 atJ+N2SgSUBP6E9jBmiL1FnDjODSPY1Du2lGuDeSdbti7SU4Babv+F/2DdK8Mapkg2
	 J7HavSa0K/s9kuofaAO1oQi93GAQQbF6ibcaBW5F79NMJl94MVTTIFeRHW1iid18ON
	 pEz0cnMN9gq5Vh1tTQWlZOewPru6jYxGCaJRT5jm1XtmTe2dKY3Jq1ZlikwD0ptg+f
	 i8d7H86vcYsLAAQpjCGhVAhkLiXA5O3S10OKElU8XX9r7Af4Vq+wiAMDhZb6AKjoBx
	 vBr+3AP62SwgQ==
Message-ID: <ec2cf624-5849-4491-8a3f-2070d2766ec6@kernel.org>
Date: Sun, 6 Jul 2025 17:01:26 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 4/4 V2] Staging: media: atomisp: i2c: struct definition
 style
To: Thomas Andreatta <thomasandreatta2000@gmail.com>
Cc: linux-kernel@vger.kernel.org, linux-staging@lists.linux.dev,
 Thomas Andreatta <thomas.andreatta2000@gmail.com>
References: <20250619084420.146151-1-thomas.andreatta2000@gmail.com>
 <20250619084420.146151-4-thomas.andreatta2000@gmail.com>
Content-Language: en-US, nl
From: Hans de Goede <hansg@kernel.org>
In-Reply-To: <20250619084420.146151-4-thomas.andreatta2000@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi,

On 19-Jun-25 10:44 AM, Thomas Andreatta wrote:
> Reorder const qualifier in array declaration
> 
> Signed-off-by: Thomas Andreatta <thomas.andreatta2000@gmail.com>

Thank you for your patch.

I have merged this in my media-atomisp branch:
https://git.kernel.org/pub/scm/linux/kernel/git/hansg/linux.git/log/?h=media-atomisp

And this patch will be included in my next
pull-request to Mauro (to media subsystem maintainer)

Regards,

Hans



> ---
>  drivers/staging/media/atomisp/i2c/ov2722.h | 16 ++++++++--------
>  1 file changed, 8 insertions(+), 8 deletions(-)
> 
> diff --git a/drivers/staging/media/atomisp/i2c/ov2722.h b/drivers/staging/media/atomisp/i2c/ov2722.h
> index bc36133f3722..00317d105305 100644
> --- a/drivers/staging/media/atomisp/i2c/ov2722.h
> +++ b/drivers/staging/media/atomisp/i2c/ov2722.h
> @@ -236,7 +236,7 @@ struct ov2722_write_ctrl {
>   * Register settings for various resolution
>   */
>  #if 0
> -static struct ov2722_reg const ov2722_QVGA_30fps[] = {
> +static const struct ov2722_reg ov2722_QVGA_30fps[] = {
>  	{OV2722_8BIT, 0x3718, 0x10},
>  	{OV2722_8BIT, 0x3702, 0x0c},
>  	{OV2722_8BIT, 0x373a, 0x1c},
> @@ -346,7 +346,7 @@ static struct ov2722_reg const ov2722_QVGA_30fps[] = {
>  
>  };
>  
> -static struct ov2722_reg const ov2722_480P_30fps[] = {
> +static const struct ov2722_reg ov2722_480P_30fps[] = {
>  	{OV2722_8BIT, 0x3718, 0x10},
>  	{OV2722_8BIT, 0x3702, 0x18},
>  	{OV2722_8BIT, 0x373a, 0x3c},
> @@ -455,7 +455,7 @@ static struct ov2722_reg const ov2722_480P_30fps[] = {
>  	{OV2722_TOK_TERM, 0, 0},
>  };
>  
> -static struct ov2722_reg const ov2722_VGA_30fps[] = {
> +static const struct ov2722_reg ov2722_VGA_30fps[] = {
>  	{OV2722_8BIT, 0x3718, 0x10},
>  	{OV2722_8BIT, 0x3702, 0x18},
>  	{OV2722_8BIT, 0x373a, 0x3c},
> @@ -565,7 +565,7 @@ static struct ov2722_reg const ov2722_VGA_30fps[] = {
>  };
>  #endif
>  
> -static struct ov2722_reg const ov2722_1632_1092_30fps[] = {
> +static const struct ov2722_reg ov2722_1632_1092_30fps[] = {
>  	{OV2722_8BIT, 0x3021, 0x03}, /* For stand wait for
>  				a whole frame complete.(vblank) */
>  	{OV2722_8BIT, 0x3718, 0x10},
> @@ -667,7 +667,7 @@ static struct ov2722_reg const ov2722_1632_1092_30fps[] = {
>  	{OV2722_TOK_TERM, 0, 0}
>  };
>  
> -static struct ov2722_reg const ov2722_1452_1092_30fps[] = {
> +static const struct ov2722_reg ov2722_1452_1092_30fps[] = {
>  	{OV2722_8BIT, 0x3021, 0x03}, /* For stand wait for
>  				a whole frame complete.(vblank) */
>  	{OV2722_8BIT, 0x3718, 0x10},
> @@ -769,7 +769,7 @@ static struct ov2722_reg const ov2722_1452_1092_30fps[] = {
>  };
>  
>  #if 0
> -static struct ov2722_reg const ov2722_1M3_30fps[] = {
> +static const struct ov2722_reg ov2722_1M3_30fps[] = {
>  	{OV2722_8BIT, 0x3718, 0x10},
>  	{OV2722_8BIT, 0x3702, 0x24},
>  	{OV2722_8BIT, 0x373a, 0x60},
> @@ -877,7 +877,7 @@ static struct ov2722_reg const ov2722_1M3_30fps[] = {
>  };
>  #endif
>  
> -static struct ov2722_reg const ov2722_1080p_30fps[] = {
> +static const struct ov2722_reg ov2722_1080p_30fps[] = {
>  	{OV2722_8BIT, 0x3021, 0x03}, /* For stand wait for a whole
>  					frame complete.(vblank) */
>  	{OV2722_8BIT, 0x3718, 0x10},
> @@ -983,7 +983,7 @@ static struct ov2722_reg const ov2722_1080p_30fps[] = {
>  };
>  
>  #if 0 /* Currently unused */
> -static struct ov2722_reg const ov2722_720p_30fps[] = {
> +static const struct ov2722_reg ov2722_720p_30fps[] = {
>  	{OV2722_8BIT, 0x3021, 0x03},
>  	{OV2722_8BIT, 0x3718, 0x10},
>  	{OV2722_8BIT, 0x3702, 0x24},


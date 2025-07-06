Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 21AF850276;
	Sun,  6 Jul 2025 15:01:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751814077; cv=none; b=ZrscLb74RqQqY0CIYLrC8QArnfowjassihdobrSN/PWT0TQhRbgRBfbeXi//9Mlq6WIMsa3aEcFPcgJ00YGp2mAur+GsM+AwvEeefBIBYOj2A/96LPZ8djcJbKfmheDV9i/anBVzzcDHzPjf10y8HZfhXbgL+0yyEiRUYnCjbh4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751814077; c=relaxed/simple;
	bh=7VkRLspSfHnIw6gLfAaj/UDDRsi5S7auVnwsMV1mP6o=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=iUBYZXEQzRTgkbyAXnEo0Cu6nTlbGgo7mTtsxv7Uc5UNVC9UxK+XCdNVoPEWGjsrFvSzwZISrWlDJx2jkm1MKR8aMM0XCm+7PBIEgFv0VJhv8FPTc53LCwWAJFbAc8m1C/LJqi3IHkiCN3DWHzrOpyJKG5ffs0uxRkoyWC5flaM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=CToiR76T; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="CToiR76T"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D20ABC4CEF2;
	Sun,  6 Jul 2025 15:01:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1751814076;
	bh=7VkRLspSfHnIw6gLfAaj/UDDRsi5S7auVnwsMV1mP6o=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=CToiR76Tx4UKpbM1pUXbjn/9CgaaCBwVPC0Anq5PrexJTja9z7mo/CrN83URXG+LT
	 VImssuydPOpGiYIxfW6CgIfvCBIGFd5RRH12B8j+AvbKA4qqnQqLrBsckqkJzW0aDU
	 YIXS0fatbAYUT4dev+OYpg8ah3YGtUiaiPuGguDEzEuaOzqMZ1CrG7xOPYrTEIy7yD
	 8WbMhdvpSY6T+kcxwdKHl8R5AYJn2CIPxcUcP8LpLSys4fU30BBROj1PF9/qZ1fIXJ
	 RnsoTZXw/xZreVffbTjyRcEH/ByBwsDi5CMpVbNj+EFYW5jJhq0Q6+tWeG/X3tME+X
	 thmfnlI89kgiw==
Message-ID: <079b73bf-c266-4ffc-8adc-488dfd2c53f9@kernel.org>
Date: Sun, 6 Jul 2025 17:01:14 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/4 V2] Staging: media: atomisp: i2c: struct definition
 style
To: Thomas Andreatta <thomasandreatta2000@gmail.com>
Cc: linux-kernel@vger.kernel.org, linux-staging@lists.linux.dev,
 Thomas Andreatta <thomas.andreatta2000@gmail.com>
References: <20250619084420.146151-1-thomas.andreatta2000@gmail.com>
 <20250619084420.146151-3-thomas.andreatta2000@gmail.com>
Content-Language: en-US, nl
From: Hans de Goede <hansg@kernel.org>
In-Reply-To: <20250619084420.146151-3-thomas.andreatta2000@gmail.com>
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
>  drivers/staging/media/atomisp/i2c/gc2235.h | 16 ++++++++--------
>  1 file changed, 8 insertions(+), 8 deletions(-)
> 
> diff --git a/drivers/staging/media/atomisp/i2c/gc2235.h b/drivers/staging/media/atomisp/i2c/gc2235.h
> index 6c743a17f198..7dd9a676fb98 100644
> --- a/drivers/staging/media/atomisp/i2c/gc2235.h
> +++ b/drivers/staging/media/atomisp/i2c/gc2235.h
> @@ -179,21 +179,21 @@ struct gc2235_write_ctrl {
>  	struct gc2235_write_buffer buffer;
>  };
>  
> -static struct gc2235_reg const gc2235_stream_on[] = {
> +static const struct gc2235_reg gc2235_stream_on[] = {
>  	{ GC2235_8BIT, 0xfe, 0x03}, /* switch to P3 */
>  	{ GC2235_8BIT, 0x10, 0x91}, /* start mipi */
>  	{ GC2235_8BIT, 0xfe, 0x00}, /* switch to P0 */
>  	{ GC2235_TOK_TERM, 0, 0 }
>  };
>  
> -static struct gc2235_reg const gc2235_stream_off[] = {
> +static const struct gc2235_reg gc2235_stream_off[] = {
>  	{ GC2235_8BIT, 0xfe, 0x03}, /* switch to P3 */
>  	{ GC2235_8BIT, 0x10, 0x01}, /* stop mipi */
>  	{ GC2235_8BIT, 0xfe, 0x00}, /* switch to P0 */
>  	{ GC2235_TOK_TERM, 0, 0 }
>  };
>  
> -static struct gc2235_reg const gc2235_init_settings[] = {
> +static const struct gc2235_reg gc2235_init_settings[] = {
>  	/* System */
>  	{ GC2235_8BIT, 0xfe, 0x80 },
>  	{ GC2235_8BIT, 0xfe, 0x80 },
> @@ -268,7 +268,7 @@ static struct gc2235_reg const gc2235_init_settings[] = {
>   * Register settings for various resolution
>   */
>  #if ENABLE_NON_PREVIEW
> -static struct gc2235_reg const gc2235_1296_736_30fps[] = {
> +static const struct gc2235_reg gc2235_1296_736_30fps[] = {
>  	{ GC2235_8BIT, 0x8b, 0xa0 },
>  	{ GC2235_8BIT, 0x8c, 0x02 },
>  
> @@ -321,7 +321,7 @@ static struct gc2235_reg const gc2235_1296_736_30fps[] = {
>  	{ GC2235_TOK_TERM, 0, 0 }
>  };
>  
> -static struct gc2235_reg const gc2235_960_640_30fps[] = {
> +static const struct gc2235_reg gc2235_960_640_30fps[] = {
>  	{ GC2235_8BIT, 0x8b, 0xa0 },
>  	{ GC2235_8BIT, 0x8c, 0x02 },
>  
> @@ -373,7 +373,7 @@ static struct gc2235_reg const gc2235_960_640_30fps[] = {
>  };
>  #endif
>  
> -static struct gc2235_reg const gc2235_1600_900_30fps[] = {
> +static const struct gc2235_reg gc2235_1600_900_30fps[] = {
>  	{ GC2235_8BIT, 0x8b, 0xa0 },
>  	{ GC2235_8BIT, 0x8c, 0x02 },
>  
> @@ -418,7 +418,7 @@ static struct gc2235_reg const gc2235_1600_900_30fps[] = {
>  	{ GC2235_TOK_TERM, 0, 0 }
>  };
>  
> -static struct gc2235_reg const gc2235_1616_1082_30fps[] = {
> +static const struct gc2235_reg gc2235_1616_1082_30fps[] = {
>  	{ GC2235_8BIT, 0x8b, 0xa0 },
>  	{ GC2235_8BIT, 0x8c, 0x02 },
>  
> @@ -463,7 +463,7 @@ static struct gc2235_reg const gc2235_1616_1082_30fps[] = {
>  	{ GC2235_TOK_TERM, 0, 0 }
>  };
>  
> -static struct gc2235_reg const gc2235_1616_1216_30fps[] = {
> +static const struct gc2235_reg gc2235_1616_1216_30fps[] = {
>  	{ GC2235_8BIT, 0x8b, 0xa0 },
>  	{ GC2235_8BIT, 0x8c, 0x02 },
>  


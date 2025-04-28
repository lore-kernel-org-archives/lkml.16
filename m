Received: from smtp92.iad3b.emailsrvr.com (smtp92.iad3b.emailsrvr.com [146.20.161.92])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E8B2C15747C
	for <linux-kernel@vger.kernel.org>; Mon, 28 Apr 2025 12:01:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=146.20.161.92
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745841720; cv=none; b=BtK+3GtdJZNXGL6Dwn0gIUVDtTwxVhhx7sw8JmbQssyfV2nGPm1r9+WYQGLUrNp9f74qkuQld/e3plr2pBNzRUkfPZQyE8Xef4/YZWT2EAVPYgq5v1R0ID7zNSr7d53/DG730oZoDOyVhepYdjNl4Ls0gnt6H9AnhS8OvAvBiuI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745841720; c=relaxed/simple;
	bh=e4dCmy3mm0Bqqcnb0qH3Ef1Cls6IqvLXBdPTTIx71eA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=XkhNJX2jspdwihqKCzwjYE46wLzXpamPtGWzs5iMb32Zy+irF5OTdVOhJQrMZpbZg5PsfITUM2wrnY1gSVlhLxe/tfLzX+bzR8dkmW+Cm/lSHk1c8yWthVLJVJzvlAJ+e+jj4dRJlJ/GSSEhApw/j8Y5+HwZzpBue+kJD7sHwzU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=mev.co.uk; spf=pass smtp.mailfrom=mev.co.uk; dkim=pass (1024-bit key) header.d=mev.co.uk header.i=@mev.co.uk header.b=gFXSOlPl; arc=none smtp.client-ip=146.20.161.92
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=mev.co.uk
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mev.co.uk
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=mev.co.uk header.i=@mev.co.uk header.b="gFXSOlPl"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=mev.co.uk;
	s=20221208-6x11dpa4; t=1745837058;
	bh=e4dCmy3mm0Bqqcnb0qH3Ef1Cls6IqvLXBdPTTIx71eA=;
	h=Date:Subject:To:From:From;
	b=gFXSOlPlrEDTR7vzED7QPLSass6TriPuF9MowgQHN7591YcnR2iu2UAy3NkG3b6yO
	 EnTJbUE1xZ+UeQazonbVJT86H3iBvpX9V62UakpMLK0q9t9gWrAbx0s88ipOEGdKa0
	 4NzGqYwXNGRN+q/r336dNL2s4rGCwEe6Woics6zw=
X-Auth-ID: abbotti@mev.co.uk
Received: by smtp20.relay.iad3b.emailsrvr.com (Authenticated sender: abbotti-AT-mev.co.uk) with ESMTPSA id 86E68A0112;
	Mon, 28 Apr 2025 06:44:17 -0400 (EDT)
Message-ID: <d0feff64-af96-41f8-9c52-3dafeafd7871@mev.co.uk>
Date: Mon, 28 Apr 2025 11:44:16 +0100
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] staging: comedi: das16 : fixed a struct warning in code
To: Darshan Rathod <darshanrathod475@gmail.com>
Cc: hsweeten@visionengravers.com, linux-kernel@vger.kernel.org
References: <20250426094145.13564-1-darshanrathod475@gmail.com>
Content-Language: en-GB
From: Ian Abbott <abbotti@mev.co.uk>
Organization: MEV Ltd.
In-Reply-To: <20250426094145.13564-1-darshanrathod475@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Classification-ID: 88e79daf-92f8-4ed3-9c35-2f356a408816-1-1

On 26/04/2025 10:41, Darshan Rathod wrote:
> fixed a warning messages for a struct
> Signed-off-by: Darshan Rathod <darshanrathod475@gmail.com>

There should be a blank line before that "Signed-off-by" line.

The patch subject should not have the "staging:" tag since the code has 
been moved out of the "drivers/staging" directory.

> ---
>   drivers/comedi/drivers/das16.c | 8 ++++----
>   1 file changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/comedi/drivers/das16.c b/drivers/comedi/drivers/das16.c
> index f5ca6c0d4d0c..73717f75d60f 100644
> --- a/drivers/comedi/drivers/das16.c
> +++ b/drivers/comedi/drivers/das16.c
> @@ -956,8 +956,8 @@ static const struct comedi_lrange *das16_ai_range(struct comedi_device *dev,
>   
>   	/* get any user-defined input range */
>   	if (pg_type == das16_pg_none && (min || max)) {
> -		struct comedi_lrange *lrange;
> -		struct comedi_krange *krange;
> +		const struct comedi_lrange *lrange;
> +		const struct comedi_krange *krange;
>   
>   		/* allocate single-range range table */
>   		lrange = comedi_alloc_spriv(s,
> @@ -990,8 +990,8 @@ static const struct comedi_lrange *das16_ao_range(struct comedi_device *dev,
>   
>   	/* get any user-defined output range */
>   	if (min || max) {
> -		struct comedi_lrange *lrange;
> -		struct comedi_krange *krange;
> +		const struct comedi_lrange *lrange;
> +		const struct comedi_krange *krange;
>   
>   		/* allocate single-range range table */
>   		lrange = comedi_alloc_spriv(s,

I do not see how these changes will fix any warning messages.  In fact, 
they will produce compiler errors from the code further down the functions.

-- 
-=( Ian Abbott <abbotti@mev.co.uk> || MEV Ltd. is a company  )=-
-=( registered in England & Wales.  Regd. number: 02862268.  )=-
-=( Regd. addr.: S11 & 12 Building 67, Europa Business Park, )=-
-=( Bird Hall Lane, STOCKPORT, SK3 0XA, UK. || www.mev.co.uk )=-

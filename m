Received: from mail-ed1-f45.google.com (mail-ed1-f45.google.com [209.85.208.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D03E61D07BA
	for <linux-kernel@vger.kernel.org>; Wed, 16 Apr 2025 14:12:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744812756; cv=none; b=FInutZBH/awWv875tBWXsJVxdI/C7GlxNYEg0P6da1dU7r45qhzBfc6psdf7K8/BQl53tdmtY4UxEOKscWir3d/XhzNHYrZi2Srd5YEBCYw19g+sQoP6Y6IrpUaHuX9v2WALCG6wqfEw02v8HgvHLTk8rEKdv05J5vdRM2mXd6k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744812756; c=relaxed/simple;
	bh=O6zyxYqY9ABY4J5KB2RPicAWgwov0p+XC5dH4lJh6s8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=khfvoWj+EHuegZ+u+/oyHYVAQtbjtq9OEUJk9+ISqAbmIoe6keye6GordKq6BWeS6MZOl6XCsURxTf24F87tpREv7Kk5zuRt0nMGGZFI17MDKHAUhORxoBXm+krS3kXszEqAugDQ67H1jj+flIppTLknFlWjiFyBn9TZX3fK6Pg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=iTIPS/ML; arc=none smtp.client-ip=209.85.208.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="iTIPS/ML"
Received: by mail-ed1-f45.google.com with SMTP id 4fb4d7f45d1cf-5e8be1c6ff8so12339987a12.1
        for <linux-kernel@vger.kernel.org>; Wed, 16 Apr 2025 07:12:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744812752; x=1745417552; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=DDvCm+Mlaej8nwLZ4oHulSSCMq/G+lv697dlOtDNcnE=;
        b=iTIPS/MLB+r5bvz5QRmxUV9xkEHIUseSuvL4dg2QE5lauU3XzSkRUVhYjTHg1a6O6b
         pC7wrrMddfOzItpQru0Xrd3GzlctsjWxGZ+VEzMqUY/GB9zl09oOchS/3yxOhwf0nO7r
         f/Eg42Zd0+/lrzCHf2Xp2osqUT1p64Hvkcth26m6j/x89qupRKJP1y9gjOwZ1pyLuvMw
         PU6Cw/xsycrP6xgl45kDVt5KsiGzs4oi8l2+gPOP1bHfY0gJXuwQfIDW8wWKwfzlurEr
         6hvA6/EUt+4tFToA4X+KdGGNeRhKjK9beznGnCMau2mlOwY/42WSlWXwYo7kldwnGeZh
         moUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744812752; x=1745417552;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DDvCm+Mlaej8nwLZ4oHulSSCMq/G+lv697dlOtDNcnE=;
        b=hEZM+YnNZ3pRwlB7ZiFt3nAJCVLsM9Eza7IE/LB5aUUTlQ7vOEaGFWjoTA+iJOU909
         jDVp/PFLlNeOOx51AvlQru+hlv57BI1HIIVagNe07gv1Zik775KD5kdcmmNiLiihbyhh
         6oSB5xPIqjFcoxkn5ZhKFge51HHzRqK1bXIpt5RbHrOy+9iSLf+2PvPoT1IGunYkCODs
         8ml/yKBtVrldEmj9rLY/t6y+ct8jLjK1lTXNNQ3Y5HBZHLDv2Tcn5IFJkj1OApOWn8fx
         BVhugufZxnfUVgMuibph0PtvbM6fzls3KdxaA+5nTTUIfYhgWFDYbifqNuGBIsOql/wE
         i3NQ==
X-Forwarded-Encrypted: i=1; AJvYcCURbyFcsPNmJRAY+q3Awv7l8wsFyHYZjmW94E1/YkEgxI/oxn8YEwA5Rw3sU5Z92Occ/ynuJssYqdPFMAo=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx269s4wOd80Ggsb+l5Ro5RLhcZL4sUfHwnW2+EjGevda3XiWJv
	PgU7nsyHsO+vKNylSE9FON1h+WGY3N3jwvDXRMzSMNir+iiV3HrA
X-Gm-Gg: ASbGncvtvnfEvRfSjCSCf/RZk9znFD2r+Nm9/bGStoq+xfyrZzfJnU+sDwQ4U80/ZSp
	uAa2TOOsdOn/MkVJRXKno5ywQ6sGDocN60VBktVCidH8y0B8nBCygcqsIgAcNpm2dbj84UlQDVS
	PPokIkBZtwXAnszrukwNcyCXK9tzBtRtou8ds9uNl10X/B/U514hrO0oNikvI/YkkgLi+LUqacq
	8rz08OI9+83WreynTE7uOxXKRLUxxoZZTQUKZ1DAie0nbdsqOdN1cz1B0EHdHVlRL8X4IXMOg6A
	mGnquZ+LSgSIP5hnluF/Ial7JzdLg/AbX9cC4lBUIyHMBqUG/JG/YfGL
X-Google-Smtp-Source: AGHT+IGTlbsUDIxwR3FnJN+VHJxH2XZ8CyxkRGIafIbQ02s4NvSPzpXYWAuDYU8kMQVWM4cAPTU45g==
X-Received: by 2002:a05:6402:4602:20b0:5f4:c5bd:90d7 with SMTP id 4fb4d7f45d1cf-5f4c5bd9599mr705364a12.27.1744812751738;
        Wed, 16 Apr 2025 07:12:31 -0700 (PDT)
Received: from egonzo (82-64-73-52.subs.proxad.net. [82.64.73.52])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5f36f52a4aasm8639580a12.78.2025.04.16.07.12.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Apr 2025 07:12:31 -0700 (PDT)
Date: Wed, 16 Apr 2025 16:12:12 +0200
From: Dave Penkler <dpenkler@gmail.com>
To: Rujra Bhatt <braker.noob.kernel@gmail.com>
Cc: gregkh@linuxfoundation.org, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org, outreachy@lists.linux.dev
Subject: Re: [FIRST-PATCH] staging : gpib : agilent_82350b : agilent_82350b.c
 : fixes checks on the file
Message-ID: <Z_-6vAXbsveDqzKK@egonzo>
References: <Z_-nR5Vt2A5kvbro@brak3rDesk>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Z_-nR5Vt2A5kvbro@brak3rDesk>

On Wed, Apr 16, 2025 at 06:19:11PM +0530, Rujra Bhatt wrote:
> It has recommended to
> Prefer kzalloc(sizeof(*board->private_data)...)
> over kzalloc(sizeof(struct agilent_82350b_priv)...)
> 
> Signed-off-by: Rujra Bhatt <braker.noob.kernel@gmail.com>
> ---
>  drivers/staging/gpib/agilent_82350b/agilent_82350b.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/staging/gpib/agilent_82350b/agilent_82350b.c b/drivers/staging/gpib/agilent_82350b/agilent_82350b.c
> index 445b9380ff98..956e21886eb6 100644
> --- a/drivers/staging/gpib/agilent_82350b/agilent_82350b.c
> +++ b/drivers/staging/gpib/agilent_82350b/agilent_82350b.c
> @@ -479,7 +479,7 @@ static void agilent_82350b_return_to_local(struct gpib_board *board)
>  
>  static int agilent_82350b_allocate_private(struct gpib_board *board)
>  {
> -	board->private_data = kzalloc(sizeof(struct agilent_82350b_priv), GFP_KERNEL);
> +	board->private_data = kzalloc(sizeof(struct * board->private_data), GFP_KERNEL);
>  	if (!board->private_data)
>  		return -ENOMEM;
>  	return 0;
> -- 
> 2.43.0
> 
This will not work and the recommendation in this case is also wrong:
kzalloc(sizeof(*board->private_data)...) only allocates space
for a void *, not enough to hold the agilent_82350b_priv struct.
cheers,
-dave

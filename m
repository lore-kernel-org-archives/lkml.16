Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4B51425B67C
	for <linux-kernel@vger.kernel.org>; Wed,  9 Apr 2025 11:11:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744197089; cv=none; b=pS/cGNBpnKEq0GmLIehuCHeY+ASEUODoSEDnkbd/TLEwnv5ZH9G9+k4uRdPoASRKJtEZzX2SpD3jUonM03cLplOs3SOJr/N8glqfXTAKz7XFGbBHVlDdz2RgVFqwORkBw9MmoUWwOdXs823kwjqTcoikzhtdNIcPsh+nSMioI6o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744197089; c=relaxed/simple;
	bh=ik9ItygRr9yIPW2Mc/PZYhjH6z8YDKHWGfbwtOGw0G4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=BXyWp8NjzQyuJDIGTjzmDtaCTmw24dHMqcLbtYgxqGkXb/fYY/n4pyyBjEjMifZJshLkjOddPmGkhZ+726feXpEpVtNKfO/T6T3RDcakM4f9kkrD4bB5dYSKgB5GNcLHae/lQzZ3Zhl80nsegVRE4ORiPkBzWivKV0n9a7p5lTU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=zxEB2b6G; arc=none smtp.client-ip=209.85.221.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="zxEB2b6G"
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-39ac8e7688aso4800484f8f.2
        for <linux-kernel@vger.kernel.org>; Wed, 09 Apr 2025 04:11:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1744197085; x=1744801885; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=8hUKCIZwdAKFsLiLYa1VO4wMgsObAoyYESjSHJd2mFE=;
        b=zxEB2b6GkdiH5RmQGYPA3R6M5aRd5o+w45x3omMFEvfbuyTTH1UUKCjgHexbzE20Z3
         FBnSwe3I/kefB9m2+uAyc2/JUxG1tRXmXyakGFEfNwdA8+xBu6NUvxHc3VZTmn7BOqav
         0QVDG/000kfdhBTDn/Zoub4TOXiMjvnxITWnZpuP3BdNAtij1kxHvhQaU4G4V8o7VHux
         UY2kAMmkucXkx2kLg+spYODepMpDSFj43Q9cS4BFhgFiYjkSP+bD9QbmMABc9D0UY8/e
         FnIVALYTLymZtFSuYjn/ig1/fnDs9U5n4c6GyiaxvYDi84UTm53P9WLSxF5D8HxzpPsp
         ERzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744197085; x=1744801885;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8hUKCIZwdAKFsLiLYa1VO4wMgsObAoyYESjSHJd2mFE=;
        b=QZEbakp149S6TZbeDUmKczMti4o/yABiy8T52/qMCRoPEnasHfrTZmplB48zhajkgX
         7OwVE1y0Xfb9fdsNGWuRZWiRLxTkUBNmSViqsTGXEg+Jh4EWc2Qw4aWoTGFl274iKFnm
         zhTivE/H+Bh+sD4dKCIuHWLsuLlspwoZPXI5hqu/a9T7MtsaJ7z1YxyZNtyNnDwA3099
         kcVa/o+KUO/7nB7XiGNkLfnebRSOsKWjic7BmqXVMnNJNm7VezQpeRsfV5fRt0IeRLdp
         7mpTwhG0nfPVHdleNv2vdbua6Yn2/UIDRY9Da7LF4ux3oUX3rtoVXBYuiivpl954S3VF
         8d0Q==
X-Forwarded-Encrypted: i=1; AJvYcCUtOu+4fnswBD0o/NsxBl6UjOlP8YQi8AWLP+lkaCUheMXc6dIs8Zlc58n6Ju6PeKMr8qgxu40GCCOzV+s=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy0aHdXUz+fUGpDdZE7LO90XrU7Zs2nuMdcrKyh7mGFDlSchqrb
	608zuw8VTi5F5Bxo+hk0+6LIfoMTwj7UeOfx4DC4ghTKJNYcLctXyH6On3LAf3U=
X-Gm-Gg: ASbGncul7L+RKqCq/tH132/YI7XrIBsZmTVfj537nUs4iOYJe+vYk/wTCOKdZiZTY5i
	2DZDTqvg7/hbdSKmF1Ey7UR1jISG/ztMs38YLzpJ8JEDNzFJ9nngv6Yga7d0+Dsic915Ki2nrQu
	1i7B+/CDjIIqccWHOiicXyHZbhNDYjAE9tFxvh0UdzQ+ru0esQ/4KrG5rgMPSoUMhrAus+aMaWu
	b8ZgKS60hK6s6hKdyr+xybtZuVOTcwLVd4yZfWsg6TZTEVYzIRXxuVE1eF+EWRe094577muhf1P
	kghbUP7gqfp9BRYfCqt3/+4MS7IFu5RSw4PznbaBcdVt8w==
X-Google-Smtp-Source: AGHT+IGXax2LtMxOpUGA9r+oCr9bPGcaXFt/3GzRkKF3FDOJvk1Gx+REYad/Sskufy4uK+n2UYFvKA==
X-Received: by 2002:a05:6000:4009:b0:391:4684:dbef with SMTP id ffacd0b85a97d-39d87ab6243mr2104415f8f.17.1744197085566;
        Wed, 09 Apr 2025 04:11:25 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-43f23158849sm13409175e9.0.2025.04.09.04.11.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Apr 2025 04:11:25 -0700 (PDT)
Date: Wed, 9 Apr 2025 14:11:21 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Julia Lawall <julia.lawall@inria.fr>
Cc: Erick Karanja <karanja99erick@gmail.com>, gregkh@linuxfoundation.org,
	outreachy@lists.linux.dev, philipp.g.hortmann@gmail.com,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 1/2] staging: rtl8723bs: Improve code readability
Message-ID: <22a2c8a7-9669-40bd-b886-713833de5cc4@stanley.mountain>
References: <cover.1744192642.git.karanja99erick@gmail.com>
 <97a2637f3ccefb3de0e15fd04f29f5f209f2a506.1744192642.git.karanja99erick@gmail.com>
 <3dda7f97-4ed8-cf6d-9310-60ed6259a386@inria.fr>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <3dda7f97-4ed8-cf6d-9310-60ed6259a386@inria.fr>

On Wed, Apr 09, 2025 at 07:04:18AM -0400, Julia Lawall wrote:
> > @@ -729,10 +721,9 @@ static void hal_ReadEFuse_WiFi(
> >  		}
> >
> >  		if (offset < EFUSE_MAX_SECTION_8723B) {
> > -			u16 addr;
> > +			u16 addr = offset * PGPKT_DATA_SIZE;
> >  			/*  Get word enable value from PG header */
> >
> > -			addr = offset * PGPKT_DATA_SIZE;
> 
> I'm not sure about this one, due to the comment.
> 
> julia
> 

I feel like it works.  I wish there were a blank line after the
declaration but that's something for a different patch.  Both of
these are okay with me.  Try to be more creative with the subjects
next time.  (Just put the file name in the subject because that's
the only difference).

Reviewed-by: Dan Carpenter <dan.carpenter@linaro.org>

regards,
dan carpenter


Received: from mail-pj1-f47.google.com (mail-pj1-f47.google.com [209.85.216.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A93EF22F39F;
	Tue,  8 Apr 2025 17:49:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744134595; cv=none; b=qJMKnmRikZvAGtwZcGSniZo5Xb+7KNDhibhU6TsRpCspzoON1bDrgDf7PSAurVXW0apiRzPU7HWG2aDrhgnqMPssY1bgDRNoG0xaVYrYDnIaExADE3eRBgCKVfqgA95qZbPZWWCw/EqCi+2Nl3QZJj39UJnbWteNcQrs3nHXH8c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744134595; c=relaxed/simple;
	bh=McapW7Tdxv9cDfYGpj7wLy91s53L74xcZuYJsNm6kbw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=VNRJWhlyDzwI8DPgJgbio7qxxAKNJlQSkeRyDJCnuXLtEAyaD1Bn0ntr7Tb1jFzjeq6liHnDirxikVAT19L5bj2S84+kzW5clMU45tP3s28hRsFQ7Zpq4EgRKFrckedlxY2NWQ+G3zQ6g7e6RcOk3uSUfgHDh0aEDAQGxLDvJ08=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ddlG1ooM; arc=none smtp.client-ip=209.85.216.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ddlG1ooM"
Received: by mail-pj1-f47.google.com with SMTP id 98e67ed59e1d1-30185d00446so5047833a91.0;
        Tue, 08 Apr 2025 10:49:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744134593; x=1744739393; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Dn45RFW+Y+tJBdcvwcvFy2VtsffN9mizJNsrN/ynpig=;
        b=ddlG1ooM1P/k17nG+FEGTXHu9K/D+weobFPNWcLRLulWEkedtv1oMKHHhXUFR6zvpw
         eaIfJob49pYECX1TzBynu3U1KVPBXeL4V+qHSzEtQug73B8ovbGEat6VXC+PEQQJ2DFZ
         lH8P/QZUIsJ554WQVwm1zOp95kiVd+wNXl1xzWSJX3QlhOeoWrHbymsYf3Qq4Tmn4gz2
         VZtkXK0+XyGQfPOS89kofNK0HFVtES1E9/zwx1NarZrrBtUYt2QhIBgvPpHhGo5Yb5Ti
         LgKD8qd8IDNEflONnzPKh2TRcvf7Trq155ntxwt4cP8Ggoftt5rKGejGvCMNz6EB7mDg
         K+ww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744134593; x=1744739393;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Dn45RFW+Y+tJBdcvwcvFy2VtsffN9mizJNsrN/ynpig=;
        b=Ms8NsgnAHVD8aEEVNf2LLmxfJUSvkwax7OJtBEgfTrITgkvIPG7RJXafGvtUnwaPdF
         JAVmnpAW9Fz81FB1YDU7OxW8tU06WbFjn3mac0PVmlRUei/Gp5K0Jo08Nrx4FXkZqNF7
         pSZBtl9rnkvQedCI0xFoVkPjFusqCSisguBvrbRth+UmsMWKQYjYIHLfZ5WvwIQ/Qyes
         59We73JhcRKjALEuPVFHKtp/0VHPfNfEDy9NSSj/JqYEet6r6NCEAvNksD3dalPfDUfM
         a2HFfFfRNkuj3P24wUVhVhvJNBJlPMaRwp8DIrjLwm42lIgS6/tQUipftZSUk53p7tZ/
         BG4g==
X-Forwarded-Encrypted: i=1; AJvYcCUmeW8U/ue3Lq33U3ChBclo+tw6dw3iIW98GfNwZEyW1W//IGTBMbXhL0NBqcfkDUNEDmcahNLjT2hKbw==@vger.kernel.org, AJvYcCXjB+p+xECRW3hyoniIAaQfdpPYRL/ukRKhWed+64djFakJQy/fn+l032gObn3zuhf+233VEyTVtQd/fLgF@vger.kernel.org
X-Gm-Message-State: AOJu0Yy/fKx9WI/nkCZXiVMpjvmMIvWsS9Oh4hzGlJQsb8/D5vDTt1pl
	czpL1HnyOys4qjvAxIB+ZQoxdzHgghwzRzpccltj7+UcmF5+Lblj
X-Gm-Gg: ASbGncs6QPWuQMI2zFhG8WVEfKz3VNZ1nAVohvozxydWFmsVZd4h4W+/oePTfNBuswC
	JfHsaFK+tDvrugPXeIoUEhFRHFUEeYEQzF9Lq0VDWFqFdfWbwDVbZQh+8N4nUe4f3E6QTXAc5Eq
	m9gAzY9t+gT1iUc7z27mUUcGqnGRVGFUXrX0YoRDVO/NF25xQQ3NCSlgVXwG6aiB34Mxc23nfYk
	eid5m16cal8cSg+hPBt2qWhlY+rIrgE96kIy9zk9iJqnReNhm3/2no9Zf2M2rl665k6P8Cv8jKw
	ZCrPX4tbudMQXih1BbTjXxV6nwQY41oU+xX6FaLzQg3RsR0Ud7mjG9stSg==
X-Google-Smtp-Source: AGHT+IH6VKEvUBmgLvDk9adusjfBPlOMNGINejw5pCa7n7hppoQJtEtQWZm11F4bJ4tpGCEt+Geh3w==
X-Received: by 2002:a17:90a:e18b:b0:2ff:6e58:89f5 with SMTP id 98e67ed59e1d1-306d0bf1da5mr5434182a91.6.1744134592669;
        Tue, 08 Apr 2025 10:49:52 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-305983d7f57sm12612001a91.41.2025.04.08.10.49.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Apr 2025 10:49:52 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Tue, 8 Apr 2025 10:49:50 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: Alexander Stein <alexander.stein@ew.tq-group.com>
Cc: Jean Delvare <jdelvare@suse.com>, linux-hwmon@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 1/1] hwmon: (gpio-fan) Add regulator support
Message-ID: <de21cc25-3562-487a-9523-d9a49ca3cf98@roeck-us.net>
References: <20250408102145.576852-1-alexander.stein@ew.tq-group.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250408102145.576852-1-alexander.stein@ew.tq-group.com>

On Tue, Apr 08, 2025 at 12:21:44PM +0200, Alexander Stein wrote:
> FANs might be supplied by a regulator which needs to be enabled as well.
> This is implemented using runtime PM. Every time speed_index changes from
> 0 to non-zero and vise versa RPM is resumed or suspended.
> Intitial RPM state is determined by initial value of speed_index.
> 
> Signed-off-by: Alexander Stein <alexander.stein@ew.tq-group.com>

Applied.

Thanks,
Guenter

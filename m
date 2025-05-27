Received: from mail-ej1-f53.google.com (mail-ej1-f53.google.com [209.85.218.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D7B491F4C96
	for <linux-kernel@vger.kernel.org>; Tue, 27 May 2025 07:46:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748331971; cv=none; b=CzC8X/EpOiKDN/EBHd3acf1Xn+tPAe3DSMFDXN4yvTNKKgx2STKevGHXKsnmukltlAUU4QWr8QpV936gKS5LwriY7Fn/AjF+UWnWzPfjTjnk7BRlwzHldCujHaPWc/VLyWUPzBwy2/V32Wj+eTbwUxF+s+Y3wBdCWWY7NROD12M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748331971; c=relaxed/simple;
	bh=QsdO+ZSurjfW+txHD96EQ4S874P9J1sRBPDp56cKBAM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=LbzFqz2nTBV8ICguYhh6e0wIFkWPd36Jc/y+CIV1KSo8+ApmPvf+TFKe2XQZgmdskN/Hh61zdKNwwwtnY+L7twASCG1J0Tx9xCxwx2XVwc7iBoWZ2DTs+S5lTRLDohkt3pAOhous+DjuxDMBJDMGvbyEcwaRMpiUjCcjUfp+6hg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=u6iX+igI; arc=none smtp.client-ip=209.85.218.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="u6iX+igI"
Received: by mail-ej1-f53.google.com with SMTP id a640c23a62f3a-acae7e7587dso387203166b.2
        for <linux-kernel@vger.kernel.org>; Tue, 27 May 2025 00:46:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1748331968; x=1748936768; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=2apj+2/E8vgrIKr+nA0N8eLInGCqIVYSVlwSMLdIif8=;
        b=u6iX+igIMpZ5iCp2Ldk4WBlyLzRwbeIrg0Qi7WurmfELxe6RAwrpudgwgBoIo8Mo8m
         EYxE6Mi1miA28wNdgNCDFxPqC8wAt9LkK5UqMkqBv2yZVFI/QRmScTh5b4JCvtDJpTTz
         pguPuuMplmwYLz4U9JqrgtYz/IyD4b2lX83Z//QKcz9Q0TVPeTPbYgnj9kY9Il3HvIcG
         CDPfxqaSuOyie2nLL3IenRk/pszEiSPbWmPpNA/hjXELbT+TN/cqWirKys+/3wRA3dTX
         L0n6SnutayxsKXpy3bgRUedNXHBJg/rIUwKGCE4qRMcUQEE7g+zbFL5lddtgof4tn+Hp
         g9gg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748331968; x=1748936768;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2apj+2/E8vgrIKr+nA0N8eLInGCqIVYSVlwSMLdIif8=;
        b=EAtKAPqrF+5fiS65m5saPnL2eKtC+YFEVfkg7BwjlKTfFJia4jftfgcWtYaDEaLPOB
         YSi1+sGy9shIXRW3QjSPrqTIqGzFSIGU6qWdqAaSq0e+GKDE5p3MDV08zWnpr7wwMWO6
         q1lnz8CpyKoPjdBRzZFeL3tnsdInDV07dR1KL9iEq0Si26dPZcpDZ5mBUpPR+lF8a6Zb
         yagHevdMJBksPwJeeo3i9BRRlGfFTEblPX5Kn3jBAFicbPXDBwx2nMS2Z2fUsYAGue4A
         WBtVZuJQDzb6ws0j9fNu+jSVB4wHZpQpuzsVA4k5XFNl9EuF+bxTy022MqFNRDT5Qs4u
         Z8og==
X-Forwarded-Encrypted: i=1; AJvYcCWYqfEpCjliPjZTy76xkZMHFYfkCkIL7QuOcyowcvgKEVTusfF2d6kmpkCLoXP6GW3+F5L0a7JJbQcA8+E=@vger.kernel.org
X-Gm-Message-State: AOJu0Yzuua0bjdFD+fFMhLkQfHFO8NlHf3CrIZ3yUL5chDyASxMZ8Pjd
	RgQLeB15W+/8aKoLFKqptH/dpl9RtxZ8lAnZ1Zer6VZGz42YFMXpbONwxNbeuhv1o1k=
X-Gm-Gg: ASbGnctcrOHIfCGNBNcd0eOUA22T/kejcWjt4mBDSMkfF+4DG5mfLQfPjPhC+URUv4N
	6rlH8Sb2LMaXnpXkibs4ByIRf2t2o/7gOdIMwcw9l8ELaI/MZY9fLQaBsLitjjxhJOp6CvwjIkC
	JQ6o4ffVRPVIxshO+G3AW4H0CQI9UR9JR0+s+3/tnYMNDxSi5stGxyLrAvflX0XrE3wovoOC9dC
	sHhU5D1d+RTOdIlpOSlNWJSwmMRNKc0+6Df1wgjXtGrutMAO4DBFkSqI1+i44JgOAYp0uwkzLAv
	Z9CBJkStlhr+UHVSyUE+4oZWKdzWJFpFTz72mEcVF5ra39BzzOUQjx259Gd6pSV2Vx43KG3xkCT
	CaWr6fmqc+w==
X-Google-Smtp-Source: AGHT+IHdr5lkHBNyQR2lwCI1Zx1yTjWeGBiSlBewwlacaL6tp/Bi3RSdo5x6f9SKZp3swZZHW87cBA==
X-Received: by 2002:a17:907:72d0:b0:acb:b900:2bca with SMTP id a640c23a62f3a-ad85ade9eb1mr1043489066b.0.1748331968019;
        Tue, 27 May 2025 00:46:08 -0700 (PDT)
Received: from localhost (hf94.n1.ips.mtn.co.ug. [41.210.143.148])
        by smtp.gmail.com with UTF8SMTPSA id a640c23a62f3a-ad52d4ca3bdsm1794033766b.160.2025.05.27.00.46.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 May 2025 00:46:07 -0700 (PDT)
Date: Tue, 27 May 2025 10:46:03 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Zong-Zhe Yang <kevin_yang@realtek.com>
Cc: Ping-Ke Shih <pkshih@realtek.com>,
	"linux-wireless@vger.kernel.org" <linux-wireless@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"kernel-janitors@vger.kernel.org" <kernel-janitors@vger.kernel.org>
Subject: Re: [PATCH next] wifi: rtw89: mcc: prevent shift wrapping in
 rtw89_core_mlsr_switch()
Message-ID: <aDVtu6dpKfWOyBn6@stanley.mountain>
References: <aDVUEHfa9q2zBD6i@stanley.mountain>
 <582b5bc4c4434934838ae28d77b7f73a@realtek.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <582b5bc4c4434934838ae28d77b7f73a@realtek.com>

On Tue, May 27, 2025 at 07:38:17AM +0000, Zong-Zhe Yang wrote:
> Dan Carpenter <dan.carpenter@linaro.org> wrote:
> > 
> > The "link_id" value comes from the user via debugfs.  If it's larger than BITS_PER_LONG then
> > that would result in shift wrapping and potentially an out of bounds access later.  Fortunately,
> > only root can write to debugfs files so the security impact is minimal.
> > 
> 
> Thank you for catching this problem.
> 
> > 
> > [...]
> > 
> > @@ -5239,6 +5239,9 @@ int rtw89_core_mlsr_switch(struct rtw89_dev *rtwdev, struct
> > rtw89_vif *rtwvif,
> >         if (unlikely(!ieee80211_vif_is_mld(vif)))
> >                 return -EOPNOTSUPP;
> > 
> > +       if (unlikely(link_id >= BITS_PER_LONG))
> > +               return -EINVAL;
> > +
> 
> Since I think this problem only comes from dbgfs path, would you like to just add a check in debug.c ?
> 
> For example,
> (based on 0 <= valid link id < IEEE80211_MLD_MAX_NUM_LINKS < BITS_PER_LONG)
> 
> rtw89_debug_priv_mlo_mode_set(...)
> {
>         ...
>         switch (mlo_mode) {
>         case RTW89_MLO_MODE_MLSR:
>                if (argv >= IEEE80211_MLD_MAX_NUM_LINKS)
>                        return -EINVAL;
>                 ...
> 

I'd prefer to add the check in one place instead of all the callers.
We could check IEEE80211_MLD_MAX_NUM_LINKS instead of bits per long
if that's more readable?

regards,
dan carpenter


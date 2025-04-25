Received: from mail-ej1-f42.google.com (mail-ej1-f42.google.com [209.85.218.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C17FA20C46A
	for <linux-kernel@vger.kernel.org>; Fri, 25 Apr 2025 06:53:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745563994; cv=none; b=QyfRgi3Ubx1dz5RdC2PQz6U53zyLiT3v8tKwh+Mtsr5iXqUC6Aaj3B731Voyu9RNBusKWWgES7W6ru4qEyX7Tkg/btxuz4gq/01yuwrFithtURL33ijq4a0Pf++obZFa82AyeUlsYqdpMFAE+nLUeERIRLtR+b/OsD5pmZzPPcM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745563994; c=relaxed/simple;
	bh=kWZESW0GG/oz2y5894KE52WFTqR3vuYMxklmsiy/+1M=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=uiMPbX92TJNlbxUtqimlYsuDeZRRcA0P8GdwA31/RI/HOqQ2neeBfguFwNiFGO5sed2D2jNW9N3pSzIPIGB8MkXebWufW2Itu7ZlY6LuWnRyHso4/Lom7vfXkU/GdDfsqNzk6GcG+U9nXrMswmoRKwMV/m3jiHXhhMwNAcRTRZc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=NZAK2jBW; arc=none smtp.client-ip=209.85.218.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="NZAK2jBW"
Received: by mail-ej1-f42.google.com with SMTP id a640c23a62f3a-aaee2c5ee6eso237882466b.1
        for <linux-kernel@vger.kernel.org>; Thu, 24 Apr 2025 23:53:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1745563991; x=1746168791; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=KO65CEx+RcYydFr/CzyZwwMVrrbrsdRqExGbOK/+azg=;
        b=NZAK2jBW9N/od1YbzOjR+brGmpyoPoW7iGMy3Cgi5SGCyW7dfaq4UFLby6IrcBmnYb
         cX5bb4mcS8y7SHMKXCU5kj4QEeNaAAmiuYZ85eyhG7/dSKke/IwSCfhiuk7eeXzwJFsH
         p/GbfZHLcY9158xsBOl2FvcFmGBJ3TFizCcm1foIaXB231ohHKH+BE4kYgZCedtju1BR
         MAJVoNXJ2SYHErMtFZ/jRQpEafdusNLWYDmTxmYvr3++QReTOf7tETCt+sh3e96bU3CZ
         mBzjwhIrjBXOXuqmMslh/fd/0GG3O9mEqn9vejRRbuCpcbEwQw2vHdQuPyvnxyXkc/x9
         yt9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745563991; x=1746168791;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KO65CEx+RcYydFr/CzyZwwMVrrbrsdRqExGbOK/+azg=;
        b=ld49yM8jCL1/6Pu/gCurz97e8CvoOCNvzVo5ZKM4Th9mlCQxRDdrRjjaVRwiO+cIjE
         eGuEK7f27FHOjhyFUDTrUp1io7egwqiPEq6HG+wFZ6eCqkMIHVHkNUsn6DDU0Zg3IkNz
         oRcCqrE5iHr4b01aCAKYPe/mCat+pj0eovLzVZCsM5kU10mSiF1tlUsaoovogk+EM456
         bMuDGD2cANKyR1bui/hCQI92oAHdRVmbmVfTdp0X89U2QzsEXIMLQg6zObCkZl7URoNJ
         jwIA5zSIxq6PcY6KTvwf1GQ61NyZoPbraIscPPE9Rr10DGv7fy+W4n1oA6Y1rdjW3KoZ
         zPaQ==
X-Forwarded-Encrypted: i=1; AJvYcCXonpKNT7XX6yHrDTTRr+hYQ5UvIZ0TYH18Q4vvmHHO0TciDgqYaYzB9Etp0hlGZnjF6Nunyrjh00EpaY8=@vger.kernel.org
X-Gm-Message-State: AOJu0Ywa95vPrS4tE8OeDZxnMNBdH5j8WM+T0WbMti1oDoNEXqqBGs7Z
	rzrtlQ9qD8BD6JpZfGlDCDtcRmPB0c4mQjm+NiPnNGKD8ReRpCVNSL5qmDqFUEE=
X-Gm-Gg: ASbGncur16qStBtrLtctX2oaFC3L1CH1IFj5YjUEtl5niOymzXIcTFMAqCs50k2Hxk5
	/TNFwHnVzF44APRFUfasuN3kcBPPS9fD0SWB4rK76zkWnE9c2uQ2otRZIWea12etl8UjhiQTbgR
	sXcL7DjEG+w4RxZovR2RWgiXy85HBDJtgKZk01JnraGKRvg1NrjMed+t+aPQN4mMzk3ZWOrT4US
	2SKeeLX02lFxxO6+RncDa5J8JoXHdvbnkPXkxFtUhuZ077RcnLGY7VbAXYXwbc80kMasGtOsPUA
	mFsBIvrzI5SnnVHStr64h89gYcCq+OzjElWoog==
X-Google-Smtp-Source: AGHT+IG58VzDkGFhm8Z0pviWxJ++MDZSR0fg5sx14OLcY5mVRrQMI1meGNjl2MrGAtIugid/tRuBDQ==
X-Received: by 2002:a17:907:9485:b0:ac7:75ce:c91d with SMTP id a640c23a62f3a-ace7108ac55mr108123666b.15.1745563990935;
        Thu, 24 Apr 2025 23:53:10 -0700 (PDT)
Received: from linaro.org ([62.231.96.41])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ace6edb1ac8sm82529766b.182.2025.04.24.23.53.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Apr 2025 23:53:10 -0700 (PDT)
Date: Fri, 25 Apr 2025 09:53:08 +0300
From: Abel Vesa <abel.vesa@linaro.org>
To: Aleksandrs Vinarskis <alex.vinarskis@gmail.com>
Cc: Dmitry Baryshkov <lumag@kernel.org>, linux-arm-msm@vger.kernel.org,
	dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
	linux-kernel@vger.kernel.org, dmitry.baryshkov@oss.qualcomm.com,
	Rob Clark <robdclark@gmail.com>,
	Abhinav Kumar <quic_abhinavk@quicinc.com>,
	Sean Paul <sean@poorly.run>,
	Marijn Suijten <marijn.suijten@somainline.org>,
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
	laurentiu.tudor1@dell.com, johan@kernel.org
Subject: Re: [PATCH v3 3/4] drm/msm/dp: Prepare for link training per-segment
 for LTTPRs
Message-ID: <aAsxVGtW+yNlFd5P@linaro.org>
References: <20250417021349.148911-1-alex.vinarskis@gmail.com>
 <20250417021349.148911-4-alex.vinarskis@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250417021349.148911-4-alex.vinarskis@gmail.com>

On 25-04-17 04:10:34, Aleksandrs Vinarskis wrote:
> Per-segment link training requires knowing the number of LTTPRs
> (if any) present. Store the count during LTTPRs' initialization.
> 
> Signed-off-by: Aleksandrs Vinarskis <alex.vinarskis@gmail.com>

Reviewed-by: Abel Vesa <abel.vesa@linaro.org>

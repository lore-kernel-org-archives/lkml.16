Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C585620ADD6
	for <linux-kernel@vger.kernel.org>; Tue,  4 Feb 2025 11:23:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738668218; cv=none; b=J49gvKwqU3DdYEsQCvLUH3S3A63jO23MpuAUBQhdg7sCqWaSyQ5NUHQ39XaMWMEM9iuhEoSMpSkJdBxQcCTZQ3d7TiYO3Zei+Nkcy/PJBsJIqsQr7wrU1a4iRopobI/2YX2avqyx+FistAPu5OMbJMS8CXYXSFiQIwMp5C9NbTQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738668218; c=relaxed/simple;
	bh=YE16wSZSM1jEDHn4eHNFsWzllz1XoI+VVEWQw4m6lQk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=jPf1+hvRMRm0l9iU/feiWIK/HkfUj4cexu4FxrfVCcSoiassdWnYh6iODIrswD3s1YKokrfcFgFIg5hTxUJLKeC/MjGTYQMMvXZke8d+BpEXUvmEtPXoE27TOMrNkLvifyM/OCXaUeR+CQl0IT1T6iuF444HrDPKv0QzKuhBCD4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ffwll.ch; spf=none smtp.mailfrom=ffwll.ch; dkim=pass (1024-bit key) header.d=ffwll.ch header.i=@ffwll.ch header.b=MmLdauDV; arc=none smtp.client-ip=209.85.221.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ffwll.ch
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=ffwll.ch
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ffwll.ch header.i=@ffwll.ch header.b="MmLdauDV"
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-385e06af753so2744666f8f.2
        for <linux-kernel@vger.kernel.org>; Tue, 04 Feb 2025 03:23:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ffwll.ch; s=google; t=1738668215; x=1739273015; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references
         :mail-followup-to:message-id:subject:cc:to:from:date:from:to:cc
         :subject:date:message-id:reply-to;
        bh=QwZVL4ItsJkt8HNxEi75zW4gz8K6ibP33hH99+wCC+M=;
        b=MmLdauDVAJ09XuUzI7qZSvCG3sxaL8CJaVdtsxPMNZMOaXti0oXaosVkI9+8xnuZug
         q2U7Q5iMFhvb2BqWo9lgPNSOmZhX3h8Ju9NN11CwCL4o9VwGrqC7JWvRzmRsMjk5x+YD
         mqJz+wL2DZzeXuWZX25oBxJMwbPfirC0SRaIc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738668215; x=1739273015;
        h=in-reply-to:content-disposition:mime-version:references
         :mail-followup-to:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=QwZVL4ItsJkt8HNxEi75zW4gz8K6ibP33hH99+wCC+M=;
        b=KaOdG0DdSaP91bY4j3MXQzrnW7j5wsNUnyL6qh8X3f05lcV2IJD7wOh2Daf5FiLNcF
         tfHuoZl3xcx9elu0AmjhZHhHBAovTfOqnGbSnOZhFQnwzPRA3zTLE2vZg7kxOE57RNXT
         7zIFOUMtykh97dZh16NxLYFdrtpKk5ee0yIT7yA8ojsagfzPvDx0OAyG5nhBK3P2g8gO
         km210YWbXrykr0QfnwiAgJR/oUBoXul/antWrZgepApnVk8bfXEKb+0ooGPGyapEfef/
         X/gSS0GGP9qlxj7jHoEwoDDpqPv3E+ku+A+q/OHZHs8LlxB7FcdPhA0leb0OQDhkPlYI
         PR8w==
X-Forwarded-Encrypted: i=1; AJvYcCXw4Yog7UzL7k8fIpBrWyOE9epPnbDR9bxY3KWfM2HSwzLy4fUHao8nAvReOnLFCb9v9xzklv+jcbF++8U=@vger.kernel.org
X-Gm-Message-State: AOJu0Yyt9vtMt3i3/1BGUkFjNNH7lcPI0u4QqXNeXqCjN1R4u30VFBVU
	QCNS/cBqtt8ocCUbPIYUn4lxZBslPPY7q1E7QIEcyVbX/jvXrj5uEImh1t6SwsQ=
X-Gm-Gg: ASbGncuqh/m9pLKO7QdMiK0ehmvBSyBjMsbYfUc5bXl511V0DTubEBS1MhCRQMfnpQS
	h4qGXOlSthzOp0iQP2fB0/6U2AsyBwSLJKH2Olt1dpPTBe8UyJcDKdG3qj4o5AkxhZm0TDjez34
	Flez8laSpOd54GQT+4ya1sBnj4UHRKEdLks/tpn/l2WPzMPEZG/kOb7u0t6NgdiZKpFxKHLjejT
	PoJEB5skjghbCrN1LcXoqIk6HtO1HCdwklhm/Qpz4CsuuxG3p2joY4S/IG2xeVMjbNSc0Q7Fz3L
	oCZarxCHN22QQoUhqAj9G9o0xwc=
X-Google-Smtp-Source: AGHT+IF2ySgp494p/EV3jZKnKGpN7wWzTUU0SAUoEk+okGZwJMzwTcVEw8ptZMAaJniZlJc6TyKp+w==
X-Received: by 2002:a5d:6c66:0:b0:38a:88ac:ed15 with SMTP id ffacd0b85a97d-38c51932019mr17414601f8f.4.1738668215002;
        Tue, 04 Feb 2025 03:23:35 -0800 (PST)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:5485:d4b2:c087:b497])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-438e23e5d4csm184805245e9.19.2025.02.04.03.23.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 Feb 2025 03:23:33 -0800 (PST)
Date: Tue, 4 Feb 2025 12:23:30 +0100
From: Simona Vetter <simona.vetter@ffwll.ch>
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: Jessica Zhang <quic_jesszhan@quicinc.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
	quic_abhinavk@quicinc.com, dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org, robdclark@gmail.com
Subject: Re: [PATCH v3 2/2] drm/tests: Add test for
 drm_atomic_helper_commit_modeset_disables()
Message-ID: <Z6H4sjDt2ewIiObs@phenom.ffwll.local>
Mail-Followup-To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
	Jessica Zhang <quic_jesszhan@quicinc.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
	quic_abhinavk@quicinc.com, dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org, robdclark@gmail.com
References: <20241211-abhinavk-modeset-fix-v3-0-0de4bf3e7c32@quicinc.com>
 <20241211-abhinavk-modeset-fix-v3-2-0de4bf3e7c32@quicinc.com>
 <njx2ogued4bbu3ub5jlnczql3x2dr4i72onhmh35tgxyuf3lek@3liwh4butumk>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <njx2ogued4bbu3ub5jlnczql3x2dr4i72onhmh35tgxyuf3lek@3liwh4butumk>
X-Operating-System: Linux phenom 6.12.11-amd64 

On Thu, Dec 12, 2024 at 12:50:35AM +0200, Dmitry Baryshkov wrote:
> On Wed, Dec 11, 2024 at 01:18:43PM -0800, Jessica Zhang wrote:
> > Add a subtest to check that modeset is called when the connector is
> > changed
> > 
> > Signed-off-by: Jessica Zhang <quic_jesszhan@quicinc.com>
> > ---
> > Changes in v3:
> > - Use BUILD_BUG_ON to check connectors and encoders array sizes (Dmitry)
> > - Renamed functions to be more test-specific (Dmitry)
> > - Added comment description for test (Dmitry)
> > - Return get_modes_fixed() directly within the encoder get_modes
> >   function (Dmitry)
> > - Move drm_connector local variable declaration to top of function
> >   (Dmitry)
> > - Changed drm_test_modeset() to a more descriptive name
> > ---
> >  drivers/gpu/drm/tests/Makefile                |   1 +
> >  drivers/gpu/drm/tests/drm_atomic_state_test.c | 244 ++++++++++++++++++++++++++
> >  2 files changed, 245 insertions(+)
> > 
> 
> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

Pretty sure this blows up with CONFIG_DEBUG_WW_MUTEX_SLOWPATH enabled.
Seems to generally be an issue with our kms kunit tests, so probably also
something we want to fix in CI.

Plus a pile of work to sort this out I fear :-/
-Sima
-- 
Simona Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch

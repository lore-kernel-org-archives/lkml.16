Received: from mail-qk1-f171.google.com (mail-qk1-f171.google.com [209.85.222.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6148118E25
	for <linux-kernel@vger.kernel.org>; Fri, 28 Mar 2025 11:35:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743161722; cv=none; b=QyCtSqZIRG2sVdV7dQ625+Ytaq2nUhMNbgPrULlaKTkyIAXF4uva4VSWS6KT8qtAzEAcYEpgYa1v3B2LQRG+Sky5ajg0MW4RIj3RZlLsd+E8BWITE1ZaSoUhF7HoGXHpU4w29CEzizeZPfpHQOQcthQFGsLFooOfbFbqEpU3K7Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743161722; c=relaxed/simple;
	bh=pd8PN3p/9kcncZ2GucwiT4TwhVYWesPdmNLpevSyZB8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=uCtrzZ9fD3+oB4Creo81qx0j5HFN3WMeaQbDT9eaiXnopcCfBrduF3DepWigT6ylKCPngtc4PJIijUHm/a2uX6vEowHgm0yBO/BxMCdx8wqr0uFNYa+s+1wb9LsjLBWBkzRIgQC/rHJhEXk6xCqPj+eHiDVxZOFMWCbNmBy3Yvs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=fooishbar.org; spf=pass smtp.mailfrom=fooishbar.org; dkim=pass (2048-bit key) header.d=fooishbar.org header.i=@fooishbar.org header.b=UdP80sww; arc=none smtp.client-ip=209.85.222.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=fooishbar.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fooishbar.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fooishbar.org header.i=@fooishbar.org header.b="UdP80sww"
Received: by mail-qk1-f171.google.com with SMTP id af79cd13be357-7c58974ed57so216245685a.2
        for <linux-kernel@vger.kernel.org>; Fri, 28 Mar 2025 04:35:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fooishbar.org; s=google; t=1743161719; x=1743766519; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=pd8PN3p/9kcncZ2GucwiT4TwhVYWesPdmNLpevSyZB8=;
        b=UdP80swwZZjc7hI1C5Tl1AaegITDVgFPh67Wv5nCWCEdtFzxel6JJRSEdUW+XlNDRu
         N4oJTJMhe38EYep74q457l6iVlgKGdrr2aoNRYgdhjPSLLg3/EHa+UcIsvCgZ4l2HC0M
         CIGbu2PNSnymymBITZRVcgt1oa1m2ZcsOUV6pacc7ipiR+1//PUPSfXtjSI2+OX95r/i
         qpysiXO+rFGrISfmjQMtzBhk8juxNYeZKPV2VVIF62hr05/8dBShtuEo/LFhZCvT0k/N
         jQYyU/ActZB8Fjab+Dm0wHIiSl2mO4/XIL4fSB8Q/n7dZ/x92PaBvWjYcy8bihDf9Dxx
         71dg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743161719; x=1743766519;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=pd8PN3p/9kcncZ2GucwiT4TwhVYWesPdmNLpevSyZB8=;
        b=rZpRc8BEIoy/dUKnEvR0pxrRKz6Lrznr/rNMwjoOsWC6I/1Mfe84bF5UYBKxRQ0iiC
         h6wt065WK6QxgEZzAHp3lZo6BZt+inSX4ovAR2HYE5Rr5b/XoBZ8/UMK+egHlpz51ux+
         kmpLEIICZ1gA599cHeTSTSG22rmY+bdj/27Gl0rbhu5dSiLOLoX0Q5T13opBjwf3CQcg
         PqQbVcxQf/xc1E+JXm1zzhA7gMu96F8+TLV8okCPaDB2SRnv0Ow7EBPXY9oBEII0Z/Q+
         3kRmlNuotskhk7u4hRVM/I9Y7EeS5DjaMIc5ZfWoUflWChnDGfNIH+Y3JUjbn+emOWo6
         r63w==
X-Forwarded-Encrypted: i=1; AJvYcCXtGFChUg1rIWGdjBsopN6ZFdJaOixnO3g6HTPFH0M763kbe/rCw/r6DVrbuTywNtoEfP3TfHklzugjXTI=@vger.kernel.org
X-Gm-Message-State: AOJu0YygM9DC6aWAa9FSvgm6Y+DJz3gq3Pm/hpOIsbgPdOZxLa6dGJ8B
	nbg+WDaJBVu2cYpiYBD4Pu69snAO7raXavsgWiNvxAHXwA7sQoCwf2Udh8uRhkg8u+UvptmrK42
	ox8VjtwWvmq9C0nmuathlYH0QX8AVFM19xqWMBw==
X-Gm-Gg: ASbGnctJ3mTK+BLrlM5fAbjbmYk53u5/pe3Et+FcbX4NJtv/VlJcg3aCd+os83IEIyn
	VsYC+UHUMdZGVUVnzlfsRvp3nk4jbn4hLBlJnPhApem+Sh7BPvMA+AtJZS0GjBjdGyAjg0pjxYU
	GuTgjPoD0fB1FXWPAMaxOhDVYx
X-Google-Smtp-Source: AGHT+IGU/FLsYSVAavUZD7ktRkUnhsimm7RoBgs50oKXuun5E8Xt5sIYYsCRUWZIx6YbZMwldkrPM7yjhWbUWKN2PaI=
X-Received: by 2002:a05:620a:4496:b0:7c5:4949:23f9 with SMTP id
 af79cd13be357-7c5ed9fd825mr1126022385a.18.1743161719039; Fri, 28 Mar 2025
 04:35:19 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250328110239.993685-1-vignesh.raman@collabora.com> <20250328110239.993685-3-vignesh.raman@collabora.com>
In-Reply-To: <20250328110239.993685-3-vignesh.raman@collabora.com>
From: Daniel Stone <daniel@fooishbar.org>
Date: Fri, 28 Mar 2025 11:35:08 +0000
X-Gm-Features: AQ5f1JqqTavugbKkR-L4Seu2kshOIzEVZgcN1gS5a5w-02Htx7tpV1HQ9g70LxI
Message-ID: <CAPj87rNLqMxBgKGTSHMHT39agzu=GY-Dgk6Zma1oM1ztkTch3Q@mail.gmail.com>
Subject: Re: [PATCH v1 2/3] drm/ci: check-patch: unshallow repository before fetching
To: Vignesh Raman <vignesh.raman@collabora.com>
Cc: dri-devel@lists.freedesktop.org, daniels@collabora.com, 
	helen.fornazier@gmail.com, airlied@gmail.com, simona.vetter@ffwll.ch, 
	robdclark@gmail.com, guilherme.gallo@collabora.com, 
	sergi.blanch.torne@collabora.com, valentine.burley@collabora.com, 
	lumag@kernel.org, quic_abhinavk@quicinc.com, mripard@kernel.org, 
	maarten.lankhorst@linux.intel.com, tzimmermann@suse.de, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Vignesh,

On Fri, 28 Mar 2025 at 11:03, Vignesh Raman <vignesh.raman@collabora.com> wrote:
> Ensure the repository is not shallow before fetching branches in
> check-patch job. This prevents issues where git merge-base fails
> due to incomplete history. Set the timeout of check-patch job to 1h.

Ouch - an hour is pretty brutal. Is there a way to unshallow only back
to the merge base?

Cheers,
Daniel

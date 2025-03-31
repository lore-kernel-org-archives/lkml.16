Received: from mail-ej1-f48.google.com (mail-ej1-f48.google.com [209.85.218.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E4A201C84A0
	for <linux-kernel@vger.kernel.org>; Mon, 31 Mar 2025 07:55:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743407739; cv=none; b=LUXaNw4cBaI9/WQ03+koV6jH1uNH0iHWyHhE5Y62Ti5EkhUnhe4ARqO98K3eMZtL/Rk/D1RvISdLz1kuZSTd28WhxGlhAcIBdUHLB11JiV/dPt8BB25h+W2OlHaD9gfJq/MYKhRWzoaWPHxsilqK5XyruRdSHxZCysVyBqFvf2k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743407739; c=relaxed/simple;
	bh=WliF8U1ILHCsiMwS8P6jdATTIx02Pcdpo5FUAcN+sys=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=GQjZ26wJ3t9mGTeI9ODXg4VA7a3JSZO+kUqTgSdkOLoNOUablPe9wyqUHa6Mr4rcTDAEpxN3qB5kGYrll21AmHjKW4R8cVBGCoW4canmMn26GAsVMHDpEEYXSmUGMAhqIpaaGYK16G9vUbPq/NymfPoN1/XRG305pCsi+WSlj9c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=g3E22Phb; arc=none smtp.client-ip=209.85.218.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="g3E22Phb"
Received: by mail-ej1-f48.google.com with SMTP id a640c23a62f3a-abec8b750ebso653064966b.0
        for <linux-kernel@vger.kernel.org>; Mon, 31 Mar 2025 00:55:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1743407736; x=1744012536; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=jhSDhknLfaKoAskNTlrl4k31o/FzwCgA7zXF8gqAJQg=;
        b=g3E22PhbAYCXUhB5r1OZd2gRUVG91QT1qletnkOwtFoqx8YKMWpVC7M6hnCmxO/8wY
         K1Bo5MctP0xNruDs54o5D/eHvS34YOmoPvkAKB8hfiwn9NdD57d2V+TlMpwUvpFGyI6q
         sQwmoeaLQn/KN1Hzt1kLztUZ4LqdIkgzZ24enrGu/CyuZ2oAUUvweFdeuBSGcUj+3UoX
         eOM1JI3+fAJs9Yt/h8j9OHjMpx42FhuPuk311qKhyxLNMssa7D8GfgIbAhAqcTwPupeB
         5Pfk2L5PSz3aHYk0KVQdWTzI8odY1H86DB8N+dbiPKUNXbKn3Lh4LV37tFcN/uwC8y38
         8Imw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743407736; x=1744012536;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=jhSDhknLfaKoAskNTlrl4k31o/FzwCgA7zXF8gqAJQg=;
        b=u8AY4MQA0fjdXGHv2uO6dAlcz4KQoa2PIEBTSQhEUfWa4yN3X7M+gcGcWu3jNMCLFV
         jN0JKxVAYfl5rVVLw/UycJ6x1fVqGSWQbErsXrfRwbxgDhylnezBaK2omIv2bojQpmTF
         cbi6BqKplfCvYyBrqR2zMmcBA5KTQvUgFzwUkxVWcjgXSgLfZrwV7/6wJpJHSTPkbkJY
         +pl1b5gI0p2FICtZgQWVY33/giit/BBoFq4u0XOQRbp6/tNX6wCECQAi2XYcR1hS6EUd
         +zRoaT/9cVWXaMkk9MnB8kEoVIPpgmKUCTJkPXw338D0dN3Iq6F0k0BY4xzbQNZcCyZY
         wiDA==
X-Forwarded-Encrypted: i=1; AJvYcCWpL9Hsy2vNpuQOFeK6gtooJVMyNNROBVXuJSeVzvNuTSzclClAm15+ab3iQNYxhzeEdI3MJGdbG0ItY70=@vger.kernel.org
X-Gm-Message-State: AOJu0YzYTSRV9ib0fVnXcdbqsTvcRUJgiswLcy0xhDq6VyGeE9rNHu79
	GlLSS8mBTVSHY+3ypk+F6F9xN3Zu/xnQqRipjj7GZcahM2PXI1SXgDVzMYitHqsT0KQv6AC+rKA
	by2WnM/rTmcjuzf416X28fiTPVXY=
X-Gm-Gg: ASbGncsEIjaTUxHYkp5Vkx3pQ0gXJvinGLBC02iYgfXzckw1WKmcb2HpsqfOguKhKTv
	HCpEynVFo6KID8Ai70UtiHj9085czENCjHppGJHcZ3kYcpHlImhyE8IYt/yhSXQ5WMEJqHAswlN
	rOsIWXwth8N+6mfEJFkRtrO3ZlIg==
X-Google-Smtp-Source: AGHT+IG+P9tkPvhVhRPKISalG/60ZULdT19cun5J/nPAl6qjbLOBD+JT+BRWsBqhaBCLHd4636n+W5g3kjd2i/Cb1f8=
X-Received: by 2002:a17:907:2ce6:b0:ac3:413b:69c7 with SMTP id
 a640c23a62f3a-ac738be07f4mr640242066b.39.1743407735884; Mon, 31 Mar 2025
 00:55:35 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250327160117.945165-1-vignesh.raman@collabora.com>
 <20250327160117.945165-3-vignesh.raman@collabora.com> <v4dhuuuvfk63bakncz43z3ndjdze5ac7nrv6qvtpdnonfpetsx@5hh3vzcj336x>
 <20250331-amphibian-hopping-bobcat-e19a0b@houat>
In-Reply-To: <20250331-amphibian-hopping-bobcat-e19a0b@houat>
From: Dmitry Baryshkov <dbaryshkov@gmail.com>
Date: Mon, 31 Mar 2025 10:55:23 +0300
X-Gm-Features: AQ5f1JpQ9fyxYtLdrUedBGMD-ND6srXxfnPbzw0qqt2zxCvy4-i4JXwyMC3DrT8
Message-ID: <CALT56yO-=nQnTB=H4L-qnta4js3FB=-WCOFj8q57PPWjLY+JKA@mail.gmail.com>
Subject: Re: [PATCH v1 2/3] drm/ci: Add jobs to validate devicetrees
To: Maxime Ripard <mripard@kernel.org>
Cc: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>, 
	Vignesh Raman <vignesh.raman@collabora.com>, dri-devel@lists.freedesktop.org, 
	daniels@collabora.com, helen.fornazier@gmail.com, airlied@gmail.com, 
	simona.vetter@ffwll.ch, robdclark@gmail.com, guilherme.gallo@collabora.com, 
	sergi.blanch.torne@collabora.com, valentine.burley@collabora.com, 
	lumag@kernel.org, quic_abhinavk@quicinc.com, 
	maarten.lankhorst@linux.intel.com, tzimmermann@suse.de, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Mon, 31 Mar 2025 at 10:53, Maxime Ripard <mripard@kernel.org> wrote:
>
> On Sun, Mar 30, 2025 at 08:06:45PM +0300, Dmitry Baryshkov wrote:
> > On Thu, Mar 27, 2025 at 09:31:11PM +0530, Vignesh Raman wrote:
> > > Add jobs to run dt_binding_check and dtbs_check. If warnings are seen,
> > > exit with a non-zero error code while configuring them as warning in
> > > the GitLab CI pipeline.
> >
> > Can it really succeed or is it going to be an always-failing job? The
> > dt_binding_check generally succeed, dtbs_check generates tons of
> > warnings. We are trying to make progress there, but it's still very far
> > from being achevable.
>
> It depends on the platforms I guess. Some are 100% covered and any
> warning should be treated as a failure, and some have not started the
> effort.
>
> I guess we could solve it with some kind of expectation list, but I do
> wonder if it's something *we* should be focusing on :)

I think that we might want to limit this to `make dt_bindings_check
DT_SCHEMA_FILES=display`, checking all GPU / display schema files.

-- 
With best wishes
Dmitry

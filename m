Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2F64D16D9AF;
	Fri, 31 Jan 2025 08:41:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738312896; cv=none; b=TD0v0t7PdTLhiAVLkD0IGKZs2idRtxuLemeV3KU8h171VUQAOXrcfTgHeneJebv0mOO8m4n7akrcWaOPKGOWwHmfuHovTwutV+rdE76rtpDTLEOeItyBZQ7ENRIXLSmIEj/e+GycnedHKHcEBh3aAqS+B97+LapN+9aq2TckVyA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738312896; c=relaxed/simple;
	bh=dz84W38YrLe79YON9mz8Gp+CDtsAF2fVPzbKhg21CIs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=M6y3yzUGnYZcDcGr1Lk2DVHBQGdqTDFpx9MJpnxgdl66l0U/W7Nheq7G/injIAQAJ2yPpuEp1yBo9tIq1QPL2tJpKqfL+OW5/26hM7Fryi+aBKLwyggfAH6Xs0epHXulsYf/+MPhSs1T9ePSXeahJK45YglCQ9GOGqCYt+G/AE8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=DvCK1zWa; arc=none smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="DvCK1zWa"
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-436202dd7f6so19678885e9.0;
        Fri, 31 Jan 2025 00:41:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1738312893; x=1738917693; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NFGFJLeaz2HAGkOCSKYlYf0/2RFD85s/ExqGLb/n/Go=;
        b=DvCK1zWa4eX2j6EtU18siUV66NleCLHDfy2+yGs/OjA46IoTasfo8IN55rVSk4YqhA
         RMe28IMmouYuRzBwJ5H8VCBqddD4rVx3y80RaAt8BkEFTpIxmGnhBTIa2KCJS3gTzoOw
         /laQ4J1XEdvS7QEvWIEuASYP1kzbovnNtGiOUQCZEDrC06a0ho8HEl+8A+RwNgEY9++m
         Jw1+vznIcZFaPsI3yCvDYrB5D/CX4z/Kp93G0usQ4BLZMyqnxApdNJUgtF6xObQjK5YY
         0A8bZ/IngAsrHCnjORvwzl/JaT9+NSDY7aAY18EgdBVi/2+ozbGssysfvpDiilMdG/rE
         iIkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738312893; x=1738917693;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=NFGFJLeaz2HAGkOCSKYlYf0/2RFD85s/ExqGLb/n/Go=;
        b=EPkN6wDwUIi2PbUrIBjQ0yD4zupbRd/BaAXcOo+Y7UO3cm1JoJWQrs4kn0AGX044dh
         nna2Wmuv5aWL82wpWOhNi5EFNgYetLd4DxJetJB7Pj32l3ZXu+3rxjE1W+iGLscU0g10
         XJjM/SKCNB2FaPEc24y1VX/62dAr76U8PHB/ovc7KWVpyibqquakEbQ/WSxC5LUZCX+Z
         /Iq+Qw/WWAQ4s7bAnD1zX+SvdQlTaU7ert+Ina0jFnPfb3GEeaz6N7koStEqFQc2k3ls
         VLWCVsZnnQpb93SlhXYN95vr4dn2EnbR+onqlbceSkF24OF9872DooR7WnEoyuWErSIV
         tDKw==
X-Forwarded-Encrypted: i=1; AJvYcCXWcNGSd3J7c1g3qyf6Xmf3/37ROsztnXVIcTsJtQMYsdXuPWsbiMOH8gyItte1K33sRkeYvbadmoYvDOnr@vger.kernel.org, AJvYcCXdbDXpK0JeQ8vumJiJqrIiHFiQaNAiM/m/liguad0QV+9QnNU8UgtvaLjb3fg9xVCoDcS9HQjGRT4=@vger.kernel.org
X-Gm-Message-State: AOJu0Yxa3F4KPc2vBEGMDVqJkCKQvnD8d5q5v4M++9qWo1qxqBxOU77G
	bh/VRvWmzVswcKJ8GsYqR4f3MsM8pX+wdYMNpws7vSYJY259skl/
X-Gm-Gg: ASbGncs0Ti/glCnFrnNLxGYefj2HwcTEoin/ENCA8gQLTq3Lfop6d9FLKaSAJ8ciNyY
	cL+4u7S0UIrlIrIGmDYgc73PoYPpBWZmBzGy7xW+pFJnki86iq1lmI0W27/TmLG1jFPMkp1O1XC
	7ZL5jUK3ch6iXY0EXDr5VcDe8x8BkpvP3dxEGfaAuG2N5z0+Ep/Cnxam23cuhoN1Sxput/79DyX
	sHSteVWX42nKfEHi63u6CvUW4rkVQqIMn7SgPsbezcIRW2sNg1mD5d4n9skcO+98HqH1A2nS6IE
	Fg/gnBIeumCPK0tD
X-Google-Smtp-Source: AGHT+IEaE6yGIZDx54kroqIVqmGJoHqCF0sYGEIUuOHDq3Omq4BWLMf6QtZU5j2yfl1l7rvtmAeqAw==
X-Received: by 2002:a05:6000:dd2:b0:385:f0c9:4b66 with SMTP id ffacd0b85a97d-38c51969feemr8075197f8f.33.1738312891560;
        Fri, 31 Jan 2025 00:41:31 -0800 (PST)
Received: from fedora.. ([94.73.37.161])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-438e23e6860sm47975155e9.20.2025.01.31.00.41.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 31 Jan 2025 00:41:31 -0800 (PST)
From: =?UTF-8?q?Jos=C3=A9=20Exp=C3=B3sito?= <jose.exposito89@gmail.com>
To: louis.chauvet@bootlin.com
Cc: airlied@gmail.com,
	arthurgrillo@riseup.net,
	corbet@lwn.net,
	dri-devel@lists.freedesktop.org,
	hamohammed.sa@gmail.com,
	jeremie.dautheribes@bootlin.com,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	maarten.lankhorst@linux.intel.com,
	mairacanal@riseup.net,
	marcheu@google.com,
	melissa.srw@gmail.com,
	miquel.raynal@bootlin.com,
	mripard@kernel.org,
	nicolejadeyee@google.com,
	pekka.paalanen@haloniitty.fi,
	rdunlap@infradead.org,
	rodrigosiqueiramelo@gmail.com,
	seanpaul@google.com,
	simona.vetter@ffwll.ch,
	simona@ffwll.ch,
	thomas.petazzoni@bootlin.com,
	tzimmermann@suse.de,
	=?UTF-8?q?Jos=C3=A9=20Exp=C3=B3sito?= <jose.exposito89@gmail.com>
Subject: [PATCH v16 6/7] drm/vkms: Add how to run the Kunit tests
Date: Fri, 31 Jan 2025 09:41:27 +0100
Message-ID: <20250131084129.2919-1-jose.exposito89@gmail.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250121-yuv-v16-6-a61f95a99432@bootlin.com>
References: <20250121-yuv-v16-6-a61f95a99432@bootlin.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

> From: Arthur Grillo <arthurgrillo@riseup.net>
> 
> Now that we have KUnit tests, add instructions on how to run them.
> 
> Signed-off-by: Arthur Grillo <arthurgrillo@riseup.net>
> Signed-off-by: Louis Chauvet <louis.chauvet@bootlin.com>

Oh nice, I missed this in [1].

Reviewed-by: José Expósito <jose.exposito89@gmail.com>

[1] https://patchwork.kernel.org/project/dri-devel/patch/20250129110059.12199-3-jose.exposito89@gmail.com/

> ---
>  Documentation/gpu/vkms.rst | 11 +++++++++++
>  1 file changed, 11 insertions(+)
> 
> diff --git a/Documentation/gpu/vkms.rst b/Documentation/gpu/vkms.rst
> index 13b866c3617cd44043406252d3caa912c931772f..5ef5ef2e6a210382a070eaf3552bbce75b04ff0c 100644
> --- a/Documentation/gpu/vkms.rst
> +++ b/Documentation/gpu/vkms.rst
> @@ -89,6 +89,17 @@ You can also run subtests if you do not want to run the entire test::
>    sudo ./build/tests/kms_flip --run-subtest basic-plain-flip --device "sys:/sys/devices/platform/vkms"
>    sudo IGT_DEVICE="sys:/sys/devices/platform/vkms" ./build/tests/kms_flip --run-subtest basic-plain-flip
>  
> +Testing With KUnit
> +==================
> +
> +KUnit (Kernel unit testing framework) provides a common framework for unit tests
> +within the Linux kernel.
> +More information in ../dev-tools/kunit/index.rst .
> +
> +To run the VKMS KUnit tests::
> +
> +  tools/testing/kunit/kunit.py run --kunitconfig=drivers/gpu/drm/vkms/tests
> +
>  TODO
>  ====
>  
> 

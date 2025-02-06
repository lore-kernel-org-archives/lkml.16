Received: from mail-yb1-f180.google.com (mail-yb1-f180.google.com [209.85.219.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B4E01624D3
	for <linux-kernel@vger.kernel.org>; Thu,  6 Feb 2025 15:17:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738855052; cv=none; b=LnnCRCgDMBEAtbf8B/nRS0QCC776wLciapZGVGZZbpYJ7zrZuPmfusNJkZ+zx17vNkLn1TujRm1niSRDg2+6MIX3Lc+FIfaj45ZVDf2KsKM5MmDyEegvJ4xdukLG0OXOlCNmBSLMLy7a0TZjmfl7a7RR7OvdskBZIAMEFE+MpIg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738855052; c=relaxed/simple;
	bh=GLeHLJ4dTP7E8iZuxbVL1Lx//H3fKAthDU+RMMxQi9I=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=g4OmmlgWFpjM7wRUlgNUwuO8Slc89mMIzIgk3TqCgVC7OFBOImJ6NIl7nNOUrXzO/xoNeXQ5R3fjjJdRVXHFJt6IStJlq9e03jMO+wWAqjN3hSRE4/YuvrpYjID+KXiXkvLxKQ2TAdfqClcwUlOOVxGrh6MiwOgyQ0N7IXLWRi4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=dSEhVkAL; arc=none smtp.client-ip=209.85.219.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="dSEhVkAL"
Received: by mail-yb1-f180.google.com with SMTP id 3f1490d57ef6-e573136107bso862471276.3
        for <linux-kernel@vger.kernel.org>; Thu, 06 Feb 2025 07:17:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1738855049; x=1739459849; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=GLeHLJ4dTP7E8iZuxbVL1Lx//H3fKAthDU+RMMxQi9I=;
        b=dSEhVkALAdt+UCGNKLVkvZE9cXCGhlMXsKHR8DT5P2Rjj3s4nhZa0aDlA6nrsr/BLc
         HRYR6MaGbMpt6eceDROLuDCRL+dRmZd8UFkjiO9E6FaMENk8SESasosPvekfutPfE4g6
         ZnmDPD0KKCH83icbi0I+6LjqQwu7GtRSiFRkTDLMbhU7Tb8goXkfiO8kWNMX7EDHDRz2
         5/KZHxA/N4M9wy8F2/ApfJ9ydkgYC3aJ3wxt4JMpCe/db5rRRJRpfD8wGr5N1zctsnm9
         tcJIpiV4cKza3wZaLZbw4sDr7nIeY7Ra1ZNkna3Rh2tIMHdKAT7X3+JYuJah8hy9k2qO
         xU5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738855049; x=1739459849;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=GLeHLJ4dTP7E8iZuxbVL1Lx//H3fKAthDU+RMMxQi9I=;
        b=luP0SktMdA0p6XNSGlben+4F45ZMtoHf4asq7BbQfdHNIntqXZdI3RhNFjDL84m2Ia
         X+j46O5Eo+Mwt7/9oZ3kGdKWomyuR+5YLoq4eDAmyyClb0N6GxmIXvX46gC5v9/XjiOS
         Sbx8FGo4S+/u3j9vauSNjls1Zc/LTyWTzbjsN1+F7xDTFGBwE72OQqE9zLGYawC7NM8J
         wusTOcI94KRQ6O3Bg8rYksL8v8pLgIOaim+HF/oKyyTSN/Mf4xImD7eBFg5GHgyxUQR3
         6xPDzr7uV6+6zNp0YuJ/Z+h4cuZjT+K1Leae3dufUi5w7c1/2md3RFZ5xScGcnG6eElP
         B8HQ==
X-Forwarded-Encrypted: i=1; AJvYcCVRbPjPb7eNbV881tflOWVC/7lRSboRjnHy9c6TraqeXA78x4tGSYi4jtSuhJ1MERFxoF9F3o4FvPFqLFI=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx3KJbnWAuwSQxh0IRxP9WD8oDPuoTKoCSX+t3NoiuZGZp8rETc
	N+Im5o06Hkfy5bE4lXnRR5LmYYms4Gh2e/953S1U+iwFe8UXMzUVsLILNUzdUOH0LJRWbheCM8m
	VTgi97fBPh/u1m/EtAuCoyRKG7lAglw==
X-Gm-Gg: ASbGnctf+OZZThAb2d6BudEjm6pDehhOxgSOsCjVuREk6xajTkXrWWVvIo/XUAdSRFj
	KzckqJKb9en5ReB0xq0InIK5d2iFaFXkLkXrywqOHee+wy6XUGQTWFNvvyMsMZ1Jz6HvJmM34pg
	==
X-Google-Smtp-Source: AGHT+IGMAk7h1l+VLuXpBW9KdulzM/beZO9YobXDgKF7w4a7gcBwfC19sP3jRcJt5I6wjLwOWd9tlWLXouwVhAPTRoo=
X-Received: by 2002:a05:6902:1610:b0:e5a:e6eb:d43f with SMTP id
 3f1490d57ef6-e5b25bd8578mr7254506276.39.1738855049274; Thu, 06 Feb 2025
 07:17:29 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250125-virtgpu-mixed-page-size-v2-1-c40c555cf276@gmail.com> <2f3394a5-0c63-49bf-bc85-f43388050ab8@collabora.com>
In-Reply-To: <2f3394a5-0c63-49bf-bc85-f43388050ab8@collabora.com>
From: Sasha Finkelstein <fnkl.kernel@gmail.com>
Date: Thu, 6 Feb 2025 16:17:18 +0100
X-Gm-Features: AWEUYZmak8RYbRBdTfGCYVsVD52QCFajpZoD8KmZtk7U4DxgRQTHDHmLd0XqdII
Message-ID: <CAMT+MTQrKWzNfsUqiDawCv=s84XOvUGwsrv34aqmZ6rR482OqA@mail.gmail.com>
Subject: Re: [PATCH v2] drm/virtio: Align host mapping request to maximum
 platform page size
To: Dmitry Osipenko <dmitry.osipenko@collabora.com>
Cc: David Airlie <airlied@redhat.com>, Gerd Hoffmann <kraxel@redhat.com>, 
	Gurchetan Singh <gurchetansingh@chromium.org>, Chia-I Wu <olvaffe@gmail.com>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, Simona Vetter <simona@ffwll.ch>, dri-devel@lists.freedesktop.org, 
	virtualization@lists.linux.dev, linux-kernel@vger.kernel.org, 
	asahi@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

On Wed, 29 Jan 2025 at 15:40, Dmitry Osipenko
<dmitry.osipenko@collabora.com> wrote:
> Otherwise, the proper solution would be to pass info about host's page
> size to guest using extended virtio protocol.

It is not fully clear to me, as to what exactly is meant by that.
IIUC, virtio is a spec managed externally, so does that mean
that i should write to the virtio people to add the relevant bits
to the specification?

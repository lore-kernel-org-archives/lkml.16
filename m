Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC6E9225A39
	for <linux-kernel@vger.kernel.org>; Tue,  8 Apr 2025 15:48:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744127305; cv=none; b=u4s3eG70gL8aqAYdFL2bvfA6ofjGU2wlcAImMQoCswShTrpfKyU18uvRCNG0FiIrg+jZTdsKTRzRKJCxBvjelKZE/sRvhwh8/xA05wOfq0kSgdt+aQT8Q46tyOX+ApGgOmN0+9Q9P7Umc1m3TRjZXLczOX/4YH956AnDZiurkmE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744127305; c=relaxed/simple;
	bh=A0X2oY7kJM6AnHWEVzm/3YKFeirzE3HktAc2i3L70cM=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=qJbt9sLVoS253LYnF6hF0GXCxSJEtTc0v/QobjKSmAPtURROVRaoO46k0WyftqE3Q6xN4dIq1zIpf4KkmmGlpSr0E4n08M8j7ZzTTfcz6Gyb5W9HI+x3XiU+rMjqozSE+SdCA/6I9mKRRiAvmNWrNFg7HkksGPTDJeJpi0Ud2v0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=e/uslT+T; arc=none smtp.client-ip=209.85.128.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="e/uslT+T"
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-43cf825f46bso4958095e9.3
        for <linux-kernel@vger.kernel.org>; Tue, 08 Apr 2025 08:48:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744127302; x=1744732102; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=QaaXIgNJLKIxXw7YwzQeOHsKq9Pk6Yi0MGZAiqMRFcs=;
        b=e/uslT+TLhO4ktDzjD5d8tJjxjjuaUhDTJ9gCikBv/57z9dotvmAWP6+S379hMxkhn
         YWCLKnWqnp9qer07A51O43fhh8uW2DFDe0dllY+x92FOfR6AKkzIMmD2qrBohn5lCjFk
         CTzseguGNi7U9A9DAHTG9neHiMDrnPCTXo5d9Qq5AC52OvwWw8ULZdZ8Gx9TUSNJOMll
         iSObOWA3XgsbP4RUz3oM+HPhfpfn9l3TqVd+tXcxzkZXNFZ14/3SSTpTEOLH8uzxzOPe
         tOOKW85RmWm2vq7j17I0vw9hMeJqTcfEoEFLs40c4GGHrPM74AXIZPEIehcZJkIlEW6h
         vhWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744127302; x=1744732102;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=QaaXIgNJLKIxXw7YwzQeOHsKq9Pk6Yi0MGZAiqMRFcs=;
        b=WNml7K2NOOPgfOUKddy091Gqv7FWp2Ee9mohbYUzZ874KZeH2VT4F1tPTO73vuF+Dh
         3IRUjw1fPFFPoZeQoga6G2h/9IuGzkI0/6DdZMyxhvn4gKf4hpTzl0xdTbQeaV6xsKOQ
         zhBbwHC7MT4W3kyMIIUy0+P+0URs5uep+r3cLxJMezzXhy8K26puKOs7wUBYP4rWT0OE
         meR1CHMm8NgfHPiWLm8ccY3sI8LlQNVaZi89ZwVL3LNYmXgp5irIGXs7cJ+q1i0DZHJc
         S+yVuXq6oEJZS+3IhPyKg+2zSvsbnyW+mLS7aYD06dhEh82/6Fn3ymxrFBUjQPZ2SDE/
         K3ow==
X-Forwarded-Encrypted: i=1; AJvYcCV1YfHMyGRJ/55wzxYfFdsUEB6HbklAawdOgvjiU7in/5RpcOLQ8MbgA1JvtMn0yBz3jl2wNiX/MFXr0cA=@vger.kernel.org
X-Gm-Message-State: AOJu0YyxVwpu11GCHWlJI7ZQqxdAnkclpmtZHDMZzHGPlBR3WM1Kg3vd
	yBfeAgtp22aK+pZBpdfDEyvxFciUd26PP49G2Vk+Gv4lWpa3GvQpkQZ9H3uV
X-Gm-Gg: ASbGncuyFa7zTsC0zQp6P6iBVR4kO/TTS4oDQ4QFC46hWkmaXRKSlZKL6fPuB94vVdG
	o+AkMULn7xSW4+AUpm4/jzqOQEYVhGUR7uCSdQI2M5IdGSfuZkAlgzFnYfMqt1K1yHQUPN0jdxh
	H+OVnbKXhyyCDCMT9TkQhX040xhKk28wvn104rO91b+4hVS/hSOgRyAGLe+jCXETqfc0+Kvjqm2
	JiV2CtW3cZagIBNMEZKG4Nwei/toUTOcNjuqtlB5+e03k7nk0e/XsKeUFhG8MudQIn/DYosRZKo
	1Qu8gy0h//E1uhd4H56LFmivUzMgSDglrfLZi4qqJ0bSo5CMVJ0Ccyvq
X-Google-Smtp-Source: AGHT+IF5OWquYgZ+SqsV3ILAxabDl9QL1OXepjXtseXsxMMluVO2opI4lBuuPbsE4nzLYXiKTparIQ==
X-Received: by 2002:a05:600c:3b9f:b0:43b:ca39:a9b8 with SMTP id 5b1f17b1804b1-43ecf83ec83mr56894605e9.2.1744127301550;
        Tue, 08 Apr 2025 08:48:21 -0700 (PDT)
Received: from mosaic.enunes.eu.com ([85.93.96.130])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43ec366b571sm166903995e9.40.2025.04.08.08.48.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Apr 2025 08:48:21 -0700 (PDT)
From: Erico Nunes <nunes.erico@gmail.com>
To: Qiang Yu <yuq825@gmail.com>
Cc: christian.koenig@amd.com,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	dri-devel@lists.freedesktop.org,
	lima@lists.freedesktop.org,
	linux-kernel@vger.kernel.org,
	Erico Nunes <nunes.erico@gmail.com>
Subject: [PATCH 0/1] drm/lima: implement the file flush callback
Date: Tue,  8 Apr 2025 17:46:36 +0200
Message-ID: <20250408154637.1637082-1-nunes.erico@gmail.com>
X-Mailer: git-send-email 2.49.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This prevents a user bug in lima reported in [1].
I'm not sure this is the entire bug fix, but Christian had also
suggested we implement this callback in a previous review [2].
I took the amdgpu implementation as a base for this.

I noticed that most other drivers don't implement this though, in
particular the other ones for embedded GPUs. Should they, or does
this indicate that we have a different bug to be fixed in lima?

[1] https://gitlab.freedesktop.org/mesa/mesa/-/issues/12007
[2] https://lore.kernel.org/all/20230606143247.433018-1-nunes.erico@gmail.com/T/#mf5c7a2492201c8ec82bee47eb5615714d5c5aac2

Erico Nunes (1):
  drm/lima: implement the file flush callback

 drivers/gpu/drm/lima/lima_ctx.c | 18 ++++++++++++++++++
 drivers/gpu/drm/lima/lima_ctx.h |  1 +
 drivers/gpu/drm/lima/lima_drv.c | 17 ++++++++++++++++-
 3 files changed, 35 insertions(+), 1 deletion(-)

-- 
2.49.0


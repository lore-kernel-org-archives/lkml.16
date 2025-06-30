Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B6F3C285C9C
	for <linux-kernel@vger.kernel.org>; Mon, 30 Jun 2025 15:41:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751298085; cv=none; b=pw0HXsCckXgCuVFvfeleQBUv0BratzhG+1A/FiNdzfqMiTTEs4oiEvXTodOlOKQttNSyuVgKpWe+nRss1vIuTnd5pHicsTqpPQJ89SvxW3QAWKgsBo/vM69gsPajiLSMT0ILrH94aiLy7qbFW2GourWKKQ1Y7Z0EU91UE1713io=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751298085; c=relaxed/simple;
	bh=dp4M1o18jvbyo3IZF1d8XpFW6YqauxGlQ8Ta9oRK/Pk=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=r1vsuLZcvyBDnlLUSOyLeeetqG3KpwG06EQDTeGRaaNFeGAasAJNT8OPfipTiHPymm4HpOxJBqQq+vI3Mnin/2bDQiYiminxSF+2MIdLQVFcXPIqmye0nfvhTiA41tEy/koT4ZNscwN26nMO+4Bv39sMSs8HysfoLpVEf3n/fEo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=nUSTb/jm; arc=none smtp.client-ip=209.85.221.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="nUSTb/jm"
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-3a365a6804eso2418004f8f.3
        for <linux-kernel@vger.kernel.org>; Mon, 30 Jun 2025 08:41:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1751298082; x=1751902882; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KseiYlHId62o+/W17588ZHb2GeDakhzrku8PZZP4CGk=;
        b=nUSTb/jm3Bw/Wa2oKHdXFMrDCQaoKTuL8TJY77eFDwfHNPGN7/gJAWvrngJQYwN118
         z5+rzYWlmGe4jH5sFSXDXk4AlxkQHKq/hliULq1O67WNtzRj3Djj1L2y/lKuPw4mm9va
         8WcC3oh/jlEwUvDKR2Z19bYWLBSZN5couMBdPasu3vCnNehPyXVkk7Ysq3dyb0DolHTp
         SFPWekNMNIL1oxt6eqIGdQ7NOcN1Q++FtWSx/3pXo9Dy5KMZtNTzkcapEl2ohM1bYIN/
         MpYOvtmnG04qqtUETmq7nsbBANTUN9+RWBiC2EPDSn9Ld867W7deSgkAwJ8zQloBMZBx
         2khg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751298082; x=1751902882;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=KseiYlHId62o+/W17588ZHb2GeDakhzrku8PZZP4CGk=;
        b=SkPuiEt8RetdmnG7nke2ScXd3XUG6awZTV9bgr+pHVsjQDAnw/TRCNbyjHs/+zhEU5
         8t3A5aVzztPHD02W1jA6QOUesZjaKkHE2P28HRNB+HwzHn+rSYX603FduCSxpYqlG50B
         paGLrhpwqkZ7eIBN5Sl0s+OoEibsvDaChgTcQv3W6zNlhFLX7DEud9VRzMqFMja3YIZZ
         ikaNY+KMWa/qhqkMuEJt0clDh0wjmnYxBU7MNTlqPyp6sh7p44u21T/y6w4L5MTKbYGV
         ac3HnA44oL6pkt53o+uuNZFtgM6w7Qrmk38GvjUyI7W/2EupmdCbidszXfxr4tavaQc9
         wUQw==
X-Forwarded-Encrypted: i=1; AJvYcCWPeXbc/8DBrsfAk34Qv7Xp1F0enXkTsnqpuP2vYuzmC2w4b3ZE8fM0XuThdWdtfXfzNLIqk44cbjrA3yI=@vger.kernel.org
X-Gm-Message-State: AOJu0YyqchNbf3Tb2v7duwgtm6GkhBQpNUWxtK1HZAzbPiuEawEpIuya
	P3FL0Wk6DQBz7IM1iKlW6jGEd22zr4VLq6JTu2ffh3p+gtRdWPfThGU6H9ibaN9oy9g=
X-Gm-Gg: ASbGncstL91qJnHBNTxI3HxCturMt9fVx8kQNOhIRYyCDkYASshoanTu7KB7IhQ9Ysc
	t9ikLPF3ZLU5m793ZZJYE6jkjt7Lriy/OVq2MXFuKwN3+V4xEy6ajaa7AGNUxvSekwJ6A+jRqAr
	YFqtiwhNTyym5PD3FW/yjBGcpm8fjFqVxV1HR3YNpXYzJIwt6qObYYeM/a6EBPjFlDTkAY3iwKn
	3uHzj7+44U/2IJJv8EGT1pee8TK1gDUL0tLDYdZuMPs9Gz23vE9nDJvvzfCLyiDhyF3PGhs0bRh
	uOs7jpvK57D0JeurfvmA7Jo9HYMDLkCTo4yDAY7ag4rJpQXhl7CvxNS6OBxOuwYp69D9PeVSKFD
	74wRFVQU=
X-Google-Smtp-Source: AGHT+IFWzLOIobY7pvawU+69BL4YqZzWGXgHVpyHRsypApfibBzKSF9kGVm7OZpx/NKr+Rf9FbbFXg==
X-Received: by 2002:a05:6000:2b08:b0:3a5:39a8:6615 with SMTP id ffacd0b85a97d-3a8fdb2a677mr7432498f8f.11.1751298081899;
        Mon, 30 Jun 2025 08:41:21 -0700 (PDT)
Received: from arrakeen.starnux.net ([2a01:e0a:3d9:2080:52eb:f6ff:feb3:451a])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-453823ad01csm170270975e9.22.2025.06.30.08.41.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 Jun 2025 08:41:21 -0700 (PDT)
From: Neil Armstrong <neil.armstrong@linaro.org>
To: Andy Yan <andyshrk@163.com>
Cc: quic_jesszhan@quicinc.com, mripard@kernel.org, simona@ffwll.ch, 
 tzimmermann@suse.de, dri-devel@lists.freedesktop.org, 
 linux-kernel@vger.kernel.org, Andy Yan <andy.yan@rock-chips.com>
In-Reply-To: <20250618080955.691048-1-andyshrk@163.com>
References: <20250618080955.691048-1-andyshrk@163.com>
Subject: Re: [PATCH] drm/panel: raydium-rm67200: Add missing
 drm_display_mode flags
Message-Id: <175129808139.2286551.9507645918020654828.b4-ty@linaro.org>
Date: Mon, 30 Jun 2025 17:41:21 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.2

Hi,

On Wed, 18 Jun 2025 16:09:55 +0800, Andy Yan wrote:
> Add missing drm_display_mode DRM_MODE_FLAG_NVSYNC | DRM_MODE_FLAG_NHSYNC
> flags. Those are used by various bridges(e.g. dw-mipi-dsi) in the
> pipeline to correctly configure its sync signals polarity.
> 
> Tested on rk3568/rk3576/rk3588 EVB.
> 
> 
> [...]

Thanks, Applied to https://gitlab.freedesktop.org/drm/misc/kernel.git (drm-misc-next)

[1/1] drm/panel: raydium-rm67200: Add missing drm_display_mode flags
      https://gitlab.freedesktop.org/drm/misc/kernel/-/commit/4dfed55bfb4b500bbc45867c1b83789cc4dbd106

-- 
Neil


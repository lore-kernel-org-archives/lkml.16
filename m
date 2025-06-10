Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2A65B28F528
	for <linux-kernel@vger.kernel.org>; Tue, 10 Jun 2025 12:17:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749557838; cv=none; b=d4NdcK8EQLBBJMOAfxzFLEc+0HVTX5MT9NbjN/1Y53WGq+xiQb5APX0v8Bt92ar1QZa5vhZTmHqf2/f/98QsxlLhHVimyFMeGjohInsiLgLVo0RapLWeKqPW/xXfcI+UEFrpCcJlDFWGzSMZQ81ygAadO4FXp3c/X+nOm2N7V70=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749557838; c=relaxed/simple;
	bh=0VC+sLLOZG7BCgC+uj5XDcEADB8EqSJMOQuG/VZGLJ8=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=kygHaH89WES3n6ceU0C+T9LnXjr7kXq+dZLPm2+MsFe+AspGIohDm+vbHTB2B0yIPtURIPoW42Q6fMN/h81yp3ryAcj80OS/v+Bjq5zy+aRnGmMshAyrJ4KW5PSlh76DMnqbrAJ/h7oGIekPDINHHkQaovSWW26DL27QHV+ZK+c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=fQiUF66c; arc=none smtp.client-ip=209.85.128.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="fQiUF66c"
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-45305c280a3so9478395e9.3
        for <linux-kernel@vger.kernel.org>; Tue, 10 Jun 2025 05:17:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1749557834; x=1750162634; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yJibE8vzk8gYYAz656wGhXQdfbfshNUam9Sx/5ZqBBA=;
        b=fQiUF66c7qETVEN8lSTBv9M3pmr0+LtGClPRnWDXZiLy3PiMWJmJco23v3nggrJdSH
         jstrWcMXR3qK6tXlEoRCeHtJqCX8IE0kAzrae76C8g+FVEs8CshIZPyib011GWLRbk0G
         BsHuK/2yvRdbO8BQLRU/hCMG8On+zUiO/b14777AeoGwaF4DHo7RUTNsenw7lLRUhvQy
         K5Nmnq0+ZpEuI5zNW4AIYBvVobylSC1YsDDFK7t30K0zJ/N9eqZrs64tA+miM+AIZHON
         h7Ttjm9wlYrdFfajoJ+VWs8j1Ti9zZPk/jqWQ71tie6tnRv3eAoRYTBko8rjjB4XE8CJ
         JjkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749557834; x=1750162634;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=yJibE8vzk8gYYAz656wGhXQdfbfshNUam9Sx/5ZqBBA=;
        b=IicfY/NWtd/Xv03UHvmus9TiuH77S/0HrVDxlCdrx456EWF3qsAjAHzz0cNtrAYo7S
         TUCkKlOsSEA96aUCxztNU1+EwrCzMIqD2Aaz7xHNJCI9OBMkWsnPlDhICvmcPhIl0Hbj
         j5CLKMKsFY45QvkeHyr4nZQd88rKRsfPSClYNvhYEbfRwaH4r2assOCKbAnUE41/wSVs
         DN2949zLx9DA9eJTH4YF0epMF1V7A1t7K9aqp6UJecAMc30ADYsRPqBQ/zpGWGtmAh8l
         Ed/sefv53BCa+Ww6yW+EQByrdNFUOHacBdbCKTJQmBgGs6kCJyukRG6QEen2/7NzE9k8
         BjCw==
X-Forwarded-Encrypted: i=1; AJvYcCV6PI/vRVB58LJzzCU1XyF1j0G/NW0L8HRF3i2574v/KcLxlgK5Txs/5Z0tNOllQuFb2OsOxdQTaevgj0U=@vger.kernel.org
X-Gm-Message-State: AOJu0YxYgljdRYO4tLBCzdcSiA7EE0Vz3Zt8zcT1vWAxOvHDw8PGZFV2
	E1OdPkykkYVYlXIrLMmjEXzjr8bd5xlR68fFou6+JwAv45fNKX6KFpbWeYOc0WncgP4=
X-Gm-Gg: ASbGncus0yCZtQ9gRsqnu1gHlu35/DIVSy0f0fFFkhMCfrjjKWCAJ3rSu/mSVmSgGFi
	+23xToo1YuzrWtYvUkNsQrim4wtQEQnDA2dXPmd58c2E2Oyiwo4vNE3Lp6CnKciSOH/m5/cLCtw
	sKH/lzSfZLljYefS0kZVX4+sZHktsDfzc/mB7C2MnEaxWtR5jeR0gVawhXpnsLKq5ezJTUW0S7n
	+WbChV4NAItqab6C6z8jouontO4OgKN+5Z0Dgs6lzxdRTTvcrk2PyHWJvdsz2zJvuCNTY6hwTA4
	CQrKNhf3FxVhs+TebABDKkfrgwwJvkp2FwRBvktrpkahs33R5qm/t/f7LpIhFcMQcZ12GWXj38D
	Z9je6nIMYdxh07/z2+g==
X-Google-Smtp-Source: AGHT+IHeRxL7AIpQs/dULM8FxMsmTh1TJE0pgJiXuKAcZExlRGsP8IQNBSgadCI7/pKMwjfUXDxtaQ==
X-Received: by 2002:a05:600c:1e09:b0:439:643a:c8d5 with SMTP id 5b1f17b1804b1-452012ace18mr187168685e9.0.1749557834455;
        Tue, 10 Jun 2025 05:17:14 -0700 (PDT)
Received: from arrakeen.starnux.net ([2a01:e0a:3d9:2080:8261:5fff:fe11:bdda])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4526e1595d4sm136313625e9.16.2025.06.10.05.17.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Jun 2025 05:17:14 -0700 (PDT)
From: Neil Armstrong <neil.armstrong@linaro.org>
To: linux-amlogic@lists.infradead.org, dri-devel@lists.freedesktop.org, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Christian Hewitt <christianshewitt@gmail.com>
In-Reply-To: <20250609202751.962208-1-martin.blumenstingl@googlemail.com>
References: <20250609202751.962208-1-martin.blumenstingl@googlemail.com>
Subject: Re: [PATCH v1] drm/meson: fix more rounding issues with 59.94Hz
 modes
Message-Id: <174955783398.1721274.13530320235871545331.b4-ty@linaro.org>
Date: Tue, 10 Jun 2025 14:17:13 +0200
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

On Mon, 09 Jun 2025 22:27:51 +0200, Martin Blumenstingl wrote:
> Commit 1017560164b6 ("drm/meson: use unsigned long long / Hz for
> frequency types") attempts to resolve video playback using 59.94Hz.
>  using YUV420 by changing the clock calculation to use
> Hz instead of kHz (thus yielding more precision).
> 
> The basic calculation itself is correct, however the comparisions in
> meson_vclk_vic_supported_freq() and meson_vclk_setup() don't work
> anymore for 59.94Hz modes (using the freq * 1000 / 1001 logic). For
> example, drm/edid specifies a 593407kHz clock for 3840x2160@59.94Hz.
> With the mentioend commit we convert this to Hz. Then meson_vclk
> tries to find a matchig "params" entry (as the clock setup code
> currently only supports specific frequencies) by taking the venc_freq
> from the params and calculating the "alt frequency" (used for the
> 59.94Hz modes) from it, which is:
>   (594000000Hz * 1000) / 1001 = 593406593Hz
> 
> [...]

Thanks, Applied to https://gitlab.freedesktop.org/drm/misc/kernel.git (drm-misc-fixes)

[1/1] drm/meson: fix more rounding issues with 59.94Hz modes
      https://gitlab.freedesktop.org/drm/misc/kernel/-/commit/0cee6c4d3518b2e757aedae78771f17149f57653

-- 
Neil


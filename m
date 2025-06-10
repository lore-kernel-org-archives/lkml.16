Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7AD0128EA6B
	for <linux-kernel@vger.kernel.org>; Tue, 10 Jun 2025 12:13:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749557585; cv=none; b=DjuHFFBqMv7mvsein2LjqDQktwt3oKsXZkG5VZEvjTllWLNS/sbyr26/h4FOCzhb5cjqI+6axal8C/ZKeUdTOT05m79+z2Prtnao3/l4t0MiE7L02hdkMs2ngRdcKauNVmw8DktbjXe/ze4HmAQhHO3W/F8s7HZs8U7P6czdy8c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749557585; c=relaxed/simple;
	bh=mj744QkzoH+nE/lLDIyNovnhMn+rrkaZjjUq94bNIhg=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=F+y0ibDFnDL2kJoIW/JQwKwYKVNUuYu788/GNmKvYLrZ4II4DppoyUBUMexFXQrRd00KBACz5Na0FM2yTOrsrpj3aqqfzL2RbvgXhn2H6L5aPTg2OzJnEdnjB/SmJD1nYM4EqkLjUar6g36UsOFYIk72eLuL80kXqdM/MyOYE80=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=COk2D9Cj; arc=none smtp.client-ip=209.85.128.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="COk2D9Cj"
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-442ea341570so35144635e9.1
        for <linux-kernel@vger.kernel.org>; Tue, 10 Jun 2025 05:13:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1749557582; x=1750162382; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=aC7BrX8x1EswiMMGxYjxP264vmuUgiUiNAi3UiM8Gaw=;
        b=COk2D9Cj0NWV63uWbbksFfKOll05MGIfTwaO9hs5xQWyQ3JKabyHqVm5ggpVVWmb9O
         tdh3pkrlklekqNOZEFXWUlEsnp0BcV6CL/Zzwwkp9F+QUBWJCoXr2+u3gEUIFBSzrWDt
         yA1MeNl46J815x2Z3zSI67dzfFc2QBSf55H2iRinOQrRT8gbEuoysTN2Mu1gJlVqExPP
         SGt0QbJA71Asxn8Hj7LeLILzhxwJ/SPWrtc466e5dQPQip4wnUNNF4MopMkOqU3Thh1e
         lm4B06kggur3fwtP0k3jU+WRFa7TaNpI+g+FDp6/IOxGYx0bXzTP2dho5yWX91W6+iqP
         g56w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749557582; x=1750162382;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=aC7BrX8x1EswiMMGxYjxP264vmuUgiUiNAi3UiM8Gaw=;
        b=djs0XE/kK/YOZL3zwKrh79u+vjmhhMhlfEMhvexeQ43r6d+XnM17SWYIC/9nQNDHs+
         M/f9f67U81nivqCcpJh8GH0hSCl9xY0GWxQJ6rNl9dBX6CA3ihGFKKbIZ9Uo0RmT7TDb
         j4jSYjBhgGI4SjO8sfJQheUrWeCfBbyQ4DACyukBInfCrLizqYXkO0QZ4ZRWtURTJkj8
         qst3JantkngjivqtMyTwi1eogUzZBWT6z8SkzjixgUYNQCZ7qqYv+z9If0X1HdFYZmWJ
         CqHk0kwCh+VUnVgPfSX8BZrX40fVHblCO5MxJDcYzfDw0JotjJHsuDTcJjYmbBEmVpZU
         9+Vg==
X-Forwarded-Encrypted: i=1; AJvYcCU/pJzBPZeC2a7P/Tx2BAVvYB5laV/KtpdminHiR+IXmhBonOX48rTK5oeC2gPNcMeObaUbfxGSin0TPho=@vger.kernel.org
X-Gm-Message-State: AOJu0Yzhl1Wp5OMERmzxJWj6YClkQMHAAhjqO89ro4pr0Kmpp3jRunlW
	8TqwuhV+jrTSk2/JRG3sWT9RRhJr1cYklBPbViZOSPxMi4BMc5A2AxvHE4hbfxIBxes=
X-Gm-Gg: ASbGncvTVVCFDOHiYc0KdBhhIQoCJQwJ3UbzMekUlZCy2Is73G/Ltwq4ChIV2IYU9Cb
	45izr/v3LmMo7my1rGD2w9UW/hdfWkaXd7bvKw7Zfk9WfnD4VMGb1rAT1MmcaYZ5FVxh6qU3Wd4
	TdQdOlaMh8y9AAHjQQreqK7vlzdnwAj4uYbbqiMEwPSWVsWuVuYWSbR4iHBiQvF/8722hcLYdRE
	pI4BoXx+BYDR9FnZ8lg/KEtcuCJpcHQAP/4sziOdYkFi8YEoSBUuVUzmgB90j4hZmfAeAbElqr2
	F42RVT+4Lowm6M+BEQ44kxhi4nkHCi4SMzRTP28kNCSI1SQV5He1VgcuKUgoM0SkWpb2R2YicXy
	XMLIuo6w=
X-Google-Smtp-Source: AGHT+IFyqTvtGwvnuc3FS7zne0Ce5Fz6EfGEy/ON5HolQgJhZJPOh9o/jA/qGYT7EuGw5oynDbNm/A==
X-Received: by 2002:a05:600c:8b72:b0:43b:ca39:6c7d with SMTP id 5b1f17b1804b1-452013674e0mr170246245e9.3.1749557581771;
        Tue, 10 Jun 2025 05:13:01 -0700 (PDT)
Received: from arrakeen.starnux.net ([2a01:e0a:3d9:2080:8261:5fff:fe11:bdda])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4531fe85260sm9841035e9.0.2025.06.10.05.13.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Jun 2025 05:13:01 -0700 (PDT)
From: Neil Armstrong <neil.armstrong@linaro.org>
To: jagan@amarulasolutions.com, quic_jesszhan@quicinc.com, 
 airlied@gmail.com, simona@ffwll.ch, maarten.lankhorst@linux.intel.com, 
 mripard@kernel.org, tzimmermann@suse.de, robh@kernel.org, 
 krzk+dt@kernel.org, conor+dt@kernel.org, 
 Stefan Eichenberger <eichest@gmail.com>
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org
In-Reply-To: <20250606114644.105371-1-eichest@gmail.com>
References: <20250606114644.105371-1-eichest@gmail.com>
Subject: Re: [PATCH v1 0/2] Add Winstar wf40eswaa6mnn0 panel support
Message-Id: <174955758106.1700488.8043298951772545828.b4-ty@linaro.org>
Date: Tue, 10 Jun 2025 14:13:01 +0200
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

On Fri, 06 Jun 2025 13:45:49 +0200, Stefan Eichenberger wrote:
> This patch series adds support for the Winstar wf40eswaa6mnn0 panel. The
> datasheet including the init sequence was taken from here:
> https://www.winstar.com.tw/d/308/WF40ESWAA6MNN0.pdf
> 
> Stefan Eichenberger (2):
>   drm/panel: st7701: Add Winstar wf40eswaa6mnn0 panel support
>   dt-bindings: display: st7701: Add Winstar wf40eswaa6mnn0 panel
> 
> [...]

Thanks, Applied to https://gitlab.freedesktop.org/drm/misc/kernel.git (drm-misc-next)

[1/2] drm/panel: st7701: Add Winstar wf40eswaa6mnn0 panel support
      https://gitlab.freedesktop.org/drm/misc/kernel/-/commit/d04f6367d39918461d0335d30b860d38668d4b54
[2/2] dt-bindings: display: st7701: Add Winstar wf40eswaa6mnn0 panel
      https://gitlab.freedesktop.org/drm/misc/kernel/-/commit/f79692d0c386bf8b815c92fc0f832d1a0af03628

-- 
Neil


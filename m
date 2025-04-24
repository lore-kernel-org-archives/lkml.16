Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 19FA0203706
	for <linux-kernel@vger.kernel.org>; Thu, 24 Apr 2025 08:22:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745482936; cv=none; b=tDpFpI6j4KU1ZeeIauGN3wiRGyrNd9Fkt1YaAII7+Oww7vvm4MVfN2Y3BBi9XrRGHWLM+GYXONA/Fph+eOKpQ1PuzRQhNDU8aJ/Z5L+FB21Hka/kEcnxo+Ir496Dr1fOy1yUl/Pj0nHTkaTbm9r2OkyxS+xuXha5YS95abKvFfU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745482936; c=relaxed/simple;
	bh=mu2uFlrxQoWxxJiPgO0H1Y0LhyRE0Ja5qcbWzJ2Zf5Y=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=LcbMKg21WxbLpnDjf6JwfzsAtzkJvfkvwfcG25c+FQsXNvENyiRMyUdEpuIj9z7MQqsejqtZTCCMahveZ/s9WBvOBQMPjv6pyS3kZUqwbJsdBwuejUtcM252IQDwBSqImxhPdALKULBcwZ7Zh7ShejSpJI4dGtt5Ffu+INpcjUI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=VkpXvHRt; arc=none smtp.client-ip=209.85.128.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="VkpXvHRt"
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-43ed8d32a95so5581005e9.3
        for <linux-kernel@vger.kernel.org>; Thu, 24 Apr 2025 01:22:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1745482933; x=1746087733; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=m+cuvfdJp/+1KpKEzKZeai9pso6C//0kyG+w0txFSBk=;
        b=VkpXvHRtlkWE65bjFG8wBgycajtpxAX6yLmu5jdbsabixecuzG8D02EE5qTziP78UR
         hpVtZPVtmwg2dR0FIMCXBKW3gwyeUTBLUvBJDhoJmi3aLxtlFoMriEsRY+qq6HbkMy45
         sv3jdBHhTl7LdsubvYJBu79vARwFLRojKGAReV1ctT5wdE1tDgv4ouyXiIW0uSxn5EUO
         0Q7qlvjWcJO+xsKVNyVNgSCRqrvn019nDeU09FIgB1U+PN95ZFF9OAgUHbnQafRbqfC5
         M4e6EgrDDjZ1c3Q0MlYtsdV87ZELa9j3sZS9DSO5GrrVOLmIi5Ds5gr8euht3PTr1YLR
         DqAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745482933; x=1746087733;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=m+cuvfdJp/+1KpKEzKZeai9pso6C//0kyG+w0txFSBk=;
        b=e5xPjo6/GreuKTqBamXecBvgnU+LEuQrB0yf4oyFgfDetxUTTJc0CaAONfsIcNZtAH
         QQz9ayGeJ5JsjEi7+Xl7gzHPqI8i11chQpxxI9tbCBrKAeRHYS02ERsmnByzHqocbTSw
         3qV6RVGXZjOB3gU70cqvuHm5zQw0ul+URL+HWPlF5Fonjya8Pu0jvdcBxMOH1DZHNprQ
         jsao7oYxiEFo/dWIPd3xMmaGampbpSuGzClqeyf50p5A9ZUHFhy93WpGbxB2IPHjWqtX
         jovMMKdb2FckT4BSXQeeWI9URa9B3n+s9YIbzg+nqNhfssK2djVWAdGL5G5TIe+nWr4t
         ijzw==
X-Forwarded-Encrypted: i=1; AJvYcCWgT1qsSFws8IW7ICnrfXJFAWdwKYKrBPCD86DxBAr42JdlwO11QRK7tZ/dCn152OOV4i0THsgzOi+vxhA=@vger.kernel.org
X-Gm-Message-State: AOJu0YwcII32NgfGKz3TQ7eZTyutYSL3aiG61+QkmKvEAoyejgw8ywBA
	5qzh9JbCQzEPU2oomgH3Ka2RQTZkO9Nx2DvqgD36RBL19QujeKtvrVo7LUfO/ZQ=
X-Gm-Gg: ASbGncuJ2Tzx1EEBXJZTzzHDYxSVhVDAkhA6gp7Rgh25SskTgzrZ4/dvVfemf2p5kaX
	5vYq3jIU7qTL1mSnBKZZim+xVjqOXmyrOSSCsAuIvT2/Pc0/Y/fFo1I3n+tF5JXu8KB2IxHN2Dc
	6MCWlEH/Pm5FarkNq46GNYvZ0ldzfCSeLV4eW28zaOxFKUKuFuXNlf/Uw4ROjfRMzPCVTgQrYSM
	xe+ig6DtBTU22EcM2FXUa5I6YXprGrcNwPeVS0sb0V4pjPY5J1SDidg50w/g6xOFVTFnfMJDJy/
	5myC7zYuRH9grSaZhLUJ2Ya8ow/taWPreX+By4kaNlkWTfkzV0GDfnXrPPGCzg==
X-Google-Smtp-Source: AGHT+IE/n/QNG+unEMmqgOeMT8c3dzfdlrQ/11zpmArfHLURUE3tPXu6KBQ2iNPd7o+F0LLY26NslQ==
X-Received: by 2002:a05:600c:4f4f:b0:43d:2313:7b49 with SMTP id 5b1f17b1804b1-4409bd18939mr13892255e9.12.1745482933297;
        Thu, 24 Apr 2025 01:22:13 -0700 (PDT)
Received: from arrakeen.starnux.net ([2a01:e0a:3d9:2080:52eb:f6ff:feb3:451a])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4409d29bfc4sm11229415e9.8.2025.04.24.01.22.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Apr 2025 01:22:12 -0700 (PDT)
From: Neil Armstrong <neil.armstrong@linaro.org>
To: Jessica Zhang <quic_jesszhan@quicinc.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Sam Ravnborg <sam@ravnborg.org>, Casey Connolly <casey@connolly.tech>, 
 David Heidelberg <david@ixit.cz>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 Casey Connolly <casey.connolly@linaro.org>
In-Reply-To: <20250419-drop-s6e3fc2x01-support-v1-1-05edfe0d27aa@ixit.cz>
References: <20250419-drop-s6e3fc2x01-support-v1-1-05edfe0d27aa@ixit.cz>
Subject: Re: [PATCH] drm/panel: samsung-sofef00: Drop s6e3fc2x01 support
Message-Id: <174548293255.3240462.18362886062864690614.b4-ty@linaro.org>
Date: Thu, 24 Apr 2025 10:22:12 +0200
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

On Sat, 19 Apr 2025 18:31:44 +0200, David Heidelberg wrote:
> We never properly supported this panel and always used the wrong init
> sequence. Drop support so we can move it to it's own proper driver.
> 
> 

Thanks, Applied to https://gitlab.freedesktop.org/drm/misc/kernel.git (drm-misc-next)

[1/1] drm/panel: samsung-sofef00: Drop s6e3fc2x01 support
      https://gitlab.freedesktop.org/drm/misc/kernel/-/commit/e1eb7293ab4107e9e19fa609835e657fe30dfec7

-- 
Neil


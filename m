Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C622221FF48
	for <linux-kernel@vger.kernel.org>; Mon, 30 Jun 2025 07:11:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751267493; cv=none; b=Rtxk4tQv+UR+EkwjTj8yG+t2OYzn/9gst5AtDfYsxYNKTgu25iXKoWcHbdhg+J2N0r3mAYrKmC9ykWv6fKzk1NqITkTuFa0EC/p56ddY+jRemX7FRxqH44uGwYOiD6u1noqeJnZ0Vq+2YMQvH+qdLPTCUEs+hg/h+gRpcXvB1K8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751267493; c=relaxed/simple;
	bh=C4Is2PRDyW5OGXhFVFFPlnsp8t5bvWnOqRzuog7GfQw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=JxK/RKuHbxjLGqgVq2YpMC0nhYIQHe+lNwANl4o+JNcg+KDpXfqGI08Y0MS95rJawtFtDLcOwbxEVHtvNcSzLmPIfF14KI6eUEs2hP6N/pJ9kT6xsQ/Lp9bIvL1OkRlx//GztKwKujnYtvTqwqFBU1TN6Dbk+bkQJJlOG2hZlaE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=0Ps+zKju; arc=none smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="0Ps+zKju"
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-451e2f0d9c2so27423335e9.1
        for <linux-kernel@vger.kernel.org>; Mon, 30 Jun 2025 00:11:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1751267490; x=1751872290; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nAU+1CHc/4Ul9Vcx4dBNSBGytQwqpjVcfS5iUgGEe+o=;
        b=0Ps+zKjuO0HazfDCqTTEoTzMTk11geVPVQwj5bSKtu91kmZqTyt0Z9t9plJ+lGDYhg
         8RkbcXRO6L0FW8StFJJ2qsLsCJsNeQsUx6HVIaM8u31fxN0F7eLSN2Gfus8XHstdPScI
         jOax3s7Uz1g+uo8PuSHzn4M7oOtDAalV1X4S6CNhQkI9yjhS+cQpo9iKwoiBgZFdfJM9
         hp7TYPZVsh7thvtxbTNyj9X4QWdGaqObkybZlsuArt7Z4atMu2+9MIytIKV/Zc7VHXGG
         bAeP/7nqKIGIbpPKlJRKTcFY1shFTQWaoJ4jG2uWur3NoQGp7ykG+1+bEGfa9yuVbEnE
         H7Bw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751267490; x=1751872290;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=nAU+1CHc/4Ul9Vcx4dBNSBGytQwqpjVcfS5iUgGEe+o=;
        b=Jl7w5ArQeg2oHYwZ0GuGasA+kVyKJF0Mb8H8GwIWRfIiEPcbbc6LTZy5Snn5fkoL6O
         X5P+SOkrFWl4aphnhmrqAlpqI7/spdgUPQB3ffPrge9bXZ2K0qQEmKPDt+r7WEbzcnIq
         JkQVZ3CqL1tSOg6qKjAY7P3eSTCjJ2wA/edMGB0KylDiQyV3OP1D+U2B2/dnEY9OlHcE
         INdRUpWlrsBuqv+AuZQkaeEIMnOHDg7XTPM+rCESR+40sz+gyAXh3dF+sKa739zCtBXg
         k5ZoYX/ekLgIihvoH+NlkY/SWKvRZZUqu9+a8Vmhzco/BInhGglihIyNIilV6Hoxb8Fg
         X4zg==
X-Forwarded-Encrypted: i=1; AJvYcCUJyeHtoUn6Zi9j2Zs8P1FkiL87g9b/Cpi14q6dFHAiwetBlejuzkRMTiz4XIssxZDnwcfXs6GZ7mQ+wso=@vger.kernel.org
X-Gm-Message-State: AOJu0YwrRWIQDTEQ8kSO3YMVT/lkSilQJnqJq27+2M9q0olB7wSw2rHR
	K9Y8E5PA0Ki2K2KOh75KDOMpxjwamSr+Tyr5lsq3WoWO639zIjwYjScKtzEYVmeBeco=
X-Gm-Gg: ASbGnctCV4CzzbeGLkAImFT6Sn/Pk+femZYww8YHEATt2vqT/snHwszOyroqyZwf/h6
	vQlJ54kF+Wfmdw0jWeq9uL1EVbGHgFJ63jv1nagskCwR+QdKgLxClhZYvs02bYRCeKi2zZXQQsl
	ufuQbN/X3JGjqM5NZ7kh2cqgpTSVpuwg0EqZWhCzSP+mquR3zXto5RNqP3D8pyNNnttB+AkdpSi
	CNH+avYpHNdh7jfV7ktHi3DKzJ5KRS1qtoeQWCc7qSm/KBk04YZUg55QGuumiq/8LeG4eLLDlZn
	vKE/JhiCg4EY9Lz/Sqx58v5AmcuC+9UdmUelK+huq12r8CQGiy0NhJsaOfLhTIBZ6wcJgsaOkQ=
	=
X-Google-Smtp-Source: AGHT+IF/Hi1wIyroMRKaNdh6oJcOjs8dpo4x25ryjFzMBcwdM76uEkmSwa+7+twwlJwv++sUrr296g==
X-Received: by 2002:a05:600c:5306:b0:442:f4a3:a2c0 with SMTP id 5b1f17b1804b1-4538f308f2amr111748215e9.13.1751267487709;
        Mon, 30 Jun 2025 00:11:27 -0700 (PDT)
Received: from brgl-uxlite.home ([2a01:cb1d:dc:7e00:19e3:6e9c:f7cd:ff6a])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-453823ad20bsm155857865e9.20.2025.06.30.00.11.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 Jun 2025 00:11:27 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
To: Bartosz Golaszewski <brgl@bgdev.pl>,
	Dmitry Baryshkov <lumag@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>
Cc: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
	Marijn Suijten <marijn.suijten@somainline.org>,
	linux-pm@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: Re: [PATCH] power: sequencing: qcom-wcn: Fix bluetooth-wifi copypasta for WCN6855
Date: Mon, 30 Jun 2025 09:11:26 +0200
Message-ID: <175126743945.9502.10865323973277778420.b4-ty@linaro.org>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250625-topic-wcn6855_pwrseq-v1-1-cfb96d599ff8@oss.qualcomm.com>
References: <20250625-topic-wcn6855_pwrseq-v1-1-cfb96d599ff8@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>


On Wed, 25 Jun 2025 17:55:43 +0200, Konrad Dybcio wrote:
> Prevent a name conflict (which is surprisingly not caught by the
> framework).
> 
> 

Applied, thanks!

[1/1] power: sequencing: qcom-wcn: Fix bluetooth-wifi copypasta for WCN6855
      https://git.kernel.org/brgl/linux/c/07d59dec6795428983a840de85aa02febaf7e01b

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

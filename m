Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 508B3236436
	for <linux-kernel@vger.kernel.org>; Wed, 16 Apr 2025 11:09:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744801780; cv=none; b=cqvhIYzhybPTbjEc6TTlN1fxmEEX2x7nLXesAYMj148BOkdRRpyyrEbkeGxWJ83qyjAf217emn7I3jaJsMKy+4sd11GzI8addfWd308Qm759K2bAluz5svqGnnPov6ssOCTr3HKEO+BsC99Ol0wM/sNHViLwW4nZAvBlhDzzr/o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744801780; c=relaxed/simple;
	bh=+y8KqhSVfnFlwYzXbSSQMmS3oIDAAaM+xEj5SWn7d0c=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Ux4b2bnwf4iYXFzdRP4TySf4Su9ySIA+up0zgmkH1ZG48bSRY4GBMsceAiCG5flhgfPWdY/OMTnEuPBuyb5LccoErDLMRboAeJJT1bZ9vxe6FAWIdFMCYXLU8SiHBBjzBgTfJoQqIyQAaHLFt6q/P66QoYt/RscHK4UBHLUXI9U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=GpenPNxa; arc=none smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="GpenPNxa"
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-43cebe06e9eso49533745e9.3
        for <linux-kernel@vger.kernel.org>; Wed, 16 Apr 2025 04:09:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1744801776; x=1745406576; darn=vger.kernel.org;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Ji8R+YWk3MsietQv3MSFseKaQ1O0klM9PlX7ucUVXoo=;
        b=GpenPNxax4ypNOO7NFXOUrRkjWiFGRthyxlJKDdVGzRSCfSkDvfeHliprquE+vH+Ra
         sC+c/m/NjnwDj96BkLlr/QWt3O37qMjTmUDw4Ar7hUZTrEyoRz9Nooe7dX6N3c/cIeDO
         Ge3PB9Oeyfo4kcYGvpTBQpSNHZMNsG3Q2PY7KasR0O91P30Qn6+vyHK1aN252oww0nD4
         UaQcdp94JHsieP07W4jlg5n2JEhaoLYzCfykCef8zBFgqmzke+4YZDr7MKfiuHtehjsh
         Q3m7+LhH33uV+Jm9mGqVAWJFCuGEIiR7pZD/JCvrNiUKGtXQkGjQL97ke/3RA/7P6zWc
         djSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744801776; x=1745406576;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Ji8R+YWk3MsietQv3MSFseKaQ1O0klM9PlX7ucUVXoo=;
        b=mS48sLk2B8bWzxmL1vMfzcxoMRuNDxF3HmBQ2SPsfofTsbgrlmTTqwgdUyqJ/V9LQZ
         03+dxOuRKzr4+P0Gmh23XlNR16mzKv1ynm5u41eVJAb1ZGGqkpwcewb8PedZmLxKjN3I
         S6JQhSc9WAzI2J8HisI37HTQa4pCXqWjLUWL+vkHv+RqEdMB1/lE8OR7ud+5CLiiA0Zu
         u8f6f3iFMnX7qTRMypg0IZ8RBpaMzIJsGBCXDHo5T6DgFzpJCvIWGFOczoC/qa6hsQo6
         Ufz822cgLIUYvBApjUY9w9gPzzuyi0gENOl2ozFZZgHKXwE7oTieXo4LFTa8cdFq5fTP
         qOqw==
X-Forwarded-Encrypted: i=1; AJvYcCWZNxC41+JMvuS8HHzHIT7dHje+qsA9kh9hGZRsDADWq0/zQWH5O9wEWB+dF28KJx04FmszpvRCp5FC1XY=@vger.kernel.org
X-Gm-Message-State: AOJu0YwhXmWawdiJgBGT1SsPVmvz2dR2HQResAenTxhY2+IxxX40itJC
	hi6ftVYYLI5Hf2tkClCrJAI/66LY8pNVZhDVQdeNlYOKiiapr8EBDPOyi64m/qg=
X-Gm-Gg: ASbGncvXsonArBJQiwTbHIRQPXYqTPW2ae+tpUu1pgyiyJ8QLH8KKYQ2wkoM7wpW5lw
	BceFMmv/u2rbiUK5XMV8zDtg9ijMpPqjwA2babNuVCTK7ZrGyIPwHQoKUwWzGTle4zIdhXY3+6G
	poCQmeO2fa29oEEOCVvNHnBL2W2cZT7YlKexd9Zq6hZenNa7bfrdBLdWO+PzHMyuNJKO7eQuocL
	ZoECQza8+y3TBex4Jcjl7QWUT6C9Lkhlx5BNeRrA8Vw0MeE1YqC5HyrptUcNpWIAWwoN32Mz3JE
	dlkXMUsSNcH67rZRk367kvlqHDjzBCF9PCXQcVm3OBhE9Q==
X-Google-Smtp-Source: AGHT+IEKAxZRjlmETxUa8i3VUxPy8BpzguynRSNTNQ+1OBTbY+SFnyW1TOzEANNdv80tEbVj39nrNw==
X-Received: by 2002:a05:600c:1f13:b0:43d:a90:9f1 with SMTP id 5b1f17b1804b1-4405d5fcd76mr12260785e9.6.1744801776554;
        Wed, 16 Apr 2025 04:09:36 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-4405b3445adsm18145115e9.0.2025.04.16.04.09.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Apr 2025 04:09:36 -0700 (PDT)
Date: Wed, 16 Apr 2025 14:09:33 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Cc: Lars-Peter Clausen <lars@metafoo.de>,
	Michael Hennerich <Michael.Hennerich@analog.com>,
	Jonathan Cameron <jic23@kernel.org>,
	David Lechner <dlechner@baylibre.com>,
	Nuno =?iso-8859-1?Q?S=E1?= <nuno.sa@analog.com>,
	Andy Shevchenko <andy@kernel.org>, linux-iio@vger.kernel.org,
	linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org
Subject: [PATCH next] iio: dac: ad5592r: Delete stray unlock in
 ad5592r_write_raw()
Message-ID: <Z_-P7bsD3KL5K25R@stanley.mountain>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mailer: git-send-email haha only kidding

This code was converted to use guard locks but one of the unlocks was
accidentally overlooked.  Delete it.

Fixes: f8fedb167ba4 ("iio: dac: ad5592r: use lock guards")
Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
---
 drivers/iio/dac/ad5592r-base.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/iio/dac/ad5592r-base.c b/drivers/iio/dac/ad5592r-base.c
index 217a8a88818d..5f2cd51723f6 100644
--- a/drivers/iio/dac/ad5592r-base.c
+++ b/drivers/iio/dac/ad5592r-base.c
@@ -324,10 +324,8 @@ static int ad5592r_write_raw(struct iio_dev *iio_dev,
 
 			ret = st->ops->reg_read(st, AD5592R_REG_CTRL,
 						&st->cached_gp_ctrl);
-			if (ret < 0) {
-				mutex_unlock(&st->lock);
+			if (ret < 0)
 				return ret;
-			}
 
 			if (chan->output) {
 				if (gain)
-- 
2.47.2


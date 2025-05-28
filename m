Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 14B8621E087
	for <linux-kernel@vger.kernel.org>; Wed, 28 May 2025 20:22:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748463745; cv=none; b=S1bmlz9va19fkqxYJ3higamheJMNDAW3syAlPiJe9cmUxXTEFIKupe47+r7XetGxAY4Onb9UcCdcjUYJGTXMQSrNsRhYoi9rQFN41kUbIT8Jn5s4Cc27lnD+FMCVvYaXVN2lCmFTmrbH72Rcix8fx3Z2+fAfD9+TfL7dcxbmeVk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748463745; c=relaxed/simple;
	bh=huHhx83QOe4ytOYGTtBjpmUB1tXdH+3Wmtjjm+SSGvU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=uLcWtqP3G9fQqVUnU2Y2jU+sdHrc16GZJdGWbgsUSaVsFk4l6iSXoC6AttH+0y8wKEYNLwW0QQ2Quq/BHKN7rq2Nl5wTROYYGKSso2sqzLDGHvA+3Dd24IY0DEwtK0Bh6Al9jkE48F+6frg6L4F1wKzmN27bO0IVUik8UX9HQkQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=MBMkLMgZ; arc=none smtp.client-ip=209.85.221.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="MBMkLMgZ"
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-3a3758b122cso151006f8f.1
        for <linux-kernel@vger.kernel.org>; Wed, 28 May 2025 13:22:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1748463742; x=1749068542; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=t/GHNKIbcWNsKXVXR2KnFC3ujKn6xHbitos5kAD6Ag4=;
        b=MBMkLMgZzG047gI652FafZG8nc0mIg+oY9WTbEZe7My6oLMunJJR07nR0FImRARITl
         fLiFMji26AwEak7vAwsFSXNtZTaEjumIRJYn/CfdZzn6vxN5ffcR6bYi5MoOWUL1CBlW
         MUl7cxNHFSKq1smdYNhvUd6WfBoo1rhd+ZpGgHujFUhqFPVkoXFnlixonpmMoqfUEwbN
         3Fyz+kc1+RERpIVH45icQmAo07b/UpwRptOiT1ZQevlTZepKEiAkdlXckwNmLzpxIwJM
         jvR4EbelWrp394I8bB7c2nHObDHffvabBxWBDIhAig2KcCaaudzX0TppmPrqp226hSO5
         +9dA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748463742; x=1749068542;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=t/GHNKIbcWNsKXVXR2KnFC3ujKn6xHbitos5kAD6Ag4=;
        b=fJUPyel9J0o3IbyJiD+a3MbCrYrrJHh5gvWEI9Dqbh+dDLv43q/yZZ20Vok76X2G25
         OCCxYNDloh4KVW97enfmyKzEJWeWOtIeLmKUKNepWnNHz0yQw0aqWGkG1moLkncda4eS
         e98ZkP//LYO0yw5fb5lbZfTVmG+4ZhOziLFFzN86G7S8utCE0EuVXno/k7Zi1Oey0k+x
         vGsmIs6+NdT/yLdtIsY0BQCLlRNSDibFl2sPBIdIgdsSdrxIT6Rd3bYb6TccShJPr92f
         7dctk3oi/V4ZBzI2nsXvzf2ecTA9mnS2BTlTTLh/Sf9WFeHTjlNb4LT5O6wa2v52RtwJ
         AU3g==
X-Forwarded-Encrypted: i=1; AJvYcCUsSkFhxP0UwhM26tOs91RSPX2AOOqJ8PywVLOn0CUh3l4dioZDEEGUgZNIZet470IEYK4WRlN1YpxfIAs=@vger.kernel.org
X-Gm-Message-State: AOJu0Yzt7ekk2K6uzoY84dNacyAAU50H26pvMDpNmHEZN4CodCyKsnIE
	+gkM3iW84vHgzi7ItgRmL5FW/9Xvk68fTcpf5IK8wdhwV841IQHQBc89kzmLsY2keKo=
X-Gm-Gg: ASbGncsp3il8L/ZT78NGycnUfU3HNligt0l22rG2UzgTI8kZuoVIGqYIdlk94Vwjk7/
	7iMAYrz24M0r+DqYm1GyUs4NMraMwrRGrb7Um4JL7+CVo+Z51XT/6q3ufYmebjnUruXG+i1gAiN
	AoO4nCAVNLOLBmKXO6d1ZExDNb/KAxyk2Kk124otlsCK+z20JxXPIYudMJ3tXksdz+J+y3V+OM8
	Izb5x0BL7k3O1xjLLJrrmu751hpg67A9sy/xogve7kgXg2t362SU/vkdzSpY/sWLewASyl9JdD3
	+lZ3OtmhIrKRu9NMpDTiVphTjxFdxut/kjNIRXZcRsYZhlj/7tjXZdI=
X-Google-Smtp-Source: AGHT+IE3zn4Dy9h4jWWCscJ1M+kpJaQhAI/mIcsizVpyQJzFiH/Pk4FYER8Sv/LTG2QhffZTotBPeg==
X-Received: by 2002:a05:6000:2909:b0:3a3:5c05:d98b with SMTP id ffacd0b85a97d-3a4cb44533fmr17005363f8f.5.1748463742253;
        Wed, 28 May 2025 13:22:22 -0700 (PDT)
Received: from localhost ([41.210.143.146])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-3a4eac89daesm2324797f8f.44.2025.05.28.13.22.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 May 2025 13:22:21 -0700 (PDT)
Date: Wed, 28 May 2025 23:22:14 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Hans de Goede <hdegoede@redhat.com>
Cc: Hans Verkuil <hverkuil@xs4all.nl>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH 1/3] media: gspca: Add bounds checking to firmware parser
Message-ID: <b258c7f831cc3c15491d400cbf822892867696ac.1748463049.git.dan.carpenter@linaro.org>
References: <cover.1748463049.git.dan.carpenter@linaro.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1748463049.git.dan.carpenter@linaro.org>

This sd_init() function reads the firmware.  The firmware data holds a
series of records and the function reads each record and sends the data
to the device.  The request_ihex_firmware() function
calls ihex_validate_fw() which ensures that the total length of all the
records won't read out of bounds of the fw->data[].

However, a potential issue is if there is a single very large
record (larger than PAGE_SIZE) and that would result in memory
corruption.  Generally we trust the firmware, but it's always better to
double check.

Fixes: 49b61ec9b5af ("[media] gspca: Add new vicam subdriver")
Cc: stable@vger.kernel.org
Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
---
 drivers/media/usb/gspca/vicam.c | 10 ++++++++--
 1 file changed, 8 insertions(+), 2 deletions(-)

diff --git a/drivers/media/usb/gspca/vicam.c b/drivers/media/usb/gspca/vicam.c
index d98343fd33fe..91e177aa8136 100644
--- a/drivers/media/usb/gspca/vicam.c
+++ b/drivers/media/usb/gspca/vicam.c
@@ -227,6 +227,7 @@ static int sd_init(struct gspca_dev *gspca_dev)
 	const struct ihex_binrec *rec;
 	const struct firmware *fw;
 	u8 *firmware_buf;
+	int len;
 
 	ret = request_ihex_firmware(&fw, VICAM_FIRMWARE,
 				    &gspca_dev->dev->dev);
@@ -241,9 +242,14 @@ static int sd_init(struct gspca_dev *gspca_dev)
 		goto exit;
 	}
 	for (rec = (void *)fw->data; rec; rec = ihex_next_binrec(rec)) {
-		memcpy(firmware_buf, rec->data, be16_to_cpu(rec->len));
+		len = be16_to_cpu(rec->len);
+		if (len > PAGE_SIZE) {
+			ret = -EINVAL;
+			break;
+		}
+		memcpy(firmware_buf, rec->data, len);
 		ret = vicam_control_msg(gspca_dev, 0xff, 0, 0, firmware_buf,
-					be16_to_cpu(rec->len));
+					len);
 		if (ret < 0)
 			break;
 	}
-- 
2.47.2


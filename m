Received: from mail-ej1-f42.google.com (mail-ej1-f42.google.com [209.85.218.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 21B051922F4
	for <linux-kernel@vger.kernel.org>; Tue, 27 May 2025 05:43:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748324623; cv=none; b=OiP7RGV7PddaK4aFc+J5K9ky5hUUPZy8tEjMz8HM4o+bhFbUWwkHuCPeSieOokNW+4bhfH416HtcJhnH2C5xBhTfmPjWJ5C5Q9puFaJId02CWnijBU9685HxybbMbtfSPc3Sv3FWXbJebgfMhAoSYfRy7upOGb/eb3qBLpitQH0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748324623; c=relaxed/simple;
	bh=OURZMg8Ef8IXmiVjiF4H1Y+g5xJnfN2ZoAXJr2sOcMo=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=bqruZBGhHNKl3Y+HH4noLbMVHaaTmqVuWHCEHS/V3kCCsRzdLlLvIlllGERCCWc1JTdicwwXNziU8FRfgRIYpfWViQfjRdNSjLk2fsDtNsZYVUW/V1dgM07snrG+NQ9tbqKiE/zca0rklO7IZJHscmIP1ZIc7am4zdLrHYjSQeY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=dr4z9nrn; arc=none smtp.client-ip=209.85.218.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="dr4z9nrn"
Received: by mail-ej1-f42.google.com with SMTP id a640c23a62f3a-acacb8743a7so530577666b.1
        for <linux-kernel@vger.kernel.org>; Mon, 26 May 2025 22:43:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1748324620; x=1748929420; darn=vger.kernel.org;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=vLieAIh94J6gkKijZufmzKxSpC/oK+MIvZ8kzKh+soM=;
        b=dr4z9nrnFfW1YHAtSRwrr0JW2yRqbJuhTT1drF3mHpkrNsy5e06zIWP+yK0f9YYOpG
         u4U8Ukjqen3Xfq23ch10KLXaVEeFBE9haJ08NxswCqIAz8CchlFozxFAmKEr527ZGTfk
         OJBoZe4o8v2URYsAhSqwoSogsGNWu3QoNyx59vIuJmwzwXB88s+HhaDSX4VpopnngLO3
         31dB27sdU0jsmG6q5m7nOb3gmzKgZispgZtMNk98sbKVEyzRjgwodGi/Q7My/PRu899b
         wEH0p3W1qrKnv1id4XxNMBxDV+qWuNjE+HX2X51Hh/hWx8kiG8yuDWNa2xpivuDFZBks
         FJOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748324620; x=1748929420;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=vLieAIh94J6gkKijZufmzKxSpC/oK+MIvZ8kzKh+soM=;
        b=nTjYl3sRDDZ6ip9/vp51Da9T1ThwBD4wyt4zs3ViOu4ELUCF2kavkbhnBtjAYPps0g
         MgRLBGiANYfT6M3PWCyZUmnW84kvz6lGai1AVBBaweqgWW3MjAWuthkwDYpxtvMYDcaX
         Zz8f7kDzFzN1iAmvq34SBOsPd4iuXwbSOgqW+UdH+/RPB1llGeEYBoG1zOJMqCaXPQsC
         h+ZkwUM71U6t89Frkhq3AShhU7PqRE6B03nEefZl3Lb1MHgjoeiiguhy0n0DwmjdjUxB
         muN+pMiqTeukRKm8Q1YNsQ0LhtbXn5C3VEjSPyYSmISHGQsRG3munVhL/grsQg3afoYI
         mUYw==
X-Forwarded-Encrypted: i=1; AJvYcCXsenjpatiRHxQzoDHhpgYZ5HX7YvxwRY9qLhR4ckIOTCIjv6zO2jRk3RTaKJnKPUY1/V/Mp20/HpOodBw=@vger.kernel.org
X-Gm-Message-State: AOJu0YyJiva4iGL3RRWLvx9IRmQmlPvWIBwrLBqJhcUT572vjt10YIf5
	wX/e27+npFFPxTtTjIdtoqyzT26kyAuQOvigTNe9eUdEZKgJSlHoWEEPtKY+gzBwjsc=
X-Gm-Gg: ASbGnct7iLKOd2jAEsDeReda1ZYjiYd8Q480qP0Z3l6+S3jid/xIUPj0kEmYu4Jg+4X
	Sc4Cb5qBymeKtUllI72JuZTNk5VRa9n50CdVoXpo16+FCTtY6XBOTOU1/Q1jp7Ud5ChxfzcWJ0T
	fujau56dpWd1gIMuiJi73Ht2RS5i7eAHrFIDYZVfmt/eZF64sPfbwXQB/nbFKb7SgneVNILbqCf
	V4bB+/9b645SY5BOsUFVelzCUqoisgrtdgARGt2rpczZwIC0s/rGC+h4ULXMG/ngqjcvH4cEpfK
	aznMPXUCRIICnY99NhHRp9qi/Av0q8lq0y3BKQ7B5NP8zLvitxjpydc=
X-Google-Smtp-Source: AGHT+IFmKrrq1O4ANeu08c17wZM+Eb8aGpytrPGvsys0BX7ope/iR0SZAmtj4dLBdx62Ecb4ClacwA==
X-Received: by 2002:a17:907:608b:b0:ad8:91e4:a92b with SMTP id a640c23a62f3a-ad891e4ab65mr54007466b.30.1748324620384;
        Mon, 26 May 2025 22:43:40 -0700 (PDT)
Received: from localhost ([41.210.143.148])
        by smtp.gmail.com with UTF8SMTPSA id a640c23a62f3a-ad88523a96bsm142443866b.73.2025.05.26.22.43.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 May 2025 22:43:39 -0700 (PDT)
Date: Tue, 27 May 2025 08:43:34 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Zaid Alali <zaidal@os.amperecomputing.com>
Cc: "Rafael J. Wysocki" <rafael@kernel.org>, Len Brown <lenb@kernel.org>,
	James Morse <james.morse@arm.com>, Tony Luck <tony.luck@intel.com>,
	Borislav Petkov <bp@alien8.de>, Sudeep Holla <sudeep.holla@arm.com>,
	Jonathan Cameron <Jonathan.Cameron@huawei.com>,
	Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <u.kleine-koenig@baylibre.com>,
	Jon Hunter <jonathanh@nvidia.com>, Ira Weiny <ira.weiny@intel.com>,
	linux-acpi@vger.kernel.org, linux-kernel@vger.kernel.org,
	kernel-janitors@vger.kernel.org
Subject: [PATCH next] ACPI: APEI: EINJ: Clean up on error in einj_probe()
Message-ID: <aDVRBok33LZhXcId@stanley.mountain>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mailer: git-send-email haha only kidding

Call acpi_put_table() before returning the error code.

Fixes: e54b1dc1c4f0 ("ACPI: APEI: EINJ: Remove redundant calls to einj_get_available_error_type()")
Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
---
 drivers/acpi/apei/einj-core.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/acpi/apei/einj-core.c b/drivers/acpi/apei/einj-core.c
index ca3484dac5c4..fea11a35eea3 100644
--- a/drivers/acpi/apei/einj-core.c
+++ b/drivers/acpi/apei/einj-core.c
@@ -766,7 +766,7 @@ static int __init einj_probe(struct faux_device *fdev)
 
 	rc = einj_get_available_error_type(&available_error_type);
 	if (rc)
-		return rc;
+		goto err_put_table;
 
 	rc = -ENOMEM;
 	einj_debug_dir = debugfs_create_dir("einj", apei_get_debugfs_dir());
-- 
2.47.2


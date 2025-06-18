Received: from mail-ej1-f48.google.com (mail-ej1-f48.google.com [209.85.218.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C249E2EFDA7;
	Wed, 18 Jun 2025 16:47:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750265277; cv=none; b=kh4doGkOqJEddPjG8BUl92JEtCmpU21E0feEy6xe6vcjUdRLlVbCySeDhannWFJT9u2RIVj9eznXFskinjzYZR1CRmPvf59nU0cgjvuasI5FNwjSFAaLnRa51N4I7Eq7GTy+dpOSD2a629b08xggzYKHdkVLfXbimlZwo3LTyDs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750265277; c=relaxed/simple;
	bh=hIUF1W2kQbNBkJA9y0/7IYXS/DTzn2iOQBfMawanAnQ=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=VbMuemFowYGYjnpG+vLEMETrWaSc7GVOGSMe8vCYzN5hWAGp6+G+ePy8XQBxlywWjy1tCDnSuGm60awFspoHJCEwz9Hb5C0ImQnX26GqgLqoxr6cLXkKHDApD97Ty095YINwTfB9qUfyOotWeLpHIVzUsrK9VSgHrS+TR4BlqsY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=LaqDvgaf; arc=none smtp.client-ip=209.85.218.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="LaqDvgaf"
Received: by mail-ej1-f48.google.com with SMTP id a640c23a62f3a-ad891bb0957so1306715466b.3;
        Wed, 18 Jun 2025 09:47:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1750265274; x=1750870074; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=N+qv1GHOU/ShU2OJAJa6dB0bDSAG6lFZVxU0lASK27k=;
        b=LaqDvgafzN72UzGjWTX4hGDsuTBPEAkBQ+tpA9TAjYBODp5811u4lmjwOAr0zAMsZC
         FSR1Ydmg/K2k6SSPxfWGJ68iJYyWUPiEdMttj96jaXM07rWdQtRYkH7iqdEsk9CyMrhS
         W/l6pG896cag0vLyTgD6unx/jQ8cXRqwOJLpUYVAQelfdTi5pyNFlfXaPncCdxsvTgbz
         pdt2rO8PHoUWt2UoNzuU03j+i7l2pO7XPPWZX04aaHQOFR9SpjTH68npFq2oG4D9spJs
         lYPyWdJG0n9MUj18vHbD9ioALFYPNwVZfHgyCKh2ojXFRt+AmpmPlA9V1R9szC8N7HdA
         y5/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750265274; x=1750870074;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=N+qv1GHOU/ShU2OJAJa6dB0bDSAG6lFZVxU0lASK27k=;
        b=bXbVUC6HmSGe6eyQzqd8WMEWOzqcZpTe/lUd1aKJV2TrNOxq7d/1Jvg3FqhNAa7OLi
         99T9/lX1bJc0JAkb9QhWQ36YhLqL1LC5Efp8GyC51xTstTYCI1J9DwhhnBcjP/HbcYrk
         lJ15Ml82Qon4/dFOm5hDGqdSKRYZOBnzbhPQWUWb8XMr6wPvdj/uJ+t5mD8np6rlxOwp
         ZBx+XZwSuz5YkvJrfaX4d941QaEOvfN+04/yEbYey9G8WaVAYrYiLrijQDQjHecJohMn
         LJwOOUFBWCxm761vzzTLHVxhPvLzgHOH2wjy/ykN3I3Ks/mFm9s8ELyAEUbX21xowHy6
         Njhg==
X-Forwarded-Encrypted: i=1; AJvYcCXei5A9xV3z1axoXjNQdrNspvVrPHS9IpQukCR8MPyyipFi2+EEonYeHw2prKAqeCYWtvfwvTNeYStI8+c=@vger.kernel.org
X-Gm-Message-State: AOJu0YxGYzZxmnRbjxRshfXAd4yFzwaqikb8G9/d8+ODDliREp0lwY0d
	nQmvgS+gJInIPtNvXIGlqGHyYOQVcdlvotDEWPHrkFula5Vm3ehEmP9F3NsWuKvN
X-Gm-Gg: ASbGncvjrFy0dnGL2pkZwOQ6meLFdUcSAdifEeSNMmZSgnjVITeisdAjMtwnAtHluIw
	yVYHXP7tOecOovI5XLi6hY2AjH+SBQIqXZMngrckYqA7Kaegcxy9L6OsG8OPaKdfvqCBx5BZR3F
	51iDv4dtl30szNieCTPIo0SM5Tl/TbjtOCMyz2SNQ7TbZnASkBGw2rpWqiBOdlA+41sumtl39lg
	1EJbMrzBvrgvl5qvOaniswaJKdqMUG6SlEf39mlBv1DfkHcxgetteCql6zk/dpRvCTxAe5MaN4i
	wGhv7jqax+GEnF+H9vi/IrE3k3QTy9N8ohb2Q09CbVy2428cyh4koNvY5En1Pd9I4iz3JD9u/Dj
	6FWVxhvo=
X-Google-Smtp-Source: AGHT+IF7CCKVAgk6WUozUwLRY/+4SzLJ63FajrazwZc0+Ifd6OQCqqeNXYovSAUeenIgd24XLetrcA==
X-Received: by 2002:a17:907:1c08:b0:add:f62e:a300 with SMTP id a640c23a62f3a-adfad29f4e2mr1862867166b.2.1750265273477;
        Wed, 18 Jun 2025 09:47:53 -0700 (PDT)
Received: from localhost.localdomain ([2a02:3030:ae0:5873:67f3:9dc3:7778:59f4])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-adf9ad8a155sm935481566b.84.2025.06.18.09.47.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Jun 2025 09:47:53 -0700 (PDT)
From: RubenKelevra <rubenkelevra@gmail.com>
To: linux-usb@vger.kernel.org
Cc: linux-arm-kernel@lists.infradead.org,
	shawnguo@kernel.org,
	gregkh@linuxfoundation.org,
	linux-imx@nxp.com,
	linux-kernel@vger.kernel.org,
	galak@kernel.crashing.org,
	RubenKelevra <rubenkelevra@gmail.com>
Subject: [PATCH] include: fsl_devices.h: drop unused, misspelled FLS_USB2_WORKAROUND_ENGCM09152
Date: Wed, 18 Jun 2025 18:47:43 +0200
Message-ID: <20250618164743.1916838-1-rubenkelevra@gmail.com>
X-Mailer: git-send-email 2.49.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The macro was introduced in commit 69cb1ec4ce4d ("mxc_udc: add
workaround for ENGcm09152 for i.MX35") on 2010-10-15, but its prefix was
misspelled as **FLS_** instead of the usual **FSL_**.

Its last in-tree user disappeared with commit a390bef7db1f ("usb:
gadget: fsl_mxc_udc: Remove the driver") on 2020-12-10, so the macro has
been completely unused since then.

Remove the dead and wrongly named definition.

Signed-off-by: RubenKelevra <rubenkelevra@gmail.com>
---
 include/linux/fsl_devices.h | 1 -
 1 file changed, 1 deletion(-)

diff --git a/include/linux/fsl_devices.h b/include/linux/fsl_devices.h
index 5d231ce8709be..49f20c2f99bf0 100644
--- a/include/linux/fsl_devices.h
+++ b/include/linux/fsl_devices.h
@@ -118,7 +118,6 @@ struct fsl_usb2_platform_data {
 #define FSL_USB2_PORT0_ENABLED	0x00000001
 #define FSL_USB2_PORT1_ENABLED	0x00000002
 
-#define FLS_USB2_WORKAROUND_ENGCM09152	(1 << 0)
 
 struct spi_device;
 
-- 
2.49.0


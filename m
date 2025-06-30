Received: from mail-qv1-f47.google.com (mail-qv1-f47.google.com [209.85.219.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F15C24337B;
	Mon, 30 Jun 2025 08:02:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751270528; cv=none; b=SJxKyQS9Ntj8MinFJ0m2gouoB3jStVCz2p8jIanExfJjb3QBuHU0M2z5T0P62dCJ5BtMlTcN7eh3aoXWkJm4HaUGcJRAERl8qDAtKuxS1X/3GRiyS1GQx6mlrHCZ4bbf892JLqY1LxGhUhE1eOjD09KX1wHXasP8dB1EqQ4Q/w4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751270528; c=relaxed/simple;
	bh=PGzNmxKPeKeIW9y3SLrZgxUtNxszaOvcO3mqQbh5IU4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=E1D//Hdv5uQ/aWnF2/D8Tj5RO6G12m+1YBt93afXkJ9c+h0ddJQWRkOdmilQwgME33GhKXpRm5xbvcM4KGko2HxjQncrRpwqKyBUiVfJQIel9vLPyS2N3u7+vV7Y5jieQFwXLMPl5HRZZQIbP8ZbdVFo1xQkJ7U4V0nv+2zFB2c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=en0cT+gI; arc=none smtp.client-ip=209.85.219.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="en0cT+gI"
Received: by mail-qv1-f47.google.com with SMTP id 6a1803df08f44-6ecf99dd567so29262826d6.0;
        Mon, 30 Jun 2025 01:02:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1751270525; x=1751875325; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=SXIjFbe4Vrz2bi8rFlLHVCaoVK6EIDR/YQX7SQMy1sc=;
        b=en0cT+gID0V+xpNQhvkIQrW0PIUoc76tdYAhUEyqjPdAbLCm93HsEAfwswnTYBMg7z
         f0DDkCtKFN1vccVkzlyBnXuQ3OYrkqhsZX7jCSAeGMCDHwmLvjEpB7lePosLPkbLyaEZ
         fa3SD8eiz5aHCKeCz/t6nEgv8yGsnh0V4dNcmzbQjsLcvnybPlOtm2lV2z6BX1DvdzgC
         d0kcIRzZajlYxx4FC5VujvGOPBqB8zU+So37edBt0TKWL11JBBEDK9a1U1W7fRdn1TXp
         UVUgYMpsfJfQpwFUROu+UGVAmHez5+DSwwifSVb/wOsqkqkX4hfmFxccCs0VMJC2viL8
         lIPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751270525; x=1751875325;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=SXIjFbe4Vrz2bi8rFlLHVCaoVK6EIDR/YQX7SQMy1sc=;
        b=iSZQumoPeZVqBxjzBVCnUMTwlxU9YxcgOEOThwzAjkG7X7sPR8sQuPIPBPmptKPYGE
         5da2e5v/dnUqmgzSeVva3G+G/tMVQRMNITJNgcuArMs/MuInRQGmH34FML8Uuo6iskrc
         yJQkLmJIUNTewTv99u7NVwezCn04UVcVHnYDrzNkBdTaLJn0IRnG/SRa7KQKFJfj++mw
         B0dSDI8dAeiO58yciB1zAKHfi0EPjC8DuWjlPrEl/1F3FbU2RwuijcqYH2aHz8qkrrqL
         llec8jAc2nc0Lg4HP3ljpO1AlHWl4BAt+96JmbZZYws3yup4PgdNQpRruRfPpUvZrphb
         iK2g==
X-Forwarded-Encrypted: i=1; AJvYcCUMwBvHtE8sE8RYW0Xc//T9A2rxcRd7A56HIRQ08+e17nRMebykDee0XwlLccNiWJ1oUUj72RdVwgq0mKiJ1MrpLocisA==@vger.kernel.org, AJvYcCWr9fZJTXFPvQ9zcuyBXdWkwfrXnUZ4GhTSd3P1Xcra0v3rIqXSsELXqve/WBkhqTvVFgF6QVsKnrYRmdQ=@vger.kernel.org
X-Gm-Message-State: AOJu0YxjltXLlnWeqXTMsJhSM9YggXVrS45XoQOCjRS/ftqne5Q8hcZe
	qAqNF1BQVYWWyTTZQ1wHQv4zT9j6a/7sky3IHlargA0lNJEf1g9efDXX
X-Gm-Gg: ASbGncuJRAnh3ec1Sye1fylVLodK/OytNPTpkqYV05oYsUjNm0keW2rYgXvdsdQDLoZ
	eRqqMSbMkKi2ooeBoYCTUdv6dvNSdKV9/XZqTO0unSzs8QL/xbXuPFe79rNL7Pzfl8QRKf8orKg
	icZ29cpQIulp6NkueIGhJEJzvrvI3FRTrzjb9DM9D9deAhTCCTyyZy7AHAFbEGJtomnu2fdPAhb
	6HPEX9RtlvXrLEXQT91SmxM8hEev1vvDBwaQ6HQq/g8rRAvQ/doooUlcuRRXUatm1oEJy/rpj56
	sH8rXrlUvS6s910RQ2DKNScZ7cOR0cOIv62GJOHfg/iOlQR0qcZID9oFgpGzOw==
X-Google-Smtp-Source: AGHT+IGHPGZOCA4FHnX4CiRiQ9Vj+E9Y4C9AXAFlbtB2IYj6ZYSRwc4FUqgJ5xDJzF980IQJC+C2Eg==
X-Received: by 2002:a05:6214:4308:b0:6fa:c453:a40d with SMTP id 6a1803df08f44-70013d52b86mr201203006d6.29.1751270525418;
        Mon, 30 Jun 2025 01:02:05 -0700 (PDT)
Received: from [192.168.1.26] ([181.88.247.122])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6fd772df637sm63677026d6.79.2025.06.30.01.02.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 Jun 2025 01:02:05 -0700 (PDT)
From: Kurt Borja <kuurtb@gmail.com>
Date: Mon, 30 Jun 2025 05:01:12 -0300
Subject: [PATCH v4 5/6] Documentation: ABI: Update
 sysfs-class-firmware-attributes documentation
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250630-fw-attrs-api-v4-5-1a04952b255f@gmail.com>
References: <20250630-fw-attrs-api-v4-0-1a04952b255f@gmail.com>
In-Reply-To: <20250630-fw-attrs-api-v4-0-1a04952b255f@gmail.com>
To: Hans de Goede <hdegoede@redhat.com>, 
 =?utf-8?q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>, 
 =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <linux@weissschuh.net>, 
 Joshua Grisham <josh@joshuagrisham.com>, 
 Mark Pearson <mpearson-lenovo@squebb.ca>, Armin Wolf <W_Armin@gmx.de>, 
 Mario Limonciello <mario.limonciello@amd.com>
Cc: Antheas Kapenekakis <lkml@antheas.dev>, 
 "Derek J. Clark" <derekjohn.clark@gmail.com>, 
 Prasanth Ksr <prasanth.ksr@dell.com>, Jorge Lopez <jorge.lopez2@hp.com>, 
 platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Dell.Client.Kernel@dell.com, Kurt Borja <kuurtb@gmail.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=756; i=kuurtb@gmail.com;
 h=from:subject:message-id; bh=PGzNmxKPeKeIW9y3SLrZgxUtNxszaOvcO3mqQbh5IU4=;
 b=owGbwMvMwCUmluBs8WX+lTTG02pJDBlJLslsC/K2CFxL/spbcP2ZadWlmg358Z8O+c6UK94Sm
 7L81PUXHaUsDGJcDLJiiiztCYu+PYrKe+t3IPQ+zBxWJpAhDFycAjCRkzcZ/jt+ZVFtOqLy0kb6
 vsDGqjWLXa54yE9lldS6FnbxanuVzXaGf2ZP/jPIm1/lEV40/WjTJJMXYce6HU9X/r6vcIn/y6a
 lyQwA
X-Developer-Key: i=kuurtb@gmail.com; a=openpgp;
 fpr=54D3BE170AEF777983C3C63B57E3B6585920A69A

Add a simple boolean type.

Signed-off-by: Kurt Borja <kuurtb@gmail.com>
---
 Documentation/ABI/testing/sysfs-class-firmware-attributes | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/ABI/testing/sysfs-class-firmware-attributes b/Documentation/ABI/testing/sysfs-class-firmware-attributes
index 2713efa509b465a39bf014180794bf487e5b42d6..64b8d5d49716e8387fee26e3e56910862f6a4f5c 100644
--- a/Documentation/ABI/testing/sysfs-class-firmware-attributes
+++ b/Documentation/ABI/testing/sysfs-class-firmware-attributes
@@ -18,6 +18,7 @@ Description:
 
 		The following are known types:
 
+			- boolean
 			- enumeration: a set of pre-defined valid values
 			- integer: a range of numerical values
 			- string

-- 
2.50.0


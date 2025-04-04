Received: from mail-ed1-f43.google.com (mail-ed1-f43.google.com [209.85.208.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C4AF51CD3F
	for <linux-kernel@vger.kernel.org>; Fri,  4 Apr 2025 08:20:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743754861; cv=none; b=YqsfqPcgl3znByd1HdZ8KmOsZa6izxQhUUwoxj9uQQc/IG+8qMjmINeQv6Dkdq/T710Cw5nw66hOUHs17KfTJlONrcgl31s51KKLGv3dEWF5G815k1jEv3e/htIgGTrPFkM0WwF1MIB90kSNMPh3UYoOQDvsZ3IIvLt7enBwm6o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743754861; c=relaxed/simple;
	bh=wIF523BR7ZWB9s9bPU3+WZJ/dOWtjgz9I0IYz1QIIiQ=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=QqvCijDir+h+bHGi1AwVRBemSedGlalAGg/P1yFeqe9V5RBrTTaTsXXxTFZ/pWSt7/lvOXn8b2lYEu5nrc+eDLmSp9Aixb5aT1vuROmGWMBWmhzwHgd4CukYQE9VgPr1EukaEPqYAVSEH/V2sNIoGmKpXAgb34xAi4oz5/90Kdc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=QDNY0Zm6; arc=none smtp.client-ip=209.85.208.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="QDNY0Zm6"
Received: by mail-ed1-f43.google.com with SMTP id 4fb4d7f45d1cf-5e5c7d6b96fso3290417a12.3
        for <linux-kernel@vger.kernel.org>; Fri, 04 Apr 2025 01:20:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1743754858; x=1744359658; darn=vger.kernel.org;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=PhUM97i81TLucKbh3HwO8eUS6b7GpEjII2KUINX9Nsk=;
        b=QDNY0Zm6Pe3VqW1epp3qLhtcTlySHLYP0nejPFDt8mjXQmDWApRo4SVneU67ns7pFt
         OzCeg3uekQgrnmF6eYxol0TpIFRE8PjliSlAfrOhL66nXOZTEjC8y9DuN43vasT/aWZZ
         f/blvLN/OfRq4DiIiz4GbIEArluaky0c4QU1HLSB3D6fhfKampAFKAEFg98byQSizdlW
         4lOfqWMG2w2eUgjECpEuH/rsokpQW/HA/Ww6srQT3at+pbO5HI46GtudeZKkYQfMXLem
         O/iFrYy4M+4/Px1Y9ptvj0v8uci0xI+86UpsB9aSHRIZaoLPNVo2Xzcyrogp0iizcqux
         CTLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743754858; x=1744359658;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=PhUM97i81TLucKbh3HwO8eUS6b7GpEjII2KUINX9Nsk=;
        b=dYUCozbaEpVFUlFcANPwOgB7rDBjlK7woA2iM7vbEJOQDCSzlHW09gfm7YX5zQrMWQ
         Y10YA64dVa/pnaka1UWN6CjqUo8nByx854hEiRDvr5aiabE6Wd5L3AxNHD0zRFJ0kXE/
         f8xAoEQxnSLODOozexsKlWF39kFeFaCUjo9mfjSVG5ERW8PcZuw7GZgrSwJeZ2E5fPuf
         E8lO8Z4l0GkmrTZCEBFcvJbsnhjTQxDErW1MclEbQ1XRv5sGxjcxQclvcJV1nLY1iQkF
         SBdn/2ey7mtalKy/9ZwkDE/tBga5WHXXdyF/DPR/mkM9Gi16eOQzs6BGApGFxcopO/Ui
         6SaA==
X-Forwarded-Encrypted: i=1; AJvYcCVS7sKb9cbcLlCG0em1q5SyhsQwbjPiby14bGGPaQKnnY5U6hAbS7sdlQLpds8QJ6tKd14JY1qfCslscto=@vger.kernel.org
X-Gm-Message-State: AOJu0YzogycCwB6ce0rpnkHaM0MKfuu0MQaBUEUBn+xsYOTYYDVVBUZA
	8P+fUXnbbL9FM7xXgFvqnA4ab928Q5LEhzB5oqFmiN1kw0a7Srd5
X-Gm-Gg: ASbGncs2SJNZwPEUnnqUWjgrIIWTyFoWD7CI5NPh/X9mF8y4nDwidv4Ku2+l86eh8rg
	ok+ebT87KQlYx+M6Fqc67HBi6vbParjniktmm8uNAuD+Pe4ViSLVKz/jnAkAhTyqfv22zyJElGd
	Ay0tPGrPzrLDkIe48aLh2uhR/eBTH7BshEJ6fIwAqgGHKN7xh/L3Xjf1y7R9niX7FrjWt8Ilp8A
	wUfZMrim6HETMjSCJmNVmTptNdZ4EkHpoHj6wv0WIYy2PkHrnfNR0vNBcobpLZ2wdn8F8DjSxDZ
	I+0iMCXbj2rPGelFyuAbMWb0qs5ObZ5025i2i2uwnShmKc5+
X-Google-Smtp-Source: AGHT+IEE+qGYF91L1G7WyX/Xu4M0wabQdp1ZelqhnIo9zgbc86xHNjI0nM7t+1w2KmNl8tb0uAKwLA==
X-Received: by 2002:a05:6402:1ec8:b0:5e5:b388:2a0d with SMTP id 4fb4d7f45d1cf-5f0b6576eacmr1582063a12.15.1743754857656;
        Fri, 04 Apr 2025 01:20:57 -0700 (PDT)
Received: from HP-650 ([105.112.123.50])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5f087eedf61sm1939768a12.32.2025.04.04.01.20.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Apr 2025 01:20:57 -0700 (PDT)
Date: Fri, 4 Apr 2025 09:20:39 +0100
From: Abraham Samuel Adekunle <abrahamadekunle50@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	"Julia.Lawall" <julia.lawall@inria.fr>, outreachy@lists.linux.dev
Cc: linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org,
	dan.carpenter@linaro.org
Subject: [PATCH v5] staging: rtl8723bs: modify struct field to use standard
 bool type
Message-ID: <Z++WV1132FCULn+0@HP-650>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

The struct sta_info field ieee8021x_blocked uses the uint values
0 and 1 to represent false and true values respectively.

Convert cases to use the bool type instead to ensure consistency
with other parts of the containing code where true or false have
been used.

This change causes the struct field to change size from a 32bit to
an 8bit. However, the change is safe to make because the sta_info
struct is not read from the hardware.

Reported by Coccinelle.

Signed-off-by: Abraham Samuel Adekunle <abrahamadekunle50@gmail.com>
---
Changes in v5:
	- Added "PATCH" omitted in v4 to Subject title as observed by Greg.
Changes in v4:
	- Added information about chnaging size of struct field in commit.
	 message and why it is safe to do so as suggested by Julia Lawall.
Changes in v3:
	- Added more patch recipients.
Changes in v2:
	- Improved commit message based on suggestion from Julia Lawall
	- Clarity was provided to Greg Kroah-Hartman by Dan Carpenter on why
	it is safe to make the change to the struct field.

 drivers/staging/rtl8723bs/core/rtw_ap.c      | 2 +-
 drivers/staging/rtl8723bs/include/sta_info.h | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/staging/rtl8723bs/core/rtw_ap.c b/drivers/staging/rtl8723bs/core/rtw_ap.c
index ed6942e289a5..82f54f769ed1 100644
--- a/drivers/staging/rtl8723bs/core/rtw_ap.c
+++ b/drivers/staging/rtl8723bs/core/rtw_ap.c
@@ -389,7 +389,7 @@ void update_bmc_sta(struct adapter *padapter)
 		psta->qos_option = 0;
 		psta->htpriv.ht_option = false;
 
-		psta->ieee8021x_blocked = 0;
+		psta->ieee8021x_blocked = false;
 
 		memset((void *)&psta->sta_stats, 0, sizeof(struct stainfo_stats));
 
diff --git a/drivers/staging/rtl8723bs/include/sta_info.h b/drivers/staging/rtl8723bs/include/sta_info.h
index b3535fed3de7..63343998266a 100644
--- a/drivers/staging/rtl8723bs/include/sta_info.h
+++ b/drivers/staging/rtl8723bs/include/sta_info.h
@@ -86,7 +86,7 @@ struct sta_info {
 	uint qos_option;
 	u8 hwaddr[ETH_ALEN];
 
-	uint	ieee8021x_blocked;	/* 0: allowed, 1:blocked */
+	bool ieee8021x_blocked;
 	uint	dot118021XPrivacy; /* aes, tkip... */
 	union Keytype	dot11tkiptxmickey;
 	union Keytype	dot11tkiprxmickey;
-- 
2.34.1


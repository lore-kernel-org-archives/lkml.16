Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com [209.85.214.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 56F08CA6B
	for <linux-kernel@vger.kernel.org>; Fri,  7 Feb 2025 15:06:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738940768; cv=none; b=CxRNLxJ8U/M0vYGHLUpg0H8TBIukq9Lrj7/dCRzSsgLr2sFtu6tuUwgD9aO1oZfwvsQ0UOSgmfeqtBJFI1lmbgvJZF3Oq1osXwGCsRCym2XqZdjjMX29T8a2Q2XnyduHSlI3YYUzTuXKkFy2JKI54AAHWDP4tlucpDlzR9MCK6g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738940768; c=relaxed/simple;
	bh=QyEFET+WwhrCxy0RKGlbftv6rHAuPH7khhDep27+5YA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=tVCa7JfWFdKf25IoiJ0TWI5Ax8XXyvsNzEpi/NLo3MGgd1HUv+R0TKwS+vnMggt2oi14wweNGTlxRRZDrwCid2RJOgc/oYwuiqddoxxubBm35/TUTlbVhMZYP012FV5PNpEKMHKxo/2kBkcwUY5zMg3O3GtWyV227cRdFD3Zpbk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=AED5CkLt; arc=none smtp.client-ip=209.85.214.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="AED5CkLt"
Received: by mail-pl1-f173.google.com with SMTP id d9443c01a7336-21f4aa501a4so3109245ad.1
        for <linux-kernel@vger.kernel.org>; Fri, 07 Feb 2025 07:06:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1738940766; x=1739545566; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RIGuPfXQLAKNc1iWTzxQRmz1cixh0e2PBKByK6aiTPA=;
        b=AED5CkLtNMMxiu7UfXwSSCBWALb+1XrkerLVF/5rDfGEJz9pEphuknRXSSaTP5NFm+
         uyOeFKjypPdEnKCJupbY5eKyEuG5LsYc4qWQQfbpwLRlTi4MXRsbkl/+5jqUaEKxZSMb
         /6Xs3bHXAbsf5uRxCTgu5UxtPtjZSFrNEHEhH6sgtrEcdiS+dDPCrkWXKMeCNEhe4fA1
         t2WE6xKm/av1cbvwDv9PxCfSImZ1WRU5cL+Hu6tn7fKX9pRtq4qt3qc5lxN3XmOnSYH1
         Lw3ukVIM3qDqVsGuPAtE1Q2mDZ92JCValhmMhKjCzinXVn7i11KykANKwKaOEu66sX6n
         4ECQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738940766; x=1739545566;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=RIGuPfXQLAKNc1iWTzxQRmz1cixh0e2PBKByK6aiTPA=;
        b=LwBIVfpvmlrNOn525rDn+YQmhFQji/QqnkZQaU3PI+gJwjUcH0uN5lJkbqW5NOfPVH
         fPtg5sn0da1ALtGVu3fBtICJDs7MartSdhuwwU0tM8D7Yz8xBxKOISGHKZm9qWoctNka
         /0CNYIq+LSf1IappJEJeFsLERr3ydOyWZLnpsShqS0kyVM3lpqU5wPFz8hGyLl4h3zXe
         semgpVsIM57Pfd2EoM7A5Itng4CWWRVTKB4GWOX0DjAoOSRH+HyDb+s4ZlSMHeC+JcGK
         c47Ew0hU2tDljoQ77bwbwHOVNrgakw6x5rB6cxKFbViS+3LLN5mKiilw8gXuejBg7QyQ
         cnGQ==
X-Forwarded-Encrypted: i=1; AJvYcCXZrqx2/muyrZKJCxArarijmw2mLYJJVSg79HfDAoqBaufwavvd2TtI1wia8ju9NeJnS5lEK0yh5EY0NV0=@vger.kernel.org
X-Gm-Message-State: AOJu0YwpbvWsljW3oPQAhPZlgbTVzyJjB29I1LFBAiyeqpOpl49SQH57
	lnrNOT1Twbifvjb5O09GdSFOFL+ehzHKde7yFtbA6fBpc+8B21ax
X-Gm-Gg: ASbGnct1yr+UmN1KVI/qIvyIGjL55zQ2QaHNpMChZadEO+TybI8yVz+df+u69kjG7DZ
	BAQkGfObcTbZxv9GArTIhWBbpaTXs+yX03r6S4nX9c9QeNjveMT+Y3fmfBGY0sryM/3a8I/jeKT
	txBiL+u142GOrAHo6ecvwEO2E8ZvfHOaMsCByrSwbHVgZNJhp9ZCYnx8VvF3ue6eBir1Y+wVrHV
	igx7iqrmly82FL3fqQNWCNlMSaK93rbYmUkjotJ6Uo0fPheLx6+WSZhssWAUpdPVKkuRIHow4lu
	f+N9jQpext43/o0S1pOLg/5CjXyz
X-Google-Smtp-Source: AGHT+IHpUifPkda6sUfbo6+MrAoqTdTT7zUDn7sav/LK+GemDVyy8m9Y/0pS2ZAOk7TkitGj6vVo2w==
X-Received: by 2002:a17:902:cf4c:b0:21b:b2b4:93ab with SMTP id d9443c01a7336-21f4e7d13b6mr20523145ad.14.1738940766629;
        Fri, 07 Feb 2025 07:06:06 -0800 (PST)
Received: from localhost.localdomain ([2802:8012:30:9200:a83e:911f:eb3e:1cb7])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-21f3653b143sm31855815ad.54.2025.02.07.07.06.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 07 Feb 2025 07:06:06 -0800 (PST)
From: Gaston Gonzalez <gascoar@gmail.com>
To: linux-staging@lists.linux.dev
Cc: dpenkler@gmail.com,
	gregkh@linuxfoundation.org,
	arnd@arndb.de,
	dan.carpenter@oracle.com,
	ajithpv.linux@gmail.com,
	roheetchavan@gmail.com,
	niharchaithanya@gmail.com,
	eleanor15x@gmail.com,
	everestkc@everestkc.com.np,
	kees@ijzerbout.nl,
	skhan@linuxfoundation.org,
	linux-kernel@vger.kernel.org,
	gascoar@gmail.com
Subject: [PATCH 3/5] staging: gpib: ni_usb: remove unused variable
Date: Fri,  7 Feb 2025 12:04:09 -0300
Message-ID: <20250207150427.153982-7-gascoar@gmail.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250207150427.153982-1-gascoar@gmail.com>
References: <20250207150427.153982-1-gascoar@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Remove unused variable 'adr1_bits' in function 'parse_board_ibrd_readback'

This change removes the following warning:

warning: variable ‘adr1_bits’ set but not used [-Wunused-but-set-variable]

Signed-off-by: Gaston Gonzalez <gascoar@gmail.com>
---
 drivers/staging/gpib/ni_usb/ni_usb_gpib.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/drivers/staging/gpib/ni_usb/ni_usb_gpib.c b/drivers/staging/gpib/ni_usb/ni_usb_gpib.c
index d0656dc520f5..b7f221def217 100644
--- a/drivers/staging/gpib/ni_usb/ni_usb_gpib.c
+++ b/drivers/staging/gpib/ni_usb/ni_usb_gpib.c
@@ -427,7 +427,6 @@ static int parse_board_ibrd_readback(const u8 *raw_data, struct ni_usb_status_bl
 	int i = 0;
 	int j = 0;
 	int k;
-	unsigned int adr1_bits;
 	int num_data_blocks = 0;
 	struct ni_usb_status_block register_write_status;
 	int unexpected = 0;
@@ -460,7 +459,6 @@ static int parse_board_ibrd_readback(const u8 *raw_data, struct ni_usb_status_bl
 		pr_err("%s: bug: status->id=%i, != ibrd_status_id\n", __func__, status->id);
 		return -EIO;
 	}
-	adr1_bits = raw_data[i++];
 	if (num_data_blocks) {
 		*actual_bytes_read = (num_data_blocks - 1) * data_block_length + raw_data[i++];
 	} else {
-- 
2.47.2


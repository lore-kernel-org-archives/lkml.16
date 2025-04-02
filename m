Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D3E8923E357
	for <linux-kernel@vger.kernel.org>; Wed,  2 Apr 2025 12:47:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743598075; cv=none; b=B68BoJE4c8UOEPJ3PpKDspTCfbwuwprhb955ECiBUobWhxyfvc89RhpRFdFdHN/YLEVSiAtx9GvJ6GXxe4nUqzai1xHk4uhSyDzqxFFM+eILMgmjQ48ZVcAh7HFwckj/2YUtNz69t+2/xNgm9ykGsl1HUUeNAz38JBtnPwhOnq4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743598075; c=relaxed/simple;
	bh=zSoehIniU8jm04IOOedJamJbm8GIIQPM5e7PJNzDOKc=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=hLipKCgYRF1V3XyAy+TEJBYjAvbrJFZU+D+lP0oiEIGYMBAjiYwRAsRS3U5oBmSQKR9wBGUatiUxUR2l3OtW3p9CyUsNymO10HQ4knGZyZClQv1lpSZa89xQ4lnvGeunItSw/5OoSBmQSlveWeSFAxl3Rm8+KgMPTMObzJgAh5g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=WzHjJq0z; arc=none smtp.client-ip=209.85.221.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="WzHjJq0z"
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-3965c995151so3712873f8f.1
        for <linux-kernel@vger.kernel.org>; Wed, 02 Apr 2025 05:47:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1743598072; x=1744202872; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=LEWeMCeaswgmteuyJgZbeIbf8aY5zFHTFf+liUe5LTg=;
        b=WzHjJq0zQiMdPOzkTeFGCO87ZhT9Sh9KGnUSgxDFiH7PDwBaIJgdqRYLFZV/nTsGW1
         Q9L6xFfh19xi/JUKXijXLL44GYJyRIyDF/pg8L2fch7WNOhfSnedNgV0igU+GzVGEYzn
         3y7AdBnETuNqHt5Pywd/dj3j5EBtiG4qPnhSWqzhfWeaxc4A4UU6UJXgpNitaxijudUP
         gj+1VWu8GIQ5yiH+AYcM8H4xHeMS0nLk96pRwL9qf4PcNXMJ6ShIyPDV0Z6GyuXbiw3c
         g/SyaSbBXY1+Pja4PQDli1bbKoScJfWluot3xmheliQLV8UpNdDLiAY/05h7kMPZhhA+
         lbVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743598072; x=1744202872;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=LEWeMCeaswgmteuyJgZbeIbf8aY5zFHTFf+liUe5LTg=;
        b=HQrd1CHoo/CpTRr+VI28NOqwOMluAQqn2VpRkuNb56wmbEcRxxHGn3VbbzOIU4bbXa
         NJBTbUcBaIgbLm3hMQ3/t0asDe2A7Oh92NHmFcB+ZI86U9vdJgjc4xp66fxkmaAPTHg5
         VEAuZoLDgcj5KWC0xe0VABFIX54r9eUdJ8LzuMrSdDyekVEghcyVThSHqv6AVI91I5A2
         9Qod5iFCp6mlL23l3fEB2CANJuQyewSPhKr37IxpHoi1hsm2w2wWCxp2YxO/SmHOBpvs
         Nkc6TuWMYFw3uVLdBRNc5bXlATUgp2LmoBbejyWtpIjAiv39j66Y1gMgoLNsqlxhK0AZ
         N8QQ==
X-Forwarded-Encrypted: i=1; AJvYcCWH5p+E6VXAJ38HTMrt69st46NquF4JkKiFdDl5w80nVjOl9+fneDAXTXC2ll8z2Wca2hxgb4CRDVWF0LU=@vger.kernel.org
X-Gm-Message-State: AOJu0YywYV2w+gZQva+QZvIIiDmJo4w3tj5b8zwQT+MuORiEXV3sA2L+
	j2HRjxmoa/TOY6l4O7dCTxZmoJeZnH0M5KRxYHidhrbqYFtSk793
X-Gm-Gg: ASbGncveFZjfXKkMo/1uagiw2sExPWTIIXzH63griEVtkJEsxR4vn13WjNSivPYvt0O
	0540YR2CeK2A8dkwwu6galmskcrfR/6/cwoT2CGVvecJ4z8DHVESegUuCBY7lQ1kHk7Gknjk0BL
	KDtaPoNZTU+Gu3pRmfaFBMuTq/o+j8XCfSRak67qs+rBU8ZxFq1SHLSZTlWVL+nibi6kCjr5wbj
	TpsTuFNxVwoiTWVJdMq/6xQwmD4tvQwckOTlAA2KtNpdOO95BaXS7zjXdAf+BzZ5geOAEnQC1b2
	TBFFfR8uu2/okia8s10sjbJeVh/+s1k1+S+/c64GxA==
X-Google-Smtp-Source: AGHT+IEOTmnpf9qGDadsLtbYyixVKFrhrd0ujtS0ksf/cMhCW8I+X2FWzaYLi0rLTArKqpzOW2dvHA==
X-Received: by 2002:a5d:598b:0:b0:39a:c80b:8288 with SMTP id ffacd0b85a97d-39c297698fcmr2134047f8f.33.1743598071795;
        Wed, 02 Apr 2025 05:47:51 -0700 (PDT)
Received: from pc.. ([197.155.71.138])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43eb61b6cd2sm19675985e9.39.2025.04.02.05.47.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Apr 2025 05:47:51 -0700 (PDT)
From: Erick Karanja <karanja99erick@gmail.com>
To: gregkh@linuxfoundation.org,
	outreachy@lists.linux.dev
Cc: karanja99erick@gmail.com,
	philipp.g.hortmann@gmail.com,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH 0/3] staging: rtl8723bs: Code cleanup patches
Date: Wed,  2 Apr 2025 15:47:40 +0300
Message-ID: <cover.1743596287.git.karanja99erick@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit



This patchset refactors the rtl8723bs driver by replacing
integer literals (1 and 0) with true and false,
improving code readability and consistency with standard kernel practices.
The transformation was performed using Coccinelle.

below is the coccinelle script used:
@initialize:ocaml@
@@

let same_function p q =
  (List.hd p).Coccilib.current_element = (List.hd q).Coccilib.current_element

@r@
expression e;
position p;
symbol true,false;
@@

e =@p \(true\|false\)

@@
expression r.e;
position q : script:ocaml(r.p) { same_function p q };
@@

e =@q
(
- 1
+ true
|
- 0
+ false
)

@s@
type T;
T e;
identifier fld;
symbol true,false;
@@

e.fld = \(true\|false\)

@@
type s.T;
T e;
identifier s.fld;
@@

e.fld =
(
- 1
+ true
|
- 0
+ false
)

Erick Karanja (3):
  staging: rtl8723bs: Use true/false instead of 1/0
  staging: rtl8723bs: Use true/false instead of 1/0
  staging: rtl8723bs: Use true/false instead of 1/0

 drivers/staging/rtl8723bs/core/rtw_ap.c       | 12 ++++++------
 drivers/staging/rtl8723bs/core/rtw_mlme_ext.c |  4 ++--
 drivers/staging/rtl8723bs/core/rtw_recv.c     |  2 +-
 3 files changed, 9 insertions(+), 9 deletions(-)

-- 
2.43.0


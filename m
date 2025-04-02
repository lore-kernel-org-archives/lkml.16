Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C3C2B15539A
	for <linux-kernel@vger.kernel.org>; Wed,  2 Apr 2025 17:16:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743614218; cv=none; b=ZBG9JZ+cAWPBpuP2joZ0+ek54PwPVjsAc22XS4JmTdOa0MJGevyUAPHKMK7WCYv+c+XTWWumD4NFJEFvyAxmJsQYDMRclEeWch71duj3Fg5bqugmvhvCmvqZ8bAL13/ZxvyG3vIW+2skVVuXrZ7o+8626YxZh4DFf9B5LoMEG/A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743614218; c=relaxed/simple;
	bh=ntBQ8YBvSjxLwm6joLtcDBsfy6hb3/+gK5Roub93e4Y=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=WvwfYER9MFArGdLgyrq5LmLaCyRf4XSz3P77peAhT+sZ5E+1ODqIoIARS/x6o+i706DhaDWELy/54h/XXF/1t6Eg/MoeVmdx+hmXbP9YvGJnMKcHrzzr4GKDgqLyCeeMkgQvsvh3YNN1cqkp7vJOugri0k4yZlmWFhfAqdZiWDc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=eqSaUk/C; arc=none smtp.client-ip=209.85.221.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="eqSaUk/C"
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-39ac8e7688aso37510f8f.2
        for <linux-kernel@vger.kernel.org>; Wed, 02 Apr 2025 10:16:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1743614215; x=1744219015; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=cinhPzEEhT1QyE/PG6mMyrF5hiwNrz0gNjdnK2D6mos=;
        b=eqSaUk/CmPCkq4jYRj/5u9SsXaaNP0R8evTDSQUB8saFYNe8EzKl/fyyLqkmlSE5SF
         qN0G+Xai59xsg9/sH1GmKYH75oCf3o+hqlRtv86Qud+1is2KQUR334ATYwhek/qidVWe
         J7BsZiKDVGEQLkwVUNGlOAHsL/qqlfBCxDG6DV0Crq4hd9lLu8GcqlJlK49HGQAqZATr
         DDto4uAf9ddT+HqV6mgzjHBTXgT4T2S1wF/WF4i2/WNssG1XQRe2f0hVOp/1fNUxeyMj
         2ns/pbWkI5i8XlxRYDXEmp8nYMgL541db0dEFqX7UyEkHIWD+ZySwaHiXXANcHA6d//o
         vm3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743614215; x=1744219015;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=cinhPzEEhT1QyE/PG6mMyrF5hiwNrz0gNjdnK2D6mos=;
        b=Z8QVJn2pONa8kRltJrhXJI3QmM6lYG01PGOUIysIeF0KGxV+rk5nivxmRnem+uIghi
         qDnwPg8E0wnYkU/Hf6BU68Qe/S9uSK2+NFFBt+IRiPxS+5Muxk0P0eFiFA26kkqMMT+5
         A21K/O7JBgvmxAO9oh+XHj3K1I7FGKXr5wv+2gqkB/RGOYEDdj+Gv8vtvlKef4nyyylb
         TGM0HTByVS3hguuq4uJx9gUxXtcog2XbaiFL+RhG3vCaHsSZq2u5qKTByWvhDWFFcGeg
         l1uR/7M/GCDxxA86nxOD/z7V3HuABY8XIUuYXIvOd3GFYaDwKG0mwHtEKv5dbd0BRzqA
         TBHQ==
X-Forwarded-Encrypted: i=1; AJvYcCURVBMhT4nLfjnQD3tATTPvP5Dw52meGFYpYyG/Nl8Wi0eWxV4+uzVuwhKyogYrOYs6c85o3CQCSbLcdpM=@vger.kernel.org
X-Gm-Message-State: AOJu0YzP7LnQbxD3ibOUgPVSW3L/hb4nuGehMICZlH+mOYbe0TVPlCgK
	WsDTYk2N7/lpboh0XFnqSYYr8vVdmQYBh/eK4HgJwUME0vp0mGfI
X-Gm-Gg: ASbGncupAacfOcSo+WW3fE+neVxVCQ0FkMXTDfFmWqGlwASoAueeJtWUXE2c4oS3phn
	Sbkc1kfh7fx2U6E7GAoLSkwDwTePFI3f2XKfQXgIrJR4nHoHrj8lLWuxdGLkDhXXUPlr/vP5gfO
	5gmRG2jk6Q2Ep3AWMdCI6t+IAlt4/mqOLWt7+09xMa6kpW1tdD6Nce81t1EL2SuCDJS/AGxGYYy
	UMi4JpBFcQsRE68tB3bWba7b0O3qJqZzW4qT5Pb9UzDlgENUZKuIeV9uxneN3eAKOJXx/t7/bM8
	Z9ThxRdJJcdSztbkVPwrtySfAmatSg3y5/BLA7DQVA==
X-Google-Smtp-Source: AGHT+IEpLy1hDYk9qW38z4NQPL1UllYS9vbREvFMYRYe5cpT/xjNBknLy66id3POist2gvbNiC7GXA==
X-Received: by 2002:a05:6000:4210:b0:391:481a:5e75 with SMTP id ffacd0b85a97d-39c29752ecbmr2577538f8f.22.1743614214910;
        Wed, 02 Apr 2025 10:16:54 -0700 (PDT)
Received: from pc.. ([197.232.62.205])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43eb5fcd489sm26713525e9.11.2025.04.02.10.16.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Apr 2025 10:16:54 -0700 (PDT)
From: Erick Karanja <karanja99erick@gmail.com>
To: gregkh@linuxfoundation.org,
	outreachy@lists.linux.dev
Cc: karanja99erick@gmail.com,
	philipp.g.hortmann@gmail.com,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 0/3] staging: rtl8723bs: Code cleanup patches
Date: Wed,  2 Apr 2025 20:16:41 +0300
Message-ID: <cover.1743613025.git.karanja99erick@gmail.com>
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
integer literals (1 and 0) with true and false in instances where
values are already defined with true or false but some defination
contains (1 or 0)

Changes in v2:
	- [PATCH 1/3]: Rename the subject line and improve on the subject
	  body
	- [PATCH 2/3]: Rename the subject line and improve on the subject
	  body
	- [PATCH 3/3]: Rename the subject line and improve in the
	  subject body
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
  staging: rtl8723bs: Modify struct rx_pkt_attrib attribute bdecrypted
  staging: rtl8723bs: Modify struct sta_info attribute qos_option
  staging: rtl8723bs: Modify struct sta_info attribute qos_option and
    ieee8021x_blocked

 drivers/staging/rtl8723bs/core/rtw_ap.c       | 12 ++++++------
 drivers/staging/rtl8723bs/core/rtw_mlme_ext.c |  4 ++--
 drivers/staging/rtl8723bs/core/rtw_recv.c     |  2 +-
 3 files changed, 9 insertions(+), 9 deletions(-)

-- 
2.43.0


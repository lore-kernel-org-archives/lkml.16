Received: from mail-qk1-f171.google.com (mail-qk1-f171.google.com [209.85.222.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D2161DF99B
	for <linux-kernel@vger.kernel.org>; Wed, 29 Jan 2025 21:14:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738185249; cv=none; b=ft8e/zQlr6oiHLiBHiCOIs/qKgNaO4AM7EhaUc9Sz7ppwjM1GFCfFSMB1nl5Ow6MFsfiGZvv1K1Al3FwwgvNO4I0GfXKeqOrh1G9GYzyLGjd0WrgMlT+z4yGxbgJR26IaoL0xiPT7hmuCEdkcHhoMHPe8LauMAkMc4K/DqL8Um4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738185249; c=relaxed/simple;
	bh=PmYKTFWwaYT9oL6MuT4tZuUkENSCvHL4ys61me6UI4Q=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=FoGN75dxVF1Qky8AbO4+rtkX/w++Z7ZXxg5a4X6zi+MPznrJOo6a2iM3lHHMnbXnqUZ/NP/L0zg3c+njaqRycE0TG6dnng17Bu8/cZmhH5OOWVinA/VIU8jbdS+oIkampEhmJJ0f2ix4+HQr4h8Yz2UF+K+nFLkltRiXS99iq8U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=H/s89NDv; arc=none smtp.client-ip=209.85.222.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="H/s89NDv"
Received: by mail-qk1-f171.google.com with SMTP id af79cd13be357-7b6e9586b82so13817785a.1
        for <linux-kernel@vger.kernel.org>; Wed, 29 Jan 2025 13:14:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1738185247; x=1738790047; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=NY4mG7qn8AqbIggjNh+c2hdCHd5Q3s+WuiKAPKZ2muY=;
        b=H/s89NDvz0QsBaThV9ekLg7MNdIGfdC9DGElbNpbZYoFQbR0MlguKS2UlellhjEhJS
         WYQpetuOT2Rc5eEMSNbi7nwUcyS0/SBEGszBhAZngnRhoUv2pjPQ65b4Y5Xfs/a8kjL7
         9bXpBWDvE7oPB2EYmjSHeFqddBk7DyauuzOokoD74uEwpK4bN/5rBlcLfRvzv+BnJDrW
         52MBaNwPpqBCH5sHi4Hmkdi6/sCxQwsuO/7VlRSUY2I4pDnuqezpKVJXyKRYX/OdDduy
         oEid8mMoW3TfErOBJo+8rlQBIYnB1uLC09wWuUHxzg0+h18I1xoN+1hJyDRFmcKo8EAK
         znTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738185247; x=1738790047;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=NY4mG7qn8AqbIggjNh+c2hdCHd5Q3s+WuiKAPKZ2muY=;
        b=aBhOP7Ll8nng4NWY8Lm7jLWNSBEJAiXLPS/g+rqxz3Dia/MBg5TcRuS1pVuW2uxkky
         y0M27jcJ5kzvzryW6WOfkdA+UMoF5gHLX5y3+ylFKPDGnitagGywXlztISGV3cjvKxdE
         IVwWKMtgoapqy2ytaO8ZNqAB5JiBUm4Zaashl8UAUBefyW6hCKFRaNFMjHYhJuS9iMNn
         0Fd+sOh8/i2ei1uOt/68/Tx5qhSYKNipIKE/ILGqAC689tvdu2l7vfJRGJMDrlnCcgTP
         UZK+Y/k5ANz6iu8diiOCv+GUTCaPH6j/OhdeEQp7sTbD3dmbsTEy1Eo8rg3dlSmcqwrD
         g0ag==
X-Gm-Message-State: AOJu0YyiLdus/6imaxgBTa7dON0JbeJNB0wFVDlVXOjjPB6KSCSURWkJ
	uP7ysPIPVCJA7j4i0Ooa17KilIpbZkaCQBNogB3tSmZkGYOrfkiV
X-Gm-Gg: ASbGncszVXl89k6wcln9cd8pbftLUehKHh4dc5UXthWHPHbR8F0l/LabtamZeVoye/Q
	rWkkSDoJKwTg/A21tSqM6NQuCrbRALsHrZs37a4/mwID1j98m/LHDB+YefAP5XKQ/xCEM9vzL+G
	ZTD9N86oXAGDilYArO/dO/Ei/yNKjGUSNK//YLmzE2t8/bEljS2ZnEJEEAnrjDKEYlFPG5HcwV3
	ERrugZDlHYdQOOKHx048CkoQ+cJtp7Al5ydQYLIHgCwTodBt2oBxepLjhq+sVdX3U7ylGSy+JdW
	1+ftEsF9GAFXYL2uvCB8dhVZ17qaG9NkAMP6ag==
X-Google-Smtp-Source: AGHT+IF7WPmdeBseXKPMTRX/v2KoVbY+N7joUEpJ2tpY0Boupj0PeqB3cndmiG8EpF5zSRzbLZhe0Q==
X-Received: by 2002:a05:620a:4101:b0:7b6:eed4:695c with SMTP id af79cd13be357-7bffcd43d99mr710007785a.32.1738185246990;
        Wed, 29 Jan 2025 13:14:06 -0800 (PST)
Received: from [192.168.1.159] ([2600:4041:5be7:7c00:b1c0:7162:e86d:8563])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7c00a905581sm3695285a.77.2025.01.29.13.14.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Jan 2025 13:14:06 -0800 (PST)
From: Tamir Duberstein <tamird@gmail.com>
Date: Wed, 29 Jan 2025 16:13:49 -0500
Subject: [PATCH] MAINTAINERS: add lib/test_xarray.c
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250129-xarray-test-maintainer-v1-1-482e31f30f47@gmail.com>
X-B4-Tracking: v=1; b=H4sIAAyammcC/x2MQQ5AMBAAvyJ7tklVKviKOFS72IOSbSNE/F3jM
 Ic5zDwQSZgi9MUDQidH3kOWqizArTYshOyzg1baqEp3eFkRe2OimHCzHFKGBI13daNaoydvIMe
 H0MzXPx7G9/0ApvxN6GgAAAA=
X-Change-ID: 20250129-xarray-test-maintainer-5dc360852bd5
To: Matthew Wilcox <willy@infradead.org>, 
 Andrew Morton <akpm@linux-foundation.org>
Cc: linux-kernel@vger.kernel.org, Tamir Duberstein <tamird@gmail.com>
X-Mailer: b4 0.15-dev

Ensure test-only changes are sent to the relevant maintainer.

Signed-off-by: Tamir Duberstein <tamird@gmail.com>
---
 MAINTAINERS | 1 +
 1 file changed, 1 insertion(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index feed152470f6..a9a8c153a9e3 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -25681,6 +25681,7 @@ F:	Documentation/core-api/xarray.rst
 F:	include/linux/idr.h
 F:	include/linux/xarray.h
 F:	lib/idr.c
+F:	lib/test_xarray.c
 F:	lib/xarray.c
 F:	tools/testing/radix-tree
 

---
base-commit: 805ba04cb7ccfc7d72e834ebd796e043142156ba
change-id: 20250129-xarray-test-maintainer-5dc360852bd5

Best regards,
-- 
Tamir Duberstein <tamird@gmail.com>


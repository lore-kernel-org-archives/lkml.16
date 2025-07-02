Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com [209.85.214.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 693121531C1
	for <linux-kernel@vger.kernel.org>; Wed,  2 Jul 2025 04:27:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751430449; cv=none; b=FdzbLGdTHA45GXaSM9mmQYkLfWTXqeosbxE4TnMNVeYHoY2xkCGMYvhUnCwBn7j46/AfWq8lmywqTZWOq4dAL6QYUVyB7b7YrfBiIGMWOBfHcusePSSXgyquLDGWLPgHJfHmIBKhekCyBFZG1Tty6EPU8GK3v0vFHBPk2CiCTdg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751430449; c=relaxed/simple;
	bh=OYJtpFm/E/dRMOvjjvXFFG+4JubriqjRM3YX+gI+APE=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=ICs8tLGT82D3u8QBzg8hx3iRfetj5roRaHtwVAFgL1R3fQ3fV9aImtJP37UeElbMOZL+M7W61bufhMla2nhYbAuEpXdpbyKz0R06Cc1hNmG4Cuw5pA27x3GsTIW6yycBTGxBABy9xGVtxz9HIxji1tz/o1Y9sar16PmpJxlqQ7c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=aeDvYrwA; arc=none smtp.client-ip=209.85.214.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="aeDvYrwA"
Received: by mail-pl1-f177.google.com with SMTP id d9443c01a7336-235f9ea8d08so57777045ad.1
        for <linux-kernel@vger.kernel.org>; Tue, 01 Jul 2025 21:27:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1751430447; x=1752035247; darn=vger.kernel.org;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=yncayoIYCVH28L581gpG7XAwuq+YwHe6SAGodbwavLs=;
        b=aeDvYrwAaFdE5S2jUTNLg51mkJvujNU3agjIzC+E870wDmCWf9LHqdsvnponXYNL4u
         FecQn4e7DspxEToHNLarMson9Jem/oNtR/ivGbixBWPzNnp2ZBFt0GG9dNCUkbJKoEV3
         ZsW2YKTLyBjslyRbOrT731uc0kKMUExOHyXkGpFlF6CepfzBiWcUJBUpafCoQOsBGURV
         6TTRHjG+pKzF9kdMuT2Yao/JkkUJ3G87Lh6tgxoQTcsReGAYrdq19xJHpk4JYPGbqgfC
         oXM+M5bLWt7cbKz1zFN7CmnAahrobdkym1lTBOFrMZLK/3M9isohUjcph6LtPcnf+iRf
         lCkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751430447; x=1752035247;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=yncayoIYCVH28L581gpG7XAwuq+YwHe6SAGodbwavLs=;
        b=fEO4vzj9X7YCpHjah5V6yoaAlXvgCViNuYmW0518l8g1X40VrXYcQr0pumCXiQ6r+f
         OE7rneZ0n5Af+apsgDg57qPJlSYCMBjn6fxxa1kC7lcony1UGTN9HTveLa8NnO61Eh3d
         mxR4FeeEqww+3/JGqyLhDyu/Q/BTTsTkK183gBxzl76RARRfYtog/I1+MIOI2tqacpyW
         y9bIms3IjOkN9llVaJeY4q1HjwYdwMd5lzltY2bbzVoi9bXMVApofeqrlhr6VFtKeDIM
         kQFLw36t0PT8NVyFVnTrr91wzTBc/qJCsSfWSbdNvws1iToqaIfgCE8NSNxM43nSgUCW
         NenA==
X-Gm-Message-State: AOJu0YyJSTzdqjH1p7+D9yBCxaom/WvISVxdgohYVaPeKw+XF6MUmw2Q
	+hn47v1uDDw0EhAmlzJ4QmKo9JaEFz2msPYhpQbDYNSq/yrtqevr8laYS2sBoQ==
X-Gm-Gg: ASbGncu55Qqx93MEbina3nfKy24EddjD2GdBCaUbUuQxSiaN2A2jh3W39H8Ps6tXnbb
	Q+eQHZSOAYrPHdrsQ5HxPnD7tiqgXIUKRGeEtMHeWJ3J6LqJTj2YRoSU9Pndsf3dfb6tnCEpVOk
	Q30sJrt9fyT0yKiA4rvAbg6Z3s/iCvLSlC8bZsmFDHnFl68Uh3w/RQ9XeGMFSm0AXYDHcPyj6MH
	1+5Drj9kgqNUnd9oPH3x5WSpeHENr6JBxCs0erorFjn+aFjhrRGYovu5lm4cDR8q6BJEPg+I/Kf
	Y/IbBczcMhwMEuasV7og5yisBMdXyhlomsQgRuSjWfGqYnFAEjzo5QyevoIvwmI=
X-Google-Smtp-Source: AGHT+IF8VNomMb5/0TF6pQoWbnsiek1swkt1i4ckei7ejegHVRSqjKwvXRprRXfteQndrnAD4bX70g==
X-Received: by 2002:a17:902:e884:b0:236:93cb:48b with SMTP id d9443c01a7336-23c6e5c5a1amr22178915ad.44.1751430447333;
        Tue, 01 Jul 2025 21:27:27 -0700 (PDT)
Received: from google.com ([2620:15c:9d:2:918b:9ece:525a:9158])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-23acb39f34dsm119500145ad.130.2025.07.01.21.27.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Jul 2025 21:27:26 -0700 (PDT)
Date: Tue, 1 Jul 2025 21:27:24 -0700
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: linux-kernel@vger.kernel.org
Cc: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Subject: [PATCH] lib/vsprintf: include stdarg.h from sprintf.h to provide
 va_list
Message-ID: <hm3lxgfzjhxigj5no5csubdo6kolvdjwyhpveirbzptcdbmcag@tqunw2rllae4>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Declarations in sprintf.h use va_list so it needs to include stdarg.h,
otherwise we may be getting warnings like this:

./include/linux/sprintf.h:11:54: error: type specifier missing, defaults to 'int'; ISO C99 and later do not support implicit int [-Wimplicit-int]
   11 | __printf(2, 0) int vsprintf(char *buf, const char *, va_list);
      |                                                      ^
      |                                                      int

Fixes: 39ced19b9e60 ("lib/vsprintf: split out sprintf() and friends")
Signed-off-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>
---

Can I take it through my tree if acked?

 include/linux/sprintf.h | 1 +
 1 file changed, 1 insertion(+)

diff --git a/include/linux/sprintf.h b/include/linux/sprintf.h
index 51cab2def9ec..9ec0033f4106 100644
--- a/include/linux/sprintf.h
+++ b/include/linux/sprintf.h
@@ -3,6 +3,7 @@
 #define _LINUX_KERNEL_SPRINTF_H_
 
 #include <linux/compiler_attributes.h>
+#include <linux/stdarg.h>
 #include <linux/types.h>
 
 int num_to_str(char *buf, int size, unsigned long long num, unsigned int width);
-- 
2.50.0.727.gbf7dc18ff4-goog


-- 
Dmitry

Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F3F552690C8
	for <linux-kernel@vger.kernel.org>; Fri, 18 Apr 2025 06:43:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744958614; cv=none; b=bBYQug95mbMigEK4TpTSAlCo0nIU2s6XeJKxsbRmdsA5FoUGXKr2kuoQlU9jGLdap1xZYQJYxIUYPR2YrPUVhDBluiLp3ZS6bipllosC/Vt1hO+Nlcagioq7qxTiscCJrA1VRcqd54B66dqNErEBVE+LElayEEjlBLx99Pcaw0Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744958614; c=relaxed/simple;
	bh=l12G9/KABGBWRLrSnjVdfQ0Z2bSs/KbpUquxhRC9aSo=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=udtLxkelFdvbO9vha/f/hJ3IHDJiaHXJZ0TJ0rXL0AeoCWPxxuXZavgyNnM0AwndA6/oqoude7WyhSLdC08emfbnIMdN52dieYTN6s9WTogUXMmBmzYvoE9NVbbPkcUHZUOM/8gvTYLChI6cOjgVpz3zCEJCjwNI3AbdLlX7f3w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=YHkU5/fh; arc=none smtp.client-ip=209.85.128.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="YHkU5/fh"
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-43d04ea9d9aso7359555e9.3
        for <linux-kernel@vger.kernel.org>; Thu, 17 Apr 2025 23:43:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744958611; x=1745563411; darn=vger.kernel.org;
        h=content-transfer-encoding:content-disposition:mime-version
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0eX8qj76kO14FK/DjeL3E1y5jYurP6zJ1Vl1XJVXa+E=;
        b=YHkU5/fhGsvhddvp7bArMOJkKLi96Ack+TpRrXiq0Z6g36V4oKohDljaaIweKk12sD
         3ZXmQVN0EFWjAAFCqb9kFA3D0R+LjRPzELtICO4if85cplch3G7/Hyv8qtSwAKdw3gxQ
         1hKd/kM6at/tSJ6GHOIDpL1BmRvKaS8K5LOVKRztz/Y1VZv2gtUYsMRJgrYcJCwzWsf2
         XYc3b/NRcmCGbUn7pUarnUvEewJVX5KR+df1r/iUzDthw0cpgnc7U8BoixxZRuzSGQKz
         Trgh92vxi4O3XK9R+dPV9iLmfh0dBfoFIiJTFmldKo14kt/StMtDBy2Na26FkzP89IGZ
         /wOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744958611; x=1745563411;
        h=content-transfer-encoding:content-disposition:mime-version
         :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=0eX8qj76kO14FK/DjeL3E1y5jYurP6zJ1Vl1XJVXa+E=;
        b=nwWmf2omjezQ3kRmhk1Cl9QdkFr+FTMzhtMOh9Y7VhCt2ieD2sUw5+gv9wk4yWetf1
         DDYhjWxPKgKmIE2RzQcygUlv2sRj6LW++GRhHRXfiw1CSD81H5C07bL1BT/StehAe0vT
         Va9J4Dwa9RxRTXM4vYEZCCHAHVt6h86MI4dkOCVNucDY/KK9Ftq6Gsf4CqpF2VspLpjn
         k0bQQWPky5DONlUr/BupgxijYMEilxzxDKazDmrsEBaMjscbAbBM5T81qZMSZvz5qkub
         1zypVjk/DbgrwEKuyN9RXPEaxq5t4sM/5QxAsMBWHhsCy67e+Pc0Cx+Hh4R91B97wqFj
         zd5Q==
X-Gm-Message-State: AOJu0YzvwIlhMSP3t29GiFN8WrUo30G2ikEP+HZh5lF8VZLrMed3HBKb
	Z/2hkiPyIejKRFBe6fU0jYcRB4ZCiaFSwnXYFQjDrkNw7o60mtkv
X-Gm-Gg: ASbGnctl6yTwAfSeroxyoUgZPhRCsKBDeQxhYE+tCFBSj421WuIh1ClScNJe6oAssCw
	gUM9rlx4IVzaMdviA4Lc7EW5mkFNAG8kNw7hmmaopzafLX/G0QMleUvffY1Qqy6reETrfXaFG6l
	cLBrA7Lw5dROxn6bKYihN9W8inDLLRJrm8TNIaGop7bw4eufvAOdzrO08KPysoLAK9EXjFvOtir
	YT0CCHL1FqOimI/2iRLxoKlc8qZ9fN1dzMEdE+hc9Phmnh3UweyXzZJC/dFFdy5rF1s4Sfytmgp
	6mAfk3RZ1oUhfB71bVVa8UnQDDgvYi/5gaIU0YfxWfE=
X-Google-Smtp-Source: AGHT+IElSs7WpG30PXcCOYLok608/TQYkm0oTnUFtMIlxhvmGvRCS45j7AuHs1Dz3kgju+dDdObtIA==
X-Received: by 2002:a05:600c:4688:b0:43c:eea9:f45d with SMTP id 5b1f17b1804b1-4406abb2cd0mr12023375e9.18.1744958611068;
        Thu, 17 Apr 2025 23:43:31 -0700 (PDT)
Received: from localhost ([77.237.184.200])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4406d5bbcb6sm10216245e9.18.2025.04.17.23.43.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Apr 2025 23:43:29 -0700 (PDT)
Date: Fri, 18 Apr 2025 10:13:21 +0330
From: Ali Nasrolahi <a.nasrolahi01@gmail.com>
To: Linux Newbies <linux-newbies.vger.kernel.org@zephyr>
Cc: Linux Kernel <linux-kernel@vger.kernel.org>
Subject: Documentation for Regmap API?
Message-ID: <l5l7jdkvrwkwo3dtfow55ot4jj4rp7z6nuz5ijlj52vgmqhwth@uvks72vz4lpd>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

Hi,

I've been exploring the Regmap API and
was wondering if there’s a dedicated documentation page
that provides an overview or explanation of the API itself.

So far, I’ve looked into the following:

1. https://docs.kernel.org/driver-api/index.html
2. The Documentation/ directory in both the mainline and linux-next trees.
3. The regmap tree mentioned in the MAINTAINERS file:
---
   REGISTER MAP ABSTRACTION
   M:  Mark Brown <broonie@kernel.org>
   L:  linux-kernel@vger.kernel.org
   S:  Supported
   T:  git git://git.kernel.org/pub/scm/linux/kernel/git/broonie/regmap.git
   F:  Documentation/devicetree/bindings/regmap/
   F:  drivers/base/regmap/
   F:  include/linux/regmap.h
---

Despite checking these locations,
I couldn’t find a dedicated document explaining the Regmap API in detail.

1. Is there any such documentation available that I might have missed?

2. If not, I’d be happy to contribute and help write one.
Should I bring this up on the linux-doc mailing list for further guidance on how to proceed?

Any pointers or suggestions would be greatly appreciated.

Thanks a lot,
Ali



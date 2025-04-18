Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2C0C78C0E;
	Fri, 18 Apr 2025 07:03:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744959816; cv=none; b=fdOdRiLbT/2hmK7qNMKBRzrGamX9n6vw0tIO9A8m3OBbNuKN/u2zfRMSlsHs0TcCtxkm4sq1k+gQk8Kwk6vroax2deWVZob2JyYf1kecFWuBTOeSpMmtKHYwwpQMRJqc3XA1WDv79Wb6Pclhw7coclHRMIKV5H5Fj6fC3ebyuNE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744959816; c=relaxed/simple;
	bh=l12G9/KABGBWRLrSnjVdfQ0Z2bSs/KbpUquxhRC9aSo=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=YmRWwnCv9wi9wcvYAx+G8iaHwKrEZNWdNox2GA73Xs146DgeJ/qSUsGihcZTnO7tjXavV4Y0GmE7J69kP/zhaSMunyulnEynfgWgvwl8nYjyzKAefle5FF5DRK/aOOd5zcO4N4OqA/hj4LD3jpYoDrXD++M35/LoR4Sx+WSB+NE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=YD0BJ4bu; arc=none smtp.client-ip=209.85.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="YD0BJ4bu"
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-43edecbfb46so11346225e9.0;
        Fri, 18 Apr 2025 00:03:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744959813; x=1745564613; darn=vger.kernel.org;
        h=content-transfer-encoding:content-disposition:mime-version
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0eX8qj76kO14FK/DjeL3E1y5jYurP6zJ1Vl1XJVXa+E=;
        b=YD0BJ4buvmrY6b4aFCT3rIylIEkfiOFYlSe+hg/ahVIqeTakGOSV8CsFkXGqr+0Y8n
         ij+/oLlNo9TleQZg50i6q5La3KAvq1SiNi/DHyVccEs/OXTX5NnocbG95JzdF5JVjQ8U
         yczfafe+K6KwfNQPs6UYeMaulrH8gfCeiSatqvqcpM6FZi7u1+8GKbgGT2un9+Dcr+QZ
         OtiQlQd7Plqc7qOkSC4a4CQEnBUW/VvkuwmENIZqyq7WjHrfk3hF/n9X5EoDKoinvbrX
         X/4zD8HzVW5HgrS62SaJhp8WnW4LtCV4sTq2vwg34vjTYnaqGBAB22/HNF+cSwEtNtYj
         SY4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744959813; x=1745564613;
        h=content-transfer-encoding:content-disposition:mime-version
         :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=0eX8qj76kO14FK/DjeL3E1y5jYurP6zJ1Vl1XJVXa+E=;
        b=mm8Q9jZPVAKGUh8gc/CCtYocwgTgFOdI3FlMJsjGXhEX25mTba1vs+tNfnZHqjimC5
         BHl8TLVshLU080YohEr9nxKZAfip0AEo9kaz4XdB/swUlJN+klpsSJMeJF8ea3M2uoNS
         FRporOPURdU/xG+90CgEyTK4lAy6ngFJjnD2CzAEmAFYGmvgdAzBpXNWTYp1eAa293T2
         7Xt6UzqAmd/CpD3Sw5ir9THeXz8/2mJ1i0CALfDR3fIyUx+Oq72qYR2KY9jEhata00uI
         a7v6lzrs0RTY8u/b+r8B+quNi+7GXKNFKA9mit1g+wNHX2N7r6MsLB1XnlQ0t/ciRRwD
         scRw==
X-Gm-Message-State: AOJu0YwIBFeokRSvrATJRyQetQLgueTFOWhMk1ZrpEaJhHx++XEa1rmI
	Or5+WTATbG3jrU9n6elxLG9mmxVIm63duLFwOXsw/hwHqk/+RNvlgpA7lJZVpJw=
X-Gm-Gg: ASbGncsVppdghRv9Mh275ZaMt1mg1yV5Ut16tdREfYuWY8soiyIhPY9vvm5xFe2HOeX
	gmrGabIwX5SrS0KRCzsTEEGf+Pacgm6vz3G1D+7Dix+sMr0ApcISv8CKEvywH+xHhmweWhTYHL4
	tx7T3ak/KOS+TnwAmjwKn5Y3O+AT/BWes+nlHJkwwa1uY3uTDkagpbEJ50GG1RKPwtnfWLxJZ40
	p935zGe36e4uR5fMTp6jZC9HYPjmqyZGPduQyPErI4a03d0fsiL2vf1//kV1hKF9mXcVZ6J1Vb7
	XmJXv4oO81Prfm2YmrZtdyvrh3DOpunDu0DMrw34ApKEMISjFqtITA==
X-Google-Smtp-Source: AGHT+IHynW9B2jkcOutJVCRiB33ny1490S+sMTbDI5VQAcQ69Abvk0L/7TqMmkv+GLtqEVSaxgs0lQ==
X-Received: by 2002:a05:6000:4285:b0:390:fbcf:56be with SMTP id ffacd0b85a97d-39efb94a9cfmr1107828f8f.0.1744959812730;
        Fri, 18 Apr 2025 00:03:32 -0700 (PDT)
Received: from localhost ([77.237.184.200])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-39efa4a4c0fsm1832613f8f.88.2025.04.18.00.03.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Apr 2025 00:03:32 -0700 (PDT)
Date: Fri, 18 Apr 2025 10:33:19 +0330
From: Ali Nasrolahi <a.nasrolahi01@gmail.com>
To: Linux Newbies <linux-newbie@vger.kernel.org>
Cc: Linux Kernel <linux-kernel@vger.kernel.org>
Subject: Documentation for Regmap API?
Message-ID: <4cxpefqeaprynrfpefjdmq6gqxmt3fcpe6rxf4uirtlai6fgn7@ehefex3cebfy>
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

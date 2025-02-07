Received: from mail-qk1-f178.google.com (mail-qk1-f178.google.com [209.85.222.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 443D5238D27
	for <linux-kernel@vger.kernel.org>; Fri,  7 Feb 2025 14:53:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738939985; cv=none; b=NEfzZZ/pmQxTZO5P5n2FUKxW9ubdhgIK+jMrHT8hpjWLkQeCisLA91bt88DpOFh6jKeYMVkvSesU/WxyYz/bURmJBCddrZmJB5Xu5Crg+myeiWh5b5iRt62khciQ6gW3g2NjKteJeJGEVMUT0/3/kH0WkxZQKCXHBaOEmR4tMeI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738939985; c=relaxed/simple;
	bh=DV9o9goETRTTHamg5bDzp8IkrA888vE6pS41VeSZ7p4=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=NOygiKWKcR0V0HBp/WSv5jye/Efj/99hCGr3BO8SRM+dx2w/6GXLiXrFFNt4f9ZHSimFh7RQ7/usV0Qshp5n7Ix5K+Y3LhyJJpNmxX7DZKhl+I5Lw7UgtLiA1Xk7M740y+/gVloBj+7fux5wdJ4GBQ+lBA7nWyA5yg+LG8qwqrk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=R3RSKH1h; arc=none smtp.client-ip=209.85.222.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="R3RSKH1h"
Received: by mail-qk1-f178.google.com with SMTP id af79cd13be357-7b702c3c021so206230285a.3
        for <linux-kernel@vger.kernel.org>; Fri, 07 Feb 2025 06:53:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1738939983; x=1739544783; darn=vger.kernel.org;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=DV9o9goETRTTHamg5bDzp8IkrA888vE6pS41VeSZ7p4=;
        b=R3RSKH1hVTJvQCfZ+k0Z7nyp+3e28Dbk7UAVn5wTzVweGLW4R7XjxEv99GuKZG2fa1
         SeUZijR2YbAUbbqEU4wYGZOFwMZrHNdgvAhHohPAW4zmvjGyIPapK6YSe5abgUlHKV/y
         xIE7cvij/PO0xJ/A0O48Yu1hRWYHyKee9uTnrIQLxdEjghiyjhA/MdKOQZDKwpOs9MeE
         DVvErtMbIg6qVTNU6GTNt972TZwzX0XxlpsGnTZyk3d8EiBai/ir/60KXG4/R5Ku6KW+
         iLOOuiUKRATAnuMxZc5wD5hlGD/NLhIlzl918WycIdbm/Q4ZWcc82D1L8bccm+BFZv1f
         MgpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738939983; x=1739544783;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=DV9o9goETRTTHamg5bDzp8IkrA888vE6pS41VeSZ7p4=;
        b=l7J/PgHGeQurU8S/PIL7BK0TTFle+9MsUYMkW4vC7IAUFG8ArRfw4xIUXWGcTbAxks
         GIyYp8PIzpKkIZrbW1H8Wd+GuCYJtPYlVUtZ0B0rA5QOhP/YSwR5v+j7Z16Rx/k4SiX3
         uI/1FYjRcxCozos30sn97CIR/yt0RyM1z/uAApvcSOvqhpwWm8kf4kDRJN6mL4W6DIcr
         js0dYf0Y8W2CZRMES61ivqR8VCOe83x/ptwTMTqY5sS29stlmox/LSsB1rbcJS7JNV5+
         K+Y8mXl/Zr1iRvDD+N0aPu+Rph+oVOhbZPLa6E+0681TK/BDeQ4nqcIKzECx3voJ0l5L
         5/fg==
X-Forwarded-Encrypted: i=1; AJvYcCUjyNhXj7m7d0M4qMUyQvP6JACpPFtOspKS7K7IAImLaub0yf1hmsZXVapOHUm4K9OE9xXR9nVSMhI8lk8=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx2WB+aRS4MJwAMcRcHvpnqpdzf4nqs2NQ8aFHb+LwkmSI6mU+K
	u0iqDSD6WafpapDN3oAf53DJibJBV08aCqKOlOkd87B1ZWC3KBCNMBPPKQ==
X-Gm-Gg: ASbGncuIYTripqo+bUXMfwqtkYf4m+TlvPSXyAQMCEA+ICKoa7+pkEiUWJr3Q/Y3lsx
	GzUAR20ZsLPkMvCdgOPPgfynr51I0D2z3XXKY5gl9H6l4/2gtomaqLiF1rKgEZETJBMMFQ6CLnJ
	Sk4nDgKMyLDsLny/LYKuD36muR+vaLbZZLr/EaxFqEjDfbk0NCJinHe58Z6amcp4ACop0CXge7/
	wxO8b80Gdlqsh2EDmvcHe3gDY6TLfA/QDcRV/CfVLbLDMV/3bv4xCAf3Oa5qNQC82IB7BfOBnHJ
	rfcFaF8Xtr7893HCGSj9y/MTWhPhUGsCvi6bZVZKsg==
X-Google-Smtp-Source: AGHT+IGoiiCJ3n/pbgmmOrQnPSxeXqaVOfcRLZYGAumxhDORSDYhkaBsRprw5XL5yC1F996n1NUUEQ==
X-Received: by 2002:a05:620a:4316:b0:7b6:d6e5:ac6e with SMTP id af79cd13be357-7c047c1f5f8mr445244085a.4.1738939983070;
        Fri, 07 Feb 2025 06:53:03 -0800 (PST)
Received: from VM-Arch (ool-1826d901.dyn.optonline.net. [24.38.217.1])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7c041dfb0f7sm197994185a.27.2025.02.07.06.53.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 07 Feb 2025 06:53:02 -0800 (PST)
Date: Fri, 7 Feb 2025 09:53:00 -0500
From: Alex Lanzano <lanzano.alex@gmail.com>
To: airlied@gmail.com, simona@ffwll.ch, tzimmermann@suse.de, 
	noralf@tronnes.org, dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Cc: lanzano.alex@gmail.com
Subject: Maintaining Repaper and MI0283QT
Message-ID: <mubhrsqwsixflh5iagrtwsbup7nrnxkhwhn3nmqvmfhibwxauo@g3jvqxpo2fb7>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

I saw that Noralf has to unfortunately step down from maintaining the
repaper and mi0283qt drivers. I would be more than happy to maintain
these two if need be. The repaper device is very similar to the
sharp-memory display I currently maintain and I've worked with mi0283qt
displays before.

best regards,
Alex

Received: from mail-lf1-f54.google.com (mail-lf1-f54.google.com [209.85.167.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9AD5F1EA7D6;
	Mon, 21 Apr 2025 05:37:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745213843; cv=none; b=mOP7YybCGQyImf1UsjS3N/WC8CgKgACqDFieUTy9tqoNRRFxNyY6CWnee9XZ40u3o1xpMgybCDowmwD+8v1CgevcSns6V687J39unAc6C43DlCtDZXPBWIEWJ3Mkfl0Ar6WAv88EFlr4KBU5ZGW+ianR3Gc9/wnUm9Rno201YCY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745213843; c=relaxed/simple;
	bh=2Jzy9ZC6JBUJqedz2CiWnh2u85n2GsNVxwhydMt3RGw=;
	h=Mime-Version:Content-Type:Date:Message-Id:To:Cc:Subject:From:
	 References:In-Reply-To; b=OvnMhONMTNwObcHQy1NN+g0Rh7b/sIkc1AhUnPIfeZXTgeE4rBaAbVq0+S7QHnHSp3TX8Sa8BvzH9+Y1Q3TnSlOYUi4N3SZWzEFkSPn+WjUYoauPK98dEhsQbpK36B5XXObKkzhnxsoF3gwq8Un7lJTgCPvHVrTj2OaxtmI0Fig=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Gr+SpRcU; arc=none smtp.client-ip=209.85.167.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Gr+SpRcU"
Received: by mail-lf1-f54.google.com with SMTP id 2adb3069b0e04-549b159c84cso4332861e87.3;
        Sun, 20 Apr 2025 22:37:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1745213840; x=1745818640; darn=vger.kernel.org;
        h=in-reply-to:references:user-agent:from:subject:cc:to:message-id
         :date:content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2Jzy9ZC6JBUJqedz2CiWnh2u85n2GsNVxwhydMt3RGw=;
        b=Gr+SpRcUlUzXdMF8qVWbYL+2zQoob/7H9b3EMD3vXl5I+wFXkrhKYERluAsoywrRYv
         ve4cHExd1LG9hcgOGBlnSHjPPjQNxbwR/LMakpATOls741cK5NQWKV9J8+HXHnIgKQFK
         9ELdaY173xRNkqJ3oBiCoQ06qNEt1ulW5mAzQPi6itWOfrrUJjPdHxOtVfqF08e/VQwi
         RvSJaLBXDKc4x6YhCSqcGAGQlBaPIbA/df+Q+YQVKkb2fuxKMevBHqenpxAOFSwyitEd
         c59drbnpSz+lsLx6LTdm6cLJEnogtNV3IQgpBCkWBw1z4y5wrOLjx5+jiixzC+gOz+mq
         zNOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745213840; x=1745818640;
        h=in-reply-to:references:user-agent:from:subject:cc:to:message-id
         :date:content-transfer-encoding:mime-version:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=2Jzy9ZC6JBUJqedz2CiWnh2u85n2GsNVxwhydMt3RGw=;
        b=Vt4wY1/kTyuHsC7wPzXkxgdLKeGmG+lIzLIaJ7ehWZqyWhD9x1EgmBha7GDpaDeZQX
         fQkFqBkKJvdlyFECDKSnKV1ypXAEhbC5dFLcOcAao0DcuUuDEaGDwNzjFALcBF86WuTN
         8d0y6w5nQEB/QYJe3pfQes7+ngrsEuFQ2PqDfwuYO5025+KF+MqbXFZ7DFbZnAxcDjQ+
         rcWTAKW0Wq7s9UOGzG6rhsWVTf+I5Km4HByDaVideKriPPPZTbREt32Fka7+//7ZhlhT
         9Gl17LqVI/8zvjJKzRT+Pvyil7zs1ZSCL72aKmC3RoxH5sFqaRMTS1d171giU3zQ7y7S
         BKPw==
X-Forwarded-Encrypted: i=1; AJvYcCUKbvpVDgwvYOy7mFanLOszIlp6Tb0SmU1OyCvy+SNBCBl5wPhxZemjEWllxmPvy19JbQBXjKXcljS+moJO@vger.kernel.org, AJvYcCVW8ReL4E1bzt97sAlSxvOmNbm53Sev0JqcWKm4UhYq3nkz6OBjGchPXu02RTWIKn4qUcrhD/gMMQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YxLo8zFW2v2VrnbkYcRHg3ZOKcWr9F/XkrZlMt6vFaJT1TLvXIX
	Cf/utdCakLY4H8RSJ/iGx+X/bjDPWcB+rDj+6fMCthkb42S/ZdUV
X-Gm-Gg: ASbGnctQfZLvPWk4zuQKsuTCjKO0btgcitAr1sJ3/mkbNcAX5rFduajpOMwMZyrZEBK
	gOSlvCldCsnNvB6miuBFc5PMHrjZwLQx/XmhawUn4Y58Sx1uMjQXrH5bPhelzM0d9KVaZKH6O2N
	g+R7+9q6PF005ztYLRz8emjBnRPg0UMOU3mKuWWo7jsneOmm62QewiiaqnbD2J4mwL1sQ/MCLrD
	OsrnIbKq/lGAwv4njh6S41pFoSGd+ic30xW1WkR0/ivtv+u5pYuHf+VHbc1kaktLMcrXjrzEmmM
	IsDSNXw/xa3GzX073w3fcKvY8bH5qFRAFJ0=
X-Google-Smtp-Source: AGHT+IEX5ltlPfLCluDI8+idUv9xGtQd7mdwsOJMFE8fBqKtIfiU3iJrIQi2lCu8IGFrW5vsWloWzQ==
X-Received: by 2002:a05:6512:2346:b0:545:e19:ba1c with SMTP id 2adb3069b0e04-54d6e62cb0amr2400614e87.19.1745213839491;
        Sun, 20 Apr 2025 22:37:19 -0700 (PDT)
Received: from localhost ([185.53.22.18])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-54d6e540849sm831853e87.53.2025.04.20.22.37.18
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 20 Apr 2025 22:37:19 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 21 Apr 2025 08:37:18 +0300
Message-Id: <D9C2O9CUCJT8.334ZUG6YS2XA@gmail.com>
To: "Cristian Marussi" <cristian.marussi@arm.com>
Cc: "Sudeep Holla" <sudeep.holla@arm.com>, <arm-scmi@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
 "Philipp Zabel" <p.zabel@pengutronix.de>, "Peng Fan" <peng.fan@nxp.com>
Subject: Re: [PATCH] firmware: arm_scmi: add timeout in
 do_xfer_with_response()
From: "Matthew Bystrin" <dev.mbstr@gmail.com>
User-Agent: aerc/0.18.2
References: <20250402104254.149998-1-dev.mbstr@gmail.com>
 <20250402-hidden-unyielding-carp-7ee32d@sudeepholla>
 <Z-1gY8mQLznSg5Na@pluto> <D8X9JJGPGDNL.1OTKIJODRFKNN@gmail.com>
 <20250409-fierce-astonishing-bug-dd2adb@sudeepholla>
 <D94LGXDHGVBD.1GB1GHOWORHMU@gmail.com> <Z_zJbRH7vQ0TswGg@pluto>
In-Reply-To: <Z_zJbRH7vQ0TswGg@pluto>

Cristian, Sudeep,

thanks for taking your time!

I'll figure something out :)

--=20
Best regards,
Matthew

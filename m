Received: from mail-lf1-f46.google.com (mail-lf1-f46.google.com [209.85.167.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D199253343;
	Tue,  8 Apr 2025 20:22:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744143763; cv=none; b=VBLoZOBvly3lpyPUjsY2RtcZvb2m5X1bJRGxouXsk3eMCwVoo48AZlOSJT6QCAzm2C0GjQcPOBBPHGU29+R2QB7WKcAtn382vwql3cG3t5zullmD/sDwTHgLzKMBHp8bd+uQFYl5WiDpGgRIxTCghM1ON2LJRoxY5ztWL9sSifs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744143763; c=relaxed/simple;
	bh=/2PhItbELP7eMh95bPxosKKzR83AiznaQ3sfxM2Oy2U=;
	h=Mime-Version:Content-Type:Date:Message-Id:Cc:Subject:From:To:
	 References:In-Reply-To; b=CmDQ3b74lB0/uE4EbsPX44E/CWQcYeFegzim6fAgt15pEMLdSy57JM2aNhDi6Y5D6lO03/9I9BzHwTnZ49SWQOWssEGbuiMADRypYCr4XAZeFUtMutop9Qck9r7HXjLHPw9ngBwCBTGHYfwyTXlxINCbWEjSYAm4iSJpK25hWCU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=MQ+A61jb; arc=none smtp.client-ip=209.85.167.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="MQ+A61jb"
Received: by mail-lf1-f46.google.com with SMTP id 2adb3069b0e04-54993c68ba0so6837766e87.2;
        Tue, 08 Apr 2025 13:22:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744143759; x=1744748559; darn=vger.kernel.org;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/2PhItbELP7eMh95bPxosKKzR83AiznaQ3sfxM2Oy2U=;
        b=MQ+A61jbz/ju6NDWfrKJ1ZSUIYEoO4YaNbNUsbWIl1cXZ8e3MbI/1YNZ6R9KLkXY08
         TDaskfx8AcCUcebWghVyV4/3Q5+ZodCU7fJMceaCZy2hKFQTx1vwOfbGnVprGaN2+dLT
         tlF0LyQQMLrNavCooegOyZXyimMtT+z38lRUI3wiZuIodXO4mV5OMjbMif1hjzlnc04/
         5Z+hxCUk5zEQaSCM5/4VmIq2N+jnhR14+diN88zlE2+Y1pHX/laURzej+QAYyC2ZIzVa
         eQtL+Kxh55gjrakZ+WaeNUjXn3Y6JCN1+SByeG7kIXWKGtcusqBRVb/AqQE5B6Hg1BAi
         E2pA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744143759; x=1744748559;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=/2PhItbELP7eMh95bPxosKKzR83AiznaQ3sfxM2Oy2U=;
        b=Dgnq0N1Yue2njLUZDmes8rcJQB+DqdRYHnDCnm2Gcpz4/6s0sp/SR8uqfC7JgW5Je2
         oXCMMepVTfEJXqXd2JcuOWRazgKh/3EdvQPGuEajmYPrByjCCj0Pap2CR7U1e+IPRRy1
         KhVBFB1CKi2YjmURLizj9TcFpq08GS70u7GZs/8mTMH0+B0JXo45xAL45Y4srh2q26Dg
         Gdy9e+sEWnMLEn4pX+OCm/aj7HONxzQv9pWzbkydLS0h4UCnMmr//emkYBWLn7AISfMM
         0dn042E6fCH26qGo6zFp91qKKaf87v7rVPAz4B6yurWxakKULTy2krSL63um5DUusXoo
         DjQg==
X-Forwarded-Encrypted: i=1; AJvYcCUApHfFgF/EeBwR7sYnTc3z9j0cEcqaCimjQObTKEePSfd9ohBnbEVpcwWDoo3F2t5Mx8TC2Bb5qozrI7Q=@vger.kernel.org
X-Gm-Message-State: AOJu0YwljY5USoqUNW48ewQHdUIhLGeoZBuu0GH36fCoLZS3VWkVDiU9
	BUC8AC7P4/s9C/YoIz+q0hzB84pnnFvmv4p00DjtdZavm1vdV3SN
X-Gm-Gg: ASbGncvhnPvAVTwmJ2tDIHjq22HukheB4aIhwdMqZ0DeG8LBgDx7A0Pe9nK1K649niD
	N7i0eLxA/zd2SZoIlXcqrZY1V6aKslJPNuIoz9dBfp87Vg4ZNl005WAyp+JziqogKWEPU3flHNN
	m1Ve9iFCU11d6q9gYq/PIzpNsuZXXbiSxy0c2AFTGbtgirn7082RXQqOtpunulHNyZGF9RZ6RAL
	SDf8PViXEjMdBA5/QCZoT9EvQjcbP9+n27t+n0+CFDv7XAewAZ5KW462vJaYnd1Ojp98OZY/ryU
	t+tGCjz1x22Z4fnOENZ1tRFFy4IKtpL1pk46WNhgb3ktmjLrsZn6Jui3hnHh3Kk64/w6Kp1I
X-Google-Smtp-Source: AGHT+IE+GtFsM+TEtdlTod1fEyMExFuepsJ5N5fnlnm4b5K91VEAvAY0T73f591ltRk0GgRe8mlXwg==
X-Received: by 2002:a05:6512:3e1f:b0:545:2e5d:f3f3 with SMTP id 2adb3069b0e04-54c437b9ac5mr98397e87.46.1744143759275;
        Tue, 08 Apr 2025 13:22:39 -0700 (PDT)
Received: from localhost (5cfcd77c.dynamic.mv.ru. [92.252.215.124])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-54c1e65ce3esm1596758e87.166.2025.04.08.13.22.38
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 08 Apr 2025 13:22:39 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 08 Apr 2025 23:22:38 +0300
Message-Id: <D91JD15NY3Y0.23E428W332D@gmail.com>
Cc: <arm-scmi@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
 <linux-arm-kernel@lists.infradead.org>, "Philipp Zabel"
 <p.zabel@pengutronix.de>, "Peng Fan" <peng.fan@nxp.com>
Subject: Re: [PATCH] firmware: arm_scmi: add timeout in
 do_xfer_with_response()
From: "Matthew Bystrin" <dev.mbstr@gmail.com>
To: "Cristian Marussi" <cristian.marussi@arm.com>, "Sudeep Holla"
 <sudeep.holla@arm.com>
X-Mailer: aerc 0.18.2
References: <20250402104254.149998-1-dev.mbstr@gmail.com>
 <20250402-hidden-unyielding-carp-7ee32d@sudeepholla>
 <Z-1gY8mQLznSg5Na@pluto> <D8X9JJGPGDNL.1OTKIJODRFKNN@gmail.com>
In-Reply-To: <D8X9JJGPGDNL.1OTKIJODRFKNN@gmail.com>

Sudeep, Cristian,

Gentle ping.

Best regards,
Matthew

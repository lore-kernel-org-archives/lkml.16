Received: from mail-ej1-f50.google.com (mail-ej1-f50.google.com [209.85.218.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CCF3C262D27
	for <linux-kernel@vger.kernel.org>; Wed, 25 Jun 2025 11:55:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750852530; cv=none; b=nLvExIFxLzT/ADfLWThLqgjcZfdTQoViRZZOYu/CsF7jfB+WCUasPLPQ02iP3Zbtl1ox3nneCR79opaImPjVYYNAOkHkZrwNt7SN0VVSh+EJ3d3R1N+TwucInQ2hEcMHqcAWmz7NEW16G4XbqLYoQmAeF6YvF1qNPgSgJ8/dgAw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750852530; c=relaxed/simple;
	bh=Ele4kC/bFjkVABuTlMtPoVal/q9sn4Mx7Xjke1CK0u4=;
	h=Mime-Version:Content-Type:Date:Message-Id:Cc:Subject:From:To:
	 References:In-Reply-To; b=gUgcIe7SaHTJhzt+t7zUp+oPxT7R5WQAnvLblG+h3VknkA/1DX9Q2fNaO+zGD5yw4UPDugXll3euvcvchShwqizUsgWroqMnFybt9zDG16YBHLGin2PpoRUdaWHwqpZ2qUwL8lbApO+VUVNryIUjKp59CtuN7LSAPubjZLqZcdk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=fairphone.com; spf=pass smtp.mailfrom=fairphone.com; dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b=qs5YSOO0; arc=none smtp.client-ip=209.85.218.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=fairphone.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fairphone.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b="qs5YSOO0"
Received: by mail-ej1-f50.google.com with SMTP id a640c23a62f3a-ad89c32a7b5so270812866b.2
        for <linux-kernel@vger.kernel.org>; Wed, 25 Jun 2025 04:55:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1750852526; x=1751457326; darn=vger.kernel.org;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Ele4kC/bFjkVABuTlMtPoVal/q9sn4Mx7Xjke1CK0u4=;
        b=qs5YSOO0LLGQ3vi6rgHcweeS/ep1QgOkxBFP9k0ma2vtkXALRY3UA/PIvNQtFlCrgA
         +s597SFYgiVvq1zi+seQXmRMiQO/JC+kKqEKG5wONMcnjRl3w9F6Ot6VqXM6x/DDuFl/
         5N8IETSyMMYnbOSnO1rkJTyc2c/5W4dYFJx/6uu+ceGGpeHa66CgYZ/19MZnGegDcs6y
         Rr6ijT6wXL4nzef8MaP0nEGRBsG0dINE5pQRZ8Exz4pnfgNKAY4isZbTtXAfeMPm3KXD
         P3ESbmKN04yIlKkbzpmFSNyGEWv+l36Z6YQaYn/EP9iZlmB+2wjs0XFhEmB8o95IvsPI
         6PAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750852526; x=1751457326;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=Ele4kC/bFjkVABuTlMtPoVal/q9sn4Mx7Xjke1CK0u4=;
        b=OwcLMST7bsfkYJVWj/4SRRRvkFwXHR3a6DC1qpJjLIR10ccVUKWCWUY5L0uScmYkY8
         BT5z+Pzc2W2Q39ElweDNBH+tYZs8IZBrZMqn4kb2dnL7wx1jAtfGv8aT8zOLPnAJgz+X
         9UOiIS8aKn4vJK7EOS2c4CCVT0piJ80mUyw0EXtqJHHMOQNya7ufB60tRKGnBfNAvgQG
         AzMYwW2fn8VPHqrWo5jgdE4y6Ft4loJ0nGBgWYaoCRuQXi3zGPNQ5K+k2NothHkvV8XI
         1Fkpo7HPspGDURwm50FM1+zsPaCi3rg3zX0ZagjMNXQlxE4t8YeZqLpCJ6ZrsC6cr3Lg
         EBYQ==
X-Forwarded-Encrypted: i=1; AJvYcCWUhWJmJR37Yj/77J331qYdkyY+opZPxB/vqRQ7hOqM3jGJlrUN4HNQH0BRIzZelCPGB+O/tlxdvFvyERI=@vger.kernel.org
X-Gm-Message-State: AOJu0Yyc7VWMvgUFTmxhw5ZufnlHxIbJ6px2rOqZuvMFQUNhrVKbokAU
	DbS0Jz3nd1C5tsYVRQ4qCmQd15c75+DxBKzTMbyRYdkUqvci4+PYKf6RdvLm3FFzzKs=
X-Gm-Gg: ASbGncuFsqmLFeH/+7NgwHIyRH7PRCRoYXY+d+y2IGCt/uVN2liHl137t4+WI2Dw6I0
	E9SH352hA27AJ239lytGPWgd5BuArTNdqZQi2Obsp0jpdujMQP3quxGkHyzVBG/UBN4UZoyEOuO
	jvotbgH+mEGMcfWwB6vgzo3U5RH7oxtLgGopunMnV+8TM6lKJxNhfhSiZcE+bMbgSb4UVuuIjG+
	wgtWwGGDkoJ4HGiuLLES3YB3goXDphNaFhuihPDymQoLN87XfaCYqzUmP3zbJhhgPHbcWwXy2qt
	asxkjgfpNXKbFkNJZgsMjzoaRKS0BntVswhvldd9+MG/kvz5yWmUqNdXdIpii/Ao4qr7D1V0qhk
	RqjVZBnR72bCjvsbduBKPrsmabUYcnx8=
X-Google-Smtp-Source: AGHT+IGHwtU2WcLOLeMlMlhviB+W5ro/PgSmY8OoYgsUjPuqlDw7Eu44hCDzY1aMqXqaPDEZvGOrnQ==
X-Received: by 2002:a17:906:d92:b0:adb:4917:3c10 with SMTP id a640c23a62f3a-ae0befc3ac1mr209592966b.60.1750852525989;
        Wed, 25 Jun 2025 04:55:25 -0700 (PDT)
Received: from localhost (144-178-202-138.static.ef-service.nl. [144.178.202.138])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ae0cb358618sm29256266b.102.2025.06.25.04.55.24
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 25 Jun 2025 04:55:25 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 25 Jun 2025 13:55:24 +0200
Message-Id: <DAVLF5WB0IZU.3EZCARZSQO050@fairphone.com>
Cc: <~postmarketos/upstreaming@lists.sr.ht>, <phone-devel@vger.kernel.org>,
 <linux-arm-msm@vger.kernel.org>, <linux-usb@vger.kernel.org>,
 <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
 <linux-phy@lists.infradead.org>
Subject: Re: [PATCH 3/4] phy: qcom: phy-qcom-snps-eusb2: Add missing write
 from init sequence
From: "Luca Weiss" <luca.weiss@fairphone.com>
To: "Konrad Dybcio" <konrad.dybcio@oss.qualcomm.com>, "Greg Kroah-Hartman"
 <gregkh@linuxfoundation.org>, "Rob Herring" <robh@kernel.org>, "Krzysztof
 Kozlowski" <krzk+dt@kernel.org>, "Conor Dooley" <conor+dt@kernel.org>,
 "Wesley Cheng" <quic_wcheng@quicinc.com>, "Vinod Koul" <vkoul@kernel.org>,
 "Kishon Vijay Abraham I" <kishon@kernel.org>, "Abel Vesa"
 <abel.vesa@linaro.org>
X-Mailer: aerc 0.20.1-0-g2ecb8770224a-dirty
References: <20250625-sm7635-eusb-phy-v1-0-94d76e0667c1@fairphone.com>
 <20250625-sm7635-eusb-phy-v1-3-94d76e0667c1@fairphone.com>
 <4d215791-35da-4139-9cc8-33da5d46469e@oss.qualcomm.com>
In-Reply-To: <4d215791-35da-4139-9cc8-33da5d46469e@oss.qualcomm.com>

On Wed Jun 25, 2025 at 1:51 PM CEST, Konrad Dybcio wrote:
> On 6/25/25 11:14 AM, Luca Weiss wrote:
>> As per a commit from Qualcomm's downstream 6.1 kernel[0], the init
>> sequence is missing writing 0x00 to USB_PHY_CFG0 at the end, as per the
>> 'latest' HPG revision (as of November 2023).
>>=20
>> [0] https://git.codelinaro.org/clo/la/kernel/qcom/-/commit/b77774a89e3fd=
a3246e09dd39e16e2ab43cd1329
>>=20
>> Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
>> ---
>
> Both the original and your commit messages are slightly misleading, the
> HPG (and the code which is indeed in sync with it after the change is
> made) only sets the value of 0 to BIT(1), a.k.a. CMN_CTRL_OVERRIDE_EN.
> You most definitely don't want to set the entire register to 0.

After reading your message twice I think I've got it.

Code is correct, but commit message is wrong (it's saying writing 0x00
but it's not actually doing this in the code, just setting the bit to 0).

>
> With that fixed:
>
> Fixes: 80090810f5d3 ("phy: qcom: Add QCOM SNPS eUSB2 driver")
> Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Thanks for taking a look!

Regards
Luca

>
> Konrad


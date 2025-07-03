Received: from mail-lf1-f44.google.com (mail-lf1-f44.google.com [209.85.167.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DDCAB2E5421;
	Thu,  3 Jul 2025 12:44:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751546694; cv=none; b=fchR5ev5D4h0FES7FxmLR5fqK96hGtEuKo8PZAwuCU0zm/gq6LQUINelI9i6mkQc6rA4iraTjeeR6gO0DbG68jrnGYaUzSaTWz86GJCUm1XG3lKW+oQyw4gGyq9X8v01+0IHR57I89CitHkRItBR4A9pdVOMU9P6WZBvIGrmjXk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751546694; c=relaxed/simple;
	bh=mbkYheEIyHbW1ygRTFZDti3d9YOTCkbmsZ2ULP3qOWM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=EtsiY0Cx33ylrl0l903WzCV4C85d2f0UXj0L7MArTFknliOaB5SSPD3dS1MtN1hbiv0Po9LQ38l6NMTdRBgDaB/uQC2+2V746PRuesIyo7G0Xg9UtC0wUPDrx7cfbrxUIjSpnAY3Of+sF+K17cO0WfrIaUuJzkChu6OhzAMA6w8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=JBU2iV8S; arc=none smtp.client-ip=209.85.167.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="JBU2iV8S"
Received: by mail-lf1-f44.google.com with SMTP id 2adb3069b0e04-5561ab55c4dso4760830e87.2;
        Thu, 03 Jul 2025 05:44:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1751546691; x=1752151491; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gDlYEkubd96z9MwJzBRtpwFB7aA0Q1bDJcX399/Kjr8=;
        b=JBU2iV8S672PL+O/0T2LgedBc6jsOYvnNWoybFXRlPiF+4ntpBKS/alek6uevuh19m
         1fTEvwTF1nukkgFM5HauSOwP//CumFnB3TSwKpjRBSaEii5zJJstAWO/wBWV2YSakbeM
         446b33YlJto202WEaACFq7H8TGNuYmbcNvPtp/FYBPc/jQ5VcCXKuPjA6yq21mYilG9j
         cjQ0owKmWrtypfEYqnvtEwfJw4i75GGObjwo046yJbLarq2t5iTXDWH2a5MLTN0d97Fp
         +5ro3L/JPQHiaQWFI7LPf5KqwjtsbWSJ0i/pyl0V+MXVeUJBtynD5udvw5bC7eizUYiN
         f9Dg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751546691; x=1752151491;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=gDlYEkubd96z9MwJzBRtpwFB7aA0Q1bDJcX399/Kjr8=;
        b=K9tWD/JWNj8YBiTOCKPutmY5MZMwpFMl66dD4x8e2OC+FiNCUhuqKFjB7OToKsQQIs
         iel/eq0tVHQrw+TNXlcqJAWtRVdLwiHxMzdHW9LHUPRzaLb1+I3yqxDdQ5blkxyTYmFI
         wTtz+hQLOMLYPg4V87Cvge4fwX3GYQR4qlmp4jFSfXejkigAHVqmjhL76ifmKO/Wzy0y
         9leIpxizL/6UP5k4a5eJs31wRl7BFpswQUNL3cLkcI/Lag2nDCeQ6S/D4tKn93AVTy/G
         5UhoqwiT++JLNPLJ74TlvR/vSAIyRxtIAqzZR6mjFQc6fYgMK/xZjemPlXDuZoKzdPmX
         Oscg==
X-Forwarded-Encrypted: i=1; AJvYcCUGEzrmchSQsUUObx6SDtTzGNI31V/9tAHtOJb6GWK05bmIbCwq5fDsoRzZ9BFOpwvppEnqJGMDh+5r@vger.kernel.org, AJvYcCVNypgVKTm/gTFCUkADU6njYGJDTdAzfP8S7SjJ6OOY1HUJqygeVFvuk/IcaUqLEvD1uXgttA0XnFWw5ThX@vger.kernel.org
X-Gm-Message-State: AOJu0YzcqEwMNmnJ4pFfkmw5xOXTcW7zlC0MNlXdb65OOYEN1HxJJoYa
	z9T/UxMO11gHI3JFj7caMWkxDmn/u3guk1OZFsYUZKOJpAP02mNGx+HXiw3rB5qSO4zyWyRgUYC
	MFGbURwX5tZrXcV6V+SlSvnkU/0V87LE=
X-Gm-Gg: ASbGncvLieyk7RpgrRqz3By9jLHHnHeMFqRsJXwtKO/v932Hbyz+d72GAvCKNMOPgKs
	mbNk1cNil9zocRp1Tzm3IQdXfc8tGL9AzdXNZ58Q/0b+jC3QDsw/LVu1Gk1K+y9vAAON1Oi0FCx
	5kP26/gJXImvagSNVNJvNY504yXgn4246Q0w1HlAyaS7V6gjKcCvOUDhJWhzysubgc8LlAkYVNs
	k4=
X-Google-Smtp-Source: AGHT+IFKVEiV+VQbUtpCqC9WckskybLMn53BW4tS3ehL1ZkM1xl1Mfgo8fk6N8Koy0lM0uprCJl6fTzRVH+Gd2z/05I=
X-Received: by 2002:a05:6512:39c7:b0:553:2cfe:9f1f with SMTP id
 2adb3069b0e04-5562ee21536mr1060794e87.6.1751546690574; Thu, 03 Jul 2025
 05:44:50 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250620213447.56392-1-aford173@gmail.com>
In-Reply-To: <20250620213447.56392-1-aford173@gmail.com>
From: Fabio Estevam <festevam@gmail.com>
Date: Thu, 3 Jul 2025 09:44:36 -0300
X-Gm-Features: Ac12FXx8tubzpqCb7QAhaROTPHQN2B3IX372b8SYzWGNI2K_HNEsG1Iuj4faMGA
Message-ID: <CAOMZO5B-7LuYs34ACmMD7S3B0Sxihe8A+atdNi_3QfMP3VFYtg@mail.gmail.com>
Subject: Re: [PATCH 1/2] arm64: dts: imx8mm-beacon: Fix HS400 USDHC clock speed
To: Adam Ford <aford173@gmail.com>
Cc: linux-arm-kernel@lists.infradead.org, aford@beaconembedded.com, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
	Pengutronix Kernel Team <kernel@pengutronix.de>, devicetree@vger.kernel.org, imx@lists.linux.dev, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Jun 20, 2025 at 6:34=E2=80=AFPM Adam Ford <aford173@gmail.com> wrot=
e:
>
> The reference manual for the i.MX8MM states the clock rate in
> MMC mode is 1/2 of the input clock, therefore to properly run
> at HS400 rates, the input clock must be 400MHz to operate at
> 200MHz.  Currently the clock is set to 200MHz which is half the
> rate it should be, so the throughput is half of what it should be
> for HS400 operation.
>
> Fixes: 593816fa2f35 ("arm64: dts: imx: Add Beacon i.MX8m-Mini development=
 kit")
> Signed-off-by: Adam Ford <aford173@gmail.com>

Reviewed-by: Fabio Estevam <festevam@gmail.com>
